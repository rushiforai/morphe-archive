package patches.ftm

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val readFullArticles = bytecodePatch(name = "Read full articles", description = "Uses the supported empty HTML article decision to retain already received article bodies; cannot provide text absent from the server response.") {
    compatibleWith(ftm)
    dependsOn(originalInput, webContent, articleDecision)
}
