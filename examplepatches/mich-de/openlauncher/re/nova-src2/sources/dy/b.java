package dy;

import android.graphics.Bitmap;
import android.os.Message;
import com.google.android.gms.internal.measurement.ag;
import com.teslacoilsw.launcher.theme.AbstractThumbnailPicker;
import com.teslacoilsw.launcher.widget.FixedSizeImageView;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicBoolean;
import mg.l;
import t5.d0;

/* loaded from: classes4.dex */
public final class b implements Runnable {

    /* renamed from: h, reason: collision with root package name */
    public static final io.sentry.internal.debugmeta.c f49826h;

    /* renamed from: a, reason: collision with root package name */
    public int f49827a;

    /* renamed from: b, reason: collision with root package name */
    public FixedSizeImageView f49828b;

    /* renamed from: c, reason: collision with root package name */
    public Bitmap f49829c;

    /* renamed from: d, reason: collision with root package name */
    public d f49830d;

    /* renamed from: e, reason: collision with root package name */
    public AtomicBoolean f49831e;

    /* renamed from: f, reason: collision with root package name */
    public b f49832f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f49833g;

    static {
        ag agVar = new ag();
        io.sentry.internal.debugmeta.c cVar = new io.sentry.internal.debugmeta.c();
        cVar.f67327a = agVar;
        cVar.f67328b = cVar;
        f49826h = cVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Bitmap bitmap;
        l lVar;
        AbstractThumbnailPicker abstractThumbnailPicker;
        u20.d dVar;
        if (this.f49830d.b(this)) {
            l lVar2 = (l) this.f49830d.f49841d;
            Bitmap bitmapG = null;
            Bitmap bitmapL = lVar2 != null ? lVar2.l(this.f49827a) : null;
            this.f49829c = bitmapL;
            if (bitmapL == null && this.f49830d.b(this)) {
                d dVar2 = this.f49830d;
                d0 d0Var = (d0) dVar2.f49840c;
                int i5 = this.f49827a;
                AtomicBoolean atomicBoolean = this.f49831e;
                WeakReference weakReference = (WeakReference) d0Var.f88562b;
                if (weakReference.get() != null && (abstractThumbnailPicker = (AbstractThumbnailPicker) weakReference.get()) != null && (dVar = abstractThumbnailPicker.f46287b) != null) {
                    bitmapG = abstractThumbnailPicker.g(dVar2, dVar.getItem(i5), atomicBoolean);
                }
                this.f49829c = bitmapG;
                if (!this.f49831e.get() && (bitmap = this.f49829c) != null && (lVar = (l) this.f49830d.f49841d) != null) {
                    int i11 = this.f49827a;
                    synchronized (lVar) {
                        try {
                            Integer numValueOf = Integer.valueOf(i11);
                            int iIndexOf = ((ArrayList) lVar.f76309b).indexOf(numValueOf);
                            a aVar = new a(bitmap, (ReferenceQueue) lVar.f76311d);
                            aVar.f49825a = 1;
                            if (iIndexOf >= 0) {
                                a aVar2 = (a) ((ArrayList) lVar.f76310c).get(iIndexOf);
                                if (aVar2 != null) {
                                    mc0.b bVar = mc0.d.f76206a;
                                    bVar.r("BitmapGunk");
                                    bVar.m("overwritting %d %s with %s", Integer.valueOf(i11), aVar2.b(), bitmap);
                                }
                                ((ArrayList) lVar.f76310c).set(iIndexOf, aVar);
                            } else {
                                ((ArrayList) lVar.f76309b).add(numValueOf);
                                ((ArrayList) lVar.f76310c).add(aVar);
                            }
                        } catch (Throwable th2) {
                            throw th2;
                        }
                    }
                }
            }
            if (this.f49830d.b(this)) {
                Message messageObtain = Message.obtain();
                messageObtain.what = 1;
                messageObtain.obj = this;
                this.f49830d.f49839b.sendMessage(messageObtain);
                return;
            }
        }
        d dVar3 = this.f49830d;
        dVar3.getClass();
        Bitmap bitmap2 = this.f49829c;
        if (bitmap2 != null) {
            dVar3.c(bitmap2);
        }
        f49826h.A(this);
    }
}
