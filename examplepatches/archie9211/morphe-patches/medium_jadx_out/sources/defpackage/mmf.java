package defpackage;

import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mmf extends bof {
    public final /* synthetic */ int n;
    public final frf o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mmf(zb0 zb0Var, String str, int i) {
        super(2);
        this.n = i;
        switch (i) {
            case 2:
                super(2);
                vp7.q("credential cannot be null", zb0Var);
                this.o = gq7.b0(zb0Var, str);
                break;
            default:
                vp7.q("credential cannot be null", zb0Var);
                frf frfVarB0 = gq7.b0(zb0Var, str);
                frfVarB0.j = false;
                this.o = frfVarB0;
                break;
        }
    }

    @Override // defpackage.bof
    public final String a() {
        switch (this.n) {
            case 0:
                return "linkFederatedCredential";
            case 1:
                return "reauthenticateWithCredentialWithData";
            default:
                return "signInWithCredential";
        }
    }

    @Override // defpackage.bof
    public final void c(wfd wfdVar, hnf hnfVar) {
        int i = this.n;
        frf frfVar = this.o;
        ujf ujfVar = this.b;
        int i2 = 8;
        switch (i) {
            case 0:
                this.g = new d2f(this, i2, wfdVar);
                String strE = this.d.a.e();
                hnfVar.getClass();
                vp7.n(strE);
                frf frfVar2 = this.o;
                vp7.p(frfVar2);
                vp7.p(ujfVar);
                ujf ujfVar2 = hnfVar.a;
                zjf zjfVar = new zjf(ujfVar, hnf.b);
                vp7.n(strE);
                ujfVar2.p(strE, new vwa(20, ujfVar2, frfVar2, zjfVar, false));
                break;
            case 1:
                this.g = new d2f(this, i2, wfdVar);
                hnfVar.c(frfVar, ujfVar);
                break;
            default:
                this.g = new d2f(this, i2, wfdVar);
                hnfVar.c(frfVar, ujfVar);
                break;
        }
    }

    @Override // defpackage.bof
    public final void e() {
        switch (this.n) {
            case 0:
                xmf xmfVarZ0 = d2f.z0(this.c, this.i);
                this.e.a(this.h, xmfVarZ0);
                f(new ctg(xmfVarZ0));
                break;
            case 1:
                xmf xmfVarZ02 = d2f.z0(this.c, this.i);
                if (!this.d.b.a.equalsIgnoreCase(xmfVarZ02.b.a)) {
                    d(new Status(17024, null, null, null));
                } else {
                    this.e.a(this.h, xmfVarZ02);
                    f(new ctg(xmfVarZ02));
                }
                break;
            default:
                xmf xmfVarZ03 = d2f.z0(this.c, this.i);
                this.e.a(this.h, xmfVarZ03);
                f(new ctg(xmfVarZ03));
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public mmf(zb0 zb0Var) {
        super(2);
        this.n = 0;
        vp7.q("credential cannot be null", zb0Var);
        this.o = gq7.b0(zb0Var, null);
    }
}
