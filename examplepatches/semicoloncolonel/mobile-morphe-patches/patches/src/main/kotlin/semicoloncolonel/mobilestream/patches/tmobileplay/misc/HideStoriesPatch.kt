package semicoloncolonel.mobilestream.patches.tmobileplay.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.tmobileplay.shared.Constants

// T-Mobile Play 19.4.4 shows Storyteller stories and video clips (with their own
// ads and viewing analytics) as rows and grids in its feeds. Every row and
// grid is drawn by Storyteller's entry point composable, which now draws
// nothing, so Storyteller never loads.

@Suppress("unused")
val hideStoriesPatch = bytecodePatch(
    name = "Hide stories",
    description = "Removes the Storyteller stories and video clips from T-Mobile Play's feeds. " +
        "Opt-in; test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val count = forEachMatchingMethod(
            { true },
            { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
                    method.parameterTypes.map { it.toString() }.let {
                        "Lcom/storyteller/data/StorytellerDataModel;" in it &&
                            "Lcom/storyteller/ui/list/StorytellerListViewDelegate;" in it &&
                            it.any { type -> type.startsWith("Landroidx/compose/runtime/") }
                    }
            },
        ) { it.returnEarly("return-void") }
        if (count == 0) throw PatchException("Storyteller entry point not found")
    }
}
