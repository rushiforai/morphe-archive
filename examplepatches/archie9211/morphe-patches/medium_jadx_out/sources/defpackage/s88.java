package defpackage;

import com.medium.reader.R;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class s88 {
    public static final s88 ALL;
    public static final s88 PUBLICATIONS;
    public static final s88 WRITERS;
    public static final /* synthetic */ s88[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    static {
        s88 s88Var = new s88("ALL", 0, R.string.refine_recommendations_following_filter_all);
        ALL = s88Var;
        s88 s88Var2 = new s88("WRITERS", 1, R.string.refine_recommendations_following_filter_writers);
        WRITERS = s88Var2;
        s88 s88Var3 = new s88("PUBLICATIONS", 2, R.string.refine_recommendations_following_filter_publications);
        PUBLICATIONS = s88Var3;
        s88[] s88VarArr = {s88Var, s88Var2, s88Var3};
        b = s88VarArr;
        c = new i04(s88VarArr);
    }

    public s88(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static s88 valueOf(String str) {
        return (s88) Enum.valueOf(s88.class, str);
    }

    public static s88[] values() {
        return (s88[]) b.clone();
    }

    public final int getTitleResId() {
        return this.a;
    }

    public final int numberOfPublicationsToDisplay() {
        int i = r88.a[ordinal()];
        if (i == 1) {
            return 5;
        }
        if (i == 2) {
            return 0;
        }
        if (i == 3) {
            return 10;
        }
        ygf.a();
        return 0;
    }

    public final int numberOfWritersToDisplay() {
        int i = r88.a[ordinal()];
        if (i == 1) {
            return 5;
        }
        if (i == 2) {
            return 10;
        }
        if (i == 3) {
            return 0;
        }
        ygf.a();
        return 0;
    }
}
