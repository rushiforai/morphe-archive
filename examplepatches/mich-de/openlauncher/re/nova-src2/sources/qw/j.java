package qw;

import android.graphics.Bitmap;
import java.util.Iterator;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final i f84350a;

    /* renamed from: b, reason: collision with root package name */
    public final Bitmap f84351b;

    public j(String str, Bitmap bitmap) {
        Object next;
        Iterator it = g.f84347f.iterator();
        while (true) {
            if (!it.hasNext()) {
                next = null;
                break;
            } else {
                next = it.next();
                if (((g) next).f84348a.equals(str)) {
                    break;
                }
            }
        }
        i iVar = (g) next;
        this.f84350a = iVar == null ? new h(str) : iVar;
        this.f84351b = bitmap;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.f84350a, jVar.f84350a) && Intrinsics.b(this.f84351b, jVar.f84351b);
    }

    public final int hashCode() {
        return this.f84351b.hashCode() + (this.f84350a.hashCode() * 31);
    }

    public final String toString() {
        return "LoadedImage(contentType=" + this.f84350a + ", bitmap=" + this.f84351b + ")";
    }
}
