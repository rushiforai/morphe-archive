package r80;

import java.util.EnumSet;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class d {

    @NotNull
    public static final c Companion;

    /* renamed from: a, reason: collision with root package name */
    public static final EnumSet f85654a;

    /* renamed from: b, reason: collision with root package name */
    public static final d f85655b;

    /* renamed from: c, reason: collision with root package name */
    public static final d f85656c;

    /* renamed from: d, reason: collision with root package name */
    public static final d f85657d;

    /* renamed from: e, reason: collision with root package name */
    public static final d f85658e;

    /* renamed from: f, reason: collision with root package name */
    public static final d f85659f;

    /* renamed from: g, reason: collision with root package name */
    public static final d f85660g;

    /* renamed from: h, reason: collision with root package name */
    public static final d f85661h;

    /* renamed from: i, reason: collision with root package name */
    public static final d f85662i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ d[] f85663j;

    static {
        d dVar = new d("APP_COMPONENT", 0);
        f85655b = dVar;
        d dVar2 = new d("DEVELOPER_SHORTCUT", 1);
        f85656c = dVar2;
        d dVar3 = new d("SEARCH_MORE", 2);
        f85657d = dVar3;
        d dVar4 = new d("STATIC_NAVIGATION", 3);
        f85658e = dVar4;
        d dVar5 = new d("BRANCH_NAVIGATION", 4);
        f85659f = dVar5;
        d dVar6 = new d("CONTACT", 5);
        f85660g = dVar6;
        d dVar7 = new d("API", 6);
        f85661h = dVar7;
        d dVar8 = new d("CUSTOM", 7);
        f85662i = dVar8;
        d[] dVarArr = {dVar, dVar2, dVar3, dVar4, dVar5, dVar6, dVar7, dVar8};
        f85663j = dVarArr;
        EnumEntriesKt.a(dVarArr);
        Companion = new c();
        f85654a = EnumSet.of(dVar2, dVar4, dVar5, dVar7);
    }

    public static d valueOf(String str) {
        return (d) Enum.valueOf(d.class, str);
    }

    public static d[] values() {
        return (d[]) f85663j.clone();
    }

    public final boolean a() {
        int iOrdinal = ordinal();
        return iOrdinal == 0 || iOrdinal == 1 || iOrdinal == 2 || iOrdinal == 3 || iOrdinal == 4 || iOrdinal == 6;
    }
}
