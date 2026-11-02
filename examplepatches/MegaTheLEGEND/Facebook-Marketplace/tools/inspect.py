#!/usr/bin/env python3
"""Touch inspector driver. Needs an APK built with the 'Debug touch inspector' patch.

  python3 tools/inspect.py [--pkg com.facebook.katana] [--dexdir DIR] [--serial SERIAL]

Turns the inspector on over adb, streams the taps you make on the phone, and (with --dexdir, the
directory of unzipped classes*.dex) appends the dexscan class summary for the click-target class and
the deepest views so you can go straight to a fingerprint. Ctrl+C turns it off.
"""
import argparse, re, subprocess, sys, os

ap = argparse.ArgumentParser()
ap.add_argument('--pkg', default='io.focalpoint.prism')
ap.add_argument('--dexdir')
ap.add_argument('--serial')
ap.add_argument('--lines', type=int, default=25, help='max dexscan lines per class')
a = ap.parse_args()
adb = ['adb'] + (['-s', a.serial] if a.serial else [])

def bcast(on):
    subprocess.run(adb + ['shell', 'am', 'broadcast', '-a', 'app.morphe.INSPECT', '--ez', 'on',
                          'true' if on else 'false', '-p', a.pkg], stdout=subprocess.DEVNULL)

dexscan = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'dexscan.py')
seen = set()

def dex_summary(line):
    """Print dexscan info once per obfuscated class (X.2GO -> LX/2GO;) found in the line."""
    if not a.dexdir: return
    for name in re.findall(r'\b((?:[A-Za-z0-9_$]+\.)*[A-Za-z0-9_$]+)\b(?= |$|:)', line):
        if not re.fullmatch(r'X\.[A-Za-z0-9_$]+', name): continue  # obfuscated classes only
        if name in seen: continue
        seen.add(name)
        desc = 'L' + name.replace('.', '/') + ';'
        r = subprocess.run([sys.executable, dexscan, a.dexdir, 'class', desc], capture_output=True, text=True)
        out = r.stdout.strip().splitlines()[:a.lines]
        if out: print('   --- dexscan ' + desc + '\n' + '\n'.join('   ' + l for l in out))

bcast(True)
p = subprocess.Popen(adb + ['logcat', '-v', 'brief', '-s', 'Inspect:I'], stdout=subprocess.PIPE, text=True)
print('Inspector ON. Touch the screen (Ctrl+C to stop).')
try:
    for raw in p.stdout:
        m = re.match(r'I/Inspect\s*\(\s*\d+\):\s?(.*)', raw.rstrip())
        if not m: continue
        line = m.group(1)
        print(line)
        if line.startswith(('CLICK TARGET', '[')) or line.lstrip().startswith('child['):
            dex_summary(line)
except KeyboardInterrupt:
    pass
finally:
    p.terminate()
    bcast(False)
    print('\nInspector OFF.')
