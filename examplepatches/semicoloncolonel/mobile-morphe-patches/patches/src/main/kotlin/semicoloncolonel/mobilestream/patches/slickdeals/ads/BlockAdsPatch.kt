package semicoloncolonel.mobilestream.patches.slickdeals.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.slickdeals.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Block ads.
//
// Slickdeals 6.36.0 is R8-renamed, so every hook is found through a string the
// app keeps.
//
// Feeds: every feed (home, search, deal detail, forums) is one ContentFeed, a
// list of segments. Ad segments, sponsored carousels, ad items, and deals
// flagged PROMOTED are dropped from that list by ShoppingAdsFilter as each
// feed is built, from the server and from the app's cache.
//
// Ad requests: every ad (Prebid, Amazon, and Google Ad Manager) is loaded
// through one method of the ad loader, the one that logs "Could not resolve
// slot UUID". It now returns at once, so no ad is requested.
//
// Deal pages: the two ad boxes on a deal page are drawn by one composable,
// called with the slot names /1006041/deal-and-app and /deal2-and-app. It
// reserves space before an ad loads, so it now draws nothing.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Removes ads, sponsored carousels, and promoted deals.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        fun stringsOf(method: com.android.tools.smali.dexlib2.iface.Method) =
            method.implementation?.instructions?.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
            } ?: emptyList()

        // The feed: the class whose toString starts with "ContentFeed(id=".
        var feedClass: String? = null
        var adLoader: Pair<String, String>? = null
        var adComposable: MethodReference? = null
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val strings = stringsOf(method)
                if ("ContentFeed(id=" in strings) feedClass = classDef.type
                if (strings.any { it.endsWith("Could not resolve slot UUID. Using fallback.") }) {
                    adLoader = classDef.type to (method.name + method.parameterTypes.joinToString("", "(", ")") + method.returnType)
                }
                if (adComposable == null && "/1006041/deal-and-app" in strings) {
                    val instructions = method.implementation!!.instructions.toList()
                    val at = instructions.indexOfFirst {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "/1006041/deal-and-app"
                    }
                    adComposable = instructions.drop(at + 1).first { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
                        .let { (it as ReferenceInstruction).reference as MethodReference }
                }
            }
        }

        // ContentFeed's two constructors: the deserializer's and the cache's.
        val feed = feedClass ?: throw PatchException("Slickdeals ContentFeed not found")
        var filtered = 0
        mutableClassDefBy(feed).methods.filter { it.name == "<init>" }.forEach { constructor ->
            val listIndex = constructor.parameterTypes.indexOfFirst { it.toString() == "Ljava/util/List;" }
            if (listIndex < 0) return@forEach
            val register = "p${listIndex + 1}"
            constructor.addInstructions(
                0,
                """
                    invoke-static/range { $register .. $register }, $ADS_FILTER->slickdealsFeedSegments(Ljava/util/List;)Ljava/util/List;
                    move-result-object $register
                """.trimIndent(),
            )
            filtered++
        }
        if (filtered != 2) throw PatchException("Slickdeals ContentFeed constructors: expected 2, found $filtered")

        val (loaderClass, loaderSignature) = adLoader ?: throw PatchException("Slickdeals ad loader not found")
        mutableClassDefBy(loaderClass).methods.single {
            it.name + it.parameterTypes.joinToString("", "(", ")") + it.returnType == loaderSignature
        }.apply {
            if (returnType != "V") throw PatchException("Slickdeals ad loader does not return void")
            returnEarly("return-void")
        }

        val composable = adComposable ?: throw PatchException("Slickdeals deal page ad not found")
        if (composable.returnType != "V") throw PatchException("Slickdeals deal page ad does not return void")
        mutableClassDefBy(composable.definingClass).methods.single {
            it.name == composable.name &&
                it.parameterTypes.map { type -> type.toString() } == composable.parameterTypes.map { type -> type.toString() }
        }.returnEarly("return-void")
    }
}
