package com.bytedance.sdk.component.ycx;

import android.webkit.WebView;
import com.bytedance.sdk.component.ycx.sya;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* loaded from: classes2.dex */
public class syc {

    /* renamed from: dj, reason: collision with root package name */
    private final List<ok> f24139dj;
    private volatile boolean lud;
    private final jw sya;
    private final ycx ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final WebView f24140zb;

    public syc(jw jwVar) {
        ArrayList arrayList = new ArrayList();
        this.f24139dj = arrayList;
        this.lud = false;
        this.sya = jwVar;
        if (jwVar.ycx != null) {
            ycx ycxVar = jwVar.f24130zb;
            if (ycxVar == null) {
                this.ycx = new htf();
            } else {
                this.ycx = ycxVar;
            }
        } else {
            this.ycx = jwVar.f24130zb;
        }
        this.ycx.sya(jwVar);
        this.f24140zb = jwVar.ycx;
        arrayList.add(jwVar.f24125jw);
        uh.ycx(jwVar.f24129ul);
    }

    public static jw ycx(WebView webView) {
        return new jw(webView);
    }

    private void zb() {
        if (this.lud) {
            fby.ycx(new IllegalStateException("JsBridge2 is already released!!!"));
        }
    }

    public syc ycx(String str, dj<?, ?> djVar) {
        return ycx(str, (String) null, djVar);
    }

    public syc ycx(Set<String> set, pmi<?, ?> pmiVar) {
        return ycx(set, (String) null, pmiVar);
    }

    public syc ycx(String str, String str2, dj<?, ?> djVar) {
        zb();
        this.ycx.f24152ul.ycx(str, djVar);
        return this;
    }

    public syc ycx(Set<String> set, String str, pmi<?, ?> pmiVar) {
        zb();
        this.ycx.f24152ul.ycx(set, pmiVar);
        return this;
    }

    public syc ycx(String str, sya.zb zbVar) {
        return ycx(str, (String) null, zbVar);
    }

    public syc ycx(String str, String str2, sya.zb zbVar) {
        zb();
        this.ycx.f24152ul.ycx(str, zbVar);
        return this;
    }

    public void ycx() {
        if (this.lud) {
            return;
        }
        this.ycx.zb();
        this.lud = true;
        Iterator<ok> it = this.f24139dj.iterator();
        while (it.hasNext()) {
            it.next();
        }
    }
}
