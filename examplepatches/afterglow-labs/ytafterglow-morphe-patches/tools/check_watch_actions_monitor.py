#!/usr/bin/env python3
"""Verify real watch-action catch tables and unchanged bridge instructions through DEX emission."""
from pathlib import Path
import argparse
import hashlib
import json
import os
import subprocess
import tempfile

parser = argparse.ArgumentParser()
parser.add_argument('--apk', type=Path)
parser.add_argument('--require-fixed', action='store_true')
parser.add_argument('--report', type=Path)
args = parser.parse_args()
root = Path(__file__).resolve().parent.parent
jar = Path(os.environ.get('MORPHE_DESKTOP_JAR', '/mnt/c/Users/Corey/Downloads/morphe-desktop-1.20.0-all.jar'))
kotlinc = Path(os.environ.get('KOTLINC', '/mnt/c/Program Files/Android/Android Studio/plugins/Kotlin/kotlinc/bin/kotlinc'))
with tempfile.TemporaryDirectory(prefix='afterglow-watch-actions-monitor-') as directory:
    temp = Path(directory); classes = temp/'classes'; classes.mkdir()
    env = os.environ.copy(); env.setdefault('JAVA_HOME', '/usr/lib/jvm/java-17-openjdk-amd64')
    subprocess.run([str(kotlinc), '-jvm-target', '11', '-no-reflect', '-nowarn', '-Xskip-prerelease-check',
                    '-classpath', str(jar), '-d', str(classes),
                    str(root/'patches/src/main/kotlin/app/afterglow/patches/playback/WatchActionsExceptionGuard.kt')],
                   env=env, check=True)
    cp = os.pathsep.join(map(str, [jar, classes]))
    subprocess.run(['javac', '-encoding', 'UTF-8', '-classpath', cp, '-d', str(classes),
                    str(root/'tools/jvm/WatchActionsMonitorTest.java')], check=True)
    result = subprocess.run(['java', '-Xmx1g', '-classpath', cp, 'WatchActionsMonitorTest',
                             str(temp/'guard.dex'), str(args.apk) if args.apk else '-', str(args.require_fixed).lower()],
                            capture_output=True, text=True, timeout=120)
    print(result.stdout, end='')
    if result.stderr: print(result.stderr, end='')
    result.check_returncode()
    if args.report:
        data = {'apk': str(args.apk) if args.apk else None,
                'apkSha256': hashlib.sha256(args.apk.read_bytes()).hexdigest() if args.apk else None,
                'requireFixed': args.require_fixed, 'result': result.stdout.strip()}
        args.report.parent.mkdir(parents=True, exist_ok=True)
        args.report.write_text(json.dumps(data, indent=2)+'\n')
