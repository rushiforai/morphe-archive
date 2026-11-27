// SPDX-License-Identifier: AGPL-3.0-or-later

package app.edbfi.patches.syncforreddit.misc.ultra

import app.reseam.patch.BytecodeScope
import app.reseam.patch.dex.AccessFlags
import app.reseam.patch.dex.DexClass
import app.reseam.patch.dex.Method
import app.reseam.patch.dex.isSet

internal const val IDENTIFICATION = "Lcom/google/mlkit/nl/languageid/LanguageIdentification;"
internal const val IDENTIFIER = "Lcom/google/mlkit/nl/languageid/LanguageIdentifier;"
internal const val TRANSLATOR = "Lcom/google/mlkit/nl/translate/Translator;"
internal const val TASK = "Lcom/google/android/gms/tasks/Task;"
private const val AVAILABILITY = "Lcom/google/android/gms/common/GoogleApiAvailability;"
private const val LISTENER = "Lcom/google/android/gms/tasks/OnCompleteListener;"
private const val ML_KIT_EXCEPTION = "Lcom/google/mlkit/common/MlKitException;"
private const val TRANSLATION = "Lcom/google/mlkit/nl/translate/Translation;"
private const val OPTIONS = "Lcom/google/mlkit/nl/translate/TranslatorOptions;"
private const val OPTIONS_BUILDER = "Lcom/google/mlkit/nl/translate/TranslatorOptions\$Builder;"
private const val CONDITIONS = "Lcom/google/mlkit/common/model/DownloadConditions;"
private const val CONDITIONS_BUILDER = "Lcom/google/mlkit/common/model/DownloadConditions\$Builder;"
private const val STRING = "Ljava/lang/String;"

private enum class Invocation { STATIC, VIRTUAL, INTERFACE, CONSTRUCTOR }

internal fun BytecodeScope.requireTranslationApi() {
    // The compile-only Java stubs link to Sync 23033's R8 names and erased DEX prototypes.
    // Check those references against the input before Ultra edits any resources or bytecode.
    requireMethod(AVAILABILITY, "q", "()$AVAILABILITY", Invocation.STATIC)
    requireMethod(AVAILABILITY, "i", "(Landroid/content/Context;)I")

    requireMethod(IDENTIFICATION, "a", "()$IDENTIFIER", Invocation.STATIC)
    requireMethod(IDENTIFIER, "q0", "($STRING)$TASK", Invocation.INTERFACE)
    requireMethod(IDENTIFIER, "close", "()V", Invocation.INTERFACE)
    requireMethod(ML_KIT_EXCEPTION, "a", "()I")

    requireClass(OPTIONS)
    requireMethod(OPTIONS_BUILDER, "<init>", "()V", Invocation.CONSTRUCTOR)
    requireMethod(OPTIONS_BUILDER, "b", "($STRING)$OPTIONS_BUILDER")
    requireMethod(OPTIONS_BUILDER, "c", "($STRING)$OPTIONS_BUILDER")
    requireMethod(OPTIONS_BUILDER, "a", "()$OPTIONS")
    requireMethod(TRANSLATION, "a", "($OPTIONS)$TRANSLATOR", Invocation.STATIC)
    requireClass(CONDITIONS)
    requireMethod(CONDITIONS_BUILDER, "<init>", "()V", Invocation.CONSTRUCTOR)
    requireMethod(CONDITIONS_BUILDER, "b", "()$CONDITIONS_BUILDER")
    requireMethod(CONDITIONS_BUILDER, "a", "()$CONDITIONS")
    requireMethod(TRANSLATOR, "G", "($CONDITIONS)$TASK", Invocation.INTERFACE)
    requireMethod(TRANSLATOR, "A", "($STRING)$TASK", Invocation.INTERFACE)
    requireMethod(TRANSLATOR, "close", "()V", Invocation.INTERFACE)

    val callback = requireMethod(LISTENER, "a", "($TASK)V", Invocation.INTERFACE)
    check(AccessFlags.ABSTRACT.isSet(callback.info.accessFlags)) {
        "Expected abstract translation listener callback $LISTENER->a($TASK)V"
    }
    requireMethod(TASK, "b", "($LISTENER)$TASK")
    requireMethod(TASK, "l", "()Ljava/lang/Exception;")
    requireMethod(TASK, "m", "()Ljava/lang/Object;")
    requireMethod(TASK, "q", "()Z")
}

private fun BytecodeScope.requireClass(descriptor: String): DexClass {
    val type = checkNotNull(findClass(descriptor)) { "Missing translation API class $descriptor" }
    check(AccessFlags.PUBLIC.isSet(type.info.accessFlags)) { "Translation API class $descriptor is not public" }
    return type
}

private fun BytecodeScope.requireMethod(
    owner: String,
    name: String,
    proto: String,
    invocation: Invocation = Invocation.VIRTUAL,
): Method {
    val ref = "$owner->$name$proto"
    val type = requireClass(owner)
    check(type.isInterface == (invocation == Invocation.INTERFACE)) {
        "Unexpected owner kind for translation API $ref ($invocation)"
    }

    fun declared(candidate: DexClass): Method? {
        val methods = candidate.methods.filter { it.name == name && it.proto == proto }
        check(methods.size <= 1) { "Duplicate translation API declaration of $ref on ${candidate.descriptor}" }
        return methods.singleOrNull()
    }

    // Resolve the nearest declaration first, then check its access and invocation kind.
    val resolved = when (invocation) {
        Invocation.CONSTRUCTOR -> declared(type)
        Invocation.STATIC, Invocation.VIRTUAL -> declared(type)
            ?: type.superclassChain.firstNotNullOfOrNull(::declared)
        Invocation.INTERFACE -> {
            val visited = mutableSetOf<String>()
            fun resolve(candidate: DexClass): List<Method> {
                if (!visited.add(candidate.descriptor)) return emptyList()
                declared(candidate)?.let { return listOf(it) }
                return candidate.interfaces.mapNotNull { findClass(it) }.flatMap(::resolve)
            }
            val methods = resolve(type)
            check(methods.size <= 1) { "Ambiguous inherited translation API $ref" }
            methods.singleOrNull()
        }
    }
    val method = checkNotNull(resolved) { "Missing translation API method $ref" }
    val validInvocation = when (invocation) {
        Invocation.STATIC -> method.isStatic && method in method.classDef.directMethods
        Invocation.VIRTUAL, Invocation.INTERFACE -> !method.isStatic && method in method.classDef.virtualMethods
        Invocation.CONSTRUCTOR -> !method.isStatic && method in type.directMethods &&
            AccessFlags.CONSTRUCTOR.isSet(method.info.accessFlags) && !AccessFlags.ABSTRACT.isSet(type.info.accessFlags)
    }
    check(AccessFlags.PUBLIC.isSet(method.info.accessFlags) && validInvocation) {
        "Expected public translation API method $ref ($invocation), resolved ${method.descriptor}"
    }
    return method
}
