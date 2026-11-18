"""Run the recovered Walmart pure-JVM regression suite using a local Android SDK."""
from pathlib import Path
import os, shutil, subprocess

root = Path(__file__).resolve().parents[1]
sdk = Path(os.environ.get('ANDROID_HOME', os.environ.get('ANDROID_SDK_ROOT', '/usr/local/lib/android/sdk')))
jars = sorted(sdk.glob('platforms/android-*/android.jar'))
android = Path(os.environ['ANDROID_JAR']) if os.environ.get('ANDROID_JAR') else (jars[-1] if jars else None)
if android is None or not android.is_file():
    raise SystemExit('Set ANDROID_JAR to an Android SDK android.jar')
out = root / 'build/logic-tests'
shutil.rmtree(out, ignore_errors=True)
out.mkdir(parents=True)
sources = [*root.glob('extensions/canada/src/main/java/**/*.java'), *root.glob('tests/walmart/fixtures/**/*.java')]
sources += [root / f'tests/walmart/{name}.java' for name in ['LogicTest', 'FeatureTest', 'AdHistoryTest']]
subprocess.run(['javac', '--release', '8', '-cp', str(android), '-d', str(out), *map(str, sources)], check=True)
for name in ['LogicTest', 'FeatureTest', 'AdHistoryTest']:
    subprocess.run(['java', '-cp', os.pathsep.join([str(out), str(android)]), name], check=True)
