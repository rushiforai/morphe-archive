#!/data/data/com.termux/files/usr/bin/bash
# 64-bit / ABI uyarisinin kaynagini arar -> ~/mct_analysis3.txt
DEC="$HOME/mct_decoded"
OUT="$HOME/mct_analysis3.txt"
MA="$DEC/smali/io/mrarm/mctoolbox/MinecraftActivity.smali"
EA="$DEC/smali/io/mrarm/mctoolbox/ErrorActivity.smali"

{
echo "=== 64/ABI/arm gecen smali satirlari (io/mrarm, ilk 120) ==="
grep -rn -iE 'const-string.*(64|abi|arch|arm)' "$DEC/smali/io/mrarm" --include="*.smali" | head -120

echo ""
echo "=== SUPPORTED_ABIS / CPU_ABIs / is64Bit kullanimlari ==="
grep -rn -E 'SUPPORTED_ABIS|CPU_ABI|is64Bit|aarch64|arm64' "$DEC/smali/io/mrarm" --include="*.smali" | head -60

echo ""
echo "=== MinecraftActivity icindeki tum const-string'ler ==="
grep -n 'const-string' "$MA"

echo ""
echo "=== ErrorActivity.s(String) metodu tam hali ==="
awk '/^\.method public final s\(/{flag=1} flag{print} /^\.end method/{if(flag){exit}}' "$EA"

echo ""
echo "=== 'error' ekstra degerleri (putExtra kullanimlari) ==="
grep -rn -B2 -A2 '"error"' "$DEC/smali/io/mrarm/mctoolbox" --include="*.smali" | grep -E 'const-string|putExtra' | head -40

echo ""
echo "=== resources: 64 / abi / unsupport gecen stringler ==="
grep -rn -iE '(64.?bit|unsupport|abi|arch)' "$DEC/res/values/strings.xml" 2>/dev/null | head -60

echo ""
echo "=== MinecraftActivity: 1600 civari (onCreate sonu) ve diger metodlarin basliklari ==="
grep -n '^\.method' "$MA"
} > "$OUT" 2>&1

echo "Bitti: $OUT ($(wc -l < "$OUT") satir)"
