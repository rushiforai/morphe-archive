package app.template.patches.mxplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CLASSIC_THEME_ENGINE_CLASS = "Lapp/template/extension/mxplayer/ClassicThemeEngine;"

internal fun Method.parameterRegisterCount(): Int {
    val receiverRegs = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    val argRegs = parameterTypes.sumOf { type ->
        if (type == "J" || type == "D") 2 else 1
    }
    return receiverRegs + argRegs
}

internal fun Method.containsString(substring: String): Boolean {
    val impl = implementation ?: return false
    return impl.instructions.any { insn ->
        val str = ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string
        str != null && substring in str
    }
}

internal fun MutableClass.replaceMethodBody(
    method: Method,
    localRegisters: Int,
    smaliInstructions: String,
) {
    if (AccessFlags.ABSTRACT.isSet(method.accessFlags) || AccessFlags.NATIVE.isSet(method.accessFlags)) {
        throw PatchException("Refusing to rewrite abstract/native method ${type}->${method.name}")
    }
    val totalRegisters = method.parameterRegisterCount() + localRegisters
    val mutableCopy = ImmutableMethod(
        method.definingClass,
        method.name,
        method.parameters,
        method.returnType,
        method.accessFlags,
        method.annotations,
        method.hiddenApiRestrictions,
        MutableMethodImplementation(totalRegisters),
    ).toMutable()
    mutableCopy.addInstructionsWithLabels(0, smaliInstructions)
    methods.remove(method)
    methods.add(mutableCopy)
}

/**
 * Moves [method]'s untouched original implementation into a `private` sibling `<name>$mxorig` on
 * [this] class and installs a fresh wrapper body with [localRegisters] local registers.
 */
internal fun MutableClass.wrapWithPrivateOrig(
    method: MutableMethod,
    localRegisters: Int,
    smaliBuilder: (origMethodName: String) -> String,
) {
    if (AccessFlags.ABSTRACT.isSet(method.accessFlags) || AccessFlags.NATIVE.isSet(method.accessFlags)) {
        throw PatchException("Refusing to wrap abstract/native method ${type}->${method.name}")
    }
    val origPublicName = method.name
    val origPrivateName = "${origPublicName}\$mxorig"
    val origFlags = method.accessFlags
    val origParams = method.parameters.toList()
    val origReturnType = method.returnType
    val origAnnotations = method.annotations.toSet()
    val origHiddenApi = method.hiddenApiRestrictions.toSet()
    val paramRegs = method.parameterRegisterCount()

    val isStatic = AccessFlags.STATIC.isSet(origFlags)
    val privateFlags = AccessFlags.PRIVATE.value or
        (if (isStatic) AccessFlags.STATIC.value else AccessFlags.FINAL.value)

    methods.remove(method)
    method.setName(origPrivateName)
    method.setAccessFlags(privateFlags)
    methods.add(method)

    val wrapper = ImmutableMethod(
        type,
        origPublicName,
        origParams,
        origReturnType,
        origFlags,
        origAnnotations,
        origHiddenApi,
        MutableMethodImplementation(paramRegs + localRegisters),
    ).toMutable()
    wrapper.addInstructionsWithLabels(0, smaliBuilder(origPrivateName).trimIndent())
    methods.add(wrapper)
}

internal fun MutableClass.returnVoid(method: Method) {
    replaceMethodBody(
        method = method,
        localRegisters = 0,
        smaliInstructions = "return-void",
    )
}

internal fun MutableClass.returnBoolean(method: Method, value: Boolean) {
    val literal = if (value) "0x1" else "0x0"
    replaceMethodBody(
        method = method,
        localRegisters = 1,
        smaliInstructions = """
            const/4 v0, $literal
            return v0
        """.trimIndent(),
    )
}

internal fun MutableClass.returnNull(method: Method) {
    replaceMethodBody(
        method = method,
        localRegisters = 1,
        smaliInstructions = """
            const/4 v0, 0x0
            return-object v0
        """.trimIndent(),
    )
}

internal fun MutableClass.returnUnitInstance(method: Method) {
    replaceMethodBody(
        method = method,
        localRegisters = 1,
        smaliInstructions = """
            sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
            return-object v0
        """.trimIndent(),
    )
}

internal fun MutableClass.requireMethod(
    name: String,
    returnType: String? = null,
    parameterTypes: List<String>? = null,
): MutableMethod = methods.firstOrNull { candidate ->
    candidate.name == name &&
        (returnType == null || candidate.returnType == returnType) &&
        (parameterTypes == null || candidate.parameterTypes == parameterTypes)
} ?: throw PatchException(
    "Expected method $type->$name(${parameterTypes?.joinToString("") ?: "*"}) not found",
)

/**
 * Installs the clean App Theme & Classic Themes engine across MX Player 3.3.1 / 3.4.0 / 3.4.1:
 * 1. Suppresses online/ad-locked Zodiac theme fetches (`loadDataFromLocal$2`, `loadDataFromServer$2`).
 * 2. Always populates Row 1 (`Adaptive | Light Theme | Dark Theme`) + all 32 `Classic Themes`
 *    swatches (`16` solid Light + `16` split `#1c2939` Dark Slate) with deterministic skin IDs
 *    and zero offline warning banners.
 * 3. Wires `ClassicThemeEngine` into `SkinManager`, `ThemeLight`, `ThemeStrategyBase`,
 *    `ResourcesSkin`, `AppCompatUtils`, and `ThemeListActivity`'s swatch click handler so every
 *    swatch applies immediately in 1 tap and recolors MX Player across restarts.
 */
internal fun BytecodePatchContext.installCleanClassicThemeEngine() {
    // 1. Suppress cached/online "Other Themes" (Zodiac) payloads.
    val loadLocalClass = AppThemeLoadFromLocalFingerprint.classDef
    loadLocalClass.accessFlags = loadLocalClass.accessFlags or AccessFlags.PUBLIC.value
    loadLocalClass.returnNull(AppThemeLoadFromLocalFingerprint.method)

    val loadServerClass = AppThemeLoadFromServerFingerprint.classDef
    loadServerClass.accessFlags = loadServerClass.accessFlags or AccessFlags.PUBLIC.value
    loadServerClass.returnNull(AppThemeLoadFromServerFingerprint.method)

    // 2. Always synthesize all 32 local Classic Theme swatches, assign deterministic IDs, and
    //    suppress offline tips/overlays.
    val observerMethod = ClassicThemeObserverFingerprint.method
    val classicStrIdx = observerMethod.instructions.indexOfFirst { insn ->
        ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string == "Local Classic Theme"
    }
    if (classicStrIdx < 0) {
        throw PatchException("Local Classic Theme anchor not found in ${observerMethod.definingClass}")
    }

    val searchStart = (classicStrIdx - 40).coerceAtLeast(0)
    val netCheckIdx = (searchStart until classicStrIdx).firstOrNull { idx ->
        val insn = observerMethod.getInstruction(idx)
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_STATIC &&
            ref?.parameterTypes == listOf("Landroid/content/Context;") &&
            ref.returnType == "Z"
    } ?: throw PatchException("Network gate not found before Local Classic Theme in ${observerMethod.definingClass}")

    val netDestReg = (observerMethod.getInstruction(netCheckIdx + 1) as OneRegisterInstruction).registerA
    observerMethod.replaceInstruction(netCheckIdx, "nop")
    observerMethod.replaceInstruction(netCheckIdx + 1, "const/4 v$netDestReg, 0x0")

    val searchEnd = minOf(observerMethod.instructions.size, classicStrIdx + 160)
    val prependTipIdx = ((classicStrIdx + 1) until searchEnd).firstOrNull { idx ->
        val insn = observerMethod.getInstruction(idx)
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_VIRTUAL &&
            ref?.definingClass == "Ljava/util/ArrayList;" &&
            ref.name == "add" &&
            ref.parameterTypes == listOf("I", "Ljava/lang/Object;")
    }
    if (prependTipIdx != null) {
        observerMethod.replaceInstruction(prependTipIdx, "nop")
    }

    val setListEnd = minOf(observerMethod.instructions.size, classicStrIdx + 150)
    val setResourceListIdx = ((classicStrIdx + 1) until setListEnd).firstOrNull { idx ->
        val insn = observerMethod.getInstruction(idx)
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_VIRTUAL &&
            ref?.name == "setResourceList" &&
            ref.parameterTypes == listOf("Ljava/util/List;")
    } ?: throw PatchException("ResourceCollection->setResourceList(List) not found in ${observerMethod.definingClass}")

    val setListInsn = observerMethod.getInstruction(setResourceListIdx) as FiveRegisterInstruction
    val itemsListReg = setListInsn.registerD
    observerMethod.addInstructions(
        setResourceListIdx + 1,
        "invoke-static {v$itemsListReg}, $CLASSIC_THEME_ENGINE_CLASS->assignLocalClassicIds(Ljava/util/List;)V",
    )

    val onCreateMethod = ThemeListActivityOnCreateFingerprint.method
    val activityNetIdx = onCreateMethod.instructions.indexOfFirst { insn ->
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_STATIC &&
            ref?.parameterTypes == listOf("Landroid/content/Context;") &&
            ref.returnType == "Z"
    }
    if (activityNetIdx >= 0) {
        val destReg = (onCreateMethod.getInstruction(activityNetIdx + 1) as OneRegisterInstruction).registerA
        onCreateMethod.replaceInstruction(activityNetIdx, "nop")
        onCreateMethod.replaceInstruction(activityNetIdx + 1, "const/4 v$destReg, 0x1")
    }

    // 3. Hook SkinManager (`SkinManager.java`: `o5i` / `k3i` / `vmi`).
    val skinManagerClass = SkinManagerInitFingerprint.classDef
    val appField = skinManagerClass.instanceFields.firstOrNull {
        it.type == "Lcom/mxtech/videoplayer/e;"
    } ?: throw PatchException("Application field not found on ${skinManagerClass.type}")
    val skinNameField = skinManagerClass.instanceFields.firstOrNull {
        it.type == "Ljava/lang/String;"
    } ?: throw PatchException("skinName String field not found on ${skinManagerClass.type}")

    SkinManagerInitFingerprint.method.appendBeforeReturnVoid(
        """
            iget-object v0, p0, $appField
            iget-object v1, p0, $skinNameField
            invoke-static {v0, v1}, $CLASSIC_THEME_ENGINE_CLASS->init(Ljava/lang/Object;Ljava/lang/String;)V
        """.trimIndent(),
    )

    skinManagerClass.requireMethod("r", "V", listOf("Ljava/lang/String;")).appendBeforeReturnVoid(
        """
            iget-object v0, p0, $skinNameField
            invoke-static {v0}, $CLASSIC_THEME_ENGINE_CLASS->syncSkinName(Ljava/lang/String;)V
        """.trimIndent(),
    )

    skinManagerClass.requireMethod(
        "onSharedPreferenceChanged",
        "V",
        listOf("Landroid/content/SharedPreferences;", "Ljava/lang/String;"),
    ).appendBeforeReturnVoid(
        """
            iget-object v0, p0, $skinNameField
            invoke-static {v0}, $CLASSIC_THEME_ENGINE_CLASS->syncSkinName(Ljava/lang/String;)V
        """.trimIndent(),
    )

    val isDarkMethod = skinManagerClass.requireMethod("j", "Z", emptyList())
    skinManagerClass.wrapWithPrivateOrig(isDarkMethod, localRegisters = 1) { origName ->
        """
            invoke-static {}, $CLASSIC_THEME_ENGINE_CLASS->isActive()Z
            move-result v0
            if-eqz v0, :delegate_orig
            invoke-static {}, $CLASSIC_THEME_ENGINE_CLASS->isDark()Z
            move-result v0
            return v0
            :delegate_orig
            invoke-direct {p0}, ${skinManagerClass.type}->$origName()Z
            move-result v0
            return v0
        """
    }

    val getStrategyMethod = skinManagerClass.methods.firstOrNull {
        it.name == "d" && it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags)
    } ?: throw PatchException("SkinManager->d() strategy getter not found on ${skinManagerClass.type}")
    val isExtCallIdx = getStrategyMethod.instructions.indexOfFirst { insn ->
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_VIRTUAL &&
            ref?.definingClass == skinManagerClass.type &&
            ref.name == "m" &&
            ref.parameterTypes.isEmpty() &&
            ref.returnType == "Z"
    }
    if (isExtCallIdx < 0) {
        throw PatchException("SkinManager->m() call not found inside ${skinManagerClass.type}->d()")
    }
    val isExtReg = (getStrategyMethod.getInstruction(isExtCallIdx + 1) as OneRegisterInstruction).registerA

    val firstSkinKeyCallIdx = getStrategyMethod.instructions.indexOfFirst { insn ->
        val ref = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_VIRTUAL &&
            ref?.definingClass == skinManagerClass.type &&
            ref.name == "h" &&
            ref.parameterTypes.isEmpty() &&
            ref.returnType == "Ljava/lang/String;"
    }
    if (firstSkinKeyCallIdx < 0) {
        throw PatchException("SkinManager->h() call not found inside ${skinManagerClass.type}->d()")
    }
    val skinKeyReg = (getStrategyMethod.getInstruction(firstSkinKeyCallIdx + 1) as OneRegisterInstruction).registerA

    // Insert higher-index hook first so `firstSkinKeyCallIdx` stays unshifted.
    getStrategyMethod.addInstructions(
        isExtCallIdx + 2,
        """
            invoke-static {v$isExtReg}, $CLASSIC_THEME_ENGINE_CLASS->shouldLoadExternalSkinPack(Z)Z
            move-result v$isExtReg
        """.trimIndent(),
    )
    getStrategyMethod.addInstructions(
        firstSkinKeyCallIdx + 2,
        """
            invoke-static {v$skinKeyReg}, $CLASSIC_THEME_ENGINE_CLASS->resolveBaseStrategyKey(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$skinKeyReg
        """.trimIndent(),
    )

    // 4. Hook ThemeLight (`ThemeLight.java`) so `SkinViewInflater.t(...)` inflates `mxSkin` views
    //    when a Light Classic theme is active while staying fast-path `true` on stock Light Theme.
    val themeLightClass = ThemeLightStrategyFingerprint.classDef
    themeLightClass.replaceMethodBody(
        method = ThemeLightStrategyFingerprint.method,
        localRegisters = 1,
        smaliInstructions = """
            invoke-static {}, $CLASSIC_THEME_ENGINE_CLASS->isNotActive()Z
            move-result v0
            return v0
        """.trimIndent(),
    )

    // 5. Hook ThemeStrategyBase (`ThemeStrategyBase.java`) color, ColorStateList & drawable resolvers.
    val strategyBaseClass = ThemeStrategyBaseFingerprint.classDef
    val strategyColorMethod = strategyBaseClass.methods.firstOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.returnType == "I" &&
            it.parameterTypes == listOf("Landroid/content/Context;", "I")
    } ?: throw PatchException("ThemeStrategyBase->(Context, I)I not found on ${strategyBaseClass.type}")
    strategyBaseClass.wrapWithPrivateOrig(strategyColorMethod, localRegisters = 1) { origName ->
        """
            invoke-direct {p0, p1, p2}, ${strategyBaseClass.type}->$origName(Landroid/content/Context;I)I
            move-result v0
            invoke-static {p1, p2, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideStrategyColor(Landroid/content/Context;II)I
            move-result v0
            return v0
        """
    }

    val strategyCslMethod = strategyBaseClass.methods.firstOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.returnType == "Landroid/content/res/ColorStateList;" &&
            it.parameterTypes == listOf("Landroid/content/Context;", "I")
    } ?: throw PatchException("ThemeStrategyBase->(Context, I)ColorStateList not found on ${strategyBaseClass.type}")
    strategyBaseClass.wrapWithPrivateOrig(strategyCslMethod, localRegisters = 1) { origName ->
        """
            invoke-direct {p0, p1, p2}, ${strategyBaseClass.type}->$origName(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
            move-result-object v0
            invoke-static {p1, p2, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideStrategyColorStateList(Landroid/content/Context;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;
            move-result-object v0
            return-object v0
        """
    }

    val strategyDrawableMethod = strategyBaseClass.methods.firstOrNull {
        !AccessFlags.STATIC.isSet(it.accessFlags) &&
            it.returnType == "Landroid/graphics/drawable/Drawable;" &&
            it.parameterTypes == listOf("Landroid/content/Context;", "I")
    } ?: throw PatchException("ThemeStrategyBase->(Context, I)Drawable not found on ${strategyBaseClass.type}")
    strategyBaseClass.wrapWithPrivateOrig(strategyDrawableMethod, localRegisters = 1) { origName ->
        """
            invoke-direct {p0, p1, p2}, ${strategyBaseClass.type}->$origName(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
            move-result-object v0
            invoke-static {p1, p2, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideStrategyDrawable(Landroid/content/Context;ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
            move-result-object v0
            return-object v0
        """
    }

    // 6. Hook ResourcesSkin (`ResourcesSkin.kt`) color, ColorStateList & drawable overloads.
    val resSkinClass = ResourcesSkinFingerprint.classDef
    val baseResField = resSkinClass.instanceFields.firstOrNull {
        it.type == "Landroid/content/res/Resources;"
    } ?: throw PatchException("Base Resources field not found on ${resSkinClass.type}")

    resSkinClass.wrapWithPrivateOrig(
        resSkinClass.requireMethod("getColor", "I", listOf("I")),
        localRegisters = 2,
    ) { origName ->
        """
            invoke-direct {p0, p1}, ${resSkinClass.type}->$origName(I)I
            move-result v0
            iget-object v1, p0, $baseResField
            invoke-static {v1, p1, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideResColor(Landroid/content/res/Resources;II)I
            move-result v0
            return v0
        """
    }

    resSkinClass.wrapWithPrivateOrig(
        resSkinClass.requireMethod("getColor", "I", listOf("I", "Landroid/content/res/Resources\$Theme;")),
        localRegisters = 2,
    ) { origName ->
        """
            invoke-direct {p0, p1, p2}, ${resSkinClass.type}->$origName(ILandroid/content/res/Resources${'$'}Theme;)I
            move-result v0
            iget-object v1, p0, $baseResField
            invoke-static {v1, p1, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideResColor(Landroid/content/res/Resources;II)I
            move-result v0
            return v0
        """
    }

    resSkinClass.wrapWithPrivateOrig(
        resSkinClass.requireMethod("getColorStateList", "Landroid/content/res/ColorStateList;", listOf("I")),
        localRegisters = 2,
    ) { origName ->
        """
            invoke-direct {p0, p1}, ${resSkinClass.type}->$origName(I)Landroid/content/res/ColorStateList;
            move-result-object v0
            iget-object v1, p0, $baseResField
            invoke-static {v1, p1, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideResColorStateList(Landroid/content/res/Resources;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;
            move-result-object v0
            return-object v0
        """
    }

    resSkinClass.wrapWithPrivateOrig(
        resSkinClass.requireMethod(
            "getColorStateList",
            "Landroid/content/res/ColorStateList;",
            listOf("I", "Landroid/content/res/Resources\$Theme;"),
        ),
        localRegisters = 2,
    ) { origName ->
        """
            invoke-direct {p0, p1, p2}, ${resSkinClass.type}->$origName(ILandroid/content/res/Resources${'$'}Theme;)Landroid/content/res/ColorStateList;
            move-result-object v0
            iget-object v1, p0, $baseResField
            invoke-static {v1, p1, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideResColorStateList(Landroid/content/res/Resources;ILandroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;
            move-result-object v0
            return-object v0
        """
    }

    resSkinClass.wrapWithPrivateOrig(
        resSkinClass.requireMethod("getDrawable", "Landroid/graphics/drawable/Drawable;", listOf("I")),
        localRegisters = 2,
    ) { origName ->
        """
            invoke-direct {p0, p1}, ${resSkinClass.type}->$origName(I)Landroid/graphics/drawable/Drawable;
            move-result-object v0
            iget-object v1, p0, $baseResField
            invoke-static {v1, p1, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideResDrawable(Landroid/content/res/Resources;ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
            move-result-object v0
            return-object v0
        """
    }

    resSkinClass.wrapWithPrivateOrig(
        resSkinClass.requireMethod(
            "getDrawable",
            "Landroid/graphics/drawable/Drawable;",
            listOf("I", "Landroid/content/res/Resources\$Theme;"),
        ),
        localRegisters = 2,
    ) { origName ->
        """
            invoke-direct {p0, p1, p2}, ${resSkinClass.type}->$origName(ILandroid/content/res/Resources${'$'}Theme;)Landroid/graphics/drawable/Drawable;
            move-result-object v0
            iget-object v1, p0, $baseResField
            invoke-static {v1, p1, v0}, $CLASSIC_THEME_ENGINE_CLASS->overrideResDrawable(Landroid/content/res/Resources;ILandroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
            move-result-object v0
            return-object v0
        """
    }

    // 7. Hook AppCompatUtils (`AppCompatUtils.java`) toolbar menu icon filter.
    val appCompatUtilsClass = AppCompatUtilsColorFilterFingerprint.classDef
    appCompatUtilsClass.wrapWithPrivateOrig(
        AppCompatUtilsColorFilterFingerprint.method,
        localRegisters = 1,
    ) { origName ->
        """
            invoke-static {p0, p1, p2}, $CLASSIC_THEME_ENGINE_CLASS->overrideToolbarIconFilter(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;
            move-result-object v0
            if-nez v0, :done
            invoke-static {p0, p1, p2}, ${appCompatUtilsClass.type}->$origName(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;
            move-result-object v0
            :done
            return-object v0
        """
    }

    // 8. Hook ThemeListActivity's swatch click handler (`xfj.B8` / `ycj.B8` / `i3k.E8`) so tapping
    //    any Classic Theme swatch applies it immediately in 1 tap via `ThemeSwitchHelper.a(String)`.
    val clickHandlerClass = ThemeListClickHandlerFingerprint.classDef
    val clickHandlerMethod = ThemeListClickHandlerFingerprint.method
    val themeSwitchRef = clickHandlerMethod.instructions
        .filter { it.opcode == Opcode.INVOKE_STATIC }
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .firstOrNull {
            it.name == "a" &&
                it.parameterTypes == listOf("Ljava/lang/String;") &&
                it.returnType == "V"
        } ?: throw PatchException("ThemeSwitchHelper->a(String)V reference not found in ${clickHandlerClass.type}")

    val themeSwitchClass = mutableClassDefBy(themeSwitchRef.definingClass)
    themeSwitchClass.accessFlags = themeSwitchClass.accessFlags or AccessFlags.PUBLIC.value

    clickHandlerClass.wrapWithPrivateOrig(clickHandlerMethod, localRegisters = 1) { origName ->
        """
            invoke-static {p2}, $CLASSIC_THEME_ENGINE_CLASS->consumeLocalClassicClick(Ljava/lang/Object;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :delegate_orig
            invoke-static {v0}, $themeSwitchRef
            return-void
            :delegate_orig
            invoke-direct {p0, p1, p2, p3}, ${clickHandlerClass.type}->$origName(Lcom/mxtech/videoplayer/ad/online/model/bean/next/OnlineResource;Lcom/mxtech/videoplayer/ad/online/model/bean/next/OnlineResource;I)V
            return-void
        """
    }
}

internal data class LocalMeBindingInfo(
    val baseBindingField: FieldReference,
    val bindingType: String,
    val promoAndAdFields: List<FieldReference>,
    val rowFieldsByLabel: Map<String, FieldReference>,
    val statusSaverBadgeField: FieldReference?,
)

internal fun resolveLocalMeBinding(localMeClass: MutableClass): LocalMeBindingInfo {
    val onClick = localMeClass.requireMethod("onClick", "V", listOf("Landroid/view/View;"))
    val insns = onClick.instructions

    val baseBindingField = insns
        .filterIsInstance<ReferenceInstruction>()
        .mapNotNull { it.reference as? FieldReference }
        .firstOrNull { it.definingClass == LOCAL_ME_BASE_FRAGMENT_CLASS }
        ?: throw PatchException("Failed to locate ViewBinding field on $LOCAL_ME_BASE_FRAGMENT_CLASS")

    val bindingType = insns
        .filter { it.opcode == Opcode.CHECK_CAST }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type }
        .firstOrNull { it != "Landroid/view/View;" }
        ?: throw PatchException("Failed to resolve LocalMeFragment ViewBinding type")

    val targetLabels = listOf(
        "WhatsApp Status Saver",
        "Custom PIP Controls",
        "Legal",
        "Help",
        "DataPrivacy",
    )
    val rowFields = LinkedHashMap<String, FieldReference>()
    var statusSaverBadgeField: FieldReference? = null

    for (label in targetLabels) {
        val strIdx = insns.indexOfFirst { insn ->
            ((insn as? ReferenceInstruction)?.reference as? StringReference)?.string == label
        }
        if (strIdx < 0) {
            throw PatchException("Label '$label' not found in LocalMeFragment->onClick")
        }
        var foundField: FieldReference? = null
        for (idx in strIdx downTo 0) {
            val fRef = (insns[idx] as? ReferenceInstruction)?.reference as? FieldReference ?: continue
            if (fRef.definingClass != bindingType) continue
            if (label == "WhatsApp Status Saver" &&
                statusSaverBadgeField == null &&
                fRef.type == "Landroidx/appcompat/widget/AppCompatTextView;"
            ) {
                statusSaverBadgeField = fRef
            }
            if (fRef.type == "Landroidx/appcompat/widget/LinearLayoutCompat;") {
                foundField = fRef
                break
            }
        }
        rowFields[label] = foundField
            ?: throw PatchException("Row field for '$label' not found on $bindingType")
    }

    val onConfigChanged = localMeClass.requireMethod(
        "onConfigurationChanged",
        "V",
        listOf("Landroid/content/res/Configuration;"),
    )
    val promoAndAdFields = onConfigChanged.instructions
        .filterIsInstance<ReferenceInstruction>()
        .mapNotNull { it.reference as? FieldReference }
        .filter { it.definingClass == bindingType }
        .distinctBy { "${it.name}:${it.type}" }

    if (promoAndAdFields.isEmpty()) {
        throw PatchException("Failed to resolve promo/ad container fields in LocalMeFragment->onConfigurationChanged")
    }

    return LocalMeBindingInfo(
        baseBindingField = baseBindingField,
        bindingType = bindingType,
        promoAndAdFields = promoAndAdFields,
        rowFieldsByLabel = rowFields,
        statusSaverBadgeField = statusSaverBadgeField,
    )
}

/**
 * Appends smali right before the final `return-void` of [this] method while preserving all
 * existing branch `Label`s that jump to `return-void`!
 */
internal fun MutableMethod.appendBeforeReturnVoid(smaliBlock: String) {
    val returnIdx = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
    if (returnIdx < 0) {
        throw PatchException("return-void not found in ${definingClass}->${name}")
    }
    replaceInstruction(returnIdx, "nop")
    addInstructionsWithLabels(
        returnIdx + 1,
        """
            $smaliBlock
            return-void
        """.trimIndent(),
    )
}

internal fun MutableMethod.appendHideBindingViews(
    bindingInfo: LocalMeBindingInfo,
    fieldsToHide: List<FieldReference>,
    hideParentsOf: List<FieldReference> = emptyList(),
) {
    if (fieldsToHide.isEmpty() && hideParentsOf.isEmpty()) return
    val tag = instructions.size

    val smali = buildString {
        appendLine("iget-object v0, p0, ${bindingInfo.baseBindingField}")
        appendLine("if-eqz v0, :cond_binding_done_$tag")
        appendLine("const/16 v1, 0x8")
        for ((idx, field) in fieldsToHide.withIndex()) {
            val skipLabel = "skip_view_${tag}_$idx"
            appendLine("iget-object v0, p0, ${bindingInfo.baseBindingField}")
            appendLine("check-cast v0, ${bindingInfo.bindingType}")
            appendLine("iget-object v0, v0, $field")
            appendLine("if-eqz v0, :$skipLabel")
            appendLine("invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V")
            appendLine(":$skipLabel")
        }
        for ((idx, field) in hideParentsOf.withIndex()) {
            val skipParentLabel = "skip_parent_${tag}_$idx"
            appendLine("iget-object v0, p0, ${bindingInfo.baseBindingField}")
            appendLine("check-cast v0, ${bindingInfo.bindingType}")
            appendLine("iget-object v0, v0, $field")
            appendLine("if-eqz v0, :$skipParentLabel")
            appendLine("invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;")
            appendLine("move-result-object v0")
            appendLine("instance-of v1, v0, Landroid/view/View;")
            appendLine("if-eqz v1, :$skipParentLabel")
            appendLine("check-cast v0, Landroid/view/View;")
            appendLine("const/16 v1, 0x8")
            appendLine("invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V")
            appendLine(":$skipParentLabel")
        }
        append(":cond_binding_done_$tag")
    }

    appendBeforeReturnVoid(smali)
}

/**
 * Resolves `TabType.ME`'s `normalIcon` drawable resource ID directly at patch time from
 * `TabType.<init>` and `TabType.<clinit>`.
 */
internal fun resolveMeNormalIconResId(tabTypeClass: ClassDef): Int {
    val ctor = tabTypeClass.methods.firstOrNull { it.name == "<init>" }
        ?: throw PatchException("TabType.<init> not found on ${tabTypeClass.type}")
    val ctorImpl = ctor.implementation
        ?: throw PatchException("TabType.<init> has no implementation")
    val ctorLocalRegs = ctorImpl.registerCount - ctor.parameterRegisterCount()
    val normalIconParamOffset = ctorImpl.instructions.firstNotNullOfOrNull { insn ->
        val fRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
        if (insn.opcode == Opcode.IPUT &&
            fRef?.definingClass == tabTypeClass.type &&
            fRef.name == "normalIcon" &&
            fRef.type == "I"
        ) {
            (insn as TwoRegisterInstruction).registerA - ctorLocalRegs
        } else {
            null
        }
    } ?: throw PatchException("iput TabType->normalIcon:I not found in TabType.<init>")

    val clinit = tabTypeClass.methods.firstOrNull {
        it.name == "<clinit>" && it.returnType == "V" && it.parameterTypes.isEmpty()
    } ?: throw PatchException("TabType.<clinit> not found on ${tabTypeClass.type}")
    val clinitInsns = clinit.implementation?.instructions?.toList()
        ?: throw PatchException("TabType.<clinit> has no implementation")
    val meSputIdx = clinitInsns.indexOfFirst { insn ->
        val fRef = (insn as? ReferenceInstruction)?.reference as? FieldReference
        insn.opcode == Opcode.SPUT_OBJECT &&
            fRef?.definingClass == tabTypeClass.type &&
            fRef.name == "ME"
    }
    if (meSputIdx < 2) {
        throw PatchException("sput-object TabType->ME not found in TabType.<clinit>")
    }

    val meInvokeIdx = (meSputIdx - 1 downTo (meSputIdx - 5).coerceAtLeast(0)).firstOrNull { idx ->
        val insn = clinitInsns[idx]
        val mRef = (insn as? ReferenceInstruction)?.reference as? MethodReference
        insn.opcode == Opcode.INVOKE_DIRECT_RANGE &&
            mRef?.definingClass == tabTypeClass.type &&
            mRef.name == "<init>"
    } ?: throw PatchException("invoke-direct/range TabType.<init> for ME not found in TabType.<clinit>")

    val invokeRange = clinitInsns[meInvokeIdx] as RegisterRangeInstruction
    val targetReg = invokeRange.startRegister + normalIconParamOffset

    val iconLiteral = (meInvokeIdx - 1 downTo (meInvokeIdx - 20).coerceAtLeast(0))
        .firstNotNullOfOrNull { idx ->
            val insn = clinitInsns[idx]
            if ((insn.opcode == Opcode.CONST || insn.opcode == Opcode.CONST_16 || insn.opcode == Opcode.CONST_4) &&
                (insn as? OneRegisterInstruction)?.registerA == targetReg
            ) {
                (insn as? NarrowLiteralInstruction)?.narrowLiteral
            } else {
                null
            }
        } ?: throw PatchException("Failed to extract TabType.ME normalIcon literal at reg v$targetReg")

    if ((iconLiteral ushr 16) != 0x7f08) {
        throw PatchException("Unexpected TabType.ME normalIcon resource ID: 0x${iconLiteral.toUInt().toString(16)}")
    }
    return iconLiteral
}
