package kw;

import kotlin.LazyKt;
import kotlin.LazyThreadSafetyMode;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.Serializable;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Serializable
/* loaded from: classes4.dex */
public final class c {

    @NotNull
    public static final b Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final Object f72329a;

    /* renamed from: b, reason: collision with root package name */
    public static final c f72330b;

    /* renamed from: c, reason: collision with root package name */
    public static final c f72331c;

    /* renamed from: d, reason: collision with root package name */
    public static final c f72332d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ c[] f72333e;

    static {
        c cVar = new c("HIDDEN", 0);
        f72330b = cVar;
        c cVar2 = new c("OPTIONAL", 1);
        f72331c = cVar2;
        c cVar3 = new c("REQUIRED", 2);
        f72332d = cVar3;
        c[] cVarArr = {cVar, cVar2, cVar3};
        f72333e = cVarArr;
        EnumEntriesKt.a(cVarArr);
        Companion = new b();
        f72329a = LazyKt.b(LazyThreadSafetyMode.f71680b, new hv.g3(20));
    }

    public static c valueOf(String str) {
        return (c) Enum.valueOf(c.class, str);
    }

    public static c[] values() {
        return (c[]) f72333e.clone();
    }
}
