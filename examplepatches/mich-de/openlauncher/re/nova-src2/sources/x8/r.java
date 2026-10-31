package x8;

import android.graphics.drawable.Drawable;
import b.c0;
import b.c9;
import coil.memory.MemoryCache$Key;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class r extends l {

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f95367a;

    /* renamed from: b, reason: collision with root package name */
    public final k f95368b;

    /* renamed from: c, reason: collision with root package name */
    public final int f95369c;

    /* renamed from: d, reason: collision with root package name */
    public final MemoryCache$Key f95370d;

    /* renamed from: e, reason: collision with root package name */
    public final String f95371e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f95372f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f95373g;

    public r(Drawable drawable, k kVar, int i5, MemoryCache$Key memoryCache$Key, String str, boolean z11, boolean z12) {
        this.f95367a = drawable;
        this.f95368b = kVar;
        this.f95369c = i5;
        this.f95370d = memoryCache$Key;
        this.f95371e = str;
        this.f95372f = z11;
        this.f95373g = z12;
    }

    @Override // x8.l
    public final Drawable a() {
        return this.f95367a;
    }

    @Override // x8.l
    public final k b() {
        return this.f95368b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return Intrinsics.b(this.f95367a, rVar.f95367a) && Intrinsics.b(this.f95368b, rVar.f95368b) && this.f95369c == rVar.f95369c && Intrinsics.b(this.f95370d, rVar.f95370d) && Intrinsics.b(this.f95371e, rVar.f95371e) && this.f95372f == rVar.f95372f && this.f95373g == rVar.f95373g;
    }

    public final int hashCode() {
        int iF = (c0.F(this.f95369c) + ((this.f95368b.hashCode() + (this.f95367a.hashCode() * 31)) * 31)) * 31;
        MemoryCache$Key memoryCache$Key = this.f95370d;
        int iHashCode = (iF + (memoryCache$Key != null ? memoryCache$Key.hashCode() : 0)) * 31;
        String str = this.f95371e;
        return Boolean.hashCode(this.f95373g) + c9.f((iHashCode + (str != null ? str.hashCode() : 0)) * 31, 31, this.f95372f);
    }
}
