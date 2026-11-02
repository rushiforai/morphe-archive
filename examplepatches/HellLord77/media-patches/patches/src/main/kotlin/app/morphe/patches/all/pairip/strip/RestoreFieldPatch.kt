package app.morphe.patches.all.pairip.strip

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.all.pairip.shared.patches.application.application.attachBaseContextPatch
import app.morphe.patches.all.pairip.shared.patches.vmRunner.classConstructorPatch
import app.morphe.patches.all.pairip.shared.patches.vmRunner.invokePatch
import app.morphe.patches.shared.Type
import app.morphe.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken

private const val EXTENSION_CLASS = "Lapp/morphe/extension/pairip/RestoreMethod;"

private data class Translation(
    val type: String,
    val fields: Map<String, String>,
)

internal val restoreFieldPatch =
    bytecodePatch {
        dependsOn(
            attachBaseContextPatch,
            classConstructorPatch,
            invokePatch,
        )

        extendWith("extensions/pairip.mpe")

        execute {
            val dictionaryPath =
                "/pairip/${packageMetadata.packageName}/${packageMetadata.versionCode}.json"
            val stream = object {}.javaClass.getResourceAsStream(dictionaryPath)!!.bufferedReader()
            val dictionary: Map<String, Translation> =
                Gson().fromJson(stream, object : TypeToken<Map<String, Translation>>() {}.type)

            val restoreInstructions = mutableListOf<ImmutableInstruction>()
            dictionary.entries.forEach { (name, translation) ->
                val restoreField =
                    when (translation.type) {
                        "java.lang.String" -> ::restoreString
                        "java.lang.reflect.Method" -> ::restoreMethod
                        else -> throw PatchException("Unsupported type: ${translation.type}")
                    }

                val definingClass = "L${name.replace('.', '/')};"
                translation.fields.forEach { (fieldName, fieldStr) ->
                    restoreInstructions.addAll(restoreField(definingClass, fieldName, fieldStr))
                }
            }
            restoreInstructions.add(ImmutableInstruction10x(Opcode.RETURN_VOID))

            val startupLauncher = mutableClassDefBy("Lcom/pairip/StartupLauncher;")
            val restoreFields =
                ImmutableMethod(
                    startupLauncher.toString(),
                    "restoreFields",
                    emptyList(),
                    Type.void,
                    AccessFlags.PRIVATE.value or AccessFlags.STATIC.value,
                    null,
                    null,
                    ImmutableMethodImplementation(
                        1,
                        restoreInstructions,
                        null,
                        null,
                    ),
                )
            startupLauncher.methods.add(restoreFields.toMutable())

            val application = mutableClassDefBy("Lcom/pairip/application/Application;")
            InvokeMethodCallFingerprint.matchAllMethodIndicesForEach {
                val constructor =
                    ImmutableMethod(
                        application.toString(),
                        "<clinit>",
                        emptyList(),
                        Type.void,
                        AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
                        null,
                        null,
                        ImmutableMethodImplementation(
                            0,
                            listOf(
                                ImmutableInstruction35c(
                                    Opcode.INVOKE_STATIC,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    0,
                                    this,
                                ),
                                ImmutableInstruction10x(Opcode.RETURN_VOID),
                            ),
                            null,
                            null,
                        ),
                    )
                application.methods.add(constructor.toMutable())

                replaceInstruction(
                    it,
                    BuilderInstruction35c(
                        Opcode.INVOKE_STATIC,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        restoreFields,
                    ),
                )
            }
        }
    }

private fun restoreMethod(
    definingClass: String,
    fieldName: String,
    fieldStr: String,
) = listOf(
    ImmutableInstruction21c(
        Opcode.CONST_STRING,
        0,
        ImmutableStringReference(fieldStr),
    ),
    ImmutableInstruction35c(
        Opcode.INVOKE_STATIC,
        1,
        0,
        0,
        0,
        0,
        0,
        ImmutableMethodReference(
            EXTENSION_CLASS,
            "get",
            listOf(Type.STRING),
            Type.METHOD,
        ),
    ),
    ImmutableInstruction11x(
        Opcode.MOVE_RESULT_OBJECT,
        0,
    ),
    ImmutableInstruction21c(
        Opcode.SPUT_OBJECT,
        0,
        ImmutableFieldReference(
            definingClass,
            fieldName,
            Type.METHOD,
        ),
    ),
)

private fun restoreString(
    definingClass: String,
    fieldName: String,
    fieldStr: String,
) = listOf(
    ImmutableInstruction21c(
        Opcode.CONST_STRING,
        0,
        ImmutableStringReference(fieldStr),
    ),
    ImmutableInstruction21c(
        Opcode.SPUT_OBJECT,
        0,
        ImmutableFieldReference(
            definingClass,
            fieldName,
            Type.STRING,
        ),
    ),
)
