package app.s.chzzk.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.s.chzzk.common.utils.getReference
import app.s.chzzk.common.utils.localRegisterCount
import app.s.chzzk.common.utils.smaliReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.w3c.dom.Element

private const val COMMUNITY = "Lcom/navercorp/game/android/community/"
private const val FILTER = "Lapp/s/chzzk/extension/LocalFilter;"
private const val FOLLOWING = "Lapp/s/chzzk/extension/LocalFollowing;"

internal val localFeaturesResources = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            for (permission in listOf("INTERNET", "ACCESS_NETWORK_STATE", "RECEIVE_BOOT_COMPLETED", "POST_NOTIFICATIONS")) {
                val name = "android.permission.$permission"
                val nodes = manifest.getElementsByTagName("uses-permission")
                if ((0 until nodes.length).none { (nodes.item(it) as Element).getAttribute("android:name") == name }) {
                    val node = document.createElement("uses-permission")
                    node.setAttribute("android:name", name)
                    manifest.appendChild(node)
                }
            }
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val service = document.createElement("service")
            service.setAttribute("android:name", "app.s.chzzk.extension.FollowMonitorJobService")
            service.setAttribute("android:permission", "android.permission.BIND_JOB_SERVICE")
            service.setAttribute("android:exported", "true")
            application.appendChild(service)
        }
    }
}

internal fun BytecodePatchContext.addLocalFeaturesHooks() {
    fun bridge(ownerType: String, name: String, registers: Int, body: String) {
        val owner = mutableClassDefBy(ownerType)
        val original = owner.methods.single { it.name == name }
        val replacement = MutableMethod(ImmutableMethod(ownerType, original.name, original.parameters,
            original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
            ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())))
        replacement.addInstructions(0, body.trimIndent())
        owner.methods.remove(original)
        owner.methods.add(replacement)
    }
    fun getter(type: String, field: String): Method {
        val definition = classDefBy(type).fields.single { it.name == field }
        return classDefBy(type).methods.single { method ->
            method.parameterTypes.isEmpty() && method.returnType == definition.type &&
                method.implementation?.instructions?.count() == 2 &&
                method.implementation?.instructions?.any {
                    it.getReference<FieldReference>()?.let { reference ->
                        reference.definingClass == type && reference.name == field
                    } == true
                } == true
        }
    }

    val itemType = "${COMMUNITY}data/core/entity/serviceplayable/StreamingLiveItem;"
    val microType = "${COMMUNITY}data/core/entity/channel/StreamingMicroChannelIF;"
    val microClass = "${COMMUNITY}data/core/entity/channel/StreamingMicroChannel;"
    val name = getter(microClass, "channelName")
    val image = getter(microClass, "channelImageUrl")
    val nameReference = "$microType->${name.name}()Ljava/lang/String;"
    val imageReference = "$microType->${image.name}()Ljava/lang/String;"
    check(classDefBy(microType).methods.any { it.name == name.name })
    check(classDefBy(microType).methods.any { it.name == image.name })
    val channel = getter(itemType, "channel")
    val title = getter(itemType, "liveTitle")
    val category = getter(itemType, "liveCategoryValue")
    val livePlayable = "${COMMUNITY}data/core/entity/player/StreamingLivePlayableData;"
    val followingRow = "${COMMUNITY}data/core/entity/channel/StreamingFollowingChannel;"
    val followingChannel = getter(followingRow, "channel")
    val followingLive = getter(followingRow, "liveInfo")
    val channelIds = listOf("StreamingMicroChannel", "StreamingMicroChannelPersonal",
        "StreamingChannelPersonal", "StreamingChannelDetail").map { channelType ->
        val type = "${COMMUNITY}data/core/entity/channel/$channelType;"
        if (packageMetadata.versionName !in setOf("1.3.0", "1.4.0") || channelType != "StreamingMicroChannel") {
            getter(type, "channelId")
        } else {
            val owner = mutableClassDefBy(type)
            val field = owner.fields.single { it.name == "channelId" && it.type == "Ljava/lang/String;" }
            check(owner.methods.none { it.name == "sChzzkChannelId" })
            MutableMethod(ImmutableMethod(type, "sChzzkChannelId", emptyList(), "Ljava/lang/String;",
                com.android.tools.smali.dexlib2.AccessFlags.PUBLIC.value, emptySet(), emptySet(),
                ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList()))).also { method ->
                method.addInstructions(0, """
                    iget-object v0, p0, ${field.smaliReference}
                    return-object v0
                """.trimIndent())
                owner.methods.add(method)
            }
        }
    }
    bridge(FILTER, "itemInfo", 7, """
        const/4 v0, 0x4
        new-array v0, v0, [Ljava/lang/String;
        instance-of v1, p0, $itemType
        if-eqz v1, :channel
        check-cast p0, $itemType
        invoke-interface {p0}, $livePlayable->getChannelId()Ljava/lang/String;
        move-result-object v2
        const/4 v1, 0x0
        aput-object v2, v0, v1
        invoke-virtual {p0}, ${title.smaliReference}
        move-result-object v2
        const/4 v1, 0x2
        aput-object v2, v0, v1
        invoke-virtual {p0}, ${category.smaliReference}
        move-result-object v2
        const/4 v1, 0x3
        aput-object v2, v0, v1
        invoke-virtual {p0}, ${channel.smaliReference}
        move-result-object p0
        if-eqz p0, :done
        check-cast p0, $microType
        invoke-interface {p0}, $nameReference
        move-result-object v2
        const/4 v1, 0x1
        aput-object v2, v0, v1
        return-object v0
        :channel
        instance-of v1, p0, $followingRow
        if-eqz v1, :micro
        check-cast p0, $followingRow
        invoke-virtual {p0}, ${followingLive.smaliReference}
        move-result-object v4
        if-eqz v4, :following_channel
        invoke-virtual {v4}, ${title.smaliReference}
        move-result-object v2
        const/4 v1, 0x2
        aput-object v2, v0, v1
        invoke-virtual {v4}, ${category.smaliReference}
        move-result-object v2
        const/4 v1, 0x3
        aput-object v2, v0, v1
        :following_channel
        invoke-virtual {p0}, ${followingChannel.smaliReference}
        move-result-object p0
        :micro
        instance-of v1, p0, $microType
        if-eqz v1, :unknown
        ${channelIds.mapIndexed { index, method -> """
            instance-of v1, p0, ${method.definingClass}
            if-eqz v1, :next_channel_id_$index
            move-object v3, p0
            check-cast v3, ${method.definingClass}
            invoke-virtual {v3}, ${method.smaliReference}
            move-result-object v2
            goto :channel_id
            :next_channel_id_$index
        """.trimIndent() }.joinToString("\n")}
        const/4 v2, 0x0
        :channel_id
        const/4 v1, 0x0
        aput-object v2, v0, v1
        check-cast p0, $microType
        invoke-interface {p0}, $nameReference
        move-result-object v2
        const/4 v1, 0x1
        aput-object v2, v0, v1
        :done
        return-object v0
        :unknown
        const/4 v0, 0x0
        return-object v0
    """)

    val listMethods = mutableListOf<Pair<String, String>>()
    classDefForEach { definition ->
        if (definition.type.startsWith("${COMMUNITY}data/") && !definition.type.contains("serializer")) {
            definition.methods.filter { method ->
                method.parameterTypes.isEmpty() && method.returnType == "Ljava/util/List;" &&
                    method.implementation?.instructions?.any {
                        it.getReference<FieldReference>()?.let { field ->
                            field.definingClass == definition.type && field.type == "Ljava/util/List;"
                        } == true
                    } == true
            }.forEach { listMethods.add(definition.type to it.name) }
        }
    }
    check(listMethods.isNotEmpty())
    for ((owner, methodName) in listMethods) {
        val method = mutableClassDefBy(owner).methods.single {
            it.name == methodName && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/List;"
        }
        method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            .reversed().forEach { (index, instruction) ->
                val register = (instruction as OneRegisterInstruction).registerA
                method.addInstructions(index, """
                    invoke-static/range {v$register .. v$register}, $FILTER->filter(Ljava/util/List;)Ljava/util/List;
                    move-result-object v$register
                """.trimIndent())
            }
    }

    val detailType = "${COMMUNITY}ui/common/ui/overlayplayerend/live/streaming/StreamingLiveDetail;"
    val detail = classDefBy(detailType)
    val detailChannel = detail.fields.single { it.name == "c" && it.type == "Ljava/lang/String;" }
    val detailInfo = detail.fields.single { it.type == "${COMMUNITY}data/core/entity/channel/StreamingChannelDetail;" }
    val statusType = "${COMMUNITY}data/core/entity/serviceplayable/StreamingLiveStatus;"
    val status = getter(statusType, "status")
    val statusTitle = getter(statusType, "liveTitle")
    val statusCategory = getter(statusType, "liveCategoryValue")
    val opened = getter(statusType, "openDate")
    val connecting = getter(statusType, "liveConnecting")
    bridge(FOLLOWING, "capture", 8, """
        check-cast p0, $detailType
        if-eqz p0, :done
        iget-object v0, p0, ${detailChannel.smaliReference}
        iget-object v1, p0, ${detailInfo.smaliReference}
        if-eqz v1, :done
        invoke-interface {v1}, $nameReference
        move-result-object v2
        invoke-interface {v1}, $imageReference
        move-result-object v1
        invoke-static {v0, v2, v1}, $FOLLOWING->updateCurrent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
        if-eqz p1, :done
        check-cast p1, $statusType
        invoke-virtual {p1}, ${statusTitle.smaliReference}
        move-result-object v1
        invoke-virtual {p1}, ${statusCategory.smaliReference}
        move-result-object v2
        invoke-virtual {p1}, ${status.smaliReference}
        move-result-object v3
        if-eqz v3, :done
        invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;
        move-result-object v3
        invoke-virtual {p1}, ${opened.smaliReference}
        move-result-object v4
        invoke-virtual {p1}, ${connecting.smaliReference}
        move-result v5
        invoke-static/range {v0 .. v5}, $FOLLOWING->observe(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
        :done
        return-void
    """)
    mutableClassDefBy(detailType).methods.filter { it.name == "<init>" }.forEach { constructor ->
        val instructions = constructor.implementation!!.instructions.toList()
        val receiver = constructor.localRegisterCount
        val fieldWrites = setOf(Opcode.IPUT, Opcode.IPUT_OBJECT, Opcode.IPUT_WIDE, Opcode.IPUT_BOOLEAN,
            Opcode.IPUT_BYTE, Opcode.IPUT_CHAR, Opcode.IPUT_SHORT)
        val lastWrite = instructions.withIndex().last { (_, instruction) ->
            instruction.opcode in fieldWrites &&
                (instruction as TwoRegisterInstruction).registerB == receiver &&
                instruction.getReference<FieldReference>()?.definingClass == detailType
        }
        check(instructions.take(lastWrite.index + 1).none { instruction ->
            val destination = (instruction as? OneRegisterInstruction)?.registerA
            instruction.opcode.setsRegister() && (destination == receiver ||
                (instruction.opcode.setsWideRegister() && destination?.plus(1) == receiver))
        }) { "CHZZK detail constructor receiver was overwritten before capture" }
        val exit = instructions.withIndex().single { it.value.opcode == Opcode.RETURN_VOID }.index
        check(if (packageMetadata.versionName in setOf("1.3.0", "1.4.0")) lastWrite.index + 1 < exit else lastWrite.index + 1 == exit)
        constructor.addInstructions(lastWrite.index + 1,
            "invoke-static/range {v$receiver .. v$receiver}, $FOLLOWING->captureDetail(Ljava/lang/Object;)V")
    }
}
