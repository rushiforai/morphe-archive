package com.fyber.inneractive.sdk.flow.storepromo.loader;

import b.c0;
import com.fyber.inneractive.sdk.util.r;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ d f28315a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ f f28316b;

    public e(f fVar, d dVar) {
        this.f28316b = fVar;
        this.f28315a = dVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        com.fyber.inneractive.sdk.flow.storepromo.model.c cVar;
        f fVar = this.f28316b;
        if (fVar.f28322f == null || (cVar = fVar.f28318b) == null) {
            return;
        }
        d dVar = this.f28315a;
        StringBuilder sb2 = new StringBuilder("\n<script>\n");
        ArrayList arrayList = cVar.f28363a;
        StringBuilder sb3 = new StringBuilder();
        Iterator it = arrayList.iterator();
        boolean z11 = false;
        int i5 = 0;
        int i11 = 0;
        while (it.hasNext()) {
            com.fyber.inneractive.sdk.flow.storepromo.model.a aVar = (com.fyber.inneractive.sdk.flow.storepromo.model.a) it.next();
            int i12 = h.f28332a[aVar.f28360a.ordinal()];
            if (i12 == 1) {
                i5++;
                String str = i.f28333a;
                String str2 = String.format("app_screen_%d", Integer.valueOf(i5));
                sb3.append(c0.s(c0.w("var ", str2, "_el = document.createElement('img');\n", str2, "_el.id = '"), str2, "';\ndocument.getElementById('carousel').appendChild(", str2, "_el);\n"));
                sb3.append(String.format(i.f28333a, Integer.valueOf(i5), aVar.f28361b));
                sb3.append(String.format(i.f28334b, Integer.valueOf(i5), Integer.valueOf(i5)));
            } else if (i12 == 2) {
                i11++;
                String str3 = i.f28333a;
                String str4 = String.format("app_video_url_%d", Integer.valueOf(i11));
                sb3.append(c0.s(c0.w("var ", str4, "_el = document.createElement('video');\n", str4, "_el.id = '"), str4, "';\ndocument.getElementById('carousel').appendChild(", str4, "_el);\n"));
                sb3.append(String.format(i.f28335c, Integer.valueOf(i11), aVar.f28361b));
                sb3.append(String.format(i.f28336d, Integer.valueOf(i11), Integer.valueOf(i11)));
            } else if (i12 == 3) {
                sb3.append(String.format(i.f28337e, aVar.f28361b));
                sb3.append(i.f28338f);
            } else if (i12 == 4) {
                sb3.append(String.format(i.f28347q, aVar.f28361b));
                sb3.append(i.f28348r);
            }
        }
        sb2.append(sb3.toString());
        sb2.append(String.format(i.f28339g, cVar.f28364b.replace("`", "\\`")) + i.f28340h + String.format(i.f28341i, cVar.f28368f.replace("`", "\\`")) + i.f28342j + String.format(i.f28343k, cVar.f28369g.f28373b.replace("`", "\\`")) + i.f28344l + String.format(i.o, cVar.f28369g.f28372a.replace("`", "\\`")) + i.f28346p + String.format(i.f28345m, cVar.f28369g.f28374c.replace("`", "\\`")) + i.n);
        StringBuilder sb4 = new StringBuilder();
        boolean z12 = Boolean.parseBoolean(cVar.f28366d);
        boolean z13 = Boolean.parseBoolean(cVar.f28367e);
        sb4.append(i.a(z12, "in_app_purchases"));
        sb4.append(i.a(z13, "app_contains_ads"));
        if (z13 && z12) {
            z11 = true;
        }
        sb4.append(i.a(z11, "app_subtitle_separator"));
        sb2.append(sb4.toString());
        sb2.append("</script>");
        String str5 = cVar.f28365c + sb2.toString();
        dVar.getClass();
        r.f31216b.post(new c(dVar, str5));
    }
}
