package defpackage;

import android.os.Build;
import android.view.ViewStructure;
import android.view.autofill.AutofillId;
import android.view.autofill.AutofillValue;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.attribute.FileAttribute;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mk0 {
    public static mu2 a(i0c i0cVar, yl3 yl3Var, k92 k92Var, m45 m45Var) {
        ey3 ey3Var = ey3.a;
        int i = 18;
        n92 n92Var = null;
        try {
            System.loadLibrary("datastore_shared_counter");
            return new mu2(new wg4(i0cVar, new ce(27, k92Var), m45Var), d46.Q(new r91(ey3Var, n92Var, i)), yl3Var, k92Var);
        } catch (SecurityException | UnsatisfiedLinkError unused) {
            return new mu2(new wg4(i0cVar, zu2.p, m45Var), d46.Q(new r91(ey3Var, n92Var, i)), yl3Var, k92Var);
        }
    }

    public static AutofillValue b(String str) {
        if (str.length() >= 5000) {
            str = (Character.isHighSurrogate(str.charAt(4999)) && Character.isLowSurrogate(str.charAt(5000))) ? muc.x0(4999, str) : muc.x0(5000, str);
        }
        return AutofillValue.forText(str);
    }

    public static AutofillValue c(boolean z) {
        return AutofillValue.forToggle(z);
    }

    public static void d(File file) throws IOException {
        File parentFile = file.getParentFile();
        if (parentFile == null) {
            return;
        }
        if (parentFile.exists() && !parentFile.isDirectory() && g76.L(parentFile.getName(), "firebaseSessions") && !parentFile.delete()) {
            ywb.o("Failed to delete conflicting file: ", parentFile);
            return;
        }
        if (parentFile.isDirectory()) {
            return;
        }
        if (Build.VERSION.SDK_INT < 26) {
            if (parentFile.mkdirs() || parentFile.isDirectory()) {
                return;
            }
            ywb.o("Failed to create directory: ", parentFile);
            return;
        }
        try {
            Files.createDirectories(parentFile.toPath(), new FileAttribute[0]);
        } catch (Exception e) {
            throw new IOException("Failed to create directory: " + parentFile, e);
        }
    }

    public static void e(ViewStructure viewStructure, String[] strArr) {
        viewStructure.setAutofillHints(strArr);
    }

    public static void f(ViewStructure viewStructure, AutofillId autofillId, int i) {
        viewStructure.setAutofillId(autofillId, i);
    }

    public static void g(ViewStructure viewStructure, int i) {
        viewStructure.setAutofillType(i);
    }

    public static void h(ViewStructure viewStructure, AutofillValue autofillValue) {
        viewStructure.setAutofillValue(autofillValue);
    }

    public static void i(ViewStructure viewStructure, boolean z) {
        viewStructure.setDataIsSensitive(z);
    }

    public static void j(ViewStructure viewStructure) {
        viewStructure.setInputType(129);
    }
}
