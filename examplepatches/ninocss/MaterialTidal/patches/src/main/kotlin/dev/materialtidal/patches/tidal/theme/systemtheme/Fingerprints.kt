package dev.materialtidal.patches.tidal.theme.systemtheme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object TidalMarketThemeClinitFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/android/ui/market/TidalMarketThemeKt;",
    name = "<clinit>",
    returnType = "V",
)

internal object MarketIsDarkThemeHelperFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    parameters = listOf("Landroid/content/Context;"),
    returnType = "Z",
    filters = listOf(
        methodCall(
            definingClass = "Landroid/content/Context;",
            name = "getResources",
            parameters = emptyList(),
            returnType = "Landroid/content/res/Resources;",
        ),
        methodCall(
            definingClass = "Landroid/content/res/Resources;",
            name = "getConfiguration",
            parameters = emptyList(),
            returnType = "Landroid/content/res/Configuration;",
        ),
        fieldAccess(
            definingClass = "Landroid/content/res/Configuration;",
            name = "uiMode",
            type = "I",
        ),
    ),
    custom = { _, classDef ->
        classDef.methods.any { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.returnType == "Lcom/squareup/ui/market/designtokens/core/ColorMode;" &&
                m.parameterTypes.size == 2 &&
                m.parameterTypes[1].toString() == "Landroid/content/Context;"
        }
    },
)

internal object Wave2ColorsToStringFingerprint : Fingerprint(
    name = "toString",
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("WaveColors(materialDark="),
    ),
)

internal object Wave2ThemeComposableFingerprint : Fingerprint(
    definingClass = "Lcom/tidal/wave2/theme/WaveThemeKt;",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/compose/runtime/CompositionLocalKt;",
            name = "CompositionLocalProvider",
        ),
    ),
)

internal object Wave2StaticColorsClinitFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/compose/ui/graphics/ColorKt;",
            name = "Color",
            parameters = listOf("J"),
            returnType = "J",
        ),
    ),
    custom = { method, classDef ->
        if (classDef.instanceFields.any() || classDef.staticFields.count { it.type == "J" } != 9) {
            false
        } else {
            val insns = method.implementation?.instructions ?: emptyList()
            val literals = insns.mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }.toSet()
            0x00000000FF33FFEEL in literals &&
                0x00000000FFFF3269L in literals &&
                0x00000000FF99334EL in literals
        }
    },
)

internal object Wave1DarkColorsInitFingerprint : Fingerprint(
    name = "<init>",
    parameters = emptyList(),
    returnType = "V",
    filters = listOf(
        methodCall(
            definingClass = "Landroidx/compose/ui/graphics/ColorKt;",
            name = "Color",
            parameters = listOf("J"),
            returnType = "J",
        ),
    ),
    custom = { method, classDef ->
        if (classDef.instanceFields.count { it.type == "J" } != 25 ||
            classDef.methods.count { it.parameters.isEmpty() && it.returnType == "J" } != 25
        ) {
            false
        } else {
            val insns = method.implementation?.instructions ?: emptyList()
            insns.any { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    ((insn as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == "Landroidx/compose/ui/graphics/ColorKt;" &&
                            it.name == "Color" &&
                            it.parameterTypes == listOf("J")
                    } == true
            }
        }
    },
)

internal object ComposeIsSystemInDarkThemeFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/foundation/DarkTheme_androidKt;",
    name = "_isSystemInDarkTheme",
    parameters = listOf("Landroidx/compose/runtime/Composer;", "I"),
    returnType = "Z",
)

internal object AndroidTextPaintSetColorFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/text/platform/AndroidTextPaint;",
    name = "setColor-8_81llA",
    parameters = listOf("J"),
    returnType = "V",
)

internal object ColorFilterTintFingerprint : Fingerprint(
    definingClass = "Landroidx/compose/ui/graphics/ColorFilter\$Companion;",
    name = "tint-xETnrds",
    parameters = listOf("J", "I"),
    returnType = "Landroidx/compose/ui/graphics/ColorFilter;",
)

internal object MarketStylesheetColorsToStringFingerprint : Fingerprint(
    definingClass = "Lcom/squareup/ui/market/core/theme/MarketStylesheet\$c;",
    name = "toString",
    parameters = emptyList(),
    returnType = "Ljava/lang/String;",
    filters = listOf(
        string("Colors(extended="),
        string(", text10="),
        string(", textWhite="),
    ),
)

internal object HomeAppBarIconFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        string("com.tidal.android.feature.home.ui.composables.AppBarIcon (AppBar.kt:82)"),
        methodCall(
            definingClass = "Landroidx/compose/foundation/ImageKt;",
            name = "Image",
        ),
    ),
)

internal object ShortcutDeeplinkIconFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    filters = listOf(
        string("com.tidal.android.feature.home.ui.composables.shortcutlist.ShortcutListDeeplinkContentItem.<anonymous> (ShortcutListModule.kt:395)"),
        methodCall(
            definingClass = "Landroidx/compose/foundation/ImageKt;",
            name = "Image",
        ),
    ),
)
