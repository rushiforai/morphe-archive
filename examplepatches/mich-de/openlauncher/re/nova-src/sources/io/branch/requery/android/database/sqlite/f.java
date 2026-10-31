package io.branch.requery.android.database.sqlite;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public static final f f61824a;

    /* renamed from: b, reason: collision with root package name */
    public static final f f61825b;

    /* renamed from: c, reason: collision with root package name */
    public static final f f61826c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ f[] f61827d;

    static {
        f fVar = new f("NORMAL", 0);
        f61824a = fVar;
        f fVar2 = new f("RECONFIGURE", 1);
        f61825b = fVar2;
        f fVar3 = new f("DISCARD", 2);
        f61826c = fVar3;
        f61827d = new f[]{fVar, fVar2, fVar3};
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f61827d.clone();
    }
}
