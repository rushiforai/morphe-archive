#!/usr/bin/env python3
"""Build a local MPP with the official plugin source and verified Desktop APIs.

Fallback for machines without GitHub Packages credentials. Uses the repository's
normal Gradle tasks; writes only ignored build/cache files. Does not publish.
"""
import argparse
import hashlib
import os
import subprocess
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PLUGIN_REV = 'a230c33f7eca1e18b07bf1114ca850421520f98d'
DESKTOP_SHA = '1b506ab5f03d16a2f65026d5e0e1910d01fc1e2152f21eaeb44ed2f30856597b'


def main():
    p = argparse.ArgumentParser(description=__doc__)
    for name in ('plugin-source', 'desktop', 'sdk', 'java-home', 'gradle-home', 'work-dir'):
        p.add_argument('--' + name, type=Path, required=True)
    p.add_argument('--lint', action='store_true')
    p.add_argument('--version', default='1.0.0-dev.5-kvaesitso-local')
    p.add_argument('--extra-task', action='append', default=[])
    a = p.parse_args()
    source = a.plugin_source.resolve()
    work = a.work_dir.resolve()
    assert work.is_relative_to(ROOT / '.scratch'), 'Build workspace must be under ignored .scratch'
    assert hashlib.sha256(a.desktop.read_bytes()).hexdigest() == DESKTOP_SHA, 'Wrong Desktop 1.18.1 input'
    revision = subprocess.check_output(['git', '-C', str(source), 'rev-parse', 'HEAD'], text=True).strip()
    assert revision == PLUGIN_REV, 'Expected official plugin v1.3.4 source revision'
    assert not subprocess.check_output(['git', '-C', str(source), 'status', '--porcelain', '--untracked-files=no'], text=True).strip(), 'Modified plugin source'
    work.mkdir(parents=True, exist_ok=True)
    repo = work / 'repository'
    artifact = repo / 'local/morphe/desktop-api/1.18.1-thin'
    artifact.mkdir(parents=True, exist_ok=True)
    # The desktop release supplies Patcher 1.15.1 and SMALI. Separate the stdlib
    # so Gradle marks it as provided and D8 sees no duplicate classpath types.
    with zipfile.ZipFile(a.desktop) as src, zipfile.ZipFile(artifact / 'desktop-api-1.18.1-thin.jar', 'w') as dst:
        for entry in src.infolist():
            if not entry.filename.startswith(('kotlin/', 'org/jetbrains/annotations/', 'org/intellij/lang/annotations/')):
                dst.writestr(entry, src.read(entry))
    (artifact / 'desktop-api-1.18.1-thin.pom').write_text('''<project><modelVersion>4.0.0</modelVersion>
<groupId>local.morphe</groupId><artifactId>desktop-api</artifactId><version>1.18.1-thin</version>
<dependencies><dependency><groupId>org.jetbrains.kotlin</groupId><artifactId>kotlin-stdlib</artifactId>
<version>2.4.10</version></dependency></dependencies></project>''')
    init = work / 'local-build.init.gradle'
    init.write_text('''beforeSettings { settings ->
    if (settings.settingsDir != new File(System.getProperty('penguin.root'))) return
    settings.pluginManagement.includeBuild(System.getProperty('penguin.plugin'))
}
settingsEvaluated { settings ->
    if (settings.settingsDir != new File(System.getProperty('penguin.root'))) return
    settings.dependencyResolutionManagement.repositories.maven {
        url = new File(System.getProperty('penguin.repository')).toURI()
    }
}
allprojects {
    configurations.configureEach {
        resolutionStrategy.dependencySubstitution {
            all { substitution ->
                def requested = substitution.requested
                if (requested instanceof ModuleComponentSelector &&
                    (requested.group == 'app.morphe' && requested.module == 'morphe-patcher' ||
                     requested.group == 'com.github.MorpheApp.smali' && requested.module == 'smali')) {
                    substitution.useTarget('local.morphe:desktop-api:1.18.1-thin')
                }
            }
        }
    }
}
''')
    env = dict(os.environ, JAVA_HOME=str(a.java_home.resolve()), ANDROID_HOME=str(a.sdk.resolve()),
               GRADLE_USER_HOME=str(a.gradle_home.resolve()))
    tasks = [':patches:buildAndroid']
    if a.lint:
        tasks += [':extensions:kvaesitso:lintRelease', ':stubs:kvaesitso:lintRelease']
    tasks += a.extra_task
    subprocess.run([str(ROOT / 'gradlew'), '-Dpenguin.root=' + str(ROOT),
                    '-Dpenguin.plugin=' + str(source), '-Dpenguin.repository=' + str(repo),
                    '-I', str(init), '-Pgpr.user=local', '-Pgpr.key=unused-local-build',
                    '-Pversion=' + a.version, *tasks, '--console=plain'],
                   cwd=ROOT, env=env, check=True)
    print(ROOT / ('patches/build/libs/patches-' + a.version + '.mpp'))


if __name__ == '__main__':
    main()
