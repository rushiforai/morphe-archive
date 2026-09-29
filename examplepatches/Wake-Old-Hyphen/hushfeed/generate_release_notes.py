#!/usr/bin/env python3
import json, yaml, os, glob

HF = os.environ.get("HUSHFEED_VERSION", "unknown")
N64 = os.environ.get("NAI64_VERSION", "unknown")

with open("build/options.json") as f:
    options = json.load(f)
with open("Nai64ExtraPatches_Options.yaml") as f:
    cfg = yaml.safe_load(f) or {}

notes = {p["name"].lower(): p.get("note", "") for p in cfg.get("patches", [])}

def fmt_opts(data):
    out = []
    for k, v in (data.get("options") or {}).items():
        val = v.get("value") if isinstance(v, dict) else v
        if val in (None, ""): continue
        out.append(f"{k}={val}")
    return ", ".join(out)

hf = options[0]["patches"] if len(options) > 0 else {}
n64 = options[1]["patches"] if len(options) > 1 else {}

hf_on = sorted(n for n, d in hf.items() if d.get("enabled"))
hf_off = sorted(n for n, d in hf.items() if not d.get("enabled"))
n64_on = sorted(n for n, d in n64.items() if d.get("enabled"))
n64_off = sorted(n for n, d in n64.items() if not d.get("enabled"))

versions = sorted([f.replace("build/permissions-", "").replace(".json", "") for f in glob.glob("build/permissions-*.json")])
version_str = ", ".join(versions)

changelog = ""
if os.path.exists("build/hushfeed_changelog.txt"):
    with open("build/hushfeed_changelog.txt") as f:
        changelog = f.read().strip()

L = []
L.append(f"# TikTok Privacy Build ({version_str})")
L.append("")
L.append("Automated privacy-hardened builds.")
L.append("")
L.append(f"- Hushfeed {HF} (includes AMOLED dark-theme fix)")
L.append(f"- Nai64 Extra Patches {N64}")
L.append("- Static manifest permission stripping")
L.append("- arm64-v8a only (32-bit libraries stripped)")
L.append("")
L.append("Base APKs: `stock-tiktok-apk` release, Wake-Old-Hyphen/PAB")
L.append("")
L.append("## Patches")
L.append("")
L.append("<details>")
L.append(f"<summary>Hushfeed patches ({len(hf_on)}/{len(hf)} enabled)</summary>")
L.append("")
L.append("Enabled:")
L.extend(f"- {n}" for n in hf_on)
if hf_off:
    L.append("")
    L.append("Disabled:")
    L.extend(f"- {n}" for n in hf_off)
L.append("")
L.append("</details>")
L.append("")
L.append("<details>")
L.append(f"<summary>Nai64 Extra Patches ({len(n64_on)}/{len(n64)} enabled)</summary>")
L.append("")
L.append("Enabled:")
for n in n64_on:
    extra = fmt_opts(n64[n])
    L.append(f"- {n}" + (f" ({extra})" if extra else ""))
if n64_off:
    L.append("")
    L.append("Disabled (yielded to Hushfeed):")
    for n in n64_off:
        note = notes.get(n.lower(), "")
        L.append(f"- {n}" + (f" — {note}" if note else ""))
L.append("")
L.append("</details>")
L.append("")
L.append("## Permissions")
L.append("")

for v in versions:
    L.append(f"### TikTok {v}")
    L.append("")
    with open(f"build/permissions-{v}.json") as f:
        perm = json.load(f)
    
    L.append("<details>")
    L.append(f"<summary>Removed permissions ({len(perm['removed'])})</summary>")
    L.append("")
    L.extend(f"- {p}" for p in perm["removed"])
    L.append("")
    L.append("</details>")
    L.append("")
    L.append("<details>")
    L.append(f"<summary>Kept permissions ({len(perm['kept'])})</summary>")
    L.append("")
    L.extend(f"{i}. {p}" for i, p in enumerate(perm["kept"], 1))
    L.append("")
    L.append("</details>")
    L.append("")

L.append("## Changelog since previous build")
L.append("")
if changelog:
    lines = changelog.splitlines()
    L.extend(f"- {x}" for x in lines[:50])
    if len(lines) > 50:
        L.append(f"- ...and {len(lines) - 50} more commits")
else:
    L.append("No new upstream Hushfeed commits since the previous build.")
L.append("")
L.append("## Build information")
L.append("")
L.append("| Item | Value |")
L.append("|---|---|")
L.append(f"| TikTok versions | {version_str} |")
L.append("| Architecture | arm64-v8a |")
L.append(f"| Hushfeed | {HF} |")
L.append(f"| Nai64 | {N64} |")
L.append("")
L.append("## Installation note")
L.append("")
L.append("These builds are signed with a custom keystore. Uninstall any existing TikTok "
         "(stock or previously patched) before first install; subsequent updates from "
         "this workflow install in place.")
L.append("")

with open("build/release_notes.md", "w") as f:
    f.write("\n".join(L))
print("✅ release_notes.md generated")