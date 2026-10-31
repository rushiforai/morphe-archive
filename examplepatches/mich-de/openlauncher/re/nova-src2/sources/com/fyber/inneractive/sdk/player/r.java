package com.fyber.inneractive.sdk.player;

import com.fyber.inneractive.sdk.external.InneractiveVideoError;

/* loaded from: classes3.dex */
public abstract /* synthetic */ class r {

    /* renamed from: a, reason: collision with root package name */
    public static final /* synthetic */ int[] f30651a;

    static {
        int[] iArr = new int[InneractiveVideoError.Error.values().length];
        f30651a = iArr;
        try {
            iArr[InneractiveVideoError.Error.ERROR_NO_MEDIA_FILES.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            f30651a[InneractiveVideoError.Error.ERROR_FAILED_PLAYING_MEDIA_FILE.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            f30651a[InneractiveVideoError.Error.ERROR_FAILED_PLAYING_ALL_MEDIA_FILES.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            f30651a[InneractiveVideoError.Error.ERROR_PRE_BUFFER_TIMEOUT.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            f30651a[InneractiveVideoError.Error.ERROR_BUFFER_TIMEOUT.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
    }
}
