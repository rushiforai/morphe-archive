package defpackage;

import com.medium.reader.R;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eza {
    public static final eza ALL;
    public static final eza COLLECTIONS;
    public static final eza TAGS;
    public static final eza WRITERS;
    public static final /* synthetic */ eza[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    static {
        eza ezaVar = new eza("ALL", 0, R.string.refine_recommendations_following_filter_all);
        ALL = ezaVar;
        eza ezaVar2 = new eza("WRITERS", 1, R.string.refine_recommendations_following_filter_writers);
        WRITERS = ezaVar2;
        eza ezaVar3 = new eza("COLLECTIONS", 2, R.string.refine_recommendations_following_filter_publications);
        COLLECTIONS = ezaVar3;
        eza ezaVar4 = new eza("TAGS", 3, R.string.refine_recommendations_following_filter_tags);
        TAGS = ezaVar4;
        eza[] ezaVarArr = {ezaVar, ezaVar2, ezaVar3, ezaVar4};
        b = ezaVarArr;
        c = new i04(ezaVarArr);
    }

    public eza(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static eza valueOf(String str) {
        return (eza) Enum.valueOf(eza.class, str);
    }

    public static eza[] values() {
        return (eza[]) b.clone();
    }

    public final int getTitleResId() {
        return this.a;
    }
}
