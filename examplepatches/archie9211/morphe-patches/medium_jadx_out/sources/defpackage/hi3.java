package defpackage;

import java.io.File;
import java.util.Iterator;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class hi3 implements mzb {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public hi3(File file, lh4 lh4Var) {
        this.a = 1;
        file.getClass();
        lh4Var.getClass();
        this.b = file;
        this.c = lh4Var;
    }

    @Override // defpackage.mzb
    public final Iterator iterator() {
        switch (this.a) {
            case 0:
                return new gi3(new yh4((zh4) this.b), (mr9) this.c);
            case 1:
                return new ih4(this);
            case 2:
                return new u75(this, (byte) 0);
            case 3:
                return new yh4(this);
            default:
                return new u75(this);
        }
    }

    public /* synthetic */ hi3(Object obj, j55 j55Var, int i) {
        this.a = i;
        this.b = obj;
        this.c = j55Var;
    }

    public hi3(mzb mzbVar, x45 x45Var) {
        this.a = 3;
        mzbVar.getClass();
        this.b = mzbVar;
        this.c = x45Var;
    }
}
