package io.github.xxlc.patches.grok

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

// Tên lớp bị làm rối được ghim theo đúng bản Grok đã đối chiếu smali.
internal object LicenseCheckFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    isStatic = true,
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(string("LicenseClient")),
)

internal object DownloadActionEqualsFingerprint : Fingerprint(
    definingClass = "Le7/s0;",
    name = "equals",
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        opcode(Opcode.INSTANCE_OF),
        fieldAccess(definingClass = "Le7/s0;", name = "a", type = "Le7/o2;", opcode = Opcode.IGET_OBJECT),
    ),
)

internal object PostMenuFingerprint : Fingerprint(
    definingClass = "Lf60/q;",
    name = "u",
    isStatic = true,
    returnType = "Ljava/util/List;",
    parameters = listOf("La7/tb;"),
    filters = listOf(
        methodCall(definingClass = "Lkotlin/collections/CollectionsKt;", name = "listOfNotNull"),
        opcode(Opcode.MOVE_RESULT_OBJECT),
        opcode(Opcode.RETURN_OBJECT),
    ),
)

internal object PostMenuLabelFingerprint : Fingerprint(
    definingClass = "Lg60/me;",
    name = "d",
    isStatic = true,
    returnType = "Lfb/a;",
    parameters = listOf("Le7/h1;"),
    filters = listOf(resourceLiteral(ResourceType.STRING, "grok_media_action_save")),
)

internal object PostActionFingerprint : Fingerprint(
    definingClass = "Ly9/o2;",
    name = "z0",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Le7/h1;", "Lr7/u1;", "Ly2/de;"),
    filters = listOf(
        string("VideoDownload"),
        fieldAccess(definingClass = "Le7/x;", name = "a", opcode = Opcode.SGET_OBJECT),
    ),
)

internal object LibraryClickFingerprint : Fingerprint(
    definingClass = "Ldb/q1;",
    name = "invoke",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.PACKED_SWITCH),
        fieldAccess(definingClass = "La7/o0;", name = "a", opcode = Opcode.SGET_OBJECT),
    ),
)

internal object LibraryButtonsFingerprint : Fingerprint(
    definingClass = "Leb/b;",
    name = "invoke",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;", "Ljava/lang/Object;"),
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "grok_media_action_save"),
        methodCall(definingClass = "Leb/e;", name = "c", returnType = "V"),
    ),
)

internal object LibrarySelectionFingerprint : Fingerprint(
    definingClass = "Ln6/k;",
    name = "y",
    isStatic = false,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(
        fieldAccess(definingClass = "Le7/a;", name = "a", type = "Li7/i;", opcode = Opcode.IGET_OBJECT),
        methodCall(definingClass = "La7/b1;", name = "<init>", parameters = listOf("Lr7/j1;", "Li7/o;")),
        fieldAccess(definingClass = "Lh8/i;", name = "m", type = "Lap0/d;", opcode = Opcode.IGET_OBJECT),
    ),
)
