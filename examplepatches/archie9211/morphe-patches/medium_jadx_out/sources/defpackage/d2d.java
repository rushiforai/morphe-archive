package defpackage;

import com.medium.reader.R;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class d2d {
    public static final d2d ALL;
    public static final d2d FRIENDS;
    public static final d2d PUBLICATIONS;
    public static final d2d TAGS;
    public static final d2d WRITERS;
    public static final /* synthetic */ d2d[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    static {
        d2d d2dVar = new d2d("ALL", 0, R.string.refine_recommendations_following_filter_all);
        ALL = d2dVar;
        d2d d2dVar2 = new d2d("FRIENDS", 1, R.string.refine_recommendations_following_filter_friends);
        FRIENDS = d2dVar2;
        d2d d2dVar3 = new d2d("PUBLICATIONS", 2, R.string.refine_recommendations_following_filter_publications);
        PUBLICATIONS = d2dVar3;
        d2d d2dVar4 = new d2d("TAGS", 3, R.string.refine_recommendations_following_filter_tags);
        TAGS = d2dVar4;
        d2d d2dVar5 = new d2d("WRITERS", 4, R.string.refine_recommendations_following_filter_writers);
        WRITERS = d2dVar5;
        d2d[] d2dVarArr = {d2dVar, d2dVar2, d2dVar3, d2dVar4, d2dVar5};
        b = d2dVarArr;
        c = new i04(d2dVarArr);
    }

    public d2d(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static d2d valueOf(String str) {
        return (d2d) Enum.valueOf(d2d.class, str);
    }

    public static d2d[] values() {
        return (d2d[]) b.clone();
    }

    public final int getTitleResId() {
        return this.a;
    }
}
