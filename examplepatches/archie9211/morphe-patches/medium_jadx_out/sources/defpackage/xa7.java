package defpackage;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class xa7 {
    public static final xa7 DEFAULT;
    public static final xa7 STRING;
    public static final /* synthetic */ xa7[] a;

    static {
        xa7 xa7Var = new xa7() { // from class: va7
            @Override // defpackage.xa7
            public final jud a() {
                return qvd.k;
            }

            @Override // defpackage.xa7
            public dc6 serialize(Long l) {
                return l == null ? pc6.a : new zc6(l);
            }
        };
        DEFAULT = xa7Var;
        xa7 xa7Var2 = new xa7() { // from class: wa7
            @Override // defpackage.xa7
            public final jud a() {
                return qvd.l;
            }

            @Override // defpackage.xa7
            public dc6 serialize(Long l) {
                return l == null ? pc6.a : new zc6(l.toString());
            }
        };
        STRING = xa7Var2;
        a = new xa7[]{xa7Var, xa7Var2};
    }

    public static xa7 valueOf(String str) {
        return (xa7) Enum.valueOf(xa7.class, str);
    }

    public static xa7[] values() {
        return (xa7[]) a.clone();
    }

    public abstract jud a();

    public abstract dc6 serialize(Long l);
}
