package app.template.patches.rustore.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

@Suppress("unused")
val hideFeaturedAndGamesTabsPatch = bytecodePatch(
    name = "Hide Featured and Games tabs",
    description = "Removes the Featured and Games tabs and opens Apps by default.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    execute {
        val featuredClass = FeaturedTabToStringFingerprint.classDef
        val featuredType = featuredClass.type
        val featuredSingleton = featuredClass.fields.singleOrNull { field ->
            field.type == featuredType
        }
        require(featuredSingleton != null) {
            "Could not find the ShowcaseTab.Featuring singleton field"
        }

        val gamesClass = GamesTabToStringFingerprint.classDef
        val gamesType = gamesClass.type
        val gamesConstructors = gamesClass.methods.count { method ->
            method.name == "<init>" &&
                method.parameterTypes.map(CharSequence::toString) == listOf("Z")
        }
        require(gamesConstructors == 1) {
            "Expected one ShowcaseTab.Games(boolean) constructor, found $gamesConstructors"
        }

        BottomNavigationContainerFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/util/ArrayList;
                invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

                sget-object v1, $featuredType->${featuredSingleton.name}:$featuredType
                invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

                new-instance v1, $gamesType
                const/4 v2, 0x0
                invoke-direct {v1, v2}, $gamesType-><init>(Z)V
                invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

                new-instance v1, $gamesType
                const/4 v2, 0x1
                invoke-direct {v1, v2}, $gamesType-><init>(Z)V
                invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

                move-object p0, v0
            """,
        )

        val rootNavHostMethod = RootNavHostFingerprint.method
        val instructions = rootNavHostMethod.implementation!!.instructions
        val interestingDestinationIndex = instructions.indexOfFirst { instruction ->
            val type = (instruction as? ReferenceInstruction)?.reference as? TypeReference

            instruction.opcode == Opcode.CONST_CLASS &&
                type?.type ==
                "Lru/vk/store/feature/interesting/api/presentation/InterestingTabDestination;"
        }
        require(interestingDestinationIndex >= 0) {
            "Could not find the Interesting start destination"
        }

        val navHostCallOffset = instructions
            .subList(interestingDestinationIndex + 1, instructions.size)
            .indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
                    (instruction as? RegisterRangeInstruction)?.registerCount == 13
            }
        require(navHostCallOffset >= 0) {
            "Could not find the root NavHost call"
        }
        val navHostCallIndex = interestingDestinationIndex + 1 + navHostCallOffset

        val reflectionCallIndex = instructions
            .subList(interestingDestinationIndex + 1, navHostCallIndex)
            .indexOfFirst { instruction ->
                val reference =
                    (instruction as? ReferenceInstruction)?.reference as? MethodReference

                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    reference?.parameterTypes?.map(CharSequence::toString) ==
                    listOf("Ljava/lang/Class;")
            }
            .let { offset ->
                require(offset >= 0) {
                    "Could not find the Kotlin class-reflection call"
                }
                interestingDestinationIndex + 1 + offset
            }
        val reflectionCall =
            (instructions[reflectionCallIndex] as ReferenceInstruction)
                .reference as MethodReference

        val reflectionSingleton = instructions
            .subList(interestingDestinationIndex + 1, reflectionCallIndex)
            .asReversed()
            .firstNotNullOfOrNull { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference

                field?.takeIf {
                    instruction.opcode == Opcode.SGET_OBJECT &&
                        it.type == reflectionCall.definingClass
                }
            }
        require(reflectionSingleton != null) {
            "Could not find the Kotlin reflection singleton"
        }

        val navHostCall =
            rootNavHostMethod.getInstruction<RegisterRangeInstruction>(navHostCallIndex)
        val startDestinationRegister = navHostCall.startRegister + 1
        val scratchRegister = navHostCall.startRegister + 2
        val reflectionFieldDescriptor =
            "${reflectionSingleton.definingClass}->${reflectionSingleton.name}:" +
                reflectionSingleton.type
        val reflectionMethodDescriptor =
            "${reflectionCall.definingClass}->${reflectionCall.name}(" +
                reflectionCall.parameterTypes.joinToString("") +
                ")${reflectionCall.returnType}"

        rootNavHostMethod.addInstructions(
            navHostCallIndex,
            """
                const-class v$startDestinationRegister, Lru/vk/store/feature/recommendation/api/presentation/RecommendationAppsDestination;
                sget-object v$scratchRegister, $reflectionFieldDescriptor
                invoke-virtual {v$scratchRegister, v$startDestinationRegister}, $reflectionMethodDescriptor
                move-result-object v$startDestinationRegister
                const/4 v$scratchRegister, 0x0
            """,
        )
    }
}
