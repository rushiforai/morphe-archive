package qw;

import android.graphics.Bitmap;
import android.util.LruCache;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends LruCache {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f84339a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ e(int i5, int i11) {
        super(i5);
        this.f84339a = i11;
    }

    @Override // android.util.LruCache
    public final int sizeOf(Object obj, Object obj2) {
        switch (this.f84339a) {
            case 0:
                String key = (String) obj;
                j image = (j) obj2;
                Intrinsics.g(key, "key");
                Intrinsics.g(image, "image");
                return image.f84351b.getByteCount() / 1024;
            default:
                String key2 = (String) obj;
                Bitmap bitmap = (Bitmap) obj2;
                Intrinsics.g(key2, "key");
                Intrinsics.g(bitmap, "bitmap");
                return bitmap.getByteCount() / 1024;
        }
    }
}
