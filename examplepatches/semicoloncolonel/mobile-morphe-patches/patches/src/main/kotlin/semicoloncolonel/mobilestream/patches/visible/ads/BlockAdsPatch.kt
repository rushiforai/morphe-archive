package semicoloncolonel.mobilestream.patches.visible.ads

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import semicoloncolonel.mobilestream.patches.shared.misc.forEachMatchingMethod
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly
import semicoloncolonel.mobilestream.patches.visible.shared.Constants

// Visible 3.0.5 bundles Madme, an ad SDK that shows ads on top of other
// apps, after phone calls, when the phone is unlocked, and as
// notifications, and runs its own surveys, geofences, and tracking. It
// starts itself through a content provider before the app's own code runs.
// That start is skipped, the SDK's enabled flag is never set, and every
// enabled check reports false, so its receivers and public calls return at
// once.

private const val MADME = "Lcom/madme/mobile/sdk/"

@Suppress("unused")
val blockAdsPatch = bytecodePatch(
    name = "Block ads",
    description = "Stops Madme, which shows ads over other apps, after calls, when you unlock " +
        "the phone, and as notifications.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        fun stop(what: String, classFilter: (String) -> Boolean, methodFilter: (Method) -> Boolean, smali: String) {
            val count = forEachMatchingMethod({ classFilter(it.type) }, methodFilter) { it.returnEarly(smali) }
            if (count == 0) throw PatchException("Madme $what not found")
        }

        stop(
            "init provider",
            { it == "${MADME}MadmeInitProvider;" },
            { it.name == "onCreate" && it.returnType == "Z" && it.parameterTypes.isEmpty() },
            "const/4 v0, 0x0\nreturn v0",
        )
        // The private (Resources) method that reads the enabled flag.
        stop(
            "enabled flag",
            { it == "${MADME}MadmeService;" },
            { it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/content/res/Resources;") },
            "return-void",
        )
        stop(
            "enabled checks",
            { it == "${MADME}MadmeService;" || it == "${MADME}DefaultHostApplication;" },
            { (it.name == "isEnabled" || it.name == "isMadmeEnabled") && it.returnType == "Z" && it.parameterTypes.isEmpty() },
            "const/4 v0, 0x0\nreturn v0",
        )
        stop(
            "auto registration",
            { it == "${MADME}MadmeService;" },
            { it.name == "autoRegisterIfNeeded" && it.returnType == "V" },
            "return-void",
        )
    }
}
