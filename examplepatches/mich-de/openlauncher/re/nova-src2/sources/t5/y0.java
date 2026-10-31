package t5;

import android.os.FileObserver;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import kotlin.jvm.functions.Function1;

/* loaded from: classes2.dex */
public final class y0 extends FileObserver {

    /* renamed from: b, reason: collision with root package name */
    public static final Object f88753b = new Object();

    /* renamed from: c, reason: collision with root package name */
    public static final LinkedHashMap f88754c = new LinkedHashMap();

    /* renamed from: a, reason: collision with root package name */
    public final CopyOnWriteArrayList f88755a;

    public y0(String str) {
        super(str, 128);
        this.f88755a = new CopyOnWriteArrayList();
    }

    @Override // android.os.FileObserver
    public final void onEvent(int i5, String str) {
        Iterator it = this.f88755a.iterator();
        while (it.hasNext()) {
            ((Function1) it.next()).invoke(str);
        }
    }
}
