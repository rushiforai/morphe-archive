package defpackage;

import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class umf extends bof {
    public final /* synthetic */ int n;
    public final hha o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public umf(c99 c99Var, int i) {
        super(2);
        this.n = i;
        switch (i) {
            case 1:
                super(2);
                this.o = new hha(c99Var);
                break;
            default:
                c99Var.d = false;
                this.o = new hha(c99Var);
                break;
        }
    }

    @Override // defpackage.bof
    public final String a() {
        switch (this.n) {
            case 0:
                return "reauthenticateWithPhoneCredentialWithData";
            default:
                return "signInWithPhoneNumber";
        }
    }

    @Override // defpackage.bof
    public final void c(wfd wfdVar, hnf hnfVar) {
        int i = this.n;
        ujf ujfVar = this.b;
        hha hhaVar = this.o;
        int i2 = 8;
        switch (i) {
            case 0:
                this.g = new d2f(this, i2, wfdVar);
                hnfVar.a(hhaVar, ujfVar);
                break;
            default:
                this.g = new d2f(this, i2, wfdVar);
                hnfVar.a(hhaVar, ujfVar);
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
