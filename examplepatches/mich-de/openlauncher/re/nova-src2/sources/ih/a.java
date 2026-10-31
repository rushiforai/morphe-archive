package ih;

import android.content.Context;
import android.os.Binder;
import android.os.Parcel;
import android.text.TextUtils;
import b.c0;
import com.google.android.gms.auth.api.identity.BeginSignInResult;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.signin.RevocationBoundService;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.internal.BasePendingResult;
import mg.k;
import org.json.JSONException;
import qg.l;
import rg.r;
import sg.q;
import sg.w;

/* loaded from: classes3.dex */
public final class a extends g {

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ int f61592b = 1;

    /* renamed from: c, reason: collision with root package name */
    public final Object f61593c;

    public a(RevocationBoundService revocationBoundService) {
        super("com.google.android.gms.auth.api.signin.internal.IRevocationService", 0);
        this.f61593c = revocationBoundService;
    }

    @Override // ih.g
    public final boolean V(int i5, Parcel parcel, Parcel parcel2) {
        BasePendingResult lVar;
        String strE;
        int i11 = this.f61592b;
        Object obj = this.f61593c;
        int i12 = 1;
        switch (i11) {
            case 0:
                if (i5 == 1) {
                    Status status = (Status) e.a(parcel, Status.CREATOR);
                    BeginSignInResult beginSignInResult = (BeginSignInResult) e.a(parcel, BeginSignInResult.CREATOR);
                    e.b(parcel);
                    u90.b.c0(status, beginSignInResult, (fi.j) obj);
                    break;
                }
                break;
            default:
                RevocationBoundService revocationBoundService = (RevocationBoundService) obj;
                if (i5 == 1) {
                    Y();
                    mg.a aVarA = mg.a.a(revocationBoundService);
                    GoogleSignInAccount googleSignInAccountB = aVarA.b();
                    GoogleSignInOptions googleSignInOptionsB = GoogleSignInOptions.f31741p;
                    if (googleSignInAccountB != null) {
                        String strE2 = aVarA.e("defaultGoogleSignInAccount");
                        if (TextUtils.isEmpty(strE2) || (strE = aVarA.e(mg.a.f("googleSignInOptions", strE2))) == null) {
                            googleSignInOptionsB = null;
                        } else {
                            try {
                                googleSignInOptionsB = GoogleSignInOptions.b(strE);
                            } catch (JSONException unused) {
                            }
                        }
                    }
                    lg.a aVarC = i30.j.C(revocationBoundService, googleSignInOptionsB);
                    if (googleSignInAccountB != null) {
                        r rVar = aVarC.f84060i;
                        Context context = aVarC.f84052a;
                        boolean z11 = aVarC.f() == 3;
                        k.f76304a.i("Revoking access", new Object[0]);
                        String strE3 = mg.a.a(context).e("refreshToken");
                        k.b(context);
                        if (!z11) {
                            mg.i iVar = new mg.i(rVar, i12);
                            rVar.f85918b.b(1, iVar);
                            lVar = iVar;
                        } else if (strE3 == null) {
                            c00.d dVar = mg.c.f76281c;
                            Status status2 = new Status(4, null, null, null);
                            w.a("Status code must not be SUCCESS", !status2.d());
                            lVar = new l(status2);
                            lVar.C(status2);
                        } else {
                            mg.c cVar = new mg.c(strE3);
                            new Thread(cVar).start();
                            lVar = cVar.f76283b;
                        }
                        lVar.y(new q(lVar, new fi.j(), new b6.b()));
                    } else {
                        aVarC.d();
                    }
                } else if (i5 == 2) {
                    Y();
                    mg.l.x(revocationBoundService).z();
                }
                break;
        }
        return true;
    }

    public void Y() {
        if (!ps.f.k((RevocationBoundService) this.f61593c, Binder.getCallingUid())) {
            throw new SecurityException(c0.i(Binder.getCallingUid(), "Calling UID ", " is not Google Play services."));
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public a(fi.j jVar) {
        super("com.google.android.gms.auth.api.identity.internal.IBeginSignInCallback", 0);
        this.f61593c = jVar;
    }
}
