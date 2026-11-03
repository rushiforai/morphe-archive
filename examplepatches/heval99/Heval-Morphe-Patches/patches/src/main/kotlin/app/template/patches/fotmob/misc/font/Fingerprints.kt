package app.template.patches.fotmob.misc.font

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val TYPEFACE = "Landroid/graphics/Typeface;"

/**
 * The static initializer of FotMob's Compose font holder (240: mf5.<clinit>). It stores whether
 * the app font may be used, `SDK_INT > 27 && locales[0].language != "my"`, in its own static
 * boolean; the Compose typography, the semi-bold weight mapping and the splash tagline read that
 * flag and fall back to the system font when it is false (FotMob's own Burmese path). It is the
 * only static initializer that compares a locale language with "my" and stores the result in a
 * boolean of its own class.
 */
internal object AppFontFlagFingerprint : Fingerprint(
    name = "<clinit>",
    accessFlags = listOf(AccessFlags.STATIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(definingClass = "Landroid/os/Build\$VERSION;", name = "SDK_INT", opcode = Opcode.SGET),
        methodCall(definingClass = "Ljava/util/Locale;", name = "getLanguage", returnType = "Ljava/lang/String;"),
        string("my"),
        opcode(Opcode.SPUT_BOOLEAN),
    ),
    custom = { method, classDef ->
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.SPUT_BOOLEAN &&
                ((instruction as ReferenceInstruction).reference as FieldReference).definingClass == classDef.type
        } == true
    },
)

/**
 * The Typeface loader every code-set View font goes through (240: pae.k, 16 callers): on API 26+
 * it loads the font resource and applies the style, otherwise (or when that fails) it returns
 * `Typeface.create(familyName, style)` with the system family name its caller passes
 * ("sans-serif", "sans-serif-medium").
 */
internal object TypefaceLoaderFingerprint : Fingerprint(
    returnType = TYPEFACE,
    parameters = listOf("Landroid/content/Context;", "I", "Ljava/lang/String;", "I"),
    filters = listOf(
        fieldAccess(definingClass = "Landroid/os/Build\$VERSION;", name = "SDK_INT", opcode = Opcode.SGET),
        methodCall(definingClass = TYPEFACE, name = "create", parameters = listOf(TYPEFACE, "I"), returnType = TYPEFACE),
        methodCall(definingClass = TYPEFACE, name = "create", parameters = listOf("Ljava/lang/String;", "I"), returnType = TYPEFACE),
    ),
    // Static (the patch reads the family name and style as p2/p3). The access flags are compared
    // as a whole, so the static bit is checked here instead of pinning public/final too.
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)
