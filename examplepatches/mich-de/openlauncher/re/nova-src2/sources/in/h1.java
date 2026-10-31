package in;

import com.google.gson.stream.JsonToken;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class h1 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f61703a;

    static {
        int[] iArr = new int[JsonToken.values().length];
        f61703a = iArr;
        try {
            iArr[JsonToken.NUMBER.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f61703a[JsonToken.STRING.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f61703a[JsonToken.BOOLEAN.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
    }
}
