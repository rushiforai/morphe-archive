#!/usr/bin/env python3
"""Applies Nai64ExtraPatches_Options.yaml to build/options.json.

YAML sections:
  hushfeed_disabled: list of Hushfeed patch names to disable
  hushfeed_options:  list of {name, options:{key: value}} applied to Hushfeed patches
  patches:           Nai64 allowlist (enabled + options)

Env overrides (used by the variant-test workflow):
  FORCE_DISABLE_HUSHFEED: comma-separated Hushfeed patch names to disable
  FORCE_DISABLE_NAI64:    comma-separated Nai64 patch names to disable
"""
import json
import os
import re
import yaml


def norm(s):
    return re.sub(r"[^a-z0-9]", "", (s or "").lower())


def apply_value(options_dict, key, new):
    cur = options_dict[key]
    if isinstance(cur, dict) and "value" in cur:
        inner = cur["value"]
        cur["value"] = [new] if (isinstance(inner, list) and not isinstance(new, list)) else new
    elif isinstance(cur, list) and not isinstance(new, list):
        options_dict[key] = [new]
    else:
        options_dict[key] = new


with open("build/options.json") as f:
    options = json.load(f)
with open("Nai64ExtraPatches_Options.yaml") as f:
    cfg = yaml.safe_load(f) or {}

requested_nai64 = {p["name"].lower(): p for p in cfg.get("patches", [])}
disabled_hushfeed = {norm(x) for x in cfg.get("hushfeed_disabled", [])}
hushfeed_options = {norm(x.get("name", "")): x for x in cfg.get("hushfeed_options", [])}

extra_hushfeed_disabled = {norm(x) for x in os.environ.get("FORCE_DISABLE_HUSHFEED", "").split(",") if x.strip()}
extra_nai64_disabled = {norm(x) for x in os.environ.get("FORCE_DISABLE_NAI64", "").split(",") if x.strip()}
disabled_hushfeed |= extra_hushfeed_disabled
if extra_hushfeed_disabled:
    print(f"   Env-forced Hushfeed disables: {sorted(extra_hushfeed_disabled)}")
if extra_nai64_disabled:
    print(f"   Env-forced Nai64 disables: {sorted(extra_nai64_disabled)}")


def apply_requested_options(patch_name, data, requested):
    existing = data.get("options") or {}
    for k, v in (requested.get("options") or {}).items():
        if k in existing:
            apply_value(existing, k, v)
            print(f"   -> {patch_name}: {k} = {v!r}")
            continue
        nk = norm(k)
        match = next((ek for ek in existing if norm(ek) == nk), None)
        if match:
            apply_value(existing, match, v)
            print(f"   -> {patch_name}: {match} = {v!r}")
            continue
        if len(existing) == 1:
            only = next(iter(existing))
            apply_value(existing, only, v)
            print(f"   -> {patch_name}: key '{k}' not found; applied to its single option '{only}' = {v!r}")
        else:
            print(f"   !! {patch_name}: key '{k}' not found. Available keys: {list(existing.keys())}")
    data["options"] = existing


for i, bundle in enumerate(options):
    pd = bundle.get("patches", {})

    if i == 0:
        for name, data in pd.items():
            nn = norm(name)
            if nn in disabled_hushfeed:
                data["enabled"] = False
                print(f"   -> Hushfeed disabled: {name}")
            else:
                data["enabled"] = True
            req = hushfeed_options.get(nn)
            if req:
                apply_requested_options(name, data, req)

    elif i == 1:
        for name, data in pd.items():
            data["enabled"] = False
            if norm(name) in extra_nai64_disabled:
                print(f"   -> Nai64 disabled (env-forced): {name}")
                continue
            req = requested_nai64.get(name.lower())
            if not (req and req.get("enabled", False)):
                continue
            data["enabled"] = True
            apply_requested_options(name, data, req)

        found = {n.lower() for n in pd}
        for rn in requested_nai64:
            if rn not in found:
                print(f"   !! Requested Nai64 patch not present in bundle: {rn}")

with open("build/options.json", "w") as f:
    json.dump(options, f, indent=2)
print("Options configured via Nai64ExtraPatches_Options.yaml (+ env overrides)")