package app.fluffy.patches.scene.fixes

import app.fluffy.patches.shared.Constants.COMPATIBILITY_SCENE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.listApkEntries
import java.io.File

/**
 * The root scene-daemon gates its "adb-monitor-*" ops (the live stats behind
 * the dashboard cards and monitoring overlays) behind a local license check:
 * ~40s after the app connects, a validator flips RESTRICT=1 (root environment
 * detected via a /data/scene-permission-test probe) and monitor ops start
 * answering empty. A MASTER=1 byte overrides every tier; both bytes sit in the
 * daemon's writable data/bss pages.
 *
 * The patch extends the daemon launcher script (raw resource "up", whose
 * obfuscated archive path is discovered at patch time) with a poker that runs as root on every
 * daemon start: it locates the daemon's AES IV string ("scene.omarea.com") in
 * the process's data segment at runtime, derives the two gate bytes relative
 * to it, validates and holds them open (MASTER=1, RESTRICT=0). A background
 * loop re-checks for as long as the daemon lives, so periodic license
 * revalidation cannot close the gate. The gate flags are located per daemon
 * instance by matching the gate check's compiled instruction shape inside the
 * sealed unpacked image and decoding the load targets - no hardcoded offsets,
 * so daemon rebuilds that move the layout stay supported; a rebuild that
 * reshapes the gate fails the match and the poker writes nothing. The IV offset is cached per
 * daemon pid and scans read whole blocks, so a steady-state cycle costs a
 * handful of syscalls. Implausible byte values abort, and a failed write is
 * restored.
 *
 * Shell text below uses a section sign (\u00A7) in place of every dollar sign,
 * because Kotlin string templates would otherwise interpolate the shell
 * variables; execute() swaps them back. Line endings are adopted from the
 * file being patched (the 2026.11 resources are CRLF).
 */
@Suppress("unused")
val daemonGateBypassPatch = patch(
    name = "Daemon gate bypass",
    description = "Keeps the scene-daemon monitor gate open so live stats (dashboard cards, " +
        "overlays) keep updating instead of freezing ~40s after connect. The daemon " +
        "launcher script re-asserts the gate on every start and fails safe on unknown " +
        "daemon layouts. Requires root.",) {
    compatibleWith(COMPATIBILITY_SCENE)

    execute {
        val up = findLauncherResource()
        val text = up.readText()

        // Adopt the file's line endings so the anchor matches byte-exactly;
        // the resource is CRLF in the 2026 builds.
        val nl = if (text.contains("\r\n")) "\r\n" else "\n"

        // Root-branch daemon-launch tail, verified on 2026.10 Alpha13 and
        // 2026.11 PR1/PR2. A rebuild that changes it fails loudly here
        // instead of shipping a broken script.
        val reniceLine = "renice -n -20 \u00A7(pidof scene-daemon)".replace('\u00A7', '$')
        val echoLine = "    echo 'Scene-Daemon OK!'"
        val anchor = reniceLine + nl + echoLine
        if (!text.contains(anchor)) {
            throw PatchException(
                "daemon launch anchor not found in the launcher - the script " +
                    "layout changed, re-derive the insertion point",
            )
        }
        if (text.contains("morphe-patches daemon gate poker")) {
            throw PatchException("launcher already contains the gate poker - patched twice?")
        }

        // Insert between the renice (daemon up, priority set) and the OK echo.
        val block = POKER_BLOCK.trimIndent()
            .replace('\u00A7', '$')
            .replace("\n", nl)
        up.writeText(text.replace(anchor, reniceLine + nl + block + nl + echoLine))
        println("Scene daemon gate bypass: poker appended to the daemon launcher")
    }
}

/**
 * Inserted into the launcher right after the daemon starts and gets its
 * priority set. Plain shell, no indirection: find the daemon's sealed code
 * image, match the gate check's instruction shape, decode the flag addresses,
 * hold MASTER=1.
 *
 * Shell constraints baked in (verified on device):
 * - /system/bin/pidof and /system/bin/dd only: busybox pidof does not see the
 *   daemon, and busybox dd lacks conv=notrunc / iflag.
 * - ALL 33-bit+ arithmetic runs through awk (manual digit loop, %.0f): the
 *   platform /system/bin/sh is 32-bit signed, so runtime addresses and
 *   instruction words >= 0x80000000 wrap negative; awk doubles are exact to
 *   2^53. od pads each byte to two hex digits - every byte comparison uses
 *   the two-digit form.
 * - the sparse grep anchor (23 bytes: two identical ORR #1 arms at a fixed
 *   24-byte distance around the TBZ/TBNZ gate branches) narrows the 6MB
 *   image to a single candidate; 15 semantic constraints on the decoded
 *   instruction words (opcodes, register consistency, ADRP decode) must all
 *   pass before any address is trusted.
 * - flag addresses are cached in /dev/.mp_gate_cache keyed by daemon pid; the
 *   gate is only written after plausibility (flag byte values 00/01) and
 *   writable-mapping membership checks, with read-back verify and restore.
 * - temp files under /dev: the launcher can run before /data is writable.
 */


private const val POKER_BLOCK = """
# >>> morphe-patches daemon gate poker >>>
# Hold the daemon monitor gate open: the dispatcher checks MASTER first,
# and MASTER=1 overrides every gate tier. Both flag addresses are located
# per daemon instance by scanning the sealed r-xs image for the gate
# instruction shape (two ORR/TBZ/TBNZ/LDRB/ADRP chains) and decoding the
# ADRP+LDRB targets - no hardcoded offsets, works across daemon rebuilds.
mp_h2d() {
    awk "BEGIN{b=tolower(\"§1\");v=0;for(i=1;i<=length(b);i++){d=index(\"0123456789abcdef\",substr(b,i,1))-1;v=v*16+d};printf \"%.0f\", v}"
}
mp_rd() {
    /system/bin/dd if=/proc/§MP_P/mem bs=1 iflag=skip_bytes,count_bytes skip=§1 count=§2 2>/dev/null | od -An -v -tx1 | tr -d ' \n'
}
mp_check() {
    awk -v H="§1" -v EXS="§2" -v K="§3" '
    function lew(h,o) { return h2d(substr(h,o+6,2) substr(h,o+4,2) substr(h,o+2,2) substr(h,o,2)) }
    function h2d(h,  i,d,v) { v=0; for(i=1;i<=length(h);i++){d=index("0123456789abcdef",tolower(substr(h,i,1)))-1; v=v*16+d} return v }
    function band(x,m,  r,p,i) { r=0; p=1; for(i=0;i<32;i++){ if(int(m/p)%2==1 && int(x/p)%2==1) r+=p; p*=2 } return r }
    function bor(x,m,  r,p,i) { r=0; p=1; for(i=0;i<32;i++){ if(int(m/p)%2==1 || int(x/p)%2==1) r+=p; p*=2 } return r }
    function shr(x,n) { return int(x/2^n) }
    function adrp(pc, w,  imm) {
        imm = band(shr(w,5),524287)*4 + band(shr(w,29),3)
        if (imm >= 1048576) imm = imm - 2097152
        return pc - (pc % 4096) + imm*4096
    }
    BEGIN {
        W0=lew(H,1); W1=lew(H,9); W2=lew(H,17)
        W3=lew(H,25); W4=lew(H,33); W5=lew(H,41)
        W6=lew(H,49); W7=lew(H,57); W8=lew(H,65)
        RT=W3-2990539744
        if (RT<0 || RT>31 || W8!=W3) exit 1
        if (band(W2,4286578719) != bor(905969664,RT)) exit 1
        if (band(shr(W2,19),31) != 0) exit 1
        if (band(W1,4290772992) != 960495616) exit 1
        if (band(W1,31) != RT) exit 1
        if (band(W7,4286578719) != bor(922746880,RT)) exit 1
        if (band(shr(W7,19),31) != 0) exit 1
        if (band(W6,4290772992) != 960495616) exit 1
        if (band(W6,31) != RT) exit 1
        if (band(shr(W6,5),31) != band(W5,31)) exit 1
        if (band(shr(W1,5),31) != band(W0,31)) exit 1
        if (band(shr(W1,5),31) > 30) exit 1
        if (band(shr(W0,24),31) != 16) exit 1
        if (band(shr(W5,24),31) != 16) exit 1
        if (band(W4,4227858432) != 335544320) exit 1
        PC1 = EXS + K - 4
        PC2 = EXS + K + 16
        MA = adrp(PC1, W0) + band(shr(W1,10),4095)
        RA = adrp(PC2, W5) + band(shr(W6,10),4095)
        printf "%.0f %.0f", MA, RA
    }'
}
mp_in_rw() {
    while read -r RS RE; do
        if [ §1 -ge §RS ] && [ §1 -lt §RE ]; then return 0; fi
    done < /dev/.mp_gate_rw.§§
    return 1
}
mp_gate_locate() {
    MP_MASTER=""; MP_RESTRICT=""
    EX=""
    while read -r LN; do
        case "§LN" in *' r-xs '*) ;; *) continue ;; esac
        R="§(echo "§LN" | cut -d' ' -f1)"
        S=§(mp_h2d §{R%%-*}); E=§(mp_h2d §{R##*-})
        [ §E -gt §S ] && [ §((E - S)) -gt 1048576 ] 2>/dev/null && EX=§R && break
    done < /proc/§MP_P/maps
    [ -n "§EX" ] || return 1
    EXS=§(mp_h2d §{EX%%-*})
    EXE=§(mp_h2d §{EX##*-})
    rm -f /dev/.mp_gate_cand.§§ /dev/.mp_gate_ok.§§ /dev/.mp_gate_rx.§§ /dev/.mp_gate_rw.§§
    awk '/ rw-p /{split(§1,a,"-"); v0=0; v1=0; for(i=1;i<=length(a[1]);i++){d=index("0123456789abcdef",tolower(substr(a[1],i,1)))-1; v0=v0*16+d}; for(i=1;i<=length(a[2]);i++){d=index("0123456789abcdef",tolower(substr(a[2],i,1)))-1; v1=v1*16+d}; printf "%.0f %.0f\n", v0, v1}' /proc/§MP_P/maps > /dev/.mp_gate_rw.§§
    /system/bin/dd if=/proc/§MP_P/mem of=/dev/.mp_gate_rx.§§ bs=65536 iflag=skip_bytes,count_bytes skip=§EXS count=§((EXE - EXS)) 2>/dev/null
    MP_SIG="§(printf '\x03\x40\xb2...........\x39...\x37.\x03\x40\xb2')"
    for C in §(grep -a -b -o -E "§MP_SIG" /dev/.mp_gate_rx.§§ 2>/dev/null | cut -d: -f1); do
        [ -n "§C" ] || continue
        K=§(( C - 9 ))
        [ §K -ge 4 ] || continue
        H="§(dd if=/dev/.mp_gate_rx.§§ bs=1 iflag=skip_bytes,count_bytes skip=§((K - 4)) count=36 2>/dev/null | od -An -v -tx1 | tr -d ' \n')"
        [ §{#H} -eq 72 ] || continue
        RES="§(mp_check "§H" "§EXS" "§K")"
        [ -n "§RES" ] || continue
        echo "§RES" >> /dev/.mp_gate_cand.§§
    done
    rm -f /dev/.mp_gate_rx.§§
    [ -s /dev/.mp_gate_cand.§§ ] || { rm -f /dev/.mp_gate_rw.§§; return 1; }
    while read -r MA RA; do
        MB="§(mp_rd §MA 1)"
        RB="§(mp_rd §RA 1)"
        case "§MB§RB" in 0000|0001|0100|0101) ;; *) continue ;; esac
        mp_in_rw §MA || continue
        mp_in_rw §RA || continue
        echo "§MA §RA §MB §RB" >> /dev/.mp_gate_ok.§§
    done < /dev/.mp_gate_cand.§§
    rm -f /dev/.mp_gate_cand.§§ /dev/.mp_gate_rw.§§
    BEST="§(awk '§3=="00" && §4=="01"' /dev/.mp_gate_ok.§§ 2>/dev/null | head -1)"
    [ -z "§BEST" ] && [ "§(wc -l < /dev/.mp_gate_ok.§§ 2>/dev/null)" = "1" ] && BEST="§(head -1 /dev/.mp_gate_ok.§§)"
    rm -f /dev/.mp_gate_ok.§§
    [ -n "§BEST" ] || return 1
    MP_MASTER="§{BEST%% *}"
    MP_RESTRICT="§(echo §BEST | cut -d' ' -f2)"
    echo "§MP_P §MP_MASTER §MP_RESTRICT" > /dev/.mp_gate_cache
    return 0
}
mp_gate_poke() {
    MP_P="§(/system/bin/pidof scene-daemon 2>/dev/null | tr -d '\r\n')"
    [ -z "§MP_P" ] && return 0
    MP_MASTER=""; MP_RESTRICT=""
    if [ -s /dev/.mp_gate_cache ]; then
        if [ "§(cut -d' ' -f1 /dev/.mp_gate_cache 2>/dev/null)" = "§MP_P" ]; then
            MP_MASTER="§(cut -d' ' -f2 /dev/.mp_gate_cache 2>/dev/null)"
            MP_RESTRICT="§(cut -d' ' -f3 /dev/.mp_gate_cache 2>/dev/null)"
        fi
    fi
    if [ -z "§MP_MASTER" ]; then
        mp_gate_locate
        [ -z "§MP_MASTER" ] && return 0
    fi
    MB="§(mp_rd §MP_MASTER 1)"
    case "§MB" in 00|01) ;; *) rm -f /dev/.mp_gate_cache; return 0 ;; esac
    [ "§MB" = "01" ] && return 0
    printf '\x01' | /system/bin/dd of=/proc/§MP_P/mem bs=1 seek=§MP_MASTER count=1 conv=notrunc 2>/dev/null
    VB="§(mp_rd §MP_MASTER 1)"
    if [ "§VB" != "01" ]; then
        printf "\\x§MB" | /system/bin/dd of=/proc/§MP_P/mem bs=1 seek=§MP_MASTER count=1 conv=notrunc 2>/dev/null
        rm -f /dev/.mp_gate_cache
        return 0
    fi
    if [ "§(cat /dev/.mp_gate_last 2>/dev/null)" != "§MP_P" ]; then
        echo "§(date '+%m-%d %H:%M:%S') daemon §MP_P gate open (sig §MP_MASTER)" >> "§(dirname "§0")/gp.log"
        echo "§MP_P" > /dev/.mp_gate_last
    fi
}
mp_gate_poke
# Re-assert the gate for as long as the daemon lives (activation/deactivate
# ops can clear MASTER); exit ~5 min after the daemon is gone.
( i=0
  while : ; do
    if [ -n "§(/system/bin/pidof scene-daemon 2>/dev/null)" ]; then
      mp_gate_poke
      i=0
      sleep 10
    else
      i="§((i+1))"
      [ "§i" -gt 30 ] && break
      sleep 10
    fi
  done ) &
# <<< morphe-patches daemon gate poker <<<
"""




/**
 * The daemon launcher is the raw resource "up", but its obfuscated archive
 * path (res/Bp in every 2026 build so far) is assigned by the resource
 * shrinker and can change on a rebuild. Discover it instead of hardcoding:
 * try the known entry first, then scan the extensionless res/ entries - the
 * obfuscator keeps extensions for known types, so extensionless is exactly
 * the raw-script set - for the daemon-launch tail.
 */
private fun findLauncherResource(): File {
    val probe = "pidof scene-daemon"

    runCatching { resourceFile("res/Bp") }.getOrNull()
        ?.takeIf { it.exists() && it.length() < 64_000 }
        ?.takeIf { it.readText().contains(probe) }
        ?.let { return it }

    val candidates = listApkEntries("res/").filter { entry ->
        !entry.substringAfterLast('/').contains('.')
    }
    for (entry in candidates) {
        val file = runCatching { resourceFile(entry) }.getOrNull() ?: continue
        if (!file.exists() || file.length() > 64_000) continue
        val content = runCatching { file.readText() }.getOrNull() ?: continue
        if (content.contains(probe) && content.contains("Scene-Daemon OK!")) {
            println("Scene daemon gate bypass: launcher found at " + entry)
            return file
        }
    }
    throw PatchException(
        "daemon launcher (raw resource 'up') not found - no extensionless res/ entry contains the launch script",
    )
}
