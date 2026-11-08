package app.polishapps.patches.inpost.vonhalsky

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.polishapps.patches.inpost.shared.constructorStrings
import app.polishapps.patches.inpost.shared.findClasses
import app.polishapps.patches.inpost.shared.methodsOf
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.readsStaticField
import app.polishapps.patches.inpost.shared.singleClass
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_INPOST
import app.polishapps.patches.shared.prependReturn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

@Suppress("unused")
val hideVonHalskyPatch = bytecodePatch(
    name = "Hide Von Halsky",
    description = "Removes Von Halsky shopping: the Kupuj tab, the home search box, and the banners and " +
        "promotions in parcel lists, details, the cart and the More menu.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INPOST)

    execute {
        val bannerCreator = singleClass("Von Halsky banner creator") { classDef ->
            classDef.constructorStrings().containsAll(
                listOf("isParcelNimbusBannerEnabledUseCase", "isNimbusLotteryBannerEnabledUseCase"),
            )
        }
        val createBanner = methodsOf(bannerCreator) { method ->
            "targetScreen" in method.strings() && method.returnType.startsWith("L")
        }.singleOrNull() ?: throw PatchException("${bannerCreator.type}: banner factory method not found")
        createBanner.prependReturn(
            """
                const/4 p1, 0x0
                return-object p1
            """,
        )

        val cartBannerUseCase = singleClass("InPost Plus cart banner use case") { classDef ->
            classDef.constructorStrings().containsAll(
                listOf("getInpostPlusCartBannerConfigUseCase", "nimbusPreferencesRepository"),
            )
        }
        val shouldShow = methodsOf(cartBannerUseCase) { method ->
            method.name == "invoke" && method.returnType == "Z" && method.parameterTypes.isEmpty()
        }.singleOrNull() ?: throw PatchException("${cartBannerUseCase.type}->invoke()Z not found")
        shouldShow.prependReturn(
            """
                const/4 p0, 0x0
                return p0
            """,
        )

        val moreMenuItem = singleClass("More menu item enum") { classDef ->
            classDef.methods.any { method ->
                method.name == "<clinit>" && method.strings().containsAll(listOf("VON_HALSKY", "PARCEL_HISTORY"))
            }
        }
        val instructions = moreMenuItem.methods.first { it.name == "<clinit>" }.implementation!!.instructions.toList()
        val nameIndex = instructions.indexOfFirst { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == "VON_HALSKY"
        }
        val vonHalskyItem = instructions.drop(nameIndex).firstNotNullOfOrNull { instruction ->
            if (instruction.opcode != Opcode.SPUT_OBJECT) return@firstNotNullOfOrNull null
            ((instruction as ReferenceInstruction).reference as FieldReference)
                .takeIf { it.definingClass == moreMenuItem.type }
        } ?: throw PatchException("${moreMenuItem.type}: VON_HALSKY field not found")

        singleMethod("More menu services section") { classDef, method ->
            classDef.type != moreMenuItem.type &&
                method.parameterTypeNames() == listOf("Z", "Z", "Z") &&
                method.readsStaticField(vonHalskyItem)
        }.addInstructions(0, "const/4 p2, 0x0")

        val chatEntryUseCase = singleClass("home chat entry use case") { classDef ->
            classDef.constructorStrings().containsAll(
                listOf("isNimbusEnabledUseCase", "isNimbusHomeChatEntryPointEnabledUseCase"),
            )
        }
        methodsOf(chatEntryUseCase, ::isBooleanInvoke).singleOrNull()?.returnFalse()
            ?: throw PatchException("${chatEntryUseCase.type}->invoke()Z not found")

        val promotionFlags = findClasses { classDef ->
            classDef.constructorStrings().containsAll(listOf("remoteConfigRepository", "isNimbusHomeEnabledUseCase")) &&
                classDef.methods.any(::isBooleanInvoke)
        }
        if (promotionFlags.size != 3) {
            throw PatchException("Expected 3 Von Halsky promotion flags, found ${promotionFlags.map { it.type }}")
        }
        promotionFlags.forEach { classDef -> methodsOf(classDef, ::isBooleanInvoke).forEach { it.returnFalse() } }

        val bottomMenuItem = singleClass("bottom menu item") { classDef ->
            classDef.constructorStrings().containsAll(listOf("Home", "Parcels", "Shopping", "Rewards", "More"))
        }
        val bottomMenuItemInit = methodsOf(bottomMenuItem) { method ->
            method.name == "<init>" && method.parameterTypeNames().let { it.size == 6 && it[0] == "I" && it[5] == "Z" }
        }.singleOrNull() ?: throw PatchException("${bottomMenuItem.type}: constructor not found")
        val initInstructions = bottomMenuItemInit.instructions.toList()
        val nimbusIdIndex = initInstructions.indices.firstOrNull { index ->
            val read = initInstructions[index]
            val call = initInstructions.getOrNull(index + 1) ?: return@firstOrNull false
            read.opcode == Opcode.SGET_OBJECT &&
                call.opcode == Opcode.INVOKE_VIRTUAL &&
                ((call as ReferenceInstruction).reference as MethodReference).let {
                    it.returnType == "I" && it.parameterTypes.isEmpty()
                }
        } ?: throw PatchException("${bottomMenuItem.type}: shopping tab id not found")
        val nimbusField = (initInstructions[nimbusIdIndex] as ReferenceInstruction).reference as FieldReference
        val nimbusId = (initInstructions[nimbusIdIndex + 1] as ReferenceInstruction).reference as MethodReference
        bottomMenuItemInit.addInstructionsWithLabels(
            0,
            """
                sget-object v0, ${nimbusField.definingClass}->${nimbusField.name}:${nimbusField.type}
                invoke-virtual {v0}, ${nimbusId.definingClass}->${nimbusId.name}()I
                move-result v0
                if-ne p1, v0, :keep
                const/4 p6, 0x0
            """,
            ExternalLabel("keep", bottomMenuItemInit.getInstruction(0)),
        )
    }
}

private fun isBooleanInvoke(method: Method) =
    method.name == "invoke" && method.returnType == "Z" && method.parameterTypes.isEmpty()

private fun MutableMethod.returnFalse() = prependReturn(
    """
        const/4 p0, 0x0
        return p0
    """,
)
