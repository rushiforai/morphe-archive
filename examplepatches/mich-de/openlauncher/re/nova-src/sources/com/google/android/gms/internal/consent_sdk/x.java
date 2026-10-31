package com.google.android.gms.internal.consent_sdk;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes3.dex */
public final class x {

    /* renamed from: a, reason: collision with root package name */
    public static final x f32286a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ x[] f32287b;

    /* JADX INFO: Fake field, exist only in values array */
    x EF0;

    static {
        x xVar = new x("DEBUG_PARAM_UNKNOWN", 0);
        x xVar2 = new x("ALWAYS_SHOW", 1);
        x xVar3 = new x("GEO_OVERRIDE_EEA", 2);
        x xVar4 = new x("GEO_OVERRIDE_REGULATED_US_STATE", 3);
        x xVar5 = new x("GEO_OVERRIDE_OTHER", 4);
        x xVar6 = new x("GEO_OVERRIDE_NON_EEA", 5);
        x xVar7 = new x("PREVIEWING_DEBUG_MESSAGES", 6);
        f32286a = xVar7;
        f32287b = new x[]{xVar, xVar2, xVar3, xVar4, xVar5, xVar6, xVar7, new x("GEO_OVERRIDE_USFL", 7)};
    }

    public static x[] values() {
        return (x[]) f32287b.clone();
    }
}
