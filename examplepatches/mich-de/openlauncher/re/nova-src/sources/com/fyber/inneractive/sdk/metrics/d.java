package com.fyber.inneractive.sdk.metrics;

import java.util.HashMap;

/* loaded from: classes.dex */
public final class d {

    /* renamed from: d, reason: collision with root package name */
    public static final d f28545d = new d();

    /* renamed from: a, reason: collision with root package name */
    public final HashMap f28546a = new HashMap();

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f28547b = new HashMap();

    /* renamed from: c, reason: collision with root package name */
    public final f f28548c = new f();

    public final g a(String str) {
        try {
            if (str == null) {
                return this.f28548c;
            }
            g gVar = (g) this.f28546a.get(str);
            if (gVar != null) {
                return gVar;
            }
            e eVar = new e();
            this.f28546a.put(str, eVar);
            return eVar;
        } catch (Exception unused) {
            return this.f28548c;
        }
    }

    public final i b(String str) {
        i iVar = (i) this.f28547b.get(str);
        if (iVar == null) {
            iVar = new i();
        }
        this.f28547b.put(str, iVar);
        return iVar;
    }
}
