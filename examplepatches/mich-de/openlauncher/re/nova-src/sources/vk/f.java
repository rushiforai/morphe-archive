package vk;

import java.io.Serializable;

/* loaded from: classes.dex */
public final class f extends b0 implements Serializable {

    /* renamed from: b, reason: collision with root package name */
    public static final f f92811b = new f(0);

    /* renamed from: c, reason: collision with root package name */
    public static final f f92812c = new f(1);

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f92813a;

    public /* synthetic */ f(int i5) {
        this.f92813a = i5;
    }

    @Override // vk.b0
    public final boolean k(Object obj, Object obj2) {
        switch (this.f92813a) {
            case 0:
                return obj.equals(obj2);
            default:
                return false;
        }
    }

    @Override // vk.b0
    public final int l(Object obj) {
        switch (this.f92813a) {
            case 0:
                return obj.hashCode();
            default:
                return System.identityHashCode(obj);
        }
    }
}
