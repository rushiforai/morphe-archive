#!/usr/bin/env python3
"""Build the standalone theme MPP using public Morphe and Kotlin artifacts.

This build needs no GitHub Packages token. Boost users apply the original
Patcheddit bundle separately for API and login fixes.
"""
import os
import re
from pathlib import Path
import shutil
import subprocess
import urllib.request
import zipfile

ROOT = Path(__file__).resolve().parent.parent
CACHE = ROOT / '.cache' / 'catppuccin'
BUILD = ROOT / 'build' / 'catppuccin'
SOURCES = [
    ROOT / "patches/src/main/kotlin/app/morphe/patches/todoist/TodoistPatches.kt",
    ROOT / "patches/src/main/kotlin/app/morphe/patches/anki/CatppuccinAnkiPatch.kt",
    ROOT / "patches/src/main/kotlin/app/morphe/patches/shared/fonts/TrueType.kt",
    ROOT / "patches/src/main/kotlin/app/morphe/patches/reddit/customclients/boostforreddit/theme/CustomFontBoostPatch.kt",
    ROOT / 'patches/src/main/kotlin/app/morphe/patches/reddit/customclients/boostforreddit/theme/CatppuccinThemePatch.kt',
    ROOT / 'patches/src/main/kotlin/app/morphe/patches/gboard/theme/CatppuccinGboardPatch.kt',
    ROOT / 'patches/src/main/kotlin/app/morphe/patches/gboard/theme/CustomFontGboardPatch.kt',
]
SOURCES.append(ROOT / 'patches/src/main/kotlin/app/morphe/patches/fastmail/CatppuccinFastmailPatch.kt')

SOURCES.append(ROOT / 'patches/src/main/kotlin/app/morphe/patches/pocketcasts/PocketCastsPatches.kt')
if os.environ.get('CATPPUCCIN_POCKETCASTS_TEST') == '1':
    SOURCES.append(ROOT / 'test/pocketcasts/TestIdentityPatch.kt')

if os.environ.get('CATPPUCCIN_INCLUDE_INSTAGRAM') == '1':
    SOURCES.append(ROOT / 'patches/src/main/kotlin/app/morphe/patches/instagram/InstagramPatches.kt')

if os.environ.get('CATPPUCCIN_INSTAGRAM_TEST') == '1':
    SOURCES.append(ROOT / 'test/instagram/TestIdentityPatch.kt')

if os.environ.get('CATPPUCCIN_INCLUDE_NYT_GAMES') == '1':
    SOURCES.append(ROOT / 'patches/src/main/kotlin/app/morphe/patches/nytgames/NytGamesPatches.kt')
if os.environ.get('CATPPUCCIN_NYT_GAMES_TEST') == '1':
    SOURCES.append(ROOT / 'test/nytgames/TestIdentityPatch.kt')

# Maps is still a draft; include it only in explicitly requested local test builds.
if os.environ.get('CATPPUCCIN_INCLUDE_MAPS') == '1':
    SOURCES.append(ROOT / 'patches/src/main/kotlin/app/morphe/patches/maps/theme/CatppuccinMapsPatch.kt')

if os.environ.get('CATPPUCCIN_FASTMAIL_TEST') == '1':
    SOURCES.append(ROOT / 'test/fastmail/TestIdentityPatch.kt')

if os.environ.get('CATPPUCCIN_ANKI_TEST') == '1':
    SOURCES.append(ROOT / 'test/anki/TestIdentityPatch.kt')

MORPHE_VERSION = '1.18.0'
KOTLIN_VERSION = '2.3.21'
BUNDLE_VERSION = os.environ.get('CATPPUCCIN_VERSION', '0.7.0')


def fetch(name, url):
    target = CACHE / name
    if not target.exists():
        print(f'Downloading {name}', flush=True)
        temporary = target.with_suffix('.download')
        urllib.request.urlretrieve(url, temporary)
        temporary.replace(target)
    return target


def run(*args):
    subprocess.run([str(arg) for arg in args], check=True, cwd=ROOT)


def validate_release_notes(version, changelog):
    if "-" in version:  # Local development bundles are not published updates.
        return
    sections = re.split(r"(?m)^#{1,2} ", changelog)
    entry = next((section for section in sections if section.startswith(f"[{version}]")), None)
    if entry is None or not re.search(r"(?m)^[-*] \*\*[^*]+:\*\*", entry):
        raise ValueError(f"Release {version} needs app-scoped CHANGELOG.md bullets for Morphe update badges")


def main():
    validate_release_notes(BUNDLE_VERSION, (ROOT / 'CHANGELOG.md').read_text())
    CACHE.mkdir(parents=True, exist_ok=True)
    BUILD.mkdir(parents=True, exist_ok=True)
    java_home = Path(os.environ['JAVA_HOME'])
    sdk = Path(os.environ['ANDROID_HOME'])
    java = java_home / 'bin/java'
    morphe = fetch(f'morphe-desktop-{MORPHE_VERSION}-all.jar',
        f'https://github.com/MorpheApp/morphe-desktop/releases/download/v{MORPHE_VERSION}/morphe-desktop-{MORPHE_VERSION}-all.jar')
    compiler = fetch(f'kotlin-compiler-embeddable-{KOTLIN_VERSION}.jar',
        f'https://repo.maven.apache.org/maven2/org/jetbrains/kotlin/kotlin-compiler-embeddable/{KOTLIN_VERSION}/kotlin-compiler-embeddable-{KOTLIN_VERSION}.jar')
    annotations = fetch('annotations-26.0.2.jar',
        'https://repo.maven.apache.org/maven2/org/jetbrains/annotations/26.0.2/annotations-26.0.2.jar')
    classes = BUILD / 'classes'
    if classes.exists():
        shutil.rmtree(classes)
    classes.mkdir()
    run(java, '-cp', os.pathsep.join(map(str, (compiler, morphe, annotations))),
        'org.jetbrains.kotlin.cli.jvm.K2JVMCompiler', '-no-stdlib', '-no-reflect',
        '-classpath', os.pathsep.join(map(str, (morphe, annotations))),
        '-language-version', '2.2', '-jvm-target', '11', '-d', classes, *SOURCES)
    bundle = ROOT / (f'build/morphe-catppuccin-{BUNDLE_VERSION}-test.mpp' if os.environ.get('CATPPUCCIN_ANKI_TEST') == '1' else f'build/morphe-catppuccin-{BUNDLE_VERSION}.mpp')
    maps_classes = BUILD / 'maps-extension'
    if maps_classes.exists():
        shutil.rmtree(maps_classes)
    maps_classes.mkdir()
    android_jar = sorted((sdk / 'platforms').glob('*/android.jar'))[-1]
    d8 = sorted((sdk / 'build-tools').glob('*/lib/d8.jar'))[-1]
    run(java_home / 'bin/javac', '-source', '8', '-target', '8', '-classpath', android_jar,
        '-d', maps_classes, ROOT / 'tools/maps/src/app/morphe/extension/maps/MapsTheme.java')
    maps_jar = BUILD / 'maps-extension.jar'
    with zipfile.ZipFile(maps_jar, 'w') as archive:
        for path in maps_classes.rglob('*.class'):
            archive.write(path, path.relative_to(maps_classes))
    maps_dex = BUILD / 'maps-extension.zip'
    run(java, '-cp', d8, 'com.android.tools.r8.D8', '--release', '--min-api', '32',
        '--lib', android_jar, '--output', maps_dex, maps_jar)
    anki_classes = BUILD / 'anki-extension'
    if anki_classes.exists():
        shutil.rmtree(anki_classes)
    anki_classes.mkdir()
    run(java_home / 'bin/javac', '-source', '8', '-target', '8', '-classpath', android_jar,
        '-d', anki_classes, *sorted((ROOT / 'tools/anki/src').rglob('*.java')))
    anki_jar = BUILD / 'anki-extension.jar'
    with zipfile.ZipFile(anki_jar, 'w') as archive:
        for path in anki_classes.rglob('*.class'):
            archive.write(path, path.relative_to(anki_classes))
    anki_dex = BUILD / 'anki-extension.zip'
    run(java, '-cp', d8, 'com.android.tools.r8.D8', '--release', '--min-api', '24',
        '--lib', android_jar, '--output', anki_dex, anki_jar)
    todoist_classes = BUILD / 'todoist-extension'
    if todoist_classes.exists():
        shutil.rmtree(todoist_classes)
    todoist_classes.mkdir()
    run(java_home / 'bin/javac', '-source', '8', '-target', '8', '-classpath', android_jar,
        '-d', todoist_classes, *sorted((ROOT / 'tools/todoist/src').rglob('*.java')))
    todoist_jar = BUILD / 'todoist-extension.jar'
    with zipfile.ZipFile(todoist_jar, 'w') as archive:
        for path in todoist_classes.rglob('*.class'):
            archive.write(path, path.relative_to(todoist_classes))
    todoist_dex = BUILD / 'todoist-extension.zip'
    run(java, '-cp', d8, 'com.android.tools.r8.D8', '--release', '--min-api', '32',
        '--lib', android_jar, '--output', todoist_dex, todoist_jar)
    fastmail_classes = BUILD / 'fastmail-extension'
    if fastmail_classes.exists():
        shutil.rmtree(fastmail_classes)
    fastmail_classes.mkdir()
    run(java_home / 'bin/javac', '-source', '8', '-target', '8', '-classpath', android_jar,
        '-d', fastmail_classes, *sorted((ROOT / 'tools/fastmail/src').rglob('*.java')))
    fastmail_jar = BUILD / 'fastmail-extension.jar'
    with zipfile.ZipFile(fastmail_jar, 'w') as archive:
        for path in fastmail_classes.rglob('*.class'):
            archive.write(path, path.relative_to(fastmail_classes))
    fastmail_dex = BUILD / 'fastmail-extension.zip'
    run(java, '-cp', d8, 'com.android.tools.r8.D8', '--release', '--min-api', '26',
        '--lib', android_jar, '--output', fastmail_dex, fastmail_jar)
    pocket_classes = BUILD / 'pocketcasts-extension'
    if pocket_classes.exists():
        shutil.rmtree(pocket_classes)
    pocket_classes.mkdir()
    run(java_home / 'bin/javac', '--release', '8', '-classpath', android_jar,
        '-d', pocket_classes, *sorted((ROOT / 'tools/pocketcasts/src').rglob('*.java')))
    pocket_jar = BUILD / 'pocketcasts-extension.jar'
    with zipfile.ZipFile(pocket_jar, 'w') as archive:
        for path in pocket_classes.rglob('*.class'):
            archive.write(path, path.relative_to(pocket_classes))
    pocket_dex = BUILD / 'pocketcasts-extension.zip'
    run(java, '-cp', d8, 'com.android.tools.r8.D8', '--release', '--min-api', '32',
        '--lib', android_jar, '--output', pocket_dex, pocket_jar)
    instagram_dex = None
    if os.environ.get('CATPPUCCIN_INCLUDE_INSTAGRAM') == '1':
        instagram_classes = BUILD / 'instagram-extension'
        if instagram_classes.exists():
            shutil.rmtree(instagram_classes)
        instagram_classes.mkdir()
        run(java_home / 'bin/javac', '--release', '8', '-classpath', android_jar,
            '-d', instagram_classes, *sorted((ROOT / 'tools/instagram/src').rglob('*.java')))
        instagram_jar = BUILD / 'instagram-extension.jar'
        with zipfile.ZipFile(instagram_jar, 'w') as archive:
            for path in instagram_classes.rglob('*.class'):
                archive.write(path, path.relative_to(instagram_classes))
        instagram_dex = BUILD / 'instagram-extension.zip'
        run(java, '-cp', d8, 'com.android.tools.r8.D8', '--release', '--min-api', '28',
            '--lib', android_jar, '--output', instagram_dex, instagram_jar)
    nyt_dex = None
    if os.environ.get('CATPPUCCIN_INCLUDE_NYT_GAMES') == '1':
        nyt_classes = BUILD / 'nytgames-extension'
        if nyt_classes.exists():
            shutil.rmtree(nyt_classes)
        nyt_classes.mkdir()
        run(java_home / 'bin/javac', '-source', '8', '-target', '8', '-classpath', android_jar,
            '-d', nyt_classes, *sorted((ROOT / 'tools/nytgames/src').rglob('*.java')))
        nyt_jar = BUILD / 'nytgames-extension.jar'
        with zipfile.ZipFile(nyt_jar, 'w') as archive:
            for path in nyt_classes.rglob('*.class'):
                archive.write(path, path.relative_to(nyt_classes))
        nyt_dex = BUILD / 'nytgames-extension.zip'
        run(java, '-cp', d8, 'com.android.tools.r8.D8', '--release', '--min-api', '32',
            '--lib', android_jar, '--output', nyt_dex, nyt_jar)
    manifest = ('Manifest-Version: 1.0\nName: Morphe - Catppuccin\n'
        f'Description: Catppuccin themes for Boost, Gboard, AnkiDroid, Todoist, Fastmail, and Pocket Casts\nVersion: {BUNDLE_VERSION}\n'
        'Author: titandrive\nSource: https://github.com/titandrive/morphe-catppuccin\n'
        'License: GPL-3.0 with upstream NOTICE conditions\n\n')
    with zipfile.ZipFile(bundle, 'w', zipfile.ZIP_DEFLATED) as archive:
        archive.writestr('META-INF/MANIFEST.MF', manifest)
        if pocket_dex:
            with zipfile.ZipFile(pocket_dex) as extension:
                archive.writestr('catppuccin/pocketcasts.dex', extension.read('classes.dex'))
            for path in sorted((ROOT / 'patches/src/main/resources/catppuccin/pocketcasts').glob('*.xml')):
                archive.write(path, 'catppuccin/pocketcasts/' + path.name)
        if instagram_dex:
            with zipfile.ZipFile(instagram_dex) as extension:
                archive.writestr('catppuccin/instagram.dex', extension.read('classes.dex'))
        if nyt_dex:
            with zipfile.ZipFile(nyt_dex) as extension:
                archive.writestr('catppuccin/nytgames.dex', extension.read('classes.dex'))
        if fastmail_dex:
            with zipfile.ZipFile(fastmail_dex) as extension:
                archive.writestr('catppuccin/fastmail.dex', extension.read('classes.dex'))
            archive.write(ROOT / 'patches/src/main/resources/catppuccin/fastmail/font-settings.js',
                'catppuccin/fastmail/font-settings.js')
            archive.write(ROOT / 'patches/src/main/resources/catppuccin/fastmail/macchiato.css',
                'catppuccin/fastmail/macchiato.css')
        for path in sorted(classes.rglob('*')):
            if path.is_file():
                archive.write(path, path.relative_to(classes))
        with zipfile.ZipFile(maps_dex) as extension:
            archive.writestr('catppuccin/maps.dex', extension.read('classes.dex'))
        with zipfile.ZipFile(todoist_dex) as extension:
            archive.writestr('catppuccin/todoist.dex', extension.read('classes.dex'))
        with zipfile.ZipFile(anki_dex) as extension:
            archive.writestr('catppuccin/anki.dex', extension.read('classes.dex'))
        for path in sorted((ROOT / 'patches/src/main/resources/catppuccin/anki').rglob('*')):
            if path.is_file():
                archive.write(path, 'catppuccin/anki/' + str(path.relative_to(ROOT / 'patches/src/main/resources/catppuccin/anki')))
        archive.write(ROOT / 'patches/src/main/resources/catppuccin/styles.xml', 'catppuccin/styles.xml')
        archive.write(ROOT / 'patches/src/main/resources/catppuccin/palette.xml', 'catppuccin/palette.xml')
        archive.write(ROOT / 'patches/src/main/resources/catppuccin/restore.xml', 'catppuccin/restore.xml')
        for name in ('LICENSE', 'NOTICE'):
            archive.write(ROOT / name, name)
    dex = BUILD / 'classes.zip'
    d8 = sorted((sdk / 'build-tools').glob('*/lib/d8.jar'))[-1]
    android_jar = sorted((sdk / 'platforms').glob('*/android.jar'))[-1]
    input_jar = BUILD / 'patches.jar'
    with zipfile.ZipFile(input_jar, 'w') as archive:
        for path in sorted(classes.rglob('*.class')):
            archive.write(path, path.relative_to(classes))
    run(java, '-cp', d8, 'com.android.tools.r8.D8',
        '--release', '--min-api', '26', '--lib', android_jar,
        '--classpath', morphe, '--output', dex, input_jar)
    with zipfile.ZipFile(bundle, 'a') as archive, zipfile.ZipFile(dex) as dex_archive:
        for name in dex_archive.namelist():
            archive.writestr(name, dex_archive.read(name))
    print(f'Built {bundle}', flush=True)


if __name__ == '__main__':
    main()
