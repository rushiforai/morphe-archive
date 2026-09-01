package defpackage;

import java.util.List;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yzb implements xzb, p31 {
    public final xzb a;
    public final String b;
    public final Set c;

    public yzb(xzb xzbVar) {
        xzbVar.getClass();
        this.a = xzbVar;
        this.b = xzbVar.a() + '?';
        this.c = m40.F(xzbVar);
    }

    @Override // defpackage.xzb
    public final String a() {
        return this.b;
    }

    @Override // defpackage.p31
    public final Set b() {
        return this.c;
    }

    @Override // defpackage.xzb
    public final boolean c() {
        return true;
    }

    @Override // defpackage.xzb
    public final int d(String str) {
        str.getClass();
        return this.a.d(str);
    }

    @Override // defpackage.xzb
    public final int e() {
        return this.a.e();
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof yzb) {
            return g76.L(this.a, ((yzb) obj).a);
        }
        return false;
    }

    @Override // defpackage.xzb
    public final String f(int i) {
        return this.a.f(i);
    }

    @Override // defpackage.xzb
    public final List g(int i) {
        return this.a.g(i);
    }

    @Override // defpackage.xzb
    public final List getAnnotations() {
        return this.a.getAnnotations();
    }

    @Override // defpackage.xzb
    public final xzb h(int i) {
        return this.a.h(i);
    }

    public final int hashCode() {
        return this.a.hashCode() * 31;
    }

    @Override // defpackage.xzb
    public final boolean isInline() {
        return this.a.isInline();
    }

    @Override // defpackage.xzb
    public final mo7 j() {
        return this.a.j();
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.a);
        sb.append('?');
        return sb.toString();
    }
}
