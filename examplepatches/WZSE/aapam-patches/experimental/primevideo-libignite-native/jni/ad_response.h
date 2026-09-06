// Prime Video getVideoAds ad-decision RESPONSE filter.
//
// This module is deliberately free of Android, JNI, and linker dependencies so
// the exact shipping logic can run in a host unit test against real captured
// payloads. hooks.cpp is a thin wrapper that adds logging and counters only.
//
// Wire format (verified on-device, decompressed plaintext, ~4.5KB, one buffer):
//   {"description":{"adDeliverySessionId":"..._PBP_EXPL_...","adMarkerId":"PRE_ROLL"},
//    "playlist":[{…ad…},{…ad…}],"measurement":{…}}
//
// Emptying the playlist interior with spaces keeps the buffer length identical
// and makes playlist.length === 0, so the app runs its own designed empty-break
// path instead of building ad periods.

#pragma once

#include <cstddef>

namespace pvfilter {

// Upper bound for buffers we are willing to scan. Matches the shipping gate.
inline constexpr size_t kMaxResponseLen = 262144;

// Lower bound below which a buffer cannot hold a complete ad-decision response.
inline constexpr size_t kMinResponseLen = 128;

// A copy of exactly a power-of-two size >= 4096 is a zlib/libcurl DECOMPRESSION
// CHUNK, not an assembled body. Editing those mid-decompression corrupts the
// gzip stream -> CURLE_BAD_CONTENT_ENCODING (61) -> "Something went wrong".
// Verified on-device 2026-07-24. Real JSON bodies are effectively never an
// exact power of two, so skipping these loses nothing but the corruption.
bool is_decompress_chunk(size_t n);

// Why a buffer was or was not treated as an ad-decision response. Reported by
// the host harness so a rejected payload can be explained without a device.
enum class AdResponseReason {
    Emptied,           // strict match, playlist interior blanked
    AlreadyEmpty,      // strict match, playlist was already empty
    TooSmall,
    TooLarge,
    DecompressChunk,
    NoPlaylistKey,
    NoSessionId,
    NoMeasurement,
    IsSchedule,        // contains intraTitlePlaylist -> PRS schedule, not a response
    TruncatedPlaylist, // no matching ']' inside the buffer
};

struct AdResponseResult {
    bool matched = false;   // passed every strict schema check
    bool modified = false;  // playlist interior was blanked
    int ads = 0;            // approximate ad entries removed
    size_t playlist_open = 0;
    size_t playlist_close = 0;
    AdResponseReason reason = AdResponseReason::NoPlaylistKey;
};

// JSON-aware matching-bracket finder. Returns the index of the ']' or '}' that
// closes the bracket at `open`, or (size_t)-1 when unclosed within [open, n).
// String and escape aware.
size_t json_match_bracket(const char* buf, size_t n, size_t open);

// Empty the `playlist` array of a getVideoAds ad-decision response in place.
//
// The buffer length is never changed. The function acts only when every strict
// schema check passes and the array is complete.
//
// apply: when false, parse and report exactly as normal but perform no writes.
AdResponseResult empty_ad_playlist(char* buf, size_t len, bool apply = true);

// Measurement of a playlist array that did not close inside the buffer.
//
// A response larger than one copy arrives cut in the middle of the array. The
// shipping filter refuses to modify it, which is why those ads survive. This
// scan reports how much of the array closed before the cut, so a partial
// strategy can be evaluated with evidence instead of assumption.
struct TruncatedPlaylistInfo {
    bool valid = false;          // `open` really points at an unclosed '['
    int complete_entries = 0;    // fully-closed {...} entries before the cut
    size_t first_entry = 0;      // index of the first entry's '{'
    size_t last_complete_end = 0;// index of the last complete entry's '}'
    size_t cut_offset = 0;       // index where scanning ran out of buffer
};

// Scan an unclosed playlist array. `open` must be the index of its '['.
TruncatedPlaylistInfo scan_truncated_playlist(const char* buf, size_t len, size_t open);

// Blank the ad entries that closed before the cut in a TRUNCATED playlist.
//
// A response larger than one copy is stream-parsed as it arrives, so a complete
// buffer never exists for us to empty. Observed on-device: a 42214-byte
// mid-roll response carried four fully-closed ad entries before the cut, and
// all of them played because the whole buffer was skipped.
//
// The entries and their separating commas become spaces, so a later completed
// buffer reads as [   {partial},{next}] — valid JSON with the leading ads gone.
// The truncated tail is never touched, which is the black-screen invariant.
//
// Returns the number of entries blanked. Apply this to a copy DESTINATION only.
// Editing a source mid-stream can corrupt the gzip CRC; see hooks.cpp.
int blank_truncated_ad_entries(char* buf, size_t len, bool apply = true);

// Human-readable reason, for host-test output and diagnostics.
const char* to_string(AdResponseReason reason);

} // namespace pvfilter
