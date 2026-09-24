package hooman.morphe.patches.twitch.player

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object IvsPlayerWrapperConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Application;",
        "Ltr9;",
        "Lcom/amazonaws/ivs/player/MediaPlayer\$Builder;",
        "Ln8m;",
        "Lhxm;",
        "Lei4;",
        "Lesh;",
        "Lvj20;",
        "Lkv10;",
        "Ljbj;",
    ),
    custom = { _, classDef -> classDef.type == "Lgq9;" },
)

object MainPlayerViewDelegateConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf("Landroidx/fragment/app/o;", "Landroid/view/View;", "Lyw2;", "Ltoy;", "Ld1l;", "Le4r;", "Ll210;"),
    custom = { _, classDef -> classDef.type == "Lg1r;" },
)
