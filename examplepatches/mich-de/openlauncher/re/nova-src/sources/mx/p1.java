package mx;

import android.os.Looper;
import java.util.ArrayList;
import java.util.HashSet;

/* loaded from: classes4.dex */
public abstract class p1 {

    /* renamed from: a, reason: collision with root package name */
    public static final HashSet f77224a = new HashSet();

    /* renamed from: b, reason: collision with root package name */
    public static final ArrayList f77225b = new ArrayList();

    /* renamed from: c, reason: collision with root package name */
    public static final n1 f77226c = new n1(0);

    /* renamed from: d, reason: collision with root package name */
    public static final o1 f77227d = new o1();

    public static void a(Object obj) {
        boolean z11;
        HashSet hashSet = f77224a;
        synchronized (hashSet) {
            synchronized (hashSet) {
                z11 = hashSet.size() > 0;
            }
        }
        hashSet.add(obj);
        hashSet.notifyAll();
        if (!z11) {
            ArrayList arrayList = f77225b;
            int size = arrayList.size() - 1;
            if (size >= 0) {
                arrayList.get(size).getClass();
                throw new ClassCastException();
            }
        }
    }

    public static void b(Object obj) {
        boolean z11;
        HashSet hashSet = f77224a;
        synchronized (hashSet) {
            hashSet.remove(obj);
            hashSet.notifyAll();
            synchronized (hashSet) {
                z11 = hashSet.size() > 0;
            }
        }
        if (!z11) {
            ArrayList arrayList = f77225b;
            int size = arrayList.size() - 1;
            if (size >= 0) {
                arrayList.get(size).getClass();
                throw new ClassCastException();
            }
        }
    }

    public static void c(String str) {
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("Nova.UiLock");
            bVar.d("Ignore attempt to waitForIdle from Ui Thread. %s", str);
            return;
        }
        synchronized (f77224a) {
            while (true) {
                try {
                    HashSet hashSet = f77224a;
                    if (hashSet.size() > 0) {
                        hashSet.wait();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
    }
}
