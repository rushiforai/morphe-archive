package defpackage;

import com.medium.reader.R;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class iub {
    public static final iub CATALOGS;
    public static final iub POSTS;
    public static final iub PUBLICATIONS;
    public static final iub TAGS;
    public static final iub USERS;
    public static final /* synthetic */ iub[] b;
    public static final /* synthetic */ i04 c;
    public final int a;

    static {
        iub iubVar = new iub("POSTS", 0, R.string.search_tab_stories);
        POSTS = iubVar;
        iub iubVar2 = new iub("USERS", 1, R.string.search_tab_people);
        USERS = iubVar2;
        iub iubVar3 = new iub("PUBLICATIONS", 2, R.string.search_tab_publications);
        PUBLICATIONS = iubVar3;
        iub iubVar4 = new iub("TAGS", 3, R.string.search_tab_topics);
        TAGS = iubVar4;
        iub iubVar5 = new iub("CATALOGS", 4, R.string.search_tab_lists);
        CATALOGS = iubVar5;
        iub[] iubVarArr = {iubVar, iubVar2, iubVar3, iubVar4, iubVar5};
        b = iubVarArr;
        c = new i04(iubVarArr);
    }

    public iub(String str, int i, int i2) {
        this.a = i2;
    }

    public static g04 getEntries() {
        return c;
    }

    public static iub valueOf(String str) {
        return (iub) Enum.valueOf(iub.class, str);
    }

    public static iub[] values() {
        return (iub[]) b.clone();
    }

    public final int getTitleResId() {
        return this.a;
    }
}
