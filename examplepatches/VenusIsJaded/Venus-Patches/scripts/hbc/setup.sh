#!/bin/sh
# Extract the supported Discord bundle into work/new and build the HBC index (developer-only, never committed).
#   sh scripts/hbc/setup.sh [Discord.apkm]      # defaults to the newest complete .apkm in ~/uploaded_files
set -e
cd "$(dirname "$0")/../.."
mkdir -p work/new
if [ ! -f work/new/assets/index.android.bundle ]; then
  APKM="${1:-$(python3 scripts/hbc/find_apkm.py)}"
  unzip -o -q "$APKM" base.apk -d work/new
  unzip -o -q work/new/base.apk assets/index.android.bundle -d work/new
fi
sha256sum work/new/assets/index.android.bundle
python3 -c "import sys; sys.path.insert(0,'scripts/hbc'); from hbc import Bundle; B=Bundle('work/new/assets/index.android.bundle'); print(len(B.modules),'modules indexed')"
