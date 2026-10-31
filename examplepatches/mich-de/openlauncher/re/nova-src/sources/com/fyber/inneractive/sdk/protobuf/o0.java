package com.fyber.inneractive.sdk.protobuf;

/* loaded from: classes.dex */
public abstract /* synthetic */ class o0 {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f30866a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ int[] f30867b;

    static {
        int[] iArr = new int[JavaType.values().length];
        f30867b = iArr;
        try {
            iArr[JavaType.BYTE_STRING.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f30867b[JavaType.MESSAGE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f30867b[JavaType.STRING.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        int[] iArr2 = new int[p0.values().length];
        f30866a = iArr2;
        try {
            iArr2[p0.MAP.ordinal()] = 1;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            f30866a[p0.VECTOR.ordinal()] = 2;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            f30866a[p0.SCALAR.ordinal()] = 3;
        } catch (NoSuchFieldError unused6) {
        }
    }
}
