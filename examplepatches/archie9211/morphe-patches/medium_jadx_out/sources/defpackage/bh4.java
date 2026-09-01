package defpackage;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;
import com.medium.android.donkey.main.Wv.MaAxRJinch;
import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class bh4 {
    public final Object a;
    public final Object b;
    public final Object c;
    public final Object d;
    public final Object e;
    public Object f;
    public Object g;

    public static synchronized void d(File file) {
        try {
            if (file.exists()) {
                if (file.isDirectory()) {
                    return;
                }
                String str = "Unexpected non-directory file: " + file + "; deleting file and creating new directory.";
                if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                    Log.d("FirebaseCrashlytics", str, null);
                }
                file.delete();
            }
            if (!file.mkdirs()) {
                Log.e("FirebaseCrashlytics", "Could not create Crashlytics-specific directory: " + file, null);
            }
        } catch (Throwable th) {
            throw th;
        }
    }

    public static boolean e(File file) {
        File[] fileArrListFiles = file.listFiles();
        if (fileArrListFiles != null) {
            for (File file2 : fileArrListFiles) {
                e(file2);
            }
        }
        return file.delete();
    }

    public static List f(Object[] objArr) {
        return objArr == null ? Collections.EMPTY_LIST : Arrays.asList(objArr);
    }

    public void a(String str) {
        File file = new File((File) this.b, str);
        if (file.exists() && e(file)) {
            String str2 = "Deleted previous Crashlytics file system: " + file.getPath();
            if (Log.isLoggable("FirebaseCrashlytics", 3)) {
                Log.d("FirebaseCrashlytics", str2, null);
            }
        }
    }

    public File b(String str, String str2) {
        File file = new File((File) this.d, str);
        file.mkdirs();
        return new File(file, str2);
    }

    public Integer c(int i) {
        Integer num = (Integer) ((LinkedHashMap) this.f).get(Integer.valueOf(i));
        if (num != null) {
            return num;
        }
        bh4 bh4Var = (bh4) this.d;
        if (bh4Var != null) {
            return bh4Var.c(i);
        }
        return null;
    }

    public bh4 g(List list) {
        list.getClass();
        bh4 bh4Var = new bh4((p98) this.a, (wjc) this.b, (kse) this.c, this, (List) this.e);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            x6a x6aVar = (x6a) it2.next();
            ((LinkedHashMap) bh4Var.f).put(Integer.valueOf(x6aVar.e), Integer.valueOf(x6aVar.d));
        }
        return bh4Var;
    }

    public o2b h() {
        o2b o2bVar = (o2b) this.g;
        if (o2bVar != null) {
            return o2bVar;
        }
        xj4 xj4Var = (xj4) this.f;
        String strN = ((d87) this.e).n();
        xj4Var.a();
        o2b o2bVar2 = new o2b(xj4Var.a, xj4Var, strN);
        this.g = o2bVar2;
        return o2bVar2;
    }

    public bh4(xj4 xj4Var, d87 d87Var) {
        this.f = xj4Var;
        xj4Var.a();
        String str = xj4Var.c.a;
        this.a = str;
        xj4Var.a();
        String str2 = xj4Var.c.g;
        this.e = d87Var;
        this.d = null;
        this.b = null;
        this.c = null;
        String strV = en7.V("firebear.secureToken");
        if (TextUtils.isEmpty(strV)) {
            y70 y70Var = xof.a;
            synchronized (y70Var) {
                if (y70Var.get(str) != null) {
                    throw new ClassCastException();
                }
            }
            strV = "https://".concat("securetoken.googleapis.com/v1");
        } else {
            Log.e("LocalClient", "Found hermetic configuration for secureToken URL: " + strV);
        }
        if (((unf) this.d) == null) {
            this.d = new unf(strV, h());
        }
        String strV2 = en7.V("firebear.identityToolkit");
        if (TextUtils.isEmpty(strV2)) {
            strV2 = xof.c(str);
        } else {
            Log.e("LocalClient", "Found hermetic configuration for identityToolkit URL: " + strV2);
        }
        if (((unf) this.b) == null) {
            this.b = new unf(strV2, h());
        }
        String strV3 = en7.V(MaAxRJinch.EJzDEwQob);
        if (TextUtils.isEmpty(strV3)) {
            strV3 = xof.d(str);
        } else {
            Log.e("LocalClient", "Found hermetic configuration for identityToolkitV2 URL: " + strV3);
        }
        if (((unf) this.c) == null) {
            this.c = new unf(strV3, h());
        }
        ((wmf) xj4Var.b(wmf.class)).getClass();
        xof.b(str, this);
    }

    public bh4(uz5 uz5Var, sj0 sj0Var, tag tagVar, nig nigVar, o2b o2bVar, d6g d6gVar) {
        this.g = uz5Var;
        this.a = sj0Var;
        this.b = tagVar;
        this.c = nigVar;
        this.d = o2bVar;
        this.e = d6gVar;
    }

    public bh4(p98 p98Var, wjc wjcVar, kse kseVar, bh4 bh4Var, List list) {
        p98Var.getClass();
        list.getClass();
        this.a = p98Var;
        this.b = wjcVar;
        this.c = kseVar;
        this.d = bh4Var;
        this.e = list;
        this.f = new LinkedHashMap();
        sz7.a.getClass();
        this.g = rz7.a();
    }

    public bh4(Context context) {
        String string;
        String strReplaceAll;
        String str = ((ui0) x1a.a.b(context)).a;
        this.a = str;
        File filesDir = context.getFilesDir();
        this.b = filesDir;
        if (!str.isEmpty()) {
            StringBuilder sb = new StringBuilder(".crashlytics.v3");
            sb.append(File.separator);
            if (str.length() > 40) {
                strReplaceAll = gx1.a0(str);
            } else {
                strReplaceAll = str.replaceAll("[^a-zA-Z0-9.]", "_");
            }
            sb.append(strReplaceAll);
            string = sb.toString();
        } else {
            string = ".com.google.firebase.crashlytics.files.v1";
        }
        File file = new File(filesDir, string);
        d(file);
        this.c = file;
        File file2 = new File(file, "open-sessions");
        d(file2);
        this.d = file2;
        File file3 = new File(file, "reports");
        d(file3);
        this.e = file3;
        File file4 = new File(file, "priority-reports");
        d(file4);
        this.f = file4;
        File file5 = new File(file, "native-reports");
        d(file5);
        this.g = file5;
    }
}
