package ny;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public static final a f78660a;

    /* renamed from: b, reason: collision with root package name */
    public static final a f78661b;

    /* renamed from: c, reason: collision with root package name */
    public static final a f78662c;

    /* renamed from: d, reason: collision with root package name */
    public static final a f78663d;

    /* renamed from: e, reason: collision with root package name */
    public static final a f78664e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ a[] f78665f;

    static {
        a aVar = new a("Background", 0);
        a aVar2 = new a(k.f40331e, 1);
        a aVar3 = new a("ErrorContainer", 2);
        a aVar4 = new a("InverseOnSurface", 3);
        a aVar5 = new a("InversePrimary", 4);
        a aVar6 = new a("InverseSurface", 5);
        a aVar7 = new a("OnBackground", 6);
        a aVar8 = new a("OnError", 7);
        a aVar9 = new a("OnErrorContainer", 8);
        a aVar10 = new a("OnPrimary", 9);
        f78660a = aVar10;
        a aVar11 = new a("OnPrimaryContainer", 10);
        a aVar12 = new a("OnSecondary", 11);
        a aVar13 = new a("OnSecondaryContainer", 12);
        a aVar14 = new a("OnSurface", 13);
        f78661b = aVar14;
        a aVar15 = new a("OnSurfaceVariant", 14);
        f78662c = aVar15;
        a aVar16 = new a("OnTertiary", 15);
        a aVar17 = new a("OnTertiaryContainer", 16);
        a aVar18 = new a("Outline", 17);
        a aVar19 = new a("Primary", 18);
        f78663d = aVar19;
        a aVar20 = new a("PrimaryContainer", 19);
        a aVar21 = new a("Secondary", 20);
        a aVar22 = new a("SecondaryContainer", 21);
        a aVar23 = new a("Surface", 22);
        a aVar24 = new a("SurfaceVariant", 23);
        f78664e = aVar24;
        a[] aVarArr = {aVar, aVar2, aVar3, aVar4, aVar5, aVar6, aVar7, aVar8, aVar9, aVar10, aVar11, aVar12, aVar13, aVar14, aVar15, aVar16, aVar17, aVar18, aVar19, aVar20, aVar21, aVar22, aVar23, aVar24, new a("Tertiary", 24), new a("TertiaryContainer", 25)};
        f78665f = aVarArr;
        EnumEntriesKt.a(aVarArr);
    }

    public static a valueOf(String str) {
        return (a) Enum.valueOf(a.class, str);
    }

    public static a[] values() {
        return (a[]) f78665f.clone();
    }
}
