package patches.medium

import app.morphe.patcher.patch.bytecodePatch

internal val webPrivacyExtension = bytecodePatch {
    dependsOn(originalInput)
    extendWith("extensions/medium-privacy.mpe")
}

internal val readerExtension = bytecodePatch {
    dependsOn(originalInput, webPrivacyExtension)
    extendWith("extensions/medium-reader.mpe")
}
