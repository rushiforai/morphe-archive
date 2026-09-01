package defpackage;

import android.content.Context;
import android.content.SharedPreferences;
import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nwf {
    public static final ivf c;
    public static final nwf d;
    public jrg a;
    public long b;

    static {
        Object[] objArr = {"firebaseAppName", "firebaseUserUid", "operation", "tenantId", "verifyAssertionRequest", "statusCode", "statusMessage", "timestamp"};
        bsf bsfVar = upf.f;
        for (int i = 0; i < 8; i++) {
            if (objArr[i] == null) {
                z72.c(b09.w(i, "at index "));
                return;
            }
        }
        c = new ivf(8, objArr);
        nwf nwfVar = new nwf();
        nwfVar.b = 0L;
        d = nwfVar;
    }

    public static void a(Context context, Status status) {
        SharedPreferences.Editor editorEdit = context.getSharedPreferences("com.google.firebase.auth.internal.ProcessDeathHelper", 0).edit();
        editorEdit.putInt("statusCode", status.a);
        editorEdit.putString("statusMessage", status.b);
        editorEdit.putLong("timestamp", System.currentTimeMillis());
        editorEdit.commit();
    }

    public static void b(SharedPreferences sharedPreferences) {
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        ivf ivfVar = c;
        int i = ivfVar.h;
        int i2 = 0;
        while (i2 < i) {
            Object obj = ivfVar.get(i2);
            i2++;
            editorEdit.remove((String) obj);
        }
        editorEdit.commit();
    }
}
