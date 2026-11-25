package org.ungoogled.patches.maps.ui.speed

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.ungoogled.patches.maps.ui.sharedExtensionPatch
import org.ungoogled.patches.shared.addInstructionsAtLabel

/** org.ungoogled.ui.IncidentPins, the extension half. */
private const val INCIDENT_PINS = "Lorg/ungoogled/ui/IncidentPins;"
private const val OBJECT = "Ljava/lang/Object;"
private const val LIST = "Ljava/util/List;"
private const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
private const val STRING = "Ljava/lang/String;"

/** The handler of Maps' incident report callout event (26.44.06: bmti). */
internal const val INCIDENT_CALLOUT_HANDLER = "AddIncidentReportCalloutEvent must have either an iconUrl or a drawable."

/** Google's incident types our kinds map to (IncidentPins.TYPES); each must still exist. */
internal val INCIDENT_TYPES = listOf(
    "MOBILE_SPEED_CAMERA", "SPEED_CAMERA", "SPEED_CAMERA_ZONE", "JAM", "CONSTRUCTION",
    "POLICE_PRESENCE", "ROAD_CLOSURE", "LANE_CLOSURE", "OBJECT_ON_ROAD",
)

/**
 * The warning pins during navigation, as Google's own incident callouts (IncidentPins): Maps' incident
 * report callout event, drawn by every subscribed owner (phone and car) at its position with its icon.
 */
internal val incidentCalloutsPatch = bytecodePatch(
    description = "Shows the warning icons during navigation as Google's own incident callouts.",
) {
    dependsOn(sharedExtensionPatch)
    execute { incidentCallouts() }
}

/** What the patch found; every role must resolve exactly once or the patch fails, naming it. */
internal class IncidentCalloutAnchors(
    val handler: String, val handle: String,
    val owner: String, val host: FieldReference, val calloutList: FieldReference,
    val event: String, val concrete: String, val concreteParameters: List<String>,
    val point: String, val pointOf: String, val latLng: String, val type: String,
    val bus: String, val busField: FieldReference, val post: String, val busEvent: String,
    val callout: String, val destroy: String,
    val clearAll: String, val start: String, val stop: String,
)

private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference
private fun params(m: Method) = m.parameterTypes.map(CharSequence::toString)
private fun Method.code() = implementation?.instructions?.toList().orEmpty()
private fun publicFlags(flags: Int) = flags and (AccessFlags.PRIVATE.value or AccessFlags.PROTECTED.value).inv() or AccessFlags.PUBLIC.value

internal fun BytecodePatchContext.resolveIncidentCallouts(): IncidentCalloutAnchors {
    val handlers = mutableListOf<Pair<String, String>>()
    classDefForEach { c ->
        for (m in c.methods) if (m.code().any { (it.ref() as? StringReference)?.string == INCIDENT_CALLOUT_HANDLER }) handlers += c.type to m.name
    }
    val (handlerType, handleName) = handlers.singleOrNull() ?: throw PatchException("expected one incident callout handler, found $handlers")
    val handler = classDefBy(handlerType)
    val handle = handler.methods.single { it.name == handleName && params(it).size == 1 && it.returnType == "V" }
    val code = handle.code()

    // Its host (the owner) is the first field read cast to a class; the event is the parameter's cast.
    val hostIndex = code.indexOfFirst { it.opcode == Opcode.IGET_OBJECT }
    val host = code.getOrNull(hostIndex)?.ref() as? FieldReference ?: throw PatchException("$handlerType reads no host")
    val ownerType = (code.getOrNull(hostIndex + 1)?.takeIf { it.opcode == Opcode.CHECK_CAST }?.ref() as? TypeReference)?.type
        ?: throw PatchException("$handlerType does not cast its host")
    val eventType = code.filter { it.opcode == Opcode.CHECK_CAST }.map { (it.ref() as TypeReference).type }.drop(1).firstOrNull()
        ?: throw PatchException("$handlerType does not cast its event")
    val eventClass = classDefBy(eventType)
    if (!AccessFlags.ABSTRACT.isSet(eventClass.accessFlags)) throw PatchException("$eventType is no longer the abstract event")
    val busEvent = eventClass.interfaces.singleOrNull() ?: throw PatchException("$eventType implements ${eventClass.interfaces}")
    val concretes = mutableListOf<String>()
    classDefForEach { c -> if (c.superclass == eventType && !AccessFlags.ABSTRACT.isSet(c.accessFlags)) concretes += c.type }
    val concreteType = concretes.singleOrNull() ?: throw PatchException("expected one $eventType, found $concretes")
    val concrete = classDefBy(concreteType)
    val init = concrete.methods.filter { it.name == "<init>" }.singleOrNull() ?: throw PatchException("$concreteType has no single constructor")
    val cp = params(init)
    fun isEnum(type: String) = classDefByOrNull(type)?.superclass == "Ljava/lang/Enum;"
    if (cp.size != 5 || cp.count { it == DRAWABLE } != 1 || cp.count { it == STRING } != 1 || cp.count(::isEnum) != 1) {
        throw PatchException("$concreteType's constructor changed shape: $cp")
    }
    val typeEnum = cp.single(::isEnum)
    val rest = cp.filter { it != DRAWABLE && it != STRING && it != typeEnum }
    // The position: the class with a static (LatLng) converter, where LatLng has (lat, lng).
    class Point(val type: String, val of: String, val latLng: String)
    val points = rest.mapNotNull { t ->
        classDefByOrNull(t)?.methods?.filter { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == t && params(m).size == 1 &&
                classDefByOrNull(params(m)[0])?.methods?.any { it.name == "<init>" && params(it) == listOf("D", "D") } == true
        }?.singleOrNull()?.let { Point(t, it.name, params(it)[0]) }
    }
    val point = points.singleOrNull() ?: throw PatchException("$concreteType's position type is not clear: $rest")
    val typeNames = classDefBy(typeEnum).methods.single { it.name == "<clinit>" }.code()
        .mapNotNull { (it.ref() as? StringReference)?.string }.toSet()
    INCIDENT_TYPES.filter { it !in typeNames }.takeIf { it.isNotEmpty() }?.let { throw PatchException("$typeEnum lacks $it") }

    // The legend-sprite flag: the boolean read whose branch calls the static (type, Z, Z) sprite mapper.
    val flags = code.indices.filter { i ->
        code[i].opcode == Opcode.IGET_BOOLEAN && (i + 1 until minOf(code.size, i + 10)).any { j ->
            (code[j].ref() as? MethodReference)?.let { r ->
                code[j].opcode == Opcode.INVOKE_STATIC && r.parameterTypes.map(CharSequence::toString) == listOf(typeEnum, "Z", "Z")
            } == true
        }
    }
    if (flags.size != 1) throw PatchException("$handlerType's legend flag is not clear: $flags")

    // Its end: the callout added to the owner's list, then shown, then return.
    val adds = code.indices.filter { i ->
        val r = code[i].ref() as? MethodReference
        code[i].opcode == Opcode.INVOKE_INTERFACE && r?.definingClass == LIST && r.name == "add"
    }
    val add = adds.singleOrNull() ?: throw PatchException("$handlerType adds ${adds.size} callouts")
    val list = (add - 1 downTo 0).map { code[it] }.firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.ref() as? FieldReference
    if (list == null || list.definingClass != ownerType || list.type != LIST) throw PatchException("$handlerType's callout list is not $ownerType's")
    val shown = code.getOrNull(add + 1)?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL && params0(it) }
        ?: throw PatchException("$handlerType no longer shows the callout after adding it")
    if (code.getOrNull(add + 2)?.opcode != Opcode.RETURN_VOID) throw PatchException("$handlerType does more after showing the callout")
    val calloutType = (shown.ref() as MethodReference).definingClass

    // The owner: clear-all destroys every callout of its list; start creates the handler; stop clears.
    val owner = classDefBy(ownerType)
    fun calls(m: Method) = m.code().mapNotNull { it.ref() as? MethodReference }
    val clearAll = owner.methods.filter { m ->
        m.returnType == "V" && m.parameterTypes.isEmpty() && calls(m).any { it.definingClass == LIST && it.name == "clear" } &&
            calls(m).any { it.definingClass == calloutType && it.returnType == "V" && it.parameterTypes.isEmpty() }
    }.singleOrNull() ?: throw PatchException("$ownerType has no single clear-all")
    val destroy = calls(clearAll).filter { it.definingClass == calloutType && it.returnType == "V" && it.parameterTypes.isEmpty() }
        .map { it.name }.distinct().singleOrNull() ?: throw PatchException("$ownerType's clear-all destroys unclearly")
    val start = owner.methods.filter { m ->
        m.returnType == "V" && m.parameterTypes.isEmpty() && m.code().any { it.opcode == Opcode.NEW_INSTANCE && (it.ref() as TypeReference).type == handlerType }
    }.singleOrNull() ?: throw PatchException("$ownerType has no single start")
    val stop = owner.methods.filter { m ->
        m.name != clearAll.name && m.returnType == "V" && m.parameterTypes.isEmpty() &&
            calls(m).any { it.definingClass == ownerType && it.name == clearAll.name && it.parameterTypes.isEmpty() }
    }.singleOrNull() ?: throw PatchException("$ownerType has no single stop")
    // The bus: the owner's field start subscribes on, and its (event)V post.
    val startCode = start.code()
    val subscribe = startCode.indices.lastOrNull { i ->
        (startCode[i].ref() as? MethodReference)?.let { r -> r.parameterTypes.size == 2 && r.parameterTypes[0] == OBJECT && r.returnType == "V" } == true
    } ?: throw PatchException("$ownerType's start subscribes nowhere")
    val busType = (startCode[subscribe].ref() as MethodReference).definingClass
    val busField = (subscribe - 1 downTo 0).map { startCode[it] }.firstOrNull { it.opcode == Opcode.IGET_OBJECT }?.ref() as? FieldReference
    if (busField == null || busField.type != busType || busField.definingClass != ownerType) throw PatchException("$ownerType's bus is not clear")
    // Its post: the (event)V method Maps' own report flow posts a new event with.
    val posts = mutableSetOf<String>()
    classDefForEach { c ->
        for (m in c.methods) {
            val body = m.code()
            for (i in body.indices) {
                val r = body[i].ref() as? MethodReference ?: continue
                if (body[i].opcode != Opcode.INVOKE_VIRTUAL || r.definingClass != busType || r.parameterTypes.map(CharSequence::toString) != listOf(busEvent)) continue
                val made = (maxOf(0, i - 12) until i).any { j ->
                    (body[j].opcode == Opcode.INVOKE_DIRECT || body[j].opcode == Opcode.INVOKE_DIRECT_RANGE) && (body[j].ref() as? MethodReference)?.let { it.definingClass == concreteType && it.name == "<init>" } == true
                }
                if (made) posts += r.name
            }
        }
    }
    val post = posts.singleOrNull()?.let { name -> classDefBy(busType).methods.single { it.name == name && params(it) == listOf(busEvent) } }
        ?: throw PatchException("Maps posts $concreteType with $posts")

    return IncidentCalloutAnchors(
        handlerType, handleName, ownerType, host, list, eventType, concreteType, cp,
        point.type, point.of, point.latLng, typeEnum, busType, busField, post.name, busEvent,
        calloutType, destroy, clearAll.name, start.name, stop.name,
    )
}

private fun params0(insn: Instruction) = (insn.ref() as? MethodReference)?.parameterTypes?.isEmpty() == true

private fun BytecodePatchContext.incidentCallouts() {
    val a = resolveIncidentCallouts()

    // Everything the extension's rewritten methods use must be reachable from org.ungoogled.ui.
    fun open(type: String) = mutableClassDefBy(type).also { it.accessFlags = publicFlags(it.accessFlags) }
    open(a.concrete).methods.filter { it.name == "<init>" }.forEach { it.accessFlags = publicFlags(it.accessFlags) }
    open(a.point).methods.filter { it.name == a.pointOf && AccessFlags.STATIC.isSet(it.accessFlags) && params(it) == listOf(a.latLng) }
        .forEach { it.accessFlags = publicFlags(it.accessFlags) }
    open(a.latLng).methods.filter { it.name == "<init>" && params(it) == listOf("D", "D") }.forEach { it.accessFlags = publicFlags(it.accessFlags) }
    open(a.type)
    open(a.bus).methods.filter { it.name == a.post && params(it) == listOf(a.busEvent) }.forEach { it.accessFlags = publicFlags(it.accessFlags) }
    open(a.callout).methods.filter { it.name == a.destroy && it.parameterTypes.isEmpty() }.forEach { it.accessFlags = publicFlags(it.accessFlags) }
    open(a.owner).fields.filter { it.name == a.calloutList.name && it.type == LIST }.forEach { it.accessFlags = publicFlags(it.accessFlags) }

    // 1. The legend flag: unchanged for Google's reports, false for ours (their bitmap is drawn).
    val handler = mutableClassDefBy(a.handler)
    val handle = handler.methods.single { it.name == a.handle && params(it).size == 1 && it.returnType == "V" }
    var code = handle.implementation!!.instructions.toList()
    val flagIndex = code.indices.single { i ->
        code[i].opcode == Opcode.IGET_BOOLEAN && (i + 1 until minOf(code.size, i + 10)).any { j ->
            code[j].opcode == Opcode.INVOKE_STATIC && (code[j].ref() as? MethodReference)?.parameterTypes?.map(CharSequence::toString) == listOf(a.type, "Z", "Z")
        }
    }
    val flag = (code[flagIndex] as OneRegisterInstruction).registerA
    handle.addInstructionsWithLabels(
        flagIndex + 1,
        """
            if-eqz v$flag, :google
            invoke-static/range { p1 .. p1 }, $INCIDENT_PINS->ours(Ljava/lang/Object;)Z
            move-result v$flag
            xor-int/lit8 v$flag, v$flag, 0x1
            :google
            nop
        """,
    )

    // 2. After the callout is added and shown: hand it over. Inserted in front of the final return, which
    //    the early exits jump to directly, so only a drawn callout gets here. By then the handler has reused
    //    p1's register for a boolean (acc28: ART rejected `move-object v1, p1` there), so the event and the
    //    owner are recorded at the method's entry, while p0 and p1 still hold them, and the end passes only
    //    the callout.
    code = handle.implementation!!.instructions.toList()
    val addIndex = code.indices.single { i ->
        code[i].opcode == Opcode.INVOKE_INTERFACE && (code[i].ref() as? MethodReference)?.let { it.definingClass == LIST && it.name == "add" } == true
    }
    val callout = (code[addIndex + 1] as Instruction35c).registerC
    if (callout > 15) throw PatchException("${a.handler}'s callout register is out of range")
    if (code[addIndex + 2].opcode != Opcode.RETURN_VOID) throw PatchException("${a.handler} changed after the callout")
    val handleCode = handle.implementation!!
    if (handleCode.registerCount - 2 < 1) throw PatchException("${a.handler} has no local for the hand-over")
    handle.addInstructions(
        addIndex + 2,
        "invoke-static { v$callout }, $INCIDENT_PINS->handed($OBJECT)V",
    )
    handle.addInstructions(
        0,
        """
            invoke-static/range { p1 .. p1 }, $INCIDENT_PINS->handling($OBJECT)V
            move-object/from16 v0, p0
            iget-object v0, v0, ${a.host.definingClass}->${a.host.name}:${a.host.type}
            invoke-static { v0 }, $INCIDENT_PINS->handlingOwner($OBJECT)V
        """,
    )

    // 3. The owner's start (with its bus), clear-all and stop.
    val ownerClass = mutableClassDefBy(a.owner)
    fun ownerMethod(name: String) = ownerClass.methods.single { it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" }
    ownerMethod(a.clearAll).addInstructions(0, "invoke-static { p0 }, $INCIDENT_PINS->cleared($OBJECT)V")
    ownerMethod(a.stop).addInstructions(0, "invoke-static { p0 }, $INCIDENT_PINS->stop($OBJECT)V")
    val start = ownerMethod(a.start)
    val startCode = start.implementation!!
    if (startCode.registerCount - 1 < 1 || startCode.registerCount - 1 > 15) throw PatchException("${a.owner}'s start has no room for the hand-over")
    val returns = startCode.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
    for (index in returns.reversed()) {
        start.addInstructionsAtLabel(
            index,
            """
                iget-object v0, p0, ${a.busField.definingClass}->${a.busField.name}:${a.busField.type}
                invoke-static { p0, v0 }, $INCIDENT_PINS->start($OBJECT$OBJECT)V
            """,
        )
    }

    // 4. The extension's posts and removals.
    val extension = mutableClassDefBy(INCIDENT_PINS)
    fun replace(name: String, parameters: List<String>, returnType: String, registers: Int, smali: String) {
        extension.methods.remove(extension.methods.singleOrNull { it.name == name } ?: throw PatchException("$INCIDENT_PINS->$name not found"))
        extension.methods.add(
            ImmutableMethod(
                INCIDENT_PINS, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType,
                AccessFlags.STATIC.value, null, null, MutableMethodImplementation(registers),
            ).toMutable().apply { addInstructions(0, smali) },
        )
    }
    // uaEvent(icon, lat, lng, type): new event(position, no icon URL, icon, no text, type), not posted yet.
    // The bus calls the handler synchronously, and the handler asks ours(event) and hands the callout over
    // while the post runs (acc30). IncidentPins records the event between uaEvent and uaSend.
    // Locals v0 (event), v1..v5 (its arguments in constructor order), v6..v10 (LatLng scratch).
    val arguments = a.concreteParameters.mapIndexed { i, t ->
        val r = "v${i + 1}"
        when (t) {
            a.point -> "move-object $r, v10"
            DRAWABLE -> "move-object/from16 $r, p0"
            a.type -> """
                const-class $r, ${a.type}
                move-object/from16 v6, p5
                invoke-static { $r, v6 }, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;$STRING)Ljava/lang/Enum;
                move-result-object $r
                check-cast $r, ${a.type}
            """.trimIndent()
            else -> "const/4 $r, 0x0"
        }
    }.joinToString("\n")
    replace(
        "uaEvent", listOf(DRAWABLE, "D", "D", STRING), OBJECT, 17,
        """
            move-wide/from16 v6, p1
            move-wide/from16 v8, p3
            new-instance v10, ${a.latLng}
            invoke-direct { v10, v6, v7, v8, v9 }, ${a.latLng}-><init>(DD)V
            invoke-static { v10 }, ${a.point}->${a.pointOf}(${a.latLng})${a.point}
            move-result-object v10
            $arguments
            new-instance v0, ${a.concrete}
            invoke-direct/range { v0 .. v5 }, ${a.concrete}-><init>(${a.concreteParameters.joinToString("")})V
            return-object v0
        """,
    )
    // uaSend(bus, event): the event posted on Maps' bus, as Maps' own report flow posts it.
    replace(
        "uaSend", listOf(OBJECT, OBJECT), "V", 2,
        """
            check-cast p0, ${a.bus}
            check-cast p1, ${a.busEvent}
            invoke-virtual { p0, p1 }, ${a.bus}->${a.post}(${a.busEvent})V
            return-void
        """,
    )
    // uaDrop(owner, callout): destroyed as the owner's clear-all does, and out of its list.
    replace(
        "uaDrop", listOf(OBJECT, OBJECT), "V", 3,
        """
            check-cast p1, ${a.callout}
            invoke-virtual { p1 }, ${a.callout}->${a.destroy}()V
            check-cast p0, ${a.owner}
            iget-object v0, p0, ${a.owner}->${a.calloutList.name}:$LIST
            invoke-interface { v0, p1 }, $LIST->remove($OBJECT)Z
            return-void
        """,
    )
}
