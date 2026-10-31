package dy;

import android.graphics.Bitmap;
import java.lang.ref.SoftReference;

/* loaded from: classes4.dex */
public final class a extends SoftReference {

    /* renamed from: a, reason: collision with root package name */
    public int f49825a;

    @Override // java.lang.ref.SoftReference, java.lang.ref.Reference
    /* renamed from: a, reason: merged with bridge method [inline-methods] */
    public final Bitmap get() {
        this.f49825a++;
        return (Bitmap) super.get();
    }

    public final Bitmap b() {
        return (Bitmap) super.get();
    }
}
