package com.iab.omid.library.vungle.attestation;

import android.content.Context;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: d, reason: collision with root package name */
    private static final Map<String, k> f35161d = new HashMap();

    /* renamed from: e, reason: collision with root package name */
    private static volatile c f35162e;

    /* renamed from: a, reason: collision with root package name */
    private final d f35163a = new d();

    /* renamed from: b, reason: collision with root package name */
    private final Context f35164b;

    /* renamed from: c, reason: collision with root package name */
    private volatile List<b> f35165c;

    private c(Context context) {
        this.f35164b = context != null ? context.getApplicationContext() : null;
        c();
    }

    public static c a(Context context) {
        if (f35162e == null) {
            synchronized (c.class) {
                try {
                    if (f35162e == null) {
                        f35162e = new c(context);
                    }
                } finally {
                }
            }
        }
        return f35162e;
    }

    private void c() {
        f35161d.put("FireTVFOSDAT", j.a(this.f35164b));
    }

    public boolean b() {
        return a().size() > 0;
    }

    public List<b> a() {
        List<b> list;
        b bVarA;
        if (this.f35165c != null) {
            return this.f35165c;
        }
        synchronized (this) {
            if (this.f35165c != null) {
                list = this.f35165c;
            } else {
                try {
                    ArrayList arrayList = new ArrayList();
                    for (Map.Entry<String, k> entry : f35161d.entrySet()) {
                        if (entry.getValue().a() && (bVarA = this.f35163a.a(entry.getKey(), this.f35164b)) != null) {
                            arrayList.add(bVarA);
                        }
                    }
                    this.f35165c = arrayList;
                    list = this.f35165c;
                } catch (Exception e3) {
                    com.iab.omid.library.vungle.utils.d.a("Error getting supported attestation mechanisms", e3);
                    this.f35165c = new ArrayList();
                    return this.f35165c;
                }
            }
        }
        return list;
    }

    public boolean a(String str) {
        k kVar = f35161d.get(str);
        if (kVar != null) {
            return kVar.a();
        }
        return false;
    }
}
