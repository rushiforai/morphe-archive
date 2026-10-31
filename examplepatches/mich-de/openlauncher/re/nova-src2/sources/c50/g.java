package c50;

import b00.m;
import b00.t;
import h50.c0;
import java.util.LinkedHashMap;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashMap f19697a = new LinkedHashMap();

    /* renamed from: b, reason: collision with root package name */
    public final LinkedHashMap f19698b = new LinkedHashMap();

    /* renamed from: c, reason: collision with root package name */
    public final LinkedHashMap f19699c = new LinkedHashMap();

    /* renamed from: d, reason: collision with root package name */
    public final m f19700d = new m(24);

    /* renamed from: e, reason: collision with root package name */
    public boolean f19701e = true;

    /* renamed from: f, reason: collision with root package name */
    public boolean f19702f = true;

    public g() {
        int i5 = s50.i.f86690a;
    }

    public final void a(c0 plugin, Function1 function1) {
        Intrinsics.g(plugin, "plugin");
        s50.a key = plugin.getKey();
        LinkedHashMap linkedHashMap = this.f19698b;
        linkedHashMap.put(plugin.getKey(), new f((Function1) linkedHashMap.get(key), function1, 0));
        s50.a key2 = plugin.getKey();
        LinkedHashMap linkedHashMap2 = this.f19697a;
        if (linkedHashMap2.containsKey(key2)) {
            return;
        }
        linkedHashMap2.put(plugin.getKey(), new t(plugin, 6));
    }
}
