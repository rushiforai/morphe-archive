package m1;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public static final v f75781a;

    /* renamed from: b, reason: collision with root package name */
    public static final v f75782b;

    /* renamed from: c, reason: collision with root package name */
    public static final v f75783c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ v[] f75784d;

    static {
        v vVar = new v("Focused", 0);
        f75781a = vVar;
        v vVar2 = new v("UnfocusedEmpty", 1);
        f75782b = vVar2;
        v vVar3 = new v("UnfocusedNotEmpty", 2);
        f75783c = vVar3;
        f75784d = new v[]{vVar, vVar2, vVar3};
    }

    public static v valueOf(String str) {
        return (v) Enum.valueOf(v.class, str);
    }

    public static v[] values() {
        return (v[]) f75784d.clone();
    }
}
