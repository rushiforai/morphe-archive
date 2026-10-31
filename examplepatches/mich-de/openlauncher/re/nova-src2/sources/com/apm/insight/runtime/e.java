package com.apm.insight.runtime;

import com.apm.insight.entity.Header;

/* loaded from: classes2.dex */
public class e {

    /* renamed from: b, reason: collision with root package name */
    private static final e f21879b = new e() { // from class: com.apm.insight.runtime.e.1

        /* renamed from: a, reason: collision with root package name */
        private Header f21881a = null;

        @Override // com.apm.insight.runtime.e
        public final Object b(String str) {
            if (this.f21881a == null) {
                this.f21881a = Header.b(com.apm.insight.e.g());
            }
            return this.f21881a.f().opt(str);
        }
    };

    /* renamed from: a, reason: collision with root package name */
    private e f21880a;

    public e() {
        this(f21879b);
    }

    public Object a(String str) {
        e eVar = this.f21880a;
        if (eVar != null) {
            return eVar.a(str);
        }
        return null;
    }

    public Object b(String str) {
        e eVar = this.f21880a;
        if (eVar != null) {
            return eVar.b(str);
        }
        return null;
    }

    private e(e eVar) {
        this.f21880a = eVar;
    }
}
