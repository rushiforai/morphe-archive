#!/usr/bin/env python3
"""Read-only, bounded audit of TV360 smali call sites for optional ads/analytics.

Usage:
 python audit_tv360_hooks.py ~/tv360-audit/smali-audit ~/tv360-audit/tv360-hooks.txt
"""
from pathlib import Path
import re
import sys

if len(sys.argv) != 3:
    raise SystemExit("usage: audit_tv360_hooks.py SMALI_ROOT OUTPUT_TXT")
root = Path(sys.argv[1]).expanduser().resolve()
out = Path(sys.argv[2]).expanduser()
if not root.is_dir():
    raise SystemExit(f"missing smali root: {root}")
if not root.name.startswith("smali"):
    raise SystemExit("expected an apktool smali-audit root")
patterns = {
    "advertising": re.compile(
        r"(?i)(?:/|;|->)(?:[^\s]*)(?:admob|applovin|ironsource|unityads|"
        r"advertis|adview|adsdk|interstitial|rewardedad|bannerad|vast|ima/)"
    ),
    "telemetry": re.compile(
        r"(?i)(?:firebase/analytics|appsflyer|adjust/sdk|mixpanel|"
        r"amplitude|segment/analytics|logEvent\(|trackEvent\(|"
        r"analytics/|crashlytics)"
    ),
}
counts = {k: 0 for k in patterns}
lines = ["TV360 candidate references (not validated patch anchors)",
         "Source: local apktool smali; read-only", ""]
for file in sorted(root.rglob("*.smali")):
    try:
        text = file.read_text(encoding="utf-8", errors="replace").splitlines()
    except OSError:
        continue
    method = ""
    for n, line in enumerate(text, 1):
        stripped = line.strip()
        if stripped.startswith(".method "):
            method = stripped
        if not stripped.startswith(("invoke-", "new-instance ", "sget-", "iget-")):
            continue
        for group, pattern in patterns.items():
            if pattern.search(stripped):
                counts[group] += 1
                if counts[group] <= 120:
                    lines.append(f"[{group}] {file.relative_to(root)}:{n}")
                    lines.append(f"  {method}")
                    lines.append(f"  {stripped}")
                    lines.append("")
for group, count in counts.items():
    lines.append(f"{group}: {count} candidates (max 120 displayed)")
lines.append("Do not patch from keyword matches alone; verify ownership, method signatures,")
lines.append("call graph and whether each call is optional.")
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text("\n".join(lines) + "\n", encoding="utf-8")
print(f"Saved {out}")
print("APK modified: NO; compilation: NO")
