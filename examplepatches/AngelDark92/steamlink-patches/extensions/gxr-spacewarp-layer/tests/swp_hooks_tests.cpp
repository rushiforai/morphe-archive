// Host tests for the gxr-spacewarp PLT GOT patch module (B1b tests half).
//
// Compiles the PRODUCTION swp_hooks.cpp against synthetic layout state (the
// SWP_HOST_TESTS hooks of that TU): a fake module base, a synthetic anchor window
// and the fake GOT slot. Proves the fail-closed discipline:
//   - anchor mismatch (unknown layout) -> no slot write, state = failed;
//   - mprotect failure -> no slot write;
//   - unresolved slot (null original) -> no interception;
//   - anchor match -> exactly the wrapper pointer lands in the fake slot and the
//     original reaches swp_egl (SwpEglSetOriginal).
// The real pins for the 2.0.23/5002363 base are re-derived from the decoded tree
// by tests/derive_gate0.py and frozen in the Gate-0 JSON (the C++ host tests
// cannot ship Valve's binary, so the compiled-in profile itself is validated by
// that script + the mirrored Kotlin test rather than this TU).

#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>

#include "../src/swp_hooks.cpp"

static int g_checks = 0;
static int g_failures = 0;
#define CHECK(cond, label)                                                       \
    do {                                                                         \
        g_checks++;                                                              \
        if (!(cond)) {                                                           \
            g_failures++;                                                        \
            std::printf("FAIL: %s (line %d)\n", label, __LINE__);                \
        }                                                                        \
    } while (0)

// --- Android log stub body (records lines) ---
std::vector<std::string> g_logLines;
extern "C" int __android_log_print(int, const char*, const char* format, ...) {
    char line[256];
    va_list args;
    va_start(args, format);
    std::vsnprintf(line, sizeof(line), format, args);
    va_end(args);
    g_logLines.push_back(line);
    return 1;
}

// --- mprotect/sysconf stubs (record + controllable) ---
static int g_mprotectCalls = 0;
static bool g_mprotectFails = false;
extern "C" int mprotect(void* addr, size_t len, int prot) {
    g_mprotectCalls++;
    (void)addr;
    (void)len;
    (void)prot;
    return g_mprotectFails ? -1 : 0;
}
extern "C" long sysconf(int) { return 4096; }

// --- swp_egl capture (the real SwpEglSetOriginal stores the original) ---
static void* g_eglOriginalCaptured = nullptr;
extern "C" void SwpEglSetOriginal(void* originalCreateImageKHR) {
    g_eglOriginalCaptured = originalCreateImageKHR;
}

// --- Fake module: base + anchor bytes + GOT slot ---
static const size_t kFakeSize = 0x2000;
static uint8_t g_fakeModule[kFakeSize];
static const uintptr_t kFakeAnchorOffset = 0x1000;
static const uintptr_t kFakeSlotOffset = 0x1800;
static const char* kGoodSha = nullptr;  // computed in main from the synthetic bytes

// The wrapper the install must write into the slot.
extern "C" void* SwpWrapEglCreateImageKHR(void* dpy, void* ctx, unsigned target, void* buffer,
                                          const int* attrs);
extern "C" void* SwpWrapEglCreateImageKHR(void*, void*, unsigned, void*, const int*) {
    return nullptr;  // hooks test never invokes the arrival wrapper
}

static void BuildFakeModule() {
    memset(g_fakeModule, 0x33, sizeof(g_fakeModule));  // plausible code filler
    // A clearly non-null "resolved eglCreateImageKHR" in the slot.
    void* original = reinterpret_cast<void*>(0xE6C0);
    memcpy(g_fakeModule + kFakeSlotOffset, &original, sizeof(original));
}

int main() {
    BuildFakeModule();
    // The synthetic anchor's sha (sha256.h is exercised by the borrowed codec tests;
    // the anchor here is arbitrary synthetic bytes).
    uint8_t digest[32];
    char hex[65];
    gxr::Sha256::Digest(g_fakeModule + kFakeAnchorOffset, 0x80, digest);
    gxr::Sha256::Hex(digest, hex);
    kGoodSha = hex;

    // 1. Unknown layout fails closed: profile pins a DIFFERENT sha -> no slot write.
    SwpHooksTestSetProfile("synthetic-unknown", kFakeAnchorOffset,
                           "0000000000000000000000000000000000000000000000000000000000000000",
                           kFakeSlotOffset);
    SwpHooksTestSetBase(reinterpret_cast<uintptr_t>(g_fakeModule));
    SwpHooksTestResetState();
    CHECK(!SwpHooksArm(), "unknown anchor layout refuses to install");
    void* slot = *reinterpret_cast<void**>(g_fakeModule + kFakeSlotOffset);
    CHECK(slot == reinterpret_cast<void*>(0xE6C0),
          "fail closed: the GOT slot is untouched on an unknown layout");
    CHECK(!SwpHooksArmed(), "armed state stays false after the reject");
    CHECK(g_mprotectCalls == 0, "fail closed: no mprotect ran on the unknown layout");

    // 2. mprotect failure fails closed: matching anchor, failing mprotect.
    SwpHooksTestSetProfile("synthetic-known", kFakeAnchorOffset, kGoodSha, kFakeSlotOffset);
    SwpHooksTestResetState();
    g_mprotectFails = true;
    CHECK(!SwpHooksArm(), "mprotect failure refuses to install");
    slot = *reinterpret_cast<void**>(g_fakeModule + kFakeSlotOffset);
    CHECK(slot == reinterpret_cast<void*>(0xE6C0), "fail closed: the slot is untouched");
    CHECK(!SwpHooksArmed(), "armed state stays false after the mprotect failure");
    g_mprotectFails = false;

    // A scene imports the EGL export. An unresolved export or another hook's
    // pointer must fail before handing over an original or touching the GOT.
    void* invalidExports[] = {nullptr, reinterpret_cast<void*>(0xBAD0)};
    for (void* expected : invalidExports) {
        SwpHooksTestResetState();
        g_testEglExport = expected;
        g_mprotectCalls = 0;
        g_eglOriginalCaptured = nullptr;
        CHECK(!SwpHooksArm(), "missing or mismatched EGL export refuses interception");
        CHECK(*reinterpret_cast<void**>(g_fakeModule + kFakeSlotOffset) ==
                  reinterpret_cast<void*>(0xE6C0), "unexpected EGL pointer leaves slot unchanged");
        CHECK(g_mprotectCalls == 0 && g_eglOriginalCaptured == nullptr,
              "unexpected EGL pointer causes no write or original handover");
    }
    g_testEglExport = reinterpret_cast<void*>(0xE6C0);

    // 3. Resolved path: matching anchor + writable GOT -> exactly the wrapper.
    SwpHooksTestResetState();
    g_mprotectCalls = 0;
    CHECK(SwpHooksArm(), "matching layout installs the interception");
    slot = *reinterpret_cast<void**>(g_fakeModule + kFakeSlotOffset);
    CHECK(slot == reinterpret_cast<void*>(&SwpWrapEglCreateImageKHR),
          "the wrapper pointer lands in the GOT slot");
    CHECK(g_eglOriginalCaptured == reinterpret_cast<void*>(0xE6C0),
          "the original entry point reached swp_egl");
    CHECK(SwpHooksArmed(), "armed state true");
    CHECK(g_mprotectCalls == 2, "mprotect RW then restore read-only");

    // 4. One-shot: a second arm never rewrites the GOT (idempotent, no second write).
    g_eglOriginalCaptured = nullptr;
    CHECK(SwpHooksArm(), "second arm is idempotent");
    CHECK(g_eglOriginalCaptured == nullptr, "second arm does not re-hand over the original");

    std::printf("gxr-spacewarp hooks host tests: %d checks, %d failures\n", g_checks, g_failures);
    return g_failures == 0 ? 0 : 1;
}
