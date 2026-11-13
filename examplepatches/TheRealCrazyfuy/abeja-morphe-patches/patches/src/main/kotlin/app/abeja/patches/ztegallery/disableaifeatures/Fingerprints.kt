package app.abeja.patches.ztegallery.disableaifeatures

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object IsSupportAIGenerationFingerprint : Fingerprint(
    definingClass = "Lcom/zte/gallery3d/config/ZteConfig;",
    name = "isSupportAIGeneration",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = emptyList(),
)