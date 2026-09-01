package defpackage;

import android.app.Activity;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x50 {
    public static final jzb b = new jzb();
    public static volatile x50 c;
    public final w5d a;

    public x50(up8 up8Var) {
        this.a = new w5d(new nh2(8, new ef6(up8Var, 0)));
    }

    public SharedPreferences a() {
        if (ec2.a.contains(this)) {
            return null;
        }
        try {
            Object value = this.a.getValue();
            value.getClass();
            return (SharedPreferences) value;
        } catch (Throwable th) {
            ec2.a(this, th);
            return null;
        }
    }

    public void b(Activity activity) {
        if (ec2.a.contains(this)) {
            return;
        }
        try {
            Uri data = activity.getIntent().getData();
            if (data == null) {
                return;
            }
            Intent intent = activity.getIntent();
            intent.getClass();
            d(data, intent);
        } catch (Throwable th) {
            ec2.a(this, th);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object c(defpackage.p92 r21, java.lang.String r22, java.util.List r23) {
        /*
            Method dump skipped, instruction units count: 273
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x50.c(p92, java.lang.String, java.util.List):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x0037 A[Catch: all -> 0x0063, TRY_LEAVE, TryCatch #0 {all -> 0x0063, blocks: (B:5:0x0009, B:20:0x0037, B:29:0x004d, B:32:0x0053, B:18:0x0031, B:9:0x0016, B:12:0x001d, B:16:0x0029, B:23:0x0040, B:26:0x0047), top: B:39:0x0009, inners: #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0053 A[Catch: all -> 0x0063, TRY_LEAVE, TryCatch #0 {all -> 0x0063, blocks: (B:5:0x0009, B:20:0x0037, B:29:0x004d, B:32:0x0053, B:18:0x0031, B:9:0x0016, B:12:0x001d, B:16:0x0029, B:23:0x0040, B:26:0x0047), top: B:39:0x0009, inners: #2, #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0065 A[ORIG_RETURN, RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void d(android.net.Uri r5, android.content.Intent r6) {
        /*
            r4 = this;
            java.util.Set r0 = defpackage.ec2.a
            boolean r1 = r0.contains(r4)
            if (r1 == 0) goto L9
            goto L65
        L9:
            boolean r0 = r0.contains(r4)     // Catch: java.lang.Throwable -> L63
            java.lang.String r1 = "al_applink_data"
            r2 = 0
            java.lang.String r3 = "campaign_ids"
            if (r0 == 0) goto L16
        L14:
            r5 = r2
            goto L35
        L16:
            java.lang.String r5 = r5.getQueryParameter(r1)     // Catch: java.lang.Throwable -> L27
            if (r5 != 0) goto L1d
            goto L14
        L1d:
            org.json.JSONObject r0 = new org.json.JSONObject     // Catch: java.lang.Throwable -> L27 java.lang.Exception -> L29
            r0.<init>(r5)     // Catch: java.lang.Throwable -> L27 java.lang.Exception -> L29
            java.lang.String r5 = r0.getString(r3)     // Catch: java.lang.Throwable -> L27 java.lang.Exception -> L29
            goto L35
        L27:
            r5 = move-exception
            goto L31
        L29:
            java.lang.String r5 = "AppLinkManager"
            java.lang.String r0 = "Fail to parse Applink data from Uri"
            android.util.Log.d(r5, r0)     // Catch: java.lang.Throwable -> L27
            goto L14
        L31:
            defpackage.ec2.a(r4, r5)     // Catch: java.lang.Throwable -> L63
            goto L14
        L35:
            if (r5 != 0) goto L51
            java.util.Set r5 = defpackage.ec2.a     // Catch: java.lang.Throwable -> L63
            boolean r5 = r5.contains(r4)     // Catch: java.lang.Throwable -> L63
            if (r5 == 0) goto L40
            goto L50
        L40:
            android.os.Bundle r5 = r6.getBundleExtra(r1)     // Catch: java.lang.Throwable -> L4c
            if (r5 != 0) goto L47
            goto L50
        L47:
            java.lang.String r2 = r5.getString(r3)     // Catch: java.lang.Throwable -> L4c
            goto L50
        L4c:
            r5 = move-exception
            defpackage.ec2.a(r4, r5)     // Catch: java.lang.Throwable -> L63
        L50:
            r5 = r2
        L51:
            if (r5 == 0) goto L65
            android.content.SharedPreferences r6 = r4.a()     // Catch: java.lang.Throwable -> L63
            android.content.SharedPreferences$Editor r6 = r6.edit()     // Catch: java.lang.Throwable -> L63
            android.content.SharedPreferences$Editor r5 = r6.putString(r3, r5)     // Catch: java.lang.Throwable -> L63
            r5.apply()     // Catch: java.lang.Throwable -> L63
            goto L65
        L63:
            r5 = move-exception
            goto L66
        L65:
            return
        L66:
            defpackage.ec2.a(r4, r5)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.x50.d(android.net.Uri, android.content.Intent):void");
    }

    public x50() {
        this.a = new w5d(co.o);
    }
}
