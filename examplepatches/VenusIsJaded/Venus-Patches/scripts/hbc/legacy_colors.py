#!/usr/bin/env python3
"""Regenerates LEGACY_TOKEN_RAWS in bootstrap.js: for every semantic color token that has moved off the legacy palettes
(PRIMARY_*, PLUM_*, BRAND_*, WHITE, BLACK) onto Discord's newer ones (NEUTRAL_*, OPACITY_*, BLURPLE_*), the legacy raw
colors it read in each theme slot in earlier Discord versions, newest first. Custom themes use it so a Revenge /
Vendetta theme that recolors PRIMARY_600 or PLUM_18 recolors exactly the tokens those raws used to color.

    python3 scripts/hbc/legacy_colors.py        # needs work/discord_colors.json (scripts/hbc/color_tables.py)

History comes from nexpid/Themelings (its data branch keeps semantic.json for every Discord build since mid 2024),
cached in work/themelings/. Run it again when porting to a new Discord version."""
import json, os, re, sys, urllib.request

ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), "../.."))
CACHE = os.path.join(ROOT, "work/themelings")
BOOTSTRAP = os.path.join(ROOT, "patches/src/main/resources/venus/bootstrap.js")
SLOTS = ("dark", "light", "darker", "midnight")  # THEME_SLOTS order in bootstrap.js
LEGACY = re.compile(r"^(PRIMARY|PLUM|BRAND)_\d+$|^(WHITE|BLACK)$")


def get(url, token=None):
    req = urllib.request.Request(url, headers={"User-Agent": "venus-legacy-colors"})
    if token: req.add_header("Authorization", "Bearer " + token)
    with urllib.request.urlopen(req, timeout=60) as r: return r.read()


def history():
    os.makedirs(CACHE, exist_ok=True)
    token = os.environ.get("GITHUB_TOKEN")
    shas, page = [], 1
    while True:
        batch = json.loads(get("https://api.github.com/repos/nexpid/Themelings/commits?sha=data&path=semantic.json&per_page=100&page=%d" % page, token))
        shas += [c["sha"] for c in batch]
        if len(batch) < 100: break
        page += 1
    for sha in shas:  # newest first
        path = os.path.join(CACHE, sha + ".json")
        if not os.path.exists(path):
            data = get("https://raw.githubusercontent.com/nexpid/Themelings/%s/semantic.json" % sha)
            with open(path, "wb") as f: f.write(data)
        with open(path) as f: yield json.load(f)


def main():
    current = json.load(open(os.path.join(ROOT, "work/discord_colors.json")))["sem"]
    seen = {}
    for table in history():
        for token, slots in table.items():
            if not isinstance(slots, dict): continue
            for slot in SLOTS:
                e = slots.get(slot)
                if isinstance(e, list): e = e[1] if len(e) > 1 else None  # [hex, {raw, opacity}] format
                if not isinstance(e, dict) or "raw" not in e: continue
                raw = {"WHITE_500": "WHITE", "BLACK_500": "BLACK"}.get(e["raw"], e["raw"])
                if not LEGACY.match(raw): continue
                found = seen.setdefault((token, slot), [])
                if all(r != raw for r, _ in found): found.append((raw, round(float(e.get("opacity", 1)), 3)))
    # Per token: [raw, opacity] for each slot in SLOTS order (null where the slot never read a legacy raw or still does).
    rows = []
    for token in sorted(current):
        cells, any_cell = [], False
        for slot in SLOTS:
            now = current[token].get(slot)
            # Still on a legacy raw: the theme's raw already reaches it.
            found = None if not now or LEGACY.match(now["raw"]) else seen.get((token, slot))
            # Only the newest: older builds sometimes used a token for something else (a border that once read
            # BRAND_500), and that would recolor it wrongly today.
            if found: cells += [json.dumps(found[0][0]), "%g" % found[0][1]]; any_cell = True
            else: cells += ["null", "0"]
        if any_cell: rows.append("        %s:[%s]" % (token, ", ".join(cells)))
    text = "{\n" + ",\n".join(rows) + "\n    }"
    count = len(rows)
    src = open(BOOTSTRAP).read()
    new, n = re.subn(r'(const LEGACY_TOKEN_RAWS = )(?:"[^"]*"|\{[^}]*\});', lambda m: m.group(1) + text + ";", src)
    if n != 1: sys.exit("legacy_colors: LEGACY_TOKEN_RAWS not found in bootstrap.js")
    open(BOOTSTRAP, "w").write(new)
    print("LEGACY_TOKEN_RAWS: %d tokens" % count)


if __name__ == "__main__":
    main()
