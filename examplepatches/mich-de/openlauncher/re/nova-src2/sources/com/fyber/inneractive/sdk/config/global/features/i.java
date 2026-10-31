package com.fyber.inneractive.sdk.config.global.features;

import java.util.HashMap;
import java.util.Iterator;

/* loaded from: classes.dex */
public abstract class i extends com.fyber.inneractive.sdk.config.global.p {

    /* renamed from: b, reason: collision with root package name */
    public String f27818b;

    /* renamed from: c, reason: collision with root package name */
    public HashMap f27819c = new HashMap();

    /* renamed from: d, reason: collision with root package name */
    public HashMap f27820d = new HashMap();

    public i(String str) {
        this.f27818b = str;
    }

    @Override // com.fyber.inneractive.sdk.config.global.p, com.fyber.inneractive.sdk.config.global.n
    public final String a(String str, String str2) {
        String strB;
        Iterator it = this.f27820d.keySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                strB = null;
                break;
            }
            strB = ((com.fyber.inneractive.sdk.config.global.k) this.f27820d.get((String) it.next())).b(str);
            if (strB != null) {
                break;
            }
        }
        if (strB != null) {
            return strB;
        }
        com.fyber.inneractive.sdk.config.global.n nVar = this.f27833a;
        return nVar != null ? nVar.a(str, str2) : str2;
    }

    public abstract i b();

    @Override // com.fyber.inneractive.sdk.config.global.p, com.fyber.inneractive.sdk.config.global.n
    public final String b(String str) {
        return a(str, null);
    }

    @Override // com.fyber.inneractive.sdk.config.global.p, com.fyber.inneractive.sdk.config.global.n
    public final Boolean c(String str) {
        Boolean boolC;
        Iterator it = this.f27820d.keySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                boolC = null;
                break;
            }
            boolC = ((com.fyber.inneractive.sdk.config.global.k) this.f27820d.get((String) it.next())).c(str);
            if (boolC != null) {
                break;
            }
        }
        return boolC == null ? super.c(str) : boolC;
    }

    public final String toString() {
        return String.format("id: %s, params: %s exp: %s", this.f27818b, this.f27833a, this.f27819c);
    }

    @Override // com.fyber.inneractive.sdk.config.global.p, com.fyber.inneractive.sdk.config.global.n
    public final Integer a(String str) {
        Integer numA;
        Iterator it = this.f27820d.keySet().iterator();
        while (true) {
            if (!it.hasNext()) {
                numA = null;
                break;
            }
            numA = ((com.fyber.inneractive.sdk.config.global.k) this.f27820d.get((String) it.next())).a(str);
            if (numA != null) {
                break;
            }
        }
        return numA == null ? super.a(str) : numA;
    }

    public final void a(i iVar) {
        iVar.f27818b = this.f27818b;
        iVar.f27833a = this.f27833a;
        iVar.f27819c = new HashMap(this.f27819c);
        iVar.f27820d = new HashMap(this.f27820d);
    }
}
