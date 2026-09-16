/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.overflowMenuButton.posts

import app.crimera.patches.instagram.entity.decoder.CURRENT_MEDIA_FIELD
import app.crimera.patches.instagram.entity.decoder.MEDIA_ADD_INFO_CLASS_NAME
import app.crimera.patches.instagram.entity.decoder.decoderEntity
import app.crimera.patches.instagram.utils.Constants.COMPATIBILITY_INSTAGRAM
import app.crimera.patches.instagram.utils.Constants.FEED_OVERFLOW_MENU_BUTTON_CLASS
import app.crimera.utils.changeFirstString
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import app.morphe.util.registersUsed
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val FRAGMENT = "Landroidx/fragment/app/Fragment;"
private const val OBJECT = "Ljava/lang/Object;"
private const val VIEW = "Landroid/view/View;"
private const val MEDIA = "Lcom/instagram/feed/media/Media;"

private val SHEET_ROW_PARAMETERS =
    listOf(
        "Landroid/content/Context;",
        "Landroid/view/View\$OnClickListener;",
        "Ljava/lang/String;",
        "I",
    )

internal object MediaOverflowBottomSheetHelperFingerprint : Fingerprint(
    strings = listOf("MediaOverflowBottomSheetHelper"),
)

internal object FeedFragmentFieldExtensionFingerprint : Fingerprint(
    definingClass = FEED_OVERFLOW_MENU_BUTTON_CLASS,
    name = "feedFragmentFieldName",
)

internal object FeedCurrentMediaFieldExtensionFingerprint : Fingerprint(
    definingClass = FEED_OVERFLOW_MENU_BUTTON_CLASS,
    name = "feedCurrentMediaFieldName",
)

/**
 * Adds the download row to a feed post's options sheet.
 *
 * The row this bundle used to add to the option list arrived intact and was then dropped, because
 * 446 resolves each row's label and icon from the option itself and has nothing to draw for one a
 * patch invents. This adds the row through the sheet builder instead, the same helper the reel
 * menu uses, which is handed a label, an icon and a listener and asks no questions.
 *
 * The builder is a local of a method whose parameters all sit above the range a four bit register
 * field can name, so each value is handed over in its own call rather than as arguments to one.
 */
@Suppress("unused")
val hookFeedSheetPatch =
    bytecodePatch(
        description = "Adds the download row to the feed post options sheet",
    ) {
        dependsOn(decoderEntity)
        compatibleWith(COMPATIBILITY_INSTAGRAM)

        execute {
            val ownerClass = MediaOverflowBottomSheetHelperFingerprint.classDef

            val sheetBuilderClass =
                classDefByOrNull { candidate ->
                    candidate.methods.any { method ->
                        method.returnType == "V" &&
                            method.parameterTypes.map { it.toString() } == SHEET_ROW_PARAMETERS
                    }
                }?.type ?: throw PatchException("Could not find the action sheet builder")

            val fragmentField =
                ownerClass.fields.singleOrNull { it.type == FRAGMENT }
                    ?: throw PatchException("Could not find the fragment field on the sheet owner")

            FeedFragmentFieldExtensionFingerprint.changeFirstString(fragmentField.name)
            FeedCurrentMediaFieldExtensionFingerprint.changeFirstString(CURRENT_MEDIA_FIELD.name)

            // Every place that puts a post's options sheet together: it has the media to hand and
            // either builds the sheet itself or is given one. The feed does this from more than
            // one place — which post types go through which is not something to guess at — so all
            // of them are hooked on shape rather than by name.
            var hooked = 0

            classDefForEach { classDef ->
                classDef.methods.forEach { method ->
                    // A constructor has to call its super before anything else, so it is not a
                    // place to inject into.
                    if (method.name == "<init>" || method.name == "<clinit>") return@forEach

                    val parameters = method.parameterTypes.map { it.toString() }

                    // parameterTypes leaves out the receiver, p0 does not: on an instance method
                    // every parameter sits one register further along than its index here.
                    val parameterOffset = if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1

                    val mediaParameter = parameters.indexOf(MEDIA)
                    if (mediaParameter < 0) return@forEach

                    val contextParameter =
                        parameters.indexOfFirst { it == VIEW || it == ownerClass.type }
                    if (contextParameter < 0) return@forEach

                    val builderParameter = parameters.indexOf(sheetBuilderClass)
                    val implementation = method.implementation ?: return@forEach
                    val builderInitIndex =
                        implementation.instructions.indexOfFirst { instruction ->
                            instruction.opcode == Opcode.INVOKE_DIRECT &&
                                instruction.getReference<MethodReference>()?.let { reference ->
                                    reference.definingClass == sheetBuilderClass && reference.name == "<init>"
                                } == true
                        }
                    if (builderParameter < 0 && builderInitIndex < 0) return@forEach

                    val extraParameter = parameters.indexOf(MEDIA_ADD_INFO_CLASS_NAME)

                    mutableClassDefBy(classDef)
                        .methods
                        .first { it.name == method.name && it.parameterTypes.map { type -> type.toString() } == parameters }
                        .apply {
                            val insertAt = if (builderParameter >= 0) 0 else builderInitIndex + 1
                            val builderSource =
                                if (builderParameter >= 0) {
                                    "p${builderParameter + parameterOffset}"
                                } else {
                                    "v" + getInstruction(builderInitIndex).registersUsed[0]
                                }

                            val scratchRegister =
                                getFreeRegisterProvider(
                                    index = insertAt,
                                    numberOfFreeRegistersNeeded = 1,
                                ).getFreeRegister()

                            fun stash(
                                source: String,
                                setter: String,
                            ) = """
                                move-object/from16 v$scratchRegister, $source
                                invoke-static/range {v$scratchRegister .. v$scratchRegister}, $FEED_OVERFLOW_MENU_BUTTON_CLASS->$setter($OBJECT)V
                                """.trimIndent()

                            addInstructions(
                                insertAt,
                                listOfNotNull(
                                    stash(builderSource, "stashFeedSheet"),
                                    stash("p${mediaParameter + parameterOffset}", "stashFeedMedia"),
                                    if (extraParameter >= 0) stash("p${extraParameter + parameterOffset}", "stashFeedExtra") else null,
                                    stash("p${contextParameter + parameterOffset}", "stashFeedHolder"),
                                    "invoke-static {}, $FEED_OVERFLOW_MENU_BUTTON_CLASS->addFeedMenuDownloadRow()V",
                                ).joinToString(separator = "\n"),
                            )
                            hooked++
                        }
                }
            }

            if (hooked == 0) throw PatchException("Found no place that builds a post options sheet")
        }
    }
