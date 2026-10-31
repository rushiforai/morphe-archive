package w20;

import java.lang.ref.SoftReference;
import java.util.Map;
import kotlin.jvm.internal.markers.KMutableMap;

/* loaded from: classes4.dex */
public final class x implements Map.Entry, KMutableMap.Entry {

    /* renamed from: a, reason: collision with root package name */
    public final Object f93727a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f93728b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f93729c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f93730d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ y f93731e;

    public x(Object obj, Object obj2, y yVar) {
        this.f93729c = obj;
        this.f93730d = obj2;
        this.f93731e = yVar;
        this.f93727a = obj;
        this.f93728b = obj2;
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f93727a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f93728b;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        this.f93731e.f93732a.put(this.f93729c, new SoftReference(obj));
        return this.f93730d;
    }
}
