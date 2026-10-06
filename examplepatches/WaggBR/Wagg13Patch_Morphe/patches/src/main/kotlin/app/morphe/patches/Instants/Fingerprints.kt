package app.morphe.patches.instants

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal object MoonshotOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/moonshot/mainactivity/MoonshotActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object CameraControlButtonFingerprint : Fingerprint(
    definingClass = "LX/OZl;",
    name = "A06",
    returnType = "V",
    parameters = listOf(
        "LX/iaO;",
        "LX/303;",
        "Ljava/lang/String;",
        "Lkotlin/jvm/functions/Function0;",
        "I",
        "I",
        "I",
    ),
)

internal object QuickSnapProcessBitmapFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/quicksnap/camera/domain/QuickSnapCameraViewModel;",
    name = "A02",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/graphics/Bitmap;",
        "Landroid/graphics/Bitmap;",
        "Lcom/instagram/quicksnap/camera/domain/QuickSnapCameraViewModel;",
        "LX/MDt;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "LX/Egp;",
        "J",
    ),
)

// The About screen composable lives in an obfuscated switch lambda (LX/Vbu in 444.0.0.45.108).
// Anchored on its Compose trace string, which is not obfuscated.
internal object AboutSettingsScreenFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;"),
    strings = listOf(
        "com.instagram.moonshot.ui.settings.screen.MoonshotAboutSettingsScreen.<anonymous> (MoonshotAboutSettingsScreen.kt:51)",
    ),
)


// Photo-capture continuation that builds the "archive peek" thumbnail (the small image that
// flies to the archive button after posting) from its second Bitmap parameter.
internal object QuickSnapArchivePeekFingerprint : Fingerprint(
    definingClass = "LX/62E;",
    name = "A01",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/graphics/Bitmap;",
        "Landroid/graphics/Bitmap;",
        "LX/OZM;",
        "LX/46p;",
        "Lcom/instagram/quicksnap/camera/domain/QuickSnapCameraViewModel;",
        "LX/MDt;",
        "Ljava/lang/Object;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/concurrent/atomic/AtomicLong;",
        "LX/Ezq;",
        "J",
        "J",
        "Z",
    ),
)

private const val HOME_ROUTE = "Lcom/instagram/moonshot/navigation/route/MoonshotRoute\$Home;"

private fun Method.checksHomeRoute() = implementation?.instructions?.any { instruction ->
    instruction.opcode == Opcode.INSTANCE_OF &&
        ((instruction as ReferenceInstruction).reference as? TypeReference)?.type == HOME_ROUTE
} == true

// The navigator wrapper (LX/Pop in 444.0.0.45.108) forwards navigation to a delegate and logs it.
// Both methods are anchored on the unobfuscated "standalone_app" string and on the Home route check.
internal object NavigateForwardFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("standalone_app"),
    custom = { method, _ -> method.checksHomeRoute() },
)

internal object NavigateBackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    strings = listOf("back", "standalone_app"),
    custom = { method, _ -> method.checksHomeRoute() },
)
