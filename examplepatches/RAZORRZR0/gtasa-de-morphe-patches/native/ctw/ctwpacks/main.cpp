// CTW Packs: loads texture and radio packs for GTA: Chinatown Wars 4.4.243 (arm64) from
// Android/data/com.rockstargames.gtactw/files/ (no files of the game are shipped):
//   DXT.bin          replaces the game's own texture-override file (assets/dxt.bin, read by InitDXTPatch/GetDXTData):
//                    the 3D world texture sheets.
//   CTWHD.bin        HD versions of game.pak textures, served through TryDXTSize/GetDXTData. Each entry is a game
//                    resource: 12-byte header with the ORIGINAL size and format 0xBEEF (PNG) + a bigger PNG; the game
//                    uploads a PNG at its decoded size but lays 2D art out by the header size, so layouts stay intact.
//   radio/<asset>    replaces the APK asset of that name, e.g. radio1.mp3 (mono 44.1 kHz CBR mp3 without ID3 tags) or
//                    ss_radio.png (station logos of the car radio, 2048x512 for the 1024x256 original).
//   radio/radio_menu.png  station logos of the pause menu (game.pak texture 2861, 1024x256, same layout; may be 2x).
//   radio/names.txt  "0xe0=Name" lines: replaces entries of the game's text table (E_MAIN.gxt), e.g. station names.
// Pack formats and builders: tools/ctw/ in the patches repo.
#include <mod/amlmod.h>
#include <mod/logger.h>

#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <string>
#include <vector>
#include <unordered_map>

bool registerRadioConverter(JNIEnv* env);  // radio.cpp

MYMOD(net.razorrzr0.ctwpacks, CTW Packs, 1.0, RAZORRZR0)
NEEDGAME(com.rockstargames.gtactw)

static std::string gDir;             // Android/data/<pkg>/files/
static std::string gDxt;             // gDir + "DXT.bin" when present
static bool gRadio;                  // gDir + "radio/" exists
static uintptr_t gLib;
struct Entry { uint32_t off, size; const uint8_t* mem; };  // mem: served from memory instead of CTWHD.bin
static std::unordered_map<uint32_t, Entry> gHd;  // CTWHD.bin index and radio_menu.png
static std::vector<uint8_t> gMenuLogos;
static int gHdFd = -1;
static std::vector<std::pair<uint32_t, std::u16string>> gNames;

static bool readable(const std::string& p) { return access(p.c_str(), R_OK) == 0; }

// Radio override for an asset name, or empty. Names arrive as the game normalised them (lower case, no folder).
static std::string radioFile(const char* name)
{
    if (!gRadio || !name) return {};
    const char* base = strrchr(name, '/');
    std::string p = gDir + "radio/" + (base ? base + 1 : name);
    for (size_t i = gDir.size() + 6; i < p.size(); i++) p[i] = (char)tolower((unsigned char)p[i]);
    return readable(p) ? p : std::string();
}

// Every game asset open goes through NvFOpen: APK asset first, then plain fopen, so an absolute path loads our file.
DECL_HOOKp(NvFOpen, const char* name)
{
    if (name) {
        size_t n = strlen(name);
        if (!gDxt.empty() && n >= 7 && strcasecmp(name + n - 7, "dxt.bin") == 0) return NvFOpen(gDxt.c_str());
        std::string p = radioFile(name);
        if (!p.empty()) return NvFOpen(p.c_str());
    }
    return NvFOpen(name);
}

// TryDXTSize is a 16-byte leaf (a table read), so the original is read directly instead of called through a trampoline.
DECL_HOOK(uint32_t, TryDXTSize, uint32_t id)
{
    auto e = gHd.find(id);
    if (e != gHd.end()) return e->second.size;
    return id < 0x2000 ? ((uint32_t*)(gLib + 0x10af178))[id] : 0;
}

// The game sizes the resource buffer with TryDXTSize, then copies GetDXTData's malloc'd block into it and frees it.
// Callers pass that buffer size in *size; serve ours only when it matches, so a payload can never overflow a buffer.
DECL_HOOKp(GetDXTData, uint32_t id, uint32_t* size)
{
    auto e = gHd.find(id);
    if (e == gHd.end() || !size || *size != e->second.size) return GetDXTData(id, size);
    void* buf = malloc(e->second.size);
    if (!buf) return GetDXTData(id, size);
    if (e->second.mem) memcpy(buf, e->second.mem, e->second.size);
    else if (pread(gHdFd, buf, e->second.size, e->second.off) != (ssize_t)e->second.size) {
        free(buf);
        return GetDXTData(id, size);
    }
    return buf;
}

// Station names: point the loaded text table's entries at our strings after each (re)load (start, language change).
static void* (*GlobalText)();
DECL_HOOKv(InitGlobalText, const char* file)
{
    InitGlobalText(file);
    uint8_t* gxt = GlobalText ? (uint8_t*)GlobalText() : nullptr;  // cGXTFile: u32 count, @8 char16_t* strings[count]
    if (!gxt) return;
    uint32_t count = *(uint32_t*)gxt;
    char16_t** table = *(char16_t***)(gxt + 8);
    if (!table) return;
    for (auto& n : gNames) if (n.first < count) table[n.first] = (char16_t*)n.second.c_str();
}

static void loadHdIndex()
{
    std::string p = gDir + "CTWHD.bin";
    gHdFd = open(p.c_str(), O_RDONLY);
    if (gHdFd < 0) return;
    uint32_t count = 0;
    if (pread(gHdFd, &count, 4, 0) != 4 || count > 100000) { close(gHdFd); gHdFd = -1; return; }
    std::vector<uint32_t> tab(count * 3);
    if (pread(gHdFd, tab.data(), count * 12, 4) != (ssize_t)(count * 12)) { close(gHdFd); gHdFd = -1; return; }
    for (uint32_t i = 0; i < count; i++) gHd[tab[i * 3]] = {tab[i * 3 + 1], tab[i * 3 + 2], nullptr};
}

// Pause-menu station logos: a game resource of 12-byte header (original 1024x256, 0xBEEF = PNG, 32 bpp) + the PNG.
static void loadMenuLogos()
{
    FILE* f = fopen((gDir + "radio/radio_menu.png").c_str(), "rb");
    if (!f) return;
    std::vector<uint8_t> png;
    uint8_t chunk[65536];
    for (size_t n; (n = fread(chunk, 1, sizeof chunk, f)) > 0;) png.insert(png.end(), chunk, chunk + n);
    fclose(f);
    uint32_t len = (uint32_t)png.size();
    uint8_t hdr[12] = {0x00, 0x04, 0x00, 0x01, 0xef, 0xbe, 32, 1};
    memcpy(hdr + 8, &len, 4);
    gMenuLogos.assign(hdr, hdr + 12);
    gMenuLogos.insert(gMenuLogos.end(), png.begin(), png.end());
    gHd[2861] = {0, (uint32_t)gMenuLogos.size(), gMenuLogos.data()};
}

// "0xe0=Name" per line (UTF-8) -> UTF-16 strings kept for the whole session.
static void loadNames()
{
    FILE* f = fopen((gDir + "radio/names.txt").c_str(), "rb");
    if (!f) return;
    char line[512];
    while (fgets(line, sizeof line, f)) {
        char* eq = strchr(line, '=');
        if (!eq) continue;
        *eq = 0;
        uint32_t idx = (uint32_t)strtoul(line, nullptr, 0);
        std::u16string s;
        for (unsigned char* c = (unsigned char*)eq + 1; *c && *c != '\n' && *c != '\r';) {  // UTF-8 (BMP) -> UTF-16
            uint32_t cp = *c++;
            if (cp >= 0xE0 && c[0] && c[1]) { cp = ((cp & 0x0F) << 12) | ((c[0] & 0x3F) << 6) | (c[1] & 0x3F); c += 2; }
            else if (cp >= 0xC0 && c[0]) { cp = ((cp & 0x1F) << 6) | (c[0] & 0x3F); c += 1; }
            s += (char16_t)cp;
        }
        gNames.emplace_back(idx, s);
    }
    fclose(f);
}

extern "C" void OnModLoad()
{
    logger->SetTag("CTW Packs");
    if (!registerRadioConverter(aml->GetJNIEnvironment())) logger->Error("radio converter not registered");
    gLib = aml->GetLib("libGame.so");
    void* h = aml->GetLibHandle("libGame.so");
    if (!gLib || !h) { logger->Error("libGame.so not loaded"); return; }
    gDir = std::string(aml->GetAndroidDataPath()) + "/";

    if (readable(gDir + "DXT.bin")) gDxt = gDir + "DXT.bin";
    struct stat st;
    gRadio = stat((gDir + "radio").c_str(), &st) == 0 && S_ISDIR(st.st_mode);
    loadHdIndex();
    loadMenuLogos();
    loadNames();

    // Another game version may lack a symbol: that part is then skipped instead of hooking address 0.
    uintptr_t open = aml->GetSym(h, "_Z7NvFOpenPKc"), size = aml->GetSym(h, "_Z10TryDXTSizej"),
              data = aml->GetSym(h, "_Z10GetDXTDatajPj"), init = aml->GetSym(h, "_Z14InitGlobalTextPKc");
    GlobalText = (void* (*)())aml->GetSym(h, "_Z10GlobalTextv");
    if ((!gDxt.empty() || gRadio) && open) HOOK(NvFOpen, open);
    if (!gHd.empty() && size && data) { HOOK(TryDXTSize, size); HOOK(GetDXTData, data); }
    if (!gNames.empty() && init && GlobalText) HOOK(InitGlobalText, init);
    logger->Info("DXT.bin %s, %zu HD textures, radio folder %s, %zu names, menu logos %s",
                 gDxt.empty() ? "absent" : "loaded", gHd.size(), gRadio ? "found" : "absent", gNames.size(),
                 gMenuLogos.empty() ? "absent" : "loaded");
}
