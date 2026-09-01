package defpackage;

import android.util.Log;
import j$.util.Objects;
import java.io.File;
import java.util.Collections;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gc2 {
    public final ft2 a;
    public final m50 b;

    public gc2(ft2 ft2Var, bh4 bh4Var) {
        this.a = ft2Var;
        this.b = new m50(bh4Var);
    }

    public final String a(String str) {
        String strSubstring;
        m50 m50Var = this.b;
        synchronized (m50Var) {
            if (Objects.equals((String) m50Var.c, str)) {
                return (String) m50Var.d;
            }
            bh4 bh4Var = (bh4) m50Var.b;
            fc2 fc2Var = m50.i;
            File file = new File((File) bh4Var.d, str);
            file.mkdirs();
            List listF = bh4.f(file.listFiles(fc2Var));
            if (listF.isEmpty()) {
                strSubstring = null;
                Log.w("FirebaseCrashlytics", "Unable to read App Quality Sessions session id.", null);
            } else {
                strSubstring = ((File) Collections.min(listF, m50.j)).getName().substring(4);
            }
            return strSubstring;
        }
    }

    public final void b(String str) {
        m50 m50Var = this.b;
        synchronized (m50Var) {
            if (!Objects.equals((String) m50Var.c, str)) {
                m50.I((bh4) m50Var.b, str, (String) m50Var.d);
                m50Var.c = str;
            }
        }
    }
}
