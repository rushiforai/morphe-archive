package app.morphe.patches.maps

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

/** Reflection ABI of Maps' original battery component; no pixels or car configuration are supplied. */
internal class NativeGuidanceRenderContract(
    val schema: String,
    val componentType: String,
    val modelType: String,
    val layoutBase: String,
    val markerType: String,
)

private const val RENDER_STRING = "Ljava/lang/String;"
private const val RENDER_TEXT = "Ljava/lang/CharSequence;"
private fun String.renderName() = removePrefix("L").removeSuffix(";").replace('/', '.')
private fun Instruction.renderCall() = getReference<MethodReference>()
private fun Instruction.renderField() = getReference<FieldReference>()
private fun Method.renderCode() = implementation?.instructions?.toList()
    ?: throw PatchException("Missing original battery renderer code: $this")
private fun renderGuard(ok: Boolean, note: String, subject: Any) {
    if (!ok) throw PatchException("Unrecognized original battery renderer: $note in $subject")
}
private fun List<Instruction>.renderTarget(index: Int): Int {
    val offset = (get(index) as? OffsetInstruction)?.codeOffset
        ?: throw PatchException("Missing original battery branch at $index")
    val target = take(index).sumOf { it.codeUnits } + offset
    var cursor = 0
    return indices.singleOrNull { val found = cursor == target; cursor += get(it).codeUnits; found }
        ?: throw PatchException("Invalid original battery branch at $index")
}

/** Follow the original DTO -> immutable viewmodel -> callback -> component value flow. */
internal fun BytecodePatchContext.resolveNativeGuidanceRender(arrivalType: String, displayField: FieldReference): NativeGuidanceRenderContract {
    val classes = mutableListOf<ClassDef>()
    classDefForEach { classes.add(it) }
    fun <T> unique(items: List<T>, purpose: String): T = items.singleOrNull()
        ?: throw PatchException("Expected unique original battery $purpose, found ${items.size}: $items")
    fun declaration(ref: MethodReference): Method = unique(classDefBy(ref.definingClass).methods.filter {
        it.name == ref.name && it.parameterTypes == ref.parameterTypes && it.returnType == ref.returnType
    }, "method $ref")
    fun publicClass(type: String): ClassDef = classDefBy(type).also {
        renderGuard(AccessFlags.PUBLIC.isSet(it.accessFlags), "public reflected class", type)
    }
    fun publicMethod(ref: MethodReference, static: Boolean = false): Method = declaration(ref).also {
        publicClass(ref.definingClass)
        renderGuard(AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static,
            "public reflected method with expected dispatch", ref)
    }
    fun publicField(ref: FieldReference, static: Boolean = false, final: Boolean = true): Field =
        unique(publicClass(ref.definingClass).fields.filter { it.name == ref.name && it.type == ref.type }, "field $ref").also {
            renderGuard(AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) == static &&
                (!final || AccessFlags.FINAL.isSet(it.accessFlags)), "public reflected field with expected mutability", ref)
        }
    fun noArgConstructor(type: String): Method = unique(publicClass(type).methods.filter {
        it.name == "<init>" && it.parameterTypes.isEmpty() && it.returnType == "V"
    }, "default constructor $type").also { publicMethod(it) }
    fun labelled(type: String, label: String): FieldReference {
        val method = unique(classDefBy(type).methods.filter { it.name == "toString" &&
            it.parameterTypes.isEmpty() && it.returnType == RENDER_STRING }, "labelled DTO $type")
        val code = method.renderCode()
        val at = unique(code.indices.filter { code[it].getReference<StringReference>()?.string == label }, "label $label")
        val labelReg = (code[at] as OneRegisterInstruction).registerA
        val before = code.getOrNull(at + 1) ?: throw PatchException("Missing label consumer $label in $type")
        val read = code.getOrNull(at + 2) ?: throw PatchException("Missing label read $label in $type")
        val after = code.getOrNull(at + 3) ?: throw PatchException("Missing label value consumer $label in $type")
        val field = read.renderField() ?: throw PatchException("Missing labelled field $label in $type")
        renderGuard(before.renderCall()?.let { it.definingClass == "Ljava/lang/StringBuilder;" &&
            (it.name == "append" || (at == 1 && it.name == "<init>" && it.parameterTypes == listOf(RENDER_STRING))) } == true &&
            before.invokeRegisters()?.last() == labelReg &&
            read.opcode in setOf(Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN) && field.definingClass == type &&
            (read as TwoRegisterInstruction).registerB == method.implementation!!.registerCount - 1 &&
            after.renderCall()?.let { it.definingClass == "Ljava/lang/StringBuilder;" && it.name == "append" } == true &&
            after.invokeRegisters()?.last() == read.registerA, "labelled DTO field reaches its original formatter", method)
        publicField(field)
        return field
    }
    fun pureGetter(method: Method, field: FieldReference): Boolean {
        val code = method.implementation?.instructions?.toList() ?: return false
        return code.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT) &&
            code[0].renderField()?.toString() == field.toString() &&
            (code[0] as TwoRegisterInstruction).registerB == method.implementation!!.registerCount - 1 &&
            (code[0] as TwoRegisterInstruction).registerA == (code[1] as OneRegisterInstruction).registerA
    }

    val arrival = publicClass(arrivalType)
    renderGuard(AccessFlags.FINAL.isSet(arrival.accessFlags) &&
        toStringLabels(arrivalType).containsAll(listOf("BatteryOnArrival(batteryLevel=", ", isBatteryInaccurate=")),
        "inspected native arrival DTO", arrivalType)
    val warning = labelled(arrivalType, ", isBatteryInaccurate=")
    val accessibilityText = labelled(arrivalType, ", ved=")
    renderGuard(warning.type == "Z" && accessibilityText.type == RENDER_STRING, "native warning/accessibility types", arrivalType)

    val viewString = uniqueMapsHook(Fingerprint(name = "toString", parameters = emptyList(), returnType = RENDER_STRING,
        strings = listOf("BatteryOnArrivalInfo(icon=", ", percentText=", ", userEvent3Params=")), "original battery view DTO")!!
    val viewType = viewString.definingClass
    val view = publicClass(viewType)
    renderGuard(AccessFlags.FINAL.isSet(view.accessFlags), "immutable original view DTO", viewType)
    val iconField = labelled(viewType, "BatteryOnArrivalInfo(icon=")
    val textField = labelled(viewType, ", percentText=")
    val viewWarning = labelled(viewType, ", isInaccurate=")
    val stateField = labelled(viewType, ", state=")
    val accessibilityField = labelled(viewType, ", userEvent3Params=")
    val small = labelled(viewType, ", showSmallIcon=")
    val interpunct = labelled(viewType, ", displayPrecedingInterpunct=")
    val viewConstructor = unique(view.methods.filter { it.name == "<init>" && it.parameterTypes ==
        listOf(iconField.type, RENDER_TEXT, "Z", stateField.type, accessibilityField.type, "Z", "Z") }, "view DTO constructor")
    publicMethod(viewConstructor)
    renderGuard(textField.type == RENDER_TEXT && listOf(viewWarning, small, interpunct).all { it.type == "Z" },
        "original view DTO value types", viewType)
    val vc = viewConstructor.renderCode()
    renderGuard(vc.take(8).map { it.opcode } == listOf(Opcode.INVOKE_DIRECT,
        Opcode.IPUT_OBJECT, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN, Opcode.IPUT_OBJECT, Opcode.IPUT_OBJECT,
        Opcode.IPUT_BOOLEAN, Opcode.IPUT_BOOLEAN) &&
        vc.subList(1, 8).map { it.renderField().toString() } ==
            listOf(iconField, textField, viewWarning, stateField, accessibilityField, small, interpunct).map { it.toString() } &&
        viewConstructor.implementation!!.registerCount == 8 && (1..7).all { index ->
            (vc[index] as TwoRegisterInstruction).let { it.registerA == index && it.registerB == 0 }
        } && vc.drop(8).none { instruction -> instruction.opcode.name.startsWith("IPUT") &&
            instruction.renderField()?.toString() in listOf(iconField, textField, viewWarning, stateField,
                accessibilityField, small, interpunct).map { it.toString() } } &&
        vc.last().opcode == Opcode.RETURN_VOID, "original field initialization and themed state-color constructor", viewConstructor)

    val stateEnum = publicClass(stateField.type)
    renderGuard(stateEnum.superclass == "Ljava/lang/Enum;", "native state enum", stateField)
    val ec = unique(stateEnum.methods.filter { it.name == "<clinit>" }, "state enum initializer").renderCode()
    val missingLabel = unique(ec.indices.filter { ec[it].getReference<StringReference>()?.string == "NO_BATTERY_INFORMATION" }, "missing state name")
    val missingNameReg = (ec[missingLabel] as OneRegisterInstruction).registerA
    val enumConstruct = (missingLabel + 1 until ec.size).firstOrNull { ec[it].opcode == Opcode.INVOKE_DIRECT &&
        ec[it].renderCall()?.definingClass == "Ljava/lang/Enum;" && ec[it].invokeRegisters()?.getOrNull(1) == missingNameReg }
        ?: throw PatchException("Missing named battery-state constructor")
    val enumReg = ec[enumConstruct].invokeRegisters()!!.first()
    val missingEnum = (enumConstruct + 1 until ec.size).map { ec[it] }.firstOrNull {
        it.opcode == Opcode.SPUT_OBJECT && (it as OneRegisterInstruction).registerA == enumReg
    }?.renderField() ?: throw PatchException("Missing named battery-state field")
    publicField(missingEnum, static = true)
    renderGuard(missingEnum.definingClass == stateField.type && missingEnum.type == stateField.type,
        "NO_BATTERY_INFORMATION enum field", missingEnum)

    val originalConstructor = unique(classes.flatMap { it.methods.toList() }.filter { method ->
        method.name == "<init>" && method.parameterTypes.size == 2 && method.parameterTypes[1] == arrivalType &&
            method.implementation?.instructions?.any { it.renderCall()?.toString() == viewConstructor.toString() } == true
    }, "immutable original battery viewmodel constructor")
    val modelClass = publicClass(originalConstructor.definingClass)
    val modelApi = unique(modelClass.interfaces.toList(), "battery viewmodel API")
    val api = publicClass(modelApi)
    renderGuard(AccessFlags.INTERFACE.isSet(api.accessFlags) && api.methods.count() == 2,
        "two-method original component API", modelApi)
    val marker = unique(api.interfaces.toList(), "battery model marker")
    renderGuard(AccessFlags.INTERFACE.isSet(publicClass(marker).accessFlags), "public model marker", marker)
    val viewMethod = unique(api.methods.filter { it.parameterTypes.isEmpty() && it.returnType == viewType }, "view DTO method")
    val dimensionMethod = unique(api.methods.filter { it.parameterTypes.isEmpty() && it.returnType != viewType }, "dimension method")
    publicMethod(viewMethod); publicMethod(dimensionMethod)
    renderGuard(AccessFlags.INTERFACE.isSet(publicClass(dimensionMethod.returnType).accessFlags), "dimension interface", dimensionMethod)
    val viewStored = unique(modelClass.fields.filter { it.type == viewType }, "immutable view DTO field")
    publicField(viewStored)
    val modelView = unique(modelClass.methods.filter { it.name == viewMethod.name && it.parameterTypes.isEmpty() &&
        it.returnType == viewType }, "immutable view getter")
    renderGuard(pureGetter(modelView, viewStored), "original API returns its own immutable view DTO", modelView)
    val modelDimension = unique(modelClass.methods.filter { it.name == dimensionMethod.name && it.parameterTypes.isEmpty() &&
        it.returnType == dimensionMethod.returnType }, "immutable dimension getter")
    val dc = modelDimension.renderCode()
    renderGuard(dc.map { it.opcode } == listOf(Opcode.CONST_4, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) &&
        (dc[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        dc[1].invokeRegisters() == listOf((dc[0] as OneRegisterInstruction).registerA) &&
        (dc[2] as OneRegisterInstruction).registerA == (dc[3] as OneRegisterInstruction).registerA,
        "original zero dimension factory", modelDimension)
    val dimensionFactory = dc[1].renderCall()!!
    publicMethod(dimensionFactory, static = true)
    renderGuard(dimensionFactory.parameterTypes == listOf("I") &&
        dimensionMethod.returnType in publicClass(dimensionFactory.returnType).interfaces,
        "original dimension implementation", dimensionFactory)

    val oc = originalConstructor.renderCode()
    val dtoCalls = oc.mapNotNull { it.renderCall() }.filter { it.definingClass == arrivalType }
    val dtoText = unique(dtoCalls.filter { it.parameterTypes.isEmpty() && it.returnType == RENDER_STRING }, "localized native percent getter")
    val dtoMissing = unique(dtoCalls.filter { it.parameterTypes.isEmpty() && it.returnType == "Z" }, "native unsupported percentage getter")
    publicMethod(dtoText); publicMethod(dtoMissing)
    val textCode = declaration(dtoText).renderCode()
    renderGuard(textCode.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.IGET, Opcode.INVOKE_STATIC,
        Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT) && textCode[2].renderCall()?.let {
        it.parameterTypes == listOf("I") && it.returnType == RENDER_STRING } == true &&
        textCode[2].invokeRegisters() == listOf((textCode[1] as TwoRegisterInstruction).registerA) &&
        (textCode[3] as OneRegisterInstruction).registerA == (textCode[4] as OneRegisterInstruction).registerA,
        "localized original percent formatting from original calibrated field", dtoText)
    publicMethod(textCode[2].renderCall()!!, static = true)
    val dtoLevel = textCode[0].renderField()!!
    val dtoDisplay = textCode[1].renderField()!!
    renderGuard(dtoLevel.definingClass == arrivalType && dtoLevel.type == displayField.definingClass &&
        dtoDisplay.toString() == displayField.toString() && dtoDisplay.type == "I" &&
        (textCode[0] as TwoRegisterInstruction).registerB == declaration(dtoText).implementation!!.registerCount - 1 &&
        (textCode[1] as TwoRegisterInstruction).registerB == (textCode[0] as TwoRegisterInstruction).registerA,
        "icon level reads the exact calibrated integer used by the original percent formatter", dtoText)
    publicField(dtoLevel); publicField(dtoDisplay)
    val missingCode = declaration(dtoMissing).renderCode()
    // R8 may turn the true return into a goto to the shared false return (26.42).
    renderGuard(missingCode.exitOpcodes() == listOf(Opcode.IGET_OBJECT, Opcode.IGET, Opcode.CONST,
        Opcode.IF_LT, Opcode.CONST_16, Opcode.IF_GE, Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN) &&
        (missingCode[7].opcode == Opcode.RETURN ||
            missingCode.exitRegister(7) == (missingCode[6] as OneRegisterInstruction).registerA) &&
        missingCode[0].renderField().toString() == textCode[0].renderField().toString() &&
        missingCode[1].renderField().toString() == textCode[1].renderField().toString() &&
        (missingCode[2] as NarrowLiteralInstruction).narrowLiteral == -2147483647 &&
        (missingCode[4] as NarrowLiteralInstruction).narrowLiteral == -99 &&
        missingCode.renderTarget(3) == 8 && missingCode.renderTarget(5) == 8 &&
        (missingCode[6] as NarrowLiteralInstruction).narrowLiteral == 1 &&
        (missingCode[8] as NarrowLiteralInstruction).narrowLiteral == 0,
        "original unsupported-negative display predicate", dtoMissing)
    val dtoState = unique(oc.mapNotNull { it.renderField() }.filter { it.definingClass == arrivalType &&
        it.type == stateField.type }.distinctBy { it.toString() }, "original DTO state field")
    publicField(dtoState)
    renderGuard(oc.any { it.renderField().toString() == warning.toString() } &&
        oc.any { it.renderField().toString() == accessibilityText.toString() }, "original warning and accessibility inputs", originalConstructor)
    val iconFactory = unique(oc.mapNotNull { it.renderCall() }.filter {
        it.parameterTypes == listOf(arrivalType, "Z") && it.returnType == iconField.type }, "native battery icon factory")
    val warningFactory = unique(oc.mapNotNull { it.renderCall() }.filter {
        it.parameterTypes.isEmpty() && it.returnType == iconField.type }, "native warning icon factory")
    publicMethod(iconFactory, static = true); publicMethod(warningFactory, static = true)
    renderGuard(declaration(iconFactory).renderCode().any { it.renderField().toString() == warning.toString() } &&
        declaration(iconFactory).renderCode().none { it.opcode.name.startsWith("IPUT") || it.opcode.name.startsWith("SPUT") },
        "original icon factory reads native warning/state without changing DTO", iconFactory)

    val builderBuild = unique(oc.mapNotNull { it.renderCall() }.filter { it.parameterTypes.isEmpty() &&
        it.returnType == accessibilityField.type }, "original accessibility builder output")
    publicMethod(builderBuild)
    val builder = builderBuild.definingClass
    noArgConstructor(builder)
    val builderText = unique(oc.mapNotNull { it.renderCall() }.filter { it.definingClass == builder &&
        it.parameterTypes == listOf(RENDER_STRING, "Z") && it.returnType == "V" }, "original accessibility text setter")
    publicMethod(builderText)
    val semanticWriteIndex = unique(oc.indices.filter { oc[it].opcode == Opcode.IPUT_OBJECT &&
        oc[it].renderField()?.definingClass == builder }, "original semantic builder write")
    val semanticWrite = oc[semanticWriteIndex]
    val builderSemantic = semanticWrite.renderField()!!
    publicField(builderSemantic, final = false)
    val semanticReg = (semanticWrite as TwoRegisterInstruction).registerA
    val semanticRead = (semanticWriteIndex - 1 downTo 0).map { oc[it] }.firstOrNull { instruction ->
        instruction.opcode.setsRegister() && (instruction as? OneRegisterInstruction)?.registerA == semanticReg
    } ?: throw PatchException("Missing original battery semantic source")
    val semantic = semanticRead.renderField() ?: throw PatchException("Missing battery semantic constant")
    renderGuard(semanticRead.opcode == Opcode.SGET_OBJECT && semantic.type == builderSemantic.type,
        "original battery semantic constant reaches original builder", semantic)
    publicField(semantic, static = true)

    val emptyInitializer = unique(arrival.methods.filter { it.name == "<clinit>" }, "missing arrival initializer")
    val emptyCode = emptyInitializer.renderCode()
    val missingDto = unique(emptyCode.filter { it.opcode == Opcode.SPUT_OBJECT }.mapNotNull { it.renderField() }
        .filter { it.definingClass == arrivalType && it.type == arrivalType }, "original empty arrival DTO")
    publicField(missingDto, static = true)
    renderGuard(emptyCode.size == 8 && emptyCode.map { it.opcode } == listOf(Opcode.NEW_INSTANCE,
        Opcode.SGET_OBJECT, Opcode.CONST_4, Opcode.CONST_4, Opcode.CONST_STRING, Opcode.INVOKE_DIRECT,
        Opcode.SPUT_OBJECT, Opcode.RETURN_VOID) && emptyCode[5].renderCall()?.let {
        it.definingClass == arrivalType && it.name == "<init>" &&
            it.parameterTypes == listOf(textCode[0].renderField()!!.type, RENDER_STRING, "Z", "Ljava/lang/Integer;") } == true &&
        (emptyCode[2] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        (emptyCode[3] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        emptyCode[4].getReference<StringReference>()?.string == "" &&
        emptyCode[5].invokeRegisters()?.first() == (emptyCode[6] as OneRegisterInstruction).registerA,
        "original canonical missing arrival instance", emptyInitializer)
    val arrivalConstructor = publicMethod(emptyCode[5].renderCall()!!)
    val ac = arrivalConstructor.renderCode()
    val emptyLevel = emptyCode[1].renderField()!!
    publicField(emptyLevel, static = true)
    renderGuard(ac.size == 29 && ac[1].renderField()?.type == emptyLevel.type &&
        ac[2].renderField().toString() == accessibilityText.toString() &&
        ac[3].renderField().toString() == warning.toString() &&
        ac[13].opcode == Opcode.SGET_OBJECT && ac[13].renderField().toString() == emptyLevel.toString() &&
        ac[14].opcode == Opcode.INVOKE_STATIC && ac[14].renderCall()?.let {
            it.parameterTypes == listOf("Ljava/lang/Object;", "Ljava/lang/Object;") && it.returnType == "Z" } == true &&
        ac[16].opcode == Opcode.IF_EQZ && ac[17].opcode == Opcode.SGET_OBJECT &&
        ac.renderTarget(16) == 19 && ac.renderTarget(18) == 27 &&
        ac[17].renderField().toString() == missingEnum.toString() &&
        ac[27].opcode == Opcode.IPUT_OBJECT && ac[27].renderField().toString() == dtoState.toString() &&
        (ac[17] as OneRegisterInstruction).registerA == (ac[27] as TwoRegisterInstruction).registerA &&
        ac.last().opcode == Opcode.RETURN_VOID,
        "canonical empty battery level becomes native NO_BATTERY_INFORMATION state", arrivalConstructor)
    val statePredicate = unique(view.methods.filter { method -> method.implementation != null && method.parameterTypes.isEmpty() &&
        method.returnType == "Z" && method.renderCode().any { it.renderField().toString() == missingEnum.toString() } }, "missing view state predicate")
    val sp = statePredicate.renderCode()
    renderGuard(sp.exitOpcodes() == listOf(Opcode.IGET_OBJECT, Opcode.SGET_OBJECT, Opcode.IF_NE,
        Opcode.CONST_4, Opcode.RETURN, Opcode.CONST_4, Opcode.RETURN) &&
        (sp[4].opcode == Opcode.RETURN || sp.exitRegister(4) == (sp[3] as OneRegisterInstruction).registerA) &&
        sp.first().renderField().toString() == stateField.toString() && sp.renderTarget(2) == 5 &&
        (sp[3] as NarrowLiteralInstruction).narrowLiteral == 1 && (sp[5] as NarrowLiteralInstruction).narrowLiteral == 0,
        "missing view predicate uses original native state", statePredicate)

    // Resolve the component through its own callback API and actual original Android child classes.
    val callbackTypes = classes.filter { cls -> cls.methods.any { method ->
        method.implementation?.instructions?.any { it.renderCall()?.toString() == viewMethod.toString() } == true
    } }.map { it.type }.toSet()
    fun batteryModes(type: String, getter: MethodReference = viewMethod): Set<Int> = classDefBy(type).methods.flatMap { method ->
        val code = method.implementation?.instructions?.toList() ?: return@flatMap emptyList<Int>()
        val addresses = code.indices.map { code.take(it).sumOf { ins -> ins.codeUnits } }
        code.indices.filter { code[it].opcode in setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH) }.flatMap { switch ->
            val payload = code[code.renderTarget(switch)] as? SwitchPayload
                ?: throw PatchException("Missing original battery callback payload in $method")
            payload.switchElements.mapNotNull { element ->
                val start = addresses.indexOf(addresses[switch] + element.offset)
                if (start < 0 || code[start].opcode != Opcode.CHECK_CAST ||
                    code[start].getReference<TypeReference>()?.type != modelApi) return@mapNotNull null
                val end = (start until code.size).firstOrNull { code[it].opcode in setOf(Opcode.RETURN_OBJECT, Opcode.RETURN) }
                    ?: throw PatchException("Missing original battery callback return in $method")
                if (code.subList(start, end).any { it.renderCall()?.toString() == getter.toString() }) element.key else null
            }
        }
    }.toSet()
    val selectedModes = callbackTypes.associateWith { batteryModes(it) }.filterValues { it.isNotEmpty() }
    fun selectedBatteryCallbacks(method: Method): Set<String> {
        val code = method.renderCode()
        // The original component is a straight-line declarative builder; do not resolve constants across a branch.
        if (code.any { it is OffsetInstruction }) return emptySet()
        return code.indices.mapNotNull { at ->
            val call = code[at].renderCall() ?: return@mapNotNull null
            if (call.definingClass !in selectedModes || call.name != "<init>" ||
                call.parameterTypes != listOf("I")) return@mapNotNull null
            val args = code[at].invokeRegisters() ?: return@mapNotNull null
            if (args.size != 2) return@mapNotNull null
            val writer = (at - 1 downTo 0).map { code[it] }.firstOrNull {
                it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == args[1]
            } ?: return@mapNotNull null
            val value = (writer as? NarrowLiteralInstruction)?.narrowLiteral ?: return@mapNotNull null
            if (value in selectedModes.getValue(call.definingClass)) call.definingClass else null
        }.toSet()
    }
    val renderers = classes.flatMap { it.methods.toList() }.filter { method -> method.parameterTypes.isEmpty() &&
        AccessFlags.PROTECTED.isSet(method.accessFlags) && method.implementation?.instructions?.let { instructions ->
            val code = instructions.toList()
            setOf("Landroid/widget/LinearLayout;", "Landroid/widget/ImageView;", "Landroid/widget/TextView;").all { child ->
                code.any { it.opcode == Opcode.CONST_CLASS && it.getReference<TypeReference>()?.type == child }
            } && selectedBatteryCallbacks(method).isNotEmpty()
        } == true }
    val renderer = unique(renderers, "original icon/text battery component")
    val component = publicClass(renderer.definingClass)
    renderGuard(AccessFlags.FINAL.isSet(component.accessFlags) && component.superclass != "Ljava/lang/Object;",
        "original framework component class", component.type)
    val constructor = noArgConstructor(component.type)
    val cc = constructor.renderCode()
    renderGuard(cc.map { it.opcode } == listOf(Opcode.SGET_OBJECT, Opcode.NEW_INSTANCE, Opcode.INVOKE_DIRECT,
        Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_DIRECT, Opcode.RETURN_VOID) &&
        cc[5].renderCall()?.let { it.definingClass == component.type && it.name == "<init>" && it.parameterTypes.size == 1 } == true &&
        (cc[4] as OneRegisterInstruction).registerA == cc[5].invokeRegisters()?.last(),
        "original component default style constructor", constructor)
    val callbacks = selectedBatteryCallbacks(renderer)
    val callbackReads = callbacks.flatMap { classDefBy(it).methods.toList() }.flatMap { method ->
        method.implementation?.instructions?.toList() ?: emptyList()
    }
    renderGuard(listOf(iconField, textField, accessibilityField).all { field ->
        callbackReads.any { it.renderField().toString() == field.toString() }
    } && callbackReads.any { it.renderCall()?.toString() == viewMethod.toString() },
        "original component bindings read native icon/text/accessibility through original API", renderer)

    // The reflected dimension controls only logical-start padding of the private native root.
    // Reject a later APK that repurposes this getter; no view or calculator hook is added.
    fun enumName(field: FieldReference): String? {
        val owner = classDefByOrNull(field.definingClass) ?: return null
        if (!AccessFlags.ENUM.isSet(owner.accessFlags)) return null
        val code = owner.methods.singleOrNull { it.name == "<clinit>" }?.renderCode()
            ?: return null
        val at = code.indices.singleOrNull { code[it].opcode == Opcode.SPUT_OBJECT &&
            code[it].renderField().toString() == field.toString() } ?: return null
        if (at < 4 || code[at - 4].opcode != Opcode.NEW_INSTANCE || code[at - 3].opcode != Opcode.CONST_STRING)
            return null
        val args = code[at - 1].invokeRegisters() ?: return null
        if (code[at - 1].renderCall()?.toString() != "Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V" ||
            args != listOf((code[at] as OneRegisterInstruction).registerA,
                (code[at - 3] as OneRegisterInstruction).registerA, (code[at - 2] as? OneRegisterInstruction)?.registerA) ||
            (code[at - 4] as OneRegisterInstruction).registerA != args[0]) return null
        return code[at - 3].getReference<StringReference>()?.string
    }
    val root = renderer.renderCode()
    val paddingAt = unique(root.indices.filter { at -> root[at].opcode == Opcode.SGET_OBJECT &&
        root[at].renderField()?.let { enumName(it) == "PADDING_START" } == true }, "native start-padding binding")
    renderGuard(paddingAt > 0 && paddingAt + 5 < root.size && root[paddingAt - 1].opcode == Opcode.SGET_OBJECT &&
        root[paddingAt + 2].opcode == Opcode.NEW_INSTANCE && root[paddingAt + 5].opcode == Opcode.APUT_OBJECT &&
        root.last().opcode == Opcode.RETURN_OBJECT, "native root padding property layout", renderer)
    val callback = root[paddingAt - 1].renderField()!!
    val bindArgs = root[paddingAt + 3].invokeRegisters()
    val array = root[paddingAt + 5] as ThreeRegisterInstruction
    val rootArgs = root[root.lastIndex - 1].invokeRegisters()
    renderGuard(bindArgs?.size == 4 && bindArgs[0] == array.registerA &&
        bindArgs[1] == (root[paddingAt] as OneRegisterInstruction).registerA &&
        bindArgs[2] == (root[paddingAt - 1] as OneRegisterInstruction).registerA &&
        root[root.lastIndex - 1].renderCall()?.let { it.name == "<init>" && it.parameterTypes.size == 2 &&
            it.parameterTypes.first() == "Ljava/lang/Class;" && it.parameterTypes.last().startsWith("[L") } == true &&
        rootArgs?.last() == array.registerB && rootArgs.first() == (root.last() as OneRegisterInstruction).registerA,
        "dimension callback binds padding on the returned root only", renderer)
    val init = unique(classDefBy(callback.definingClass).methods.filter { it.name == "<clinit>" },
        "native padding callback initializer").renderCode()
    val stored = unique(init.indices.filter { init[it].opcode == Opcode.SPUT_OBJECT &&
        init[it].renderField().toString() == callback.toString() }, "native padding callback singleton")
    renderGuard(stored >= 3 && init[stored - 3].opcode == Opcode.NEW_INSTANCE &&
        init[stored - 1].renderCall()?.parameterTypes == listOf("I") &&
        init[stored - 1].invokeRegisters() == listOf((init[stored] as OneRegisterInstruction).registerA,
            (init[stored - 2] as? OneRegisterInstruction)?.registerA) &&
        (init[stored - 2] as? NarrowLiteralInstruction)?.narrowLiteral in batteryModes(callback.type, dimensionMethod),
        "exact selected callback branch reads the original dimension getter", callback)
    val units = declaration(dimensionFactory).renderCode()
    renderGuard(units.map { it.opcode } == listOf(Opcode.CONST, Opcode.AND_INT_2ADDR, Opcode.SHL_INT_LIT8,
        Opcode.NEW_INSTANCE, Opcode.OR_INT_LIT8, Opcode.INVOKE_DIRECT, Opcode.RETURN_OBJECT) &&
        (units[0] as NarrowLiteralInstruction).narrowLiteral == 0xffffff &&
        (units[2] as NarrowLiteralInstruction).narrowLiteral == 8 &&
        (units[4] as NarrowLiteralInstruction).narrowLiteral == 1,
        "native dimension factory retains Android complex DIP encoding", dimensionFactory)

    val schema = listOf(
        listOf(component.type.renderName(), modelApi.renderName(), arrivalType.renderName(), dtoText.name, dtoMissing.name,
            warning.name, dtoState.name, accessibilityText.name, viewMethod.name, dimensionMethod.name,
            dtoLevel.name, dtoDisplay.name),
        listOf(viewType.renderName(), iconFactory.definingClass.renderName(), iconFactory.name,
            warningFactory.definingClass.renderName(), warningFactory.name, builder.renderName(),
            semantic.definingClass.renderName(), semantic.name, builderSemantic.name, builderText.name, builderBuild.name),
        listOf(dimensionFactory.definingClass.renderName(), dimensionFactory.name, missingDto.name),
    ).joinToString(";") { it.joinToString(",") }
    return NativeGuidanceRenderContract(schema, component.type, modelApi, component.superclass!!, marker)
}
