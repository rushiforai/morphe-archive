package app.morphe.patches.youtube.layout.fullscreen

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.resourceXmlOrNull
import app.morphe.patcher.string
import app.morphe.patcher.util.getReference
import app.morphe.patcher.xml.XmlElement
import app.morphe.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.util.insertLiteralOverride
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/fullscreen/YouTubeFullscreenFilter;"

private const val TABLET_WATCH_EXTENSION_CLASS =
    "Lapp/morphe/extension/youtube/patches/fullscreen/YouTubeTabletWatchLayout;"

private const val ADD_ON_PREFERENCES_FILE_PATH = "morphe_addon_prefs.xml"

private const val GLASS_BLUR_PREFERENCE_TAG =
    "app.morphe.extension.youtube.patches.fullscreen.YouTubeGlassBlurPreference"

private const val GLASS_BLUR_PREFERENCE_KEY = "morphe_yt_glass_blur_radius"

private const val YOUTUBE_MAIN_ACTIVITY_CLASS =
    "Lcom/google/android/apps/youtube/app/watchwhile/MainActivity;"

private const val PIVOT_BAR_CLASS =
    "Lcom/google/android/libraries/youtube/rendering/ui/pivotbar/PivotBar;"

private object YtFullscreenMainActivityOnCreateFingerprint : Fingerprint(
    definingClass = YOUTUBE_MAIN_ACTIVITY_CLASS,
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

private object YtFullscreenPlayerStableInsetsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_OBJECT),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Landroid/graphics/Rect;",
            location = MatchAfterImmediately()
        ),
        methodCall(name = "isInMultiWindowMode"),
        methodCall(smali = "Landroid/graphics/Rect;-><init>(IIII)V")
    )
)

private object YtFullscreenSystemWindowInsetsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(smali = "Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V"),
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            definingClass = "this",
            type = "Landroid/view/View;",
            location = MatchAfterImmediately()
        )
    )
)

private object YtFullscreenStatusBarBackgroundShowFingerprint : Fingerprint(
    classFingerprint = Fingerprint(
        accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
        returnType = "V",
        parameters = listOf(),
        filters = listOf(
            methodCall(smali = "Landroid/view/View;->bringToFront()V"),
            methodCall(smali = "Landroid/view/View;->getParent()Landroid/view/ViewParent;"),
            methodCall(smali = "Landroid/view/View;->bringToFront()V")
        )
    ),
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I"),
    filters = listOf(
        methodCall(smali = "Landroid/view/View;->setVisibility(I)V"),
        methodCall(smali = "Landroid/view/View;->setBackgroundColor(I)V")
    )
)

private object YtPivotBarConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    filters = listOf(
        string("com.google.android.apps.youtube.app.endpoint.flags")
    )
)

private object YtInitializeButtonsFingerprint : Fingerprint(
    classFingerprint = YtPivotBarConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        string("FEvideo_picker")
    )
)

private object YtNavigationEnumFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    strings = listOf(
        "PIVOT_HOME",
        "TAB_SHORTS",
        "CREATION_TAB_LARGE",
        "PIVOT_SUBSCRIPTIONS",
        "TAB_ACTIVITY",
        "VIDEO_LIBRARY_WHITE",
        "INCOGNITO_CIRCLE"
    ),
    custom = { _, classDef ->
        !classDef.type.startsWith("Lapp/morphe")
    }
)

private object YtPivotBarSetSelectedFingerprint : Fingerprint(
    definingClass = PIVOT_BAR_CLASS,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("I", "Z"),
    filters = listOf(
        methodCall(name = "setSelected")
    )
)

private object YtFrostedGlassClassFingerprint : Fingerprint(
    filters = listOf(
        string("frostedGlassRenderNode")
    )
)

private object YtFrostedGlassCreateBlurFingerprint : Fingerprint(
    classFingerprint = YtFrostedGlassClassFingerprint,
    filters = listOf(
        methodCall(
            smali = "Landroid/graphics/RenderEffect;->createBlurEffect(FFLandroid/graphics/Shader\$TileMode;)Landroid/graphics/RenderEffect;"
        )
    )
)

private object YtFrostedGlassDrawFingerprint : Fingerprint(
    classFingerprint = YtFrostedGlassClassFingerprint,
    name = "draw",
    returnType = "V",
    parameters = listOf("Landroid/graphics/Canvas;")
)

/**
 * YouTube feature flag that colors/tints the status bar like the top bar while scrolling.
 */
private object YtStatusBarScrollColorFeatureFlagFingerprint : Fingerprint(
    filters = listOf(
        literal(45830993L)
    )
)

private val COMPATIBILITY_YOUTUBE_ANY = Compatibility(
    name = "YouTube",
    packageName = "com.google.android.youtube",
    apkFileType = ApkFileType.APK_REQUIRED,
    appIconColor = 0xFF0033,
    signatures = COMPATIBILITY_YOUTUBE.signatures,
    targets = listOf(
        AppTarget(
            version = null,
            minSdk = 26
        )
    )
)

@Suppress("unused")
val removeTopBlackBarPatch = patch(
    name = "Remove top black bar",
    description = "Removes the black status-bar gap above YouTube videos in portrait full screen (especially on tablets) when hiding the status bar, allowing true edge-to-edge playback.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANY)
    extendWith("extensions/ytfullscreen.mpe")

    finalize {
        YtFullscreenMainActivityOnCreateFingerprint.let {
            it.clearMatch()
            it.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, " +
                    "$EXTENSION_CLASS->onMainActivityCreated(Landroid/app/Activity;)V"
            )
        }

        YtFullscreenPlayerStableInsetsFingerprint.clearMatch()
        YtFullscreenPlayerStableInsetsFingerprint.matchOrNull()?.let { match ->
            match.method.apply {
                val rectIndex = match.instructionMatches[1].index
                val rectRegister = getInstruction<TwoRegisterInstruction>(rectIndex).registerA

                var insertIndex = rectIndex + 1
                val instructions = implementation?.instructions?.toList()
                if (instructions != null && insertIndex + 1 < instructions.size) {
                    val nextOp = instructions[insertIndex].opcode
                    val afterNextOp = instructions[insertIndex + 1].opcode
                    if ((nextOp == Opcode.INVOKE_STATIC || nextOp == Opcode.INVOKE_STATIC_RANGE)
                        && afterNextOp == Opcode.MOVE_RESULT_OBJECT
                    ) {
                        insertIndex += 2
                    }
                }

                addInstructions(
                    insertIndex,
                    """
                        invoke-static/range { v$rectRegister .. v$rectRegister }, $EXTENSION_CLASS->stripPlayerTopInset(Landroid/graphics/Rect;)Landroid/graphics/Rect;
                        move-result-object v$rectRegister
                    """
                )
            }
        }

        YtFullscreenSystemWindowInsetsFingerprint.clearMatch()
        YtFullscreenSystemWindowInsetsFingerprint.matchOrNull()?.let { match ->
            match.method.apply {
                val insetsRegister = match.instructionMatches.first()
                    .getInstruction<FiveRegisterInstruction>().registerC
                val viewIndex = match.instructionMatches.last().index
                val viewRegister = getInstruction<TwoRegisterInstruction>(viewIndex).registerA

                var insertIndex = viewIndex + 1
                val instructions = implementation?.instructions?.toList()
                if (instructions != null && insertIndex < instructions.size) {
                    val nextOp = instructions[insertIndex].opcode
                    if (nextOp == Opcode.INVOKE_STATIC || nextOp == Opcode.INVOKE_STATIC_RANGE) {
                        insertIndex += 1
                    }
                }

                addInstruction(
                    insertIndex,
                    "invoke-static { v$insetsRegister, v$viewRegister }, " +
                        "$EXTENSION_CLASS->stripSystemWindowInsetTop(Landroid/graphics/Rect;Landroid/view/View;)V"
                )
            }
        }

        YtFullscreenStatusBarBackgroundShowFingerprint.clearMatch()
        YtFullscreenStatusBarBackgroundShowFingerprint.matchOrNull()?.let { match ->
            match.method.apply {
                val lastIndex = match.instructionMatches.last().index
                val viewRegister = getInstruction<FiveRegisterInstruction>(lastIndex).registerC

                var insertIndex = lastIndex + 1
                val instructions = implementation?.instructions?.toList()
                if (instructions != null && insertIndex < instructions.size) {
                    val nextOp = instructions[insertIndex].opcode
                    if (nextOp == Opcode.INVOKE_STATIC || nextOp == Opcode.INVOKE_STATIC_RANGE) {
                        insertIndex += 1
                    }
                }

                addInstruction(
                    insertIndex,
                    "invoke-static { v$viewRegister }, " +
                        "$EXTENSION_CLASS->collapseStatusBarBackground(Landroid/view/View;)V"
                )
            }
        }
    }
}

@Suppress("unused")
val scrollAwayHomeToolbarPatch = patch(
    name = "Scroll away home toolbar",
    description = "Makes YouTube's top toolbar act like the top of the page everywhere across the app (Home, Subscriptions, Library, Channels, and more) so it scrolls away cleanly with the feed instead of staying persistent or popping back mid-page.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANY)
    extendWith("extensions/ytfullscreen.mpe")

    finalize {
        YtFullscreenMainActivityOnCreateFingerprint.let {
            it.clearMatch()
            it.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, " +
                    "$EXTENSION_CLASS->onHomeScrollToolbarEnabled(Landroid/app/Activity;)V"
            )
        }

        hookPivotBarTabSelectedIfNeeded()
    }
}

@Suppress("unused")
val swapProfileWithLibraryPatch = patch(
    name = "Swap profile photo with Library icon",
    description = "Replaces the channel profile photo on the You tab in YouTube's navigation bar with a crisp Library icon that adapts to selection and dark/light themes.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANY)
    extendWith("extensions/ytfullscreen.mpe")

    finalize {
        YtFullscreenMainActivityOnCreateFingerprint.let {
            it.clearMatch()
            it.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, " +
                    "$EXTENSION_CLASS->onSwapProfileWithLibraryEnabled(Landroid/app/Activity;)V"
            )
        }

        hookPivotBarEnumTrackingIfNeeded()
        hookPivotBarTabSelectedIfNeeded()
    }
}

@Suppress("unused")
val glassNavBarBlurPatch = patch(
    name = "Glass navigation bar blur",
    description = "Adds an adjustable blur strength slider inside Morphe Navigation settings to customize or disable the blur of YouTube's glass navigation bar.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANY)
    extendWith("extensions/ytfullscreen.mpe")

    execute {
        val addOnFile = resourceFile(ADD_ON_PREFERENCES_FILE_PATH)
        if (!addOnFile.exists()) {
            addOnFile.writeText(
                """
                <?xml version="1.0" encoding="utf-8"?>
                <morphe-add-on-preferences xmlns:android="http://schemas.android.com/apk/res/android">
                </morphe-add-on-preferences>
                """.trimIndent()
            )
        }

        resourceXml(ADD_ON_PREFERENCES_FILE_PATH).use { xml ->
            xml.root.appendChild("screen") {
                appendChild(GLASS_BLUR_PREFERENCE_TAG) {
                    setAttribute("android:key", GLASS_BLUR_PREFERENCE_KEY)
                    setAttribute("android:title", "Glass navigation bar blur")
                    setAttribute("android:selectable", "true")
                }
            }
        }
    }

    finalize {
        YtFullscreenMainActivityOnCreateFingerprint.let {
            it.clearMatch()
            it.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, " +
                    "$EXTENSION_CLASS->onGlassBlurEnabled(Landroid/app/Activity;)V"
            )
        }

        // Hook RenderEffect.createBlurEffect(...) inside YouTube's frostedGlassRenderNode class
        // and hook draw(Canvas) for instant live updates after adjusting the slider in Settings.
        YtFrostedGlassClassFingerprint.clearMatch()
        if (YtFrostedGlassClassFingerprint.matchOrNull() != null) {
            YtFrostedGlassCreateBlurFingerprint.clearMatch()
            runCatching { YtFrostedGlassCreateBlurFingerprint.matchAll() }
                .getOrNull()
                ?.forEach { blurMatch ->
                    val method = blurMatch.method
                    val instrs = method.implementation?.instructions?.toList() ?: return@forEach
                    for (i in instrs.indices.reversed()) {
                        val insn = instrs[i]
                        if (insn.opcode != Opcode.INVOKE_STATIC && insn.opcode != Opcode.INVOKE_STATIC_RANGE) {
                            continue
                        }
                        val ref = (insn as? ReferenceInstruction)?.getReference<MethodReference>() ?: continue
                        if (ref.definingClass == "Landroid/graphics/RenderEffect;"
                            && ref.name == "createBlurEffect"
                            && ref.parameterTypes.size == 3
                            && ref.parameterTypes[0].toString() == "F"
                            && ref.parameterTypes[1].toString() == "F"
                            && ref.parameterTypes[2].toString() == "Landroid/graphics/Shader\$TileMode;"
                        ) {
                            if (insn.opcode == Opcode.INVOKE_STATIC) {
                                val five = insn as FiveRegisterInstruction
                                method.replaceInstruction(
                                    i,
                                    "invoke-static { v${five.registerC}, v${five.registerD}, v${five.registerE} }, " +
                                        "$EXTENSION_CLASS->createGlassBlurEffect(FFLandroid/graphics/Shader\$TileMode;)Landroid/graphics/RenderEffect;"
                                )
                            } else {
                                val range = insn as RegisterRangeInstruction
                                val start = range.startRegister
                                val end = start + range.registerCount - 1
                                method.replaceInstruction(
                                    i,
                                    "invoke-static/range { v$start .. v$end }, " +
                                        "$EXTENSION_CLASS->createGlassBlurEffect(FFLandroid/graphics/Shader\$TileMode;)Landroid/graphics/RenderEffect;"
                                )
                            }
                        }
                    }
                }

            YtFrostedGlassDrawFingerprint.clearMatch()
            YtFrostedGlassDrawFingerprint.matchOrNull()?.let { drawMatch ->
                drawMatch.method.addInstruction(
                    0,
                    "invoke-static/range { p0 .. p0 }, " +
                        "$EXTENSION_CLASS->onFrostedGlassDraw(Ljava/lang/Object;)V"
                )
            }
        }

        // Add the "Glass navigation bar blur" slider preference into Morphe Settings -> Navigation
        // right alongside official Morphe's glass navigation bar options.
        var injectedIntoPrefs = false
        arrayOf(
            "res/xml/morphe_prefs.xml",
            "res/xml/morphe_prefs_icons.xml",
            "res/xml/morphe_prefs_icons_bold.xml"
        ).forEach { prefPath ->
            resourceXmlOrNull(prefPath)?.use { xml ->
                val rootNode = xml.elements("PreferenceScreen").firstOrNull() ?: return@use
                injectedIntoPrefs = true
                if (rootNode.findByKey(GLASS_BLUR_PREFERENCE_KEY) != null) {
                    return@use
                }
                val targetGroup = rootNode.findParentOfKey("morphe_navigation_bar_glass_opacity")
                    ?: rootNode.findParentOfKey("morphe_navigation_bar_glass")
                    ?: rootNode

                targetGroup.appendChild(GLASS_BLUR_PREFERENCE_TAG) {
                    setAttribute("android:key", GLASS_BLUR_PREFERENCE_KEY)
                    setAttribute("android:title", "Glass navigation bar blur")
                    setAttribute("android:selectable", "true")
                }
            }
        }

        val addOnFile = resourceFile(ADD_ON_PREFERENCES_FILE_PATH)
        if (injectedIntoPrefs && addOnFile.exists()) {
            addOnFile.delete()
        }
    }
}

@Suppress("unused")
val transparentStatusBarYouTubePatch = patch(
    name = "Transparent status bar (YouTube)",
    description = "Makes the status bar background completely transparent while scrolling and across YouTube while keeping the status bar clock and icons visible.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANY)
    extendWith("extensions/ytfullscreen.mpe")

    finalize {
        YtFullscreenMainActivityOnCreateFingerprint.let {
            it.clearMatch()
            it.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, " +
                    "$EXTENSION_CLASS->onTransparentStatusBarEnabled(Landroid/app/Activity;)V"
            )
        }

        // Disable YouTube's scrolling status-bar color tint feature flag (45830993).
        YtStatusBarScrollColorFeatureFlagFingerprint.clearMatch()
        runCatching { YtStatusBarScrollColorFeatureFlagFingerprint.matchAll() }
            .getOrNull()
            ?.forEach { match ->
                match.method.insertLiteralOverride(
                    match.instructionMatches.first().index,
                    "$EXTENSION_CLASS->disableStatusBarScrollColor(Z)Z"
                )
            }

        // Keep YouTube's dedicated status-bar overlay view completely transparent whenever shown/recolored.
        YtFullscreenStatusBarBackgroundShowFingerprint.clearMatch()
        YtFullscreenStatusBarBackgroundShowFingerprint.matchOrNull()?.let { match ->
            match.method.apply {
                val lastIndex = match.instructionMatches.last().index
                val viewRegister = getInstruction<FiveRegisterInstruction>(lastIndex).registerC

                var insertIndex = lastIndex + 1
                val instructions = implementation?.instructions?.toList()
                while (instructions != null && insertIndex < instructions.size) {
                    val nextOp = instructions[insertIndex].opcode
                    if (nextOp == Opcode.INVOKE_STATIC || nextOp == Opcode.INVOKE_STATIC_RANGE) {
                        insertIndex += 1
                    } else {
                        break
                    }
                }

                addInstruction(
                    insertIndex,
                    "invoke-static/range { v$viewRegister .. v$viewRegister }, " +
                        "$EXTENSION_CLASS->makeStatusBarBackgroundTransparent(Landroid/view/View;)V"
                )
            }
        }
    }
}

@Suppress("unused")
val tabletLandscapeWatchLayoutPatch = patch(
    name = "Tablet landscape watch layout",
    description = "In tablet landscape mode only, merges the channel row, subscribe/bell button, action buttons, and a new Comment button into one horizontally scrollable row under the video title, keeps comments open by default below it, and scrolls the entire column from title to comments together.",
    default = false
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_ANY)
    extendWith("extensions/ytfullscreen.mpe")

    finalize {
        YtFullscreenMainActivityOnCreateFingerprint.let {
            it.clearMatch()
            it.method.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, " +
                    "$TABLET_WATCH_EXTENSION_CLASS->onTabletWatchLayoutEnabled(Landroid/app/Activity;)V"
            )
        }
    }
}

private fun hookPivotBarEnumTrackingIfNeeded() {
    YtNavigationEnumFingerprint.clearMatch()
    val navigationEnumClassName = YtNavigationEnumFingerprint.matchOrNull()?.originalClassDef?.type ?: return

    YtPivotBarConstructorFingerprint.clearMatch()
    YtInitializeButtonsFingerprint.clearMatch()
    YtInitializeButtonsFingerprint.matchOrNull()?.method?.apply {
        val instrs = implementation?.instructions?.toList() ?: return@apply
        val alreadyHooked = instrs.any { insn ->
            val ref = (insn as? ReferenceInstruction)?.getReference<MethodReference>()
            ref != null && ref.definingClass == EXTENSION_CLASS && ref.name == "onNavigationEnumLoaded"
        }
        if (alreadyHooked) {
            return@apply
        }

        for (i in instrs.indices.reversed()) {
            if (i + 1 >= instrs.size || instrs[i + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
                continue
            }
            val insn = instrs[i]
            val ref = (insn as? ReferenceInstruction)?.getReference<MethodReference>() ?: continue
            val resultReg = (instrs[i + 1] as OneRegisterInstruction).registerA

            if ((insn.opcode == Opcode.INVOKE_STATIC || insn.opcode == Opcode.INVOKE_STATIC_RANGE)
                && ref.definingClass == navigationEnumClassName
                && ref.returnType == navigationEnumClassName
            ) {
                addInstruction(
                    i + 2,
                    "invoke-static/range { v$resultReg .. v$resultReg }, " +
                        "$EXTENSION_CLASS->onNavigationEnumLoaded(Ljava/lang/Enum;)V"
                )
            } else if ((insn.opcode == Opcode.INVOKE_VIRTUAL || insn.opcode == Opcode.INVOKE_VIRTUAL_RANGE)
                && ref.definingClass == PIVOT_BAR_CLASS
                && ref.returnType == "Landroid/view/View;"
            ) {
                val params = ref.parameterTypes
                val isImageResourceStyledTab = params.size == 4
                    && params[1].toString() == "Z"
                    && params[2].toString() == "I"
                val isStandardTab = params.firstOrNull()?.toString() == "Landroid/graphics/drawable/Drawable;"
                    || params.firstOrNull()?.toString() == "I"

                if (isImageResourceStyledTab) {
                    addInstruction(
                        i + 2,
                        "invoke-static/range { v$resultReg .. v$resultReg }, " +
                            "$EXTENSION_CLASS->onImageResourceTabLoaded(Landroid/view/View;)V"
                    )
                } else if (isStandardTab) {
                    addInstruction(
                        i + 2,
                        "invoke-static/range { v$resultReg .. v$resultReg }, " +
                            "$EXTENSION_CLASS->onNavigationTabLoaded(Landroid/view/View;)V"
                    )
                }
            }
        }
    }
}

private fun hookPivotBarTabSelectedIfNeeded() {
    YtPivotBarSetSelectedFingerprint.clearMatch()
    YtPivotBarSetSelectedFingerprint.matchOrNull()?.let { match ->
        match.method.apply {
            val instrs = implementation?.instructions?.toList() ?: return@apply
            val alreadyHooked = instrs.any { insn ->
                val ref = (insn as? ReferenceInstruction)?.getReference<MethodReference>()
                ref != null && ref.definingClass == EXTENSION_CLASS && ref.name == "onPivotTabSelected"
            }
            if (alreadyHooked) {
                return@apply
            }

            val index = match.instructionMatches.first().index
            val call = getInstruction<FiveRegisterInstruction>(index)
            val viewRegister = call.registerC
            val selectedRegister = call.registerD

            addInstruction(
                index + 1,
                "invoke-static { v$viewRegister, v$selectedRegister }, " +
                    "$EXTENSION_CLASS->onPivotTabSelected(Landroid/view/View;Z)V"
            )
        }
    }
}

private fun XmlElement.findByKey(key: String): XmlElement? {
    children.forEach { element ->
        val elementKey = element.attribute("android:key").orEmpty()
        if (elementKey == key || elementKey.startsWith("${key}_sort_by")) {
            return element
        }
        element.findByKey(key)?.let { return it }
    }
    return null
}

private fun XmlElement.findParentOfKey(key: String): XmlElement? {
    children.forEach { element ->
        val elementKey = element.attribute("android:key").orEmpty()
        if (elementKey == key) {
            return this
        }
        element.findParentOfKey(key)?.let { return it }
    }
    return null
}
