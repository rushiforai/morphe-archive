package app.morphe.patches.pixelcamera.gallery

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val replacePhotosKey = "pref_camera_replace_google_photos_with_immich"
internal const val immichPackage = "app.alextran.immich"

private fun enabledAndUnlocked(fallback: String) = """
    invoke-static {v0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;
    move-result-object v1
    const-string v2, "$replacePhotosKey"
    const/4 v3, 0x0
    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
    move-result v1
    if-eqz v1, :$fallback
    const-class v1, Landroid/app/KeyguardManager;
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;
    move-result-object v1
    check-cast v1, Landroid/app/KeyguardManager;
    if-eqz v1, :$fallback
    invoke-virtual {v1}, Landroid/app/KeyguardManager;->isKeyguardLocked()Z
    move-result v1
    if-nez v1, :$fallback
""".trimIndent()

// Internal dependency of the user-selectable Immich patch.
internal val galleryTargetPatch = bytecodePatch {
    execute {
        val reviewParameters = listOf(
            "Landroid/content/Intent;", "Landroid/view/View;", "Landroid/graphics/Bitmap;"
        )
        val reviewClass = classDefBy { candidate ->
            candidate.methods.any { method ->
                method.returnType == "Z" && method.parameterTypes == reviewParameters &&
                    method.implementation?.instructions?.any { instruction ->
                        ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                            ?.string == "photos_review_launch_timestamp"
                    } == true
            }
        }
        val cameraReview = mutableClassDefBy(reviewClass)
        val review = cameraReview.methods.single {
            it.returnType == "Z" && it.parameterTypes == reviewParameters
        }
        val implementation = checkNotNull(review.implementation)
        check(implementation.registerCount == 9)
        // Other bundles may insert intent preparation before Camera's context read.
        val context = reviewClass.fields.single { it.type == "Landroid/content/Context;" }
        val contextRead = implementation.instructions.indexOfFirst { instruction ->
            instruction.opcode == Opcode.IGET_OBJECT &&
                (instruction as? TwoRegisterInstruction)?.let {
                    it.registerA == 0 && it.registerB == implementation.registerCount - reviewParameters.size - 1
                } == true &&
                (instruction as? ReferenceInstruction)?.reference == context
        }
        check(contextRead >= 0) { "Could not find the thumbnail review context read" }
        val redirectIndex = contextRead + 1
        val activity = implementation.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? FieldReference
        }.first { it.definingClass == reviewClass.type && it.type == "Landroid/app/Activity;" }
        val filmstrip = reviewClass.fields.single {
            it.type == "Lcom/google/android/apps/camera/filmstrip/transition/FilmstripTransitionLayout;"
        }
        val thumbnail = reviewClass.fields.single {
            it.type == "Lcom/google/android/apps/camera/bottombar/ThumbnailView;"
        }

        // Reuse the resolved media URI and its read grant, while keeping secure review in Camera.
        val redirect = """
            ${enabledAndUnlocked("immich_continue")}
            if-eqz p1, :immich_continue
            const-string v1, "com.google.android.apps.photos.api.secure_mode"
            const/4 v2, 0x0
            invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z
            move-result v1
            if-nez v1, :immich_continue
            invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;
            move-result-object v1
            if-eqz v1, :immich_continue
            new-instance v1, Landroid/content/Intent;
            invoke-direct {v1, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V
            const-string v2, "android.intent.action.VIEW"
            invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;
            const/4 v2, 0x0
            invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;
            const-string v2, "$immichPackage"
            invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;
            invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
            move-result-object v2
            invoke-virtual {v1, v2}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;
            move-result-object v2
            if-eqz v2, :immich_continue
            invoke-virtual {v1, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;
            iget-object v2, p0, $activity
            invoke-virtual {v2, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
            iget-object v2, p0, $filmstrip
            const/4 v1, 0x4
            invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V
            const/4 v1, 0x0
            iget-object v2, p0, $thumbnail
            invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V
            invoke-virtual {p2, v1}, Landroid/view/View;->setVisibility(I)V
            return v1
            move-exception v1
            :immich_continue
            nop
        """.trimIndent().toInstructions(review)
        // False tells the caller that no Google Photos transition is pending.
        val start = redirect.indexOfFirst {
            (it as? ReferenceInstruction)?.reference?.toString() ==
                "Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V"
        }
        check(start >= 0)
        val catchIndex = redirect.indexOfFirst { it.opcode == Opcode.MOVE_EXCEPTION }
        check(catchIndex > start)
        redirect.forEachIndexed { index, instruction -> implementation.addInstruction(redirectIndex + index, instruction) }
        val originalReview = implementation.newLabelForIndex(redirectIndex + redirect.size)
        redirect.forEachIndexed { index, instruction ->
            if (instruction.opcode == Opcode.IF_EQZ || instruction.opcode == Opcode.IF_NEZ) {
                implementation.replaceInstruction(redirectIndex + index, BuilderInstruction21t(
                    instruction.opcode, (instruction as OneRegisterInstruction).registerA, originalReview
                ))
            }
        }
        val tryStart = implementation.newLabelForIndex(redirectIndex + start)
        val tryEnd = implementation.newLabelForIndex(redirectIndex + start + 1)
        val handler = implementation.newLabelForIndex(redirectIndex + catchIndex)
        implementation.addCatch("Landroid/content/ActivityNotFoundException;", tryStart, tryEnd, handler)
        implementation.addCatch("Ljava/lang/SecurityException;", tryStart, tryEnd, handler)

        // Skip the Photos installation checks when Immich can be launched.
        val preflight = cameraReview.methods.single { method ->
            method.returnType == "V" && method.parameterTypes == listOf("Lj\$/util/Optional;") &&
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string == "Cannot find Photos package info. Canceling."
                } == true
        }
        val preflightImpl = checkNotNull(preflight.implementation)
        check(preflightImpl.registerCount == 9)
        val overlayCall = preflightImpl.instructions.indexOfFirst {
            (it as? ReferenceInstruction)?.reference?.toString() ==
                "Landroid/view/Window;->setSharedElementsUseOverlay(Z)V"
        }
        check(overlayCall > 4)
        val afterPhotosChecks = preflightImpl.newLabelForIndex(overlayCall - 4)
        // The common launch tail uses both callback IDs assigned by the stock Photos checks.
        fun callbackId(register: Int, expected: Int): Int {
            val assignment = preflightImpl.instructions.take(overlayCall - 4).single {
                (it.opcode == Opcode.CONST_4 || it.opcode == Opcode.CONST_16) &&
                    (it as OneRegisterInstruction).registerA == register &&
                    (it as NarrowLiteralInstruction).narrowLiteral == expected
            }
            return (assignment as NarrowLiteralInstruction).narrowLiteral
        }
        val failureCallback = callbackId(4, 8)
        val cancellationCallback = callbackId(6, 7)
        // Index 5 is the first instruction after the existing in-progress guard.
        check(preflightImpl.instructions[4].opcode == Opcode.RETURN_VOID)
        check(preflightImpl.instructions[5].opcode == Opcode.IGET_OBJECT)
        val bypass = """
            iget-object v0, p0, $context
            ${enabledAndUnlocked("immich_check_photos")}
            invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
            move-result-object v1
            const-string v2, "$immichPackage"
            invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;
            move-result-object v1
            const/16 v4, $failureCallback
            const/16 v6, $cancellationCallback
            nop
            :immich_check_photos
            nop
        """.trimIndent().toInstructions(preflight).toMutableList()
        bypass[bypass.lastIndex - 1] = BuilderInstruction21t(Opcode.IF_NEZ, 1, afterPhotosChecks)
        bypass.forEachIndexed { index, instruction -> preflightImpl.addInstruction(5 + index, instruction) }
        val originalPreflight = preflightImpl.newLabelForIndex(5 + bypass.size)
        bypass.dropLast(2).forEachIndexed { index, instruction ->
            if (instruction.opcode == Opcode.IF_EQZ || instruction.opcode == Opcode.IF_NEZ) {
                preflightImpl.replaceInstruction(5 + index, BuilderInstruction21t(
                    instruction.opcode, (instruction as OneRegisterInstruction).registerA, originalPreflight
                ))
            }
        }
        // The original guard jumps to the stock preflight entry. Retarget it to the new entry.
        preflightImpl.replaceInstruction(3, BuilderInstruction21t(
            Opcode.IF_EQZ, 0, preflightImpl.newLabelForIndex(5)
        ))
    }
}
