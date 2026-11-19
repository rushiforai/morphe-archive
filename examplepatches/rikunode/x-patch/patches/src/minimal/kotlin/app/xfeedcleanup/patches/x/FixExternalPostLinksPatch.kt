package app.xfeedcleanup.patches.x

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.returnEarly

private const val EXTERNAL_POST_LINK_CLASS = "Lapp/xfeedcleanup/extension/x/ExternalPostLink;"

/** X's native detail destination, identified semantically instead of by obfuscated class name. */
private object PostFromIdFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("FromId(postId="),
    // X also has an unrelated FromId model in the deeplink route layer.
    // The detail-navigation FromId has the verified Kotlin default-mask constructor.
    custom = { _, classDef ->
        classDef.methods.any { method ->
            method.name == "<init>" && method.parameterTypes.size == 4 &&
                method.parameterTypes[0].toString() == "J" &&
                method.parameterTypes[1].toString() == "Z" &&
                method.parameterTypes[3].toString() == "I"
        }
    },
)

/** Called for both fresh-launch and onNewIntent deep links via MainActivity. */
private object DefaultExternalIntentRouterFingerprint : Fingerprint(
    parameters = listOf("Landroid/content/Intent;"),
    returnType = "Ljava/util/List;",
    strings = listOf("No matching route found for URI: "),
)

private object PostFromIdNameFingerprint : Fingerprint(
    definingClass = EXTERNAL_POST_LINK_CLASS,
    name = "fromIdClassName",
)

/**
 * Direct post navigation bypasses the Home/For You injection path that can be missing when the
 * user hides For You with Customize timeline top bar. Original routing is preserved on mismatch.
 */
@Suppress("unused")
val fixExternalPostLinksPatch = bytecodePatch(
    name = "Fix external post links",
    description = "Opens external X post URLs directly in post detail without using the For You tab.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(recommendationFilterPatch)

    execute {
        val fromIdClassName = PostFromIdFingerprint.classDef.type
            .removePrefix("L")
            .removeSuffix(";")
            .replace('/', '.')
        PostFromIdNameFingerprint.method.returnEarly(fromIdClassName)

        DefaultExternalIntentRouterFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                invoke-static/range { p1 .. p1 }, $EXTERNAL_POST_LINK_CLASS->route(Landroid/content/Intent;)Ljava/util/List;
                move-result-object v0
                if-eqz v0, :original_router
                return-object v0
                """,
                ExternalLabel("original_router", getInstruction(0)),
            )
        }
    }
}
