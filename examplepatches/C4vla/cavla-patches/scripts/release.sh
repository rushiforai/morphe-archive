#!/data/data/com.termux/files/usr/bin/bash
# Produce a release-ready bundle: patches-<ver>.mpp (WITH classes.dex) + patches-list.json.
#
# Two traps this guards against:
#  1) buildAndroid only merges classes.dex on a CLEAN build (incremental skips it) -> clean first.
#  2) generatePatchesList rebuilds the .mpp WITHOUT classes.dex -> stash the good .mpp, restore after.
# Morphe Manager loads the patches from classes.dex (Android/ART); a dexless bundle shows
# "Unnamed / Metadata N/A" and won't apply.
set -e
cd "$(dirname "$0")/.."

bash scripts/build.sh :patches:clean
bash scripts/build.sh :patches:buildAndroid

MPP=$(python3 -c "import glob;print([x for x in glob.glob('patches/build/libs/patches-*.mpp') if 'javadoc' not in x and 'sources' not in x][0])")
python3 -c "import zipfile,sys;sys.exit(0 if 'classes.dex' in zipfile.ZipFile('$MPP').namelist() else 1)" \
  || { echo "ERROR: $MPP has no classes.dex after clean build"; exit 1; }
cp "$MPP" "$MPP.dexbak"

bash scripts/build.sh :patches:generatePatchesList
cp "$MPP.dexbak" "$MPP"; rm -f "$MPP.dexbak"

python3 -c "import zipfile;print('OK dex present:', 'classes.dex' in zipfile.ZipFile('$MPP').namelist())"
echo "RELEASE ARTIFACTS:"
echo "  $MPP"
echo "  patches-list.json"
