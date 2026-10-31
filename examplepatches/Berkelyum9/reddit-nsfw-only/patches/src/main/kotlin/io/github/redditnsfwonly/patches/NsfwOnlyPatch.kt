/*
 * Reddit NSFW Only - derivative work based on Reddit NSFW Blocker by warleysr.
 * Original: https://github.com/warleysr/reddit-nsfw-blocker
 */
package io.github.redditnsfwonly.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.redditnsfwonly.patches.Constants.COMPATIBILITY_REDDIT
import java.util.logging.Logger

private const val EXTENSION_CLASS =
    "Lio/github/redditnsfwonly/extension/BlockNsfwContentPatch;"

private val hideIncognitoNsfwTogglesPatch = resourcePatch {
    execute {
        val layout = "res/layout/screen_leave_incognito_mode_modal.xml"
        if (!get(layout).exists()) {
            Logger.getLogger(this::class.java.name).warning(
                "Could not find $layout. Incognito NSFW toggles will remain visible."
            )
            return@execute
        }

        document(layout).use { document ->
            val views = document.getElementsByTagName("*")
            for (i in 0 until views.length) {
                val view = views.item(i) as? org.w3c.dom.Element ?: continue
                val id = view.getAttribute("android:id")
                if (id.endsWith("/toggle_over18") || id.endsWith("/toggle_blur_nsfw")) {
                    view.setAttribute("android:visibility", "gone")
                }
            }
        }
    }
}

@Suppress("unused")
val nsfwOnlyPatch = bytecodePatch(
    name = "NSFW only",
    description = "Always enables mature content, disables NSFW blur and safe search, " +
        "and keeps only confirmed 18+ posts in the modern home feed and legacy listings."
) {
    compatibleWith(COMPATIBILITY_REDDIT)
    extendWith("extensions/nsfwonly.mpe")
    dependsOn(hideIncognitoNsfwTogglesPatch)

    execute {
        val logger = Logger.getLogger(this::class.java.name)

        AccountPreferencesGetOver18Fingerprint.method.addInstructions(
            0,
            """
                iget-boolean p0, p0, $ACCOUNT_PREFERENCES_CLASS->over18:Z
                invoke-static { p0 }, $EXTENSION_CLASS->getAccountOver18(Z)Z
                move-result p0
                return p0
            """
        )
        AccountPreferencesGetSearchIncludeOver18Fingerprint.method.returnEarly(true)

        PreferenceRepositoryIsOver18Fingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, $EXTENSION_CLASS->setPreferenceRepository(Ljava/lang/Object;)V
                const/4 v0, 0x1
                return v0
            """
        )

        PreferenceRepositorySetOver18Fingerprint.method.addInstruction(0, "const/4 p1, 0x1")

        PreferenceRepositoryIsBlurNsfwFingerprint.matchOrNull()?.method?.returnEarly(false)
            ?: logger.warning("Could not force NSFW image blurring off")

        SafeSearchStoredValueFingerprint.matchOrNull()?.let {
            val safeSearchOff = """
                sget-object p0, Lcom/reddit/domain/SafeSearch;->Off:Lcom/reddit/domain/SafeSearch;
                return-object p0
            """

            it.method.addInstructions(0, safeSearchOff)
            SafeSearchValueFingerprint.method.addInstructions(0, safeSearchOff)
            SafeSearchEnabledFingerprint.method.returnEarly(false)
        } ?: logger.warning("Could not find the safe search repository")

        listOf("key_pref_over18", "key_pref_blur_nsfw").forEach { key ->
            settingsItemSessionsFingerprint(key).matchOrNull()?.method?.addInstructions(
                0,
                """
                    invoke-static { }, Ljava/util/Collections;->emptySet()Ljava/util/Set;
                    move-result-object p0
                    return-object p0
                """
            ) ?: logger.severe("Could not hide the '$key' settings item")
        }

        // Modern Home is GraphQL cell-backed. By the time Reddit has built FeedData/feed
        // elements, the NSFW flag is gone, so filter the response before mapping.
        NsfwHomeFeedPageFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->filterHomeFeedResponse(Ljava/lang/Object;)V
            """
        )

        fun filterListing(fingerprint: Fingerprint) {
            fingerprint.let {
                it.method.apply {
                    val index = it.instructionMatches.first().index
                    val register = getInstruction<TwoRegisterInstruction>(index).registerA
                    addInstructions(
                        index,
                        """
                            invoke-static { v$register }, $EXTENSION_CLASS->filterLinks(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """
                    )
                }
            }
        }
        filterListing(ListingFingerprint)
    }
}
