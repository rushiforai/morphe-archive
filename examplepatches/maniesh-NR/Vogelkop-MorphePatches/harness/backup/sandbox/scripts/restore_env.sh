#!/bin/bash
# Full environment restore after sandbox recycle: harness clone, build-tools,
# debug keystore, v3/original base APKs. Everything sourced from GitHub or upload/.
set -euo pipefail
SANDBOX=/home/z/my-project
VAULT=$SANDBOX/.vault
CLONE=$SANDBOX/.harness/vogelkop

# 1. vault + askpass
mkdir -p "$VAULT"
cp "$SANDBOX/upload/Vogelkop access key.txt" "$VAULT/github.token"
chmod 600 "$VAULT/github.token"
cat > "$VAULT/askpass.sh" <<'ASKPASS'
#!/bin/sh
case "$1" in
  *sername*) echo "maniesh-NR" ;;
  *) tr -d '[:space:]' < /home/z/my-project/.vault/github.token ;;
esac
ASKPASS
chmod 700 "$VAULT/askpass.sh"

# 2. harness clone (contains tools/, opera/decoded mirror, scripts, docs)
if [ ! -d "$CLONE/.git" ]; then
  mkdir -p "$(dirname "$CLONE")"
  GIT_ASKPASS="$VAULT/askpass.sh" GIT_TERMINAL_PROMPT=0 \
    git clone -q https://github.com/maniesh-NR/Vogelkop-MorphePatches.git "$CLONE"
  git -C "$CLONE" config user.name "maniesh-NR"
  git -C "$CLONE" config user.email "maniesh-NR@users.noreply.github.com"
fi
echo "clone at $(git -C "$CLONE" rev-parse --short HEAD)"

# 3. build-tools 36 (apksigner + zipalign -P 16)
mkdir -p /tmp/bt
if [ ! -x /tmp/bt/bt36/android-16/zipalign ]; then
  curl -sL --max-time 500 -o /tmp/bt/bt36.zip "https://dl.google.com/android/repository/build-tools_r36_linux.zip"
  unzip -q -o /tmp/bt/bt36.zip -d /tmp/bt/bt36
fi
BT=/tmp/bt/bt36/android-16
"$BT/aapt2" version

# 4. debug keystore (from mirrored uber-apk-signer.jar)
mkdir -p /tmp/keys
if [ ! -f /tmp/keys/debug.keystore ]; then
  (cd /tmp/keys && unzip -o -q "$CLONE/harness/backup/sandbox/tools/uber-apk-signer.jar" debug.keystore)
fi
ls -la /tmp/keys/debug.keystore

# 5. v3 apkm (patched base + splits) and original apkm
mkdir -p /tmp/apkm-diag/v3 /tmp/apkm-diag/orig
if [ ! -f /tmp/apkm-diag/v3/OperaBeta-v3.apkm ]; then
  curl -sL --max-time 500 -o /tmp/apkm-diag/v3/OperaBeta-v3.apkm \
    "https://github.com/maniesh-NR/Vogelkop-MorphePatches/releases/download/sandbox-storage/OperaBeta-104.0.5262.91143-custom-v3.apkm"
fi
V3SHA=$(sha256sum /tmp/apkm-diag/v3/OperaBeta-v3.apkm | cut -d' ' -f1)
echo "v3 apkm sha256: $V3SHA (expect 4d7e9e9a4b2713f10cb491ad5675a3a46d2e8bad87171f4b0164c3ae1d45d2bc)"

python3 - << 'EOF'
import zipfile
z = zipfile.ZipFile('/tmp/apkm-diag/v3/OperaBeta-v3.apkm')
open('/tmp/apkm-diag/v3/base.apk','wb').write(z.read('base.apk'))
for n in z.namelist():
    if n.startswith('split_'):
        open('/tmp/apkm-diag/v3/'+n,'wb').write(z.read(n))
o = zipfile.ZipFile('/home/z/my-project/upload/com.opera.browser.beta_104.0.5262.91143-1910404306_2dpi_25lang_19feat_c2b59ea30fab5744c9b5462fed6dd891_apkmirror.com.apkm')
open('/tmp/apkm-diag/orig/base.apk','wb').write(o.read('base.apk'))
print("extracted v3 base + 27 splits + orig base")
EOF
echo RESTORE-OK
