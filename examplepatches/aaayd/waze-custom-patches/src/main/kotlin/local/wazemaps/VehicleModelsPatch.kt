package local.wazemaps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val VEHICLE_EXTENSION = "Llocal/wazemaps/vehicles/BundledVehicles;"

@Suppress("unused")
val vehicleModelsPatch = bytecodePatch(
    name = "Bundled vehicle models",
    description = "Add nine bundled vehicles to the car picker, including cat, dog, Santa, Halo Ghost/Warthog and motorbike. Uses local model/texture files. Does not restore unavailable server-only vehicles or voices.",
    default = true
) {
    compatibleWith(Compatibility(
        packageName = "com.waze", name = "Waze", apkFileType = ApkFileType.XAPK,
        signatures = setOf("03637f6c5d8f604e6fdb79a6ffbfa578de4e318f8da22fc6106665247f8807d7"),
        targets = listOf(AppTarget("5.24.5.0"))
    ))
    extendWith("extensions/bundled-vehicles.dex")
    execute {
        val catalogue = mutableClassDefBy("Lcom/waze/copilot/data/a/c;").methods.singleOrNull {
            it.name == "a" && it.parameterTypes.map(CharSequence::toString) == listOf("Lh/c/e;") && it.returnType == "Ljava/lang/Object;"
        } ?: throw PatchException("Expected Waze vehicle catalogue method")
        val downloader = mutableClassDefBy("Lcom/waze/copilot/data/w;").methods.singleOrNull {
            it.name == "c" && it.parameterTypes.map(CharSequence::toString) == listOf("Lcom/waze/copilot/data/c;", "Lh/c/e;") && it.returnType == "Ljava/lang/Object;"
        } ?: throw PatchException("Expected Waze vehicle downloader")
        if (downloader.implementation!!.registerCount < 4) throw PatchException("No scratch register in vehicle downloader")
        val returns = catalogue.implementation!!.instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode == Opcode.RETURN_OBJECT) index to (instruction as OneRegisterInstruction).registerA else null
        }
        if (returns.isEmpty()) throw PatchException("Vehicle catalogue has no return values")
        returns.asReversed().forEach { (index, register) ->
            catalogue.addInstructions(index, """
                invoke-static/range {v$register .. v$register}, $VEHICLE_EXTENSION->augmentCars(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
            """)
        }
        downloader.addInstructions(0, """
            invoke-static/range {p1 .. p1}, $VEHICLE_EXTENSION->prepare(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :normal_download
            sget-object v0, Lh/ab;->a:Lh/ab;
            return-object v0
            :normal_download
            nop
        """)
    }
}
