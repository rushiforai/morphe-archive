#!/bin/sh
# Sets up the UI preview (see AGENTS.md, "Seeing the UI"). Developer-only; everything it writes goes to work/ui.
#   sh tests/ui/setup.sh [Discord.apkm]      # defaults to the newest complete .apkm in ~/uploaded_files
# Takes about a minute the first time and is quick after that, so it's safe to run again after a sandbox reset.
set -e
ROOT=$(cd "$(dirname "$0")/../.." && pwd); W=$ROOT/work; U=$W/ui
APKM="${1:-$(python3 "$ROOT/scripts/hbc/find_apkm.py")}"
mkdir -p "$U/icons" "$U/fonts" "$U/shots" "$W/new"
cd "$U"
[ -f package.json ] || echo '{"private":true}' > package.json
# Pinned versions; React Native Web draws the same components React Native does, as HTML.
[ -d node_modules/react-native-web ] || npm i -s --no-audit --no-fund --cache "$W/npmcache" react@18.2.0 react-dom@18.2.0 react-native-web@0.19.12 esbuild@0.23.1 playwright-core@1.47.2
[ -d "$HOME/.cache/ms-playwright" ] || npx --cache "$W/npmcache" playwright-core install chromium >/dev/null 2>&1 || true
# Chromium's shared libraries and a color emoji font (Debian/Ubuntu sandboxes).
if command -v apt-get >/dev/null; then
  sudo apt-get install -y -q libatk1.0-0 libatk-bridge2.0-0 libatspi2.0-0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 \
    libxkbcommon0 libpango-1.0-0 libcairo2 libasound2 libnss3 libcups2 fonts-noto-color-emoji python3-pil >/dev/null 2>&1 || true
fi
# Discord's own icons (xxhdpi PNGs, drawn as masks in any color), its gg sans font, the Wumpus art and the color tokens.
# One extracted copy for every tool: base.apk lives in work/new, where scripts/hbc/setup.sh puts it too.
TMP=$W/new
rm -rf "$W/ui-apk"   # the separate copy older versions of this script kept
[ -f "$TMP/base.apk" ] || unzip -o -q "$APKM" base.apk -d "$TMP"
[ -f "$TMP/split_config.xxhdpi.apk" ] || unzip -o -q "$APKM" split_config.xxhdpi.apk -d "$TMP"
[ "$(ls "$U/icons" | wc -l)" -gt 100 ] || unzip -o -q -j "$TMP/split_config.xxhdpi.apk" \
  'res/drawable-xxhdpi-v4/design_components_icon_native_redesign_generated_images_*' 'res/drawable-xxhdpi-v4/images_native_gifting_wumpus_box_premium120.png' -d "$U/icons"
# Drawables Venus shows by name (Nitro links' sample emoji and sticker), checked separately so an older setup gets them too.
# (the Wumpus wave ships in base.apk, the gift box in the xxhdpi split).
[ -f "$U/icons/modules_guilds_bar_native_images_wumpus_wave.png" ] || unzip -o -q -j "$TMP/base.apk" \
  'res/drawable-xxhdpi-v4/modules_guilds_bar_native_images_wumpus_wave.png' -d "$U/icons"
[ -f "$U/fonts/ggsans-Normal.ttf" ] || unzip -o -q -j "$TMP/base.apk" 'assets/fonts/ggsans-*' -d "$U/fonts"
[ -f "$W/new/assets/index.android.bundle" ] || unzip -o -q "$TMP/base.apk" assets/index.android.bundle -d "$W/new"
cd "$ROOT"
[ -f "$W/discord_colors.json" ] || python3 scripts/hbc/color_tables.py >/dev/null
python3 - <<'PY'
# Every semantic token as a plain hex color per theme (dark, light, midnight, darker), for createStyles.
import json
d = json.load(open('work/discord_colors.json')); raw = d['raw']
def hx(name, opacity):
    value = raw.get(name)
    if not value: return None
    value = value[:7]
    return value if opacity >= 0.999 else value + format(round(opacity * 255), '02x')
out = {t: {k: hx(v[t]['raw'], v[t].get('opacity', 1)) for k, v in d['sem'].items() if v.get(t)} for t in ['dark', 'light', 'midnight', 'darker']}
json.dump(out, open('work/ui/tokens.json', 'w'))
PY
echo "UI preview ready: node tests/ui/shot.cjs <name> '<query>'"
