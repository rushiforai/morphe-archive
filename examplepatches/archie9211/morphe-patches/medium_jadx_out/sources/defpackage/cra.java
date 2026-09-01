package defpackage;

import android.util.Log;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.medium.android.common.ui.Ezz.Plbho;
import com.medium.android.data.notification.YMl.DtuT;
import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class cra implements pg4 {
    public static final Charset c = Charset.forName("UTF-8");
    public final File a;
    public bra b;

    public cra(File file) {
        this.a = file;
    }

    public final void a() {
        File file = this.a;
        if (this.b == null) {
            try {
                this.b = new bra(file);
            } catch (IOException e) {
                Log.e("FirebaseCrashlytics", "Could not open log file: " + file, e);
            }
        }
    }

    @Override // defpackage.pg4
    public final void c() {
        gx1.D(this.b, "There was a problem closing the Crashlytics log file.");
        this.b = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:4:0x000a  */
    @Override // defpackage.pg4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.String d() {
        /*
            r6 = this;
            java.io.File r0 = r6.a
            boolean r0 = r0.exists()
            r1 = 0
            r2 = 0
            if (r0 != 0) goto Lc
        La:
            r6 = r2
            goto L39
        Lc:
            r6.a()
            bra r0 = r6.b
            if (r0 != 0) goto L14
            goto La
        L14:
            int[] r3 = new int[]{r1}
            int r0 = r0.T()
            byte[] r0 = new byte[r0]
            bra r6 = r6.b     // Catch: java.io.IOException -> L2a
            a1a r4 = new a1a     // Catch: java.io.IOException -> L2a
            r5 = 4
            r4.<init>(r0, r5, r3)     // Catch: java.io.IOException -> L2a
            r6.B(r4)     // Catch: java.io.IOException -> L2a
            goto L32
        L2a:
            r6 = move-exception
            java.lang.String r4 = "A problem occurred while reading the Crashlytics log file."
            java.lang.String r5 = "FirebaseCrashlytics"
            android.util.Log.e(r5, r4, r6)
        L32:
            zm0 r6 = new zm0
            r3 = r3[r1]
            r6.<init>(r0, r3)
        L39:
            if (r6 != 0) goto L3d
            r3 = r2
            goto L46
        L3d:
            int r0 = r6.b
            byte[] r3 = new byte[r0]
            byte[] r6 = r6.a
            java.lang.System.arraycopy(r6, r1, r3, r1, r0)
        L46:
            if (r3 == 0) goto L50
            java.lang.String r6 = new java.lang.String
            java.nio.charset.Charset r0 = defpackage.cra.c
            r6.<init>(r3, r0)
            return r6
        L50:
            return r2
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.cra.d():java.lang.String");
    }

    @Override // defpackage.pg4
    public final void n(long j, String str) {
        a();
        if (this.b != null) {
            if (str == null) {
                str = "null";
            }
            try {
                if (str.length() > 16384) {
                    str = "...".concat(str.substring(str.length() - OlympusMakernoteDirectory.TAG_MAIN_INFO));
                }
                this.b.f(String.format(Locale.US, Plbho.XxYrlJcvVtD, Long.valueOf(j), str.replaceAll("\r", " ").replaceAll("\n", " ")).getBytes(c));
                while (!this.b.D() && this.b.T() > 65536) {
                    this.b.N();
                }
            } catch (IOException e) {
                Log.e("FirebaseCrashlytics", DtuT.jVtWQWp, e);
            }
        }
    }
}
