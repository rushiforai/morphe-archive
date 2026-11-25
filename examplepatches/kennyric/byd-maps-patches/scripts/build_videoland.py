"""Build only Videoland TV and its exact-input helpers, using cached dependencies."""
import os
import argparse
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'build/isolated-videoland'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--diagnostic', action='store_true', help='Include the test-only target class probe')
    args = parser.parse_args()
    output = OUTPUT.with_name(OUTPUT.name + '-probe') if args.diagnostic else OUTPUT
    output.mkdir(parents=True, exist_ok=True)
    # Pass the path through the process environment, never interpolate a shell
    # recipe or disable the full build's independent Maps-key requirement.
    environment = os.environ.copy()
    environment['VIDEOLAND_DIAGNOSTIC'] = str(args.diagnostic).lower()
    environment['VIDEOLAND_BUILD_ROOT'] = str(output)
    # Offline mode never sends this placeholder to GitHub. The plugin still
    # requires nonempty repository credentials while configuring cached tasks.
    environment.setdefault('GITHUB_ACTOR', 'offline-cache')
    environment.setdefault('GITHUB_TOKEN', 'offline-cache-only')
    script = '''
gradle.beforeProject { p ->
    p.layout.buildDirectory.set(new File(System.getenv('VIDEOLAND_BUILD_ROOT'), p.path.replace(':', '_')))
}
gradle.projectsEvaluated {
    def p = gradle.rootProject.project(':patches')
    p.tasks.named('generateMapsKey') { enabled = false }
    def selected = p.fileTree('src/main/kotlin') {
        include 'patches/videolandatv/**/*.kt'
        include 'patches/atv/Contracts.kt'
        include 'patches/shared/OriginalInput.kt'
    }
    def sources = p.files(selected)
    if (System.getenv('VIDEOLAND_DIAGNOSTIC') == 'true') {
        sources = sources.plus(p.fileTree('../tests/fixtures/videoland-patches') { include '**/*.kt' })
        def runtime = gradle.rootProject.project(':extensions:videoland')
        runtime.android.sourceSets.getByName('main').java.srcDir(gradle.rootProject.file('tests/fixtures/videoland-diagnostics'))
    }
    p.tasks.named('compileKotlin') { setSource(sources) }
    p.tasks.named('sourcesJar') { enabled = false }
}
'''
    with tempfile.TemporaryDirectory(prefix='videoland-build-') as temporary:
        init = Path(temporary) / 'videoland.gradle'
        init.write_text(script)
        wrapper = 'gradlew.bat' if os.name == 'nt' else './gradlew'
        subprocess.run([wrapper, ':patches:buildAndroid', '--offline',
                        '--max-workers=2', '-I', str(init)],
                       cwd=ROOT, env=environment, check=True)
    print('Videoland-only bundle:', *sorted((output / '_patches/libs').glob('*.mpp')))


if __name__ == '__main__':
    main()
