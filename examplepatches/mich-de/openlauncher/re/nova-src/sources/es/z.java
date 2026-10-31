package es;

import java.util.List;
import kotlin.LazyKt;
import kotlin.collections.EmptyList;

/* loaded from: classes4.dex */
public abstract class z {

    /* renamed from: a, reason: collision with root package name */
    public final String f53013a;

    /* renamed from: b, reason: collision with root package name */
    public final List f53014b;

    /* renamed from: c, reason: collision with root package name */
    public final a70.d f53015c;

    public z(String str, List list) {
        this.f53013a = str;
        this.f53014b = list;
        this.f53015c = LazyKt.a(new d00.t(this, 17));
    }

    public final String a() {
        return (String) this.f53015c.getValue();
    }

    public z(String str) {
        this(str, EmptyList.f71733a);
    }
}
