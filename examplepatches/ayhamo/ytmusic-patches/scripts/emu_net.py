"""Turn the test emulator's network off and on, for offline tests.

    python scripts/emu_net.py status
    python scripts/emu_net.py on                        # network back on now (and cancel the watchdog)
    python scripts/emu_net.py off [--minutes N]         # airplane mode on; back on by itself after N min (default 3)
    python scripts/emu_net.py run TEST.sh [--minutes N] [--out DIR]

On LDPlayer, airplane mode also cuts adb's shell (adb devices still lists the emulator, but every
shell command hangs) until the network is back. So an offline test has to run on the emulator
itself: `run` pushes TEST.sh, starts it there under a watchdog, and checks every 10 s with a hard
time limit. TEST.sh turns airplane mode on, does its taps, writes its screenshots/logs to
/sdcard/offtest, turns airplane mode off and writes /sdcard/offtest/finished. Whatever TEST.sh
does, the watchdog turns the network back on after N minutes. `run` then stops the watchdog and
pulls /sdcard/offtest into --out.

Only ever talks to emulator-5558, never to a phone.
"""
import argparse
import os
import subprocess
import sys
import time

ADB = r"D:\LDPlayer\LDPlayer14\adb.exe"
SERIAL = "emulator-5558"
WD_SCRIPT = "/data/local/tmp/ayham_wd.sh"
WD_PID = "/data/local/tmp/ayham_wd.pid"
OUT = "/sdcard/offtest"
WATCHDOG = f"""echo $$ > {WD_PID}
sleep $1
cmd connectivity airplane-mode disable
mkdir -p {OUT}; echo "watchdog fired" >> {OUT}/watchdog
rm -f {WD_PID}
"""


def adb(*args, timeout=20, check=True):
    """One adb call that can't hang: a dead shell (network off) comes back as None."""
    try:
        r = subprocess.run([ADB, "-s", SERIAL, *args], capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        return None
    if check and r.returncode != 0:
        sys.exit(f"adb {' '.join(args)} failed: {r.stderr.strip() or r.stdout.strip()}")
    return r.stdout.strip()


def shell(cmd, timeout=10):
    return adb("shell", cmd, timeout=timeout, check=False)


def status():
    s = shell(f"cmd connectivity airplane-mode; [ -f {WD_PID} ] && echo wd || echo nowd")
    if s is None:
        return None
    # The watchdog's answer is always the last line; an error from cmd (on stderr) leaves no airplane line.
    lines = s.splitlines() or ["?"]
    return (lines[0] if len(lines) > 1 else "?"), lines[-1] == "wd"


def start_watchdog(secs):
    stop_watchdog()
    tmp = os.path.join(os.environ.get("TEMP", "."), "ayham_wd.sh")
    with open(tmp, "w", newline="\n") as f:
        f.write(WATCHDOG)
    try:
        adb("push", tmp, WD_SCRIPT)  # exits on failure: the temp file goes either way
    finally:
        os.remove(tmp)
    shell(f"nohup sh {WD_SCRIPT} {secs} >/dev/null 2>&1 &")
    # The network only goes off once the watchdog is there to bring it back: a push or start that
    # timed out would otherwise leave the emulator offline for good.
    for _ in range(5):
        s = status()
        if s and s[1]:
            return True
        time.sleep(1)
    return False


def stop_watchdog():
    # By its pid file: a pattern match (pkill -f) would also match, and kill, the shell running it.
    # The watchdog itself goes first, then its sleep: killed the other way round, it could wake up
    # and turn the network on (and write "watchdog fired") before its own kill arrives.
    shell(f"[ -f {WD_PID} ] && {{ w=$(cat {WD_PID}); k=$(pgrep -P $w); kill $w; kill $k; }} 2>/dev/null; rm -f {WD_PID}")


def network_on():
    stop_watchdog()
    shell("cmd connectivity airplane-mode disable")


def wait_back(limit):
    """Checks every 10 s until adb answers again (or the limit passes). Returns seconds waited or None."""
    start = time.time()
    while time.time() - start < limit:
        s = status()
        if s is not None:
            return int(time.time() - start), s
        print(f"  {int(time.time() - start)} s: emulator offline (adb not answering), waiting", flush=True)
        time.sleep(10)
    return None


def main():
    p = argparse.ArgumentParser()
    p.add_argument("action", choices=["status", "off", "on", "run"])
    p.add_argument("script", nargs="?")
    p.add_argument("--minutes", type=float, default=3)
    p.add_argument("--out", default="offtest-out")
    a = p.parse_args()

    try:
        listed = subprocess.run([ADB, "devices"], capture_output=True, text=True, timeout=20).stdout
    except subprocess.TimeoutExpired:
        sys.exit("adb devices did not answer in 20 s (restart the adb server)")
    if SERIAL not in listed:
        sys.exit(f"{SERIAL} is not connected")
    secs = max(60, int(a.minutes * 60))

    if a.action == "status":
        s = status()
        print("adb shell not answering (network probably off; the watchdog brings it back)" if s is None
              else f"airplane mode: {s[0]}; watchdog: {'armed' if s[1] else 'none'}")
    elif a.action == "on":
        network_on()
        print("network on" if status() else "adb not answering yet: run 'status' again shortly")
    elif a.action == "off":
        if not start_watchdog(secs):
            sys.exit("the watchdog did not start: network left on")
        shell("cmd connectivity airplane-mode enable")
        print(f"network off; the watchdog turns it back on in {secs} s. adb's shell is cut until then.")
    else:
        if not a.script:
            sys.exit("run needs a test script")
        tmp = "/data/local/tmp/ayham_offtest.sh"
        adb("push", a.script, tmp)
        shell(f"rm -rf {OUT}; mkdir -p {OUT}")
        if not start_watchdog(secs):
            sys.exit("the watchdog did not start: test not run")
        shell(f"nohup sh {tmp} >{OUT}/script.log 2>&1 &")
        started = time.time()
        print(f"test started; network back on within {secs} s at the latest", flush=True)
        time.sleep(10)
        back = wait_back(secs + 60)
        if back is None:
            sys.exit(f"emulator still not answering after {secs + 60} s: check it by hand (LDPlayer window)")
        # adb may answer before the script has even turned the network off, and the script may
        # still be finishing its last steps once the network is back: wait for its finished file
        # (or the watchdog's), up to the watchdog's time plus a minute. While the network is off,
        # each check just times out.
        ended = f"[ -f {OUT}/finished ] && echo finished; [ -f {OUT}/watchdog ] && echo watchdog"
        while not shell(ended) and time.time() - started < secs + 60:
            time.sleep(5)
        # a test script still running (it hung, or the watchdog cut it short) is stopped first,
        # so it can't turn the network off again once the watchdog is gone
        shell(f"for p in $(ps -A -o PID,ARGS | grep 'sh {tmp}' | grep -v grep | awk '{{print $1}}'); do pkill -P $p; kill $p; done")
        done = shell(ended) or ""
        network_on()
        os.makedirs(a.out, exist_ok=True)
        adb("pull", OUT, a.out, timeout=120, check=False)
        print(f"back online after ~{back[0] + 10} s; script: {'finished' if 'finished' in done else 'NOT finished'}"
              f"{'; watchdog had to fire' if 'watchdog' in done else ''}; results in {a.out}")
        s = status()
        print(f"airplane mode: {s[0]}; watchdog: {'armed' if s[1] else 'none'}" if s else "status unknown")


if __name__ == "__main__":
    main()
