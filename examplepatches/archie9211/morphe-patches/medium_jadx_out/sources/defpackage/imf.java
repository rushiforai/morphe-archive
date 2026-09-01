package defpackage;

import android.text.TextUtils;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.UnknownHostException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class imf extends bof {
    public final /* synthetic */ int n;
    public final Object o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public imf(String str, int i) {
        super(1);
        this.n = i;
        switch (i) {
            case 1:
                super(10);
                vp7.n("RECAPTCHA_ENTERPRISE");
                this.o = new e1g(str, 5);
                break;
            default:
                vp7.o(str, "refresh token cannot be null");
                this.o = str;
                break;
        }
    }

    @Override // defpackage.bof
    public final String a() {
        switch (this.n) {
            case 0:
                return "getAccessToken";
            case 1:
                return "getRecaptchaConfig";
            case 2:
                return "linkPhoneAuthCredential";
            default:
                return "linkEmailAuthCredential";
        }
    }

    @Override // defpackage.bof
    public final void c(wfd wfdVar, hnf hnfVar) {
        int i = this.n;
        ujf ujfVar = this.b;
        Object obj = this.o;
        int i2 = 8;
        switch (i) {
            case 0:
                this.g = new d2f(this, i2, wfdVar);
                String str = (String) obj;
                hnfVar.getClass();
                vp7.n(str);
                vp7.p(ujfVar);
                ujf ujfVar2 = hnfVar.a;
                zjf zjfVar = new zjf(ujfVar, hnf.b);
                vp7.n(str);
                d2f d2fVar = new d2f(str);
                bh4 bh4Var = (bh4) ujfVar2.b;
                wjc wjcVar = new wjc(ujfVar2, zjfVar);
                unf unfVar = (unf) bh4Var.d;
                qk7.D(unfVar.t("/token", (String) bh4Var.a), d2fVar, wjcVar, new zpf(), (o2b) unfVar.b);
                break;
            case 1:
                this.g = new d2f(this, i2, wfdVar);
                e1g e1gVar = (e1g) obj;
                hnfVar.getClass();
                vp7.p(e1gVar);
                ujf ujfVar3 = hnfVar.a;
                zjf zjfVar2 = new zjf(ujfVar, hnf.b);
                bh4 bh4Var2 = (bh4) ujfVar3.b;
                ujf ujfVar4 = new ujf(ujfVar3, 6, zjfVar2);
                unf unfVar2 = (unf) bh4Var2.c;
                String strConcat = unfVar2.t("/recaptchaConfig", (String) bh4Var2.a).concat("&clientType=CLIENT_TYPE_ANDROID&version=RECAPTCHA_ENTERPRISE");
                String str2 = e1gVar.b;
                if (str2 != null && !str2.isEmpty()) {
                    strConcat = ev6.x(strConcat, "&tenantId=", str2);
                }
                bqf bqfVar = new bqf();
                o2b o2bVar = (o2b) unfVar2.b;
                try {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(strConcat).openConnection();
                    httpURLConnection.setConnectTimeout(60000);
                    o2bVar.U(httpURLConnection);
                    qk7.E(httpURLConnection, ujfVar4, bqfVar);
                } catch (SocketTimeoutException unused) {
                    ujfVar4.mo105a("TIMEOUT");
                    return;
                } catch (UnknownHostException unused2) {
                    ujfVar4.mo105a("<<Network Error>>");
                    return;
                } catch (IOException e) {
                    ujfVar4.mo105a(e.getMessage());
                    return;
                }
                break;
            case 2:
                this.g = new d2f(this, i2, wfdVar);
                String strE = this.d.a.e();
                ft2 ft2VarY = dl7.y((c99) obj);
                vp7.n(strE);
                hnfVar.getClass();
                vp7.p(ujfVar);
                vp7.n(strE);
                ujf ujfVar5 = hnfVar.a;
                zjf zjfVar3 = new zjf(ujfVar, hnf.b);
                vp7.n(strE);
                ujfVar5.p(strE, new vwa(18, ujfVar5, ft2VarY, zjfVar3, false));
                break;
            default:
                this.g = new d2f(this, i2, wfdVar);
                qw3 qw3Var = (qw3) obj;
                xmf xmfVar = this.d;
                qw3Var.getClass();
                qw3Var.d = xmfVar.a.e();
                qw3Var.e = true;
                hnfVar.b(new fpf(qw3Var, null, null), ujfVar);
                break;
        }
    }

    @Override // defpackage.bof
    public final void e() {
        switch (this.n) {
            case 0:
                if (TextUtils.isEmpty(this.h.a)) {
                    zpf zpfVar = this.h;
                    String str = (String) this.o;
                    zpfVar.getClass();
                    vp7.n(str);
                    zpfVar.a = str;
                }
                this.e.a(this.h, this.d);
                f(gwf.a(this.h.b));
                break;
            case 1:
                f(this.l);
                break;
            case 2:
                xmf xmfVarZ0 = d2f.z0(this.c, this.i);
                this.e.a(this.h, xmfVarZ0);
                f(new ctg(xmfVarZ0));
                break;
            default:
                xmf xmfVarZ02 = d2f.z0(this.c, this.i);
                this.e.a(this.h, xmfVarZ02);
                f(new ctg(xmfVarZ02));
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ imf(zb0 zb0Var, int i) {
        super(2);
        this.n = i;
        this.o = zb0Var;
    }
}
