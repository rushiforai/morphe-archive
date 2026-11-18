package app.saketh.patches.webnovel.reader

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val CONTEXT = "Landroid/content/Context;"

/** Resolves the reader's selected typeface by font name. Only this selector knows the Thai faces. */
internal object ReaderTypefaceFingerprint : Fingerprint(
    isStatic = true,
    returnType = TYPEFACE,
    parameters = listOf(CONTEXT, "Ljava/lang/String;"),
    strings = listOf("Sarabun", "Maitree"),
)

/** The reader paint cache applies the selected reader typeface to its text paints. */
internal fun readerPaintFontsFingerprint() = ReaderTypefaceFingerprint.method.let { typeface ->
    Fingerprint(
        returnType = "V",
        parameters = emptyList(),
        filters = listOf(methodCall(definingClass = typeface.definingClass, name = typeface.name,
            parameters = typeface.parameterTypes.map { it.toString() }, returnType = TYPEFACE)),
    )
}

/** Marks the paint cache stale so the reader rebuilds it before its next screen opens. */
internal fun MutableClass.invalidateCall(): String = methods.single { method ->
    AccessFlags.STATIC.isSet(method.accessFlags) && method.name != "<clinit>" &&
        method.parameterTypes.isEmpty() && method.returnType == "V" &&
        method.implementation?.instructions.orEmpty().any { it.opcode == Opcode.SPUT_BOOLEAN }
}.let { "invoke-static {}, $type->${it.name}()V" }
