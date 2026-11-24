package app.originisland.patches.applemusic.dockedplayer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.originisland.patches.shared.Constants.COMPATIBILITY_APPLE_MUSIC_DOCKED_PLAYER
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "Lapp/originisland/extension/AppleMusicDockedPlayerPatch;"

/**
 * The fragment that holds the pages of the app, the mini player and the player.
 */
private const val CONTENT_FRAGMENT_CLASS = "Lcom/apple/android/music/common/fragment/MusicContentFragment;"
private const val MAIN_ACTIVITY_CLASS = "Lcom/apple/android/music/common/MainActivity;"
private const val PLAYER_FRAGMENT_CLASS = "Lcom/apple/android/music/player/fragment/PlayerMainFragment;"
private const val QUEUE_FRAGMENT_CLASS = "Lcom/apple/android/music/player/fragment/NewPlayerQueueViewFragment;"
private const val QUEUE_VIEW_MODEL_CLASS = "Lcom/apple/android/music/player/queuefa/NewPlayerQueueViewModel;"

/**
 * Must match the method the extension calls.
 */
private const val ADD_SIDE_QUEUE_METHOD = "originIslandAddSideQueue"
private const val SIDE_QUEUE_TAG = "origin_island_side_queue"
private const val ADD_SIDE_LYRICS_METHOD = "originIslandAddSideLyrics"
private const val SIDE_LYRICS_TAG = "origin_island_side_lyrics"
private const val LYRICS_FRAGMENT_CLASS = "Lcom/apple/android/music/player/fragment/PlayerLyricsViewFragment;"

private const val VIEW_CREATED_PARAMETERS = "Landroid/view/View;Landroid/os/Bundle;"

private val Method.parameterString get() = parameterTypes.joinToString("")

private fun Method.calls(): List<Pair<Opcode, MethodReference>> =
    implementation?.instructions?.mapNotNull { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@mapNotNull null
        instruction.opcode to reference
    } ?: emptyList()

private const val WIDE_DIMENS = "res/values-w600dp/dimens.xml"
private const val ARTWORK_MARGIN = "now_playing_artwork_margin_horizontal"

/**
 * The cover of the player keeps the margins it has on phones, as the docked player is as wide
 * as a phone. The wide margins are for a player as wide as a tablet, where the height of the
 * window limits the cover anyway.
 */
private val dockedPlayerArtworkMarginPatch = resourcePatch {
    execute {
        if (!get(WIDE_DIMENS).exists()) return@execute
        document(WIDE_DIMENS).use { document ->
            val dimens = document.getElementsByTagName("dimen")
            (0 until dimens.length).map { dimens.item(it) as Element }
                .filter { it.getAttribute("name") == ARTWORK_MARGIN }
                .forEach { it.textContent = "24.0dp" }
        }
    }
}

@Suppress("unused")
val appleMusicDockedPlayerPatch = bytecodePatch(
    name = "Queue beside the player",
    description = "On an unfolded foldable phone or a tablet, shows the queue beside the player, " +
            "or the lyrics with the lyrics button, with the cover and controls on the other half.",
    default = true
) {
    compatibleWith(COMPATIBILITY_APPLE_MUSIC_DOCKED_PLAYER)

    dependsOn(dockedPlayerArtworkMarginPatch)

    extendWith("extensions/extension.mpe")

    execute {
        // The views of the pages, the mini player and the player are made.
        mutableClassDefBy(CONTENT_FRAGMENT_CLASS).methods.firstOrNull {
            it.name == "onViewCreated" && it.parameterString == VIEW_CREATED_PARAMETERS
        }?.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onContentViewCreated(Landroid/view/View;)V"
        ) ?: throw PatchException("Could not find where the pages of the app are made")

        // The fragment tells its pages how far the player is opened, darkening the window behind it.
        val slideClass = mutableClassDefBy { classDef ->
            classDef.type.startsWith(CONTENT_FRAGMENT_CLASS.removeSuffix(";") + "$") &&
                    classDef.fields.any { it.type == CONTENT_FRAGMENT_CLASS } &&
                    classDef.methods.any { method ->
                        method.returnType == "V" && method.parameterString == "F" && method.calls().any { (_, reference) ->
                            reference.name == "setBackgroundColor"
                        }
                    }
        }
        slideClass.methods.first { method ->
            method.returnType == "V" && method.parameterString == "F"
        }.apply {
            // Docked, the app beside the player is not darkened.
            val dimIndex = implementation!!.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                        ((instruction as ReferenceInstruction).reference as MethodReference).let {
                            it.name == "setBackgroundColor" && it.parameterTypes.joinToString("") == "I"
                        }
            }
            if (dimIndex < 0) throw PatchException("Could not find how the window behind the player is darkened")
            val dim = getInstruction<FiveRegisterInstruction>(dimIndex)
            replaceInstruction(
                dimIndex,
                "invoke-static { v${dim.registerC}, v${dim.registerD} }, " +
                        "$EXTENSION_CLASS->setPlayerDim(Landroid/view/View;I)V"
            )

            addInstructions(
                0,
                "invoke-static/range { p1 .. p1 }, $EXTENSION_CLASS->onPlayerSlide(F)V"
            )
        }

        // Docked, the activity is made again for a window as wide as the app's card, so that
        // the app lays its pages out as on a phone.
        // The activity classes of the app above the main activity make attachBaseContext final,
        // so the one that has it is hooked, for the main activity only.
        var activityType: String? = MAIN_ACTIVITY_CLASS
        var attachHooked = false
        while (activityType != null && !attachHooked) {
            val classDef = classDefByOrNull(activityType) ?: break
            val attach = classDef.methods.firstOrNull {
                it.name == "attachBaseContext" && it.parameterString == "Landroid/content/Context;" &&
                        it.implementation != null
            }
            if (attach != null) {
                mutableClassDefBy(classDef).methods.first {
                    it.name == "attachBaseContext" && it.parameterString == "Landroid/content/Context;"
                }.addInstructions(
                    0,
                    """
                        invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->wrapActivityContext(Ljava/lang/Object;Landroid/content/Context;)Landroid/content/Context;
                        move-result-object p1
                    """
                )
                attachHooked = true
            }
            activityType = classDef.superclass
        }
        if (!attachHooked) throw PatchException("Could not find where the main activity gets its context")

        val player = mutableClassDefBy(PLAYER_FRAGMENT_CLASS)

        // The player takes its size once, as it is first laid out, and sizes the moving artwork
        // and the cover with it. Docked, it is measured by the size of its card instead, and again
        // whenever that changes.
        var measured = 0
        player.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.indices.reversed().forEach { index ->
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.INVOKE_STATIC) return@forEach
                val reference = (instruction as ReferenceInstruction).reference as MethodReference
                if (reference.returnType != "V" || reference.parameterTypes.size != 2 ||
                    reference.parameterTypes[0] != "Landroid/view/View;"
                ) return@forEach
                val measuresPlayerSize = (maxOf(0, index - 4) until index).any { previous ->
                    val created = instructions[previous]
                    if (created.opcode != Opcode.NEW_INSTANCE) return@any false
                    val type = ((created as ReferenceInstruction).reference as TypeReference).type
                    classDefByOrNull(type)?.methods?.any { candidate ->
                        candidate.calls().any { (_, call) -> call.name == "setPlayerSize" }
                    } == true
                }
                if (!measuresPlayerSize) return@forEach
                val call = method.getInstruction<FiveRegisterInstruction>(index)
                method.replaceInstruction(
                    index,
                    "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                            "$EXTENSION_CLASS->measurePlayer(Landroid/view/View;Ljava/lang/Object;)V"
                )
                measured++
            }
        }
        if (measured == 0) throw PatchException("Could not find where the player takes its size")

        // The views of the player are made.
        val playerViewCreated = player.methods.firstOrNull {
            it.name == "onViewCreated" && it.parameterString == VIEW_CREATED_PARAMETERS
        }
        if (playerViewCreated != null) {
            playerViewCreated.addInstructions(
                0,
                "invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->onPlayerViewCreated(Ljava/lang/Object;Landroid/view/View;)V"
            )
        } else {
            val superclass = player.superclass ?: throw PatchException("The player fragment has no superclass")
            player.methods.add(
                ImmutableMethod(
                    player.type,
                    "onViewCreated",
                    listOf(
                        ImmutableMethodParameter("Landroid/view/View;", null, null),
                        ImmutableMethodParameter("Landroid/os/Bundle;", null, null),
                    ),
                    "V",
                    AccessFlags.PUBLIC.value,
                    null,
                    null,
                    MutableMethodImplementation(3)
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            invoke-super { p0, p1, p2 }, $superclass->onViewCreated($VIEW_CREATED_PARAMETERS)V
                            invoke-static { p0, p1 }, $EXTENSION_CLASS->onPlayerViewCreated(Ljava/lang/Object;Landroid/view/View;)V
                            return-void
                        """
                    )
                }
            )
        }

        // The player shows one of the song, its lyrics and its queue at a time, through
        // fragment transactions whose classes are obfuscated. The method that adds the queue
        // beside the full screen player makes the same calls as the player does.
        val childFragmentManager = player.methods.asSequence().flatMap { it.calls() }.map { it.second }
            .firstOrNull { it.name == "getChildFragmentManager" && it.parameterTypes.isEmpty() }
            ?: throw PatchException("Could not find how the player gets its fragments")
        val fragmentType = childFragmentManager.definingClass
        val managerType = childFragmentManager.returnType

        class Transaction(
            val type: String,
            val replace: MethodReference,
            val commit: MethodReference,
            val isStateSaved: MethodReference,
        )

        // The method that shows the first part as the player is made replaces it in its
        // column, then commits unless the state of the player is saved.
        fun transactionOf(method: Method): Transaction? {
            val calls = method.calls()
            val replace = calls.firstOrNull { (_, reference) ->
                reference.parameterTypes.joinToString("") == "I${fragmentType}Ljava/lang/String;" &&
                        reference.returnType == "V"
            }?.second ?: return null
            val instructions = method.implementation!!.instructions.toList()
            val type = instructions.indices.firstNotNullOfOrNull { index ->
                val instruction = instructions[index]
                if (instruction.opcode != Opcode.NEW_INSTANCE) return@firstNotNullOfOrNull null
                val type = ((instruction as ReferenceInstruction).reference as TypeReference).type
                val constructor = instructions.getOrNull(index + 1) as? ReferenceInstruction
                    ?: return@firstNotNullOfOrNull null
                val reference = constructor.reference as? MethodReference ?: return@firstNotNullOfOrNull null
                type.takeIf {
                    reference.name == "<init>" && reference.definingClass == type &&
                            reference.parameterTypes.joinToString("") == managerType
                }
            } ?: return null
            val commit = calls.firstOrNull { (_, reference) ->
                reference.definingClass == type && reference.parameterTypes.joinToString("") == "Z" &&
                        reference.returnType == "I"
            }?.second ?: return null
            val isStateSaved = calls.firstOrNull { (_, reference) ->
                reference.definingClass == managerType && reference.parameterTypes.isEmpty() &&
                        reference.returnType == "Z"
            }?.second ?: return null
            return Transaction(type, replace, commit, isStateSaved)
        }

        val transaction = player.methods.firstNotNullOfOrNull { transactionOf(it) }
            ?: throw PatchException("Could not find how the player shows a part")
        val transactionType = transaction.type
        val replace = transaction.replace
        val commit = transaction.commit
        val isStateSaved = transaction.isStateSaved

        val findFragmentByTag = player.methods.asSequence().flatMap { it.calls() }.map { it.second }.firstOrNull {
            it.definingClass == managerType && it.parameterTypes.joinToString("") == "Ljava/lang/String;" &&
                    it.returnType == fragmentType
        } ?: throw PatchException("Could not find how the player finds its parts")

        fun MethodReference.smali() =
            "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

        // Adds a part of the player, made by the static newInstance(Bundle) of its fragment
        // class, to the column with the given id, unless it is there already.
        fun addSidePartMethod(methodName: String, fragmentClass: String, tag: String) {
            val newPart = classDefBy(fragmentClass).methods.firstOrNull {
                it.name == "newInstance" && it.parameterString == "Landroid/os/Bundle;" &&
                        AccessFlags.STATIC.isSet(it.accessFlags)
            } ?: throw PatchException("Could not find how $fragmentClass is made")

            player.methods.add(
                ImmutableMethod(
                    player.type,
                    methodName,
                    listOf(ImmutableMethodParameter("I", null, null)),
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(6)
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            invoke-virtual { p0 }, ${childFragmentManager.smali()}
                            move-result-object v0
                            const-string v1, "$tag"
                            invoke-virtual { v0, v1 }, ${findFragmentByTag.smali()}
                            move-result-object v2
                            if-nez v2, :done
                            invoke-virtual { v0 }, ${isStateSaved.smali()}
                            move-result v2
                            if-nez v2, :done
                            new-instance v2, $transactionType
                            invoke-direct { v2, v0 }, $transactionType-><init>($managerType)V
                            new-instance v3, Landroid/os/Bundle;
                            invoke-direct { v3 }, Landroid/os/Bundle;-><init>()V
                            invoke-static { v3 }, $fragmentClass->newInstance(Landroid/os/Bundle;)${newPart.returnType}
                            move-result-object v3
                            invoke-virtual { v2, p1, v3, v1 }, ${replace.smali()}
                            const/4 v3, 0x0
                            invoke-virtual { v2, v3 }, ${commit.smali()}
                            :done
                            return-void
                        """
                    )
                }
            )
        }

        // The history of the queue beside the player is only given to it when it is asked for,
        // so that its rows are not there at all otherwise.
        mutableClassDefBy(QUEUE_VIEW_MODEL_CLASS).methods.firstOrNull {
            it.name == "updateHistory" && it.parameterString == "Ljava/util/List;"
        }?.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->historyFor(Ljava/lang/Object;Ljava/util/List;)Ljava/util/List;
                move-result-object p1
            """
        ) ?: throw PatchException("Could not find how the queue gets its history")

        addSidePartMethod(ADD_SIDE_QUEUE_METHOD, QUEUE_FRAGMENT_CLASS, SIDE_QUEUE_TAG)
        addSidePartMethod(ADD_SIDE_LYRICS_METHOD, LYRICS_FRAGMENT_CLASS, SIDE_LYRICS_TAG)
    }
}
