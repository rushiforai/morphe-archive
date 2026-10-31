package l00;

import android.content.Context;
import android.graphics.Bitmap;
import kotlin.jvm.internal.Intrinsics;
import p1.y2;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final Context f72981a;

    /* renamed from: b, reason: collision with root package name */
    public final Bitmap f72982b;

    /* renamed from: c, reason: collision with root package name */
    public final a00.b f72983c;

    /* renamed from: d, reason: collision with root package name */
    public final y2 f72984d;

    /* renamed from: e, reason: collision with root package name */
    public final y2 f72985e;

    /* renamed from: f, reason: collision with root package name */
    public final q00.l f72986f;

    /* renamed from: g, reason: collision with root package name */
    public final q00.l f72987g;

    public p(Context context, Bitmap bitmap, a00.b bVar, y2 y2Var, y2 y2Var2, q00.l lVar, q00.l lVar2) {
        this.f72981a = context;
        this.f72982b = bitmap;
        this.f72983c = bVar;
        this.f72984d = y2Var;
        this.f72985e = y2Var2;
        this.f72986f = lVar;
        this.f72987g = lVar2;
    }

    public final q00.l a() {
        return this.f72987g;
    }

    public final Bitmap b() {
        return this.f72982b;
    }

    public final Context c() {
        return this.f72981a;
    }

    public final a00.b d() {
        return this.f72983c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f72981a, pVar.f72981a) && Intrinsics.b(this.f72982b, pVar.f72982b) && Intrinsics.b(this.f72983c, pVar.f72983c) && Intrinsics.b(this.f72984d, pVar.f72984d) && Intrinsics.b(this.f72985e, pVar.f72985e) && Intrinsics.b(this.f72986f, pVar.f72986f) && Intrinsics.b(this.f72987g, pVar.f72987g);
    }

    public final int hashCode() {
        int iHashCode = this.f72981a.hashCode() * 31;
        Bitmap bitmap = this.f72982b;
        int iHashCode2 = (iHashCode + (bitmap == null ? 0 : bitmap.hashCode())) * 31;
        a00.b bVar = this.f72983c;
        return this.f72987g.hashCode() + ((this.f72986f.hashCode() + ((this.f72985e.hashCode() + ((this.f72984d.hashCode() + ((iHashCode2 + (bVar != null ? bVar.hashCode() : 0)) * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "MediaPlayerDataModel(context=" + this.f72981a + ", artwork=" + this.f72982b + ", media=" + this.f72983c + ", cardBackground=" + this.f72984d + ", playPauseBackground=" + this.f72985e + ", preferSmallView=" + this.f72986f + ", actions=" + this.f72987g + ")";
    }
}
