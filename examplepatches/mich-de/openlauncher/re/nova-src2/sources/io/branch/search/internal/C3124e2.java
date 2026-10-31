package io.branch.search.internal;

import java.util.HashMap;
import java.util.List;
import kotlin.jvm.internal.TypeIntrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.e2, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3124e2 extends HashMap<EnumC3107d2, List<InterfaceC3298o7>> {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public static final C3124e2 f64361a = new C3124e2();

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsKey(Object obj) {
        if (obj instanceof EnumC3107d2) {
            return super.containsKey((EnumC3107d2) obj);
        }
        return false;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ boolean containsValue(Object obj) {
        if (TypeIntrinsics.g(obj)) {
            return super.containsValue((List) obj);
        }
        return false;
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object get(Object obj) {
        if (obj instanceof EnumC3107d2) {
            return (List) super.get((EnumC3107d2) obj);
        }
        return null;
    }

    @Override // java.util.HashMap, java.util.Map
    public final /* bridge */ Object getOrDefault(Object obj, Object obj2) {
        return !(obj instanceof EnumC3107d2) ? obj2 : (List) super.getOrDefault((EnumC3107d2) obj, (List) obj2);
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public final /* bridge */ Object remove(Object obj) {
        if (obj instanceof EnumC3107d2) {
            return (List) super.remove((EnumC3107d2) obj);
        }
        return null;
    }

    @Override // java.util.HashMap, java.util.Map
    public final /* bridge */ boolean remove(Object obj, Object obj2) {
        if ((obj instanceof EnumC3107d2) && TypeIntrinsics.g(obj2)) {
            return super.remove((EnumC3107d2) obj, (List) obj2);
        }
        return false;
    }
}
