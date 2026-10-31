package vk;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class i implements g {

    /* renamed from: a, reason: collision with root package name */
    public static final i f92814a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ i[] f92815b;

    static {
        i iVar = new i("INSTANCE", 0);
        f92814a = iVar;
        f92815b = new i[]{iVar};
    }

    public static i valueOf(String str) {
        return (i) Enum.valueOf(i.class, str);
    }

    public static i[] values() {
        return (i[]) f92815b.clone();
    }

    @Override // vk.g
    public final Object apply(Object obj) {
        obj.getClass();
        return obj.toString();
    }

    @Override // java.lang.Enum
    public final String toString() {
        return "Functions.toStringFunction()";
    }
}
