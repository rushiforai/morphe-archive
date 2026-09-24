package app.morphe.patches.bongobdandroidtv.content

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object GetVideoDetailsDataFingerprint : Fingerprint(
    definingClass = "Lsaas/ott/smarttv/ui/details/data/DetailsEndPoint;",
    name = "getVideoDetailsData",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.ABSTRACT),
    returnType = "Lretrofit2/Call;",
    parameters = listOf("Ljava/lang/String;"),
)