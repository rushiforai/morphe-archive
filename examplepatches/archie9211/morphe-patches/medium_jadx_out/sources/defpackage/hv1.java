package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class hv1 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[gv1.values().length];
        try {
            iArr[gv1.Background.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[gv1.Error.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[gv1.ErrorContainer.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[gv1.InverseOnSurface.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[gv1.InversePrimary.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[gv1.InverseSurface.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[gv1.OnBackground.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[gv1.OnError.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr[gv1.OnErrorContainer.ordinal()] = 9;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr[gv1.OnPrimary.ordinal()] = 10;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr[gv1.OnPrimaryContainer.ordinal()] = 11;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr[gv1.OnSecondary.ordinal()] = 12;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr[gv1.OnSecondaryContainer.ordinal()] = 13;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            iArr[gv1.OnSurface.ordinal()] = 14;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr[gv1.OnSurfaceVariant.ordinal()] = 15;
        } catch (NoSuchFieldError unused15) {
        }
        try {
            iArr[gv1.SurfaceTint.ordinal()] = 16;
        } catch (NoSuchFieldError unused16) {
        }
        try {
            iArr[gv1.OnTertiary.ordinal()] = 17;
        } catch (NoSuchFieldError unused17) {
        }
        try {
            iArr[gv1.OnTertiaryContainer.ordinal()] = 18;
        } catch (NoSuchFieldError unused18) {
        }
        try {
            iArr[gv1.Outline.ordinal()] = 19;
        } catch (NoSuchFieldError unused19) {
        }
        try {
            iArr[gv1.OutlineVariant.ordinal()] = 20;
        } catch (NoSuchFieldError unused20) {
        }
        try {
            iArr[gv1.Primary.ordinal()] = 21;
        } catch (NoSuchFieldError unused21) {
        }
        try {
            iArr[gv1.PrimaryContainer.ordinal()] = 22;
        } catch (NoSuchFieldError unused22) {
        }
        try {
            iArr[gv1.Scrim.ordinal()] = 23;
        } catch (NoSuchFieldError unused23) {
        }
        try {
            iArr[gv1.Secondary.ordinal()] = 24;
        } catch (NoSuchFieldError unused24) {
        }
        try {
            iArr[gv1.SecondaryContainer.ordinal()] = 25;
        } catch (NoSuchFieldError unused25) {
        }
        try {
            iArr[gv1.Surface.ordinal()] = 26;
        } catch (NoSuchFieldError unused26) {
        }
        try {
            iArr[gv1.SurfaceVariant.ordinal()] = 27;
        } catch (NoSuchFieldError unused27) {
        }
        try {
            iArr[gv1.SurfaceBright.ordinal()] = 28;
        } catch (NoSuchFieldError unused28) {
        }
        try {
            iArr[gv1.SurfaceContainer.ordinal()] = 29;
        } catch (NoSuchFieldError unused29) {
        }
        try {
            iArr[gv1.SurfaceContainerHigh.ordinal()] = 30;
        } catch (NoSuchFieldError unused30) {
        }
        try {
            iArr[gv1.SurfaceContainerHighest.ordinal()] = 31;
        } catch (NoSuchFieldError unused31) {
        }
        try {
            iArr[gv1.SurfaceContainerLow.ordinal()] = 32;
        } catch (NoSuchFieldError unused32) {
        }
        try {
            iArr[gv1.SurfaceContainerLowest.ordinal()] = 33;
        } catch (NoSuchFieldError unused33) {
        }
        try {
            iArr[gv1.SurfaceDim.ordinal()] = 34;
        } catch (NoSuchFieldError unused34) {
        }
        try {
            iArr[gv1.Tertiary.ordinal()] = 35;
        } catch (NoSuchFieldError unused35) {
        }
        try {
            iArr[gv1.TertiaryContainer.ordinal()] = 36;
        } catch (NoSuchFieldError unused36) {
        }
        try {
            iArr[gv1.PrimaryFixed.ordinal()] = 37;
        } catch (NoSuchFieldError unused37) {
        }
        try {
            iArr[gv1.PrimaryFixedDim.ordinal()] = 38;
        } catch (NoSuchFieldError unused38) {
        }
        try {
            iArr[gv1.OnPrimaryFixed.ordinal()] = 39;
        } catch (NoSuchFieldError unused39) {
        }
        try {
            iArr[gv1.OnPrimaryFixedVariant.ordinal()] = 40;
        } catch (NoSuchFieldError unused40) {
        }
        try {
            iArr[gv1.SecondaryFixed.ordinal()] = 41;
        } catch (NoSuchFieldError unused41) {
        }
        try {
            iArr[gv1.SecondaryFixedDim.ordinal()] = 42;
        } catch (NoSuchFieldError unused42) {
        }
        try {
            iArr[gv1.OnSecondaryFixed.ordinal()] = 43;
        } catch (NoSuchFieldError unused43) {
        }
        try {
            iArr[gv1.OnSecondaryFixedVariant.ordinal()] = 44;
        } catch (NoSuchFieldError unused44) {
        }
        try {
            iArr[gv1.TertiaryFixed.ordinal()] = 45;
        } catch (NoSuchFieldError unused45) {
        }
        try {
            iArr[gv1.TertiaryFixedDim.ordinal()] = 46;
        } catch (NoSuchFieldError unused46) {
        }
        try {
            iArr[gv1.OnTertiaryFixed.ordinal()] = 47;
        } catch (NoSuchFieldError unused47) {
        }
        try {
            iArr[gv1.OnTertiaryFixedVariant.ordinal()] = 48;
        } catch (NoSuchFieldError unused48) {
        }
        a = iArr;
    }
}
