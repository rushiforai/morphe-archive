package app.spicetify.patches.spotify.theme

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.util.logging.Logger

internal const val COMPOSE_THEME_CLASS = "Lapp/spicetify/extension/spotify/theme/ComposeTheme;"
private const val BRUSH = "Landroidx/compose/ui/graphics/Brush;"
private val PUBLIC_STATIC_FINAL = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL)

/** Compose's Color(Long), which turns an ARGB constant into a Compose color. */
private const val COLOR = "Lp/iae1;->g(J)J"

/** Spotify's #282828 surface, as a constant. */
private const val SURFACE = 0xFF282828L

/** The static fields that keep a #282828 surface for two Compose screens, set when their class loads. */
private val SURFACE_FIELDS = listOf("Lp/pz01;->a:J", "Lp/t5s0;->b:J")

/** ProvideEncoreTheme, which picks the Encore palette for a theme and provides it. */
internal object ProvideEncoreThemeFingerprint : Fingerprint(
    filters = listOf(string("EncoreLayoutTheme: Invalid screen dimensions (")),
)

/** The merged lambda holding the default value of the Encore palette's CompositionLocal. */
internal object EncoreThemeDefaultsFingerprint : Fingerprint(
    filters = listOf(
        string("Encore theme was not provided. Please wrap your content with ProvideEncoreTheme.", StringComparisonType.STARTS_WITH),
    ),
)

/** The static initializer of Encore's raw colors: the only method with these three grays. */
internal object EncoreRawColorsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(),
    filters = listOf(literal(0xFF181818L), literal(0xFF333333L), literal(0xFF535353L)),
)

/**
 * Encore's icon draw (icon, description, modifier, tint, active tint, active, composer, changed, defaults),
 * which hands both of the icon's vectors to a sibling in its class.
 */
internal object EncoreIconFingerprint : Fingerprint(
    accessFlags = PUBLIC_STATIC_FINAL,
    returnType = "V",
    parameters = listOf("L", "L", "L", "J", "J", "Z", "L", "I", "I"),
    filters = listOf(methodCall(definingClass = "this", parameters = listOf("L", "L", "L", "L", "J", "J", "Z", "L", "I"))),
)

/** The header scrim (modifier, top alpha, bottom alpha, content, ...): raw gray7 as a vertical gradient brush. */
private fun headerScrimFingerprint(rawColors: FieldReference) = Fingerprint(
    accessFlags = PUBLIC_STATIC_FINAL,
    returnType = "V",
    parameters = listOf("L", "F", "F", "L", "L", "I", "I"),
    filters = listOf(fieldAccess(rawColors, Opcode.SGET_OBJECT)),
    custom = { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            call != null && (call.returnType == BRUSH || call.parameterTypes.any { it.toString() == BRUSH })
        } == true
    },
)

/**
 * Themes Spotify's Compose screens through ComposeTheme: the default dark Encore palette at both of its
 * reads, Encore's raw colors once they're built, the #282828 surfaces two screens keep on their own, and,
 * for a background image, the header scrim and the icons Spotify tints with the page background.
 */
internal val themeComposePatch = bytecodePatch {
    execute {
        // Morphe prints only its own loggers and the root logger.
        val log = Logger.getLogger("")
        fun MutableMethod.hook(index: Int, smali: String) {
            addInstructions(index, smali.trimIndent())
            log.info("ComposeTheme hook: $definingClass->$name index $index")
        }

        // The palette getters in ProvideEncoreTheme's theme switch all return the palette type, and the
        // default dark palette is the one case read from a static field.
        val provide = ProvideEncoreThemeFingerprint.matchAll(1..1).single().method
        val paletteType = provide.implementation!!.instructions
            .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
            .filter { it.parameterTypes.isEmpty() && it.returnType.startsWith("L") }
            .groupingBy { it.returnType }.eachCount().maxByOrNull { it.value }?.key
            ?: throw PatchException("Encore palette type not found.")
        val darkPalette = provide.staticReads().singleOrNull { it.value.type == paletteType }?.value
            ?: throw PatchException("Expected one static read of Spotify's default Encore palette.")
        val defaults = EncoreThemeDefaultsFingerprint.matchAll(1..1).single().method
        for (method in listOf(provide, defaults)) {
            val read = method.staticReads().singleOrNull { it.value == darkPalette }
                ?: throw PatchException("Expected one read of $darkPalette in ${method.definingClass}.")
            val register = (method.implementation!!.instructions[read.index] as OneRegisterInstruction).registerA
            // After the read, not at it: the read is a switch target, and labels stay on their instruction.
            method.hook(read.index + 1, """
                invoke-static/range { v$register .. v$register }, $COMPOSE_THEME_CLASS->palette(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, $paletteType
            """)
        }

        val rawColors = EncoreRawColorsFingerprint.matchAll(1..1).single().method
        val store = rawColors.implementation!!.instructions.withIndex().singleOrNull { (_, instruction) ->
            instruction.opcode == Opcode.SPUT_OBJECT &&
                ((instruction as ReferenceInstruction).reference as FieldReference).definingClass == rawColors.definingClass
        } ?: throw PatchException("Expected one store of Encore's raw colors.")
        val holder = (store.value as ReferenceInstruction).reference as FieldReference
        val register = (store.value as OneRegisterInstruction).registerA
        rawColors.hook(store.index + 1,
            "invoke-static/range { v$register .. v$register }, $COMPOSE_THEME_CLASS->primitives(Ljava/lang/Object;)V")

        // p1 and p2 are the scrim's top and bottom alphas.
        headerScrimFingerprint(holder).matchAll(1..1).single().method.hook(0, """
            invoke-static/range { p1 .. p1 }, $COMPOSE_THEME_CLASS->scrimAlpha(F)F
            move-result p1
            invoke-static/range { p2 .. p2 }, $COMPOSE_THEME_CLASS->scrimAlpha(F)F
            move-result p2
        """)

        // p3 and p4 hold the icon's tint.
        EncoreIconFingerprint.matchAll(1..1).single().method.hook(0, """
            invoke-static/range { p3 .. p4 }, $COMPOSE_THEME_CLASS->iconTint(J)J
            move-result-wide p3
        """)

        // Each initializer stores Color(0xFF282828) in its field: hook the color before the store.
        for (field in SURFACE_FIELDS) {
            val initializer = mutableClassDefBy(field.substringBefore("->")).methods.single { it.name == "<clinit>" }
            val code = initializer.implementation!!.instructions.toList()
            val constant = code.indices.singleOrNull { index -> storesSurface(code, index, field) }
                ?: throw PatchException("Expected Spotify's #282828 surface stored in $field.")
            val color = (code[constant] as OneRegisterInstruction).registerA
            initializer.hook(constant + 3, """
                invoke-static/range { v$color .. v${color + 1} }, $COMPOSE_THEME_CLASS->surface(J)J
                move-result-wide v$color
            """)
        }
    }
}

/** True when [index] loads #282828, passes it to Color(), and stores the result in [field], all in one register. */
private fun storesSurface(code: List<Instruction>, index: Int, field: String): Boolean {
    val constant = code[index]
    if (constant.opcode != Opcode.CONST_WIDE || (constant as WideLiteralInstruction).wideLiteral != SURFACE) return false
    val register = (constant as OneRegisterInstruction).registerA
    val call = code.getOrNull(index + 1) as? FiveRegisterInstruction ?: return false
    val result = code.getOrNull(index + 2) ?: return false
    val store = code.getOrNull(index + 3) ?: return false
    return call.opcode == Opcode.INVOKE_STATIC && (call as ReferenceInstruction).reference.toString() == COLOR &&
        call.registerCount == 2 && call.registerC == register &&
        result.opcode == Opcode.MOVE_RESULT_WIDE && (result as OneRegisterInstruction).registerA == register &&
        store.opcode == Opcode.SPUT_WIDE && (store as OneRegisterInstruction).registerA == register &&
        (store as ReferenceInstruction).reference.toString() == field
}

private fun MutableMethod.staticReads() = implementation!!.instructions.withIndex()
    .filter { it.value.opcode == Opcode.SGET_OBJECT }
    .map { IndexedValue(it.index, (it.value as ReferenceInstruction).reference as FieldReference) }
