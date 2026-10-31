package n7;

import android.webkit.WebMessage;
import android.webkit.WebMessagePort;
import com.amplitude.y4;

/* loaded from: classes2.dex */
public final class q extends WebMessagePort.WebMessageCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ y4 f77933a;

    public q(y4 y4Var) {
        this.f77933a = y4Var;
    }

    @Override // android.webkit.WebMessagePort.WebMessageCallback
    public final void onMessage(WebMessagePort webMessagePort, WebMessage webMessage) {
        this.f77933a.onMessage(new r(webMessagePort), new m7.j(webMessage.getData(), r.c(webMessage.getPorts())));
    }
}
