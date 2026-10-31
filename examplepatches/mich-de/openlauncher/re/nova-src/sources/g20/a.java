package g20;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f56915a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f56916b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f56917c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f56918d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f56919e;

    /* renamed from: f, reason: collision with root package name */
    public static final a f56920f;

    /* renamed from: g, reason: collision with root package name */
    public static final a f56921g;

    /* renamed from: h, reason: collision with root package name */
    public static final a f56922h;

    /* renamed from: i, reason: collision with root package name */
    public static final a f56923i;

    /* renamed from: j, reason: collision with root package name */
    public static final a f56924j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ a[] f56925k;

    static {
        a aVar = new a("Spotify", 0);
        f56915a = aVar;
        a aVar2 = new a("Deezer", 1);
        f56916b = aVar2;
        a aVar3 = new a("Calendar", 2);
        f56917c = aVar3;
        a aVar4 = new a("Twitch", 3);
        f56918d = aVar4;
        a aVar5 = new a("Slack", 4);
        f56919e = aVar5;
        a aVar6 = new a("Files", 5);
        f56920f = aVar6;
        a aVar7 = new a("Discord", 6);
        f56921g = aVar7;
        a aVar8 = new a("Dropbox", 7);
        f56922h = aVar8;
        a aVar9 = new a("OneDrive", 8);
        f56923i = aVar9;
        a aVar10 = new a("Github", 9);
        f56924j = aVar10;
        a[] aVarArr = {aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8, aVar9, aVar10};
        f56925k = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f56925k.clone();
    }
}
