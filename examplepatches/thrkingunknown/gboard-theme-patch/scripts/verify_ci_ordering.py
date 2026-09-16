from pathlib import Path

workflow = Path('.github/workflows/release.yml').read_text()
settings = Path('settings.gradle.kts').read_text()
# The root settings file cannot be evaluated until the local Morphe plugin source exists.
bootstrap = workflow.index('Bootstrap pinned Morphe toolchain')
release = workflow.index('uses: cycjimmy/semantic-release-action@v6')
assert bootstrap < release
assert 'gradle wrapper --gradle-version 9.7.1' not in workflow
assert 'Bootstrap pinned Morphe toolchain' in workflow
assert 'cp morphe-deps/morphe-patcher/gradle/wrapper/gradle-wrapper.jar gradle/wrapper/gradle-wrapper.jar' in Path('.github/scripts/bootstrap_morphe.sh').read_text()
assert 'maven.pkg.github.com/MorpheApp/registry' in settings
assert 'publishToMavenLocal' not in workflow
assert 'publishToMavenLocal' not in Path('.github/scripts/bootstrap_morphe.sh').read_text()
print('CI ordering verification passed')
