package h30;

import android.content.Context;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import cl.k0;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.net.URI;
import java.net.URL;
import tm.o;

/* loaded from: classes4.dex */
public final class j extends h {

    /* renamed from: i, reason: collision with root package name */
    public static final a f59075i = new a(200, 200, 16);

    /* renamed from: j, reason: collision with root package name */
    public static final a f59076j = new a();

    /* renamed from: a, reason: collision with root package name */
    public final Uri f59077a;

    /* renamed from: b, reason: collision with root package name */
    public final String f59078b;

    /* renamed from: c, reason: collision with root package name */
    public d f59079c;

    /* renamed from: d, reason: collision with root package name */
    public ParcelFileDescriptor f59080d;

    /* renamed from: e, reason: collision with root package name */
    public InputStream f59081e;

    /* renamed from: f, reason: collision with root package name */
    public int f59082f;

    /* renamed from: g, reason: collision with root package name */
    public int f59083g;

    /* renamed from: h, reason: collision with root package name */
    public final Context f59084h;

    public j(Context context, i iVar, Uri uri, String str) {
        synchronized (h.class) {
        }
        synchronized (i.class) {
            try {
                WeakReference weakReference = iVar.f59073c;
                f30.f.a(weakReference == null || weakReference.get() == null);
                iVar.f59073c = new WeakReference(this);
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f59082f = 0;
        this.f59077a = uri;
        context.getClass();
        this.f59084h = context;
        this.f59078b = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:93:0x00ed A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean a(j jVar, j30.g gVar) throws FileNotFoundException {
        int i5;
        jVar.getClass();
        gVar.c(new b6.b());
        while (true) {
            synchronized (jVar) {
                try {
                    if (gVar.f68890e) {
                        return false;
                    }
                    int i11 = jVar.f59082f;
                    i5 = -1;
                    if (i11 == 0) {
                        jVar.f59082f = 1;
                    } else {
                        if (i11 == -1) {
                            return false;
                        }
                        if (i11 == 2) {
                            return true;
                        }
                        try {
                            jVar.wait();
                        } catch (InterruptedException unused) {
                        }
                    }
                } finally {
                }
            }
            String str = jVar.f59078b;
            Context context = jVar.f59084h;
            Uri uri = jVar.f59077a;
            String scheme = uri.getScheme();
            if ("content".equals(scheme) || "android.resource".equals(scheme) || "file".equals(scheme)) {
                try {
                    if ("image/jpeg".equalsIgnoreCase(str)) {
                        InputStream inputStreamOpenInputStream = context.getContentResolver().openInputStream(uri);
                        jVar.f59083g = k0.z(inputStreamOpenInputStream);
                        f30.f.c(inputStreamOpenInputStream);
                    }
                    try {
                        jVar.f59080d = context.getContentResolver().openFileDescriptor(uri, "r");
                    } catch (FileNotFoundException unused2) {
                        jVar.f59081e = context.getContentResolver().openInputStream(uri);
                    }
                    i5 = gVar.f68890e ? 0 : 2;
                } catch (FileNotFoundException e3) {
                    mc0.d.f76206a.p(e3, "fail to open: %s", uri);
                }
                synchronized (jVar) {
                    try {
                        jVar.f59082f = i5;
                        if (i5 != 2) {
                            ParcelFileDescriptor parcelFileDescriptor = jVar.f59080d;
                            if (parcelFileDescriptor != null) {
                                long[] jArr = f30.f.f54304a;
                                try {
                                    parcelFileDescriptor.close();
                                } catch (Throwable th2) {
                                    mc0.b bVar = mc0.d.f76206a;
                                    bVar.r("Utils");
                                    bVar.p(th2, "fail to close", new Object[0]);
                                }
                                jVar.f59080d = null;
                            }
                            InputStream inputStream = jVar.f59081e;
                            if (inputStream != null) {
                                f30.f.c(inputStream);
                                jVar.f59081e = null;
                            }
                        }
                        jVar.notifyAll();
                    } finally {
                    }
                }
            } else {
                try {
                    URL url = new URI(uri.toString()).toURL();
                    jVar.f59079c = o.h0(context).f0().a(gVar, url);
                    if (!gVar.f68890e) {
                        if (jVar.f59079c == null) {
                            mc0.d.f76206a.n("download failed %s", url);
                        } else {
                            if ("image/jpeg".equalsIgnoreCase(str)) {
                                FileInputStream fileInputStream = new FileInputStream(jVar.f59079c.f59051a);
                                jVar.f59083g = k0.z(fileInputStream);
                                f30.f.c(fileInputStream);
                            }
                            jVar.f59080d = ParcelFileDescriptor.open(jVar.f59079c.f59051a, 268435456);
                        }
                    }
                } catch (Throwable th3) {
                    mc0.d.f76206a.p(th3, "download error", new Object[0]);
                }
                synchronized (jVar) {
                }
            }
        }
    }

    public final void finalize() throws Throwable {
        try {
            ParcelFileDescriptor parcelFileDescriptor = this.f59080d;
            if (parcelFileDescriptor != null) {
                long[] jArr = f30.f.f54304a;
                try {
                    parcelFileDescriptor.close();
                } catch (Throwable th2) {
                    mc0.b bVar = mc0.d.f76206a;
                    bVar.r("Utils");
                    bVar.p(th2, "fail to close", new Object[0]);
                }
            }
            InputStream inputStream = this.f59081e;
            if (inputStream != null) {
                f30.f.c(inputStream);
            }
        } finally {
            super.finalize();
        }
    }
}
