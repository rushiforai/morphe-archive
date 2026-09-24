package app.lchanc3.patches.jptt.article

import app.lchanc3.patches.jptt.shared.Constants.ARTICLE_FRAGMENT_CLASS
import app.lchanc3.patches.jptt.shared.Constants.COMPATIBILITY_JPTT
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_PATCH_SETTINGS_CLASS
import app.lchanc3.patches.jptt.shared.Constants.EXTENSION_PRELOAD_CLASS
import app.lchanc3.patches.jptt.shared.JpttApplicationOnCreateFingerprint
import app.lchanc3.patches.jptt.shared.requireFreeLocals
import app.lchanc3.patches.jptt.shared.extensionHookPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import app.morphe.patcher.patch.intSliderOption

/** The helper added to ArticleFragment, named so it cannot collide with its own. */
private const val HELPER_METHOD = "preloadArticleImages"

@Suppress("unused")
val preloadArticleImagesPatch = bytecodePatch(
    name = "Preload article images",
    description = "Downloads an article's images as soon as you open it instead of " +
        "when you scroll to each one. Respects the app's own image loading settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JPTT)

    dependsOn(extensionHookPatch)

    val preloadLimit by intSliderOption(
        key = "preloadLimit",
        min = 5,
        max = 300,
        default = 60,
        step = 5,
        title = "Images to preload per article",
        description = "Starting value for how many of an article's images are " +
            "downloaded ahead of time. Images past the limit still load the normal way " +
            "when scrolled to. Changeable in the app afterwards.",
    )

    val concurrency by intSliderOption(
        key = "concurrency",
        min = 1,
        max = 8,
        default = 4,
        step = 1,
        title = "Images downloading at once",
        description = "Starting value for how many images are preloaded in parallel, " +
            "changeable in the app afterwards. Fresco keeps a whole " +
            "encoded image in memory for as long as its request is in flight, so raising " +
            "this raises the peak memory use. Lower it if the app is killed on image heavy " +
            "articles.",
    )

    execute {
        // Both options are now only defaults: they are handed to the settings
        // page, which is what the extension reads the values from. onCreate has
        // six local registers, so v0 and v1 are free here and are overwritten by
        // the original code right after.
        requireFreeLocals(JpttApplicationOnCreateFingerprint.method, 2)
        JpttApplicationOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/16 v0, $preloadLimit
                const/16 v1, $concurrency
                invoke-static { v0, v1 }, $EXTENSION_PATCH_SETTINGS_CLASS->registerPreload(II)V
            """,
        )

        // Both methods run whenever the article's item list changes. getAllPicUrl()
        // returns every image URL known so far; the extension skips the ones it has
        // already requested.
        //
        // getAllPicUrl() dereferences `adapter`, and notifyDataSetChanged() is
        // reached with a null adapter (it null checks it), so check it here too.
        //
        // This goes in a method of its own rather than inline, because neither
        // caller is guaranteed a spare register: 3.8.5 compiles
        // notifyDataSetChanged() with none at all, reusing the parameter register
        // for the field it reads, and writing to v0 there overwrites `this`.
        val classDef = ArticleFragmentNotifyDataSetChangedFingerprint.classDef
        if (classDef.methods.any { it.name == HELPER_METHOD }) {
            throw PatchException("$ARTICLE_FRAGMENT_CLASS already has a $HELPER_METHOD method.")
        }

        classDef.methods.add(
            ImmutableMethod(
                ARTICLE_FRAGMENT_CLASS,
                HELPER_METHOD,
                emptyList(),
                "V",
                AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
                emptySet(),
                null,
                ImmutableMethodImplementation(
                    // v0 for the adapter and the URLs, and p0 for the fragment.
                    2,
                    """
                        iget-object v0, p0, $ARTICLE_FRAGMENT_CLASS->adapter:Lcom/joshua/jptt/ArticleFragment${'$'}IntextAdapter;
                        if-eqz v0, :no_adapter
                        invoke-virtual { p0 }, $ARTICLE_FRAGMENT_CLASS->getAllPicUrl()Ljava/util/ArrayList;
                        move-result-object v0
                        invoke-static { v0 }, $EXTENSION_PRELOAD_CLASS->preload(Ljava/util/ArrayList;)V
                        :no_adapter
                        return-void
                    """.toInstructions(),
                    null,
                    null,
                ),
            ).toMutable(),
        )

        listOf(
            ArticleFragmentNotifyDataSetChangedFingerprint,
            ArticleFragmentShowListPartialFingerprint,
        ).forEach { fingerprint ->
            fingerprint.method.addInstruction(
                0,
                "invoke-direct { p0 }, $ARTICLE_FRAGMENT_CLASS->$HELPER_METHOD()V",
            )
        }
    }
}
