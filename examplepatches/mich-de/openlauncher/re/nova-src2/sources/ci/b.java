package ci;

import android.content.Context;
import android.os.Bundle;
import android.os.Looper;
import b.u4;
import bh.k;
import bm.t;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.internal.measurement.cb;
import gi.d;
import kotlin.jvm.internal.Intrinsics;
import mg.e;
import qg.g;
import qg.h;
import rg.p;
import sg.l;

/* loaded from: classes3.dex */
public final class b extends ul.b {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f19949b;

    public /* synthetic */ b(int i5) {
        this.f19949b = i5;
    }

    @Override // ul.b
    public qg.c n(Context context, Looper looper, t tVar, Object obj, g gVar, h hVar) {
        switch (this.f19949b) {
            case 0:
                tVar.getClass();
                Integer num = (Integer) tVar.f18115g;
                Bundle bundle = new Bundle();
                bundle.putParcelable("com.google.android.gms.signin.internal.clientRequestedAccount", null);
                if (num != null) {
                    bundle.putInt("com.google.android.gms.common.internal.ClientSettings.sessionId", num.intValue());
                }
                bundle.putBoolean("com.google.android.gms.signin.internal.offlineAccessRequested", false);
                bundle.putBoolean("com.google.android.gms.signin.internal.idTokenRequested", false);
                bundle.putString("com.google.android.gms.signin.internal.serverClientId", null);
                bundle.putBoolean("com.google.android.gms.signin.internal.usePromptModeForAuthCode", true);
                bundle.putBoolean("com.google.android.gms.signin.internal.forceCodeForRefreshToken", false);
                bundle.putString("com.google.android.gms.signin.internal.hostedDomain", null);
                bundle.putString("com.google.android.gms.signin.internal.logSessionId", null);
                bundle.putBoolean("com.google.android.gms.signin.internal.waitForAccessTokenRefresh", false);
                return new di.a(context, looper, tVar, bundle, gVar, hVar);
            case 1:
                throw u4.d(obj);
            case 2:
                return new cb(context, looper, 51, tVar, gVar, hVar);
            case 3:
            case 5:
            default:
                return super.n(context, looper, tVar, obj, gVar, hVar);
            case 4:
                d dVar = (d) obj;
                if (dVar == null) {
                    dVar = new d(new k(3));
                }
                return new th.d(context, looper, tVar, (p) gVar, (p) hVar, dVar.f57681a);
            case 6:
                return new ih.h(context, looper, tVar, (jg.b) obj, (p) gVar, (p) hVar);
            case 7:
                return new e(context, looper, tVar, (GoogleSignInOptions) obj, (p) gVar, (p) hVar);
        }
    }

    @Override // ul.b
    public qg.c o(Context context, Looper looper, t tVar, Object obj, p pVar, p pVar2) {
        switch (this.f19949b) {
            case 3:
                qg.a apiOptions = (qg.a) obj;
                Intrinsics.g(context, "context");
                Intrinsics.g(looper, "looper");
                Intrinsics.g(apiOptions, "apiOptions");
                return new fh.e(context, looper, 352, tVar, pVar, pVar2);
            case 4:
            case 6:
            case 7:
            default:
                return super.o(context, looper, tVar, obj, pVar, pVar2);
            case 5:
                return new ih.d(context, looper, tVar, pVar, pVar2);
            case 8:
                return new kh.a(context, looper, 457, tVar, pVar, pVar2);
            case 9:
                return new oh.h(context, looper, tVar, pVar, pVar2);
            case 10:
                return new ug.a(context, looper, 449, tVar, pVar, pVar2);
            case 11:
                return new ug.e(context, looper, tVar, (l) obj, pVar, pVar2);
        }
    }
}
