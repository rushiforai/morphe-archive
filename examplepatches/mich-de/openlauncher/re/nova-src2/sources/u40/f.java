package u40;

import com.fyber.inneractive.sdk.external.NativeAdContent;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class f {

    /* renamed from: a, reason: collision with root package name */
    public static final f f90584a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ f[] f90585b;

    /* JADX INFO: Fake field, exist only in values array */
    f EF0;

    static {
        f fVar = new f("SEARCH", 0);
        f fVar2 = new f("ZERO_STATE", 1);
        f fVar3 = new f("FEED", 2);
        f fVar4 = new f(NativeAdContent.ViewTag.OTHER, 3);
        f90584a = fVar4;
        f90585b = new f[]{fVar, fVar2, fVar3, fVar4};
    }

    public static f valueOf(String str) {
        return (f) Enum.valueOf(f.class, str);
    }

    public static f[] values() {
        return (f[]) f90585b.clone();
    }
}
