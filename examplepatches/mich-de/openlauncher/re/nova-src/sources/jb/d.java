package jb;

import android.text.TextUtils;
import b.c0;

/* loaded from: classes2.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final String f69388a;

    /* renamed from: b, reason: collision with root package name */
    public final String f69389b;

    public d(String str, String str2) {
        this.f69388a = str;
        this.f69389b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && d.class == obj.getClass()) {
            d dVar = (d) obj;
            if (TextUtils.equals(this.f69388a, dVar.f69388a) && TextUtils.equals(this.f69389b, dVar.f69389b)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return this.f69389b.hashCode() + (this.f69388a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Header[name=");
        sb2.append(this.f69388a);
        sb2.append(",value=");
        return c0.q(sb2, this.f69389b, "]");
    }
}
