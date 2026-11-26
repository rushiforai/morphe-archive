/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/4316
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-11-19.
 */

package app.morphe.patches.shared.misc.request

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.util.Utils.printWarn
import app.morphe.util.updatePatchStatus
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val EXTENSION_MEDIA_HTTP_REQUEST_INTERFACE =
    "Lapp/morphe/extension/shared/patches/MediaHttpRequest;"
private const val EXTENSION_MEDIA_HTTP_HEADER_INTERFACE =
    "Lapp/morphe/extension/shared/patches/MediaHttpHeader;"
private const val EXTENSION_WEB_MEDIA_REQUEST_INTERFACE =
    "Lapp/morphe/extension/shared/patches/WebMediaRequest;"

/**
 * Lets the extension read the media requests that native code starts, and replace them.
 */
internal val mediaRequestPatch = bytecodePatch(
    description = "mediaRequestPatch",
) {
    execute {
        mutableClassDefBy(HTTP_REQUEST_CLASS_TYPE).apply {
            interfaces.add(EXTENSION_MEDIA_HTTP_REQUEST_INTERFACE)

            // Each field of the request has its own type.
            val urlField = instanceFields.single { field -> field.type == "Ljava/lang/String;" }
            val bodyField = instanceFields.single { field -> field.type == "[B" }

            mapOf(
                "patch_getUrl" to urlField,
                "patch_getBody" to bodyField,
            ).forEach { (methodName, field) ->
                addGetter(methodName, field)
            }

            // The constructor takes each field, and each field has its own type.
            val constructor = HttpRequestConstructorFingerprint.originalMethod
            val constructorParameters = constructor.parameterTypes.map(CharSequence::toString)
            val loadConstructorParameters = constructorParameters.mapIndexed { index, parameterType ->
                // Register v0 is the new request.
                val register = "v${index + 1}"
                val field = instanceFields.single { field -> field.type == parameterType }
                when (parameterType) {
                    bodyField.type -> "move-object $register, p1"
                    "Z" -> "iget-boolean $register, p0, $field"
                    else -> "iget-object $register, p0, $field"
                }
            }.joinToString("\n")

            methods.add(
                ImmutableMethod(
                    type,
                    "patch_withBody",
                    listOf(ImmutableMethodParameter("[B", null, null)),
                    EXTENSION_MEDIA_HTTP_REQUEST_INTERFACE,
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    // The new request, its parameters, and the 2 parameters of this method.
                    MutableMethodImplementation(1 + constructorParameters.size + 2),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            new-instance v0, $type
                            $loadConstructorParameters
                            invoke-direct/range { v0 .. v${constructorParameters.size} }, $constructor
                            return-object v0
                        """
                    )
                }
            )

            val headerMatch = HttpHeaderConstructorFingerprint.matchOrNull()
            val headersField = instanceFields.singleOrNull { field -> field.type == "Ljava/util/ArrayList;" }
            if (headerMatch == null || headersField == null || headersField.type !in constructorParameters) {
                printWarn("Mobile Web spoof client unavailable: native media request headers could not be linked.")
                return@execute
            }

            val headerNameField = headerMatch.instructionMatches.first().fieldReference
            mutableClassDefBy(HTTP_HEADER_CLASS_TYPE).apply {
                interfaces.add(EXTENSION_MEDIA_HTTP_HEADER_INTERFACE)
                addGetter("patch_getName", headerNameField)
            }
            interfaces.add(EXTENSION_WEB_MEDIA_REQUEST_INTERFACE)
            addGetter("patch_getHeaders", headersField)

            val loadWebParameters = constructorParameters.mapIndexed { index, parameterType ->
                val register = "v${index + 1}"
                val field = instanceFields.single { field -> field.type == parameterType }
                when (parameterType) {
                    bodyField.type -> "move-object $register, p1"
                    headersField.type -> "move-object $register, p2"
                    "Z" -> "iget-boolean $register, p0, $field"
                    else -> "iget-object $register, p0, $field"
                }
            }.joinToString("\n")

            methods.add(
                ImmutableMethod(
                    type,
                    "patch_withBodyAndHeaders",
                    listOf("[B", headersField.type).map { ImmutableMethodParameter(it, null, null) },
                    EXTENSION_MEDIA_HTTP_REQUEST_INTERFACE,
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(1 + constructorParameters.size + 3),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            new-instance v0, $type
                            $loadWebParameters
                            invoke-direct/range { v0 .. v${constructorParameters.size} }, $constructor
                            return-object v0
                        """
                    )
                }
            )
        }
    }
}

context(patchContext: BytecodePatchContext)
internal fun enableMobileWebMediaBridge() {
    if (hasNativeMediaHeaderBridge()) {
        updatePatchStatus("Lapp/morphe/extension/shared/patches/PatchStatus;", "MobileWebMediaRequest")
    }
}

/** Ghost mode also requires a resolved NetFetch entry point before enabling its guards. */
context(patchContext: BytecodePatchContext)
internal fun hasNativeMediaHeaderBridge() =
    EXTENSION_WEB_MEDIA_REQUEST_INTERFACE in patchContext.mutableClassDefBy(HTTP_REQUEST_CLASS_TYPE).interfaces

context(patchContext: BytecodePatchContext)
internal fun hasNativeMediaRequestHook() = NetFetchStartFetchTaskFingerprint.matchOrNull() != null

private fun MutableClass.addGetter(methodName: String, field: FieldReference) {
    methods.add(
        ImmutableMethod(
            type,
            methodName,
            listOf(),
            field.type,
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    iget-object v0, p0, $field
                    return-object v0
                """
            )
        }
    )
}

/**
 * Calls the extension when native code starts a media request.
 *
 * @param descriptor Static method that takes the request and the callbacks of the request.
 * @param replacesRequest If the method returns the request to start instead,
 *                        which can be a copy made by the extension.
 */
context(patchContext: BytecodePatchContext)
internal fun hookMediaRequest(
    descriptor: String,
    replacesRequest: Boolean = false
) {
    NetFetchStartFetchTaskFingerprint.method.apply {
        if (replacesRequest) {
            addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p2 }, $descriptor(${EXTENSION_MEDIA_HTTP_REQUEST_INTERFACE}Ljava/lang/Object;)$EXTENSION_MEDIA_HTTP_REQUEST_INTERFACE
                    move-result-object p1
                    check-cast p1, $HTTP_REQUEST_CLASS_TYPE
                """
            )
        } else {
            addInstruction(
                0,
                "invoke-static/range { p1 .. p2 }, $descriptor(${EXTENSION_MEDIA_HTTP_REQUEST_INTERFACE}Ljava/lang/Object;)V"
            )
        }
    }
}

/**
 * Calls the extension with each chunk of a media response, before native code reads it.
 *
 * @param descriptor Static method that takes the callbacks of the request and the chunk.
 */
context(patchContext: BytecodePatchContext)
internal fun hookMediaResponseChunk(descriptor: String) {
    NetFetchResponseChunkFingerprint.method.addInstruction(
        0,
        "invoke-static/range { p0 .. p1 }, $descriptor(Ljava/lang/Object;Ljava/nio/ByteBuffer;)V"
    )
}
