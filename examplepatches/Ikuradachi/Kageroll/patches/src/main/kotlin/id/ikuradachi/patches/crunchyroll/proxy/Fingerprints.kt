package id.ikuradachi.patches.crunchyroll.proxy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object TokenCallFactoryFingerprint : Fingerprint(
    definingClass = "Lokhttp3/OkHttpClient;",
    name = "newCall",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lokhttp3/Request;"),
    returnType = "Lokhttp3/Call;",
    filters = listOf(
        string("request"),
        newInstance("Lokhttp3/internal/connection/RealCall;"),
        methodCall(smali = "Lokhttp3/internal/connection/RealCall;-><init>(Lokhttp3/OkHttpClient;Lokhttp3/Request;Z)V"),
    ),
)

object TokenHttpErrorFingerprint : Fingerprint(
    definingClass = "Lcom/ellation/crunchyroll/api/etp/error/HttpErrorInterceptor;",
    name = "intercept",
    accessFlags = listOf(AccessFlags.PUBLIC),
    parameters = listOf("Lokhttp3/Interceptor\$Chain;"),
    returnType = "Lokhttp3/Response;",
    filters = listOf(
        methodCall(smali = "Lokhttp3/Interceptor\$Chain;->request()Lokhttp3/Request;"),
        methodCall(smali = "Lokhttp3/Interceptor\$Chain;->proceed(Lokhttp3/Request;)Lokhttp3/Response;"),
        methodCall(smali = "Lokhttp3/Response;->isSuccessful()Z"),
        methodCall(smali = "Lokhttp3/Response;->code()I"),
        string("auth.obtain_access_token.oauth2_error"),
        string("invalid_grant"),
        methodCall(smali = "Lcom/ellation/crunchyroll/api/etp/error/NetworkClientException\$Companion;->from(Ljava/lang/Throwable;Lokhttp3/Request;)Ljava/lang/Throwable;"),
    ),
)
