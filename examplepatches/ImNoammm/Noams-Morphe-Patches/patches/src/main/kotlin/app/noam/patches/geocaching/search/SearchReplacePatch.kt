package app.noam.patches.geocaching.search

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.geocaching.misc.extension.extensionHookPatch
import app.noam.patches.geocaching.shared.Constants
import com.android.tools.smali.dexlib2.Opcode

/** GeocacheApi.search (/mobile/v2/map/search), which caps the results for Basic members. */
internal object GeocacheSearchFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/network/api/geocaches/b;",
    name = "k",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lce4;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

internal val searchReplacePatch = bytecodePatch(
    name = "Map search from geocaching.com",
    description = "Map caches come from geocaching.com's search the way c:geo gets them, without the app's cap " +
        "and with every map filter applied.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(extensionHookPatch)

    execute {
        // Suspend function: p1 = search params, p2 = continuation, resumed by the extension off-thread.
        GeocacheSearchFingerprint.method.replaceInstructions(
            0,
            """
                invoke-static { p1, p2 }, ${Constants.GC_LIVE_SEARCH}->searchAsync(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )

        // "geocaching.com sign-in" in the map menu: the search needs the website session. Added right
        // after the map menu is inflated (onCreateMenu, which ends with the inflate), and shown again
        // at each return of onPrepareMenu, which hides every item it doesn't know.
        val mapMenu = mutableClassDefBy("Lcom/groundspeak/geocaching/intro/mainmap/map/k;").methods
        mapMenu.first { it.name == "d" && it.parameters.size == 2 }.apply {
            addInstruction(implementation!!.instructions.size - 1,
                "invoke-static/range { p1 .. p1 }, ${Constants.GC_LIVE_SESSION}->addMenu(Landroid/view/Menu;)V")
        }
        mapMenu.first { it.name == "b" && it.parameters.size == 1 }.apply {
            val returns = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
            require(returns.isNotEmpty()) { "Map menu preparation not found" }
            returns.reversed().forEach { addInstruction(it, "invoke-static { }, ${Constants.GC_LIVE_SESSION}->showMenu()V") }
        }
    }
}
