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
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

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

        val row = byVersion("Ldng;", "Lvi/m;")
        val owners = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.isProfileDividerGate(row) }) owners += classDef.type
        }
        check(owners.size == 1) { "Expected one profile divider gate, found ${owners.size}" }
        val divider = mutableClassDefBy(owners.single()).methods.single { it.isProfileDividerGate(row) }
        val target = divider.implementation!!.instructions.withIndex().single {
            it.value.opcode == Opcode.INSTANCE_OF &&
                ((it.value as ReferenceInstruction).reference as TypeReference).type == row
        }
        val registers = target.value as TwoRegisterInstruction
        divider.replaceInstruction(target.index,
            "invoke-static/range {v${registers.registerB} .. v${registers.registerB}}, " +
                "$SETTINGS->profileRow(Ljava/lang/Object;)Z")
        divider.addInstructions(target.index + 1, "move-result v${registers.registerA}")
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.isProfileDividerGate(row: String) =
    returnType == "Z" && parameterTypes.size == 2 && parameterTypes.first().toString() == "I" &&
        implementation?.instructions?.any {
            it.opcode == Opcode.INSTANCE_OF &&
                ((it as ReferenceInstruction).reference as TypeReference).type == row
        } == true

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

val hidePayLaterPrice = bytecodePatch(
    name = "Hide Pay Later secondary price",
    description = "Hides the Pay Later secondary price on listings and the Pay next month banner on product pages without changing the primary price or checkout.",
) {
    compatibleWith(MEESHO)
    dependsOn(responseHook)
    execute {
        enableFeature("hidePayLaterPrice")
        val owner = byVersion("Lsih;", "Lwz/d6;")
        val stub = byVersion("Lxoj;", "Landroidx/databinding/p0;")
        val model = byVersion("Ljkh;", "Lwz/p7;")
        val method = mutableClassDefBy(owner).methods.single {
            it.name == "d" && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == listOf(stub, stub, "Z", "Z", model)
        }
        check(method.implementation!!.registerCount <= 255) { "Pay Later display gate has too many registers" }
        method.addInstructions(0, """
            invoke-static/range {p2 .. p2}, $SETTINGS->showPayLaterPrice(Z)Z
            move-result p2
        """.trimIndent())
    }
}

val hideSearchTrays = bytecodePatch(
    name = "Hide recommendation trays",
    description = "Removes the Gold Premium Quality, You may also like and related category rows from search, the recently viewed category shelf from home, and stops Similar Products rows in search, category pages and the home feed.",
) {
    compatibleWith(MEESHO)
    dependsOn(responseHook)
    execute {
        enableFeature("hideSearchTrays")
        // The popup request inserts a placeholder row and scrolls to it before any response arrives.
        val owners = mutableListOf<String>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.isPopupTrayRequest() }) owners += classDef.type
        }
        check(owners.size == 1) { "Expected one Similar Products request owner, found ${owners.size}" }
        val method = mutableClassDefBy(owners.single()).methods.single { it.isPopupTrayRequest() }
        method.addInstructionsWithLabels(0, """
            invoke-static {}, $SETTINGS->hideSimilarTray()Z
            move-result v0
            if-eqz v0, :original
            return-void
        """.trimIndent(), ExternalLabel("original", method.implementation!!.instructions.first()))
    }
}

private fun com.android.tools.smali.dexlib2.iface.Method.isPopupTrayRequest(): Boolean {
    if (returnType != "V") return false
    val strings = implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.StringReference)?.string
    } ?: return false
    return "In Feed Widget Request" in strings && "FY_POP_UP" in strings
}

val hideNavTabs = feature(
    "Customize tab bar",
    "Adds settings to pick and reorder up to 5 tab bar tabs, including Account, and to hide Account in the home header.",
    "hideNavTabs",
)

val hideReferEarn = feature(
    "Hide Refer and Earn",
    "Removes Refer and Earn from the home header and account screen.",
    "hideReferEarn",
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

private const val TELEMETRY = "Lapp/windowshopper/extension/meesho/Telemetry;"

val blockTelemetry = bytecodePatch(
    name = "Block analytics and telemetry",
    description = "Answers Meesho event and SDK logging calls locally, skips the SMS inbox upload worker, and opts out of AppsFlyer, Facebook and Firebase analytics.",
) {
    compatibleWith(MEESHO)
    dependsOn(morpheSettings)
    execute {
        enableFeature("blockTelemetry")
        val call = mutableClassDefBy("Lokhttp3/internal/connection/RealCall;").methods.single {
            it.name == "getResponseWithInterceptorChain\$okhttp" && it.parameterTypes.isEmpty()
        }
        call.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p0}, $TELEMETRY->intercept(Lokhttp3/Call;)Lokhttp3/Response;
            move-result-object v0
            if-eqz v0, :original
            return-object v0
        """.trimIndent(), ExternalLabel("original", call.implementation!!.instructions.first()))

        // The worker's synchronous doWork returns ListenableWorker.Result; its no-arg subclass is Success.
        val worker = mutableClassDefBy("Lcom/meesho/sms/impl/SmsReadWorker;").methods.single {
            it.name != "<init>" && it.parameterTypes.isEmpty() && it.returnType.startsWith("L")
        }
        worker.addInstructionsWithLabels(0, """
            invoke-static {}, $TELEMETRY->skipWorker()Z
            move-result v0
            if-eqz v0, :original
            new-instance v0, ${worker.returnType}
            invoke-direct {v0}, ${worker.returnType}-><init>()V
            return-object v0
        """.trimIndent(), ExternalLabel("original", worker.implementation!!.instructions.first()))
    }
}
