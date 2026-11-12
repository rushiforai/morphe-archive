/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-11.
 * Written by lavinhoque33, 2026-11-10.
 */
package app.morphe.patches.music.interaction.downloads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.music.interaction.jam.implementsType
import app.morphe.patches.music.interaction.jam.interfaceClosure
import app.morphe.patches.music.interaction.jam.invokeKind
import app.morphe.patches.music.interaction.jam.p0Register
import app.morphe.patches.music.interaction.jam.queueMenuResponseConstructorFingerprint
import app.morphe.patches.music.interaction.jam.queueResponseMapperConstructorFingerprint
import app.morphe.patches.music.interaction.jam.queueResponseMapperFingerprint
import app.morphe.patches.music.interaction.jam.queueVideoIdFingerprint
import app.morphe.patches.shared.misc.fix.proto.parseByteArrayMethodRef
import app.morphe.util.Utils.printInfo
import app.morphe.util.Utils.printWarn
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val SONG_MENUS = "Lapp/morphe/extension/music/patches/flyout/SongMenus;"
private const val MENU_CLIENT = $$"Lapp/morphe/extension/music/patches/flyout/SongMenus$Client;"
private const val MENU_RESPONSE = $$"Lapp/morphe/extension/music/patches/flyout/SongMenus$Response;"
private const val MENU_ITEM = $$"Lapp/morphe/extension/music/patches/flyout/SongMenus$Item;"
private const val EXECUTOR = "Ljava/util/concurrent/Executor;"
private const val LIST = "Ljava/util/List;"
private const val OBJECT = "Ljava/lang/Object;"
private const val REGISTRY = "Lcom/google/protobuf/ExtensionRegistryLite;"

private fun Method.createdTypes(): Set<String> = implementation?.instructions?.toList().orEmpty()
    .mapNotNull { it.getReference<TypeReference>()?.type }.toSet()

/** Finds the field actually initialized from the native queue requester, not another merged-class variant. */
private fun Method.storedRequester(requesterType: String): FieldReference? {
    val types = parameterTypes.map { it.toString() }
    val index = types.indexOf(requesterType)
    if (index < 0 || types.count { it == requesterType } != 1) return null
    val requesterRegister = p0Register + 1 + types.take(index).fold(0) { words, type ->
        words + if (type == "J" || type == "D") 2 else 1
    }
    return implementation!!.instructions.filter { instruction ->
        instruction.opcode == Opcode.IPUT_OBJECT && instruction is TwoRegisterInstruction &&
                instruction.registerA == requesterRegister && instruction.registerB == p0Register
    }.mapNotNull { it.getReference<FieldReference>() }
        .filter { it.definingClass == definingClass && (it.type == requesterType || it.type == OBJECT) }
        .distinctBy { it.toString() }.singleOrNull()
}

/** Independent of Jam: isolate native renderer lookup from every queue-response consumer. */
internal fun BytecodePatchContext.installSongMenus(commandType: String) {
    try {
        val requestType = Fingerprint(strings = listOf("music/get_queue")).classDef.type
        fun Method.referencesRequest(): Boolean = implementation?.instructions?.any {
            it.getReference<TypeReference>()?.type == requestType || it.getReference<MethodReference>()?.let { call ->
                call.definingClass == requestType || call.returnType == requestType
            } == true
        } == true

        val lookup = Fingerprint(
            parameters = listOf(commandType, EXECUTOR),
            returnType = "L",
            custom = { method, _ -> method.referencesRequest() },
        ).method
        check(!AccessFlags.STATIC.isSet(lookup.accessFlags)) { "menu lookup is not an instance method" }
        val client = mutableClassDefBy(lookup.definingClass)
        val mappers = queueResponseMapperFingerprint(lookup.createdTypes()).matchAll().filter {
            queueResponseMapperConstructorFingerprint(
                it.originalClassDef.type, client.fields.map { field -> field.type }.toSet(),
            ).matchAllOrNull() != null
        }.map { it.originalMethod }
        val responses = queueMenuResponseConstructorFingerprint(mappers.flatMap { it.createdTypes() }.toSet())
            .matchAllOrNull().orEmpty().map { it.originalClassDef }.distinctBy { it.type }
        check(responses.size <= 1) { "ambiguous native menu response wrappers" }
        val response = responses.singleOrNull()
        val directList = mappers.any { mapper ->
            val lastCall = mapper.implementation?.instructions?.mapNotNull {
                it.getReference<MethodReference>()
            }?.lastOrNull()
            lastCall != null && implementsType(lastCall.returnType, LIST)
        }
        check(response != null || directList) { "native menu lookup returns neither a list nor an item wrapper" }
        val items = response?.fields?.single { it.type == LIST || implementsType(it.type, LIST) }

        val menuFactory = Fingerprint(strings = listOf("MUSIC_MENU_BOTTOM_SHEET_FRAGMENT_TAG")).classDef
        val menuType = menuFactory.methods.filter { it.returnType == "V" && it.parameterTypes.size == 4 }
            .map { it.parameterTypes.first().toString() }.distinct().filter { type ->
                classDefByOrNull(type)?.fields?.any {
                    it.type == type && AccessFlags.STATIC.isSet(it.accessFlags)
                } == true
            }.single()
        val wrapper = Fingerprint(strings = listOf("Counterpart renderer absent in response. ")).classDef
        val rendererType = wrapper.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
            .groupBy { it.type }.filter { it.value.size >= 4 }.keys.single()
        val metadata = mutableListOf<Pair<String, Method>>()
        classDefForEach { owner ->
            if (owner.fields.any { it.type == rendererType }) {
                owner.methods.singleOrNull {
                    it.parameterTypes.isEmpty() && it.returnType == menuType &&
                            !AccessFlags.STATIC.isSet(it.accessFlags)
                }?.let { metadata.add(owner.type to it) }
            }
        }
        check(metadata.isNotEmpty()) { "no native queue metadata exposes its complete menu" }

        val command = mutableClassDefBy(commandType)
        val defaultCommand = command.fields.single {
            it.type == commandType && AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val parserOwner = parseByteArrayMethodRef.get()!!.definingClass
        val parser = mutableClassDefBy(parserOwner).methods.single {
            it.name == "parseFrom" && it.parameterTypes == listOf(parserOwner, "[B", REGISTRY)
        }
        val requesterType = Fingerprint(strings = listOf(
            "com/google/android/apps/youtube/music/player/queue/requester/OnlineQueueItemRequester",
        )).classDef.type
        val captures = client.methods.filter { it.name == "<init>" }.mapNotNull { constructor ->
            constructor.storedRequester(requesterType)?.let { constructor to it }
        }
        val requesterField = captures.map { it.second }.distinctBy { it.toString() }.single()
        check(lookup.implementation!!.instructions.any {
            it.opcode == Opcode.IGET_OBJECT && it.getReference<FieldReference>()?.toString() == requesterField.toString()
        }) { "native lookup does not read the captured queue requester" }
        check(requesterField.type == requesterType || requesterType in lookup.createdTypes()) {
            "native lookup does not use the captured requester type"
        }
        val constructors = captures.map { it.first }
        val responseClass = response?.let { mutableClassDefBy(it.type) }
        val rendererFields = metadata.associate { (type, getter) ->
            val field = getter.implementation!!.instructions.filter {
                it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerB == getter.p0Register
            }.mapNotNull { it.getReference<FieldReference>() }
                .filter { it.definingClass == type && it.type == rendererType }
                .distinctBy { it.toString() }.single()
            type to field
        }
        val shared = metadata.map { interfaceClosure(it.first) }.reduce { first, next -> first intersect next }
        val videoId = queueVideoIdFingerprint(shared).matchAll().groupBy { it.originalClassDef.type }
            .values.single { it.size == 1 }.single().originalMethod
        val factory = classDefBy(requesterType).fields.flatMap { field ->
            (classDefByOrNull(field.type)?.methods ?: emptyList()).filter {
                !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes == listOf(rendererType) &&
                        it.returnType in rendererFields.keys
            }.map { field to it }
        }.single()
        val defaultRenderer = classDefBy(rendererType).fields.single {
            it.type == rendererType && AccessFlags.STATIC.isSet(it.accessFlags)
        }
        val isolated = resolvePureSongMenuLookup(lookup, requestType, requesterType, requesterField)
        val presentation = resolveSongMenuPresentation(commandType, menuType)

        // Resolve the full ABI first; no partially installed capability on older clients.
        installPureSongMenuLookup(isolated)
        installSongMenuPresentation(presentation)
        client.interfaces.add(MENU_CLIENT)
        client.addDownloadsBridge("rvxCanRequestMenu", emptyList(), "Z", 2, """
            iget-object v0, p0, $requesterField
            instance-of v0, v0, $requesterType
            return v0
        """)
        client.addDownloadsBridge("rvxRequestMenu", listOf("[B", EXECUTOR), "Ljava/util/concurrent/Future;", 6, """
            sget-object v0, $defaultCommand
            invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
            move-result-object v1
            invoke-static {v0, p1, v1}, $parser
            move-result-object v0
            check-cast v0, $commandType
            ${isolated.contextRead}
            invoke-virtual {p0, v0, p2, v1}, ${isolated.method}
            move-result-object v0
            return-object v0
        """)
        client.addDownloadsBridge("rvxRestoreSong", listOf("[B"), OBJECT, 5, """
            sget-object v0, $defaultRenderer
            invoke-static {}, $REGISTRY->getGeneratedRegistry()$REGISTRY
            move-result-object v1
            invoke-static {v0, p1, v1}, $parser
            move-result-object v0
            check-cast v0, $rendererType
            iget-object v2, p0, $requesterField
            check-cast v2, $requesterType
            iget-object v2, v2, ${factory.first}
            ${invokeKind(factory.second)} {v2, v0}, ${factory.second}
            move-result-object v0
            return-object v0
        """)
        constructors.forEach { constructor ->
            constructor.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.reversed().forEach { index ->
                    constructor.addInstruction(index, "invoke-static/range {p0 .. p0}, $SONG_MENUS->onClient($OBJECT)V")
                }
        }
        if (responseClass != null) {
            responseClass.interfaces.add(MENU_RESPONSE)
            responseClass.addDownloadsBridge("rvxMenuItems", emptyList(), LIST, 2, """
                iget-object v0, p0, $items
                return-object v0
            """)
        }
        metadata.forEach { (type, getter) ->
            mutableClassDefBy(type).apply {
                interfaces.add(MENU_ITEM)
                addDownloadsBridge("rvxSongMenu", emptyList(), OBJECT, 2, """
                    invoke-virtual {p0}, $getter
                    move-result-object v0
                    return-object v0
                """)
                addDownloadsBridge("rvxSongRenderer", emptyList(), OBJECT, 2, """
                    iget-object v0, p0, ${rendererFields.getValue(type)}
                    return-object v0
                """)
                addDownloadsBridge("rvxSongId", emptyList(), "Ljava/lang/String;", 2, """
                    ${invokeKind(videoId)} {p0}, $videoId
                    move-result-object v0
                    return-object v0
                """)
            }
        }
        printInfo("No Playlist song menu: isolated lookup ${isolated.method}, complete renderer $rendererType")
        printInfo("No Playlist menu client: $requesterField is $requesterType; ${constructors.size} constructor(s)")
    } catch (ex: Exception) {
        printWarn("No Playlist stock song menus are unavailable on this Music version: ${ex.message}")
    }
}
