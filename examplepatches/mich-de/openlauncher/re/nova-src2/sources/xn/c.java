package xn;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: c, reason: collision with root package name */
    public static final c f96182c = new c();

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f96183a = new ArrayList();

    /* renamed from: b, reason: collision with root package name */
    public final ArrayList f96184b = new ArrayList();

    public static c c() {
        return f96182c;
    }

    public final Collection a() {
        return Collections.unmodifiableCollection(this.f96184b);
    }

    public final Collection b() {
        return Collections.unmodifiableCollection(this.f96183a);
    }
}
