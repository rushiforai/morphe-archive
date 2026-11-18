/*
 * Copyright 2026 Morphe. Modified for Afterglow.
 * Afterglow for Android. Adapted from Morphe patches v2.2.0 "Open system
 * share sheet" (GPLv3), https://github.com/MorpheApp/morphe-patches. See NOTICE.
 * Rewritten for patcher 2.1.0, YouTube 21.43.523 and the iOS nativeShare key.
 * No upstream settings or unrelated patch dependencies. Not an official file.
 * Portions provided "AS IS" without express or implied warranties, including
 * merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.tweaks.navigation

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.smali
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.checkCast
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val FALLBACK_SHARE = "$EXTENSION_PACKAGE/navigation/MorpheFallbackNativeShare;"
private const val FALLBACK_SHEET = "$EXTENSION_PACKAGE/navigation/MorpheFallbackNativeShare\$ActionSheetController;"

/** Selected upstream native share boundaries, with an Afterglow-owned runtime policy. */
internal val morpheFallbackNativeShareHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val sheet = Fingerprint(definingClass = "Latqz;", name = "j",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V", parameters = listOf("Lbrbd;", "Lwug;"),
            strings = listOf("ShowActionSheetCommand needs to provided."))
        val dismiss = Fingerprint(classFingerprint = sheet, name = "f",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V", parameters = listOf("Lj\$/util/Optional;"),
            filters = listOf(methodCall(smali = "Lj\$/util/Optional;->isPresent()Z"),
                methodCall(smali = "Latte;->dismiss()V"),
                fieldAccess(smali = "Latqz;->l:Lbrbd;", opcode = Opcode.IPUT_OBJECT))).method
        val entity = Fingerprint(definingClass = "Lavps;", name = "d",
            accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
            returnType = "V", parameters = listOf("Lbmbw;", "Ljava/util/Map;"),
            strings = listOf("Command not in share entity endpoint proto."),
            filters = listOf(fieldAccess(smali = "Lbmbw;->g:Lbdso;"),
                methodCall(smali = "Laksq;->c(Lbdso;Ljava/util/Map;)V"))).method
        val update = Fingerprint(definingClass = "Lavqe;", name = "b",
            accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
            returnType = "V", parameters = listOf("Lbdso;", "Ljava/util/Map;"),
            strings = listOf("fullscreen_spinner_fragment"), filters = listOf(
                fieldAccess(smali = "Lbobw;->b:Lbbju;", opcode = Opcode.SGET_OBJECT),
                checkCast("Lbobw;"),
                methodCall(smali = "Ljava/util/Iterator;->next()Ljava/lang/Object;"),
                opcode(Opcode.MOVE_RESULT_OBJECT, MatchAfterImmediately()),
                checkCast("Landroid/content/pm/ResolveInfo;", MatchAfterImmediately()),
                fieldAccess(smali = "Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;",
                    location = MatchAfterImmediately()),
                fieldAccess(smali = "Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;",
                    location = MatchAfterImmediately()),
                fieldAccess(smali = "Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;",
                    location = MatchAfterImmediately())))
        val updateMethod = update.method
        val cast = update.instructionMatches[1]
        val endpointRegister = (cast.instruction as OneRegisterInstruction).registerA

        // Resolve every native method before editing the shared controller or either flow.
        val host = sheet.classDef
        require(host.methods.none { it.name == "afterglow_dismissShareSheet" })
        host.interfaces.add(FALLBACK_SHEET)
        host.addMethod("afterglow_dismissShareSheet", "V", 2, """
            invoke-static {}, Lj${'$'}/util/Optional;->empty()Lj${'$'}/util/Optional;
            move-result-object v0
            invoke-virtual { p0, v0 }, ${dismiss.smali}
            return-void
        """)
        sheet.method.addInstructions(0,
            "invoke-static/range { p0 .. p0 }, $FALLBACK_SHARE->setActionSheetController($FALLBACK_SHEET)V")

        fun MutableMethod.intercept(index: Int, endpoint: Int) {
            val free = getFreeRegisterProvider(index, 1, endpoint).getFreeRegister4Bit()
            addInstructionsWithLabels(index, """
                invoke-static {}, $FALLBACK_SHARE->isEnabled()Z
                move-result v$free
                if-eqz v$free, :afterglow_native_share
                invoke-interface/range { v$endpoint .. v$endpoint }, Lcom/google/protobuf/MessageLite;->toByteArray()[B
                move-result-object v$free
                invoke-static/range { v$free .. v$free }, $FALLBACK_SHARE->openSystemShareSheet([B)Z
                move-result v$free
                if-eqz v$free, :afterglow_native_share
                return-void
                :afterglow_native_share
                nop
            """)
            println("Afterglow temporary native-share adapter: $smali, endpoint=v$endpoint")
        }
        updateMethod.intercept(cast.index + 1, endpointRegister)
        entity.intercept(0, entity.implementation!!.registerCount - 2)
        println("Afterglow native-share placeholder: ${sheet.method.smali}, dismiss=${dismiss.smali}")
    }
}
