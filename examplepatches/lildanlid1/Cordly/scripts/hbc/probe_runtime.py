#!/usr/bin/env python3
"""Compact a copy of bootstrap.js that exposes top-level names as globalThis.__venusDbg() (for scripts/hbc/probe.sh).

The hook goes at the top of activatePlugins, which runs as soon as any hooked Metro module loads, because the
compactor rebuilds the runtime's footer and moves the rest into a lazily evaluated core. The source file is
restored afterwards and patches/build/bootstrap.js is rebuilt clean, so a probe build can never be packaged.
"""
import pathlib, shutil, sys
ROOT = pathlib.Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "scripts")); import build
names = [n for n in sys.argv[1].split(",") if n]
out = pathlib.Path(sys.argv[2])
src = ROOT / "patches/src/main/resources/venus/bootstrap.js"; orig = src.read_text()
hook = "    function activatePlugins(id, exports) {\n"
assert orig.count(hook) == 1, "activatePlugins moved; update probe_runtime.py"
body = ",".join('%s:typeof %s!=="undefined"?%s:null' % (n, n, n) for n in names)
try:
    src.write_text(orig.replace(hook, hook + "        if (!global.__venusDbg) global.__venusDbg = () => ({%s});\n" % body))
    build.compact_runtime(); shutil.copy(ROOT / "patches/build/bootstrap.js", out)
finally:
    src.write_text(orig)
build.compact_runtime()
