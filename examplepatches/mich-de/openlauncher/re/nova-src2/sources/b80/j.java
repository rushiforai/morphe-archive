package b80;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public static final j f17636a;

    /* renamed from: b, reason: collision with root package name */
    public static final j f17637b;

    /* renamed from: c, reason: collision with root package name */
    public static final j f17638c;

    /* renamed from: d, reason: collision with root package name */
    public static final j f17639d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ j[] f17640e;

    static {
        j jVar = new j("SUCCESSFUL", 0);
        f17636a = jVar;
        j jVar2 = new j("REREGISTER", 1);
        f17637b = jVar2;
        j jVar3 = new j("CANCELLED", 2);
        f17638c = jVar3;
        j jVar4 = new j("ALREADY_SELECTED", 3);
        f17639d = jVar4;
        j[] jVarArr = {jVar, jVar2, jVar3, jVar4};
        f17640e = jVarArr;
        EnumEntriesKt.a(jVarArr);
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f17640e.clone();
    }
}
