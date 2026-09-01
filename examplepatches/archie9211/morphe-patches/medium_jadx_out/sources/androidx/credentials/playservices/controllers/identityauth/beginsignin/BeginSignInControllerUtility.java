package androidx.credentials.playservices.controllers.identityauth.beginsignin;

import android.content.Context;
import defpackage.dh2;
import defpackage.gy2;
import defpackage.i95;
import defpackage.mq0;
import defpackage.nq0;
import defpackage.oq0;
import defpackage.pq0;
import defpackage.qq0;
import defpackage.rq0;
import defpackage.vp7;
import defpackage.x95;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\b\u0000\u0018\u0000 \u00042\u00020\u0001:\u0001\u0004B\u0007¢\u0006\u0004\b\u0002\u0010\u0003¨\u0006\u0005"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/beginsignin/BeginSignInControllerUtility;", "", "<init>", "()V", "Companion", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
public final class BeginSignInControllerUtility {
    private static final long AUTH_MIN_VERSION_JSON_PARSING = 231815000;
    private static final long AUTH_MIN_VERSION_PREFER_IMME_CRED = 241217000;

    /* JADX INFO: renamed from: Companion, reason: from kotlin metadata */
    public static final Companion INSTANCE = new Companion(null);
    private static final String TAG = "BeginSignInUtility";

    /* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
    @Metadata(d1 = {"\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0006\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0007\u0010\bJ\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\u000b\u0010\fJ\u0017\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u000e\u001a\u00020\rH\u0002¢\u0006\u0004\b\u0010\u0010\u0011J\u001f\u0010\u0017\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u00122\u0006\u0010\u0005\u001a\u00020\u0004H\u0000¢\u0006\u0004\b\u0015\u0010\u0016R\u0014\u0010\u0019\u001a\u00020\u00188\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u0019\u0010\u001aR\u0014\u0010\u001b\u001a\u00020\u00068\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u001b\u0010\u001cR\u0014\u0010\u001d\u001a\u00020\u00068\u0002X\u0082T¢\u0006\u0006\n\u0004\b\u001d\u0010\u001c¨\u0006\u001e"}, d2 = {"Landroidx/credentials/playservices/controllers/identityauth/beginsignin/BeginSignInControllerUtility$Companion;", "", "<init>", "()V", "Landroid/content/Context;", "context", "", "determineDeviceGMSVersionCode", "(Landroid/content/Context;)J", "curAuthVersion", "", "needsBackwardsCompatibleRequest", "(J)Z", "Lx95;", "option", "Lnq0;", "convertToGoogleIdTokenOption", "(Lx95;)Lnq0;", "Li95;", "request", "Lrq0;", "constructBeginSignInRequest$credentials_play_services_auth", "(Li95;Landroid/content/Context;)Lrq0;", "constructBeginSignInRequest", "", "TAG", "Ljava/lang/String;", "AUTH_MIN_VERSION_JSON_PARSING", "J", "AUTH_MIN_VERSION_PREFER_IMME_CRED", "credentials-play-services-auth"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        public /* synthetic */ Companion(gy2 gy2Var) {
            this();
        }

        private final nq0 convertToGoogleIdTokenOption(x95 option) {
            mq0 mq0VarD = nq0.d();
            mq0VarD.c = option.e;
            String str = option.d;
            vp7.n(str);
            mq0VarD.b = str;
            mq0VarD.a = true;
            return mq0VarD.a();
        }

        private final long determineDeviceGMSVersionCode(Context context) {
            context.getPackageManager().getClass();
            return r1.getPackageInfo("com.google.android.gms", 0).versionCode;
        }

        private final boolean needsBackwardsCompatibleRequest(long curAuthVersion) {
            return curAuthVersion < BeginSignInControllerUtility.AUTH_MIN_VERSION_JSON_PARSING;
        }

        public final rq0 constructBeginSignInRequest$credentials_play_services_auth(i95 request, Context context) {
            request.getClass();
            context.getClass();
            qq0 qq0Var = new qq0(false);
            mq0 mq0VarD = nq0.d();
            mq0VarD.a = false;
            nq0 nq0VarA = mq0VarD.a();
            pq0 pq0Var = new pq0(false, null, null);
            oq0 oq0Var = new oq0(false, null);
            determineDeviceGMSVersionCode(context);
            while (true) {
                boolean z = false;
                for (dh2 dh2Var : request.a) {
                    if (dh2Var instanceof x95) {
                        x95 x95Var = (x95) dh2Var;
                        nq0VarA = convertToGoogleIdTokenOption(x95Var);
                        vp7.p(nq0VarA);
                        if (z || x95Var.f) {
                            z = true;
                        }
                    }
                }
                return new rq0(qq0Var, nq0VarA, null, z, 0, pq0Var, oq0Var, false);
            }
        }

        private Companion() {
        }
    }
}
