// CTW Mod Menu backend for GTA: Chinatown Wars 4.4.243 (arm64). The menu itself (WebView panel and MOD button) is
// the Java class ctw.menu.Menu in the patches' extension; it calls these natives, which queue game actions that run on
// the game thread from cPlayer::ProcessAlways (once per frame). Addresses: libGame.so 4.4.243 symbols and globals.
#include <mod/amlmod.h>
#include <mod/logger.h>

#include <jni.h>
#include <array>
#include <atomic>
#include <deque>
#include <functional>
#include <memory>
#include <mutex>
#include <string>
#include <vector>
#include <unordered_map>

MYMOD(net.razorrzr0.ctwmenu, CTW Mod Menu, 1.0, RAZORRZR0)
NEEDGAME(com.rockstargames.gtactw)

struct V3 { int32_t x, y, z; };                  // tv3d<cFixed<20,12>>: 4096 = 1 m
struct VehRet { void *a, *b, *c; };               // Vehicle (24 bytes), returned through x8
static uintptr_t gLib, gEnd;
static void* gPlayer;                              // cPlayer*, set on the game thread

// libGame functions
static void (*HealthCheat)(uint32_t), (*ArmourCheat)(uint32_t), (*MoneyCheat)(uint32_t), (*DrugsCheat)(uint32_t);
static void (*WeaponCheat)(uint32_t, uint32_t), (*WantedCheat)(uint32_t, bool), (*ForceWeather)(uint32_t);
static void (*FastClock)(), (*ToggleAttractor)();
static void (*LoadType)(void* vt, uint32_t id);
static VehRet (*CreateVehicle)(void* world, void* vt, uint32_t player, uint32_t pedType, uint32_t pedSub);
static void (*SetPosition)(void* entity, const V3* pos, bool, bool);
static void (*EntityDtor)(void* entity);
static void* (*GetWeaponInfo)(int type);
static void* (*VehicleOf)(void* ped);
static void (*Repair)(void* veh, int level);
static int (*WantedLevel)(void* rating);
static void (*FailNoCrime)(void* wanted);
static void (*SetWanted)(void* wanted, int level, bool, bool);
static bool (*GiveWeapon)(void* player, int type, int ammo, bool);
static void (*GiveMoney)(void* player, uint32_t amount);
static void (*SetTime)(void* timeCycle, const int32_t* fixed, bool);
static void (*ScriptPlayerCtor)(void* sp, void* player);
static void (*WarpTo)(void* sp, const V3* pos, bool, bool);
static void (*WarpInto)(void* sp, void* vehicle, int seat, bool);
static void (*VehicleCtor)(void* v, void* cveh);
static void (*SetDensity[3])(void* world, int value, uint32_t player);  // Car, Ped, Cop
static const int kDensityOff[3] = {0x3ee, 0x3c5, 0x3da};                  // byte in cPlayer each setter writes

// libGame globals: GOT slots holding the object addresses
static void* global(uintptr_t slot) { return *(void**)(gLib + slot); }
static void* World() { return global(0xdcef20); }
static void* TimeCycle() { return global(0xdce850); }
static uint8_t* MapState() { return (uint8_t*)global(0xdcedf8); }    // +0xa90/+0xa94 waypoint x,y; +0xab9 set
static uint8_t* VehicleInfo() { return (uint8_t*)global(0xdce750); } // +0x20 count, +0x28 0x138-byte entries

template <class T> static T& at(void* p, uintptr_t off) { return *(T*)((uint8_t*)p + off); }

// Toggles (set from the UI thread, read on the game thread)
enum { GOD, AMMO, CARGOD, NOWANTED, ONEHIT, FREEZE, WARP, NTOGGLES };
static std::atomic<bool> gOn[NTOGGLES];
static const char* kToggle[NTOGGLES] = {"god", "ammo", "carGod", "noWanted", "oneHit", "freeze", "warp"};

// Game-thread work: actions from the UI plus delayed steps (car streaming)
static std::mutex gLock;
static std::deque<std::function<void()>> gQueue;
static void run(std::function<void()> f) { std::lock_guard<std::mutex> l(gLock); gQueue.push_back(std::move(f)); }

static uint8_t gScriptPlayer[0x40];
static bool gScriptPlayerReady;
static void* ScriptPlayer()  // script-level Ped wrapper for the player
{
    if (!gScriptPlayerReady) { ScriptPlayerCtor(gScriptPlayer, gPlayer); gScriptPlayerReady = true; }
    return gScriptPlayer;
}

static V3 Here() { return {at<int32_t>(gPlayer, 0x50), at<int32_t>(gPlayer, 0x54), at<int32_t>(gPlayer, 0x58)}; }

static void Teleport(V3 p)  // the player, or the car they are in
{
    void* veh = VehicleOf(gPlayer);
    if (!veh) { WarpTo(ScriptPlayer(), &p, false, false); return; }
    uint8_t v[24];
    VehicleCtor(v, veh);
    SetPosition(v, &p, true, false);
    EntityDtor(v);
}

static void SpawnCar(uint32_t id)
{
    auto vt = std::make_shared<std::array<uint32_t, 2>>(std::array<uint32_t, 2>{0, 0xffff});  // VehicleType
    LoadType(vt->data(), id);
    auto frames = std::make_shared<int>(60);  // ~2 s for the model to stream in
    auto tick = std::make_shared<std::function<void()>>();
    *tick = [vt, frames, tick, id]() {
        if (--*frames > 0) { run(*tick); return; }
        VehRet r = CreateVehicle(World(), vt->data(), 0, 0, 0);
        if (!r.b) { logger->Error("spawn failed for vehicle %u", id); *tick = nullptr; return; }
        void* v[3] = {r.a, r.b, r.c};
        bool onFoot = VehicleOf(gPlayer) == nullptr;
        V3 p = Here();
        p.x += 5 * 4096;  // 5 m away
        SetPosition(v, &p, true, false);
        if (gOn[WARP] && onFoot) WarpInto(ScriptPlayer(), v, 0, false);  // seat 0 = driver
        EntityDtor(v);
        *tick = nullptr;  // break the self-reference
    };
    run(*tick);
}

// Density: step 0 off, 1 the value the game had when first changed, 2 three times that.
static int gDensityNormal[3] = {-1, -1, -1};
static void Density(int kind, int step)
{
    if (gDensityNormal[kind] < 0) gDensityNormal[kind] = at<uint8_t>(gPlayer, kDensityOff[kind]);
    int n = gDensityNormal[kind];
    SetDensity[kind](World(), step == 0 ? 0 : step == 1 ? n : std::min(255, n * 3), 0);
}

// Infinite ammo: top up every weapon in the player's cWeaponManager (+0x20 slot table).
// cWeapon: +0x14 s16 ammo, +0x16 u8 clip; vtable +0x48 Ammo() (-1 = melee), +0x38 Type().
static std::unordered_map<void*, uint8_t> gClipMax;
static int vcall(void* w, uintptr_t off) { return (*(int (**)(void*))(*(uint8_t**)w + off))(w); }
static void Refill(uint8_t* mgr)
{
    for (int s = 0; s < 12; s++) {
        void* w = *(void**)(mgr + 0x20 + s * 8);
        if (!w) continue;
        uintptr_t vt = *(uintptr_t*)w;
        if (vt < gLib || vt >= gEnd || vcall(w, 0x48) == -1) continue;
        void* info = GetWeaponInfo(vcall(w, 0x38));
        int max = info ? at<int32_t>(info, 4) : 0;
        if (max > 0) at<int16_t>(w, 0x14) = (int16_t)std::min(max, 32767);
        uint8_t& top = gClipMax[w];
        top = std::max(top, at<uint8_t>(w, 0x16));
        if (top) at<uint8_t>(w, 0x16) = top;
    }
}

static void Act(const std::string& id, int arg)
{
    if (id == "health") HealthCheat(0);
    else if (id == "armour") ArmourCheat(0);
    else if (id == "wup") WantedCheat(0, true);
    else if (id == "wdown") WantedCheat(0, false);
    else if (id == "wclear") for (int i = 0; i < 6; i++) WantedCheat(0, false);
    else if (id == "m10k") MoneyCheat(0);
    else if (id == "money") GiveMoney(gPlayer, (uint32_t)arg);
    else if (id == "drugs") DrugsCheat(0);
    else if (id == "nitro") {
        void* v = VehicleOf(gPlayer);
        if (v) for (uintptr_t o : {0xb8, 0xbc}) at<int32_t>(v, o) *= 2;  // cSimpleMover velocity x,y
    }
    else if (id == "car") SpawnCar((uint32_t)arg);
    else if (id == "set") WeaponCheat(0, (uint32_t)arg);
    else if (id == "eagle") at<uint8_t>(gPlayer, 0x1e5) ^= 1;  // the game's explosive-pistol cheat flag
    else if (id == "gun") GiveWeapon(gPlayer, arg, 999, true);
    else if (id == "density") Density(arg / 3, arg % 3);
    else if (id == "fast") FastClock();
    else if (id == "attr") ToggleAttractor();
    else if (id == "hour") { int32_t t = arg * 4096; SetTime(TimeCycle(), &t, true); }
    else if (id == "weather") ForceWeather((uint32_t)arg);
    else if (id == "tpw") {
        uint8_t* m = MapState();
        if (m && m[0xab9]) Teleport({at<int32_t>(m, 0xa90), at<int32_t>(m, 0xa94), Here().z});  // waypoint has no height
    }
}

static V3 gSaved;
static bool gHaveSaved;

// Game thread, once per frame
DECL_HOOKv(ProcessAlways, void* player)
{
    gPlayer = player;
    if (gOn[GOD]) { at<uint8_t>(player, 0x1189) = 1; at<uint8_t>(player, 0x1264) = 1; }
    if (gOn[AMMO]) Refill((uint8_t*)player + 0x160);
    if (gOn[CARGOD]) { void* v = VehicleOf(player); if (v) Repair(v, 0); }
    if (gOn[NOWANTED]) {
        void* w = (uint8_t*)player + 0x400;
        if (WantedLevel(w) > 0) { FailNoCrime(w); SetWanted(w, 0, false, false); }
    }
    std::deque<std::function<void()>> work;
    { std::lock_guard<std::mutex> l(gLock); work.swap(gQueue); }
    for (auto& f : work) f();
    ProcessAlways(player);
}

// One-hit kills: any ped other than the player loses all health from any hit.
// shortcut: also applies to NPC-vs-NPC damage, not only damage dealt by the player.
DECL_HOOKv(ReduceHealth, void* ped, uint32_t amount)
{
    ReduceHealth(ped, gOn[ONEHIT] && gPlayer && ped != gPlayer ? 255 : amount);
}

// Freeze: skip the world clock and every on-screen mission counter (Gui::cCounter) while frozen.
DECL_HOOKv(AdvanceTime, void* tc, int32_t dt) { if (!gOn[FREEZE]) AdvanceTime(tc, dt); }
DECL_HOOKv(CounterProcess, void* counter) { if (!gOn[FREEZE]) CounterProcess(counter); }

// JNI: ctw.menu.Menu
static void JNICALL nToggle(JNIEnv* env, jclass, jstring key, jboolean on)
{
    const char* k = env->GetStringUTFChars(key, nullptr);
    for (int i = 0; i < NTOGGLES; i++) if (!strcmp(k, kToggle[i])) gOn[i] = on;
    if (!strcmp(k, "god") && !on) run([] { at<uint8_t>(gPlayer, 0x1189) = 0; at<uint8_t>(gPlayer, 0x1264) = 0; });
    env->ReleaseStringUTFChars(key, k);
}

static void JNICALL nAction(JNIEnv* env, jclass, jstring id, jint arg)
{
    const char* s = env->GetStringUTFChars(id, nullptr);
    std::string a(s);
    env->ReleaseStringUTFChars(id, s);
    if (a == "tps") run([] { gSaved = Here(); gHaveSaved = true; });
    else if (a == "tpl") run([] { if (gHaveSaved) Teleport(gSaved); });
    else run([a, arg] { if (gPlayer) Act(a, arg); });
}

// Vehicle class per eVehicleId (u16 at the start of each cVehicleInfo): 0 car, 1 bike, 2 boat, 4 heli, 5 tank.
static jintArray JNICALL nVehicleClasses(JNIEnv* env, jclass)
{
    uint8_t* mgr = VehicleInfo();
    int n = mgr ? std::min(at<int32_t>(mgr, 0x20), 512) : 0;
    jintArray out = env->NewIntArray(n);
    if (n > 0) {
        uint8_t* t = at<uint8_t*>(mgr, 0x28);
        std::vector<jint> c(n);
        for (int i = 0; i < n; i++) c[i] = *(uint16_t*)(t + i * 0x138);
        env->SetIntArrayRegion(out, 0, n, c.data());
    }
    return out;
}

template <class F> static int sym(void* h, F& f, const char* name)  // int: & below logs every missing one
{
    f = (F)aml->GetSym(h, name);
    if (!f) logger->Error("missing %s", name);
    return f != nullptr ? 1 : 0;
}

extern "C" void OnModLoad()
{
    logger->SetTag("CTW Mod Menu");
    void* h = aml->GetLibHandle("libGame.so");
    gLib = aml->GetLib("libGame.so");
    if (!h || !gLib) { logger->Error("libGame.so not loaded"); return; }
    gEnd = gLib + aml->GetLibLength("libGame.so");
    gOn[WARP] = true;

    int ok = sym(h, HealthCheat, "_Z11HealthCheatj") & sym(h, ArmourCheat, "_Z11ArmourCheatj") &
        sym(h, MoneyCheat, "_Z10MoneyCheatj") & sym(h, DrugsCheat, "_Z10DrugsCheatj") &
        sym(h, WeaponCheat, "_Z11WeaponCheatjj") & sym(h, WantedCheat, "_Z11WantedCheatjb") &
        sym(h, ForceWeather, "_Z12ForceWeather12eWeatherType") & sym(h, FastClock, "_Z9FastClockv") &
        sym(h, ToggleAttractor, "_Z20ToggleAttractorCheatv") & sym(h, LoadType, "_ZN11VehicleType4LoadE10eVehicleId") &
        sym(h, CreateVehicle, "_ZNK9WorldImpl13CreateVehicleERK11VehicleType9ePlayerId8ePedType11ePedSubType") &
        sym(h, SetPosition, "_ZNK6Entity11SetPositionERK4tv3dI6cFixedILj20ELj12EEEbb") &
        sym(h, EntityDtor, "_ZN6EntityD2Ev") & sym(h, GetWeaponInfo, "_ZN11cWeaponInfo13GetWeaponInfoE11eWeaponType") &
        sym(h, VehicleOf, "_ZNK4cPed7VehicleEv") & sym(h, Repair, "_ZN8cVehicle6RepairE19eVehicleRepairLevel") &
        sym(h, WantedLevel, "_ZNK13cWantedRating11WantedLevelEv") &
        sym(h, FailNoCrime, "_ZN14cWantedManager19FailAnyNoCrimeStateEv") &
        sym(h, SetWanted, "_ZN14cWantedManager8SetLevelE12eWantedLevelbb") &
        sym(h, GiveWeapon, "_ZN7cPlayer10GiveWeaponE11eWeaponTypeib") & sym(h, GiveMoney, "_ZN7cPlayer9GiveMoneyEj") &
        sym(h, SetTime, "_ZN10cTimeCycle7SetTimeE6cFixedILj20ELj12EEb") &
        sym(h, ScriptPlayerCtor, "_ZN12ScriptPlayerC1ER7cPlayer") &
        sym(h, WarpTo, "_ZNK3Ped14WarpToPositionERK4tv3dI6cFixedILj20ELj12EEEbb") &
        sym(h, WarpInto, "_ZNK3Ped15WarpIntoVehicleE7Vehicle4Seatb") & sym(h, VehicleCtor, "_ZN7VehicleC1ER8cVehicle") &
        sym(h, SetDensity[0], "_ZNK9WorldImpl13SetCarDensityEi9ePlayerId") &
        sym(h, SetDensity[1], "_ZNK9WorldImpl13SetPedDensityEi9ePlayerId") &
        sym(h, SetDensity[2], "_ZNK9WorldImpl13SetCopDensityEi9ePlayerId");
    if (!ok) { logger->Error("unsupported game version: menu disabled"); return; }

    HOOK(ProcessAlways, aml->GetSym(h, "_ZN7cPlayer13ProcessAlwaysEv"));
    HOOK(ReduceHealth, aml->GetSym(h, "_ZN4cPed12ReduceHealthEj"));
    HOOK(AdvanceTime, aml->GetSym(h, "_ZN10cTimeCycle11AdvanceTimeE6cFixedILj20ELj12EE"));
    HOOK(CounterProcess, aml->GetSym(h, "_ZN3Gui8cCounter7ProcessEv"));

    // The UI class comes from the app's class loader; this runs on the thread that loaded AML (GameNative's static init).
    JNIEnv* env = aml->GetJNIEnvironment();
    jclass menu = env ? env->FindClass("ctw/menu/Menu") : nullptr;
    if (!menu) { if (env) env->ExceptionClear(); logger->Error("ctw.menu.Menu not found"); return; }
    static const JNINativeMethod methods[] = {
        {"nativeToggle", "(Ljava/lang/String;Z)V", (void*)nToggle},
        {"nativeAction", "(Ljava/lang/String;I)V", (void*)nAction},
        {"nativeVehicleClasses", "()[I", (void*)nVehicleClasses},
    };
    if (env->RegisterNatives(menu, methods, 3) != JNI_OK) { env->ExceptionClear(); logger->Error("RegisterNatives failed"); }
    logger->Info("ready");
}
