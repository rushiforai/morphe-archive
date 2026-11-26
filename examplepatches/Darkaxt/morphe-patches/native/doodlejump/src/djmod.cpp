#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <dlfcn.h>
#include <sys/mman.h>
#include <unistd.h>
#include <vector>
#include <android/log.h>
#include <GLES/gl.h>

#include "arm64_hook.h"
#include "hud_draw.h"

#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, "DJMod", __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, "DJMod", __VA_ARGS__)

// ============================================================================
// 0. Embedded binary feature config (patched in-place by Morphe patches)
// ============================================================================
struct ModConfig {
    char     magic[8];       // "DJMODCFG"
    uint32_t endless_fall;   // 1 = Endless Fall & 3-Lives enabled
    uint32_t foldable_view;  // 1 = Foldable Seamless Cylindrical Wide View enabled
};

// Default to both enabled for standalone local builds; Morphe base patch clears
// them to 0 and each user-selected Morphe patch flips its own flag to 1.
extern "C" __attribute__((used, visibility("default")))
volatile ModConfig g_mod_cfg = {
    {'D', 'J', 'M', 'O', 'D', 'C', 'F', 'G'},
    1u,
    1u,
};

// ============================================================================
// 1. Proxy forwarding to libDoodleJump_orig.so (12 JNI exports, zero-overhead)
// ============================================================================
static void* g_orig_handle = nullptr;
static uintptr_t g_base = 0;

extern "C" __attribute__((visibility("hidden"))) void* g_jni_ptrs[12] = {};

#define DEFINE_JNI_PROXY(IDX, NAME)                                            \
    extern "C" __attribute__((visibility("default"), naked)) void NAME() {     \
        asm volatile(                                                          \
            "adrp x16, g_jni_ptrs\n"                                           \
            "add  x16, x16, :lo12:g_jni_ptrs\n"                                \
            "ldr  x16, [x16, #" #IDX "*8]\n"                                   \
            "br   x16\n"                                                       \
        );                                                                     \
    }

DEFINE_JNI_PROXY(0,  Java_com_limasky_doodlejumpandroid_MainApplication_initializeNativeAudio)
DEFINE_JNI_PROXY(1,  Java_com_limasky_doodlejumpandroid_AdsMediationManager_isAudioMuted)
DEFINE_JNI_PROXY(2,  Java_com_limasky_doodlejumpandroid_AudioTrack_readAndDecodeOgg)
DEFINE_JNI_PROXY(3,  Java_com_limasky_doodlejumpandroid_MainApplication_setUpBreakpad)
DEFINE_JNI_PROXY(4,  Java_com_limasky_doodlejumpandroid_Util_plca)
DEFINE_JNI_PROXY(5,  Java_com_limasky_doodlejumpandroid_NotificationCenter_updateScheduler)
DEFINE_JNI_PROXY(6,  Java_com_limasky_doodlejumpandroid_NotificationCenter_sendMessageNative)
DEFINE_JNI_PROXY(7,  Java_com_limasky_doodlejumpandroid_NotificationCenter_runGameLoopNative)
DEFINE_JNI_PROXY(8,  Java_com_limasky_doodlejumpandroid_NotificationCenter_initSensors)
DEFINE_JNI_PROXY(9,  Java_com_limasky_doodlejumpandroid_NotificationCenter_surfaceChangedSensors)
DEFINE_JNI_PROXY(10, Java_com_limasky_doodlejumpandroid_NotificationCenter_pauseSensors)
DEFINE_JNI_PROXY(11, Java_com_limasky_doodlejumpandroid_NotificationCenter_resumeSensors)

static const char* kJniNames[12] = {
    "Java_com_limasky_doodlejumpandroid_MainApplication_initializeNativeAudio",
    "Java_com_limasky_doodlejumpandroid_AdsMediationManager_isAudioMuted",
    "Java_com_limasky_doodlejumpandroid_AudioTrack_readAndDecodeOgg",
    "Java_com_limasky_doodlejumpandroid_MainApplication_setUpBreakpad",
    "Java_com_limasky_doodlejumpandroid_Util_plca",
    "Java_com_limasky_doodlejumpandroid_NotificationCenter_updateScheduler",
    "Java_com_limasky_doodlejumpandroid_NotificationCenter_sendMessageNative",
    "Java_com_limasky_doodlejumpandroid_NotificationCenter_runGameLoopNative",
    "Java_com_limasky_doodlejumpandroid_NotificationCenter_initSensors",
    "Java_com_limasky_doodlejumpandroid_NotificationCenter_surfaceChangedSensors",
    "Java_com_limasky_doodlejumpandroid_NotificationCenter_pauseSensors",
    "Java_com_limasky_doodlejumpandroid_NotificationCenter_resumeSensors",
};

// ============================================================================
// 2. Game struct offsets & function RVAs (Doodle Jump 3.11.40 arm64-v8a)
// ============================================================================
namespace offsets {
// Function RVAs (Ghidra VA - 0x100000)
constexpr uintptr_t kConvertTouch      = 0x2dff80;
constexpr uintptr_t kResetLevel        = 0x2ee3b0;
constexpr uintptr_t kRecyclePlatform   = 0x2f36b0;
constexpr uintptr_t kRecycleBonus      = 0x2f9054;
constexpr uintptr_t kRecycleMonster    = 0x2f9218;
constexpr uintptr_t kRecycleUFO        = 0x2f9538;
constexpr uintptr_t kUpdateGameplay    = 0x2f5c60;
constexpr uintptr_t kScrollWorld       = 0x2f9c88;
constexpr uintptr_t kTriggerGameOver   = 0x2fb658;
constexpr uintptr_t kCheckCollisions   = 0x2fbeb0;
constexpr uintptr_t kRenderWorld       = 0x305d20;
constexpr uintptr_t kRenderHUD         = 0x30d6ac;
constexpr uintptr_t kCullOffscreen     = 0x30eeb4;
constexpr uintptr_t kSetupScreen       = 0x33c83c;
constexpr uintptr_t kPlatformReset     = 0x343bec;
constexpr uintptr_t kPlatformSetType   = 0x343cb8;
constexpr uintptr_t kSetScaleX         = 0x3465e0;
constexpr uintptr_t kSetScaleY         = 0x3465ec;
constexpr uintptr_t kGetTopInset       = 0x346604;
constexpr uintptr_t kGetScreenHeight   = 0x3466ac;
constexpr uintptr_t kSetAspectRatio    = 0x3466f4;
constexpr uintptr_t kSetLogicalWidth   = 0x346700;
constexpr uintptr_t kSetLogicalHeight  = 0x34670c;
constexpr uintptr_t kRunGameLoopNative = 0x3820c0;

// GOT / Data RVAs
constexpr uintptr_t kGotGlOrthof       = 0x7ac280;
constexpr uintptr_t kScreenMetrics     = 0x7e6e30;

// Game struct (&DAT_008e6e60) field offsets
constexpr size_t kDt                 = 0x34;   // float
constexpr size_t kPhase              = 0x40;   // int (6 = playing, 7 = gameover, 10 = falling)
constexpr size_t kIsPlaying          = 0x44;   // int
constexpr size_t kIsFallingDead      = 0x90;   // int
constexpr size_t kDoodlerY           = 0x6f0;  // float (screen space Y, 0 = bottom)
constexpr size_t kIsFalling          = 0x6f4;  // int
constexpr size_t kDoodlerVy          = 0x6f8;  // float
constexpr size_t kScore              = 0x740;  // float
constexpr size_t kScreenRectPtr      = 0x73a8; // float* [x, y, w, h]
constexpr size_t kWorldY             = 0x73c8; // float
constexpr size_t kIsBlackHole        = 0x73f0; // int
constexpr size_t kIsAbductedUFO      = 0x73f4; // int
constexpr size_t kIsHitMonsterDizzy  = 0x73f8; // int
constexpr size_t kIsHitOtherHazard   = 0x73fc; // int
constexpr size_t kDeathAnimState     = 0x740c; // int
constexpr size_t kPlatformsBegin     = 0x74d0; // void**
constexpr size_t kPlatformsEnd       = 0x74d8; // void**
constexpr size_t kPlatformsCap       = 0x74e0; // void**
constexpr size_t kPoolBegin          = 0x74e8; // void**
constexpr size_t kPoolEnd            = 0x74f0; // void**
constexpr size_t kBonusesBegin       = 0x7500; // void** (item +0x1c = float y)
constexpr size_t kBonusesEnd         = 0x7508; // void**
constexpr size_t kBlackHolesBegin    = 0x7560; // void** (item +0x04 = float y)
constexpr size_t kBlackHolesEnd      = 0x7568; // void**
constexpr size_t kBlackHolePoolEnd   = 0x7580; // void**
constexpr size_t kBlackHolePoolCap   = 0x7588; // void**
constexpr size_t kUFOsBegin          = 0x7590; // void** (item +0x20 = float y)
constexpr size_t kUFOsEnd            = 0x7598; // void**
constexpr size_t kMonstersBegin      = 0x75c0; // void** (item +0x44 = float y)
constexpr size_t kMonstersEnd        = 0x75c8; // void**
constexpr size_t kSpecialsBegin      = 0x7638; // void** (theme objects, e.g. Winter icicle platforms)
constexpr size_t kSpecialsEnd        = 0x7640; // void**
constexpr size_t kThemeId            = 0x2c0;  // int (0xd = Winter/Ice)
constexpr size_t kActiveUFOCount     = 0x74c8; // int
constexpr size_t kActiveMonsterCount = 0x74cc; // int
constexpr size_t kProtectedPlatform  = 0x8580; // void*

// PlatformObject field offsets
constexpr size_t kPlatType      = 0x50; // int (0=green, 1=moving, 2=brown, 10=white, ...)
constexpr size_t kPlatMoveMode  = 0x60; // int
constexpr size_t kPlatX         = 0x64; // float
constexpr size_t kPlatY         = 0x68; // float (screen space Y)
constexpr size_t kPlatMoveSpeed = 0x78; // float
constexpr size_t kPlatBroken    = 0x90; // int (non-zero if broken/destroyed)
} // namespace offsets

template <typename T>
inline T& field(void* base, size_t off) {
    return *reinterpret_cast<T*>(static_cast<uint8_t*>(base) + off);
}

// ============================================================================
// 3. Mod configuration & runtime state
// ============================================================================
static constexpr int   kMaxLives            = 3;
static constexpr int   kLifeRecoverStep     = 10000;   // +1 life per 10,000 clean climb since last damage
static constexpr float kLowerScrollY        = 150.0f;
static constexpr float kFloorBounceY        = 28.0f;
static constexpr float kNormalJumpVy        = 9.0f;
static constexpr float kMonsterKnockbackVy  = -6.5f;   // push downward away from monster/UFO
static constexpr float kMonsterKnockbackDy  = 12.0f;
static constexpr float kFallDamage1LifeDist = 750.0f;  // ~1.5 screens -> -1 life
static constexpr float kFallDamage2LifeDist = 1750.0f; // ~3.5 screens -> -2 lives
static constexpr float kInvulnDuration      = 2.0f;
static constexpr float kFoldableMinAspect   = 1.80f;   // Trigger on screens wider than ~9:16
static constexpr float kFoldableTargetH     = 600.0f;  // Tall phone logical vertical height

struct SavedPlatform {
    float worldY;
    float x;
    int   type;
    int   moveMode;
    float moveSpeed;
};

struct Vec2 {
    float x;
    float y;
};

// Endless Fall & 3-Lives state
static std::vector<SavedPlatform> g_belowScreen;
static int   g_lives             = kMaxLives;
static float g_lifeRecoverTarget = 0.0f;
static float g_peakScore         = 0.0f;
static float g_invulnTimer    = 0.0f;
static float g_damageFlash    = 0.0f;
static bool  g_scrollingDown  = false;
static bool  g_trackingFall   = false;
static float g_fallStartWorld = 0.0f;
static bool  g_gameOverArmed  = false;

// Foldable Seamless Cylindrical View state
static float g_fullW   = 320.0f;
static float g_extraX  = 0.0f;
static float g_targetH = 0.0f;

// Original / helper function pointers
using VoidGameFn        = void (*)(void*);
using RenderHudFn       = void (*)(void*, int);
using ScrollWorldFn     = void (*)(void*, float);
using RecyclePlatformFn = void (*)(void*, void*);
using PlatformResetFn   = void (*)(void*);
using PlatformSetTypeFn = void (*)(void*, int);
using GetFloatFn        = float (*)();
using SetFloatFn        = void (*)(float);
using SetupScreenFn     = void (*)(int, int);
using ConvertTouchFn    = Vec2 (*)(void*, const Vec2*);
using GlOrthofFn        = void (*)(GLfloat, GLfloat, GLfloat, GLfloat, GLfloat, GLfloat);

static VoidGameFn        orig_resetLevel      = nullptr;
static VoidGameFn        orig_updateGameplay  = nullptr;
static VoidGameFn        orig_cullOffscreen   = nullptr;
static VoidGameFn        orig_checkCollisions = nullptr;
static VoidGameFn        orig_renderWorld     = nullptr;
static RenderHudFn       orig_renderHUD       = nullptr;
static VoidGameFn        orig_triggerGameOver = nullptr;
static SetupScreenFn     orig_setupScreen     = nullptr;
static ConvertTouchFn    orig_convertTouch    = nullptr;
static GlOrthofFn        orig_glOrthof        = nullptr;

static ScrollWorldFn     fn_scrollWorld       = nullptr;
static RecyclePlatformFn fn_recyclePlatform   = nullptr;
static RecyclePlatformFn fn_recycleBonus      = nullptr;
static RecyclePlatformFn fn_recycleMonster    = nullptr;
static RecyclePlatformFn fn_recycleUFO        = nullptr;
static PlatformResetFn   fn_platformReset     = nullptr;
static PlatformSetTypeFn fn_platformSetType   = nullptr;
static GetFloatFn        fn_getScreenHeight   = nullptr;
static GetFloatFn        fn_getTopInset       = nullptr;
static SetFloatFn        fn_setAspectRatio    = nullptr;
static SetFloatFn        fn_setLogicalWidth   = nullptr;
static SetFloatFn        fn_setLogicalHeight  = nullptr;
static SetFloatFn        fn_setScaleX         = nullptr;
static SetFloatFn        fn_setScaleY         = nullptr;

// ============================================================================
// 4. Endless Fall & 3-Lives helpers + hooks
// ============================================================================
// Insert `plat` into `game`'s active platforms vector keeping ascending Y order,
// so platforms[0] is always the lowest (for cullOffscreen) and platforms.back() is always highest.
static void insert_platform_sorted(void* game, void* plat) {
    auto*& begin = field<void**>(game, offsets::kPlatformsBegin);
    auto*& end   = field<void**>(game, offsets::kPlatformsEnd);
    auto*& cap   = field<void**>(game, offsets::kPlatformsCap);

    size_t count = static_cast<size_t>(end - begin);
    size_t capacity = static_cast<size_t>(cap - begin);

    if (count >= capacity) {
        fn_recyclePlatform(game, plat);
        return;
    }

    float py = field<float>(plat, offsets::kPlatY);
    size_t pos = 0;
    while (pos < count) {
        void* cur = begin[pos];
        if (cur && field<float>(cur, offsets::kPlatY) >= py) {
            break;
        }
        ++pos;
    }

    if (pos < count) {
        std::memmove(begin + pos + 1, begin + pos, (count - pos) * sizeof(void*));
    }
    begin[pos] = plat;
    end = begin + count + 1;
}

static uint32_t g_rng_state = 0x13579bdfu;
static float next_rand_x() {
    g_rng_state = g_rng_state * 1664525u + 1013904223u;
    float u = static_cast<float>((g_rng_state >> 8) & 0xFFFFu) / 65535.0f;
    return 36.0f + u * 248.0f;
}

// Polymorphic helpers for game+0x7638 theme objects across all 17 themes:
//   vtable+0x10: int   getType(void* obj)  (3=trap, 8=spike/icicle plat, 9=hazard, 12=special plat)
//   vtable+0x20: float getY(void* obj)
static int special_get_type(void* obj) {
    auto** vtbl = *reinterpret_cast<void***>(obj);
    if (!vtbl || !vtbl[2]) return -1;
    using Fn = int (*)(void*);
    return reinterpret_cast<Fn>(vtbl[2])(obj);
}

static float special_get_y(void* obj) {
    auto** vtbl = *reinterpret_cast<void***>(obj);
    if (!vtbl || !vtbl[4]) return -9999.0f;
    using Fn = float (*)(void*);
    return reinterpret_cast<Fn>(vtbl[4])(obj);
}

static float special_get_x(void* obj, int stype) {
    return (stype == 9) ? field<float>(obj, 0x28) : field<float>(obj, 0x18);
}

// Picks an X coordinate in [36, 284] at `target_y` that does not overlap any
// existing platform (all types), special theme object (all 17 themes), monster,
// UFO, or black hole.
static float pick_non_overlapping_x(void* game, float target_y) {
    void** p_begin  = field<void**>(game, offsets::kPlatformsBegin);
    void** p_end    = field<void**>(game, offsets::kPlatformsEnd);
    void** m_begin  = field<void**>(game, offsets::kMonstersBegin);
    void** m_end    = field<void**>(game, offsets::kMonstersEnd);
    void** u_begin  = field<void**>(game, offsets::kUFOsBegin);
    void** u_end    = field<void**>(game, offsets::kUFOsEnd);
    void** bh_begin = field<void**>(game, offsets::kBlackHolesBegin);
    void** bh_end   = field<void**>(game, offsets::kBlackHolesEnd);
    void** s_begin  = field<void**>(game, offsets::kSpecialsBegin);
    void** s_end    = field<void**>(game, offsets::kSpecialsEnd);

    float best_x = next_rand_x();
    float best_clearance = -1.0f;

    for (int attempt = 0; attempt < 12; ++attempt) {
        float cx = (attempt == 0) ? best_x : next_rand_x();
        float min_clear = 9999.0f;

        for (void** it = p_begin; it < p_end; ++it) {
            void* p = *it;
            if (!p) continue;
            float py = field<float>(p, offsets::kPlatY);
            if (std::fabs(py - target_y) < 28.0f) {
                float dx = std::fabs(field<float>(p, offsets::kPlatX) - cx);
                if (dx < min_clear) min_clear = dx;
            }
        }
        for (void** it = m_begin; it < m_end; ++it) {
            void* m = *it;
            if (!m) continue;
            if (std::fabs(field<float>(m, 0x44) - target_y) < 48.0f) {
                float dx = std::fabs(field<float>(m, 0x40) - cx);
                if (dx < min_clear) min_clear = dx;
            }
        }
        for (void** it = u_begin; it < u_end; ++it) {
            void* u = *it;
            if (!u) continue;
            if (std::fabs(field<float>(u, 0x20) - target_y) < 52.0f) {
                float dx = std::fabs(field<float>(u, 0x1c) - cx);
                if (dx < min_clear) min_clear = dx;
            }
        }
        for (void** it = bh_begin; it < bh_end; ++it) {
            void* bh = *it;
            if (!bh) continue;
            if (std::fabs(field<float>(bh, 0x04) - target_y) < 52.0f) {
                float dx = std::fabs(field<float>(bh, 0x00) - cx);
                if (dx < min_clear) min_clear = dx;
            }
        }
        for (void** it = s_begin; it < s_end; ++it) {
            void* s = *it;
            if (!s) continue;
            int stype = special_get_type(s);
            float sy  = special_get_y(s);
            float sx  = special_get_x(s, stype);
            if (sx >= -40.0f && sx <= 360.0f && std::fabs(sy - target_y) < 40.0f) {
                float dx = std::fabs(sx - cx);
                if (dx < min_clear) min_clear = dx;
            }
        }

        if (min_clear >= 76.0f) {
            return cx; // completely clear!
        }
        if (min_clear > best_clearance) {
            best_clearance = min_clear;
            best_x = cx;
        }
    }
    return best_x;
}

static void* pop_platform_from_pool(void* game) {
    auto*& pool_begin = field<void**>(game, offsets::kPoolBegin);
    auto*& pool_end   = field<void**>(game, offsets::kPoolEnd);
    if (pool_end <= pool_begin) return nullptr;
    pool_end -= 1;
    return *pool_end;
}

// Helper to spawn a single-use disappearing platform (type 3).
// When `fade_in` is true, uses Doodle Jump's native smooth opacity fade-in (fadeState=2).
static void spawn_single_use_bridge(void* game, float new_y, bool fade_in) {
    void* p = pop_platform_from_pool(game);
    if (!p) return;
    fn_platformReset(p);
    fn_platformSetType(p, 3); // single-use disappearing platform
    field<float>(p, offsets::kPlatX)         = pick_non_overlapping_x(game, new_y);
    field<float>(p, offsets::kPlatY)         = new_y;
    field<int>(p, offsets::kPlatMoveMode)    = 0;
    field<float>(p, offsets::kPlatMoveSpeed) = 0.0f;
    if (fade_in) {
        field<float>(p, 0x58) = 0.0f;
        field<int>(p, 0x5c)   = 2; // native fade-in (alpha += 0.1/tick until >= 1.0)
    }
    insert_platform_sorted(game, p);
}

// Guarantees no unpassable vertical gap (> 130 units; max jump height is ~168):
// 1. Off-screen first (zero visible pop-in): scans up to screen_top + 300 and bridges
//    any >130-unit gap above the visible top edge (y >= screen_top + 6) as soon as new
//    platforms/patterns spawn, plus keeps top_y <= screen_top - 105 populated at screen_top + 10.
// 2. Softlock rescue only when falling (vy < 0): if an unreachable >135-unit gap still
//    sits directly above the Doodler (e.g. after using a single-use platform and falling
//    back down), smoothly fades in a single-use bridge instead of trapping the player.
static void ensure_reachable_gaps(void* game) {
    auto*& pool_b = field<void**>(game, offsets::kPoolBegin);
    auto*& pool_e = field<void**>(game, offsets::kPoolEnd);
    if ((pool_e - pool_b) <= 12) return; // keep healthy pool headroom

    float* rect = field<float*>(game, offsets::kScreenRectPtr);
    float screen_top = rect ? (rect[1] + rect[3]) : 600.0f;
    float doodler_y  = field<float>(game, offsets::kDoodlerY);
    float doodler_vy = field<float>(game, offsets::kDoodlerVy);

    // Collect Y coordinates of all currently landable platforms up to screen_top + 300
    float solid_y[64];
    int n_solid = 0;
    void** begin = field<void**>(game, offsets::kPlatformsBegin);
    void** end   = field<void**>(game, offsets::kPlatformsEnd);
    for (void** it = begin; it < end && n_solid < 64; ++it) {
        void* p = *it;
        if (!p) continue;
        int type   = field<int>(p, offsets::kPlatType);
        int broken = field<int>(p, offsets::kPlatBroken);
        if (type == 2 || broken != 0) continue;
        if (type == 3) {
            int fade_state = field<int>(p, 0x5c);
            float& alpha   = field<float>(p, 0x58);
            if (fade_state == 0 && alpha > 1.0f) alpha = 1.0f;
            if (fade_state != 2 && alpha <= 0.05f) continue;
        }
        float py = field<float>(p, offsets::kPlatY);
        if (py >= -20.0f && py <= screen_top + 300.0f) {
            solid_y[n_solid++] = py;
        }
    }
    // Also count all landable special theme platforms in game+0x7638 across all themes
    // (type 8 = spike/icicle platforms, type 12 = special landable theme platforms)
    {
        void** s_begin = field<void**>(game, offsets::kSpecialsBegin);
        void** s_end   = field<void**>(game, offsets::kSpecialsEnd);
        for (void** it = s_begin; it < s_end && n_solid < 64; ++it) {
            void* s = *it;
            if (!s) continue;
            int stype = special_get_type(s);
            if (stype != 8 && stype != 12) continue;
            float sy = special_get_y(s);
            if (sy >= -20.0f && sy <= screen_top + 300.0f) {
                solid_y[n_solid++] = sy;
            }
        }
    }
    if (n_solid < 1) return;
    std::sort(solid_y, solid_y + n_solid);

    int added = 0;
    for (int i = 0; i + 1 < n_solid && added < 4; ++i) {
        float y0 = solid_y[i];
        float y1 = solid_y[i + 1];
        float gap = y1 - y0;
        if (gap <= 130.0f) continue;

        // Case 1: Gap extends above screen_top -> bridge strictly OFF-SCREEN above screen_top!
        if (y1 >= screen_top + 6.0f) {
            float first_y = std::max(screen_top + 6.0f, y0 + 105.0f);
            if (first_y - y0 <= 130.0f && first_y < y1 - 20.0f) {
                while (first_y < y1 - 120.0f && added < 4 && (pool_e - pool_b) > 12) {
                    spawn_single_use_bridge(game, first_y, false);
                    first_y += 105.0f;
                    added++;
                }
                if (first_y < y1 - 20.0f && added < 4 && (pool_e - pool_b) > 12) {
                    spawn_single_use_bridge(game, first_y, false);
                    added++;
                }
                continue;
            }
        }

        // Case 2: On-screen softlock rescue — ONLY when falling (vy < 0) and trapped below
        // an unreachable (>135) gap directly above the Doodler. Uses smooth native fade-in.
        if (doodler_vy < 0.0f && gap > 135.0f &&
            y0 <= doodler_y + 30.0f && y1 > doodler_y + 30.0f) {
            int pieces = static_cast<int>(gap / 110.0f);
            if (pieces < 1) pieces = 1;
            if (pieces > 3) pieces = 3;
            for (int k = 1; k <= pieces && added < 4; ++k) {
                if ((pool_e - pool_b) <= 12) break;
                float new_y = y0 + gap * (static_cast<float>(k) / static_cast<float>(pieces + 1));
                spawn_single_use_bridge(game, new_y, true);
                added++;
            }
        }
    }

    // Keep the top edge populated strictly off-screen (screen_top + 10)
    float top_y = solid_y[n_solid - 1];
    if (top_y <= screen_top - 105.0f && added < 4 && (pool_e - pool_b) > 12) {
        spawn_single_use_bridge(game, screen_top + 10.0f, false);
    }
}

static void scroll_down_with_history(void* game, float scroll_down) {
    g_scrollingDown = true;

    fn_scrollWorld(game, -scroll_down);

    float* rect = field<float*>(game, offsets::kScreenRectPtr);
    float screen_top = rect ? (rect[1] + rect[3]) : 600.0f;

    auto*& begin = field<void**>(game, offsets::kPlatformsBegin);
    auto*& end   = field<void**>(game, offsets::kPlatformsEnd);
    void* protected_plat = field<void*>(game, offsets::kProtectedPlatform);

    while ((end - begin) > 1) {
        void* top_plat = *(end - 1);
        if (!top_plat || top_plat == protected_plat) break;
        float py = field<float>(top_plat, offsets::kPlatY);
        if (py > screen_top + 30.0f) {
            end -= 1;
            fn_recyclePlatform(game, top_plat);
        } else {
            break;
        }
    }

    const float cull_top_y = screen_top + 30.0f;

    // Recycle bonuses/springs/powerups that scrolled above the top of the screen
    // (vanilla cullOffscreen only culls below y < -25, so without this the bonus pool leaks & crashes)
    {
        auto*& b_begin = field<void**>(game, offsets::kBonusesBegin);
        auto*& b_end   = field<void**>(game, offsets::kBonusesEnd);
        void** dst = b_begin;
        for (void** it = b_begin; it < b_end; ++it) {
            void* item = *it;
            if (item && field<float>(item, 0x1c) > cull_top_y) {
                for (void** pit = begin; pit < end; ++pit) {
                    if (*pit && field<void*>(*pit, 0x40) == item) {
                        field<void*>(*pit, 0x40) = nullptr;
                    }
                }
                fn_recycleBonus(game, item);
            } else {
                *dst++ = item;
            }
        }
        b_end = dst;
    }

    // Recycle monsters above the top of the screen
    {
        auto*& m_begin = field<void**>(game, offsets::kMonstersBegin);
        auto*& m_end   = field<void**>(game, offsets::kMonstersEnd);
        void** dst = m_begin;
        for (void** it = m_begin; it < m_end; ++it) {
            void* item = *it;
            if (item && field<float>(item, 0x44) > cull_top_y) {
                if (field<uint8_t>(item, 0x6d) != 0) {
                    int& cnt = field<int>(game, offsets::kActiveMonsterCount);
                    if (cnt > 0) cnt -= 1;
                }
                fn_recycleMonster(game, item);
            } else {
                *dst++ = item;
            }
        }
        m_end = dst;
    }

    // Recycle UFOs above the top of the screen
    {
        auto*& u_begin = field<void**>(game, offsets::kUFOsBegin);
        auto*& u_end   = field<void**>(game, offsets::kUFOsEnd);
        void** dst = u_begin;
        for (void** it = u_begin; it < u_end; ++it) {
            void* item = *it;
            if (item && field<float>(item, 0x20) > cull_top_y) {
                int& cnt = field<int>(game, offsets::kActiveUFOCount);
                if (cnt > 0) cnt -= 1;
                fn_recycleUFO(game, item);
            } else {
                *dst++ = item;
            }
        }
        u_end = dst;
    }

    // Recycle black holes above the top of the screen
    {
        auto*& bh_begin = field<void**>(game, offsets::kBlackHolesBegin);
        auto*& bh_end   = field<void**>(game, offsets::kBlackHolesEnd);
        auto*& bh_pend  = field<void**>(game, offsets::kBlackHolePoolEnd);
        auto*& bh_pcap  = field<void**>(game, offsets::kBlackHolePoolCap);
        void** dst = bh_begin;
        for (void** it = bh_begin; it < bh_end; ++it) {
            void* item = *it;
            if (item && field<float>(item, 0x04) > cull_top_y && bh_pend < bh_pcap) {
                *bh_pend++ = item;
            } else {
                *dst++ = item;
            }
        }
        bh_end = dst;
    }

    float cur_world_y = field<float>(game, offsets::kWorldY);
    int restored = 0;
    while (!g_belowScreen.empty() && restored < 24) {
        const SavedPlatform& sp = g_belowScreen.back();
        if (sp.worldY < cur_world_y - 6.0f) {
            break;
        }
        void* p = pop_platform_from_pool(game);
        if (!p) break;

        fn_platformReset(p);
        fn_platformSetType(p, sp.type);
        field<float>(p, offsets::kPlatX)         = sp.x;
        field<float>(p, offsets::kPlatY)         = sp.worldY - cur_world_y;
        field<int>(p, offsets::kPlatMoveMode)    = sp.moveMode;
        field<float>(p, offsets::kPlatMoveSpeed) = sp.moveSpeed;

        insert_platform_sorted(game, p);
        g_belowScreen.pop_back();
        restored++;
    }

    // Safety net: never allow a large empty gap at the bottom while falling down
    // (e.g. after a broken-platform section or fast jetpack/rocket ascent).
    {
        auto*& b = field<void**>(game, offsets::kPlatformsBegin);
        auto*& e = field<void**>(game, offsets::kPlatformsEnd);
        float min_y = 9999.0f;
        for (void** it = b; it < e; ++it) {
            if (*it) {
                float py = field<float>(*it, offsets::kPlatY);
                if (py < min_y) min_y = py;
            }
        }
        // Spawn strictly below the visible area (y = -12) whenever the lowest landable
        // platform has risen >= 105 units above the bottom edge while falling down.
        if (min_y >= 105.0f && cur_world_y > 10.0f &&
            (field<void**>(game, offsets::kPoolEnd) - field<void**>(game, offsets::kPoolBegin)) > 12) {
            spawn_single_use_bridge(game, -12.0f, false);
        }
    }

    ensure_reachable_gaps(game);
    g_scrollingDown = false;
}

static void apply_fall_damage(void* game, int dmg) {
    if (dmg <= 0 || g_lives <= 0) return;
    g_lives = std::max(0, g_lives - dmg);
    g_damageFlash = 0.6f;
    LOGI("Fall damage: -%d life (remaining: %d)", dmg, g_lives);
    if (g_lives > 0) {
        float cur_score = std::max(0.0f, field<float>(game, offsets::kScore));
        g_lifeRecoverTarget = cur_score + static_cast<float>(kLifeRecoverStep);
    } else {
        // Trigger vanilla's normal falling-death transition so sound, cleanup,
        // hook_triggerGameOver (peak score), and the Game Over menu all run cleanly.
        g_gameOverArmed = true;
        field<float>(game, offsets::kDoodlerY)  = 0.0f;
        field<float>(game, offsets::kDoodlerVy) = -9.0f;
        field<int>(game, offsets::kIsFalling)   = 1;
        field<int>(game, 0x7498)                = 0; // disable collisions while dying
    }
}

static void hook_resetLevel(void* game) {
    g_belowScreen.clear();
    g_lives             = kMaxLives;
    g_lifeRecoverTarget = 0.0f;
    g_peakScore         = 0.0f;
    g_invulnTimer    = 0.0f;
    g_damageFlash    = 0.0f;
    g_scrollingDown  = false;
    g_trackingFall   = false;
    g_fallStartWorld = 0.0f;
    g_gameOverArmed  = false;
    orig_resetLevel(game);
}

static void hook_cullOffscreen(void* game) {
    if (g_scrollingDown) {
        return;
    }

    void** begin = field<void**>(game, offsets::kPlatformsBegin);
    void** end   = field<void**>(game, offsets::kPlatformsEnd);
    void* protected_plat = field<void*>(game, offsets::kProtectedPlatform);
    float cur_world_y = field<float>(game, offsets::kWorldY);

    for (void** it = begin; it < end; ++it) {
        void* p = *it;
        if (!p || p == protected_plat) continue;
        float py = field<float>(p, offsets::kPlatY);
        if (py >= -6.0f) continue;

        int type = field<int>(p, offsets::kPlatType);
        int broken = field<int>(p, offsets::kPlatBroken);
        if (type == 2 && broken != 0) continue;
        if (type == 3 && field<int>(p, 0x5c) != 0) continue; // don't save already-used single-use platforms

        SavedPlatform sp;
        sp.worldY    = cur_world_y + py;
        sp.x         = field<float>(p, offsets::kPlatX);
        sp.type      = type;
        sp.moveMode  = field<int>(p, offsets::kPlatMoveMode);
        sp.moveSpeed = field<float>(p, offsets::kPlatMoveSpeed);

        // Insert in sorted ascending worldY order (avoiding near-duplicate entries)
        auto ins = std::lower_bound(
            g_belowScreen.begin(), g_belowScreen.end(), sp.worldY,
            [](const SavedPlatform& a, float wy) { return a.worldY < wy; });
        bool dup = false;
        if (ins != g_belowScreen.end() &&
            std::fabs(ins->worldY - sp.worldY) < 2.0f &&
            std::fabs(ins->x - sp.x) < 4.0f) {
            dup = true;
        }
        if (!dup && ins != g_belowScreen.begin()) {
            auto prev = ins - 1;
            if (std::fabs(prev->worldY - sp.worldY) < 2.0f &&
                std::fabs(prev->x - sp.x) < 4.0f) {
                dup = true;
            }
        }
        if (!dup) {
            g_belowScreen.insert(ins, sp);
        }
    }

    orig_cullOffscreen(game);
}

static void hook_updateGameplay(void* game) {
    float dt = field<float>(game, offsets::kDt);
    if (dt <= 0.0f || dt > 0.25f) dt = 1.0f / 60.0f;

    if (g_invulnTimer > 0.0f) g_invulnTimer = std::max(0.0f, g_invulnTimer - dt);
    if (g_damageFlash > 0.0f) g_damageFlash = std::max(0.0f, g_damageFlash - dt);

    int phase        = field<int>(game, offsets::kPhase);
    int is_playing   = field<int>(game, offsets::kIsPlaying);
    int falling_dead = field<int>(game, offsets::kIsFallingDead);
    int black_hole   = field<int>(game, offsets::kIsBlackHole);
    int hit_hazard   = field<int>(game, offsets::kIsHitMonsterDizzy) |
                       field<int>(game, offsets::kIsAbductedUFO) |
                       field<int>(game, offsets::kIsHitOtherHazard);

    if (phase == 6 && is_playing == 1 && falling_dead == 0 && black_hole == 0 &&
        hit_hazard == 0 && g_lives > 0 && !g_gameOverArmed) {
        float& dy = field<float>(game, offsets::kDoodlerY);
        float& vy = field<float>(game, offsets::kDoodlerVy);
        float& wy = field<float>(game, offsets::kWorldY);

        if (dy < kLowerScrollY && vy < 0.0f && wy > 0.0f) {
            float want_down = kLowerScrollY - dy;
            float scroll_down = std::min(want_down, wy);
            if (scroll_down > 0.0f) {
                dy += scroll_down;
                scroll_down_with_history(game, scroll_down);
            }
        }

        if (wy <= 1.0f && dy < kFloorBounceY && vy < 0.0f) {
            if (g_trackingFall) {
                float fall_dist = g_fallStartWorld - (wy + dy);
                g_trackingFall = false;
                if (fall_dist > kFallDamage2LifeDist) {
                    apply_fall_damage(game, 2);
                } else if (fall_dist > kFallDamage1LifeDist) {
                    apply_fall_damage(game, 1);
                }
            }
            if (g_lives > 0 && !g_gameOverArmed) {
                dy = kFloorBounceY;
                vy = kNormalJumpVy;
                field<int>(game, offsets::kIsFalling) = 0;
            }
        }
    }

    orig_updateGameplay(game);

    if (field<int>(game, offsets::kPhase) == 6 &&
        field<int>(game, offsets::kIsPlaying) == 1 &&
        field<int>(game, offsets::kIsFallingDead) == 0 &&
        field<int>(game, offsets::kIsBlackHole) == 0 &&
        !g_gameOverArmed) {
        ensure_reachable_gaps(game);
    }

    float& score = field<float>(game, offsets::kScore);
    if (score < 0.0f) score = 0.0f;
    if (score > g_peakScore) g_peakScore = score;
    if (g_lives > 0 && g_lives < kMaxLives && score >= g_lifeRecoverTarget) {
        g_lives += 1;
        LOGI("Life recovered after +%d clean climb (score=%.0f, lives=%d)",
             kLifeRecoverStep, score, g_lives);
        if (g_lives < kMaxLives) {
            g_lifeRecoverTarget = score + static_cast<float>(kLifeRecoverStep);
        }
    }

    if (field<int>(game, offsets::kPhase) == 6 &&
        field<int>(game, offsets::kIsPlaying) == 1 &&
        field<int>(game, offsets::kIsFallingDead) == 0 &&
        field<int>(game, offsets::kIsBlackHole) == 0 &&
        !g_gameOverArmed) {
        float dy = field<float>(game, offsets::kDoodlerY);
        float vy = field<float>(game, offsets::kDoodlerVy);
        float wy = field<float>(game, offsets::kWorldY);

        if (vy < 0.0f) {
            if (!g_trackingFall) {
                g_trackingFall = true;
                g_fallStartWorld = wy + dy;
            }
        } else if (vy > 0.0f && g_trackingFall) {
            float fall_dist = g_fallStartWorld - (wy + dy);
            g_trackingFall = false;
            if (fall_dist > kFallDamage2LifeDist) {
                apply_fall_damage(game, 2);
            } else if (fall_dist > kFallDamage1LifeDist) {
                apply_fall_damage(game, 1);
            }
        }
    }
}

static void hook_checkCollisions(void* game) {
    int prev_monster    = field<int>(game, offsets::kIsHitMonsterDizzy);
    int prev_ufo        = field<int>(game, offsets::kIsAbductedUFO);
    int prev_other      = field<int>(game, offsets::kIsHitOtherHazard);
    int prev_coll_en    = field<int>(game, 0x7498);
    int prev_8670       = field<int>(game, 0x8670);
    int prev_8678       = field<int>(game, 0x8678);
    int prev_96a8       = field<int>(game, 0x96a8);

    orig_checkCollisions(game);

    if (field<int>(game, offsets::kIsBlackHole) != 0) {
        return;
    }

    int now_monster = field<int>(game, offsets::kIsHitMonsterDizzy);
    int now_ufo     = field<int>(game, offsets::kIsAbductedUFO);
    int now_other   = field<int>(game, offsets::kIsHitOtherHazard);

    bool new_hit = (prev_monster == 0 && now_monster != 0) ||
                   (prev_ufo     == 0 && now_ufo     != 0) ||
                   (prev_other   == 0 && now_other   != 0);

    if (!new_hit) return;

    auto cancel_ko = [&]() {
        field<int>(game, offsets::kIsHitMonsterDizzy) = 0;
        field<int>(game, offsets::kIsAbductedUFO)     = 0;
        field<int>(game, offsets::kIsHitOtherHazard)  = 0;
        field<int>(game, offsets::kDeathAnimState)    = 0;
        field<int>(game, offsets::kIsFallingDead)     = 0;
        field<int>(game, offsets::kIsPlaying)         = 1;
        // Push the Doodler back downward away from the monster/UFO instead of phasing through it
        float& dy = field<float>(game, offsets::kDoodlerY);
        float& vy = field<float>(game, offsets::kDoodlerVy);
        dy = std::max(kFloorBounceY, dy - kMonsterKnockbackDy);
        vy = std::min(vy, kMonsterKnockbackVy);
        field<int>(game, offsets::kIsFalling) = 1;
        field<int>(game, 0x7498) = (prev_coll_en != 0) ? prev_coll_en : 1; // re-enable collisions!
        field<int>(game, 0x8670) = prev_8670;
        field<int>(game, 0x8678) = prev_8678;
        field<int>(game, 0x96a8) = prev_96a8;
        field<int>(game, 0x74a4) = 0;
        field<void*>(game, 0x74b0) = nullptr;
        field<int>(game, 0x8eb8) = 0;
        field<int>(game, 0x9140) = 0;
        field<int>(game, 0x95e0) = 0;
        field<int>(game, 0x95e4) = 0;
        field<float>(game, 0x790c) = 0.0f;
        g_trackingFall = false;
    };

    if (g_invulnTimer > 0.0f) {
        cancel_ko();
        return;
    }

    g_lives = std::max(0, g_lives - 1);
    g_damageFlash = 0.6f;
    LOGI("Monster/UFO hit -> -1 life (remaining: %d)", g_lives);

    if (g_lives > 0) {
        float cur_score = std::max(0.0f, field<float>(game, offsets::kScore));
        g_lifeRecoverTarget = cur_score + static_cast<float>(kLifeRecoverStep);
        g_invulnTimer = kInvulnDuration;
        cancel_ko();
    } else {
        // Out of lives: disarm Endless Fall immediately so vanilla KO ends the run right away
        g_gameOverArmed = true;
    }
}

static void hook_triggerGameOver(void* game) {
    float& score = field<float>(game, offsets::kScore);
    if (g_peakScore > score) {
        score = g_peakScore;
    }
    orig_triggerGameOver(game);
}

static void hook_renderHUD(void* game, int flag) {
    orig_renderHUD(game, flag);

    int phase = field<int>(game, offsets::kPhase);
    if (phase == 6 || phase == 10) {
        float* rect = field<float*>(game, offsets::kScreenRectPtr);
        float screen_left  = rect ? rect[0] : 0.0f;
        float screen_width = rect ? rect[2] : 320.0f;
        float screen_h     = fn_getScreenHeight ? fn_getScreenHeight() : 533.0f;
        float top_inset    = fn_getTopInset ? fn_getTopInset() : 0.0f;

        // Active theme's Doodler sprite table at game+0x9010 ([row*4 + dir], dir=1 facing right)
        void** sprite_table = field<void**>(game, 0x9010);
        const void* doodler_sprite = nullptr;
        if (sprite_table) {
            doodler_sprite = sprite_table[1] ? sprite_table[1] : sprite_table[0];
        }
        if (!doodler_sprite) doodler_sprite = field<void*>(game, 0x70c0);

        hud_draw::render_overlay(
            g_lives, kMaxLives, static_cast<int>(g_peakScore),
            screen_left, screen_width, screen_h, top_inset,
            g_invulnTimer, g_damageFlash, doodler_sprite, g_extraX);
    }
}

// ============================================================================
// 5. Foldable / Wide Screen Seamless Cylindrical Wrap-Around View hooks
// ============================================================================
static void hook_setupScreen(int pixelW, int pixelH) {
    orig_setupScreen(pixelW, pixelH);

    if (pixelW <= 0 || pixelH <= 0) {
        g_extraX = 0.0f;
        g_fullW  = 320.0f;
        return;
    }

    float aspect = static_cast<float>(pixelH) / static_cast<float>(pixelW);
    if (aspect < kFoldableMinAspect) {
        g_targetH = kFoldableTargetH;
        g_fullW   = g_targetH * (static_cast<float>(pixelW) / static_cast<float>(pixelH));
        g_extraX  = (g_fullW - 320.0f) * 0.5f;

        void* metrics = reinterpret_cast<void*>(g_base + offsets::kScreenMetrics);
        // Keep logical playfield & UI rect at [0, 0, 320, g_targetH] so wrap physics and menus
        // stay centered and unclipped with full vertical visibility.
        field<float>(metrics, 0x0c) = g_targetH;
        field<float>(metrics, 0x1c) = g_targetH;

        if (fn_setAspectRatio)   fn_setAspectRatio(g_targetH / 320.0f);
        if (fn_setLogicalWidth)  fn_setLogicalWidth(320.0f);
        if (fn_setLogicalHeight) fn_setLogicalHeight(g_targetH);
        if (fn_setScaleX)        fn_setScaleX(static_cast<float>(pixelW) / g_fullW);
        if (fn_setScaleY)        fn_setScaleY(static_cast<float>(pixelH) / g_targetH);

        LOGI("Foldable view active: %dx%d (aspect=%.2f) -> logical 320x%.0f, fullW=%.1f, extraX=%.1f",
             pixelW, pixelH, aspect, g_targetH, g_fullW, g_extraX);
    } else {
        g_extraX  = 0.0f;
        g_fullW   = 320.0f;
        g_targetH = 320.0f * aspect;
    }
}

static Vec2 hook_convertTouch(void* metrics, const Vec2* raw_px) {
    Vec2 res = orig_convertTouch(metrics, raw_px);
    if (g_extraX > 1.0f && raw_px) {
        float pixelW = field<float>(metrics, 0x20);
        if (pixelW > 0.0f) {
            res.x = raw_px->x * (g_fullW / pixelW) - g_extraX;
        }
    }
    return res;
}

static void hook_glOrthof(GLfloat left, GLfloat right, GLfloat bottom, GLfloat top,
                          GLfloat zNear, GLfloat zFar) {
    if (g_extraX > 1.0f && std::fabs(left) < 1.0f && std::fabs(right - 320.0f) < 1.0f) {
        left  -= g_extraX;
        right += g_extraX;
    }
    orig_glOrthof(left, right, bottom, top, zNear, zFar);
}

static void draw_wrap_margin_shading(float extra_x, float height) {
    GLboolean tex_enabled   = glIsEnabled(GL_TEXTURE_2D);
    GLboolean blend_enabled = glIsEnabled(GL_BLEND);

    glDisable(GL_TEXTURE_2D);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnableClientState(GL_VERTEX_ARRAY);
    glDisableClientState(GL_TEXTURE_COORD_ARRAY);

    // Subtle darkening on wrapped side panels so the active 0..320 playfield reads clearly
    hud_draw::draw_rect(-extra_x, 0.0f, extra_x, height, 0.0f, 0.0f, 0.0f, 0.14f);
    hud_draw::draw_rect(320.0f,   0.0f, extra_x, height, 0.0f, 0.0f, 0.0f, 0.14f);

    // Thin subtle seam lines at x = 0 and x = 320
    hud_draw::draw_rect(-0.75f,   0.0f, 1.5f, height, 0.0f, 0.0f, 0.0f, 0.22f);
    hud_draw::draw_rect(319.25f,  0.0f, 1.5f, height, 0.0f, 0.0f, 0.0f, 0.22f);

    glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    if (tex_enabled) glEnable(GL_TEXTURE_2D);
    if (!blend_enabled) glDisable(GL_BLEND);
    glBlendFunc(GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
}

static void hook_renderWorld(void* game) {
    if (g_extraX <= 1.0f) {
        orig_renderWorld(game);
        return;
    }

    static bool s_in_wrap = false;
    if (s_in_wrap) {
        orig_renderWorld(game);
        return;
    }

    s_in_wrap = true;
    glMatrixMode(GL_MODELVIEW);

    // Left wrapped copy (world shifted by -320)
    glPushMatrix();
    glTranslatef(-320.0f, 0.0f, 0.0f);
    orig_renderWorld(game);
    glPopMatrix();

    // Right wrapped copy (world shifted by +320)
    glPushMatrix();
    glTranslatef(320.0f, 0.0f, 0.0f);
    orig_renderWorld(game);
    glPopMatrix();

    // Subtle shading + wrap boundary guides on the side extensions
    float h = fn_getScreenHeight ? fn_getScreenHeight() : kFoldableTargetH;
    draw_wrap_margin_shading(g_extraX, h);

    // Center active world rendered last so the real Doodler & active playfield are always on top
    orig_renderWorld(game);

    s_in_wrap = false;
}

static bool patch_got_slot(uintptr_t got_addr, void* replacement, void** out_orig) {
    uintptr_t page_sz = static_cast<uintptr_t>(sysconf(_SC_PAGESIZE));
    if (page_sz < 4096) page_sz = 4096;
    uintptr_t page_start = got_addr & ~(page_sz - 1);

    if (mprotect(reinterpret_cast<void*>(page_start), page_sz, PROT_READ | PROT_WRITE) != 0) {
        return false;
    }
    auto** slot = reinterpret_cast<void**>(got_addr);
    *out_orig = *slot;
    *slot = replacement;
    mprotect(reinterpret_cast<void*>(page_start), page_sz, PROT_READ);
    return true;
}

// ============================================================================
// 6. Constructor: load libDoodleJump_orig.so & install enabled feature hooks
// ============================================================================
__attribute__((constructor))
static void djmod_init() {
    g_orig_handle = dlopen("libDoodleJump_orig.so", RTLD_NOW | RTLD_GLOBAL);
    if (!g_orig_handle) {
        LOGE("dlopen(libDoodleJump_orig.so) failed: %s", dlerror());
        return;
    }

    for (int i = 0; i < 12; ++i) {
        g_jni_ptrs[i] = dlsym(g_orig_handle, kJniNames[i]);
        if (!g_jni_ptrs[i]) {
            LOGE("dlsym(%s) failed", kJniNames[i]);
        }
    }

    if (!g_jni_ptrs[7]) {
        LOGE("Cannot compute libDoodleJump_orig.so base address");
        return;
    }

    g_base = reinterpret_cast<uintptr_t>(g_jni_ptrs[7]) - offsets::kRunGameLoopNative;
    LOGI("libDoodleJump_orig.so base=0x%lx cfg=(endless_fall=%u, foldable_view=%u)",
         static_cast<unsigned long>(g_base), g_mod_cfg.endless_fall, g_mod_cfg.foldable_view);

    fn_scrollWorld       = reinterpret_cast<ScrollWorldFn>(g_base + offsets::kScrollWorld);
    fn_recyclePlatform   = reinterpret_cast<RecyclePlatformFn>(g_base + offsets::kRecyclePlatform);
    fn_recycleBonus      = reinterpret_cast<RecyclePlatformFn>(g_base + offsets::kRecycleBonus);
    fn_recycleMonster    = reinterpret_cast<RecyclePlatformFn>(g_base + offsets::kRecycleMonster);
    fn_recycleUFO        = reinterpret_cast<RecyclePlatformFn>(g_base + offsets::kRecycleUFO);
    fn_platformReset     = reinterpret_cast<PlatformResetFn>(g_base + offsets::kPlatformReset);
    fn_platformSetType   = reinterpret_cast<PlatformSetTypeFn>(g_base + offsets::kPlatformSetType);
    fn_getScreenHeight   = reinterpret_cast<GetFloatFn>(g_base + offsets::kGetScreenHeight);
    fn_getTopInset       = reinterpret_cast<GetFloatFn>(g_base + offsets::kGetTopInset);
    fn_setAspectRatio    = reinterpret_cast<SetFloatFn>(g_base + offsets::kSetAspectRatio);
    fn_setLogicalWidth   = reinterpret_cast<SetFloatFn>(g_base + offsets::kSetLogicalWidth);
    fn_setLogicalHeight  = reinterpret_cast<SetFloatFn>(g_base + offsets::kSetLogicalHeight);
    fn_setScaleX         = reinterpret_cast<SetFloatFn>(g_base + offsets::kSetScaleX);
    fn_setScaleY         = reinterpret_cast<SetFloatFn>(g_base + offsets::kSetScaleY);

    bool ok = true;
    if (g_mod_cfg.endless_fall != 0) {
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kResetLevel),      hook_resetLevel,      &orig_resetLevel);
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kUpdateGameplay),  hook_updateGameplay,  &orig_updateGameplay);
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kCullOffscreen),   hook_cullOffscreen,   &orig_cullOffscreen);
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kCheckCollisions), hook_checkCollisions, &orig_checkCollisions);
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kRenderHUD),       hook_renderHUD,       &orig_renderHUD);
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kTriggerGameOver), hook_triggerGameOver, &orig_triggerGameOver);
    }

    if (g_mod_cfg.foldable_view != 0) {
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kSetupScreen),  hook_setupScreen,  &orig_setupScreen);
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kConvertTouch), hook_convertTouch, &orig_convertTouch);
        ok &= arm64_hook::install(reinterpret_cast<void*>(g_base + offsets::kRenderWorld),  hook_renderWorld,  &orig_renderWorld);
        ok &= patch_got_slot(g_base + offsets::kGotGlOrthof, reinterpret_cast<void*>(hook_glOrthof),
                             reinterpret_cast<void**>(&orig_glOrthof));
    }

    LOGI("DJMod hooks installed: %s", ok ? "ALL OK" : "SOME FAILED");
}
