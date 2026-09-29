#!/usr/bin/env python3
import json, yaml, re

def norm(s): return re.sub(r"[^a-z0-9]", "", (s or "").lower())

with open("build/options.json") as f:
    options = json.load(f)
with open("Nai64ExtraPatches_Options.yaml") as f:
    cfg = yaml.safe_load(f) or {}

requested = {p["name"].lower(): p for p in cfg.get("patches", [])}
disabled_hushfeed = {norm(x) for x in cfg.get("hushfeed_disabled", [])}

for i, bundle in enumerate(options):
    pd = bundle.get("patches", {})
    if i == 0:
        for name, data in pd.items():
            if norm(name) in disabled_hushfeed:
                data["enabled"] = False
            else:
                data["enabled"] = True
    elif i == 1:
        for name, data in pd.items():
            data["enabled"] = False
            req = requested.get(name.lower())
            if req and req.get("enabled", False):
                data["enabled"] = True
                existing = data.get("options") or {}
                for k, v in (req.get("options") or {}).items():
                    target = k if k in existing else None
                    if target is None:
                        nk = norm(k)
                        for ek in existing:
                            if norm(ek) == nk: target = ek; break
                    if target is None: continue
                    if isinstance(existing[target], dict) and "value" in existing[target]:
                        existing[target]["value"] = v
                    else:
                        existing[target] = v
                data["options"] = existing

with open("build/options.json", "w") as f:
    json.dump(options, f, indent=2)
print("✅ Options configured via Nai64ExtraPatches_Options.yaml")