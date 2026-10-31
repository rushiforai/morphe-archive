package dy;

import android.graphics.Bitmap;
import java.lang.ref.SoftReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import mx.p1;

/* loaded from: classes4.dex */
public abstract class e {

    /* renamed from: a, reason: collision with root package name */
    public static final ArrayList f49845a = new ArrayList();

    public static Bitmap a(int i5, int i11) {
        if (!v30.a.f92042f) {
            return null;
        }
        ArrayList arrayList = f49845a;
        synchronized (arrayList) {
            try {
                if (arrayList.size() > 0) {
                    Iterator it = arrayList.iterator();
                    while (it.hasNext()) {
                        Bitmap bitmap = (Bitmap) ((SoftReference) it.next()).get();
                        if (bitmap == null) {
                            it.remove();
                        } else if (bitmap.getWidth() == i5 && bitmap.getHeight() == i11) {
                            it.remove();
                            return bitmap;
                        }
                    }
                }
                return null;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public static Bitmap b(int i5, int i11) {
        Bitmap bitmapA = a(i5, i11);
        if (bitmapA == null) {
            return Bitmap.createBitmap(i5, i11, Bitmap.Config.ARGB_8888);
        }
        bitmapA.eraseColor(0);
        return bitmapA;
    }

    public static void c(Bitmap bitmap) {
        if (v30.a.f92042f) {
            if (!bitmap.isMutable() || bitmap.getConfig() != Bitmap.Config.ARGB_8888) {
                mc0.b bVar = mc0.d.f76206a;
                bVar.r("Nova.BitmapSoftHeap");
                bVar.m("rejecting invalid bitmap %b %s", Boolean.valueOf(bitmap.isMutable()), bitmap.getConfig());
            } else {
                ArrayList arrayList = f49845a;
                synchronized (arrayList) {
                    arrayList.add(new SoftReference(bitmap));
                }
                HashSet hashSet = p1.f77224a;
                synchronized (hashSet) {
                    hashSet.notifyAll();
                }
            }
        }
    }
}
