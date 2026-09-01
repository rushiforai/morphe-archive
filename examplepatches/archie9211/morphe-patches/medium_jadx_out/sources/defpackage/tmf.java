package defpackage;

import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tmf extends bof {
    public final /* synthetic */ int n;
    public final String o;
    public final String p;
    public final String q;
    public final String r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tmf(int i, String str, String str2, String str3, String str4) {
        super(2);
        this.n = i;
        switch (i) {
            case 1:
                super(2);
                vp7.o(str, "email cannot be null or empty");
                vp7.o(str2, "password cannot be null or empty");
                this.o = str;
                this.p = str2;
                this.q = str3;
                this.r = str4;
                break;
            default:
                vp7.o(str, "email cannot be null or empty");
                vp7.o(str2, "password cannot be null or empty");
                this.o = str;
                this.p = str2;
                this.q = str3;
                this.r = str4;
                break;
        }
    }

    @Override // defpackage.bof
    public final String a() {
        switch (this.n) {
            case 0:
                return "reauthenticateWithEmailPasswordWithData";
            default:
                return "signInWithEmailAndPassword";
        }
    }

    @Override // defpackage.bof
    public final void c(wfd wfdVar, hnf hnfVar) {
        switch (this.n) {
            case 0:
                this.g = new d2f(this, 8, wfdVar);
                hnfVar.d(this.o, this.p, this.q, this.r, this.b);
                break;
            default:
                this.g = new d2f(this, 8, wfdVar);
                hnfVar.d(this.o, this.p, this.q, this.r, this.b);
                break;
        }
    }

    @Override // defpackage.bof
    public final void e() {
        switch (this.n) {
            case 0:
                xmf xmfVarZ0 = d2f.z0(this.c, this.i);
                if (!this.d.b.a.equalsIgnoreCase(xmfVarZ0.b.a)) {
                    d(new Status(17024, null, null, null));
                } else {
                    this.e.a(this.h, xmfVarZ0);
                    f(new ctg(xmfVarZ0));
                }
                break;
            default:
                xmf xmfVarZ02 = d2f.z0(this.c, this.i);
                this.e.a(this.h, xmfVarZ02);
                f(new ctg(xmfVarZ02));
                break;
        }
    }
}
