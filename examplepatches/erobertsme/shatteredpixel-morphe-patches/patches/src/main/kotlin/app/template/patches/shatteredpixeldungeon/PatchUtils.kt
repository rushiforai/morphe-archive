package app.template.patches.shatteredpixeldungeon

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c

internal const val EXTENSION_PACKAGE = "Lapp/template/extension/shatteredpixeldungeon"

context(_: BytecodePatchContext)
internal fun Fingerprint.returnTrue() {
	method.addInstructions(
		0,
		"""
			const/4 v0, 0x1
			return v0
		""",
	)
}

/**
 * Makes a boolean method return true early when [check] returns true, otherwise runs the original code.
 * [check] is an extension method call whose arguments are given in [arguments].
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.returnTrueWhen(check: String, arguments: String = "") {
	skipWhen("invoke-static { $arguments }, $check")
}

/**
 * Runs [call], an extension method call, at the start of the method. When it returns true, or an object rather than null, the method
 * returns straight away without running its own code: with nothing for a void method, with [result] when given, or otherwise with the
 * call's own value. [register] holds the call's value and must be free at the start of the method.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.skipWhen(call: String, result: Boolean? = null, register: String = "v0") {
	val implementation = method.implementation ?: throw PatchException("${method.name} has no code")
	if (register == "v0") {
		val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
		val parameterRegisters = method.parameters.sumOf { if (it.type == "J" || it.type == "D") 2 else 1 } + if (isStatic) 0 else 1
		if (implementation.registerCount <= parameterRegisters) throw PatchException("${method.name} has no free register")
	}
	val returnsObject = call.substringAfterLast(')').let { it.startsWith("L") || it.startsWith("[") }
	val exit = when {
		method.returnType == "V" -> "return-void"
		result != null -> "const/4 $register, ${if (result) "0x1" else "0x0"}\n\t\t\treturn $register"
		returnsObject -> "return-object $register"
		else -> "return $register"
	}
	method.addInstructionsWithLabels(
		0,
		"""
			$call
			${if (returnsObject) "move-result-object" else "move-result"} $register
			if-eqz $register, :original
			$exit
		""",
		ExternalLabel("original", 0),
	)
}

/**
 * Runs [smali] before the method returns. The return instruction is replaced in place, so branches that jump
 * straight to it also run the new code.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.callBeforeReturn(smali: String) {
	val instructions = method.implementation!!.instructions
	val index = instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
	if (index < 0) throw PatchException("${method.name} has no return-void")
	method.replaceInstruction(index, smali)
	method.addInstruction(index + 1, "return-void")
}

/**
 * Runs [smali] before every return-void in the method.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.callBeforeEveryReturn(smali: String) {
	val instructions = method.implementation!!.instructions.toList()
	val indices = instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }.map { it.index }
	if (indices.isEmpty()) throw PatchException("${method.name} has no return-void")
	indices.reversed().forEach { index ->
		method.replaceInstruction(index, smali)
		method.addInstruction(index + 1, "return-void")
	}
}

/**
 * Passes the object the method belongs to, `this`, to [method], an extension method, before every return-void.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.callWithThisBeforeReturns(method: String) {
	callBeforeEveryReturn("invoke-static/range { p0 .. p0 }, $method")
}

/**
 * Passes every value the method returns through [adjust], a static method that takes the value
 * (plus [extraArguments]) and returns the new value. Only works for int and float returns.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.adjustReturns(adjust: String, extraArguments: String = "") {
	val instructions = method.implementation!!.instructions
	val indices = instructions.withIndex()
		.filter { it.value.opcode == Opcode.RETURN }
		.map { it.index }
	if (indices.isEmpty()) throw PatchException("${method.name} has no return")

	indices.reversed().forEach { index ->
		val register = (instructions[index] as OneRegisterInstruction).registerA
		if (register > 15) throw PatchException("${method.name} returns from v$register, which is out of range")
		val arguments = if (extraArguments.isEmpty()) "v$register" else "v$register, $extraArguments"
		method.replaceInstruction(index, "invoke-static { $arguments }, $adjust")
		method.addInstructions(
			index + 1,
			"""
				move-result v$register
				return v$register
			""",
		)
	}
}

/**
 * Passes every object the method returns through [adjust], a static method that takes the object and returns
 * the new one.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.adjustObjectReturns(adjust: String) {
	val instructions = method.implementation!!.instructions
	val indices = instructions.withIndex()
		.filter { it.value.opcode == Opcode.RETURN_OBJECT }
		.map { it.index }
	if (indices.isEmpty()) throw PatchException("${method.name} has no return-object")

	indices.reversed().forEach { index ->
		val register = (instructions[index] as OneRegisterInstruction).registerA
		if (register > 15) throw PatchException("${method.name} returns from v$register, which is out of range")
		method.replaceInstruction(index, "invoke-static { v$register }, $adjust")
		method.addInstructions(
			index + 1,
			"""
				move-result-object v$register
				return-object v$register
			""",
		)
	}
}

/**
 * Passes the result of every call to [called] in the method through [adjust], a static method that takes the result and returns the one
 * to use. Works for object, int and float results.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.adjustCallResults(called: String, adjust: String) {
	val instructions = method.implementation!!.instructions.toList()
	val indices = instructions.withIndex()
		.filter { (it.value as? ReferenceInstruction)?.reference?.toString() == called }
		.map { it.index + 1 }
		.filter { it < instructions.size && (instructions[it].opcode == Opcode.MOVE_RESULT_OBJECT || instructions[it].opcode == Opcode.MOVE_RESULT) }
	if (indices.isEmpty()) throw PatchException("${method.name} never calls $called")
	indices.reversed().forEach { index ->
		val register = (instructions[index] as OneRegisterInstruction).registerA
		val move = if (instructions[index].opcode == Opcode.MOVE_RESULT_OBJECT) "move-result-object" else "move-result"
		method.addInstructions(
			index + 1,
			"""
				invoke-static/range { v$register .. v$register }, $adjust
				$move v$register
			""",
		)
	}
}

/**
 * Passes the value of every read of [field] in the method through [adjust], a static method that takes the value and returns the one to
 * use. Works for object fields read with iget-object or sget-object.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.adjustFieldReads(field: String, adjust: String) {
	val instructions = method.implementation!!.instructions.toList()
	val indices = instructions.withIndex()
		.filter { (it.value.opcode == Opcode.IGET_OBJECT || it.value.opcode == Opcode.SGET_OBJECT) && (it.value as ReferenceInstruction).reference.toString() == field }
		.map { it.index }
	if (indices.isEmpty()) throw PatchException("${method.name} never reads $field")
	indices.reversed().forEach { index ->
		val register = (instructions[index] as OneRegisterInstruction).registerA
		method.addInstructions(
			index + 1,
			"""
				invoke-static/range { v$register .. v$register }, $adjust
				move-result-object v$register
			""",
		)
	}
}

/**
 * Calls [replacement], a static method taking the same values, in place of every call to [called] in the method. For a call to an
 * instance method, the object comes first.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.replaceCalls(called: String, replacement: String) {
	if (method.replaceCalls(called, replacement) == 0) throw PatchException("${method.name} never calls $called")
}

/**
 * Like [Fingerprint.replaceCalls], in every method of the class [type], so it keeps working when the game moves the call into another
 * method of the class between versions.
 */
context(context: BytecodePatchContext)
internal fun replaceCallsInClass(type: String, called: String, replacement: String) {
	val count = context.mutableClassDefBy(type).methods.sumOf { it.replaceCalls(called, replacement) }
	if (count == 0) throw PatchException("$type never calls $called")
}

private fun MutableMethod.replaceCalls(called: String, replacement: String): Int {
	val instructions = implementation?.instructions?.toList() ?: return 0
	val indices = instructions.withIndex()
		.filter { (it.value as? ReferenceInstruction)?.reference?.toString() == called }
		.map { it.index }
	indices.forEach { index ->
		val call = instructions[index] as? Instruction35c ?: throw PatchException("$name calls $called with a range of registers")
		val registers = listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG).take(call.registerCount)
		replaceInstruction(index, "invoke-static { ${registers.joinToString { "v$it" }} }, $replacement")
	}
	return indices.size
}

private const val INFO_WINDOWS_CLASS = "$EXTENSION_PACKAGE/InfoWindows;"

/**
 * Hooks the game's info windows for what you examine, so every feature can add its buttons to them through InfoWindows. Each patch that
 * needs them calls this; the windows are still decorated only once.
 */
context(_: BytecodePatchContext)
internal fun hookInfoWindows() {
	listOf(
		WndInfoMobConstructorFingerprint,
		WndInfoBuffConstructorFingerprint,
		WndInfoHeapConstructorFingerprint,
		WndInfoPlantConstructorFingerprint,
		WndInfoTrapConstructorFingerprint,
	).forEach { window ->
		window.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $INFO_WINDOWS_CLASS->before(Ljava/lang/Object;)V")
		window.callWithThisBeforeReturns("$INFO_WINDOWS_CLASS->after(Ljava/lang/Object;)V")
	}
	WndInfoCellConstructorFingerprint.method.addInstruction(0, "invoke-static/range { p1 .. p1 }, $INFO_WINDOWS_CLASS->beforeCell(I)V")
	WndInfoCellConstructorFingerprint.callWithThisBeforeReturns("$INFO_WINDOWS_CLASS->after(Ljava/lang/Object;)V")
}

/**
 * Lets InstantEquip make equipping take no time. Each patch that needs it calls this; doing so twice changes nothing more.
 */
context(_: BytecodePatchContext)
internal fun hookEquipTime() {
	EquipableItemTimeToEquipFingerprint.adjustReturns("$EXTENSION_PACKAGE/InstantEquip;->adjustEquipTime(F)F")
}
