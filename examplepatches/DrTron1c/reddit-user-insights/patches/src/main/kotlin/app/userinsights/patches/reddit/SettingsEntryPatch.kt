/*
 * Fingerprints and the approach of copying the "Privacy policy" Compose settings row are from
 * Morphe Patches (https://github.com/MorpheApp/morphe-patches), GPLv3.
 * See its NOTICE file for the GPLv3 Section 7 terms that apply to this code.
 *
 * Changes: separate extension and row key, no new interfaces or methods on Reddit's classes
 * (so it does not clash with Morphe's own settings patch when both are applied), and the order
 * places the row above the Morphe row.
 */

package app.userinsights.patches.reddit

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import app.morphe.patcher.util.findFreeRegister
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.userinsights.patches.reddit.Constants.COMPATIBILITY_REDDIT
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.util.MethodUtil
import java.util.logging.Logger

private const val ENTRY_CLASS = "Lapp/userinsights/extension/RedditSettingsEntry;"
private const val USER_SETTINGS_SECTION_CLASS = "Lcom/reddit/settings/usersettings/UserSettingsSection;"

/** Morphe uses -1000 for its row, so this goes right above it. Reddit's own rows start at 0. */
private const val ROW_ORDER = -1001

/** Packed size of a 20dp icon, the size of the Reddit settings icons (width shl 32 or height). */
private const val SETTING_ICON_SIZE = "0x1400000014L"

private const val ICON_DRAWABLE = "user_insights_settings_icon"

/** Settings row composable: title, on click, modifier, ?, subtitle, leading icon, trailing content, ... */
private val ROW_COMPOSABLE_PARAMETERS = listOf(
    "Ljava/lang/String;",
    "Lkotlin/jvm/functions/Function0;",
    "L",
    "Z",
    "Ljava/lang/String;",
    "Lkotlin/jvm/functions/Function2;",
    "Lkotlin/jvm/functions/Function2;",
    "L",
    "Z",
    "L",
    "I",
    "I"
)

/**
 * Constructor of the Compose settings row "Privacy policy". 2026.30.0+
 */
internal object PrivacyPolicyRowConstructorFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    filters = listOf(
        string("key_pref_privacy_policy"),
        fieldAccess(
            opcode = Opcode.IPUT_OBJECT,
            type = "Ljava/lang/String;",
            location = MatchAfterImmediately()
        )
    )
)

/**
 * Composable content of the "Privacy policy" row. 2026.30.0+
 */
internal object PrivacyPolicyRowContentFingerprint : Fingerprint(
    classFingerprint = PrivacyPolicyRowConstructorFingerprint,
    returnType = "V",
    parameters = listOf("L", "L", "I"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "label_privacy_policy", exceptionIfResourceNotFound = false),
        methodCall(
            opcode = Opcode.INVOKE_STATIC_RANGE,
            returnType = "V",
            parameters = ROW_COMPOSABLE_PARAMETERS
        )
    )
)

internal object RowSectionFingerprint : Fingerprint(
    classFingerprint = PrivacyPolicyRowConstructorFingerprint,
    isStatic = false,
    returnType = USER_SETTINGS_SECTION_CLASS,
    parameters = listOf()
)

internal object RowOrderFingerprint : Fingerprint(
    classFingerprint = PrivacyPolicyRowConstructorFingerprint,
    name = "getOrder",
    returnType = "I",
    parameters = listOf()
)

/** Registry of all Compose settings rows and sections: (rows, sections). 2026.30.0+ */
internal object UserSettingsRegistryFingerprint : Fingerprint(
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/util/Set;", "Ljava/util/Set;"),
    filters = listOf(
        newInstance("Lcom/reddit/settings/usersettings/UserSettingsContributionException;")
    )
)

/** Icon data of the Reddit icon set: (packed size, drawable resource id, auto mirrored). */
internal object IconDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("Icon(resourceId=")
    )
)

/** Icon composable of the Reddit icon set: (icon, description, modifier, tint, ?, composer, changed, defaults). */
internal class IconComposableFingerprint(iconDataType: String) : Fingerprint(
    isStatic = true,
    returnType = "V",
    parameters = listOf(iconDataType, "Ljava/lang/String;", "L", "J", "Z", "L", "I", "I")
)

@Suppress("unused")
val userInsightsSettingsEntryPatch = patch(
    name = "User insights settings entry",
    description = "Adds User Insights to Reddit's settings, above the Morphe entry. Reddit 2026.30.0 or newer.",
    default = true
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    dependsOn(userInsightsPatch)

    extendWith("extensions/extension.mpe")

    execute {
        val logger = Logger.getLogger("UserInsights")

        val registry = UserSettingsRegistryFingerprint.methodOrNull
        val content = PrivacyPolicyRowContentFingerprint.methodOrNull
        val section = RowSectionFingerprint.methodOrNull
        val order = RowOrderFingerprint.methodOrNull
        if (registry == null || content == null || section == null || order == null) {
            logger.warning("User insights settings entry needs Reddit 2026.30.0 or newer. Skipped.")
            return@execute
        }

        // The row composable call, found in the method as it is now, in case another patch
        // (such as Morphe's settings patch) already added code before it.
        val callIndex = content.implementation!!.instructions.indexOfLast { instruction ->
            if (instruction.opcode != Opcode.INVOKE_STATIC_RANGE) return@indexOfLast false
            val reference = (instruction as ReferenceInstruction).reference as? MethodReference
                ?: return@indexOfLast false
            val parameters = reference.parameterTypes.map { it.toString() }
            reference.returnType == "V" && parameters.size == ROW_COMPOSABLE_PARAMETERS.size &&
                parameters[0] == "Ljava/lang/String;" &&
                parameters[1] == "Lkotlin/jvm/functions/Function0;" &&
                parameters[5] == "Lkotlin/jvm/functions/Function2;"
        }
        if (callIndex < 0) {
            logger.warning("User insights settings entry: settings row composable not found. Skipped.")
            return@execute
        }
        if (!section.hasFreeRegister() || !order.hasFreeRegister()) {
            logger.warning("User insights settings entry: no free register in the row getters. Skipped.")
            return@execute
        }

        // Icon drawable, tinted by Reddit like its own settings icons.
        resourceFile("res/drawable/$ICON_DRAWABLE.xml", false).apply {
            parentFile.mkdirs()
            writeText(
                """
                <?xml version="1.0" encoding="utf-8"?>
                <vector xmlns:android="http://schemas.android.com/apk/res/android"
                    android:width="20dp"
                    android:height="20dp"
                    android:viewportWidth="24"
                    android:viewportHeight="24">
                    <path
                        android:fillColor="#FFFFFFFF"
                        android:fillType="evenOdd"
                        android:pathData="M10,2a8,8 0,1 0,4.9 14.3l5.4,5.4 1.4,-1.4 -5.4,-5.4A8,8 0,0 0,10 2zM10,4a6,6 0,1 1,0 12a6,6 0,1 1,0 -12z" />
                    <path
                        android:fillColor="#FFFFFFFF"
                        android:pathData="M10,6.2a2.1,2.1 0,1 1,0 4.2a2.1,2.1 0,1 1,0 -4.2zM6.4,13.6c0.7,-1.6 2.1,-2.4 3.6,-2.4s2.9,0.8 3.6,2.4z" />
                </vector>
                """.trimIndent()
            )
        }

        // Add the row to the rows of the app.
        registry.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p1 }, $ENTRY_CLASS->addRow(Ljava/util/Set;)Ljava/util/Set;
                move-result-object p1
            """
        )

        // Title, click action and icon. The class is shared by several rows, so only change this one.
        content.apply {
            val call = getInstruction<RegisterRangeInstruction>(callIndex)
            val titleRegister = call.startRegister
            val onClickRegister = call.startRegister + 1
            val iconRegister = call.startRegister + 5
            val free = findFreeRegister(callIndex, titleRegister, onClickRegister, iconRegister)

            addInstructionsWithLabels(
                callIndex,
                """
                    invoke-static/range { p0 .. p0 }, $ENTRY_CLASS->isEntryRow(Ljava/lang/Object;)Z
                    move-result v$free
                    if-eqz v$free, :user_insights_original
                    invoke-static { }, $ENTRY_CLASS->getTitle()Ljava/lang/String;
                    move-result-object v$titleRegister
                    invoke-static/range { v$onClickRegister .. v$onClickRegister }, $ENTRY_CLASS->getOnClick(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$onClickRegister
                    check-cast v$onClickRegister, Lkotlin/jvm/functions/Function0;
                    invoke-static/range { v$iconRegister .. v$iconRegister }, $ENTRY_CLASS->getIcon(Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v$iconRegister
                    check-cast v$iconRegister, Lkotlin/jvm/functions/Function2;
                    :user_insights_original
                    nop
                """
            )
        }

        // Position: first section, above Morphe.
        section.overrideForEntryRow(
            """
                sget-object v0, $USER_SETTINGS_SECTION_CLASS->General:$USER_SETTINGS_SECTION_CLASS
                return-object v0
            """
        )
        order.overrideForEntryRow(
            """
                const/16 v0, $ROW_ORDER
                return v0
            """
        )

        implementIcon(logger)
    }
}

private fun MutableMethod.hasFreeRegister() =
    implementation!!.registerCount > MethodUtil.getParameterRegisterCount(this)

/**
 * Returns another value from a getter of the shared row class, if the row is the User Insights row.
 * The register v0 is used before the original code assigns it.
 */
private fun MutableMethod.overrideForEntryRow(returnInstructions: String) {
    addInstructionsWithLabels(
        0,
        """
            invoke-static/range { p0 .. p0 }, $ENTRY_CLASS->isEntryRow(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :user_insights_original
            $returnInstructions
            :user_insights_original
            nop
        """
    )
}

/**
 * Implements the extension placeholder that draws the icon, with the icon composable of the Reddit icon set.
 * Without it, the row shows no icon.
 */
private fun implementIcon(logger: Logger) {
    val iconDataType = IconDataToStringFingerprint.originalClassDefOrNull?.type
    val iconComposable = iconDataType?.let { IconComposableFingerprint(it).originalMethodOrNull }
    if (iconDataType == null || iconComposable == null) {
        logger.warning("User insights settings entry: icon composable not found, the row has no icon.")
        return
    }
    val composerType = iconComposable.parameterTypes[5]

    mutableClassDefBy(ENTRY_CLASS).apply {
        val placeholder = methods.single { it.name == "drawIcon" }
        methods.remove(placeholder)
        methods.add(
            ImmutableMethod(
                type,
                placeholder.name,
                listOf(
                    ImmutableMethodParameter("Ljava/lang/Object;", null, null),
                    ImmutableMethodParameter("I", null, null)
                ),
                "V",
                placeholder.accessFlags,
                null,
                null,
                MutableMethodImplementation(11)
            ).toMutable().apply {
                // Parameters: composer (p0), drawable resource id (p1).
                addInstructionsWithLabels(
                    0,
                    """
                        new-instance v0, $iconDataType
                        const-wide v1, $SETTING_ICON_SIZE
                        const/4 v3, 0x0
                        invoke-direct { v0, v1, v2, p1, v3 }, $iconDataType-><init>(JIZ)V

                        # Icon, content description, modifier, tint, unknown, composer, changed, defaults.
                        # Same arguments as Morphe uses for its settings icon.
                        const/4 v1, 0x0
                        const/4 v2, 0x0
                        const-wide/16 v3, 0x0
                        const/4 v5, 0x0
                        move-object v6, p0
                        check-cast v6, $composerType
                        const/16 v7, 0x30
                        const/16 v8, 0x1c
                        invoke-static/range { v0 .. v8 }, $iconComposable
                        return-void
                    """
                )
            }
        )
    }
}
