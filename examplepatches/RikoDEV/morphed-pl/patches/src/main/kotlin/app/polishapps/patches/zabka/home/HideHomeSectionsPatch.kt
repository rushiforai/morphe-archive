package app.polishapps.patches.zabka.home

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.inpost.shared.createsInstanceOf
import app.polishapps.patches.inpost.shared.findClasses
import app.polishapps.patches.inpost.shared.findMethods
import app.polishapps.patches.inpost.shared.mutableMethod
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.singleMethod
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.shared.Constants.COMPATIBILITY_ZABKA_4_51_2
import app.polishapps.patches.shared.forceInstanceOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val HEADER_UI_MODEL = "pl/zabka/feature/home/impl/ui/contract/HomeFeedHeaderUiModel"

/** `Image(painter, String, Modifier, Alignment, ContentScale, float, ColorFilter, Composer, int, int)`. */
private fun isImageCall(instruction: Instruction): Boolean {
    if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE && instruction.opcode != Opcode.INVOKE_STATIC) return false
    val method = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    val types = method.parameterTypes.map { it.toString() }
    return method.returnType == "V" && types.size == 10 && types[1] == "Ljava/lang/String;" &&
        types[5] == "F" && types[8] == "I" && types[9] == "I"
}

/** The class whose `toString` starts with [prefix] (R8 keeps the data class `toString` literals). */
private fun BytecodePatchContext.typeByToString(prefix: String): String =
    findClasses { classDef ->
        classDef.methods.any { it.name == "toString" && prefix in it.strings() }
    }.singleOrNull()?.type ?: throw PatchException("No single class with toString \"$prefix\"")

@Suppress("unused")
val hideHomeSectionsPatch = bytecodePatch(
    name = "Hide home carousels and stories",
    description = "Removes the hero banner carousel and its fallback photo at the top of the home feed, the " +
        "autoplay/swipe banner carousels and the Instagram-style stories rows. Other home sections stay.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZABKA_4_51_2)

    execute {
        // 1. Hero banner carousel: HomeFeedHeader(title, backgroundImage, heroBanner?, loyaltyBar?). The
        //    mapper already passes null when the backend sends no heroBannerCarousel, so do the same.
        val header = typeByToString("HomeFeedHeader(title=")
        val headerConstructor = classDefBy(header).methods.singleOrNull { method ->
            method.name == "<init>" && method.parameterTypeNames().let { types ->
                types.size == 4 && types[0] == "Ljava/lang/String;" && types[1] == "Ljava/lang/String;"
            }
        } ?: throw PatchException("$header: (String, String, hero, loyalty) constructor not found")
        mutableMethod(classDefBy(header), headerConstructor).addInstruction(0, "const/16 p3, 0x0")

        // 1b. Without a hero banner the header falls back to Style.StaticHeader, which loads the feed's
        //     background photo. Style.StaticImage is drawn by a variant without an image loader, so make the
        //     header composable always take that branch (and never the photo or hero ones).
        val styleBase = "L" + HEADER_UI_MODEL + "\$Style\$"
        val headerComposable = singleMethod("home header composable") { classDef, candidate ->
            !classDef.type.startsWith("L$HEADER_UI_MODEL") && candidate.implementation?.instructions?.any { instruction ->
                instruction.opcode == Opcode.INSTANCE_OF &&
                    ((instruction as? ReferenceInstruction)?.reference as? TypeReference)?.type ==
                    styleBase + "StaticHeader;"
            } == true
        }
        headerComposable.forceInstanceOf(styleBase + "StaticImage;", true)
        headerComposable.forceInstanceOf(styleBase + "StaticHeader;", false)

        // 1c. The StaticImage variant still draws a bundled photo: painterResource(...) fed to Compose's
        //     Image(painter, contentDescription, modifier, alignment, contentScale, alpha, colorFilter, ...).
        //     Drop that one call; the top bar slot and the title drawn around it stay.
        val headerClass = headerComposable.definingClass
        val staticImageVariant = singleMethod("static image header variant") { classDef, candidate ->
            classDef.type == headerClass && candidate.parameterTypeNames().let { types ->
                types.size == 5 && types[0] == "L$HEADER_UI_MODEL;" && types[1] == "Lkotlin/jvm/functions/Function2;"
            } && candidate.implementation?.instructions?.any(::isImageCall) == true
        }
        val imageCall = staticImageVariant.instructions.indexOfFirst(::isImageCall)
        staticImageVariant.removeInstruction(imageCall)

        // 2. Section list of the home feed: the mapper wraps every GraphQL section in a UI model unless the
        //    matching wrapper field is null, so null the wrappers we do not want.
        val dropped = listOf("OnPromotionBannerCarousel(__typename=", "OnStoriesSection(__typename=")
            .map { prefix ->
                // Several operations share these names (each has its own copy); the home feed one is read by
                // the HomeFeedPage mapper below, so keep all candidates and filter by that method.
                findClasses { classDef -> classDef.methods.any { it.name == "toString" && prefix in it.strings() } }
                    .map { it.type }
            }.flatten().toSet()
        val pageType = typeByToString("HomeFeedPage(cursor=")

        val (classDef, mapper) = findMethods { _, method ->
            method.createsInstanceOf(pageType) &&
                method.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.IGET_OBJECT &&
                        ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.type in dropped
                } == true
        }.singleOrNull() ?: throw PatchException("Home feed section mapper not found")

        val method = mutableMethod(classDef, mapper)
        val targets = method.instructions.withIndex().filter { (_, instruction) ->
            instruction.opcode == Opcode.IGET_OBJECT &&
                ((instruction as ReferenceInstruction).reference as FieldReference).type in dropped
        }.map { (index, instruction) -> index to (instruction as OneRegisterInstruction).registerA }
        if (targets.size != 2) throw PatchException("Expected 2 section wrapper reads, found ${targets.size}")

        // Insert from the end so earlier indices stay valid.
        targets.sortedByDescending { it.first }.forEach { (index, register) ->
            method.addInstruction(index + 1, "const/16 v$register, 0x0")
        }
    }
}
