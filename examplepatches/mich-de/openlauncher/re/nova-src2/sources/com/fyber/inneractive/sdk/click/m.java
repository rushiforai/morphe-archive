package com.fyber.inneractive.sdk.click;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.network.f0;
import h6.c1;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class m implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f27725a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ String f27726b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ r f27727c;

    public m(r rVar, String str, String str2) {
        this.f27727c = rVar;
        this.f27725a = str;
        this.f27726b = str2;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        c cVar = (c) obj;
        if (this.f27727c.f27735f) {
            return;
        }
        if (exc != null) {
            r.a(this.f27727c, null, this.f27725a, this.f27726b, exc);
            return;
        }
        if (cVar != null) {
            String str = this.f27725a;
            if (cVar.f27703a.size() > 1) {
                str = (String) c1.l(cVar.f27703a, 1);
            }
            b bVarA = this.f27727c.a(str);
            if ((bVarA == null || bVarA.f27697a == q.FAILED) && !TextUtils.isEmpty(cVar.f27704b)) {
                r rVar = this.f27727c;
                rVar.getClass();
                Iterator it = cVar.f27703a.iterator();
                while (it.hasNext()) {
                    String str2 = (String) it.next();
                    if (!TextUtils.equals(str2, str)) {
                        rVar.f27736g.add(new j(str2, true, q.INTERNAL_REDIRECT, null));
                    }
                }
                r.a(this.f27727c, cVar.f27704b, str, this.f27726b, null);
                return;
            }
            r rVar2 = this.f27727c;
            rVar2.getClass();
            Iterator it2 = cVar.f27703a.iterator();
            while (it2.hasNext()) {
                String str3 = (String) it2.next();
                if (!TextUtils.equals(str3, str)) {
                    rVar2.f27736g.add(new j(str3, false, q.INTERNAL_REDIRECT, null));
                }
            }
            if (this.f27727c.f27736g.size() == 0) {
                this.f27727c.f27736g.add(new j(str, false, q.INTERNAL_REDIRECT, null));
            }
            this.f27727c.a(r.a(str, "followRedirects", "Invalid response"));
        }
    }
}
