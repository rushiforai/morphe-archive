#!/bin/sh
# Fetch a prebuilt standalone Hermes HBC98 VM (250829098.0.16, linux-x64) for benchmarks and HERMES_BIN tests.
# Developer-only, never committed: everything lands in work/hermes. Prints the wrapper path to use as HERMES_BIN.
#   sh scripts/hbc/hermes_vm.sh && node tests/bench/hermes_bench.cjs tests/bench/<name>.js
# Source: github.com/malopezr7/argus release hermes-bin-v250829098.0.16 (CI-gated to emit byte-identical .hbc
# to React Native's hermes-compiler). The binary links ICU 70, taken from Ubuntu 22.04's libicu70 package.
set -e
cd "$(dirname "$0")/../.."
D=work/hermes
mkdir -p "$D/vm" "$D/icu"
VM_URL=https://github.com/malopezr7/argus/releases/download/hermes-bin-v250829098.0.16/hermes-250829098.0.16-linux-x64.tar.gz
VM_SHA=9932d98cb478cf08e62408c7c7f41d47b26a58da2ae3e156963647b76321d049
ICU_URL=http://archive.ubuntu.com/ubuntu/pool/main/i/icu/libicu70_70.1-2ubuntu1_amd64.deb
if [ ! -x "$D/vm/hermes" ]; then
  curl -fsSL "$VM_URL" -o "$D/vm.tgz"
  echo "$VM_SHA  $D/vm.tgz" | sha256sum -c -
  tar xzf "$D/vm.tgz" -C "$D/vm"
fi
if [ ! -f "$D/icu/usr/lib/x86_64-linux-gnu/libicuuc.so.70" ]; then
  curl -fsSL "$ICU_URL" -o "$D/icu.deb"
  (cd "$D/icu" && ar x ../icu.deb && python3 -c "
import glob, io, tarfile, zstandard
f = glob.glob('data.tar.*')[0]
data = zstandard.ZstdDecompressor().stream_reader(open(f, 'rb')).read()
tarfile.open(fileobj=io.BytesIO(data), mode='r:').extractall('.', filter='data')")
fi
cat > "$D/hermes-vm" <<'EOF'
#!/bin/sh
D="$(cd "$(dirname "$0")" && pwd)"
LD_LIBRARY_PATH="$D/icu/usr/lib/x86_64-linux-gnu" exec "$D/vm/hermes" "$@"
EOF
chmod +x "$D/hermes-vm"
"$D/hermes-vm" -version | grep "Hermes release"
echo "$D/hermes-vm"
