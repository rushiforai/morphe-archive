package app.windowshopper.patches.meesho

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION = "Lapp/windowshopper/extension/meesho/Unclutter;"
private const val SETTINGS = "Lapp/windowshopper/extension/meesho/Settings;"
private val MEESHO = Compatibility(
    packageName = "com.meesho.supply",
    name = "Meesho",
    appIconColor = 0x9F2570,
    targets = listOf(AppTarget(version = "30.0"), AppTarget(version = "29.9")),
)

/** Picks the obfuscated name for the supported Meesho build being patched. */
private fun <T> BytecodePatchContext.byVersion(v29: T, v30: T): T = when (packageMetadata.versionName) {
    "29.9" -> v29
    "30.0" -> v30
    else -> error("Unsupported Meesho version ${packageMetadata.versionName}")
}

private fun BytecodePatchContext.enableFeature(switch: String) {
    val method = mutableClassDefBy(EXTENSION).methods.single { it.name == switch }
    check(method.returnType == "Z" && method.parameterTypes.isEmpty() &&
        method.implementation!!.instructions.first().opcode == Opcode.CONST_4) {
        "Unexpected extension switch bytecode: $switch"
    }
    method.replaceInstruction(0, "const/4 v0, 0x1")
}

private val morpheSettings = bytecodePatch {
    compatibleWith(MEESHO)
    extendWith("extensions/meesho.mpe")
    execute {
        val application = mutableClassDefBy("Lcom/meesho/supply/main/SupplyApplication;")
        val create = application.methods.single {
            it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        create.addInstructions(0, """
            invoke-static/range {p0 .. p0}, $SETTINGS->initialize(Landroid/content/Context;)V
        """.trimIndent())

        val older = byVersion(true, false)
        val owner = if (older) "Lv7;" else "Lti/a0;"
        val list = if (older) "Lk39;" else "Li11/d;"
        val profile = mutableClassDefBy(owner).methods.single {
            it.name == (if (older) "k" else "l") && it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes.map(CharSequence::toString) ==
                    (if (older) listOf("Lgk0;", "Lf9f;", "Lna3;")
                     else listOf("Ld6/f;", "Lvi/l;", "Lo11/c;"))
        }
        val build = profile.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == list && ref.name == (if (older) "g" else "i") &&
                ref.parameterTypes.isEmpty() && ref.returnType == list
        }
        val register = (build.value as FiveRegisterInstruction).registerC
        profile.addInstructions(build.index, """
            invoke-static/range {v$register .. v$register}, $SETTINGS->addProfileEntry(Ljava/util/List;)V
        """.trimIndent())
    }
}

private val responseHook = bytecodePatch {
    compatibleWith(MEESHO)
    dependsOn(morpheSettings)
    execute {
        val call = mutableClassDefBy("Lokhttp3/internal/connection/RealCall;")
        val method = call.methods.single {
            it.name == "getResponseWithInterceptorChain\$okhttp" &&
                it.parameterTypes.isEmpty() && it.returnType == "Lokhttp3/Response;"
        }
        val returns = method.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }
        check(returns.isNotEmpty()) { "Meesho HTTP response hook has no return" }
        for ((index, instruction) in returns.reversed()) {
            val register = (instruction as OneRegisterInstruction).registerA
            method.addInstructions(index, """
                invoke-static/range {v$register .. v$register}, $EXTENSION->filter(Lokhttp3/Response;)Lokhttp3/Response;
                move-result-object v$register
            """.trimIndent())
        }
    }
}

private fun feature(name: String, description: String, switch: String) = bytecodePatch(
    name = name,
    description = description,
) {
    compatibleWith(MEESHO)
    dependsOn(responseHook)
    execute {
        enableFeature(switch)
    }
}

private const val WISHLIST_BANNER = "Lcom/meesho/core/impl/login/models/ConfigResponse\$WishlistMccBannerConfig;"

val hideAds = bytecodePatch(
    name = "Hide sponsored listings and order ads",
    description = "Removes active sponsored product records, two identified My Orders finance banners and the Wishlist Pay Later banner, and disables configured order ads.",
) {
    compatibleWith(MEESHO)
    dependsOn(responseHook)
    execute {
        enableFeature("hideAds")
        val owners = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.isWishlistBannerGetter() }) owners += classDef.type
        }
        check(owners.isNotEmpty()) { "Wishlist banner config getter not found" }
        for (owner in owners) {
            for (method in mutableClassDefBy(owner).methods.filter { it.isWishlistBannerGetter() }) {
                val returns = method.implementation!!.instructions.withIndex()
                    .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                check(returns.isNotEmpty()) { "Wishlist banner getter has no return" }
                for ((index, instruction) in returns.reversed()) {
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.addInstructions(index, """
                        invoke-static/range {v$register .. v$register}, $SETTINGS->wishlistBanner(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, $WISHLIST_BANNER
                    """.trimIndent())
                }
            }
        }
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.isWishlistBannerGetter() =
    returnType == WISHLIST_BANNER && parameterTypes.isEmpty() && implementation != null

val productRatings = feature(
    "Product ratings only",
    "Removes supplier review summaries and supplier-typed catalog ratings. Missing product ratings stay missing.",
    "productRatings",
)

val sortRatings = feature(
    "Sort search pages by rating count",
    "Sorts each returned search page by product rating count, highest first. Does not globally reorder unloaded pages.",
    "sortRatings",
)

val hideFeedVideos = feature(
    "Hide reel cards in feeds",
    "Removes reel-format catalog cards from discovery feeds while leaving the video tab untouched.",
    "hideFeedVideos",
)

val hidePayLaterPrice = feature(
    "Hide Pay Later secondary price",
    "Hides the Pay Later secondary price on discovery listings without changing the primary price or checkout.",
    "hidePayLaterPrice",
)

val hideSearchTrays = feature(
    "Hide search recommendation trays",
    "Removes the Gold Premium Quality and You may also like rows from search, and Similar Products rows from search, category pages and the home feed.",
    "hideSearchTrays",
)

val hideNavTabs = feature(
    "Hide bottom navigation tabs",
    "Adds optional toggles to remove Categories, Mall and Video Finds from the bottom tab bar.",
    "hideNavTabs",
)

val sortLoadedResults = bytecodePatch(
    name = "Sort loaded search results by rating count",
    description = "Adds a button to sort currently loaded search and category products by product rating count.",
) {
    compatibleWith(MEESHO)
    dependsOn(responseHook)
    execute {
        enableFeature("loadedSort")
        val fragment = mutableClassDefBy("Lcom/meesho/supply/catalog/search/RealSearchResultsFragment;")
        val resume = fragment.methods.single {
            it.name == "onResume" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        val returns = resume.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
        check(returns.isNotEmpty()) { "Search onResume has no return" }
        for ((index, _) in returns.reversed()) {
            resume.addInstructions(index, """
                invoke-static/range {p0 .. p0}, Lapp/windowshopper/extension/meesho/LoadedSort;->show(Ljava/lang/Object;)V
            """.trimIndent())
        }
        val pause = fragment.methods.single {
            it.name == "onPause" && it.parameterTypes.isEmpty() && it.returnType == "V"
        }
        pause.addInstructions(0, """
            invoke-static/range {p0 .. p0}, Lapp/windowshopper/extension/meesho/LoadedSort;->hide(Ljava/lang/Object;)V
        """.trimIndent())
    }
}

val hideFinanceTab = bytecodePatch(
    name = "Hide Pay Later navigation tab",
    description = "Prevents Pay Later from taking the fourth navigation slot without disabling its payment services.",
) {
    compatibleWith(MEESHO)
    dependsOn(morpheSettings)
    execute {
        enableFeature("hideFinanceTab")
        val gate = byVersion("X0", "W0")
        val flag = byVersion("T8", "Y8")
        val method = mutableClassDefBy("Lcom/meesho/supply/main/HomeActivity;").methods.single {
            it.name == gate && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }
        check(method.implementation!!.instructions.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lcom/meesho/core/impl/domain/d;" && ref.name == flag
        }) { "Unexpected Pay Later navigation gate" }
        check(method.implementation!!.registerCount > 1) { "Navigation gate needs a local register" }
        method.addInstructionsWithLabels(0, """
            invoke-static {}, $SETTINGS->hideFinanceTab()Z
            move-result v0
            if-eqz v0, :original
            const/4 v0, 0x0
            return v0
        """.trimIndent(), ExternalLabel("original", method.implementation!!.instructions.first()))
    }
}

val hideFinanceProfile = bytecodePatch(
    name = "Hide loan and Pay Later profile entries",
    description = "Removes the three finance entries from the account list without changing repayment or checkout.",
) {
    compatibleWith(MEESHO)
    dependsOn(morpheSettings)
    execute {
        enableFeature("hideFinanceProfile")
        val owner = byVersion("Lv7;", "Lti/a0;")
        val methodName = byVersion("k", "l")
        val params = byVersion(listOf("Lgk0;", "Lf9f;", "Lna3;"), listOf("Ld6/f;", "Lvi/l;", "Lo11/c;"))
        val firstItem = byVersion("Lb5a;", "Lvi/i;")
        val otherItem = byVersion("Lq5a;", "Lvi/j;")
        val list = byVersion("Lk39;", "Li11/d;")
        val method = mutableClassDefBy(owner).methods.single {
            it.name == methodName &&
                it.parameterTypes.map(CharSequence::toString) == params &&
                it.returnType == "Ljava/lang/Object;"
        }
        val instructions = method.implementation!!.instructions
        val targets = instructions.withIndex().filter { (_, instruction) ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "<init>" && ref.definingClass in setOf(firstItem, otherItem)
        }
        check(targets.map {
            ((it.value as ReferenceInstruction).reference as MethodReference).definingClass
        } == listOf(firstItem, otherItem, otherItem)) { "Unexpected finance profile entries" }
        for ((ordinal, target) in targets.withIndex().reversed()) {
            val index = target.index
            val next = instructions[index + 1]
            val ref = (next as? ReferenceInstruction)?.reference as? MethodReference
            check(next.opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == list &&
                ref.name == "add" && ref.parameterTypes.map(CharSequence::toString) ==
                    listOf("Ljava/lang/Object;") && ref.returnType == "Z") {
                "Unexpected finance profile list insertion"
            }
            val registers = next as FiveRegisterInstruction
            check(registers.registerCount == 2) { "Unexpected profile insertion registers" }
            val helper = if (ordinal == 1) "addLoanProfile" else "addPayLaterProfile"
            method.replaceInstruction(index + 1,
                "invoke-static {v${registers.registerC}, v${registers.registerD}}, " +
                    "$SETTINGS->$helper(Ljava/util/List;Ljava/lang/Object;)Z")
        }
    }

}
