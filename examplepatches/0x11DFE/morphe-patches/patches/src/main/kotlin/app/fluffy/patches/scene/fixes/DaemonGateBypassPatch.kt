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
 * revalidation cannot close the gate. Because the IV-relative offsets are a
 * property of each daemon build's data layout, the poker never writes until
 * the daemon itself is observed changing one of the two candidate bytes -
 * proof they are live flags on this build; daemon builds without the gate
 * (2026.11 PR5) are left completely untouched. The IV offset is cached per
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
 * priority set. Plain shell, no indirection: find the daemon, find its AES IV
 * landmark, derive and hold the gate bytes.
 *
 * Shell constraints baked in (verified on device):
 * - /system/bin/pidof and /system/bin/dd only: busybox pidof does not see the
 *   daemon, and busybox dd lacks conv=notrunc / iflag.
 * - hex math via awk with a manual digit loop and %.0f: shell arithmetic is
 *   32-bit and awk cannot parse 0x literals.
 * - single-byte reads use iflag=skip_bytes,count_bytes with bs=1; region
 *   scans read bs=65536 blocks instead (byte-identical to bs=1, verified on
 *   device, ~100x fewer syscalls).
 * - the IV offset is cached in /dev/.mp_gate_cache keyed by daemon pid; a cache
 *   hit validates the anchor with one 16-byte read before poking.
 * - observe-before-poke: /dev/.mp_gate_evid records the daemon pid only after a
 *   daemon-initiated change at a candidate byte; until then the loop only reads
 *   (2s cadence for ~10min, then 10s) and never writes. Daemons younger than
 *   ~30s only refresh the baseline: their startup writes are init noise, not
 *   gate evidence (the earliest legitimate validator write is an app connect
 *   plus its 40s delay).
 * - temp files under /dev: the launcher can run before /data is writable.
 */


private const val POKER_BLOCK = """
# >>> morphe-patches daemon gate poker >>>
# Hold the daemon's monitor gate open: MASTER=1 overrides every gate tier,
# RESTRICT=0 lifts the permission map. Both bytes are located relative to
# the daemon's AES IV string, but their offsets are a property of each
# daemon build's data layout. The poker therefore proves them per daemon
# instance before it ever writes: nothing but the daemon ever closes the
# gate, so a candidate byte is only trusted after the daemon itself is seen
# changing it (the validator engaging RESTRICT ~40s after an app connect,
# or the 63s one-shot clearing MASTER). On builds without the gate (the
# 2026.11 PR5 daemon) nothing ever flips and the poker stays
# observation-only - it never writes a byte.
mp_gate_scan() {
    # List the daemon's small writable mappings (4KB < size <= 256KB).
    grep -a ' rw-p ' /proc/§MP_P/maps 2>/dev/null | while read -r LN; do
        R="§(echo "§LN" | cut -d' ' -f1)"
        S="§{R%%-*}"; E="§{R##*-}"
        SZ="§((0x§E - 0x§S))"
        if [ "§SZ" -gt 4096 ] && [ "§SZ" -le 262144 ]; then echo "§S §SZ"; fi
    done > /dev/.mp_gate_rw.§§
    MP_IV=""
    while read -r RS RZ; do
        [ -z "§RS" ] && continue
        # Hex -> decimal: awk cannot parse 0x literals and shell math is 32-bit.
        SDS=§(awk "BEGIN{b=\"§RS\";v=0;for(i=1;i<=length(b);i++){c=substr(b,i,1);d=index(\"0123456789abcdef\",c)-1;if(d<0)d=index(\"0123456789ABCDEF\",c)-1;v=v*16+d};printf \"%.0f\", v}")
        /system/bin/dd if=/proc/§MP_P/mem of=/dev/.mp_gate_buf.§§ bs=65536 iflag=skip_bytes,count_bytes skip=§SDS count=§RZ 2>/dev/null
        HIT="§(grep -a -b -o -m1 'scene.omarea.com' /dev/.mp_gate_buf.§§ | head -1 | cut -d: -f1)"
        rm -f /dev/.mp_gate_buf.§§
        if [ -n "§HIT" ]; then MP_IV="§(awk "BEGIN{printf \"%.0f\", §SDS+§HIT}")"; break; fi
    done < /dev/.mp_gate_rw.§§
    rm -f /dev/.mp_gate_rw.§§
}
mp_gate_poke() {
    MP_P="§(/system/bin/pidof scene-daemon 2>/dev/null | tr -d '\r\n')"
    [ -z "§MP_P" ] && return 0
    MP_IV=""
    if [ -s /dev/.mp_gate_cache ]; then
        if [ "§(cut -d' ' -f1 /dev/.mp_gate_cache 2>/dev/null)" = "§MP_P" ]; then
            MP_IV="§(cut -d' ' -f2 /dev/.mp_gate_cache 2>/dev/null)"
            /system/bin/dd if=/proc/§MP_P/mem of=/dev/.mp_gate_iv.§§ bs=16 iflag=skip_bytes,count_bytes skip=§MP_IV count=16 2>/dev/null
            grep -a -q 'scene.omarea.com' /dev/.mp_gate_iv.§§ || MP_IV=""
            rm -f /dev/.mp_gate_iv.§§
        fi
    fi
    [ -z "§MP_IV" ] && mp_gate_scan
    [ -z "§MP_IV" ] && return 0
    echo "§MP_P §MP_IV" > /dev/.mp_gate_cache
    # Candidate gate bytes relative to the IV (layout of daemon build
    # 2026.11.17: MASTER = IV-720, RESTRICT = IV+319578). They are only
    # proven live for THIS daemon once the daemon itself has changed one
    # of them - see the evidence check below.
    MA="§(awk "BEGIN{printf \"%.0f\", §MP_IV-720}")"
    RA="§(awk "BEGIN{printf \"%.0f\", §MP_IV+319578}")"
    MB="§(/system/bin/dd if=/proc/§MP_P/mem bs=1 iflag=skip_bytes,count_bytes skip=§MA count=1 2>/dev/null | od -An -tx1 | tr -d ' \n')"
    RB="§(/system/bin/dd if=/proc/§MP_P/mem bs=1 iflag=skip_bytes,count_bytes skip=§RA count=1 2>/dev/null | od -An -tx1 | tr -d ' \n')"
    # Only touch bytes that look like the gate flags; anything else means
    # the daemon layout moved - leave it alone.
    case "§MB§RB" in
        0000|0001|0100|0101) ;;
        *) return 0 ;;
    esac
    if [ "§(cat /dev/.mp_gate_evid 2>/dev/null)" != "§MP_P" ]; then
        # Nothing but the daemon ever closes the gate, so before the daemon
        # is seen moving one of these bytes the gate cannot be closed and a
        # write would only risk hitting unrelated globals. Observe, wait for
        # the daemon's own write (validator engaging RESTRICT ~40s after a
        # connect, or the 63s one-shot clearing MASTER), then hold.
        # A daemon younger than ~30s is still initializing its globals (a
        # fresh instance under a live loop also restarts against a stale
        # baseline), so keep refreshing the baseline until it settles:
        # startup writes must not count as gate evidence.
        MP_AGE=§(awk -v u="§(cut -d. -f1 /proc/uptime)" -v s="§(awk '{print §22}' /proc/§MP_P/stat)" 'BEGIN{printf "%d", u - s/100}')
        if [ "§MP_AGE" -lt 30 ]; then
            MP_PM="§MB"
            MP_PR="§RB"
            return 0
        fi
        if [ -n "§MP_PM" ] && { [ "§MB" != "§MP_PM" ] || [ "§RB" != "§MP_PR" ]; }; then
            echo "§MP_P" > /dev/.mp_gate_evid
        else
            MP_PM="§MB"
            MP_PR="§RB"
            return 0
        fi
    fi
    printf '\x01' | /system/bin/dd of=/proc/§MP_P/mem bs=1 seek=§MA count=1 conv=notrunc 2>/dev/null
    printf '\x00' | /system/bin/dd of=/proc/§MP_P/mem bs=1 seek=§RA count=1 conv=notrunc 2>/dev/null
    VB="§(/system/bin/dd if=/proc/§MP_P/mem bs=1 iflag=skip_bytes,count_bytes skip=§MA count=1 2>/dev/null | od -An -tx1 | tr -d ' \n')"
    if [ "§VB" != "01" ]; then
        # Read-back failed: restore both bytes and leave the daemon stock.
        printf "\\x§MB" | /system/bin/dd of=/proc/§MP_P/mem bs=1 seek=§MA count=1 conv=notrunc 2>/dev/null
        printf "\\x§RB" | /system/bin/dd of=/proc/§MP_P/mem bs=1 seek=§RA count=1 conv=notrunc 2>/dev/null
        return 0
    fi
    if [ "§(cat /dev/.mp_gate_last 2>/dev/null)" != "§MP_P" ]; then
        echo "§(date '+%m-%d %H:%M:%S') daemon §MP_P gate open" >> "§(dirname "§0")/gp.log"
        echo "§MP_P" > /dev/.mp_gate_last
    fi
}
mp_gate_poke
# The daemon revalidates its license periodically and can clear the gate
# flags while it lives - an app update reconnects to the surviving daemon
# without re-running this launcher. So keep re-checking for as long as the
# daemon exists (idempotent when launchers overlap) and exit after ~5
# minutes with no daemon. Until the first daemon write is observed the loop
# polls fast (2s, for ~10 minutes) so a validator flip is caught quickly;
# afterwards it settles to 10s.
( i=0
  j=0
  while : ; do
    if [ -n "§(/system/bin/pidof scene-daemon 2>/dev/null)" ]; then
      mp_gate_poke
      i=0
      if [ "§(cat /dev/.mp_gate_evid 2>/dev/null)" = "§(/system/bin/pidof scene-daemon 2>/dev/null)" ]; then
        sleep 10
      else
        j="§((j+1))"
        if [ "§j" -lt 300 ]; then sleep 2; else sleep 10; fi
      fi
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
