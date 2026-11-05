package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.logging.Logger

// Driver side, chosen in Maps' Settings (part of the core patch, like the UI density). Maps for
// Android Automotive puts its cards on the driver's side and its map buttons on the other side. Its
// central display's provider ("EmbeddedCentralDisplayReachabilityProvider") turns the car's driver
// seat (INFO_DRIVER_SEAT, from the car info) into a driver position, and a right-hand driver makes
// the display "left of the user". DiLink 3 has no car service, so the seat is 0 and Maps draws the
// left-hand-drive layout. The seat that provider reads passes through DriverSide.driverSeat, which
// gives the seat for the side chosen in the Settings row (ROW_1_LEFT or ROW_1_RIGHT), or Maps' own
// seat for Auto. The rest is Maps' code for a right-hand-drive car; Maps' other providers (the
// limited-Maps screen's, the non-interactive one) do not read the seat and keep their own side, as in
// such a car. For the report, the seat Maps' car info reads from the car (only on a device with the
// automotive feature) goes to DriverSide.carDriverSeat.
// Required: a missing anchor, an ambiguity or an unknown layout fails the patch.

internal const val DRIVER_SIDE_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/DriverSide;"
// The central display's provider, by the first line of its dump.
private const val CENTRAL_PROVIDER_TAG = "EmbeddedCentralDisplayReachabilityProvider:"
// Maps' driver position enum.
private val DRIVER_POSITION_NAMES = setOf(
    "UNKNOWN_DRIVER_POSITION", "DRIVER_POSITION_LEFT", "DRIVER_POSITION_RIGHT", "DRIVER_POSITION_CENTER",
)
private const val CAR_INFO_TAG = "EmbeddedCarInfo:"
// VehicleProperty.INFO_DRIVER_SEAT and the VehicleAreaSeat values DriverSide gives: ROW_1_LEFT, ROW_1_RIGHT.
private const val INFO_DRIVER_SEAT = 356516106
private val GIVEN_SEATS = setOf(1, 4)
private const val GET_INT_PROPERTY = "Landroid/car/hardware/property/CarPropertyManager;->getIntProperty(II)I"
private const val MAX_SEAT_WRITE_DISTANCE = 4
private val driverSideLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.DriverSidePatch")

internal fun BytecodePatchContext.useDriverSide() {
    requireExtensionMethod(DRIVER_SIDE_CLASS, "driverSeat", listOf("I"), "I")
    requireExtensionMethod(DRIVER_SIDE_CLASS, "carDriverSeat", listOf("I"), "V")
    val carInfo = carInfoClass()
    val seatGetter = reportCarDriverSeat(carInfo)
    giveDriverSeat(carInfo, seatGetter)
}

private fun Instruction.literalString() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.registerA() = (this as OneRegisterInstruction).registerA

private fun Instruction.literal() = (this as? NarrowLiteralInstruction)?.narrowLiteral

private fun ClassDef.hasString(value: String) =
    methods.any { method -> method.implementation?.instructions?.any { it.literalString() == value } == true }

private fun FieldReference.key() = "$definingClass->$name:$type"

private fun BytecodePatchContext.taggedClass(tag: String): ClassDef {
    val classes = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (!classDef.type.startsWith("Lapp/morphe/extension/") && classDef.hasString(tag)) classes += classDef
    }
    return classes.singleOrNull() ?: throw PatchException("Expected one class with \"$tag\", found ${classes.map { it.type }}")
}

// The car info read on Android Automotive OS ("EmbeddedCarInfo").
private fun BytecodePatchContext.carInfoClass() = taggedClass(CAR_INFO_TAG)

// In the central display's provider, the driver position method: the one no-argument method returning
// Maps' driver position enum. It reads the seat from the car info interface (one no-argument int call
// on the provider's car info field, the car info's INFO_DRIVER_SEAT getter [seatGetter]) and compares
// it with the seat areas, ROW_1_LEFT and ROW_1_RIGHT among them. The seat passes through
// DriverSide.driverSeat right after that call.
private fun BytecodePatchContext.giveDriverSeat(carInfo: ClassDef, seatGetter: Method) {
    val provider = taggedClass(CENTRAL_PROVIDER_TAG)
    val positionEnums = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/") || classDef.superclass != "Ljava/lang/Enum;") return@classDefForEach
        val names = classDef.methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions
            ?.mapNotNullTo(HashSet()) { it.literalString() } ?: return@classDefForEach
        if (names.containsAll(DRIVER_POSITION_NAMES)) positionEnums += classDef.type
    }
    // Maps has more than one copy of that enum (one per proto); the provider returns one of them.
    val positions = provider.methods.filter {
        it.parameterTypes.isEmpty() && it.returnType in positionEnums && it.implementation != null
    }
    val position = positions.singleOrNull()
        ?: throw PatchException("Expected one driver position method in ${provider.type} (enums $positionEnums), found ${positions.size}")
    val positionEnum = position.returnType
    // isDisplayRightOfUser's seat path: a no-argument boolean method of the provider calls it.
    if (provider.methods.none { method ->
            method.parameterTypes.isEmpty() && method.returnType == "Z" &&
                method.implementation?.instructions?.any { call ->
                    val reference = (call as? ReferenceInstruction)?.reference as? MethodReference
                    reference?.definingClass == provider.type && reference.name == position.name &&
                        reference.returnType == positionEnum && reference.parameterTypes.isEmpty()
                } == true
        }
    ) {
        throw PatchException("No boolean method of ${provider.type} uses $position")
    }

    val method = mutableMethodOf(position)
    val code = method.implementation!!.instructions
    val seatCalls = code.indices.filter { index ->
        val reference = (code[index] as? ReferenceInstruction)?.reference as? MethodReference
        code[index].opcode == Opcode.INVOKE_INTERFACE && reference != null &&
            reference.parameterTypes.isEmpty() && reference.returnType == "I"
    }
    val call = seatCalls.singleOrNull() ?: throw PatchException("Expected one seat read in $position, found ${seatCalls.size}")
    val seatRead = (code[call] as ReferenceInstruction).reference as MethodReference
    val seatInterface = seatRead.definingClass
    if (seatInterface !in carInfo.interfaces || seatRead.name != seatGetter.name) {
        throw PatchException(
            "The seat read in $position is not the INFO_DRIVER_SEAT getter ${seatGetter.name}()I of ${carInfo.type}'s " +
                "interface: $seatRead",
        )
    }
    // The receiver is the provider's car info field.
    val receiver = (code[call] as FiveRegisterInstruction).registerC
    val receiverRead = (call - 1 downTo 0).firstOrNull { code[it].opcode.setsRegister() && code[it].registerA() == receiver }
    val receiverField = receiverRead?.let { (code[it] as? ReferenceInstruction)?.reference as? FieldReference }
    if (receiverRead == null || code[receiverRead].opcode != Opcode.IGET_OBJECT || receiverField?.definingClass != provider.type ||
        receiverField.type != seatInterface
    ) {
        throw PatchException("The seat read in $position is not on the provider's car info field")
    }
    val result = code.getOrNull(call + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) throw PatchException("The seat read in $position is not moved")
    val register = result.registerA()
    // The seats DriverSide gives are compared with that register.
    val compared = code.indices.filter { index ->
        code[index].opcode == Opcode.IF_EQ && (code[index] as TwoRegisterInstruction).registerA == register
    }.mapNotNull { index ->
        val other = (code[index] as TwoRegisterInstruction).registerB
        (index - 1 downTo call + 2).firstOrNull { code[it].opcode.setsRegister() && code[it].registerA() == other }
            ?.let { code[it].literal() }
    }.toSet()
    if (!compared.containsAll(GIVEN_SEATS)) {
        throw PatchException("$position does not compare the seat with ${GIVEN_SEATS.joinToString()}, only $compared")
    }
    // Inserted code before a branch target would be skipped by that branch.
    if (code.getOrNull(call + 2)?.location?.labels?.isNotEmpty() != false) {
        throw PatchException("No straight-line point after the seat read in $position")
    }
    method.addInstructions(
        call + 2,
        """
            invoke-static/range { v$register .. v$register }, $DRIVER_SIDE_CLASS->driverSeat(I)I
            move-result v$register
        """.trimIndent(),
    )
    driverSideLogger.info(
        "Driver side: $position reads the seat ($seatInterface, field ${receiverField.key()}) into v$register at ${call + 1} " +
            "through DriverSide.driverSeat (compares ${compared.sorted().joinToString()}; $positionEnum)",
    )
}

// The car info's constructor reads getIntProperty(INFO_DRIVER_SEAT, 0) and stores the result (0 when
// the call throws) in an int field that a getter returns. Returns that getter.
private fun BytecodePatchContext.reportCarDriverSeat(carInfo: ClassDef): Method {
    val sites = carInfo.methods.flatMap { method ->
        val code = method.implementation?.instructions?.toList() ?: return@flatMap emptyList()
        code.indices.filter { index ->
            val call = code[index] as? FiveRegisterInstruction
            call != null && memberKey(code[index]) == GET_INT_PROPERTY && call.registerCount == 3 &&
                (index - 1 downTo maxOf(0, index - 4)).firstOrNull { code[it].opcode.setsRegister() && code[it].registerA() == call.registerD }
                    ?.let { code[it].literal() } == INFO_DRIVER_SEAT
        }.map { method to it }
    }
    val (site, call) = sites.singleOrNull()
        ?: throw PatchException("Expected one INFO_DRIVER_SEAT read in ${carInfo.type}, found ${sites.size}")
    if (site.name != "<init>") throw PatchException("The INFO_DRIVER_SEAT read in ${carInfo.type} is not in its constructor: $site")

    val method = mutableMethodOf(site)
    val code = method.implementation!!.instructions
    val result = code.getOrNull(call + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) throw PatchException("The INFO_DRIVER_SEAT read in $site is not moved")
    val register = result.registerA()
    // The store: within a few instructions, only a goto or the fallback move to the same register before it.
    val store = (call + 2 until minOf(code.size, call + 2 + MAX_SEAT_WRITE_DISTANCE)).firstOrNull { index ->
        code[index].opcode == Opcode.IPUT
    } ?: throw PatchException("No store of the driver seat in $site")
    val storeField = (code[store] as ReferenceInstruction).reference as FieldReference
    if ((code[store] as TwoRegisterInstruction).registerA != register || storeField.definingClass != carInfo.type ||
        storeField.type != "I" ||
        (call + 2 until store).any { index ->
            code[index].opcode != Opcode.GOTO && !(code[index].opcode == Opcode.MOVE && code[index].registerA() == register)
        }
    ) {
        throw PatchException("Unexpected store of the driver seat in $site at $store")
    }
    // The field is what the car info gives as the seat: a no-argument int getter returns it.
    val getters = carInfo.methods.filter { getter ->
        val body = getter.implementation?.instructions?.toList() ?: return@filter false
        getter.parameterTypes.isEmpty() && getter.returnType == "I" && body.size == 2 &&
            body[0].opcode == Opcode.IGET && memberKey(body[0]) == storeField.key() && body[1].opcode == Opcode.RETURN
    }
    if (getters.size != 1) throw PatchException("Expected one getter of ${storeField.key()} in ${carInfo.type}, found ${getters.size}")
    if (code.getOrNull(store + 1)?.location?.labels?.isNotEmpty() != false) {
        throw PatchException("No straight-line point after the driver seat store in $site")
    }
    method.addInstructions(
        store + 1,
        "invoke-static/range { v$register .. v$register }, $DRIVER_SIDE_CLASS->carDriverSeat(I)V",
    )
    driverSideLogger.info(
        "Driver side: $site stores INFO_DRIVER_SEAT (read at $call) from v$register in ${storeField.key()} at $store, " +
            "then DriverSide.carDriverSeat (getter ${getters.single().name})",
    )
    return getters.single()
}
