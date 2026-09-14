"""Read-only exact-base renderer/ownership audit; writes reports below build/."""
import hashlib
import io
import json
from pathlib import Path
import sys
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "build/oled-native-audit/python"))
from elftools.elf.elffile import ELFFile
from capstone import Cs, CS_ARCH_ARM64, CS_MODE_ARM

BASES = [
    ("2.0.20", "5001712", 2221072, "80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495", 0x13562c, 0x10ad18, 0xf1af4, 0x1385f8, 0x1386ac),
    ("2.0.22", "5002322", 2283400, "e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f", 0x13a1c8, 0x10bf38, 0xf0d70, 0x13dafc, 0x13dbb0),
]
FUNCTIONS = [
    "_Z18XRQCreateSwapchainRK10XRQContextRK16XRQSwapchainInfoR12XRQSwapchain",
    "_ZN14QSVLRendererXR9FlipFrameERK10XRQContextPll",
    "_ZN18SRGBCorrectionPass14RenderSpecificEibj",
    "_ZN28XRQAcquireSwapchainImageRAIIC1ERK12XRQSwapchain",
    "_ZN28XRQAcquireSwapchainImageRAIID1Ev",
]
out = ROOT / "build/surface-video-audit"
out.mkdir(exist_ok=True)
results = []
for version, code, size, digest, *addresses in BASES:
    base = ROOT / f"decoded-apk-android-steamlinkvr-release-base-{version}-{code}"
    path = base / "lib/arm64-v8a/libvrlink_scene.so"
    data = path.read_bytes()
    assert len(data) == size and hashlib.sha256(data).hexdigest() == digest
    manifest = ET.parse(base / "AndroidManifest.xml").getroot()
    assert manifest.attrib["package"] == "com.valvesoftware.steamlinkvr"
    android = "{http://schemas.android.com/apk/res/android}"
    activities = [e.attrib.get(android + "name") for e in manifest.findall("application/activity")]
    config = base / "assets/config/hmd_config.json"
    elf = ELFFile(io.BytesIO(data))
    syms = list(elf.get_section_by_name(".dynsym").iter_symbols())
    named = {s.name:s for s in syms}
    names = {s["st_value"]:s.name for s in syms if s["st_value"]}
    plt = elf.get_section_by_name(".plt")
    for i,r in enumerate(elf.get_section_by_name(".rela.plt").iter_relocations()):
        names[plt["sh_addr"]+32+i*16] = syms[r["r_info_sym"]].name
    def offset(va):
        return next(va-s["p_vaddr"]+s["p_offset"] for s in elf.iter_segments()
                    if s["p_type"]=="PT_LOAD" and s["p_vaddr"]<=va<s["p_vaddr"]+s["p_filesz"])
    details, lines = {}, []
    for name, va in zip(FUNCTIONS, addresses):
        s=named[name];assert s["st_value"]==va
        raw=data[offset(va):offset(va)+s["st_size"]]
        instructions=list(Cs(CS_ARCH_ARM64,CS_MODE_ARM).disasm(raw,va))
        calls=[]
        lines.append(f"\n{name} @{va:#x}")
        for ins in instructions:
            target=names.get(int(ins.op_str[1:],16),"") if ins.mnemonic in ("b","bl") and ins.op_str.startswith("#0x") else ""
            lines.append(f"{ins.address:#x} {ins.mnemonic} {ins.op_str} {target}")
            if target: calls.append({"address":hex(ins.address),"target":target})
        details[name]={"va":hex(va),"offset":hex(offset(va)),"size":s["st_size"],"sha256":hashlib.sha256(raw).hexdigest(),"calls":calls}
    def calls(n):return [c["target"] for c in details[FUNCTIONS[n]]["calls"]]
    assert "xrCreateSwapchain" in calls(0) and "xrEnumerateSwapchainImages" in calls(0)
    assert "glFramebufferTexture2D" in calls(2) and "glDrawArrays" in calls(2)
    assert calls(3).index("xrAcquireSwapchainImage") < calls(3).index("xrWaitSwapchainImage")
    assert "xrReleaseSwapchainImage" in calls(4)
    flip=calls(1)
    assert FUNCTIONS[3] in flip and FUNCTIONS[2] in flip and FUNCTIONS[4] in flip
    # The production creation wrapper requests sampled + colour attachment (0x21).
    assert any("mov w9, #0x21" in line for line in lines)
    assert b"color.a = pow(" in data # Valve synthesizes foveal alpha; preserve rendered RGBA.
    (out / f"{code}-verified-renderer.txt").write_text("\n".join(lines))
    results.append({"version":version,"code":code,"size":size,"sha256":digest,
        "activities":activities,"manifestSha256":hashlib.sha256((base/"AndroidManifest.xml").read_bytes()).hexdigest(),
        "hmdConfigSha256":hashlib.sha256(config.read_bytes()).hexdigest(),"functions":details,
        "scope":"Static exact-native caller trace. DEX/native/config preservation checked separately on patched fixture APKs."})
    assert hashlib.sha256(path.read_bytes()).hexdigest()==digest
(out / "verified-bases.json").write_text(json.dumps(results,indent=2))
print("PASS 2 exact ELF layouts, 10 symbol bodies, renderer/acquire/wait/release calls, sampled usage, foveal alpha, original files unchanged")
