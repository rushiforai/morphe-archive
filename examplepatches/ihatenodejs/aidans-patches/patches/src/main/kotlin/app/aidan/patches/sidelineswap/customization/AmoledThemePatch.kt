package app.aidan.patches.sidelineswap.customization

import app.aidan.patches.shared.compositeFeaturePatch
import app.aidan.patches.sidelineswap.shared.COMPATIBILITY_SIDELINESWAP
import app.aidan.patches.sidelineswap.shared.requireSidelineSwapCompose
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction51l
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

// ---------------------------------------------------------------------------
// SidelineSwap 2.3.2 is a Compose Material 3 application with no app-owned XML
// layouts or color resources. Every app surface resolves through one ColorScheme
// built in Luo7; from the neutral ramp Lzg0, the surface tokens Ldo7, and the
// Material light token table Ljd1 (read only by the ColorScheme factory Lod1).
// ---------------------------------------------------------------------------

private const val COMPOSE_LAUNCH_STYLE = "Theme.Sls.Launch"
private const val COMPOSE_NEUTRAL_RAMP_CLASS = "Lzg0;"
private const val COMPOSE_SURFACE_TOKEN_CLASS = "Ldo7;"
private const val COMPOSE_LIGHT_TOKEN_CLASS = "Ljd1;"
private const val COMPOSE_MAIN_ACTIVITY_CLASS = "Lcom/sidelineswap/app/MainActivity;"
private const val COMPOSE_EDGE_TO_EDGE_CLASS = "Lmj9;"
private const val COMPOSE_WEB_VIEW_CLIENT_CLASS = "Lc34;"

private const val DARK_MODE_BRIDGE =
    "Lapp/aidan/extension/sidelineswap/DarkWebViewBridge;->applyDarkMode(Landroid/webkit/WebView;)V"

/** Pure-black background and surface. */
private const val COMPOSE_AMOLED_SURFACE = 0xff000000L

/** Primary foreground on black. */
private const val COMPOSE_AMOLED_ON_SURFACE = 0xffeceff1L

/** Muted foreground on black. */
private const val COMPOSE_AMOLED_ON_SURFACE_VARIANT = 0xffa8b2beL

/** Card, input and chip fill above the black surface. */
private const val COMPOSE_AMOLED_SURFACE_VARIANT = 0xff121212L

/** Raised and disabled fill. */
private const val COMPOSE_AMOLED_SURFACE_RAISED = 0xff262a2eL

/** Outline and outline-as-text fallback. */
private const val COMPOSE_AMOLED_OUTLINE = 0xff8a9099L

val amoledThemePatch = compositeFeaturePatch(
    name = "AMOLED Theme",
    description = "Applies a pure-black AMOLED palette to SidelineSwap's Compose theme: black surfaces and container tokens, readable light text and icons, a black launch window, light system-bar icons, and force-dark embedded WebViews.",
    default = false
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_SIDELINESWAP)
    extendWith("extensions/extension.mpe")

    resources {
        packageMetadata.requireSidelineSwapCompose()
        patchLaunchSurfaces()
    }

    bytecode {
        packageMetadata.requireSidelineSwapCompose()
        patchPalette()
        patchHardcodedSurfaces()
        patchSystemBarIcons()
        patchWebViewDarkMode()
    }
}

/**
 * Rewrites the launch surfaces so the splash and window background are black instead of
 * white. Both the base launch style and the v31 splash style are required.
 */
private fun app.morphe.patcher.patch.ResourcePatchContext.patchLaunchSurfaces() {
    patchLaunchStyle("res/values/styles.xml", requireSplashBackground = false)
    patchLaunchStyle("res/values-v31/styles.xml", requireSplashBackground = true)
}

private fun app.morphe.patcher.patch.ResourcePatchContext.patchLaunchStyle(
    path: String,
    requireSplashBackground: Boolean,
) {
    document(path).use { doc ->
        val styles = doc.getElementsByTagName("style")
        var style: Element? = null
        for (i in 0 until styles.length) {
            val elem = styles.item(i) as? Element ?: continue
            if (elem.getAttribute("name") == COMPOSE_LAUNCH_STYLE) {
                if (style != null) {
                    throw PatchException("[$path] Duplicate style '$COMPOSE_LAUNCH_STYLE'")
                }
                style = elem
            }
        }
        val launchStyle = style
            ?: throw PatchException("[$path] Required style '$COMPOSE_LAUNCH_STYLE' not found")

        val items = launchStyle.getElementsByTagName("item")
        var windowBackground: Element? = null
        var splashBackground: Element? = null
        for (i in 0 until items.length) {
            val item = items.item(i) as? Element ?: continue
            if (item.parentNode !== launchStyle) continue
            when (item.getAttribute("name")) {
                "android:windowBackground" -> windowBackground = item
                "android:windowSplashScreenBackground" -> splashBackground = item
            }
        }

        requireWhiteColorItem(
            path,
            windowBackground ?: throw PatchException("[$path] '$COMPOSE_LAUNCH_STYLE' has no android:windowBackground")
        )
        if (requireSplashBackground) {
            requireWhiteColorItem(
                path,
                splashBackground
                    ?: throw PatchException("[$path] '$COMPOSE_LAUNCH_STYLE' has no android:windowSplashScreenBackground")
            )
        }
    }
}

private fun requireWhiteColorItem(path: String, item: Element) {
    val current = item.textContent.trim()
    if (!current.equals("@android:color/white", ignoreCase = true)) {
        throw PatchException(
            "[$path] Item '${item.getAttribute("name")}' expected '@android:color/white', found '$current'"
        )
    }
    item.textContent = "@android:color/black"
}

/**
 * Darkens the palette: neutral ramp, surface tokens and the Material surface container
 * tokens the app leaves at their light defaults.
 */
private fun BytecodePatchContext.patchPalette() {
    // Neutral ramp. Every app text and surface token derives from these values.
    replaceArgbLiteral(COMPOSE_NEUTRAL_RAMP_CLASS, from = 0xfff5f5f7L, to = COMPOSE_AMOLED_SURFACE_VARIANT)
    replaceArgbLiteral(COMPOSE_NEUTRAL_RAMP_CLASS, from = 0xffe6e9f0L, to = COMPOSE_AMOLED_SURFACE_RAISED)
    replaceArgbLiteral(COMPOSE_NEUTRAL_RAMP_CLASS, from = 0xffdadee5L, to = COMPOSE_AMOLED_OUTLINE)
    replaceArgbLiteral(COMPOSE_NEUTRAL_RAMP_CLASS, from = 0xff78828fL, to = COMPOSE_AMOLED_ON_SURFACE_VARIANT)
    replaceArgbLiteral(COMPOSE_NEUTRAL_RAMP_CLASS, from = 0xff242529L, to = COMPOSE_AMOLED_ON_SURFACE)

    // Background and surface (also the root Compose background). The translucent
    // selected-row overlay is re-tinted to the same dark green family.
    replaceArgbLiteral(COMPOSE_SURFACE_TOKEN_CLASS, from = 0xffffffffL, to = COMPOSE_AMOLED_SURFACE)
    replaceArgbLiteral(COMPOSE_SURFACE_TOKEN_CLASS, from = 0xbff2fcf8L, to = 0xb31a2e22L)

    // Material surface container / bright / dim tokens still come from the light table.
    setLightToken("J", 0xff0f0f0fL) // surfaceBright
    setLightToken("P", 0xff000000L) // surfaceDim
    setLightToken("K", 0xff0a0a0aL) // surfaceContainer
    setLightToken("L", 0xff141414L) // surfaceContainerHigh
    setLightToken("M", 0xff1a1a1aL) // surfaceContainerHighest
    setLightToken("N", 0xff050505L) // surfaceContainerLow
    setLightToken("O", 0xff000000L) // surfaceContainerLowest
    setLightToken("c", 0xff4a1512L) // errorContainer
    setLightToken("i", 0xffffd9d6L) // onErrorContainer
}

/** Replaces app-owned light surfaces that are not routed through the palette. */
private fun BytecodePatchContext.patchHardcodedSurfaces() {
    // Promo / free-shipping card.
    replaceArgbLiteral("Lbd0;", from = 0xfff5fcf8L, to = 0xff0c1a12L)
    replaceArgbLiteral("Lbd0;", from = 0xffbfebd2L, to = 0xff1e3b2bL)
    // Selected row background.
    replaceArgbLiteral("Lbl1;", from = 0xffeaf8eeL, to = 0xff10241aL)
}

/**
 * Forces light status and navigation bar icons. The bars are already transparent on
 * API 26+; the app only derives the icon appearance from the system night-mode flag,
 * which stays false because the app has no night theme.
 */
private fun BytecodePatchContext.patchSystemBarIcons() {
    val classDef = mutableClassDefByOrNull(COMPOSE_MAIN_ACTIVITY_CLASS)
        ?: throw PatchException("Required policy failed: missing $COMPOSE_MAIN_ACTIVITY_CLASS")
    val onCreate = classDef.methods.firstOrNull {
        it.name == "onCreate" && it.parameterTypes.size == 1 && it.implementation != null
    } ?: throw PatchException("Required policy failed: missing onCreate in $COMPOSE_MAIN_ACTIVITY_CLASS")

    val instructions = onCreate.implementation!!.instructions.toList()
    val index = instructions.indexOfFirst { instruction ->
        instruction.opcode == Opcode.INVOKE_VIRTUAL_RANGE &&
            (instruction as? ReferenceInstruction)?.let { ref ->
                val method = ref.reference as? MethodReference
                method != null &&
                    method.definingClass == COMPOSE_EDGE_TO_EDGE_CLASS &&
                    method.name == "P" &&
                    method.parameterTypes.size == 6
            } == true
    }
    if (index < 0) {
        throw PatchException(
            "Required policy failed: $COMPOSE_EDGE_TO_EDGE_CLASS;->P(6 parameters) not found in onCreate"
        )
    }

    val invoke = instructions[index] as Instruction3rc
    if (invoke.registerCount != 7 || invoke.startRegister != 2) {
        throw PatchException(
            "Unexpected system bar argument range: start=${invoke.startRegister}, count=${invoke.registerCount}"
        )
    }

    onCreate.addInstructions(index, "const/4 v7, 0x1\nconst/4 v8, 0x1")
}

/**
 * Applies the AMOLED dark-mode bridge to the app-owned WebView hosts and re-applies it
 * once each page finishes loading.
 */
private fun BytecodePatchContext.patchWebViewDarkMode() {
    injectDarkModeAfterWebViewConstruction("Ld9;") // Ada chat WebView host
    injectDarkModeAfterWebViewConstruction("Lec;") // Compose AndroidView WebView factory
    injectDarkModeAfterWebViewConstruction("Lb24;") // In-app web dialog host

    val clientClass = mutableClassDefByOrNull(COMPOSE_WEB_VIEW_CLIENT_CLASS)
        ?: throw PatchException("Required policy failed: missing $COMPOSE_WEB_VIEW_CLIENT_CLASS")
    val onPageFinished = clientClass.methods.firstOrNull {
        it.name == "onPageFinished" && it.parameterTypes.size == 2 && it.implementation != null
    } ?: throw PatchException(
        "Required policy failed: missing onPageFinished in $COMPOSE_WEB_VIEW_CLIENT_CLASS"
    )
    onPageFinished.addInstructions(0, "invoke-static {p1}, $DARK_MODE_BRIDGE")
}

private fun BytecodePatchContext.injectDarkModeAfterWebViewConstruction(classDescriptor: String) {
    val classDef = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Required policy failed: missing $classDescriptor")

    var matches = 0
    for (method in classDef.methods) {
        val impl = method.implementation ?: continue
        val instructions = impl.instructions.toList()
        for ((index, instruction) in instructions.withIndex()) {
            if (instruction.opcode != Opcode.INVOKE_DIRECT) continue
            val methodReference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (methodReference.definingClass != "Landroid/webkit/WebView;" || methodReference.name != "<init>") continue

            val register = (instruction as Instruction35c).registerC
            method.addInstructions(index + 1, "invoke-static {v$register}, $DARK_MODE_BRIDGE")
            matches++
            break
        }
    }

    if (matches != 1) {
        throw PatchException(
            "Required policy failed: expected 1 WebView constructor in $classDescriptor, matched $matches"
        )
    }
}

/**
 * Replaces every `const-wide` holding [from] in [classDescriptor] with [to].
 * Exactly one literal must match so a re-obfuscated build fails loudly.
 */
private fun BytecodePatchContext.replaceArgbLiteral(
    classDescriptor: String,
    from: Long,
    to: Long,
) {
    val classDef = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Required policy failed: missing $classDescriptor")

    var matches = 0
    for (method in classDef.methods) {
        val impl = method.implementation ?: continue
        val indices = impl.instructions.mapIndexedNotNull { index, instruction ->
            instruction.takeIf {
                it.opcode == Opcode.CONST_WIDE && (it as Instruction51l).wideLiteral == from
            }?.let { index }
        }
        for (index in indices) {
            val register = (impl.instructions.elementAt(index) as Instruction51l).registerA
            method.replaceInstruction(index, "const-wide v$register, 0x${to.toHex()}L")
        }
        matches += indices.size
    }

    if (matches != 1) {
        throw PatchException(
            "Required policy failed: expected 1 literal 0x${from.toHex()} in $classDescriptor, matched $matches"
        )
    }
}

/**
 * Replaces the Material light token [fieldName] in the ColorScheme factory with an
 * opaque [argb] value, keeping the existing store instruction.
 */
private fun BytecodePatchContext.setLightToken(fieldName: String, argb: Long) {
    val classDef = mutableClassDefByOrNull(COMPOSE_LIGHT_TOKEN_CLASS)
        ?: throw PatchException("Required policy failed: missing $COMPOSE_LIGHT_TOKEN_CLASS")
    val clinit = classDef.methods.firstOrNull { it.name == "<clinit>" && it.implementation != null }
        ?: throw PatchException("Required policy failed: missing <clinit> in $COMPOSE_LIGHT_TOKEN_CLASS")

    val impl = clinit.implementation!!
    val index = impl.instructions.indexOfFirst { instruction ->
        if (instruction.opcode != Opcode.SPUT_WIDE) return@indexOfFirst false
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        field != null && field.definingClass == COMPOSE_LIGHT_TOKEN_CLASS && field.name == fieldName
    }
    if (index < 0) {
        throw PatchException("Required policy failed: missing $COMPOSE_LIGHT_TOKEN_CLASS;->$fieldName")
    }

    val register = (impl.instructions.elementAt(index) as Instruction21c).registerA
    val value = (argb and 0xffffffffL) shl 32
    clinit.addInstructions(index, "const-wide v$register, 0x${value.toHex()}L")
}

private fun Long.toHex(): String = java.lang.Long.toHexString(this)
