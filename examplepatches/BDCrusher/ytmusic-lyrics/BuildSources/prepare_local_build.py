"""Configure only this app's owned clones for unauthenticated composite builds."""
from pathlib import Path
scope = Path(__file__).resolve().parents[1]
p = scope / 'Personal-Patches/settings.gradle.kts'
s = p.read_text(encoding='utf-8')
s = s.replace('pluginManagement {', 'pluginManagement {\n    includeBuild("../BuildSources/morphe-patches-gradle-plugin")', 1)
s = s.replace('file("../morphe-patches-library")', 'file("../BuildSources/morphe-patches-library")')
s = s.replace('val libDir = file("../$libraryPath")', 'val libDir = file("../BuildSources/$libraryPath")')
p.write_text(s, encoding='utf-8')
# A repository that unconditionally resolves credentials is unnecessary when all Morphe
# artifacts come from these exact local public source builds.
p = scope / 'BuildSources/morphe-patches-gradle-plugin/src/main/kotlin/app/morphe/patches/gradle/SettingsPlugin.kt'
s = p.read_text(encoding='utf-8')
start = s.index('            maven { repository ->\n                // A repository must be specified.')
end = s.index('\n        }\n    }', start)
s = s[:start] + s[end:]
p.write_text(s, encoding='utf-8')
print('Configured local composite builds within', scope)
