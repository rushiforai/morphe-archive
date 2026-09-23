#pragma once
// Host-only declarations matching the arm64 NDK API used by the production
// wrappers. These do not emulate Android tracing, codecs, or image ownership.
#include <cstddef>
#include <cstdint>
#include <sys/types.h>

struct AMediaCodec {};
struct AImageReader {};
struct AImage {};
using media_status_t = int32_t;
inline constexpr media_status_t AMEDIA_OK = 0;
struct AMediaCodecBufferInfo {
    int32_t offset;
    int32_t size;
    int64_t presentationTimeUs;
    uint32_t flags;
};
static_assert(sizeof(void*) == 8 && sizeof(size_t) == 8 && sizeof(ssize_t) == 8);
static_assert(offsetof(AMediaCodecBufferInfo, presentationTimeUs) == 8);
static_assert(sizeof(AMediaCodecBufferInfo) == 24);

extern "C" {
ssize_t AMediaCodec_dequeueInputBuffer(AMediaCodec*, int64_t);
media_status_t AMediaCodec_queueInputBuffer(AMediaCodec*, size_t, size_t, size_t, uint64_t, uint32_t);
ssize_t AMediaCodec_dequeueOutputBuffer(AMediaCodec*, AMediaCodecBufferInfo*, int64_t);
media_status_t AMediaCodec_releaseOutputBuffer(AMediaCodec*, size_t, bool);
media_status_t AImageReader_acquireLatestImage(AImageReader*, AImage**);
media_status_t AImage_getTimestamp(const AImage*, int64_t*);
bool ATrace_isEnabled();
void ATrace_beginSection(const char*);
void ATrace_endSection();
}
