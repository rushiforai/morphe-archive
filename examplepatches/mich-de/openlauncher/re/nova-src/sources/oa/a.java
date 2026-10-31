package oa;

import java.lang.Character;

/* loaded from: classes2.dex */
public abstract /* synthetic */ class a {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f80299a;

    static {
        int[] iArr = new int[Character.UnicodeScript.values().length];
        f80299a = iArr;
        try {
            iArr[Character.UnicodeScript.HAN.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
    }
}
