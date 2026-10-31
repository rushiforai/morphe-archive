package z1;

import java.util.ConcurrentModificationException;
import java.util.Map;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.markers.KMutableMap;

/* loaded from: classes2.dex */
public final class x implements Map.Entry, KMutableMap.Entry {

    /* renamed from: a, reason: collision with root package name */
    public final Object f97988a;

    /* renamed from: b, reason: collision with root package name */
    public Object f97989b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ y f97990c;

    public x(y yVar) {
        this.f97990c = yVar;
        Map.Entry entry = yVar.f97994d;
        Intrinsics.d(entry);
        this.f97988a = entry.getKey();
        Map.Entry entry2 = yVar.f97994d;
        Intrinsics.d(entry2);
        this.f97989b = entry2.getValue();
    }

    @Override // java.util.Map.Entry
    public final Object getKey() {
        return this.f97988a;
    }

    @Override // java.util.Map.Entry
    public final Object getValue() {
        return this.f97989b;
    }

    @Override // java.util.Map.Entry
    public final Object setValue(Object obj) {
        y yVar = this.f97990c;
        if (yVar.f97991a.b().f97957d != yVar.f97993c) {
            throw new ConcurrentModificationException();
        }
        Object obj2 = this.f97989b;
        yVar.f97991a.put(this.f97988a, obj);
        this.f97989b = obj;
        return obj2;
    }
}
