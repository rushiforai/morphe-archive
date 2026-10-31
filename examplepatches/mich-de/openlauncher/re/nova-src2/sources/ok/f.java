package ok;

import android.os.Bundle;
import android.os.Process;
import com.google.android.play.core.integrity.StandardIntegrityException;
import tk.r;
import tk.s;

/* loaded from: classes3.dex */
public final class f extends ih.g implements r {

    /* renamed from: b, reason: collision with root package name */
    public final fi.j f80468b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ h f80469c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f80470d;

    /* renamed from: e, reason: collision with root package name */
    public final s f80471e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ h f80472f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public f(h hVar, fi.j jVar, byte b11) {
        super(9);
        this.f80469c = hVar;
        attachInterface(this, "com.google.android.play.core.integrity.protocol.IExpressIntegrityServiceCallback");
        this.f80468b = jVar;
    }

    @Override // tk.r
    public void C(Bundle bundle) {
        switch (this.f80470d) {
            case 1:
                Z(bundle);
                this.f80471e.b("onWarmUpExpressIntegrityToken", new Object[0]);
                this.f80472f.f80477d.getClass();
                int i5 = bundle.getInt("error");
                StandardIntegrityException standardIntegrityException = i5 != 0 ? new StandardIntegrityException(null, i5) : null;
                fi.j jVar = this.f80468b;
                if (standardIntegrityException == null) {
                    jVar.c(Long.valueOf(bundle.getLong("warm.up.sid")));
                    break;
                } else {
                    jVar.b(standardIntegrityException);
                    break;
                }
            default:
                Z(bundle);
                break;
        }
    }

    public final void Y(Bundle bundle) {
        this.f80469c.f80478e.c(this.f80468b);
    }

    public final void Z(Bundle bundle) {
        this.f80469c.f80478e.c(this.f80468b);
    }

    @Override // tk.r
    public void e(Bundle bundle) {
        switch (this.f80470d) {
            case 0:
                Y(bundle);
                this.f80471e.b("onRequestExpressIntegrityToken", new Object[0]);
                this.f80472f.f80477d.getClass();
                int i5 = bundle.getInt("error");
                StandardIntegrityException standardIntegrityException = i5 != 0 ? new StandardIntegrityException(null, i5) : null;
                fi.j jVar = this.f80468b;
                if (standardIntegrityException != null) {
                    jVar.b(standardIntegrityException);
                    return;
                }
                bundle.getLong("request.token.sid");
                ("UID: [" + Process.myUid() + "]  PID: [" + Process.myPid() + "] ").getClass();
                String string = bundle.getString("token");
                if (string == null) {
                    throw new NullPointerException("Null token");
                }
                jVar.c(new j(string));
                return;
            default:
                Y(bundle);
                return;
        }
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public f(h hVar, fi.j jVar, int i5) {
        this(hVar, jVar, (byte) 0);
        this.f80470d = i5;
        switch (i5) {
            case 1:
                this.f80472f = hVar;
                this(hVar, jVar, (byte) 0);
                this.f80471e = new s("OnWarmUpIntegrityTokenCallback");
                break;
            default:
                this.f80472f = hVar;
                this.f80471e = new s("OnRequestIntegrityTokenCallback");
                break;
        }
    }
}
