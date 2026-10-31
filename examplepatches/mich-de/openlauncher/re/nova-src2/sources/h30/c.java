package h30;

import android.content.ContentValues;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.HashSet;
import java.util.Iterator;

/* loaded from: classes4.dex */
public final class c implements j30.f, j30.a {

    /* renamed from: a, reason: collision with root package name */
    public final HashSet f59047a = new HashSet();

    /* renamed from: b, reason: collision with root package name */
    public j30.g f59048b;

    /* renamed from: c, reason: collision with root package name */
    public final String f59049c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ f f59050d;

    public c(f fVar, String str) {
        this.f59050d = fVar;
        long[] jArr = f30.f.f54304a;
        str.getClass();
        this.f59049c = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x0033 A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0050  */
    /* JADX WARN: Removed duplicated region for block: B:38:? A[RETURN, SYNTHETIC] */
    @Override // j30.f
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object a(j30.g gVar) {
        File fileCreateTempFile;
        URL url;
        FileOutputStream fileOutputStream;
        boolean zI;
        String str = this.f59049c;
        gVar.d(2);
        try {
            try {
                url = new URL(str);
                fileCreateTempFile = File.createTempFile("cache", ".tmp", this.f59050d.f59063c);
            } catch (Exception e3) {
                e = e3;
                fileCreateTempFile = null;
            }
            try {
                gVar.d(2);
                try {
                    fileOutputStream = new FileOutputStream(fileCreateTempFile);
                } catch (Throwable unused) {
                    fileOutputStream = null;
                }
            } catch (Exception e11) {
                e = e11;
                mc0.d.f76206a.p(e, "fail to download %s", str);
                if (fileCreateTempFile == null) {
                }
            }
            try {
                zI = android.support.v4.media.session.b.I(gVar, url, fileOutputStream);
                f30.f.c(fileOutputStream);
            } catch (Throwable unused2) {
                f30.f.c(fileOutputStream);
                zI = false;
                gVar.d(0);
                if (zI) {
                }
                if (fileCreateTempFile == null) {
                }
            }
            gVar.d(0);
            if (zI) {
                return fileCreateTempFile;
            }
            if (fileCreateTempFile == null) {
                return null;
            }
            fileCreateTempFile.delete();
            return null;
        } finally {
            gVar.d(0);
        }
    }

    @Override // j30.a
    public final void b(j30.g gVar) {
        long jInsert;
        d dVar;
        File file = (File) gVar.b();
        if (file != null) {
            f fVar = this.f59050d;
            String str = this.f59049c;
            synchronized (fVar) {
                long length = file.length();
                fVar.f59067g += length;
                ContentValues contentValues = new ContentValues();
                String strValueOf = String.valueOf(f30.f.d(str));
                contentValues.put("_data", file.getAbsolutePath());
                contentValues.put("hash_code", strValueOf);
                contentValues.put("content_url", str);
                contentValues.put("_size", Long.valueOf(length));
                contentValues.put("last_updated", Long.valueOf(System.currentTimeMillis()));
                jInsert = fVar.f59065e.insert(f.f59056i, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, contentValues);
            }
        } else {
            jInsert = 0;
        }
        if (gVar.f68890e) {
            f30.f.a(this.f59047a.isEmpty());
            return;
        }
        synchronized (this.f59050d.f59062b) {
            try {
                synchronized (this.f59050d.f59061a) {
                    if (file != null) {
                        try {
                            dVar = new d(jInsert, file);
                            f30.f.a(this.f59050d.f59061a.r(this.f59049c, dVar) == null);
                        } finally {
                        }
                    } else {
                        dVar = null;
                    }
                }
                Iterator it = this.f59047a.iterator();
                while (it.hasNext()) {
                    e eVar = (e) it.next();
                    synchronized (eVar) {
                        if (!eVar.f59054b) {
                            eVar.f59055c = dVar;
                            eVar.notifyAll();
                        }
                    }
                }
                this.f59050d.f59062b.remove(this.f59049c);
                this.f59050d.c();
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }
}
