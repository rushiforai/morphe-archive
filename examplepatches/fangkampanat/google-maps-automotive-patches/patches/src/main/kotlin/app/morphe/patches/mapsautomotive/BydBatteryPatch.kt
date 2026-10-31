package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.logging.Logger

// BYD battery for Maps' EV routing, a separate patch on top of the core one. The AAOS build reads a
// car's energy model from an OEM ContentProvider; Maps Car acts as that source. Each hook below calls BydBatteryPatch, which
// returns the original value unless BYD battery is turned on in Settings on a BYD car and its feature
// switch is on. All hooks are required: a missing anchor, an ambiguity or an unknown layout fails the patch.

internal const val BYD_BATTERY_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/BydBatteryPatch;"
private const val ENERGY_PROVIDER_CLASS = "app.morphe.extension.mapsautomotive.patches.BydEnergyModelProvider"
// Must match BydBatteryPatch.AUTHORITY_SUFFIX in the extension.
private const val ENERGY_AUTHORITY_SUFFIX = ".morphe_byd_energy"
private const val DEMO_CONNECTORS_KEY = "demo_ev_connector_types"
private const val AUTOMOTIVE_FEATURE_NAME = "android.hardware.type.automotive"
private const val OEM_ENERGY_AUTHORITY = "google_maps_energy"
private const val CAR_ENERGY_PERMISSION = "android.car.permission.CAR_ENERGY"
private const val MVI_START_TRACE = "start MVI listener: "
private const val OEM_NULL_STREAM = "OEM ContentProvider returned null InputStream"
private const val STRING = "Ljava/lang/String;"
private const val URI = "Landroid/net/Uri;"
private const val INPUT_STREAM = "Ljava/io/InputStream;"
private const val URI_AUTHORITY = "Landroid/net/Uri\$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri\$Builder;"
private const val RESOLVE_PROVIDER =
    "Landroid/content/pm/PackageManager;->resolveContentProvider(Ljava/lang/String;I)Landroid/content/pm/ProviderInfo;"
private val resolveProviderReference = ImmutableMethodReference(
    BYD_BATTERY_CLASS, "resolveProvider",
    listOf("Landroid/content/pm/PackageManager;", STRING, "I"), "Landroid/content/pm/ProviderInfo;",
)
private val bydLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.BydBatteryPatch")

private val bydBatteryMethods = mapOf(
    "attachBaseContext" to (listOf("Landroid/content/Context;") to "V"),
    "connectorTypes" to (listOf(STRING) to STRING),
    "energyListener" to (listOf("Z") to "Z"),
    "energyAuthority" to (listOf(STRING) to STRING),
    "energyPermission" to (listOf(STRING) to STRING),
    "resolveProvider" to (resolveProviderReference.parameterTypes.map { it.toString() } to resolveProviderReference.returnType),
    "ownsEnergyModel" to (listOf(URI) to "Z"),
    "openEnergyModel" to (listOf(URI) to INPUT_STREAM),
)

private fun Instruction.stringValue() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.methodRef() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.registerList(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

private fun Instruction.overwrites(register: Int) =
    opcode.setsRegister() && (this as OneRegisterInstruction).registerA.let {
        it == register || opcode.setsWideRegister() && it + 1 == register
    }

private fun BytecodePatchContext.requireBydBatteryMethods() {
    val extension = classDefByOrNull(BYD_BATTERY_CLASS)
        ?: throw PatchException("Missing extension class $BYD_BATTERY_CLASS")
    val missing = bydBatteryMethods.filter { (name, signature) ->
        extension.methods.none {
            it.name == name && it.parameterTypes.map { type -> type.toString() } == signature.first &&
                it.returnType == signature.second &&
                AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags)
        }
    }
    if (missing.isNotEmpty()) throw PatchException("BydBatteryPatch lacks ${missing.keys.joinToString()}")
}

private fun BytecodePatchContext.mapsMethods(predicate: (Method) -> Boolean): List<Method> {
    val methods = mutableListOf<Method>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        classDef.methods.forEach { if (it.implementation != null && predicate(it)) methods += it }
    }
    return methods
}

private fun Method.hasString(value: String) = implementation!!.instructions.any { it.stringValue() == value }

// Pass a String in [register], just written at [index] - 1, through a BydBatteryPatch method.
private fun MutableMethod.filterString(index: Int, register: Int, extensionMethod: String) =
    addInstructions(
        index,
        """
            invoke-static/range { v$register .. v$register }, $BYD_BATTERY_CLASS->$extensionMethod(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$register
        """.trimIndent(),
    )

private val bydEnergyProviderPatch = resourcePatch {
    dependsOn(manifestPatch)
    execute {
        document("AndroidManifest.xml").use { addBydEnergyProvider(it, PATCHED_PACKAGE_NAME) }
    }
}

@Suppress("unused")
val bydBatteryPatch = bytecodePatch(
    name = "BYD battery (EV)",
    description = "Feeds the BYD battery into Maps' EV routing (battery on arrival, chargers). " +
        "On by default on the tested BYD Dolphin, off with an \"untested\" notice on other BYD models; a Settings row turns it on or off.",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch, bydEnergyProviderPatch)

    execute {
        requireBydBatteryMethods()
        startBydBattery()
        declareBydVehicle()
        redirectEnergyModelListener()
        acceptOwnEnergyProvider()
        readOwnEnergyModel()
        IncludedFeatures.settingsRows += BYD_BATTERY_CLASS
        IncludedFeatures.features += "byd_battery"
    }
}

// BYD battery is decided at the Application's attachBaseContext: Maps' content providers and its
// onCreate run after it and may build the components that read the vehicle type. It takes the base
// context as the Application receives it. SafeMode is read before it (added in the core's finalize).
private fun BytecodePatchContext.startBydBattery() {
    findHierarchyHook(APPLICATION_CLASS, "Maps application attachBaseContext") {
        it.name == "attachBaseContext" && it.returnType == "V" &&
            it.parameterTypes.map { type -> type.toString() } == listOf("Landroid/content/Context;")
    }.addInstruction(
        0,
        "invoke-static/range { p1 .. p1 }, $BYD_BATTERY_CLASS->attachBaseContext(Landroid/content/Context;)V",
    )
}

// Without the automotive feature Maps' vehicle info has no fuel type, so Maps shows no EV UI and
// creates no energy-model listener. The vehicle-info factory wraps it in Maps' demo EV vehicle (BEV,
// connectors parsed from the preference) when the demo_ev_connector_types preference is non-empty.
// The factory's and the demo vehicle's reads of that preference get the Dolphin's connectors.
private fun BytecodePatchContext.declareBydVehicle() {
    val preference = demoConnectorsPreference()

    val factories = mapsMethods {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.hasString(AUTOMOTIVE_FEATURE_NAME) &&
            preferenceReads(it, preference).isNotEmpty()
    }
    val factory = factories.singleOrNull()
        ?: throw PatchException("Expected one vehicle-info factory reading $DEMO_CONNECTORS_KEY, found ${factories.joinToString()}")
    val vehicleInfo = factory.returnType
    val wrapperInit = factory.implementation!!.instructions.mapNotNull { it.methodRef() }.filter {
        it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == vehicleInfo
    }.distinctBy { it.toString() }.singleOrNull()
        ?: throw PatchException("Expected one demo vehicle wrapping $vehicleInfo in $factory")
    val wrapper = classDefByOrNull(wrapperInit.definingClass)
        ?: throw PatchException("Missing demo vehicle class ${wrapperInit.definingClass}")
    if (vehicleInfo !in wrapper.interfaces) {
        throw PatchException("${wrapper.type} does not implement the vehicle info $vehicleInfo")
    }

    val wrapperReads = wrapper.methods.filter { it.implementation != null }
        .associateWith { preferenceReads(it, preference) }.filterValues { it.isNotEmpty() }
    if (preferenceReads(factory, preference).size != 1 || wrapperReads.values.sumOf { it.size } != 2 ||
        wrapperReads.keys.none { it.returnType == "Z" && it.parameterTypes.isEmpty() }
    ) {
        throw PatchException("Unexpected $DEMO_CONNECTORS_KEY reads: $factory, ${wrapperReads.keys.joinToString()}")
    }

    (wrapperReads + (factory to preferenceReads(factory, preference))).forEach { (method, reads) ->
        val mutable = mutableMethodOf(method)
        reads.sortedDescending().forEach { moveResult ->
            val register = (mutable.implementation!!.instructions[moveResult] as OneRegisterInstruction).registerA
            mutable.filterString(moveResult + 1, register, "connectorTypes")
        }
    }
    bydLogger.info(
        "BYD vehicle: $DEMO_CONNECTORS_KEY ($preference) reads in $factory and ${wrapperReads.keys.joinToString()}",
    )
}

// The static field holding the preference: new Preference("demo_ev_connector_types", ...) in a <clinit>.
private fun BytecodePatchContext.demoConnectorsPreference(): FieldReference {
    val fields = mutableListOf<FieldReference>()
    mapsMethods { it.name == "<clinit>" && it.hasString(DEMO_CONNECTORS_KEY) }.forEach { method ->
        val instructions = method.implementation!!.instructions.toList()
        instructions.indices.filter { instructions[it].stringValue() == DEMO_CONNECTORS_KEY }.forEach { index ->
            val key = (instructions[index] as OneRegisterInstruction).registerA
            val init = (index + 1 until minOf(instructions.size, index + 4)).firstOrNull {
                instructions[it].opcode == Opcode.INVOKE_DIRECT && instructions[it].methodRef()?.name == "<init>" &&
                    instructions[it].registerList().getOrNull(1) == key
            } ?: throw PatchException("Unexpected $DEMO_CONNECTORS_KEY preference in $method")
            val instance = instructions[init].registerList().first()
            val store = instructions.getOrNull(init + 1)
            val field = (store as? ReferenceInstruction)?.reference as? FieldReference
            if (store?.opcode != Opcode.SPUT_OBJECT || (store as OneRegisterInstruction).registerA != instance ||
                field == null
            ) {
                throw PatchException("Unexpected $DEMO_CONNECTORS_KEY preference store in $method")
            }
            fields += field
        }
    }
    return fields.singleOrNull()
        ?: throw PatchException("Expected one $DEMO_CONNECTORS_KEY preference, found ${fields.joinToString()}")
}

// Each read of [preference] with a default: sget-object field, then call(settings, field, default)
// returning String, then move-result-object. Returns the move-result indices; other uses fail.
private fun preferenceReads(method: Method, preference: FieldReference): List<Int> {
    val instructions = method.implementation!!.instructions.toList()
    return instructions.indices.filter {
        instructions[it].opcode == Opcode.SGET_OBJECT &&
            ((instructions[it] as ReferenceInstruction).reference as FieldReference).let { field ->
                field.definingClass == preference.definingClass && field.name == preference.name &&
                    field.type == preference.type
            }
    }.map { read ->
        val register = (instructions[read] as OneRegisterInstruction).registerA
        val call = (read + 1 until minOf(instructions.size, read + 6)).firstOrNull {
            instructions[it].opcode in setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_VIRTUAL) &&
                instructions[it].registerList().let { registers -> registers.size == 3 && registers[1] == register }
        } ?: throw PatchException("$DEMO_CONNECTORS_KEY is not read with a default in $method")
        val reference = instructions[call].methodRef()!!
        if ((read + 1 until call).any { instructions[it].overwrites(register) } ||
            reference.returnType != STRING ||
            reference.parameterTypes.map { it.toString() } != listOf(preference.type, STRING) ||
            instructions.getOrNull(call + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT
        ) {
            throw PatchException("Unexpected $DEMO_CONNECTORS_KEY read in $method at $call")
        }
        call + 1
    }
}

// The energy-model listener factory: content://google_maps_energy/model, read only with CAR_ENERGY,
// created only when its boolean parameter is true (a BEV outside the system user; DiLink runs apps
// as user 0). When BYD battery is on: created, our authority (served by the stub provider) and no
// permission.
private fun BytecodePatchContext.redirectEnergyModelListener() {
    val factories = mapsMethods { it.hasString(OEM_ENERGY_AUTHORITY) && it.hasString(CAR_ENERGY_PERMISSION) }
    val factory = factories.singleOrNull()
        ?: throw PatchException("Expected one energy-model listener factory, found ${factories.joinToString()}")
    val instructions = factory.implementation!!.instructions.toList()

    val authorities = instructions.indices.filter { instructions[it].stringValue() == OEM_ENERGY_AUTHORITY }
    val authority = authorities.singleOrNull() ?: throw PatchException("Expected one $OEM_ENERGY_AUTHORITY in $factory")
    val authorityRegister = (instructions[authority] as OneRegisterInstruction).registerA
    val authorityCall = instructions.getOrNull(authority + 1)
    if (authorityCall == null || memberKey(authorityCall) != URI_AUTHORITY ||
        authorityCall.registerList().getOrNull(1) != authorityRegister
    ) {
        throw PatchException("$OEM_ENERGY_AUTHORITY is not the listener URI's authority in $factory")
    }

    val permissions = instructions.indices.filter { instructions[it].stringValue() == CAR_ENERGY_PERMISSION }
    val permission = permissions.singleOrNull() ?: throw PatchException("Expected one $CAR_ENERGY_PERMISSION in $factory")
    val permissionRegister = (instructions[permission] as OneRegisterInstruction).registerA
    // The permission is the last argument of the listener constructor.
    val listenerInit = (permission + 1 until minOf(instructions.size, permission + 8)).firstOrNull {
        instructions[it].opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) &&
            instructions[it].methodRef()?.name == "<init>"
    } ?: throw PatchException("$CAR_ENERGY_PERMISSION is not passed to a listener in $factory")
    val listenerReference = instructions[listenerInit].methodRef()!!
    if ((permission + 1 until listenerInit).any { instructions[it].overwrites(permissionRegister) } ||
        instructions[listenerInit].registerList().lastOrNull() != permissionRegister ||
        listenerReference.parameterTypes.lastOrNull()?.toString() != STRING ||
        listenerReference.parameterTypes.none { it.toString() == URI }
    ) {
        throw PatchException("Unexpected energy-model listener construction in $factory")
    }

    // The listener is created only if the method's one boolean parameter is true; its first
    // instruction branches on it.
    val switches = factory.parameterTypes.indices.filter { factory.parameterTypes[it].toString() == "Z" }
    val switchIndex = switches.singleOrNull() ?: throw PatchException("Expected one boolean parameter in $factory")
    val sizes = factory.parameterTypes.map { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
    val firstParameter = factory.implementation!!.registerCount - sizes.sum() -
        if (AccessFlags.STATIC.isSet(factory.accessFlags)) 0 else 1
    val switchRegister = firstParameter + sizes.take(switchIndex).sum() +
        if (AccessFlags.STATIC.isSet(factory.accessFlags)) 0 else 1
    val first = instructions.first()
    if (first.opcode !in setOf(Opcode.IF_EQZ, Opcode.IF_NEZ) || (first as OneRegisterInstruction).registerA != switchRegister) {
        throw PatchException("$factory does not start by checking its boolean parameter")
    }

    val mutable = mutableMethodOf(factory)
    listOf(
        Triple(permission, permissionRegister, "energyPermission"),
        Triple(authority, authorityRegister, "energyAuthority"),
    ).sortedByDescending { it.first }.forEach { (index, register, extensionMethod) ->
        mutable.filterString(index + 1, register, extensionMethod)
    }
    mutable.addInstructions(
        0,
        """
            invoke-static/range { v$switchRegister .. v$switchRegister }, $BYD_BATTERY_CLASS->energyListener(Z)Z
            move-result v$switchRegister
        """.trimIndent(),
    )
    bydLogger.info("Energy-model listener: $factory (switch v$switchRegister, authority at $authority, " +
        "permission at $permission, listener ${listenerReference.definingClass})")
}

// At application start Maps connects its OEM listeners to system providers only
// (resolveContentProvider with MATCH_SYSTEM_ONLY). Our own energy provider is accepted too.
private fun BytecodePatchContext.acceptOwnEnergyProvider() {
    val starts = mapsMethods { it.hasString(MVI_START_TRACE) }
    val start = starts.singleOrNull()
        ?: throw PatchException("Expected one OEM listener start, found ${starts.joinToString()}")
    val instructions = start.implementation!!.instructions.toList()
    val lookups = instructions.indices.filter {
        instructions[it].opcode == Opcode.INVOKE_VIRTUAL && memberKey(instructions[it]) == RESOLVE_PROVIDER
    }
    val lookup = lookups.singleOrNull()
        ?: throw PatchException("Expected one provider lookup in $start, found ${lookups.size}")
    val call = instructions[lookup] as FiveRegisterInstruction
    mutableMethodOf(start).replaceInstruction(
        lookup,
        BuilderInstruction35c(
            Opcode.INVOKE_STATIC, call.registerCount, call.registerC, call.registerD,
            call.registerE, call.registerF, call.registerG, resolveProviderReference,
        ),
    )
    bydLogger.info("OEM listener start: $start (provider lookup at $lookup)")
}

// Each listener read opens its URI through Maps' safe resolver, which refuses a provider of Maps' own
// package. For our energy-model URI the read takes the extension's stream instead.
private fun BytecodePatchContext.readOwnEnergyModel() {
    val reads = mapsMethods { it.hasString(OEM_NULL_STREAM) }
    val read = reads.singleOrNull() ?: throw PatchException("Expected one OEM listener read, found ${reads.joinToString()}")
    val instructions = read.implementation!!.instructions.toList()
    val opens = instructions.indices.filter {
        instructions[it].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE) &&
            instructions[it].methodRef()?.let { reference ->
                reference.returnType == INPUT_STREAM &&
                    reference.parameterTypes.map { type -> type.toString() }.take(2) ==
                    listOf("Landroid/content/Context;", URI)
            } == true
    }
    val open = opens.singleOrNull() ?: throw PatchException("Expected one stream open in $read, found ${opens.size}")
    val uriRegister = instructions[open].registerList()[1]
    val result = instructions.getOrNull(open + 1)
    if (result?.opcode != Opcode.MOVE_RESULT_OBJECT || open + 2 >= instructions.size) {
        throw PatchException("Unexpected stream open in $read at $open")
    }
    val resultRegister = (result as OneRegisterInstruction).registerA

    val mutable = mutableMethodOf(read)
    val code = mutable.implementation!!.instructions
    val flag = mutable.getFreeRegisterProvider(open, 1, uriRegister, resultRegister).getFreeRegister4Bit()
    mutable.addInstructionsWithLabels(
        open,
        """
            invoke-static/range { v$uriRegister .. v$uriRegister }, $BYD_BATTERY_CLASS->ownsEnergyModel($URI)Z
            move-result v$flag
            if-eqz v$flag, :morphe_oem_open
            invoke-static/range { v$uriRegister .. v$uriRegister }, $BYD_BATTERY_CLASS->openEnergyModel($URI)$INPUT_STREAM
            move-result-object v$resultRegister
            goto :morphe_stream_opened
        """.trimIndent(),
        ExternalLabel("morphe_oem_open", code[open]),
        ExternalLabel("morphe_stream_opened", code[open + 2]),
    )
    bydLogger.info("OEM listener read: $read (stream open at $open, uri v$uriRegister, result v$resultRegister)")
}

// The stub provider that owns our energy-model authority (see BydEnergyModelProvider).
internal fun addBydEnergyProvider(document: Document, packageName: String) {
    val authority = packageName + ENERGY_AUTHORITY_SUFFIX
    val providers = document.getElementsByTagName("provider")
    for (index in 0 until providers.length) {
        val provider = providers.item(index) as Element
        if (authority in provider.getAttribute("android:authorities").split(';')) {
            throw PatchException("Provider authority $authority is already declared")
        }
    }
    val application = document.getElementsByTagName("application").item(0) as Element
    application.appendChild(
        document.createElement("provider").apply {
            setAttribute("android:name", ENERGY_PROVIDER_CLASS)
            setAttribute("android:authorities", authority)
            setAttribute("android:exported", "false")
        },
    )
}
