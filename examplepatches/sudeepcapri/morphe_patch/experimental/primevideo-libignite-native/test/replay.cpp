// replay.cpp — host replay harness for the Prime Video native ad filter.
//
// Purpose: run the EXACT shipping logic (remote_strip.cpp + ad_response.cpp)
// against real captured payloads, on the host, in about one second.
//
// Every on-device experiment before this harness cost a full build, patch,
// sign, install, and manual playback cycle. This replaces that loop for any
// question that can be answered from the payload bytes.
//
// Usage:
//   replay.exe [fixture-directory]
//
// Exit code 0 means every safety invariant held. Exit code 1 means a fixture
// broke an invariant that must never break on-device.

#include "../jni/ad_response.h"
#include "../jni/remote_strip.h"

#include <algorithm>
#include <cstdio>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <string>
#include <vector>

namespace fs = std::filesystem;

namespace {

int g_failures = 0;

void fail(const std::string& fixture, const std::string& message) {
    std::printf("    [FAIL] %s\n", message.c_str());
    ++g_failures;
    (void)fixture;
}

bool read_file(const fs::path& path, std::string& out) {
    std::ifstream in(path, std::ios::binary);
    if (!in) return false;
    out.assign(std::istreambuf_iterator<char>(in), std::istreambuf_iterator<char>());
    return true;
}

bool interior_is_blank(const std::string& buf, size_t open, size_t close) {
    for (size_t i = open + 1; i < close; ++i) {
        if (buf[i] != ' ') return false;
    }
    return true;
}

// A schedule payload carries the PRS intraTitlePlaylist array.
bool looks_like_schedule(const std::string& buf) {
    return buf.find("intraTitlePlaylist") != std::string::npos;
}

void replay_schedule(const std::string& name, const std::string& original) {
    std::string buf = original;
    pvfilter::RemoteStripResult r =
        pvfilter::strip_remote_items(&buf[0], buf.size());

    std::printf("    kind=schedule marker=%s complete=%s items=%d remotes-removed=%d "
                "gva-preserved=%d\n",
                r.found_marker ? "yes" : "no",
                r.complete ? "yes" : "no",
                r.total_items, r.remote_items, r.gva_skipped);

    // INVARIANT 1 — the buffer length must never change.
    if (buf.size() != original.size())
        fail(name, "schedule buffer length changed");

    // INVARIANT 2 — a truncated array must never be modified.
    if (r.found_marker && !r.complete && buf != original)
        fail(name, "truncated schedule was modified");

    // INVARIANT 3 — getVideoAds breaks must be preserved, not deleted.
    // Deleting them removes the break geometry the player needs to resume,
    // which caused the content-restart regression.
    if (r.found_marker && r.complete && r.gva_skipped > 0 &&
        buf.find("getVideoAds") == std::string::npos)
        fail(name, "getVideoAds break was destroyed instead of preserved");

    // EXPERIMENT — empty every resolver URL list instead of the response.
    if (r.found_marker && r.complete && r.gva_skipped > 0) {
        std::string exp = original;
        int changed = pvfilter::empty_remote_resolver_urls(&exp[0], exp.size());
        std::printf("    [experiment] resolver-urls emptied on %d break(s)\n", changed);
        if (changed > 0) {
            if (exp.size() != original.size())
                fail(name, "experiment changed the buffer length");

            // Element identity must survive: same count, same order.
            size_t before_main = 0, before_remote = 0, after_main = 0, after_remote = 0;
            for (size_t p = original.find("{\"type\":\"Main\""); p != std::string::npos;
                 p = original.find("{\"type\":\"Main\"", p + 1)) ++before_main;
            for (size_t p = original.find("{\"type\":\"Remote\""); p != std::string::npos;
                 p = original.find("{\"type\":\"Remote\"", p + 1)) ++before_remote;
            for (size_t p = exp.find("{\"type\":\"Main\""); p != std::string::npos;
                 p = exp.find("{\"type\":\"Main\"", p + 1)) ++after_main;
            for (size_t p = exp.find("{\"type\":\"Remote\""); p != std::string::npos;
                 p = exp.find("{\"type\":\"Remote\"", p + 1)) ++after_remote;

            std::printf("    [experiment] elements Main %zu->%zu  Remote %zu->%zu\n",
                        before_main, after_main, before_remote, after_remote);
            if (before_main != after_main || before_remote != after_remote)
                fail(name, "experiment changed the element count");

            // The break must still parse as a complete array afterwards.
            pvfilter::RemoteStripResult after =
                pvfilter::strip_remote_items(&exp[0], exp.size(), false, false);
            std::printf("    [experiment] reparse complete=%s items=%d gva=%d\n",
                        after.complete ? "yes" : "no", after.total_items, after.gva_skipped);
            if (!after.complete || after.total_items != r.total_items)
                fail(name, "experiment broke the playlist structure");

            bool urls_gone = exp.find("/cdp/getVideoAds") == std::string::npos;
            std::printf("    [experiment] resolver URLs removed=%s  breaks still present=%s\n",
                        urls_gone ? "yes" : "no",
                        after.gva_skipped == r.gva_skipped ? "yes" : "NO");
        }

        // EXPERIMENT 2 — keep the URL, corrupt only the session id.
        std::string ses = original;
        int touched = pvfilter::corrupt_remote_resolver_session(&ses[0], ses.size());
        std::printf("    [experiment2] session corrupted on %d break(s)\n", touched);
        if (touched > 0) {
            if (ses.size() != original.size())
                fail(name, "experiment2 changed the buffer length");
            pvfilter::RemoteStripResult after2 =
                pvfilter::strip_remote_items(&ses[0], ses.size(), false, false);
            std::printf("    [experiment2] reparse complete=%s items=%d gva=%d (was %d)\n",
                        after2.complete ? "yes" : "no", after2.total_items,
                        after2.gva_skipped, r.gva_skipped);
            bool path_kept = ses.find("/cdp/getVideoAds?version=v1") != std::string::npos;
            bool real_session_gone =
                ses.find("280e0769_PBP_EXPL_eRrOwcd9Nm6F5IFoQYxnJnZ1_1788201260") == std::string::npos;
            std::printf("    [experiment2] resolver path kept=%s  real session gone=%s"
                        "  self-protection survives=%s\n",
                        path_kept ? "yes" : "no",
                        real_session_gone ? "yes" : "no",
                        after2.gva_skipped == r.gva_skipped ? "yes" : "NO");
            size_t mk = ses.find("adMarkerId=");
            if (mk != std::string::npos)
                std::printf("    [experiment2] sample: %.96s\n", ses.c_str() + (mk > 80 ? mk - 80 : 0));
        }
    }
}

void replay_response(const std::string& name, const std::string& original) {
    std::string buf = original;
    pvfilter::AdResponseResult r =
        pvfilter::empty_ad_playlist(&buf[0], buf.size());

    std::printf("    kind=response matched=%s modified=%s ads=%d reason=%s\n",
                r.matched ? "yes" : "no",
                r.modified ? "yes" : "no",
                r.ads, pvfilter::to_string(r.reason));

    // A truncated playlist is the confirmed on-device cause of surviving ads:
    // a response larger than one copy arrives cut, and the filter must not
    // touch it. Report how much of the array closed before the cut.
    if (r.reason == pvfilter::AdResponseReason::TruncatedPlaylist) {
        pvfilter::TruncatedPlaylistInfo t =
            pvfilter::scan_truncated_playlist(buf.data(), buf.size(), r.playlist_open);
        std::printf("    truncated: open=%zu complete-entries=%d last-complete-end=%zu cut=%zu\n",
                    r.playlist_open, t.complete_entries, t.last_complete_end, t.cut_offset);

        // Partial recovery: blank the entries that closed before the cut.
        std::string partial = original;
        int blanked = pvfilter::blank_truncated_ad_entries(&partial[0], partial.size());
        std::printf("    partial-blank: entries removed=%d\n", blanked);

        if (blanked > 0) {
            if (partial.size() != original.size())
                fail(name, "partial blank changed the buffer length");
            // INVARIANT 9 — the cut entry must survive untouched.
            if (t.cut_offset < original.size() &&
                partial.compare(t.cut_offset, original.size() - t.cut_offset,
                                original, t.cut_offset, original.size() - t.cut_offset) != 0)
                fail(name, "partial blank modified the truncated tail");
            // INVARIANT 10 — completing the buffer must yield parseable JSON.
            std::string completed = partial.substr(0, t.cut_offset) + "]}";
            pvfilter::AdResponseResult after =
                pvfilter::empty_ad_playlist(&completed[0], completed.size(), false);
            if (after.reason == pvfilter::AdResponseReason::TruncatedPlaylist)
                fail(name, "playlist still unclosed after completing the buffer");
        }
    }

    // INVARIANT 1 — the buffer length must never change.
    if (buf.size() != original.size())
        fail(name, "response buffer length changed");

    // INVARIANT 4 — a decompression chunk must never be touched.
    if (pvfilter::is_decompress_chunk(original.size()) && buf != original)
        fail(name, "decompression-sized buffer was modified");

    // INVARIANT 5 — a truncated playlist must never be modified.
    if (r.reason == pvfilter::AdResponseReason::TruncatedPlaylist && buf != original)
        fail(name, "truncated playlist was modified");

    // INVARIANT 6 — when reported as emptied, the playlist must really be empty.
    if (r.modified) {
        if (!interior_is_blank(buf, r.playlist_open, r.playlist_close))
            fail(name, "playlist reported emptied but still holds data");
        if (buf.find("\"adId\"") != std::string::npos)
            fail(name, "ad entries survived the empty pass");
    }

    // INVARIANT 7 — an unmatched payload must be left completely untouched.
    if (!r.matched && buf != original)
        fail(name, "unmatched payload was modified");
}

} // namespace

int main(int argc, char** argv) {
    fs::path dir = (argc > 1) ? fs::path(argv[1]) : fs::path("fixtures");
    if (!fs::exists(dir)) {
        std::printf("fixture directory not found: %s\n", dir.string().c_str());
        return 2;
    }

    std::vector<fs::path> fixtures;
    for (const auto& entry : fs::directory_iterator(dir)) {
        if (entry.is_regular_file() && entry.path().extension() == ".json")
            fixtures.push_back(entry.path());
    }
    std::sort(fixtures.begin(), fixtures.end());

    if (fixtures.empty()) {
        std::printf("no .json fixtures in %s\n", dir.string().c_str());
        return 2;
    }

    std::printf("Prime Video native filter — replay over %zu fixture(s)\n\n",
                fixtures.size());

    for (const auto& path : fixtures) {
        std::string original;
        if (!read_file(path, original)) {
            std::printf("  %s\n    [FAIL] unreadable\n", path.filename().string().c_str());
            ++g_failures;
            continue;
        }
        std::string name = path.filename().string();
        std::printf("  %s (%zu bytes)\n", name.c_str(), original.size());

        if (looks_like_schedule(original)) {
            replay_schedule(name, original);
            // A schedule must never be mistaken for an ad-decision response.
            std::string copy = original;
            pvfilter::AdResponseResult r =
                pvfilter::empty_ad_playlist(&copy[0], copy.size());
            if (r.modified) fail(name, "schedule was treated as an ad response");
        } else {
            replay_response(name, original);
        }
        std::printf("\n");
    }

    if (g_failures == 0) {
        std::printf("ALL INVARIANTS HELD (%zu fixture(s))\n", fixtures.size());
        return 0;
    }
    std::printf("%d INVARIANT FAILURE(S)\n", g_failures);
    return 1;
}
