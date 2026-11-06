package app.kyurem39.patches.mpvex

import app.kyurem39.patches.shared.Constants.COMPATIBILITY_MPVEX
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val MORPHE_HOOK = "Lapp/kyurem39/extension/MorpheHook;"
private const val LOCALE_HELPER = "Lapp/kyurem39/extension/MorpheLocale;"

private const val COMPOSE_TEXT = "Landroidx/compose/material3/TextKt;"
private const val COMPOSE_ICON = "Landroidx/compose/material3/IconKt;"

/** Every activity mpvEx ships has to apply the locale before it reads any resource. */
private val ACTIVITIES = listOf(
    "Lapp/marlboroadvance/mpvex/MainActivity;",
    "Lapp/marlboroadvance/mpvex/ui/mediainfo/MediaInfoActivity;",
    "Lapp/marlboroadvance/mpvex/ui/player/PlayerActivity;",
    "Lapp/marlboroadvance/mpvex/presentation/crash/CrashActivity;",
)

/** Classes containing hard-coded bottom dock / navigation bar labels in mpvEx. */
private val HARDCODED_DOCK_CLASSES = listOf(
    "Lapp/marlboroadvance/mpvex/ui/browser/dialogs/AddToPlaylistDialogKt\$\$ExternalSyntheticLambda18;",
    "Lapp/marlboroadvance/mpvex/MainActivity\$\$ExternalSyntheticLambda5;",
)
private val HARDCODED_DOCK_STRINGS = setOf("Home", "Recents", "Playlists", "Network")

/**
 * Forces the Vietnamese interface.
 *
 * <p>The settings panel is shared with the other patches and lives in [patchSettingsPatch], so
 * this patch only adds the locale hooks.
 */
@Suppress("unused")
val vietnamesePatch = bytecodePatch(
    name = "Vietnamese interface",
    description = "Translates the application interface into Vietnamese.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MPVEX)

    dependsOn(vietnameseResourcesPatch)
    dependsOn(patchSettingsPatch)

    execute {
        ACTIVITIES.forEach { activity ->
            val onCreate = mutableClassDefBy(activity).methods.firstOrNull { method ->
                method.name == "onCreate" &&
                    method.parameterTypes.size == 1 &&
                    method.parameterTypes[0].toString() == "Landroid/os/Bundle;" &&
                    method.returnType == "V"
            } ?: throw PatchException("$activity has no onCreate(Bundle).")

            onCreate.addInstructions(
                0,
                """
                    invoke-static {}, $MORPHE_HOOK->enableVietnameseInterface()V
                    invoke-static {p0}, $LOCALE_HELPER->overrideConfiguration(Landroid/app/Activity;)V
                """,
            )
        }

        // Hook Compose Text and Icon to dynamically localize hard-coded strings across all screens.
        val textKt = mutableClassDefBy(COMPOSE_TEXT)
        val textMethod = textKt.methods.firstOrNull { it.name == "Text-Nvy7gAk" }
            ?: throw PatchException("$COMPOSE_TEXT has no Text-Nvy7gAk.")
        textMethod.addInstructions(
            0,
            """
                invoke-static/range {p0 .. p0}, $LOCALE_HELPER->localize(Ljava/lang/String;)Ljava/lang/String;
                move-result-object p0
            """,
        )

        val iconKt = mutableClassDefBy(COMPOSE_ICON)
        iconKt.methods.filter { it.name == "Icon-ww6aTOc" }.forEach { method ->
            method.addInstructions(
                0,
                """
                    invoke-static/range {p1 .. p1}, $LOCALE_HELPER->localize(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object p1
                """,
            )
        }

        // Localize hard-coded dock and navigation labels (Home, Recents, Playlists, Network).
        HARDCODED_DOCK_CLASSES.forEach { className ->
            val method = mutableClassDefBy(className).methods.firstOrNull { it.name == "invoke" }
                ?: throw PatchException("$className has no invoke().")
            val instructions = method.implementation!!.instructions

            val targets = mutableListOf<Pair<Int, Int>>()
            for (index in instructions.indices) {
                val instruction = instructions[index]
                val stringRef = (instruction as? ReferenceInstruction)?.reference as? StringReference
                if (stringRef?.string in HARDCODED_DOCK_STRINGS) {
                    val reg = (instruction as? OneRegisterInstruction)?.registerA
                        ?: throw PatchException("Expected register for const-string in $className at $index")
                    targets.add(index to reg)
                }
            }

            for ((index, reg) in targets.reversed()) {
                method.addInstructions(
                    index + 1,
                    """
                        invoke-static/range {v$reg .. v$reg}, $LOCALE_HELPER->localize(Ljava/lang/String;)Ljava/lang/String;
                        move-result-object v$reg
                    """,
                )
            }
        }

        // Intercept all Toast.makeText calls to localize toast notifications.
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/marlboroadvance/mpvex/")) {
                var mutableClass: app.morphe.patcher.util.proxy.mutableTypes.MutableClass? = null
                for (classMethod in classDef.methods) {
                    val impl = classMethod.implementation ?: continue
                    val instructionsList = impl.instructions.toList()
                    val targets = mutableListOf<Pair<Int, String>>()
                    for (index in instructionsList.indices) {
                        val inst = instructionsList[index]
                        val methodRef = (inst as? ReferenceInstruction)?.reference as? MethodReference
                        if (methodRef?.definingClass == "Landroid/widget/Toast;" &&
                            methodRef.name == "makeText" &&
                            methodRef.parameterTypes.size == 3 &&
                            methodRef.parameterTypes[1].toString() == "Ljava/lang/CharSequence;"
                        ) {
                            if (inst is Instruction35c) {
                                val r1 = inst.registerC
                                val r2 = inst.registerD
                                val r3 = inst.registerE
                                val smali = "invoke-static {v$r1, v$r2, v$r3}, $LOCALE_HELPER->makeToast(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;"
                                targets.add(index to smali)
                            } else if (inst is Instruction3rc) {
                                val start = inst.startRegister
                                val end = start + inst.registerCount - 1
                                val smali = "invoke-static/range {v$start .. v$end}, $LOCALE_HELPER->makeToast(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;"
                                targets.add(index to smali)
                            }
                        }
                    }

                    if (targets.isNotEmpty()) {
                        if (mutableClass == null) {
                            mutableClass = mutableClassDefBy(classDef)
                        }
                        val mutableMethod = mutableClass.methods.first {
                            it.name == classMethod.name && it.parameterTypes == classMethod.parameterTypes
                        }
                        for ((index, smali) in targets.reversed()) {
                            mutableMethod.replaceInstruction(index, smali)
                        }
                    }
                }
            }
        }

        // Localize MediaPlaybackService fallback notification title ("Unknown Video").
        mutableClassDefByOrNull("Lapp/marlboroadvance/mpvex/ui/player/MediaPlaybackService;")?.let { serviceClass ->
            for (method in serviceClass.methods) {
                val instructions = method.implementation?.instructions ?: continue
                val targets = mutableListOf<Pair<Int, Int>>()
                for (index in instructions.indices) {
                    val inst = instructions[index]
                    val stringRef = (inst as? ReferenceInstruction)?.reference as? StringReference
                    if (stringRef?.string == "Unknown Video") {
                        val reg = (inst as? OneRegisterInstruction)?.registerA ?: continue
                        targets.add(index to reg)
                    }
                }
                for ((index, reg) in targets.reversed()) {
                    method.addInstructions(
                        index + 1,
                        """
                            invoke-static/range {v$reg .. v$reg}, $LOCALE_HELPER->localize(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v$reg
                        """,
                    )
                }
            }
        }
    }
}
