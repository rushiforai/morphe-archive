package app.custom.patches.sevengrid

import app.custom.patches.shared.playStoreInstallerSourcePatch
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import java.util.logging.Logger

private data class StateLiteral(
    val function: HermesBytecode.Function,
    val instruction: HermesBytecode.Instruction,
    val values: List<Any?>,
)

private fun putOwnProperty32(objectRegister: Int, valueRegister: Int, stringId: Int): ByteArray =
    byteArrayOf(65, objectRegister.toByte(), valueRegister.toByte()) +
        ByteArray(4) { (stringId ushr (it * 8)).toByte() }

@Suppress("unused")
val sevenGridProPatch = rawResourcePatch(
    name = "SevenGrid Pro",
    description = "Unlock SevenGrid Pro habits, themes, history, statistics, and reminders, including offline startup.",
    default = true,
) {
    compatibleWith(
        Compatibility(packageName = "app.sevengrid", name = "SevenGrid", apkFileType = ApkFileType.XAPK),
    )
    dependsOn(playStoreInstallerSourcePatch)

    execute {
        if (packageMetadata.packageName != "app.sevengrid") {
            throw PatchException("SevenGrid Pro requires SevenGrid (app.sevengrid).")
        }
        val bundle = get("assets/index.android.bundle")
        checkHermes(bundle.isFile, "Missing assets/index.android.bundle.")
        val hermes = HermesBytecode(bundle.readBytes())
        val setter = hermes.namedFunction("setPro")
        val mapper = hermes.namedFunction("proStatusFromCustomerInfo")
        val stateKeys = listOf("isPro", "isLoading", "proVerdictPending")
        val states = mutableListOf<StateLiteral>()
        val initializers = mutableSetOf<HermesBytecode.Function>()

        // Decode instruction boundaries before looking for operands. Function,
        // string, and literal-buffer indexes are discovered from this APK.
        hermes.functions.forEach { function ->
            hermes.forEachInstruction(function) { instruction ->
                if (hermes.closureFunction(instruction) == setter.id) initializers += function
                if (hermes.objectKeys(instruction) == stateKeys) {
                    states += StateLiteral(function, instruction, hermes.objectValues(instruction))
                }
            }
        }
        checkHermes(initializers.size == 1, "Could not uniquely identify the Pro-store initializer.")
        val initializer = initializers.single()
        val initialState = states.filter { it.function == initializer }
        checkHermes(
            initialState.size == 1 && initialState.single().values == listOf(false, false, true),
            "Unexpected initial Pro-store state.",
        )
        checkHermes(
            hermes.instructions(initializer).any { hermes.property(it) == "setPro" },
            "The initializer does not expose its Pro setter.",
        )
        checkHermes(states.all {
            it.values in listOf(
                listOf(false, false, true), listOf(false, false, false),
                listOf(null, false, false), listOf(true, false, false),
            )
        }, "Unexpected Pro-store update literal.")

        val setterCode = hermes.instructions(setter)
        checkHermes(
            setter.parameters == 2 && setter.flags and 0xc8 == 0 &&
                setterCode.map { it.opcode } == listOf(41, 46, 3, 108, 64, 121, 64, 118, 83, 92),
            "The Pro setter no longer has the expected straight-line layout.",
        )
        fun register(index: Int, operand: Int = 1) = hermes.byte(setterCode[index].offset + operand)
        val temporary = register(3)
        val stateRegister = register(2)
        val callback = register(1)
        checkHermes(
            setOf(temporary, stateRegister, callback).size == 3 &&
                register(0) == temporary && register(1, 2) == temporary &&
                register(3, 2) == 1 && register(4) == stateRegister && register(4, 2) == temporary &&
                hermes.property(setterCode[4]) == "isPro" && register(5) == temporary &&
                register(6) == stateRegister && register(6, 2) == temporary &&
                hermes.property(setterCode[6]) == "proVerdictPending" && register(7) == temporary &&
                register(8) == temporary && register(8, 2) == callback &&
                register(8, 3) == temporary && register(8, 4) == stateRegister && register(9) == temporary,
            "Unexpected register flow in the Pro setter.",
        )

        val mapperCode = hermes.instructions(mapper)
        checkHermes(
            mapper.parameters == 2 && mapper.frameSize >= 2 && mapper.flags and 0xc8 == 0 &&
                mapperCode.mapNotNull { hermes.property(it) }.containsAll(
                    listOf("entitlements", "active", "isPro", "expiresAt", "expirationDate", "willRenew"),
                ) && mapperCode.any {
                    hermes.objectKeys(it) == listOf("isPro", "expiresAt", "willRenew") &&
                        hermes.objectValues(it) == listOf(false, null, false)
                },
            "The customer-info mapper no longer returns the expected Pro status.",
        )

        val statusBody = byteArrayOf(3, 0, 120, 1) + // NewObject r0; LoadConstTrue r1.
            putOwnProperty32(0, 1, hermes.stringId("isPro")) +
            byteArrayOf(119, 1) + // LoadConstNull r1 (lifetime access).
            putOwnProperty32(0, 1, hermes.stringId("expiresAt")) +
            byteArrayOf(121, 1) + // LoadConstFalse r1 (no renewal).
            putOwnProperty32(0, 1, hermes.stringId("willRenew")) + byteArrayOf(92, 0)

        val parameter = setterCode[3]
        val setterBody = hermes.bytes(setter.offset, parameter.offset - setter.offset) +
            byteArrayOf(120, temporary.toByte()) +
            hermes.bytes(parameter.offset + parameter.size, setter.offset + setter.size - parameter.offset - parameter.size)
        val negativeStates = states.filter { it.values.first() == false }
        val proValues = hermes.proStateValuesOffset()
        (negativeStates.map { it.function } + listOf(setter, mapper)).distinct().forEach {
            hermes.requireExclusiveBody(it)
        }
        checkHermes(statusBody.size <= mapper.size, "The status mapper is too small for its replacement.")

        // Initial state is already Pro before billing/network setup. Other
        // negative literal writes (including restore fallback) stay consistent.
        negativeStates.forEach { hermes.replaceObjectValues(it.instruction, proValues) }
        // Preserve the setter's existing callback and listener notifications.
        hermes.replaceBody(setter, setterBody)
        // Startup, periodic refresh, purchase, and restore all use this mapper.
        hermes.replaceBody(mapper, statusBody)
        bundle.writeBytes(hermes.finish())

        Logger.getLogger("Saiyan007").info(
            "Updated SevenGrid's Pro setter, customer-info mapper, and ${negativeStates.size} state literals; refreshed the Hermes SHA-1 footer.",
        )
    }
}
