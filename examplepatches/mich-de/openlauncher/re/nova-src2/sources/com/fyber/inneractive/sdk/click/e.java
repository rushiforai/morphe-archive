package com.fyber.inneractive.sdk.click;

import android.net.Uri;
import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.j0;
import com.fyber.inneractive.sdk.network.f0;
import h6.c1;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes3.dex */
public final class e implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ List f27706a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Uri f27707b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ g f27708c;

    public e(g gVar, List list, Uri uri) {
        this.f27708c = gVar;
        this.f27706a = list;
        this.f27707b = uri;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        c cVar = (c) obj;
        if (this.f27708c.f27714f) {
            return;
        }
        if (exc != null || cVar == null) {
            String string = this.f27707b.toString();
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            com.fyber.inneractive.sdk.util.r.f31216b.post(new j0(string, null));
            Uri uri = this.f27707b;
            this.f27708c.getClass();
            b bVarA = r.a(uri.toString(), "IgniteGooglePlay", "failed getting redirects");
            List list = this.f27706a;
            if (list != null) {
                list.add(new j(this.f27707b.toString(), false, q.INTERNAL_REDIRECT, "failed getting redirects. ignite click handler"));
                List list2 = this.f27706a;
                bVarA.f27702f.clear();
                bVarA.f27702f.addAll(list2);
            }
            g gVar = this.f27708c;
            f fVar = gVar.f27711c;
            if (fVar != null) {
                fVar.a(bVarA, gVar.f27712d, gVar.f27713e);
                return;
            }
            return;
        }
        if (cVar.f27703a.size() > 0) {
            String str = (String) c1.l(cVar.f27703a, 1);
            if (this.f27706a != null) {
                Iterator it = cVar.f27703a.iterator();
                while (it.hasNext()) {
                    String str2 = (String) it.next();
                    if (!TextUtils.equals(str2, str)) {
                        this.f27706a.add(new j(str2, true, q.INTERNAL_REDIRECT, null));
                    }
                }
                List list3 = this.f27706a;
                q qVar = q.OPEN_INTERNAL_STORE;
                list3.add(new j(str, true, qVar, null));
                this.f27708c.getClass();
                b bVar = new b(str, qVar, "IgniteGooglePlay", null);
                List list4 = this.f27706a;
                bVar.f27702f.clear();
                bVar.f27702f.addAll(list4);
                g gVar2 = this.f27708c;
                f fVar2 = gVar2.f27711c;
                if (fVar2 != null) {
                    fVar2.a(bVar, gVar2.f27712d, gVar2.f27713e);
                }
            }
            if (str.startsWith("market")) {
                String strReplace = str.replace("market://details?id=", "https://play.google.com/store/apps/details?id=");
                IAConfigManager iAConfigManager2 = IAConfigManager.Q;
                com.fyber.inneractive.sdk.util.r.f31216b.post(new j0(strReplace, null));
            } else {
                String str3 = cVar.f27704b;
                IAConfigManager iAConfigManager3 = IAConfigManager.Q;
                com.fyber.inneractive.sdk.util.r.f31216b.post(new j0(str, str3));
            }
        }
    }
}
