#!/usr/bin/env bash
# Copies AML and the mods built in the mod loader repo into the patches file's resources.
# usage: ./sync-mods.sh <path to the mod loader repo>   (run loader/build_aml_arm64.sh and mods/build.sh there first)
set -euo pipefail
REPO=${1:?usage: $0 <mod loader repo>}
DST=$(cd "$(dirname "$0")" && pwd)/patches/src/main/resources/gtade
rm -rf "$DST" && mkdir -p "$DST"
M=$REPO/mods
cp "$REPO/loader/aml/libs/arm64-v8a/libAML.so" \
   "$M/modmenu/libs/arm64-v8a/libmodmenu.so" "$M/modmenu/configs/modmenu.ini" \
   "$M/propfix/libs/arm64-v8a/libpropfix.so" "$M/propfix/GTA_Prop_Fix.ini" \
   "$M/skygfx/libs/arm64-v8a/libskygfx.so" "$M/skygfx/SkyGfx.ini" "$M/skygfx/SALodLights.dat" "$M/skygfx/timecyc_ps2.dat" \
   "$M/projectpropsde/libs/arm64-v8a/libprojectpropsde.so" "$M/projectpropsde/ProjectPropsDE.ini" "$M/projectpropsde/ProjectPropsDE.stock" \
   "$M/cleo/libs/arm64-v8a/libcleo.so" "$M/pakloader/libs/arm64-v8a/libpakloader.so" \
   "$M/loadingmusic/libs/arm64-v8a/libloadingmusic.so" "$M/loadingmusic/LoadingMusic.ini" \
   "$M/rubbish/libs/arm64-v8a/librubbish.so" "$M/rubbish/Rubbish-DE.ini" \
   "$DST/"
ls "$DST"
# CLEO Android's SA scripts (BSD-3), DE-adapted where needed: copied to Android/data/<game>/cleo/ by the CLEO patch
mkdir -p "$DST/cleo" && cp "$M"/cleo/scripts/* "$DST/cleo/" && ls "$M/cleo/scripts" > "$DST/cleo.list"
# Rubbish-DE's model slots: Boot builds its pak from the game's own pakchunk0 on the device (no game files shipped)
mkdir -p "$DST/rubbish" && cp "$M/rubbish/pak/slots.json" "$DST/rubbish/"
