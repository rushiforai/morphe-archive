package qb0;

import ib0.i;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class b implements i {

    /* renamed from: a, reason: collision with root package name */
    public static final b f83911a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ b[] f83912b;

    static {
        b bVar = new b("INSTANCE", 0);
        f83911a = bVar;
        f83912b = new b[]{bVar};
    }

    public static b valueOf(String str) {
        return (b) Enum.valueOf(b.class, str);
    }

    public static b[] values() {
        return (b[]) f83912b.clone();
    }

    @Override // ib0.i
    public final boolean a() {
        return true;
    }

    @Override // ib0.i
    public final void b() {
    }
}
