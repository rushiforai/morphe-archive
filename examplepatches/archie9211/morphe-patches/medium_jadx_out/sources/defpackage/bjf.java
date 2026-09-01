package defpackage;

import android.accounts.Account;
import android.content.Context;
import android.os.Handler;
import android.os.Parcel;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bjf extends ihf implements ce5, de5 {
    public static final z56 m = ejf.a;
    public final Context f;
    public final Handler g;
    public final z56 h;
    public final Set i;
    public final uz5 j;
    public t9c k;
    public ft2 l;

    public bjf(Context context, tjf tjfVar, uz5 uz5Var) {
        super("com.google.android.gms.signin.internal.ISignInCallbacks", 1);
        this.f = context;
        this.g = tjfVar;
        this.j = uz5Var;
        this.i = (Set) uz5Var.a;
        this.h = m;
    }

    @Override // defpackage.de5
    public final void a(h42 h42Var) {
        this.l.d(h42Var);
    }

    @Override // defpackage.ce5
    public final void c(int i) {
        ft2 ft2Var = this.l;
        uif uifVar = (uif) ((ee5) ft2Var.f).j.get((gz) ft2Var.b);
        if (uifVar != null) {
            if (uifVar.m) {
                uifVar.m(new h42(17, null, null));
            } else {
                uifVar.c(i);
            }
        }
    }

    @Override // defpackage.ce5
    public final void d() {
        t9c t9cVar = this.k;
        t9cVar.getClass();
        boolean z = false;
        try {
            t9cVar.A.getClass();
            Account account = new Account("<<default account>>", "com.google");
            GoogleSignInAccount googleSignInAccountB = "<<default account>>".equals(account.name) ? zrc.a(t9cVar.c).b() : null;
            Integer num = t9cVar.C;
            vp7.p(num);
            xjf xjfVar = new xjf(2, account, num.intValue(), googleSignInAccountB);
            gjf gjfVar = (gjf) t9cVar.h();
            Parcel parcelObtain = Parcel.obtain();
            parcelObtain.writeInterfaceToken(gjfVar.g);
            int i = zif.a;
            parcelObtain.writeInt(1);
            int iC0 = fo7.c0(20293, parcelObtain);
            fo7.a0(parcelObtain, 1, 4);
            parcelObtain.writeInt(1);
            fo7.U(parcelObtain, 2, xjfVar, 0);
            fo7.d0(iC0, parcelObtain);
            parcelObtain.writeStrongBinder(this);
            Parcel parcelObtain2 = Parcel.obtain();
            try {
                gjfVar.f.transact(12, parcelObtain, parcelObtain2, 0);
                parcelObtain2.readException();
            } finally {
                parcelObtain.recycle();
                parcelObtain2.recycle();
            }
        } catch (RemoteException e) {
            Log.w("SignInClientImpl", "Remote service probably died when signIn is called");
            try {
                this.g.post(new p0g(this, new sjf(1, new h42(8, null, null), null), z, 19));
            } catch (RemoteException unused) {
                Log.wtf("SignInClientImpl", "ISignInCallbacks#onSignInComplete should be executed from the same process, unexpected RemoteException.", e);
            }
        }
    }

    @Override // defpackage.ihf
    public final boolean j(int i, Parcel parcel, Parcel parcel2) {
        boolean z = false;
        switch (i) {
            case 3:
                zif.b(parcel);
                break;
            case 4:
                zif.b(parcel);
                break;
            case 5:
            default:
                return false;
            case 6:
                zif.b(parcel);
                break;
            case 7:
                zif.b(parcel);
                break;
            case 8:
                sjf sjfVar = (sjf) zif.a(parcel, sjf.CREATOR);
                zif.b(parcel);
                this.g.post(new p0g(this, sjfVar, z, 19));
                break;
            case 9:
                zif.b(parcel);
                break;
        }
        parcel2.writeNoException();
        return true;
    }
}
