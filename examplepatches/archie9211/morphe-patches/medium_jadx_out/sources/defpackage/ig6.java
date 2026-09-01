package defpackage;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.io.RandomAccessFile;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ig6 extends ch4 {
    @Override // defpackage.ch4
    public final void B(g59 g59Var) throws IOException {
        g59Var.getClass();
        if (g59Var.toFile().mkdir()) {
            return;
        }
        w73 w73VarR = R(g59Var);
        if (w73VarR == null || !w73VarR.c) {
            ywb.o("failed to create directory: ", g59Var);
        }
    }

    @Override // defpackage.ch4
    public final void D(g59 g59Var) throws IOException {
        g59Var.getClass();
        if (Thread.interrupted()) {
            throw new InterruptedIOException("interrupted");
        }
        File file = g59Var.toFile();
        if (file.delete() || !file.exists()) {
            return;
        }
        ywb.o("failed to delete ", g59Var);
    }

    @Override // defpackage.ch4
    public final List N(g59 g59Var) throws IOException {
        File file = g59Var.toFile();
        String[] list = file.list();
        if (list == null) {
            if (file.exists()) {
                ywb.o("failed to list ", g59Var);
                return null;
            }
            fm3.g("no such file: ", g59Var);
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (String str : list) {
            str.getClass();
            arrayList.add(g59Var.e(str));
        }
        eu1.l0(arrayList);
        return arrayList;
    }

    @Override // defpackage.ch4
    public w73 R(g59 g59Var) {
        g59Var.getClass();
        File file = g59Var.toFile();
        boolean zIsFile = file.isFile();
        boolean zIsDirectory = file.isDirectory();
        long jLastModified = file.lastModified();
        long length = file.length();
        if (!zIsFile && !zIsDirectory && jLastModified == 0 && length == 0 && !file.exists()) {
            return null;
        }
        return new w73(zIsFile, zIsDirectory, null, Long.valueOf(length), null, Long.valueOf(jLastModified), null);
    }

    @Override // defpackage.ch4
    public final we6 T(g59 g59Var) {
        return new we6(new RandomAccessFile(g59Var.toFile(), "r"));
    }

    @Override // defpackage.ch4
    public final bfc U(g59 g59Var, boolean z) throws IOException {
        g59Var.getClass();
        if (!z || !L(g59Var)) {
            return new uw8(new FileOutputStream(g59Var.toFile(), false), new fmd());
        }
        throw new IOException(g59Var + " already exists.");
    }

    @Override // defpackage.ch4
    public final bfc f(g59 g59Var) {
        g59Var.getClass();
        return new uw8(new FileOutputStream(g59Var.toFile(), true), new fmd());
    }

    @Override // defpackage.ch4
    public final ikc g0(g59 g59Var) {
        g59Var.getClass();
        return new y26(new FileInputStream(g59Var.toFile()), fmd.d);
    }

    @Override // defpackage.ch4
    public void m(g59 g59Var, g59 g59Var2) throws IOException {
        g59Var.getClass();
        g59Var2.getClass();
        if (g59Var.toFile().renameTo(g59Var2.toFile())) {
            return;
        }
        throw new IOException("failed to move " + g59Var + " to " + g59Var2);
    }

    public String toString() {
        return "JvmSystemFileSystem";
    }
}
