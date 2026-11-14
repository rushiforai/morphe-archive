package app.morphe.patches.chmate

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATROL_IMAGES = "Lapp/morphe/extension/chmate/PatrolImages;"

/** All native patrol entry points share this worker; ordinary thread viewing is unchanged. */
internal fun BytecodePatchContext.patchPatrolImages(version: String) {
    val config = when (version) {
        "0.8.10.191 dev" -> listOf("d", "d", "o.ndc", "d", "b", "a", "c", "h", "g", "191")
        "0.8.10.226 dev" -> listOf("d", "d", "o.setFilterBitmap", "b", "a", "e", "e", "j", "f", "226")
        "0.8.10.242 dev" -> listOf("a", "haiagaruPatrolAttachments", "o.getEndpointPackageName", "a", "c", "b", "a", "h", "f", "242")
        else -> error("Unsupported patrol image version: $version")
    }
    if (version == "0.8.10.242 dev") {
        // b() is a static accessor for EMPTY_STRING_ARRAY, not a response URL getter.
        // 242 only exposes the UI thumbnail projection; extract URLs without invoking that UI path.
        val response = mutableClassDefBy("Lo/KeJ11;")
        check(response.fields.single { it.name == "h" }.type == "Ljava/lang/String;")
        val extractor = mutableClassDefBy("Lo/KeJ11\$RemoteActionCompatParcelizer;").methods.single {
            it.name == "a" && it.parameterTypes == listOf("Ljava/lang/String;") && it.returnType == "[Ljava/lang/String;"
        }
        response.methods.add(MutableMethod(ImmutableMethod(response.type, config[1], emptyList(),
            "[Ljava/lang/String;", 0x1, emptySet(), emptySet(),
            ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList()))).apply {
            addInstructions(0, """
                iget-object v0, p0, Lo/KeJ11;->h:Ljava/lang/String;
                invoke-static {v0}, $extractor
                move-result-object v0
                invoke-static {p0, v0}, Lapp/morphe/extension/chmate/ImgurAlbumAttachments;->complete(Ljava/lang/Object;[Ljava/lang/String;)[Ljava/lang/String;
                move-result-object v0
                return-object v0
            """.trimIndent())
        })
    }
    val nativeOwner = "L${config[2].replace('.', '/')};"
    val cache = mutableClassDefBy(nativeOwner)
    check(cache.methods.single { it.name == config[3] && it.parameterTypes == listOf("Landroid/content/Context;") }.returnType == nativeOwner)
    check(cache.methods.single { it.name == config[5] && it.parameterTypes == listOf("Ljava/lang/String;") }.returnType == "Ljava/io/InputStream;")
    val info = cache.methods.single { it.name == config[4] && it.parameterTypes == listOf("Ljava/lang/String;") }
    val stream=cache.methods.single{it.name==config[5]&&it.parameterTypes==listOf("Ljava/lang/String;")&&it.returnType=="Ljava/io/InputStream;"}
    val nativeStream=MutableMethod(ImmutableMethod(cache.type,"haiagaruNativeCachedImageStream",stream.parameters,stream.returnType,
        stream.accessFlags,stream.annotations,stream.hiddenApiRestrictions,stream.implementation))
    cache.methods.remove(stream);cache.methods.add(nativeStream)
    val dispatch=if(stream.accessFlags and 0x2!=0)"invoke-direct" else "invoke-virtual"
    cache.methods.add(MutableMethod(ImmutableMethod(cache.type,stream.name,stream.parameters,stream.returnType,stream.accessFlags,
        stream.annotations,stream.hiddenApiRestrictions,ImmutableMethodImplementation(3,emptyList(),emptyList(),emptyList()))).apply{
        addInstructions(0,"""
            $dispatch {p0, p1}, $nativeStream
            move-result-object v0
            invoke-static {p1}, Lapp/morphe/extension/chmate/LocalImageArchive;->observe(Ljava/lang/String;)V
            return-object v0
        """.trimIndent())
    })
    val infoType = mutableClassDefBy(info.returnType)
    listOf(config[6], config[7], config[8]).forEach { name ->
        check(infoType.fields.single { it.name == name }.type == "I")
    }
    check(cache.methods.count { it.returnType == "Z" && it.parameterTypes ==
        listOf("Ljava/lang/String;", "I", "I", "Z", "Z", "Z", "Z", info.returnType) } == 1)

    val worker = mutableClassDefBy("Ljp/syoboi/a2chMate/autocheck/AutoCheckWork;")
    val expected = when (version) {
        "0.8.10.191 dev" -> "Lo/o1b;->a"
        "0.8.10.226 dev" -> "Lo/setLoop;->b"
        else -> "Lo/createFailedResult;->e"
    }
    var count = 0
    worker.methods.forEach { method ->
        method.implementation?.instructions?.toList()?.forEachIndexed { index, instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
            if ("${ref.definingClass}->${ref.name}" != expected) return@forEachIndexed
            check(ref.returnType.startsWith("Lo/"))
            val result = mutableClassDefBy(ref.returnType)
            val list = result.fields.single { it.name == config[0] }
            check(mutableClassDefBy(list.type).superclass == "Ljava/util/ArrayList;")
            check(mutableClassDefBy(list.type).fields.any { it.name == "title" && it.type == "Ljava/lang/String;" })
            val owner = mutableClassDefBy(ref.definingClass)
            val original = owner.methods.single { it.name == ref.name && it.parameterTypes == ref.parameterTypes }
            val words = ref.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
            val board = ref.parameterTypes.takeWhile { it != "Ljp/syoboi/a2chMate/client/BBSUrlInfo;" }
                .sumOf { if (it == "J" || it == "D") 2 else 1 }
            check(board < words)
            val wrapper = MutableMethod(ImmutableMethod(owner.type, "haiagaruPatrolImages", original.parameters,
                original.returnType, 0x9, emptySet(), emptySet(),
                ImmutableMethodImplementation(words + 2, emptyList(), emptyList(), emptyList())))
            wrapper.addInstructions(0, """
                invoke-static/range {p0 .. p${words - 1}}, $ref
                move-result-object v0
                move-object/from16 v1, p$board
                invoke-static {v0, v1}, $PATROL_IMAGES->onThread(Ljava/lang/Object;Ljava/lang/Object;)V
                return-object v0
            """.trimIndent())
            owner.methods.add(wrapper)
            val target = "${owner.type}->haiagaruPatrolImages(${ref.parameterTypes.joinToString("")})${ref.returnType}"
            method.replaceInstruction(index, when (instruction) {
                is RegisterRangeInstruction -> "invoke-static/range {v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1}}, $target"
                is FiveRegisterInstruction -> {
                    val registers = listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                        instruction.registerF, instruction.registerG).take(instruction.registerCount)
                    "invoke-static {${registers.joinToString(", ") { "v$it" }}}, $target"
                }
                else -> error("Unknown patrol invocation")
            })
            // Startup, manual and periodic patrols share checkWithDownload. The native
            // boolean may be false even with image saving enabled. Change only this
            // invocation's argument; never persist or alter ChMate's download preference.
            check(method.parameterTypes.size == 3 && method.parameterTypes.last() == "Z"
                && method.accessFlags and 8 == 0) { "Patrol download flag changed: $version" }
            method.addInstructions(0, """
                invoke-static/range {p3 .. p3}, $PATROL_IMAGES->needsDat(Z)Z
                move-result p3
            """.trimIndent())
            count++
        }
    }
    check(count == 1) { "Patrol DAT binding mismatch: $version ($count)" }
    val extension = mutableClassDefBy(PATROL_IMAGES)
    val old = extension.methods.single { it.name == "bindings" }
    extension.methods.remove(old)
    extension.methods.add(MutableMethod(ImmutableMethod(old.definingClass, old.name, old.parameters,
        old.returnType, old.accessFlags, old.annotations, old.hiddenApiRestrictions,
        ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList()))).apply {
        addInstructions(0, "const-string v0, \"${config.joinToString(";")}\"\nreturn-object v0")
    })
    println("Patrol image downloads: $version, native DAT/cache bindings validated")
}
