package defpackage;

import java.io.File;
import java.util.ArrayDeque;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ih4 extends e1 {
    public final ArrayDeque c;
    public final /* synthetic */ hi3 d;

    public ih4(hi3 hi3Var) {
        this.d = hi3Var;
        ArrayDeque arrayDeque = new ArrayDeque();
        this.c = arrayDeque;
        File file = (File) hi3Var.b;
        if (file.isDirectory()) {
            arrayDeque.push(b(file));
        } else if (!file.isFile()) {
            this.a = 2;
        } else {
            file.getClass();
            arrayDeque.push(new fh4(file));
        }
    }

    @Override // defpackage.e1
    public final void a() {
        File file;
        File fileA;
        while (true) {
            ArrayDeque arrayDeque = this.c;
            jh4 jh4Var = (jh4) arrayDeque.peek();
            if (jh4Var == null) {
                file = null;
                break;
            }
            fileA = jh4Var.a();
            if (fileA == null) {
                arrayDeque.pop();
            } else if (fileA.equals(jh4Var.a) || !fileA.isDirectory() || arrayDeque.size() >= Integer.MAX_VALUE) {
                break;
            } else {
                arrayDeque.push(b(fileA));
            }
        }
        file = fileA;
        if (file == null) {
            this.a = 2;
        } else {
            this.b = file;
            this.a = 1;
        }
    }

    public final dh4 b(File file) {
        int i = hh4.a[((lh4) this.d.c).ordinal()];
        if (i == 1) {
            file.getClass();
            return new gh4(file);
        }
        if (i == 2) {
            file.getClass();
            return new eh4(file);
        }
        ygf.a();
        return null;
    }
}
