package defpackage;

import android.widget.ImageView;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class rpe {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[c87.values().length];
        try {
            iArr[c87.Verbose.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[c87.Debug.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[c87.Info.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[c87.Warn.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[c87.Error.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        int[] iArr2 = new int[ImageView.ScaleType.values().length];
        try {
            iArr2[ImageView.ScaleType.FIT_START.ordinal()] = 1;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr2[ImageView.ScaleType.FIT_CENTER.ordinal()] = 2;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr2[ImageView.ScaleType.FIT_END.ordinal()] = 3;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr2[ImageView.ScaleType.CENTER_INSIDE.ordinal()] = 4;
        } catch (NoSuchFieldError unused9) {
        }
        a = iArr2;
    }
}
