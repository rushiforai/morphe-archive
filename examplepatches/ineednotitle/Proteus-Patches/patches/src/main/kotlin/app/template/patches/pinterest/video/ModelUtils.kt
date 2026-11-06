// Adapted from archivesteak/Quest Pinterest patches (GPL-3.0).
package app.template.patches.pinterest.video

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.value.ArrayEncodedValue
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/*
 * Pinterest's API model classes are obfuscated, but every field keeps an annotation
 * with its JSON name. These helpers find model classes, fields and getters by those names.
 */

internal const val MODEL_PACKAGE = "Lcom/pinterest/api/model/"

/** JSON name of a model field, read from its serialized-name annotation. */
val Field.jsonName: String?
    get() = annotations.firstNotNullOfOrNull { annotation ->
        annotation.elements.firstNotNullOfOrNull { (it.value as? StringEncodedValue)?.value }
    }

/** The model class that declares fields with all of [jsonNames]. */
fun BytecodePatchContext.modelClassWithJsonFields(vararg jsonNames: String): ClassDef =
    classDefBy { classDef ->
        classDef.type.startsWith(MODEL_PACKAGE) &&
            classDef.fields.mapNotNull { it.jsonName }.containsAll(jsonNames.asList())
    }

fun ClassDef.fieldWithJsonName(jsonName: String): Field = fields.single { it.jsonName == jsonName }

/** The no-argument getter that returns [field]. */
fun ClassDef.getterOf(field: Field): Method = methods.single { method ->
    method.parameters.isEmpty() &&
        AccessFlags.PUBLIC.isSet(method.accessFlags) && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.returnType == field.type &&
        method.implementation?.instructions?.any { instruction ->
            instruction.opcode == Opcode.IGET_OBJECT &&
                ((instruction as ReferenceInstruction).reference as FieldReference).let {
                    it.definingClass == type && it.name == field.name
                }
        } == true
}

/** Value type of a `Map<String, V>` field, read from its generic signature. */
val Field.mapValueType: String
    get() = Regex("^Ljava/util/Map<Ljava/lang/String;(L[^<>;]+;)>;$").find(genericType)!!.groupValues[1]

/** Element type of a `List<E>` field, read from its generic signature. */
val Field.listElementType: String
    get() = Regex("^Ljava/util/List<(L[^<>;]+;)>;$").find(genericType)!!.groupValues[1]

private val Field.genericType: String
    get() {
        val signature = annotations.single { it.type == "Ldalvik/annotation/Signature;" }
            .elements.single().value as ArrayEncodedValue
        return signature.value.joinToString("") { (it as StringEncodedValue).value }
    }

/** Smali reference to [method], e.g. `Lfoo;->bar()Ljava/lang/String;`. */
val Method.smaliReference: String
    get() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
