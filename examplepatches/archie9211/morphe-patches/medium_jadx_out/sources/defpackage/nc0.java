package defpackage;

import android.content.Context;
import android.os.Build;
import android.os.StatFs;
import java.io.File;
import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class nc0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Context b;

    public /* synthetic */ nc0(Context context, int i) {
        this.a = i;
        this.b = context;
    }

    @Override // defpackage.m45
    public final Object invoke() throws IOException {
        String str;
        File file;
        int iY;
        int i = this.a;
        int length = 1;
        Context context = this.b;
        switch (i) {
            case 0:
                context.getClass();
                return new bh2(context);
            case 1:
                float f = r0.widthPixels / context.getResources().getDisplayMetrics().density;
                int i2 = sz2.a[(vj3.a(f, 600.0f) < 0 ? ip7.COMPACT : vj3.a(f, 840.0f) < 0 ? ip7.MEDIUM : ip7.EXPANDED).ordinal()];
                if (i2 == 1) {
                    str = "Phone";
                } else if (i2 == 2) {
                    str = "Tablet";
                } else {
                    if (i2 != 3) {
                        ygf.a();
                        return null;
                    }
                    str = "Desktop";
                }
                String strD = u4.d(context);
                String strL = (strD == null || muc.b0(strD)) ? "unknown" : muc.Q(strD, "com.android.vending", false) ? "playstore" : tuc.L(strD, ".", "_");
                StringBuilder sb = new StringBuilder("donkey/4.5.1784910415");
                sb.append(" (" + str + "; ");
                sb.append(Build.BRAND);
                sb.append(" ");
                sb.append(Build.MODEL);
                sb.append("; channel:".concat(strL));
                sb.append("; os/" + Build.VERSION.SDK_INT);
                sb.append(")");
                return sb.toString();
            case 2:
                File fileL = xz5.L(context, "firebaseSessions/sessionConfigsDataStore.data");
                mk0.d(fileL);
                return fileL;
            case 3:
                File fileL2 = xz5.L(context, "firebaseSessions/sessionDataStore.data");
                mk0.d(fileL2);
                return fileL2;
            case 4:
                return yo7.r(context);
            default:
                File filesDir = context.getFilesDir();
                filesDir.getClass();
                File file2 = new File("image_offline");
                String path = file2.getPath();
                path.getClass();
                char c = File.separatorChar;
                int iY2 = muc.Y(path, c, 0, 4);
                if (iY2 != 0) {
                    length = (iY2 <= 0 || path.charAt(iY2 + (-1)) != ':') ? (iY2 == -1 && muc.U(path, ':')) ? path.length() : 0 : 1 + iY2;
                } else if (path.length() > 1 && path.charAt(1) == c && (iY = muc.Y(path, c, 2, 4)) >= 0) {
                    int iY3 = muc.Y(path, c, iY + 1, 4);
                    length = iY3 >= 0 ? 1 + iY3 : path.length();
                }
                if (length <= 0) {
                    String string = filesDir.toString();
                    string.getClass();
                    if (string.length() == 0 || muc.U(string, c)) {
                        file = new File(string + file2);
                    } else {
                        file = new File(string + c + file2);
                    }
                    file2 = file;
                }
                if (!file2.exists()) {
                    file2.mkdirs();
                }
                ig6 ig6Var = ch4.a;
                String str2 = g59.b;
                g59 g59VarS = cd7.s(file2);
                long jW = 104857600;
                try {
                    File file3 = g59VarS.toFile();
                    file3.mkdir();
                    StatFs statFs = new StatFs(file3.getAbsolutePath());
                    jW = iq7.w((long) (0.05d * statFs.getBlockSizeLong() * statFs.getBlockCountLong()), 104857600L, 262144000L);
                    break;
                } catch (Exception unused) {
                }
                return new gva(jW, ig6Var, g59VarS);
        }
    }
}
