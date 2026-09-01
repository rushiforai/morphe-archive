package defpackage;

import android.os.FileObserver;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x58 extends FileObserver {
    public static final Object b = new Object();
    public static final LinkedHashMap c = new LinkedHashMap();
    public final CopyOnWriteArrayList a;

    public x58(String str) {
        super(str, 128);
        this.a = new CopyOnWriteArrayList();
    }

    @Override // android.os.FileObserver
    public final void onEvent(int i, String str) {
        Iterator it2 = this.a.iterator();
        while (it2.hasNext()) {
            ((x45) it2.next()).invoke(str);
        }
    }
}
