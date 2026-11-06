package io.agrokenga.patches.iap

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * Experimental attempt at bypassing PlayFab IAP validation.
 *
 * This does not work on the current IL2CPP build: it is a bytecode patch, but the
 * game logic is compiled into libil2cpp.so, and the target symbols below do not
 * exist in the IL2CPP dump. It is disabled by default so it cannot break patching
 * while the native probe in IAPNativeProbePatch.kt is being evaluated.
 *
 * @author Agrokenga
 * @version 1.0.0
 */
val iapBypassPatch = bytecodePatch(
    name = "IAP Bypass Patch",
    description = "Mocks PlayFab Catalog API for IAP fulfillment without platform billing.",
    default = false
) {
    compatibleWith(
        Compatibility(
            name = "KoPP2",
            packageName = "com.paradoxplaza.kopp2",
            apkFileType = ApkFileType.APKM,
            appIconColor = 0xFFD700,
            targets = listOf(
                AppTarget(version = "2.21.4"),
                AppTarget(version = null, isExperimental = true)
            )
        )
    )

    execute {
        val playFabMethod = Fingerprint(
            definingClass = "LVictor/PlayFabDataService;",
            name = "ExecuteAsync",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT),
            returnType = "Ljava/util/concurrent/CompletableFuture;",
            parameters = listOf(
                "LVictor/Request;",
                "Ljava/lang/Object;",
                "Ljava/util/Map;"
            ),
            filters = listOf(
                opcode(Opcode.INVOKE_SUPER, MatchAfterImmediately())
            )
        ).method

        playFabMethod.addInstructions(
            0,
            """
                const-string v0, "/Catalog/"
                move-object v1, p0
                invoke-virtual {v1}, LVictor/Request;->getUrl()Ljava/lang/String;
                move-result v1
                if-eqz v1, :cond_0
                
                move-result v0
                return v0
                
                :cond_0
                move-result v0
                return v0
            """.trimIndent()
        )
    }
}
