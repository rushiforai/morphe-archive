package defpackage;

import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.NavigableSet;
import java.util.TreeSet;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sd2 {
    public static final Charset e = Charset.forName("UTF-8");
    public static final int f = 15;
    public static final rd2 g = new rd2();
    public static final g h = new g(4);
    public static final fc2 i = new fc2(2);
    public final AtomicInteger a = new AtomicInteger(0);
    public final bh4 b;
    public final iv2 c;
    public final gc2 d;

    public sd2(bh4 bh4Var, iv2 iv2Var, gc2 gc2Var) {
        this.b = bh4Var;
        this.c = iv2Var;
        this.d = gc2Var;
    }

    public static void a(List list) {
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ((File) it2.next()).delete();
        }
    }

    public static String e(File file) throws IOException {
        byte[] bArr = new byte[8192];
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        FileInputStream fileInputStream = new FileInputStream(file);
        while (true) {
            try {
                int i2 = fileInputStream.read(bArr);
                if (i2 <= 0) {
                    String str = new String(byteArrayOutputStream.toByteArray(), e);
                    fileInputStream.close();
                    return str;
                }
                byteArrayOutputStream.write(bArr, 0, i2);
            } catch (Throwable th) {
                try {
                    fileInputStream.close();
                } catch (Throwable th2) {
                    th.addSuppressed(th2);
                }
                throw th;
            }
        }
    }

    public static void f(File file, String str) throws IOException {
        OutputStreamWriter outputStreamWriter = new OutputStreamWriter(new FileOutputStream(file), e);
        try {
            outputStreamWriter.write(str);
            outputStreamWriter.close();
        } catch (Throwable th) {
            try {
                outputStreamWriter.close();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public final ArrayList b() {
        ArrayList arrayList = new ArrayList();
        bh4 bh4Var = this.b;
        arrayList.addAll(bh4.f(((File) bh4Var.f).listFiles()));
        arrayList.addAll(bh4.f(((File) bh4Var.g).listFiles()));
        g gVar = h;
        Collections.sort(arrayList, gVar);
        List listF = bh4.f(((File) bh4Var.e).listFiles());
        Collections.sort(listF, gVar);
        arrayList.addAll(listF);
        return arrayList;
    }

    public final NavigableSet c() {
        return new TreeSet(bh4.f(((File) this.b.d).list())).descendingSet();
    }

    public final void d(ld2 ld2Var, String str, boolean z) {
        bh4 bh4Var = this.b;
        int i2 = this.c.d().a.b;
        g.getClass();
        try {
            f(bh4Var.b(str, ev6.x("event", String.format(Locale.US, "%010d", Integer.valueOf(this.a.getAndIncrement())), z ? "_" : "")), rd2.a.I(ld2Var));
        } catch (IOException e2) {
            Log.w("FirebaseCrashlytics", "Could not persist event for session " + str, e2);
        }
        fc2 fc2Var = new fc2(3);
        File file = new File((File) bh4Var.d, str);
        file.mkdirs();
        List<File> listF = bh4.f(file.listFiles(fc2Var));
        Collections.sort(listF, new g(5));
        int size = listF.size();
        for (File file2 : listF) {
            if (size <= i2) {
                return;
            }
            bh4.e(file2);
            size--;
        }
    }
}
