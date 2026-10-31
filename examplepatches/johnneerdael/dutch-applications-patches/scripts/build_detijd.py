"""Build only De Tijd and its original-input helper, using cached dependencies."""
import os
from pathlib import Path
import subprocess
import tempfile

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'build/isolated-detijd'


def main():
    OUTPUT.mkdir(parents=True, exist_ok=True)
    # Pass the path through the process environment, never interpolate a shell
    # recipe or disable the full build's independent Maps-key requirement.
    environment = os.environ.copy()
    environment['DETIJD_BUILD_ROOT'] = str(OUTPUT)
    # Offline mode never sends this placeholder to GitHub. The plugin still
    # requires nonempty repository credentials while configuring cached tasks.
    environment.setdefault('GITHUB_ACTOR', 'offline-cache')
    environment.setdefault('GITHUB_TOKEN', 'offline-cache-only')
    script = '''
gradle.beforeProject { p ->
    p.layout.buildDirectory.set(new File(System.getenv('DETIJD_BUILD_ROOT'), p.path.replace(':', '_')))
}
gradle.projectsEvaluated {
    def p = gradle.rootProject.project(':patches')
    p.tasks.named('generateMapsKey') { enabled = false }
    def selected = p.fileTree('src/main/kotlin') {
        include 'patches/detijd/**/*.kt'
        include 'patches/shared/OriginalInput.kt'
    }
    p.tasks.named('compileKotlin') { setSource(selected) }
    p.tasks.named('sourcesJar') { enabled = false }
}
'''
    with tempfile.TemporaryDirectory(prefix='detijd-build-') as temporary:
        init = Path(temporary) / 'detijd.gradle'
        init.write_text(script)
        wrapper = 'gradlew.bat' if os.name == 'nt' else './gradlew'
        subprocess.run([wrapper, ':patches:buildAndroid', '--offline',
                        '--max-workers=2', '-I', str(init)],
                       cwd=ROOT, env=environment, check=True)
    print('De Tijd-only bundle:', *sorted((OUTPUT / '_patches/libs').glob('*.mpp')))


if __name__ == '__main__':
    main()
