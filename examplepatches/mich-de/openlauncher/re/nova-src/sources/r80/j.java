package r80;

import com.fyber.inneractive.sdk.external.NativeAdContent;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public static final j f85683a;

    /* renamed from: b, reason: collision with root package name */
    public static final j f85684b;

    /* renamed from: c, reason: collision with root package name */
    public static final j f85685c;

    /* renamed from: d, reason: collision with root package name */
    public static final j f85686d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ j[] f85687e;

    static {
        j jVar = new j("SEARCH", 0);
        f85683a = jVar;
        j jVar2 = new j("ZERO_STATE", 1);
        f85684b = jVar2;
        j jVar3 = new j("FEED", 2);
        f85685c = jVar3;
        j jVar4 = new j(NativeAdContent.ViewTag.OTHER, 3);
        f85686d = jVar4;
        j[] jVarArr = {jVar, jVar2, jVar3, jVar4};
        f85687e = jVarArr;
        EnumEntriesKt.a(jVarArr);
    }

    public static j valueOf(String str) {
        return (j) Enum.valueOf(j.class, str);
    }

    public static j[] values() {
        return (j[]) f85687e.clone();
    }
}
