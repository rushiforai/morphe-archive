package ads_mobile_sdk;

import android.content.Context;
import b.o2;
import b.x3;
import b.x7;
import java.util.concurrent.ExecutorService;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class az1 implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final b.m5 f1200a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f1201b;

    /* renamed from: c, reason: collision with root package name */
    public final hb1 f1202c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f1203d;

    public /* synthetic */ az1(hb1 hb1Var, b.m5 m5Var, b.m5 m5Var2, int i5) {
        this.f1203d = i5;
        this.f1202c = hb1Var;
        this.f1200a = m5Var;
        this.f1201b = m5Var2;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f1203d) {
            case 0:
                return new zy1((jr0) this.f1200a.get(), (zt1) this.f1201b.get(), (qw2) this.f1202c.f4276a);
            case 1:
                return new bp3((Context) this.f1200a.get(), (o2) this.f1201b.get(), (ExecutorService) this.f1202c.f4276a);
            case 2:
                return new s92((o2) this.f1200a.get(), (vi3) this.f1201b.get(), ((j7) this.f1202c.f4276a).L().s());
            case 3:
                return new ja2((Context) this.f1202c.f4276a, ((Integer) this.f1200a.get()).intValue(), (b41) this.f1201b.get());
            case 4:
                return new kw2((iw2) this.f1200a.get(), (ni.q) this.f1202c.f4276a, (qw2) this.f1201b.get());
            case 5:
                return new ln3((Context) this.f1202c.f4276a, (String) this.f1200a.get(), (qq0) this.f1201b.get());
            case 6:
                return new oc3((gm2) this.f1200a.get(), (ExecutorService) this.f1202c.f4276a, (vi3) this.f1201b.get());
            case 7:
                Context context = (Context) this.f1202c.f4276a;
                bs3 webViewProfileNameHelper = (bs3) this.f1200a.get();
                jr0 flags = (jr0) this.f1201b.get();
                Intrinsics.g(context, "context");
                Intrinsics.g(webViewProfileNameHelper, "webViewProfileNameHelper");
                Intrinsics.g(flags, "flags");
                return new x7(context, webViewProfileNameHelper, flags);
            default:
                return new b.ya("JnKlh6qRr9Q9w0ne7V+3ZmP88d0S4hOBZW6VJY9+TenJpQccO7Nfzmt8LyU8YTNl", "lY7HeDO3WqFVABSCibQAUaeQQmrbgI8tZ44V9b84yFY=", (x3) this.f1202c.f4276a, (rp1) this.f1200a.get(), ((vi3) this.f1201b.get()).a(yk0.EVENT_ID_DEVICE_INFO_SIGNALS_TASK));
        }
    }

    public /* synthetic */ az1(b.m5 m5Var, hb1 hb1Var, b.m5 m5Var2, int i5) {
        this.f1203d = i5;
        this.f1200a = m5Var;
        this.f1202c = hb1Var;
        this.f1201b = m5Var2;
    }

    public /* synthetic */ az1(b.m5 m5Var, b.m5 m5Var2, hb1 hb1Var, int i5) {
        this.f1203d = i5;
        this.f1200a = m5Var;
        this.f1201b = m5Var2;
        this.f1202c = hb1Var;
    }
}
