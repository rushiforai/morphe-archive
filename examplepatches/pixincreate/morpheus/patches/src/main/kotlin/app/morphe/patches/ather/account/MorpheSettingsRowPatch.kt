/*
 * Ather Morphe patches.
 * Licensed under CC0 1.0 Universal.
 */

package app.morphe.patches.ather.account

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

private const val MORPHE_ACCOUNT = "Lapp/morphe/ather/MorpheAccount;"
private const val ACCOUNT_SECTION_MAPPER = "Lcom/ather/account/model/AccountSectionMapperKt;"
private const val ACCOUNT_SCREEN = "Lcom/ather/account/ui/account/k1;"
private const val FEATURE_ACCESS = "Lcom/ather/domain/featureAccess/a;"

/**
 * Matches the builder of the account screen's section list.
 *
 * The method walks the CMS payload in a loop and returns the list it built. The return also
 * carries the label that ends the loop, so the patch replaces that instruction in place
 * instead of inserting before it. The label then stays on the injected call, and the branch
 * that ends the loop runs the injection too.
 *
 * ```
 * public static final createAccountSectionList(List, boolean, String, a, boolean, Set, Map, Map): List
 * ```
 */
internal object AccountSectionListFingerprint : Fingerprint(
    definingClass = ACCOUNT_SECTION_MAPPER,
    name = "createAccountSectionList",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/util/List;",
    parameters = listOf(
        "Ljava/util/List;",
        "Z",
        "Ljava/lang/String;",
        FEATURE_ACCESS,
        "Z",
        "Ljava/util/Set;",
        "Ljava/util/Map;",
        "Ljava/util/Map;",
    ),
)

/**
 * Matches the handler the account screen calls with the link of a clicked row.
 *
 * The first parameter is the screen itself; the second one is the row's link.
 *
 * ```
 * public static m(k1, String): void
 * ```
 */
internal object AccountRowClickFingerprint : Fingerprint(
    definingClass = ACCOUNT_SCREEN,
    name = "m",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(ACCOUNT_SCREEN, "Ljava/lang/String;"),
)

/**
 * Adds a "Morphe settings" row to the account screen.
 *
 * The row opens the patch's own settings screen, which holds the map provider, the analytics
 * toggle and the ride log. It sits in a section of its own, so a rename or a reorder of the
 * server-driven rows cannot collide with it.
 *
 * Equivalent smali (verified against 13.5.0, versionCode 321), inserted at the end of the
 * section list builder and at the start of the row click handler:
 * ```
 * :cond_4
 * invoke-static {v0}, Lapp/morphe/ather/MorpheAccount;->inject(Ljava/util/List;)Ljava/util/List;
 * move-result-object v0
 * return-object v0
 * ```
 * ```
 * invoke-static {p1}, Lapp/morphe/ather/MorpheAccount;->route(Ljava/lang/String;)Ljava/lang/String;
 * move-result-object p1
 * ```
 */
@Suppress("unused")
val morpheSettingsRowPatch = bytecodePatch(
    name = "Morphe settings row",
    description = "Adds a \"Morphe settings\" row to the account screen, which opens the map " +
        "provider, analytics and ride log settings.",
) {
    compatibleWith("com.athermobileapp")

    extendWith("extensions/ather.mpe")

    execute {
        AccountSectionListFingerprint.method.addSectionInjection()

        AccountRowClickFingerprint.method.addRowRouting()
    }
}

/**
 * Routes the built section list through [MorpheAccount.inject] on the way out.
 */
private fun MutableMethod.addSectionInjection() {
    val body = implementation ?: throw IllegalStateException(
        "Account section list builder has no body to patch.",
    )

    val returnIndex = body.instructions.indexOfLast { instruction ->
        instruction.opcode == Opcode.RETURN_OBJECT
    }
    if (returnIndex < 0) {
        throw IllegalStateException("Account section list builder does not return a list.")
    }

    // Replace the return in place. The label that ends the section loop is attached to this
    // instruction, and replacing it keeps the label on the location, so the injected call
    // becomes the target of the branch that leaves the loop.
    replaceInstruction(
        returnIndex,
        "invoke-static {v0}, $MORPHE_ACCOUNT->inject(Ljava/util/List;)Ljava/util/List;",
    )
    addInstructions(
        returnIndex + 1,
        """
            move-result-object v0
            return-object v0
        """.trimIndent(),
    )
}

/**
 * Routes the link of a clicked row through [MorpheAccount.route] before the app reads it.
 */
private fun MutableMethod.addRowRouting() {
    addInstructions(
        0,
        """
            invoke-static {p1}, $MORPHE_ACCOUNT->route(Ljava/lang/String;)Ljava/lang/String;
            move-result-object p1
        """.trimIndent(),
    )
}
