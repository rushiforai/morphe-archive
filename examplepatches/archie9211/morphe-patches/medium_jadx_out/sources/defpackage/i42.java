package defpackage;

import android.graphics.Bitmap;
import android.net.Uri;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import java.io.FilterOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i42 implements cf5 {
    public boolean a = true;
    public boolean b;
    public Object c;
    public Object d;

    @Override // defpackage.cf5
    public void a(String str, String str2) {
        str.getClass();
        str2.getClass();
        f(str, null, null);
        i("%s", str2);
        k();
        f87 f87Var = (f87) this.d;
        "    ".concat(str);
        f87Var.b();
    }

    public j42 b() {
        return new j42(this.a, this.b, (String[]) this.c, (String[]) this.d);
    }

    public void c(zl1... zl1VarArr) {
        if (!this.a) {
            ay0.e("no cipher suites for cleartext connections");
            return;
        }
        ArrayList arrayList = new ArrayList(zl1VarArr.length);
        for (zl1 zl1Var : zl1VarArr) {
            arrayList.add(zl1Var.a);
        }
        String[] strArr = (String[]) arrayList.toArray(new String[0]);
        String[] strArr2 = (String[]) Arrays.copyOf(strArr, strArr.length);
        if (!this.a) {
            ay0.e("no cipher suites for cleartext connections");
        } else if (strArr2.length != 0) {
            this.c = (String[]) Arrays.copyOf(strArr2, strArr2.length);
        } else {
            ay0.e("At least one cipher suite is required");
        }
    }

    public void d(nmd... nmdVarArr) {
        if (!this.a) {
            ay0.e("no TLS versions for cleartext connections");
            return;
        }
        ArrayList arrayList = new ArrayList(nmdVarArr.length);
        for (nmd nmdVar : nmdVarArr) {
            arrayList.add(nmdVar.javaName());
        }
        String[] strArr = (String[]) arrayList.toArray(new String[0]);
        String[] strArr2 = (String[]) Arrays.copyOf(strArr, strArr.length);
        if (!this.a) {
            ay0.e("no TLS versions for cleartext connections");
        } else if (strArr2.length != 0) {
            this.d = (String[]) Arrays.copyOf(strArr2, strArr2.length);
        } else {
            ay0.e("At least one TLS version is required");
        }
    }

    public void e(String str, Object... objArr) throws IOException {
        FilterOutputStream filterOutputStream = (FilterOutputStream) this.c;
        if (this.b) {
            Locale locale = Locale.US;
            Object[] objArrCopyOf = Arrays.copyOf(objArr, objArr.length);
            String strEncode = URLEncoder.encode(String.format(locale, str, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length)), "UTF-8");
            strEncode.getClass();
            byte[] bytes = strEncode.getBytes(wk1.a);
            bytes.getClass();
            filterOutputStream.write(bytes);
            return;
        }
        if (this.a) {
            Charset charset = wk1.a;
            byte[] bytes2 = "--".getBytes(charset);
            bytes2.getClass();
            filterOutputStream.write(bytes2);
            byte[] bytes3 = ff5.j.getBytes(charset);
            bytes3.getClass();
            filterOutputStream.write(bytes3);
            byte[] bytes4 = "\r\n".getBytes(charset);
            bytes4.getClass();
            filterOutputStream.write(bytes4);
            this.a = false;
        }
        Object[] objArrCopyOf2 = Arrays.copyOf(objArr, objArr.length);
        byte[] bytes5 = String.format(str, Arrays.copyOf(objArrCopyOf2, objArrCopyOf2.length)).getBytes(wk1.a);
        bytes5.getClass();
        filterOutputStream.write(bytes5);
    }

    public void f(String str, String str2, String str3) throws IOException {
        if (this.b) {
            FilterOutputStream filterOutputStream = (FilterOutputStream) this.c;
            byte[] bytes = String.format("%s=", Arrays.copyOf(new Object[]{str}, 1)).getBytes(wk1.a);
            bytes.getClass();
            filterOutputStream.write(bytes);
            return;
        }
        e("Content-Disposition: form-data; name=\"%s\"", str);
        if (str2 != null) {
            e("; filename=\"%s\"", str2);
        }
        i("", new Object[0]);
        if (str3 != null) {
            i("%s: %s", "Content-Type", str3);
        }
        i("", new Object[0]);
    }

    public void g(Uri uri, String str, String str2) throws IOException {
        FilterOutputStream filterOutputStream = (FilterOutputStream) this.c;
        str.getClass();
        if (str2 == null) {
            str2 = "content/unknown";
        }
        f(str, str, str2);
        int iN = epe.n(f94.a().getContentResolver().openInputStream(uri), filterOutputStream);
        i("", new Object[0]);
        k();
        f87 f87Var = (f87) this.d;
        "    ".concat(str);
        String.format(Locale.ROOT, "<Data: %d>", Arrays.copyOf(new Object[]{Integer.valueOf(iN)}, 1));
        f87Var.b();
    }

    public void h(String str, ParcelFileDescriptor parcelFileDescriptor, String str2) throws IOException {
        FilterOutputStream filterOutputStream = (FilterOutputStream) this.c;
        str.getClass();
        if (str2 == null) {
            str2 = "content/unknown";
        }
        f(str, str, str2);
        int iN = epe.n(new ParcelFileDescriptor.AutoCloseInputStream(parcelFileDescriptor), filterOutputStream);
        i("", new Object[0]);
        k();
        f87 f87Var = (f87) this.d;
        "    ".concat(str);
        String.format(Locale.ROOT, "<Data: %d>", Arrays.copyOf(new Object[]{Integer.valueOf(iN)}, 1));
        f87Var.b();
    }

    public void i(String str, Object... objArr) throws IOException {
        e(str, Arrays.copyOf(objArr, objArr.length));
        if (this.b) {
            return;
        }
        e("\r\n", new Object[0]);
    }

    public void j(String str, Object obj, ff5 ff5Var) {
        f87 f87Var = (f87) this.d;
        str.getClass();
        FilterOutputStream filterOutputStream = (FilterOutputStream) this.c;
        String str2 = ff5.j;
        if (xz5.f0(obj)) {
            a(str, xz5.j0(obj));
            return;
        }
        if (obj instanceof Bitmap) {
            f(str, str, "image/png");
            ((Bitmap) obj).compress(Bitmap.CompressFormat.PNG, 100, filterOutputStream);
            i("", new Object[0]);
            k();
            "    ".concat(str);
            f87Var.b();
            return;
        }
        if (obj instanceof byte[]) {
            byte[] bArr = (byte[]) obj;
            f(str, str, "content/unknown");
            filterOutputStream.write(bArr);
            i("", new Object[0]);
            k();
            "    ".concat(str);
            String.format(Locale.ROOT, "<Data: %d>", Arrays.copyOf(new Object[]{Integer.valueOf(bArr.length)}, 1));
            f87Var.b();
            return;
        }
        if (obj instanceof Uri) {
            g((Uri) obj, str, null);
            return;
        }
        if (obj instanceof ParcelFileDescriptor) {
            h(str, (ParcelFileDescriptor) obj, null);
            return;
        }
        if (!(obj instanceof df5)) {
            ay0.e("value is not a supported type.");
            return;
        }
        df5 df5Var = (df5) obj;
        Parcelable parcelable = df5Var.b;
        String str3 = df5Var.a;
        if (parcelable instanceof ParcelFileDescriptor) {
            h(str, (ParcelFileDescriptor) parcelable, str3);
        } else if (parcelable instanceof Uri) {
            g((Uri) parcelable, str, str3);
        } else {
            ay0.e("value is not a supported type.");
        }
    }

    public void k() throws IOException {
        if (!this.b) {
            i("--%s", ff5.j);
            return;
        }
        FilterOutputStream filterOutputStream = (FilterOutputStream) this.c;
        byte[] bytes = "&".getBytes(wk1.a);
        bytes.getClass();
        filterOutputStream.write(bytes);
    }
}
