package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import app.morphe.patcher.util.smali.ExternalLabel

/** Binding is not an explicit image retry. Leave the retry entry point intact. */
internal fun BytecodePatchContext.patchThumbnailRebind242(version: String) {
    patchThumbnailPlaybackOverlay(version)
    if (version == "0.8.10.191 dev" || version == "0.8.10.226 dev") {
        patchLegacyThumbnailRequery(version)
        patchLegacyThumbnailBinding(version)
        return
    }
    if (version != "0.8.10.242 dev") return
    val row = mutableClassDefBy("Lo/zzbhe;")
    val parameters = listOf("[Ljava/lang/CharSequence;", "Z", "Z")
    val bind = row.methods.single { it.name == "setImageLinks" && it.parameterTypes == parameters }
    val native = row.methods.single { it.name == "setImageLinks2" && it.parameterTypes == parameters }
    val bridge = MutableMethod(ImmutableMethod(row.type, "haiagaruBindImageLinks", native.parameters,
        "V", 0x1, emptySet(), emptySet(), ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList())))
    bridge.addInstructions(0, """
        const/4 v0, 0x0
        invoke-virtual {p0, p1, v0, p3}, ${row.type}->setImageLinks2([Ljava/lang/CharSequence;ZZ)V
        return-void
    """.trimIndent())
    val sites = bind.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref?.definingClass == row.type && ref.name == native.name && ref.parameterTypes == parameters) index else null
    }
    check(sites.isNotEmpty()) { "242 thumbnail binding delegate missing" }
    for (index in sites) {
        val instruction = bind.implementation!!.instructions[index]
        check(instruction.opcode == Opcode.INVOKE_VIRTUAL)
        val call = instruction as FiveRegisterInstruction
        check(call.registerCount == 4)
        bind.replaceInstruction(index,
            "invoke-virtual {v${call.registerC}, v${call.registerD}, v${call.registerE}, v${call.registerF}}, " +
                "${row.type}->haiagaruBindImageLinks([Ljava/lang/CharSequence;ZZ)V")
    }
    row.methods.add(bridge)

    // An automatic same-URL requery also occurs on attachment and media notifications.
    // Keep its decoded image while the replacement is being decoded. Only intercept
    // the initial empty state here; errors, NG changes and URL changes remain native.
    val image = mutableClassDefBy("Lo/zzbes;")
    val retry = image.methods.single { it.name == "d" && it.parameterTypes == listOf("Z") && it.returnType == "V" }
    val bitmap = image.fields.single { it.type == "Lo/VN22;" }
    val user = image.fields.single { it.name == "mDownloadByUser" && it.type == "Z" }
    val instructions = retry.implementation!!.instructions.toList()
    val reset = instructions.withIndex().single { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == image.type && ref.name == "c" && ref.parameterTypes == listOf("Lo/zzbes\$write;")
    }
    val resetArg = (reset.value as FiveRegisterInstruction).registerD
    val emptyLoad = instructions.take(reset.index).takeLast(2).firstOrNull { it.opcode == Opcode.SGET_OBJECT }
    val empty = (emptyLoad as? ReferenceInstruction)?.reference as? FieldReference
    check(emptyLoad is com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction && emptyLoad.registerA == resetArg)
    check(empty?.definingClass == "Lo/zzbes\$write\$ComponentActivity;" ||
        empty?.type == "Lo/zzbes\$write\$ComponentActivity;") { "242 automatic requery reset changed: $empty" }
    val resetCall = reset.value as FiveRegisterInstruction
    check(resetCall.registerCount == 2)
    val guarded = MutableMethod(ImmutableMethod(image.type, "haiagaruResetForRequery",
        listOf(com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter("Lo/zzbes\$write;", emptySet(), null)),
        "V", 0x1, emptySet(), emptySet(), ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())))
    guarded.addInstructionsWithLabels(0, """
        iget-boolean v0, p0, ${image.type}->${user.name}:Z
        if-nez v0, :reset
        iget-object v0, p0, ${image.type}->${bitmap.name}:Lo/VN22;
        if-eqz v0, :reset
        return-void
        :reset
        invoke-direct {p0, p1}, ${image.type}->c(Lo/zzbes${'$'}write;)V
        return-void
    """.trimIndent())
    retry.replaceInstruction(reset.index,
        "invoke-virtual {v${resetCall.registerC}, v${resetCall.registerD}}, ${image.type}->haiagaruResetForRequery(Lo/zzbes${'$'}write;)V")
    // The queued decoder immediately sets a second temporary loading state.
    // Guard that exact call as well; suppressing just the empty state still flickers.
    val start = image.methods.single { it.name == "f" && it.parameterTypes == listOf(image.type) && it.returnType == "V" }
    val loading = start.implementation!!.instructions.withIndex().single { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == image.type && ref.name == "c" && ref.parameterTypes == listOf("Lo/zzbes\$write;")
    }
    check(loading.value.opcode == Opcode.INVOKE_DIRECT)
    val loadingCall = loading.value as FiveRegisterInstruction
    check(loadingCall.registerCount == 2)
    start.replaceInstruction(loading.index,
        "invoke-virtual {v${loadingCall.registerC}, v${loadingCall.registerD}}, ${image.type}->haiagaruResetForRequery(Lo/zzbes${'$'}write;)V")
    // AsyncTask's onPreExecute publishes loading once more, after f() queued
    // the decoder. The two guards above cannot prevent this third bitmap clear.
    // Limit interception to that loading callback: completed errors/NG/URL
    // changes must still clear an obsolete thumbnail through the native setter.
    val callback = mutableClassDefBy("Lo/zzbes\$_init_lambda1;")
    val beforeDecode = callback.methods.single {
        it.name == "e" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }
    val beforeSite = beforeDecode.implementation!!.instructions.withIndex().single { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == image.type && ref.name == "e" &&
            ref.parameterTypes == listOf(image.type, "Lo/zzbes\$write;") && ref.returnType == "V"
    }
    val beforeCall = beforeSite.value as FiveRegisterInstruction
    check(beforeSite.value.opcode == Opcode.INVOKE_STATIC && beforeCall.registerCount == 2) {
        "242 thumbnail decode loading callback changed"
    }
    beforeDecode.replaceInstruction(beforeSite.index,
        "invoke-virtual {v${beforeCall.registerC}, v${beforeCall.registerD}}, ${image.type}->haiagaruResetForRequery(Lo/zzbes${'$'}write;)V")
    image.methods.add(guarded)
}

/** A retained GIF bitmap must retain the decoder's play badge as well. */
private fun BytecodePatchContext.patchThumbnailPlaybackOverlay(version: String) {
    val config = when (version) {
        "0.8.10.191 dev" -> listOf("Lo/qrExternalSyntheticLambda2;", "Lo/qaf;", "Lo/onAdRequestStarted;", "c", "f", "I", "2131231093")
        "0.8.10.226 dev" -> listOf("Lo/setCornerBottomRightRadius;", "Lo/TTRewardExpressVideoActivity;", "Lo/buildIfSupporteddefault;", "b", "P", "H", "2131231171")
        "0.8.10.242 dev" -> listOf("Lo/zzbhe;", "Lo/zzbes;", "Lo/VN22;", "a", "u", "mOverlayResId", "2131231061")
        else -> return
    }
    val (rowType, imageType, bitmapType, bitmapField, urlField) = config
    val overlayField = config[5]
    val gifIcon = config[6]
    val image = mutableClassDefBy(imageType)
    val row = mutableClassDefBy(rowType)
    val bind = row.methods.single { it.name == (if (version == "0.8.10.191 dev") "a" else "setImageLinks") &&
        it.parameterTypes == listOf("[Ljava/lang/CharSequence;", "Z", "Z") }
    val site = bind.implementation!!.instructions.withIndex().single { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == imageType && ref.name == "setOverlayDrawable"
    }
    val call = site.value as FiveRegisterInstruction
    check(site.value.opcode == Opcode.INVOKE_VIRTUAL && call.registerCount == 2)
    val helper = MutableMethod(ImmutableMethod(imageType, "haiagaruBindOverlay",
        listOf(com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter("Landroid/graphics/drawable/Drawable;", emptySet(), null)),
        "V", 1, emptySet(), emptySet(), ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
    helper.addInstructions(0, """
        if-nez p1, :native_overlay
        iget-object v0, p0, $imageType->$bitmapField:$bitmapType
        if-eqz v0, :native_overlay
        iget v0, p0, $imageType->$overlayField:I
        const v1, $gifIcon
        if-ne v0, v1, :native_overlay
        return-void
        :native_overlay
        invoke-virtual {p0, p1}, $imageType->setOverlayDrawable(Landroid/graphics/drawable/Drawable;)V
        return-void
    """.trimIndent())
    image.methods.add(helper)
    bind.replaceInstruction(site.index,
        "invoke-virtual {v${call.registerC}, v${call.registerD}}, $imageType->haiagaruBindOverlay(Landroid/graphics/drawable/Drawable;)V")
    // Row configuration runs before setImageUrl. Clear a retained GIF badge on
    // URL changes, but leave the separately configured native video badge alone.
    val changed = MutableMethod(ImmutableMethod(imageType, "haiagaruOverlayUrl",
        listOf(com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter("Ljava/lang/String;", emptySet(), null)),
        "V", 1, emptySet(), emptySet(), ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
    changed.addInstructions(0, """
        iget-object v0, p0, $imageType->$urlField:Ljava/lang/String;
        invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
        move-result v0
        if-nez v0, :done
        iget v0, p0, $imageType->$overlayField:I
        const v1, $gifIcon
        if-ne v0, v1, :done
        const/4 v0, 0x0
        invoke-virtual {p0, v0}, $imageType->setOverlayDrawable(Landroid/graphics/drawable/Drawable;)V
        :done
        return-void
    """.trimIndent())
    image.methods.add(changed)
    val url = image.methods.single { it.name == "setImageUrl" && it.parameterTypes == listOf("Ljava/lang/String;", "I", "I") }
    url.addInstructions(0, "invoke-virtual/range {p0 .. p1}, $imageType->haiagaruOverlayUrl(Ljava/lang/String;)V")
}

/** Retain the old image until the legacy decoder delivers its replacement/error. */
private fun BytecodePatchContext.patchLegacyThumbnailRequery(version: String) {
    val old = version == "0.8.10.191 dev"
    val type = if (old) "Lo/qaf;" else "Lo/TTRewardExpressVideoActivity;"
    val image = mutableClassDefBy(type)
    val bitmapType = if (old) "Lo/onAdRequestStarted;" else "Lo/buildIfSupporteddefault;"
    val bitmapField = if (old) "c" else "b"
    val urlField = if (old) "f" else "P"
    val retry = image.methods.single {
        it.name == (if (old) "b" else "d") && it.parameterTypes == listOf("Z") && it.returnType == "V"
    }
    val code = retry.implementation!!.instructions.toList()
    check(retry.implementation!!.registerCount == 4 && code.size == 28) {
        "Legacy thumbnail retry layout changed: $version"
    }
    val start = (code[4] as? ReferenceInstruction)?.reference as? FieldReference
    val resume = (code[22] as? ReferenceInstruction)?.reference as? FieldReference
    check(code[4].opcode == Opcode.IGET_OBJECT && start?.definingClass == type &&
        start.name == bitmapField && start.type == bitmapType &&
        code[22].opcode == Opcode.IGET_OBJECT && resume?.definingClass == type &&
        resume.name == urlField && resume.type == "Ljava/lang/String;") {
        "Legacy thumbnail clear boundaries changed: $version"
    }
    // Stop/cancel and queueing stay native. Only bypass the bitmap release,
    // mosaic cache release and matrix reset for automatic refresh of a loaded URL.
    // The native result handler, NG changes and setImageUrl remain untouched.
    retry.addInstructionsWithLabels(4, """
        if-nez p1, :native_clear
        iget-object v0, p0, $type->$bitmapField:$bitmapType
        if-nez v0, :retain_loaded
    """.trimIndent(), ExternalLabel("native_clear", code[4]), ExternalLabel("retain_loaded", code[22]))
}

private fun BytecodePatchContext.patchLegacyThumbnailBinding(version: String) {
    val old = version == "0.8.10.191 dev"
    val row = mutableClassDefBy(if (old) "Lo/qrExternalSyntheticLambda2;" else "Lo/setCornerBottomRightRadius;")
    val bindParameters = listOf("[Ljava/lang/CharSequence;", "Z", "Z")
    val nativeParameters = if (old) listOf("[Ljava/lang/CharSequence;", "Z") else bindParameters
    val bind = row.methods.single { it.name == (if (old) "a" else "setImageLinks") && it.parameterTypes == bindParameters }
    val native = row.methods.single { it.name == (if (old) "b" else "setImageLinks2") && it.parameterTypes == nativeParameters }
    val bridge = if (old) {
        // 191 has no requery argument: copy its private link loop for normal
        // binding and omit only the unconditional setImageUrl(null) invocation.
        MutableMethod(ImmutableMethod(row.type, "haiagaruBindImageLinks", native.parameters,
            native.returnType, native.accessFlags, native.annotations, native.hiddenApiRestrictions, native.implementation)).apply {
            val clear = implementation!!.instructions.withIndex().single { (_, instruction) ->
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                ref?.definingClass == "Lo/qaf;" && ref.name == "setImageUrl" &&
                    ref.parameterTypes == listOf("Ljava/lang/String;")
            }
            check(clear.value.opcode == Opcode.INVOKE_VIRTUAL) { "191 thumbnail binding clear changed" }
            replaceInstruction(clear.index, "nop")
        }
    } else MutableMethod(ImmutableMethod(row.type, "haiagaruBindImageLinks", native.parameters,
        "V", 0x1, emptySet(), emptySet(), ImmutableMethodImplementation(5, emptyList(), emptyList(), emptyList()))).apply {
        addInstructions(0, """
            const/4 v0, 0x0
            invoke-virtual {p0, p1, v0, p3}, ${row.type}->setImageLinks2([Ljava/lang/CharSequence;ZZ)V
            return-void
        """.trimIndent())
    }
    val sites = bind.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == row.type && ref.name == native.name && ref.parameterTypes == nativeParameters
    }
    check(sites.size == 1) { "Legacy thumbnail normal binding changed: $version" }
    val site = sites.single()
    val call = site.value as FiveRegisterInstruction
    check(site.value.opcode == (if (old) Opcode.INVOKE_DIRECT else Opcode.INVOKE_VIRTUAL))
    val registers = listOf(call.registerC, call.registerD, call.registerE, call.registerF).take(nativeParameters.size + 1)
    bind.replaceInstruction(site.index,
        "${site.value.opcode.name.lowercase().replace('_', '-')} {${registers.joinToString(", ") { "v$it" }}}, $bridge")
    row.methods.add(bridge)
}
