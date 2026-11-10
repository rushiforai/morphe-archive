// Host test of the pose time hooks and the SHA-256 used for the compatibility pins.
//   g++ -std=c++17 -O2 -Wall -Wextra -Werror -Isrc tests/native_test.cpp -o pose_time_test && ./pose_time_test
#include "pose_time.h"
#include "sha256.h"

#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>

using namespace gxr::pose_time;

namespace {

int failures = 0;
void expect(bool condition, const char* what) {
    if (!condition) {
        std::fprintf(stderr, "FAIL: %s\n", what);
        ++failures;
    }
}

std::string sha(const char* text) {
    gxr::Sha256 hash;
    hash.update(reinterpret_cast<const unsigned char*>(text), std::strlen(text));
    char out[65];
    hash.hex(out);
    return out;
}

int64_t TEST_LABEL = 0;
unsigned char TEST_POSE[84];
std::uint32_t CONSUME_DEVICE = 3;

bool fakeConsume(void*, std::uint32_t, std::uint32_t, std::uint64_t* stamp, void* relation) {
    *stamp = static_cast<std::uint64_t>(TEST_LABEL);
    *static_cast<std::uint32_t*>(relation) = 0x77;
    return true;
}
// Stands in for GetControllerState: one consumePose call, then the pose block at +0x20.
bool fakeState(void*, void* output, int) {
    std::uint64_t stamp = 0;
    std::uint32_t relation = 0;
    expect(hookConsume(nullptr, CONSUME_DEVICE, 0x130005, &stamp, &relation), "consume returns the original result");
    std::memcpy(static_cast<unsigned char*>(output) + 0x20, TEST_POSE, sizeof(TEST_POSE));
    return true;
}
std::uint32_t fakeClock() { return static_cast<std::uint32_t>(now() / 1000); }
uintptr_t fakeSubmit(void*, void*, bool a, bool b) { return a && !b ? 0x12345678 : 0; }

void packetFor(unsigned char* packet, size_t size, size_t poseOffset) {
    std::memset(packet, 0, size);
    const std::uint32_t kind = 0x103;
    const std::uint16_t length = 0x168;
    std::memcpy(packet, &kind, 4);
    std::memcpy(packet + 4, &length, 2);
    packet[8] = 10;
    const std::uint32_t header = fakeClock();
    std::memcpy(packet + 0x14, &header, 4);
    std::memcpy(packet + poseOffset, TEST_POSE, sizeof(TEST_POSE));
}

int32_t field(const unsigned char* packet, size_t poseOffset) {
    int32_t value = 0;
    std::memcpy(&value, packet + poseOffset + 0x54, 4);
    return value;
}

void reset() {
    std::memset(SCOPES, 0, sizeof(SCOPES));
    std::memset(HANDS, 0, sizeof(HANDS));
    INVALID = 0;
}

}  // namespace

int main() {
    expect(sha("") == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", "sha256 of empty input");
    expect(sha("abc") == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad", "sha256 of abc");
    expect(sha("abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq") ==
        "248d6a61d20638b8e5c026930c3e6039a33ce45964ff2167f6ecedd419db06c1", "sha256 across two blocks");

    ORIGINAL_CONSUME = fakeConsume;
    ORIGINAL_STATE = fakeState;
    ORIGINAL_SUBMIT = fakeSubmit;
    VENDOR_CLOCK = fakeClock;
    for (size_t i = 0; i < sizeof(TEST_POSE); ++i) TEST_POSE[i] = static_cast<unsigned char>(i * 7 + 1);
    TEST_POSE[0x36] = 2;  // tracked
    ENABLED = true;

    struct Case { int64_t leadNs; int32_t low, high; const char* what; };
    // The label is 35 ms after the header, so the field is -(age + lead) = 35 ms - lead.
    const Case cases[] = {
        {DEFAULT_LEAD_NS, 29000, 30000, "default 5 ms: 35 ms label minus 5 ms"},
        {0, 34000, 35000, "0 ms forwards the raw slot label"},
        {28820000, 5000, 6180, "28.82 ms forwards the content epoch"},
        {MAX_LEAD_NS, 4000, 5000, "30 ms upper bound"},
    };
    for (const auto& c : cases) {
        reset();
        LEAD_NS = c.leadNs;
        TEST_LABEL = now() + 35000000;
        unsigned char output[0x80]{};
        expect(hookState(nullptr, output, 1), "state returns the original result");
        expect(HANDS[0].next == 1 && HANDS[0].samples[0].stamp == TEST_LABEL, "left label captured with its pose");
        unsigned char packet[0x170], before[0x170];
        packetFor(packet, sizeof(packet), 0xc0);
        std::memcpy(before, packet, sizeof(packet));
        expect(hookSubmit(nullptr, packet, true, false) == 0x12345678, "submit returns the original result");
        const int32_t value = field(packet, 0xc0);
        expect(HANDS[0].applied == 1 && value > c.low && value <= c.high, c.what);
        for (size_t i = 0; i < sizeof(packet); ++i) {
            if (i < 0xc0 + 0x54 || i >= 0xc0 + 0x58) expect(packet[i] == before[i], "only the left time field changes");
        }
        expect(HANDS[1].applied == 0, "right hand without a sample is left unchanged");
    }

    // Right controller (device 2) lands in the right pose block at +0x118.
    reset();
    LEAD_NS = DEFAULT_LEAD_NS;
    CONSUME_DEVICE = 2;
    TEST_LABEL = now() + 35000000;
    unsigned char output[0x80]{};
    hookState(nullptr, output, 0);
    unsigned char packet[0x170];
    packetFor(packet, sizeof(packet), 0x118);
    hookSubmit(nullptr, packet, true, false);
    expect(HANDS[1].applied == 1 && field(packet, 0x118) > 29000, "right hand time field written");
    CONSUME_DEVICE = 3;

    // A pose not seen through GetControllerState is not relabelled.
    reset();
    packetFor(packet, sizeof(packet), 0xc0);
    packet[0xc0] ^= 0xff;
    hookSubmit(nullptr, packet, true, false);
    expect(HANDS[0].unmatched == 1 && field(packet, 0xc0) == 0, "unknown pose bytes pass through");

    // Other packets and a disabled layer pass through untouched.
    reset();
    TEST_LABEL = now() + 35000000;
    hookState(nullptr, output, 1);
    packetFor(packet, sizeof(packet), 0xc0);
    packet[8] = 11;
    unsigned char before[0x170];
    std::memcpy(before, packet, sizeof(packet));
    hookSubmit(nullptr, packet, true, false);
    expect(std::memcmp(packet, before, sizeof(packet)) == 0, "other packet kinds unchanged");
    ENABLED = false;
    packetFor(packet, sizeof(packet), 0xc0);
    std::memcpy(before, packet, sizeof(packet));
    hookSubmit(nullptr, packet, true, false);
    expect(std::memcmp(packet, before, sizeof(packet)) == 0, "disabled layer passes through");

    if (failures) return EXIT_FAILURE;
    std::puts("PASS pose time hooks: label binding, default/raw/content/max compensation, field-only edit, "
              "both hands, unmatched and disabled passthrough; SHA-256 vectors.");
    return EXIT_SUCCESS;
}
