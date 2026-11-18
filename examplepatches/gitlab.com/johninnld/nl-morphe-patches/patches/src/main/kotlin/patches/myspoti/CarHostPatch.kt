package patches.myspoti

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.shared.androidAutoHostVisibility

private const val SERVICE = "Lapp/myspoti/host/android/PlaybackService;"

/** Marks the inserted admission code, so a second application is detected. */
internal const val ANY_HOST_MARKER = "morphe:myspoti:android-auto-any-host"

@Suppress("unused")
val carHostPatch = bytecodePatch(
    name = "Allow any Android Auto host",
    description = "Lets any Android Auto compatible host connect to Myspoti's library and playback, including DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, " +
        "whatever its package name or signing key. Google's Android Auto keeps working.",
    default = true,
) {
    compatibleWith(
        Compatibility(name = "Myspoti", packageName = "app.myspoti.stable", apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = null))),
        Compatibility(name = "Orpheon", packageName = "app.orpheon", apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = null))),
    )
    dependsOn(androidAutoHostVisibility)

    execute {
        val service = mutableClassDefBy(SERVICE)
        val dispatchMethods = mutableListOf<Method>()
        classDefForEach { cls -> if (cls.type != SERVICE) dispatchMethods.addAll(cls.methods) }
        val discovered = BrowserDiscovery.discover(service, dispatchMethods)
        val predicate = service.methods.single { it.toString() == discovered.toString() }
        check(predicate.instructions.none {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ANY_HOST_MARKER
        }) { "Myspoti Android Auto host support is already applied" }

        // The browser root and the children/search caller still tie the claimed package to the
        // caller's UID before this predicate runs, so a forged package claim keeps being rejected.
        // Answer the browse permission question with yes for every real host. When Up next already
        // governs admission with its own, possibly restricted, host list, leave that policy alone.
        if (predicate.instructions.none {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == UP_NEXT_HOST_MARKER
            }) {
            val implementation = predicate.implementation
                ?: throw PatchException("Myspoti browse permission predicate has no code")
            if (implementation.registerCount <= predicate.parameterTypes.size + 1)
                throw PatchException("Myspoti browse permission predicate has no free register")
            predicate.addInstructions(0, """
                const-string v0, "$ANY_HOST_MARKER"
                const/4 v0, 0x1
                return v0
            """)
        }
    }
}
