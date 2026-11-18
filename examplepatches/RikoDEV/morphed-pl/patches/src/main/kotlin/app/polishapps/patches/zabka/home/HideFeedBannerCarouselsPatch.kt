package app.polishapps.patches.zabka.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.inpost.shared.createsInstanceOf
import app.polishapps.patches.inpost.shared.findClasses
import app.polishapps.patches.inpost.shared.findMethods
import app.polishapps.patches.inpost.shared.mutableMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_ZABKA_4_51_2
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** The class whose `toString` contains [prefix] (R8 keeps the data class `toString` literals). */
private fun BytecodePatchContext.typeByToString(prefix: String): String =
    findClasses { classDef ->
        classDef.methods.any { it.name == "toString" && prefix in it.strings() }
    }.singleOrNull()?.type ?: throw PatchException("No single class with toString \"$prefix\"")

@Suppress("unused")
val hideFeedBannerCarouselsPatch = bytecodePatch(
    name = "Hide Żabka screen banner carousels",
    description = "Removes the large swipeable banner carousels (with pager dots, e.g. \"Sprawdź to!\") from the " +
        "Żabka tab screens (Strefa Żabki, Menu Żabki). Other sections stay.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZABKA_4_51_2)

    execute {
        // Every GraphQL operation has its own copy of the PromotionBannerCarousel wrapper class.
        val bannerWrappers = findClasses { classDef ->
            classDef.methods.any { it.name == "toString" && "OnPromotionBannerCarousel(__typename=" in it.strings() }
        }.map { it.type }.toSet()

        val carouselModels = listOf("AutoplayCarousel(autoplayCarousel=", "SwipeCarousel(swipeCarousel=")
            .map { typeByToString(it) }
        // The home feed has its own patch ("Hide home carousels and stories").
        val homePage = typeByToString("HomeFeedPage(cursor=")

        // The content feed mapper turns each GraphQL section into a domain model, picking the banner carousel
        // from its wrapper field; null that field and the section is skipped.
        val mappers = findMethods { _, method ->
            !method.createsInstanceOf(homePage) &&
                carouselModels.all { method.createsInstanceOf(it) } &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.IGET_OBJECT &&
                        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type in bannerWrappers
                } == true
        }
        if (mappers.isEmpty()) throw PatchException("Content feed section mapper not found")

        // The cross-sell feed ("Sprawdź to!") maps its items straight to these carousel models and returns them
        // as a list, so hand back an empty one.
        val crossSellMappers = findMethods { _, method ->
            method.returnType == "Ljava/util/ArrayList;" &&
                method.parameterTypes.size == 1 &&
                !method.createsInstanceOf(homePage) &&
                carouselModels.all { method.createsInstanceOf(it) }
        }
        if (crossSellMappers.size != 1) {
            throw PatchException("Expected one cross-sell carousel mapper, found ${crossSellMappers.size}")
        }
        crossSellMappers.single().let { (classDef, mapper) ->
            mutableMethod(classDef, mapper).addInstructions(
                0,
                """
                    new-instance v0, Ljava/util/ArrayList;
                    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
                    return-object v0
                """,
            )
        }

        mappers.forEach { (classDef, mapper) ->
            val method = mutableMethod(classDef, mapper)
            val targets = method.instructions.withIndex().filter { (_, instruction) ->
                instruction.opcode == Opcode.IGET_OBJECT &&
                    ((instruction as ReferenceInstruction).reference as FieldReference).type in bannerWrappers
            }.map { (index, instruction) -> index to (instruction as OneRegisterInstruction).registerA }

            // Insert from the end so earlier indices stay valid.
            targets.sortedByDescending { it.first }.forEach { (index, register) ->
                method.addInstruction(index + 1, "const/16 v$register, 0x0")
            }
        }
    }
}
