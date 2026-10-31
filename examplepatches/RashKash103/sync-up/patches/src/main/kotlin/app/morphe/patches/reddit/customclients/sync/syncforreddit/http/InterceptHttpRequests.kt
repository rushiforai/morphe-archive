package app.morphe.patches.reddit.customclients.sync.syncforreddit.http

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch
import app.morphe.patcher.util.getReference
import app.morphe.util.indexOfFirstInstructionOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val OKHTTP_EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/http/OkHttpRequestHook;"

/** For the clients Sync draws its pictures through, whose requests are marked as such. */
private const val INSTALL_IMAGE_CLIENT_METHOD =
    "installForImages(Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;"

private const val INSTALL_CLIENT_METHOD =
    "install(Lokhttp3/OkHttpClient;)Lokhttp3/OkHttpClient;"

/**
 * Has no name, so it is not offered to users directly. The patches that need to see Reddit
 * traffic depend on it.
 */
val interceptHttpRequests = bytecodePatch(
    description = "Routes Sync's Reddit API traffic through the extension's interceptors.",
    default = false
) {
    dependsOn(sharedExtensionPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        // region Every client Sync hands out.

        // Sync keeps its clients in one helper and reaches them through getters. Hooking those
        // covers whatever asks for one, which hooking the places that use them does not: the
        // video player builds a data source straight from two of these getters rather than
        // from the holder that everything else goes through, so its requests were the only
        // ones the extension never saw.
        OKHTTP_HELPER_CLIENT_GETTERS.forEach { name ->
            Fingerprint(
                definingClass = OKHTTP_HELPER_CLASS,
                name = name,
                parameters = listOf(),
                returnType = "Lokhttp3/OkHttpClient;",
            ).method.apply {
                // A getter can return from more than one place, and every one of them hands out
                // a client.
                instructions.withIndex()
                    .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN_OBJECT }
                    .map { (index, _) -> index }
                    .reversed()
                    .forEach { index ->
                        val register = getInstruction<OneRegisterInstruction>(index).registerA
                        addInstructions(
                            index,
                            """
                            invoke-static       { v$register }, $OKHTTP_EXTENSION_CLASS_DESCRIPTOR->$INSTALL_CLIENT_METHOD
                            move-result-object  v$register
                            """
                        )
                    }
            }
        }

        // endregion

        // region Volley, which carries every Reddit API request.

        volleyPerformRequestFingerprint.method.apply {
            val index = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.name == "newCall" && reference.definingClass == "Lokhttp3/OkHttpClient;"
            }
            val clientRegister = getInstruction<FiveRegisterInstruction>(index).registerC

            addInstructions(
                index,
                """
                invoke-static       { v$clientRegister }, $OKHTTP_EXTENSION_CLASS_DESCRIPTOR->$INSTALL_CLIENT_METHOD
                move-result-object  v$clientRegister
                """
            )
        }

        // endregion

        // region The client Sync hands to Glide, which every image loads through.

        glideRegisterComponentsFingerprint.method.apply {
            val index = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                        getReference<MethodReference>()?.returnType == "Lokhttp3/OkHttpClient;"
            }
            // The register the client was moved into, which is then handed to Glide.
            val clientRegister = getInstruction<OneRegisterInstruction>(index + 1).registerA

            addInstructions(
                index + 2,
                """
                invoke-static       { v$clientRegister }, $OKHTTP_EXTENSION_CLASS_DESCRIPTOR->$INSTALL_IMAGE_CLIENT_METHOD
                move-result-object  v$clientRegister
                """
            )
        }

        // endregion

        // region The Glide integration's own client, unused while Sync supplies one, hooked so
        // that anything falling back to it is covered too.

        glideClientFactoryFingerprint.method.apply {
            val index = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.name == "<init>" && reference.definingClass == "Lokhttp3/OkHttpClient;"
            }
            val clientRegister = getInstruction<FiveRegisterInstruction>(index).registerC

            addInstructions(
                index + 1,
                """
                invoke-static       { v$clientRegister }, $OKHTTP_EXTENSION_CLASS_DESCRIPTOR->$INSTALL_IMAGE_CLIENT_METHOD
                move-result-object  v$clientRegister
                """
            )
        }

        // region The video player, which reads through a client of its own.

        exoPlayerDataSourceFingerprint.method.apply {
            val clientIndex = indexOfFirstInstructionOrThrow {
                opcode == Opcode.INVOKE_STATIC &&
                        getReference<MethodReference>()?.returnType == "Lokhttp3/OkHttpClient;"
            }
            val clientRegister = getInstruction<OneRegisterInstruction>(clientIndex + 1).registerA

            addInstructions(
                clientIndex + 2,
                """
                invoke-static       { v$clientRegister }, $OKHTTP_EXTENSION_CLASS_DESCRIPTOR->$INSTALL_CLIENT_METHOD
                move-result-object  v$clientRegister
                """
            )

            // The player only reads through that client while Sync is caching videos. With the
            // setting off it builds a plain data source, which reaches the network on its own
            // and so is not seen here at all. Handing that one the client backed factory leaves
            // it able to open local files as before while its requests become visible.
            val factoryField = instructions.first {
                it.opcode == Opcode.IPUT_OBJECT &&
                        it.getReference<FieldReference>()?.type == OKHTTP_DATA_SOURCE_FACTORY
            }.getReference<FieldReference>()!!

            val plainSourceIndex = indexOfFirstInstructionOrThrow {
                val reference = getReference<MethodReference>()
                reference?.definingClass == DEFAULT_DATA_SOURCE_FACTORY &&
                        reference.name == "<init>" && reference.parameterTypes.size == 1
            }
            val construction = getInstruction<FiveRegisterInstruction>(plainSourceIndex)
            val instanceRegister = construction.registerC
            val contextRegister = construction.registerD

            // Free by this point: what it last held was consumed when the cache was attached.
            val thisRegister = implementation!!.registerCount - 1
            val freeRegister = (0 until implementation!!.registerCount).first {
                it != instanceRegister && it != contextRegister && it != thisRegister
            }

            addInstructions(
                plainSourceIndex,
                "iget-object v$freeRegister, p0, ${factoryField.definingClass}->" +
                        "${factoryField.name}:${factoryField.type}"
            )
            replaceInstruction(
                plainSourceIndex + 1,
                "invoke-direct       { v$instanceRegister, v$contextRegister, v$freeRegister }, " +
                        "$DEFAULT_DATA_SOURCE_FACTORY-><init>(Landroid/content/Context;" +
                        "Lcom/google/android/exoplayer2/upstream/DataSource\$Factory;)V"
            )
        }

        // endregion

    }
}
