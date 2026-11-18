package io.github.sabopura.morphe.patches.twitch.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract

private const val APP = "Lio/github/sabopura/morphe/extension/twitch/app/AppHooks;"
private const val QUALITY = "Lio/github/sabopura/morphe/extension/twitch/app/VideoQuality;"
private const val LOGIN = "Lio/github/sabopura/morphe/extension/twitch/app/LoginFix;"
private const val LANDING = "Ltv/twitch/android/app/core/LandingActivity;"
private const val CORE_PLAYER = "Lcom/amazonaws/ivs/player/CorePlayerImpl;"

private fun Method.stringsUsed(): Set<String> =
    (implementation?.instructions ?: emptyList()).mapNotNullTo(mutableSetOf()) {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    }

/** The single method that uses every string in [anchors] and passes [filter]. */
internal fun BytecodePatchContext.methodWith(
    label: String,
    vararg anchors: String,
    filter: (Method) -> Boolean = { true },
): MutableMethod {
    val owners: List<ClassDef> = classesWithStrings(*anchors)
    val (owner, found) = owners.flatMap { owner ->
        owner.methods.filter { it.implementation != null && it.stringsUsed().containsAll(anchors.asList()) && filter(it) }
            .map { owner to it }
    }.uniqueContract(label)
    return mutableClassDefBy(owner).methods.first {
        it.name == found.name && it.returnType == found.returnType && it.parameterTypes.map { p -> p.toString() } ==
            found.parameterTypes.map { p -> p.toString() }
    }
}

internal fun MutableMethod.requireLocal(what: String, count: Int = 1) {
    val parameterWords = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 as Int } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    if (implementation!!.registerCount - parameterWords < count) throw PatchException("Twitch: $what has fewer than $count spare local registers")
}

/** Index of the instruction that loads string [value], the first one after [start]. */
private fun MutableMethod.indexOfString(value: String, start: Int = 0): Int =
    instructions.withIndex().indexOfFirst { (index, instruction) ->
        index >= start && ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == value
    }.also { if (it < 0) throw PatchException("Twitch: string \"$value\" not found") }

internal val updatePromptsHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        methodWith("in-app update result", "update.availability", "nonblocking.intent").apply {
            val moveResult = (indexOfString("update.availability") until instructions.size)
                .first { instructions[it].opcode == Opcode.MOVE_RESULT }
            val register = getInstruction<OneRegisterInstruction>(moveResult).registerA
            addInstructions(moveResult + 1, """
                invoke-static/range {v$register .. v$register}, $APP->updateAvailability(I)I
                move-result v$register
            """)
        }
    }
}

internal val stuckStartHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val landing = mutableClassDefBy(LANDING)
        val route = landing.methods.filter { "parse_launcher_intent" in it.stringsUsed() && it.parameterTypes.isEmpty() }
            .uniqueContract("start screen routing")
        route.apply {
            requireLocal("start screen routing")
            addInstructionsWithLabels(0, """
                invoke-static {p0}, $APP->firstRoute(Landroid/app/Activity;)Z
                move-result v0
                if-nez v0, :route
                return-void
            """, ExternalLabel("route", getInstruction(0)))
        }
        val create = landing.methods.single { it.name == "onCreate" && it.parameterTypes.size == 1 }
        create.requireLocal("start screen creation", 2)
        create.addInstructions(0, """
            move-object/from16 v0, p0
            const-string v1, "${route.name}"
            invoke-static {v0, v1}, $APP->watchStart(Landroid/app/Activity;Ljava/lang/String;)V
        """)
    }
}

internal val startupTabHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        methodWith("launch destination", "destinationOrdinal", "intent_router") {
            it.returnType == "V" && it.parameterTypes.size == 3 && it.parameterTypes[1].toString() == "Landroid/os/Bundle;"
        }.apply {
            val destination = parameterTypes[2].toString()
            addInstructions(0, """
                invoke-static/range {p3 .. p3}, $APP->startDestination(Ljava/lang/Enum;)Ljava/lang/Enum;
                move-result-object p3
                check-cast p3, $destination
            """)
        }
        // Only versions with a React Native Home have this builder.
        if (classDefByStrings("subfeedTab").isEmpty()) return@execute
        methodWith("feed initial props", "subfeedTab", "discovery-feed", "isFromDeeplink") {
            it.name == "build" && it.parameterTypes.size == 9 && it.parameterTypes[0].toString() == "Z"
        }.addInstructions(0, """
            invoke-static/range {p1 .. p4}, $APP->feedTab(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p4
        """)
    }
}

internal val backgroundAudioHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        methodWith("background audio setting", "background_audio_setting") {
            it.parameterTypes.isEmpty() && it.returnType.startsWith("L") && it.returnType != "Ljava/lang/String;"
        }.apply {
            val key = indexOfString("background_audio_setting")
            // Twitch's preference read (key, default): only the default argument changes.
            val read = instructions.drop(key).indexOfFirst { instruction ->
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                call?.returnType == "Ljava/lang/String;" && call.parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;")
            }.takeIf { it >= 0 }?.plus(key) ?: throw PatchException("Twitch: background audio read not found")
            val default = getInstruction<FiveRegisterInstruction>(read).registerE
            addInstructions(read, """
                invoke-static/range {v$default .. v$default}, $APP->backgroundAudioDefault(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$default
            """)
        }
    }
}

internal val officialStatsHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        // The flag behind Twitch's staff-only stats button; its name survives in the model's toString.
        val model = classesWithStrings("BottomPlayerOverlayViewModel(overlayStats=", ", isVideoDebugEnabled=")
            .uniqueContract("player overlay model")
        mutableClassDefBy(model).methods.filter {
            it.name == "<init>" && it.parameterTypes.lastOrNull()?.toString() == "Z"
        }.uniqueContract("player overlay constructor").addInstructions(0, """
            invoke-static/range {p5 .. p5}, $APP->statsEnabled(Z)Z
            move-result p5
        """)
    }
}

internal val normalLatencyHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val core = mutableClassDefBy(CORE_PLAYER)
        core.methods.single { it.name == "setLiveLowLatencyEnabled" && it.parameterTypes.singleOrNull()?.toString() == "Z" }
            .addInstructions(0, """
                invoke-static/range {p1 .. p1}, $APP->lowLatency(Z)Z
                move-result p1
            """)
        val sources = setOf("Lcom/amazonaws/ivs/player/MediaPlayer\$LoadOptions;", "Ljava/lang/String;", "Lcom/amazonaws/ivs/player/Source;")
        val loads = core.methods.filter {
            it.name in setOf("load", "loadClipManifest", "loadSource") && it.implementation != null &&
                it.parameterTypes.size in 1..2 && it.parameterTypes[0].toString() in sources
        }
        if (loads.none { it.name == "load" }) throw PatchException("Twitch: IVS load entry point missing")
        loads.forEach { it.addInstructions(0, "invoke-static/range {p0 .. p0}, $APP->beforeLoad(Ljava/lang/Object;)V") }
    }
}

internal val defaultQualityHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val constructor = methodWith("quality preferences", "should_video_auto_quality_downgrade", "last_used_video_quality", "auto") {
            AccessFlags.CONSTRUCTOR.isSet(it.accessFlags)
        }
        constructor.apply {
            val auto = indexOfString("auto")
            val register = getInstruction<OneRegisterInstruction>(auto).registerA
            // The fallback for restoring video after audio-only; saved values do not pass here.
            addInstructions(auto + 1, """
                invoke-static/range {v$register .. v$register}, $QUALITY->restoreDefault(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v$register
            """)
        }
        mutableClassDefBy(constructor.definingClass).methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Ljava/lang/String;") &&
                it.returnType == "Ljava/lang/String;" && "video_quality" in it.stringsUsed()
        }.uniqueContract("saved quality lookup").addInstructions(0, """
            invoke-static/range {p1 .. p2}, $QUALITY->savedDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object p2
        """.trimIndent())
        // Twitch retries the request by name once the qualities have loaded, through this method.
        val byName = classesWithStrings("auto").flatMap { owner ->
            owner.methods.filter { m ->
                m.returnType == "V" && m.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Z") &&
                    "auto" in m.stringsUsed() && m.implementation!!.instructions.count { i ->
                        val call = (i as? ReferenceInstruction)?.reference as? MethodReference
                        call?.definingClass == "Lcom/amazonaws/ivs/player/Player;" && call.name == "getQualities" ||
                            call?.definingClass == "Lcom/amazonaws/ivs/player/Quality;" && call.name == "getName"
                    } >= 2
            }.map { owner to it }
        }.uniqueContract("player quality selection by name")
        val selection = mutableClassDefBy(byName.first).methods.first {
            it.name == byName.second.name && it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", "Z")
        }
        selection.apply {
            val read = instructions.first() as OneRegisterInstruction
            if (instructions.first().opcode != Opcode.IGET_OBJECT) throw PatchException("Twitch: player quality selection changed")
            val ivs = read.registerA
            if (ivs > 15) throw PatchException("Twitch: player quality selection registers out of range")
            addInstructions(1, """
                invoke-static {p1, v$ivs}, $QUALITY->playerName(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/String;
                move-result-object p1
            """)
        }
    }
}

/** Twitch's two login screens parse the login page's result with the strict default JSON. */
internal val loginFixHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val knownFields = sortedSetOf<String>()
        classesWithStrings("login-success").forEach { owner ->
            val mutable = mutableClassDefBy(owner)
            mutable.methods.filter { "login-success" in it.stringsUsed() }.toList().forEach { method ->
                val handlers = method.instructions.withIndex().filter { (_, instruction) ->
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "login-success"
                }.map { it.index }
                handlers.asReversed().forEach { at ->
                    val code = method.instructions.toList()
                    val serializer = (at until code.size).firstOrNull { index ->
                        val call = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
                        call?.name == "serializer" && call.parameterTypes.isEmpty()
                    } ?: throw PatchException("Twitch: login result serializer not found")
                    val decode = (serializer until code.size).firstOrNull { index ->
                        val call = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
                        call != null && code[index].opcode == Opcode.INVOKE_VIRTUAL && call.returnType == "Ljava/lang/Object;" &&
                            call.parameterTypes.size == 2 && call.parameterTypes[1].toString() == "Ljava/lang/String;"
                    } ?: throw PatchException("Twitch: login result decode not found")
                    knownFields += loginResultFields((code[serializer] as ReferenceInstruction).reference as MethodReference)
                    val register = (code[decode] as FiveRegisterInstruction).registerE
                    method.addInstructions(decode, """
                        invoke-static/range {v$register .. v$register}, $LOGIN->knownOnly(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$register
                    """)
                }
            }
        }
        if (knownFields.size < 2) throw PatchException("Twitch: login result fields not found")
        replaceFirstString(LOGIN, "knownFields", knownFields.joinToString(","))
    }
}

/** The kotlinx serializer's class initializer names the class and then each field it reads. */
private fun BytecodePatchContext.loginResultFields(serializerGetter: MethodReference): List<String> {
    val getter = classDefBy(serializerGetter.definingClass).methods.first { it.name == serializerGetter.name }
    val serializerClass = getter.implementation!!.instructions.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference)?.definingClass
    }.firstOrNull() ?: throw PatchException("Twitch: login result serializer object not found")
    val strings = classDefBy(serializerClass).methods.first { it.name == "<clinit>" }.implementation!!.instructions
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.toList()
    if (strings.firstOrNull()?.endsWith("LoginPageResponse") != true)
        throw PatchException("Twitch: login result is now ${strings.firstOrNull()}")
    return strings.drop(1)
}

/** Writes [value] over the first string constant of the extension method [name]. */
internal fun BytecodePatchContext.replaceFirstString(definingClass: String, name: String, value: String) {
    mutableClassDefBy(definingClass).methods.single { it.name == name && it.parameterTypes.isEmpty() }.apply {
        val index = instructions.indexOfFirst { it.opcode == Opcode.CONST_STRING }
        if (index < 0) throw PatchException("Twitch: extension constant missing: $name")
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        replaceInstruction(index, "const-string v$register, \"$value\"")
    }
}
