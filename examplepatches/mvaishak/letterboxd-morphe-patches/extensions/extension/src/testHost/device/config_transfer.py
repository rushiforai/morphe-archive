"""Run from the repository root with Android SDK 36, JDK 17+, and a USB device."""
import os
import subprocess
import tempfile
from pathlib import Path

sdk = Path(os.environ.get('ANDROID_HOME') or os.environ['ANDROID_SDK_ROOT'])
android = sdk / 'platforms/android-36/android.jar'
d8 = sdk / 'build-tools/36.0.0/d8'
sources = Path('extensions/extension/src/main/java/app/template/extension')
test = Path('extensions/extension/src/testHost/java/app/template/extension/settings/ConfigTransferTest.java')
remote = f'/data/local/tmp/letterboxd-config-test-{os.getpid()}.jar'

with tempfile.TemporaryDirectory() as temp:
    directory = Path(temp)
    classes = directory / 'classes'
    classes.mkdir()
    hooks = directory / 'ArtworkHooks.java'
    # UI refreshes require the host app. JSON parsing and storage logic run on Android.
    hooks.write_text('''package app.template.extension.artwork;
public final class ArtworkHooks {
    public static String account() { return null; }
    public static void refreshFilm(String id, ArtworkStore.Type type) {}
    public static void refreshProfiles() {}
}
''')
    java_files = [sources / path for path in ('artwork/ArtworkRules.java', 'artwork/ArtworkStore.java',
                  'settings/AccentMath.java', 'settings/Prefs.java', 'settings/ConfigTransfer.java')]
    subprocess.run(['javac', '--release', '11', '-classpath', android, '-d', classes,
                    hooks, *java_files, test], check=True)
    jar = directory / 'classes.jar'
    dex = directory / 'test.jar'
    subprocess.run(['jar', '--create', '--file', jar, '-C', classes, '.'], check=True)
    subprocess.run([d8, '--lib', android, '--min-api', '26', '--output', dex, jar], check=True)
    try:
        subprocess.run(['adb', '-d', 'push', dex, remote], check=True)
        subprocess.run(['adb', '-d', 'shell', f'CLASSPATH={remote}', 'app_process', '/system/bin',
                        'app.template.extension.settings.ConfigTransferTest'], check=True)
    finally:
        subprocess.run(['adb', '-d', 'shell', 'unlink', remote], check=False)
