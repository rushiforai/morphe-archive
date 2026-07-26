/*
 * Patch interna (non compare nell'elenco di Morphe Manager) che ripara la libreria protobuf.
 * L'estensione di questo bundle porta con se' protobuf-javalite; quando viene fusa dentro YouTube,
 * che ha gia' la sua copia di protobuf, alcuni metodi risultano mancanti e l'app crasherebbe.
 * Qui vengono ricreati i due metodi che servono (getEmptyRegistry e un writeTo concreto) e viene
 * memorizzato in parseByteArrayMethodRef il metodo di YouTube che trasforma un array di byte in
 * un messaggio protobuf: e' quello che WatchLaterButtonPatch usa per ricostruire la voce della
 * barra dopo averla modificata. Ricopiata da fixProtoLibraryPatch di morphe-patches ufficiale.
 */

package app.ciraolone.patches.watchlater

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.cloneMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.lang.ref.WeakReference

internal lateinit var parseByteArrayMethodRef: WeakReference<MutableMethod>

internal val protoLibraryFixPatch = bytecodePatch(
    description = "Fix method not found exception that can occur when proto libraries used in extensions are merged."
) {
    execute {
        EmptyRegistryFingerprint.let {
            it.method.apply {
                it.classDef.methods.add(
                    ImmutableMethod(
                        definingClass,
                        "getEmptyRegistry",
                        emptyList(),
                        "Lcom/google/protobuf/ExtensionRegistryLite;",
                        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                        annotations,
                        null,
                        MutableMethodImplementation(2),
                    ).toMutable().apply {
                        addInstructions(
                            0,
                            """
                                new-instance v0, Lcom/google/protobuf/ExtensionRegistryLite;
                                invoke-direct {v0}, Lcom/google/protobuf/ExtensionRegistryLite;-><init>()V
                                return-object v0
                            """
                        )
                    }
                )
            }
        }

        MessageLiteWriteToFingerprint.let {
            it.method.apply {
                it.classDef.methods.add(
                    cloneMutable(
                        parameters = listOf(
                            ImmutableMethodParameter(
                                "Lcom/google/protobuf/CodedOutputStream;",
                                null,
                                null
                            )
                        )
                    )
                )
            }
        }

        parseByteArrayMethodRef = WeakReference(ProtobufClassParseByteArrayFingerprint.method)
    }
}
