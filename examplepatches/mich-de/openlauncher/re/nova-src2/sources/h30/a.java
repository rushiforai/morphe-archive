package h30;

import android.graphics.Bitmap;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f59040a;

    /* renamed from: b, reason: collision with root package name */
    public final int f59041b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f59042c;

    /* renamed from: d, reason: collision with root package name */
    public final int f59043d;

    /* renamed from: e, reason: collision with root package name */
    public final int f59044e;

    public a(int i5, int i11, int i12) {
        this.f59043d = i5;
        this.f59044e = i11;
        this.f59041b = i12;
        this.f59040a = new ArrayList(i12);
        this.f59042c = true;
    }

    public final synchronized Bitmap a() {
        int size;
        f30.f.a(this.f59042c);
        size = this.f59040a.size();
        return size > 0 ? (Bitmap) this.f59040a.remove(size - 1) : null;
    }

    public final void b(Bitmap bitmap) {
        if (bitmap == null) {
            return;
        }
        if (this.f59042c && (bitmap.getWidth() != this.f59043d || bitmap.getHeight() != this.f59044e)) {
            bitmap.recycle();
            return;
        }
        synchronized (this) {
            try {
                if (this.f59040a.size() >= this.f59041b) {
                    this.f59040a.remove(0);
                }
                this.f59040a.add(bitmap);
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public a() {
        this.f59043d = -1;
        this.f59044e = -1;
        this.f59041b = 4;
        this.f59040a = new ArrayList(4);
        this.f59042c = false;
    }
}
