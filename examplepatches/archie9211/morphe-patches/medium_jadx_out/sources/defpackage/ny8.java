package defpackage;

import android.database.DataSetObservable;
import android.database.DataSetObserver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class ny8 {
    public final DataSetObservable a = new DataSetObservable();
    public DataSetObserver b;

    public abstract int a();

    public final void b(h27 h27Var) {
        synchronized (this) {
            this.b = h27Var;
        }
    }
}
