package un;

import com.fyber.inneractive.sdk.external.NativeAdContent;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public static final f f91380a;

    /* renamed from: b, reason: collision with root package name */
    public static final f f91381b;

    /* renamed from: c, reason: collision with root package name */
    public static final f f91382c;

    /* renamed from: d, reason: collision with root package name */
    public static final f f91383d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ f[] f91384e;

    static {
        f fVar = new f("VIDEO_CONTROLS", 0);
        f91380a = fVar;
        f fVar2 = new f("CLOSE_AD", 1);
        f91381b = fVar2;
        f fVar3 = new f("NOT_VISIBLE", 2);
        f91382c = fVar3;
        f fVar4 = new f(NativeAdContent.ViewTag.OTHER, 3);
        f91383d = fVar4;
        f91384e = new f[]{fVar, fVar2, fVar3, fVar4};
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f91384e.clone();
    }
}
