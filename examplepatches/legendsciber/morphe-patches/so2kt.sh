#!/data/data/com.termux/files/usr/bin/bash
# .so dosyasini HardcodeSoBytes.kt formatina donusturur.
# Dogrulama: reconstructed bytes == original .so
#
# Kullanim:
#   bash so2kt.sh input.so                              -> HardcodeSoBytes.kt uretir
#   bash so2kt.sh input.so output.kt                    -> belirli dosyaya yazar
#   bash so2kt.sh input.so -k path/to/HardcodeSoBytes.kt  -> HardcodeSoBytes.kt guncelle
set -e

INPUT=""
OUTPUT=""
KT_FILE=""

while [ $# -gt 0 ]; do
    case "$1" in
        -k|--kt)
            KT_FILE="$2"; shift 2 ;;
        -h|--help)
            echo "Kullanim: bash so2kt.sh <input.so> [output.kt] [-k HardcodeSoBytes.kt]"
            exit 0 ;;
        *)
            if [ -z "$INPUT" ]; then INPUT="$1"
            elif [ -z "$OUTPUT" ]; then OUTPUT="$1"
            fi; shift ;;
    esac
done

if [ -z "$INPUT" ]; then
    echo "Kullanim: bash so2kt.sh <input.so> [output.kt] [-k HardcodeSoBytes.kt]"
    exit 1
fi

if [ ! -f "$INPUT" ]; then
    echo "HATA: $INPUT bulunamadi"; exit 1
fi

# ELF kontrolu
HEADER=$(python3 -c "print(open('$INPUT','rb').read(4).hex())")
if [ "$HEADER" != "7f454c46" ]; then
    echo "HATA: $INPUT ELF degil"; exit 1
fi

SIZE=$(stat -c%s "$INPUT")
echo "Girdi: $INPUT ($SIZE byte)"

python3 - "$INPUT" "$OUTPUT" "$KT_FILE" << 'PYEOF'
import sys, os

input_file = sys.argv[1]
output_file = sys.argv[2] if len(sys.argv) > 2 and sys.argv[2] else ""
kt_file = sys.argv[3] if len(sys.argv) > 3 and sys.argv[3] else ""

data = open(input_file, 'rb').read()
assert data[:4] == b'\x7fELF', "ELF degil!"
print(f"Boyut: {len(data)} byte")

# 5 parca bol
chunk_size = (len(data) + 4) // 5
parts = []
for i in range(5):
    start = i * chunk_size
    end = min((i + 1) * chunk_size, len(data))
    parts.append(data[start:end])
    print(f"  Part{i+1}: {end - start} byte [{start}:{end}]")

# Dogrulama
reconstructed = b''.join(parts)
assert reconstructed == data, "RECONSTRUCTION HATASI!"
print("Dogrulama: BASARILI")

# Kotlin icerigi olustur
kt_lines = []
kt_lines.append('package app.shadowfight.patches.hardcode')
kt_lines.append('')
kt_lines.append('object HardcodeSoBytes {')
kt_lines.append('    fun getAll(): List<ByteArray> = listOf(part1(), part2(), part3(), part4(), part5())')
kt_lines.append('')
for i, p in enumerate(parts, 1):
    vals = ','.join(str(b - 256 if b > 127 else b) for b in p)
    kt_lines.append(f'    fun part{i}(): ByteArray = byteArrayOf({vals})')
kt_lines.append('}')
kt_lines.append('')

kt_content = '\n'.join(kt_lines)

if output_file:
    with open(output_file, 'w') as f:
        f.write(kt_content)
    print(f"Yazildi: {output_file} ({len(kt_lines)} satir)")

if kt_file:
    with open(kt_file, 'w') as f:
        f.write(kt_content)
    print(f"HardcodeSoBytes.kt guncellendi: {kt_file}")
PYEOF

echo ""
echo "Dogrulama: BASARILI - .so == reconstruction"
echo "HardcodeSoBytes.kt hazir."
