package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract /* synthetic */ class ja4 {
    public static final /* synthetic */ int[] a;

    static {
        int[] iArr = new int[ka4.values().length];
        try {
            iArr[ka4.Core.ordinal()] = 1;
        } catch (NoSuchFieldError unused) {
        }
        try {
            iArr[ka4.AppEvents.ordinal()] = 2;
        } catch (NoSuchFieldError unused2) {
        }
        try {
            iArr[ka4.CodelessEvents.ordinal()] = 3;
        } catch (NoSuchFieldError unused3) {
        }
        try {
            iArr[ka4.RestrictiveDataFiltering.ordinal()] = 4;
        } catch (NoSuchFieldError unused4) {
        }
        try {
            iArr[ka4.Instrument.ordinal()] = 5;
        } catch (NoSuchFieldError unused5) {
        }
        try {
            iArr[ka4.CrashReport.ordinal()] = 6;
        } catch (NoSuchFieldError unused6) {
        }
        try {
            iArr[ka4.CrashShield.ordinal()] = 7;
        } catch (NoSuchFieldError unused7) {
        }
        try {
            iArr[ka4.ThreadCheck.ordinal()] = 8;
        } catch (NoSuchFieldError unused8) {
        }
        try {
            iArr[ka4.ErrorReport.ordinal()] = 9;
        } catch (NoSuchFieldError unused9) {
        }
        try {
            iArr[ka4.AnrReport.ordinal()] = 10;
        } catch (NoSuchFieldError unused10) {
        }
        try {
            iArr[ka4.AAM.ordinal()] = 11;
        } catch (NoSuchFieldError unused11) {
        }
        try {
            iArr[ka4.CloudBridge.ordinal()] = 12;
        } catch (NoSuchFieldError unused12) {
        }
        try {
            iArr[ka4.PrivacyProtection.ordinal()] = 13;
        } catch (NoSuchFieldError unused13) {
        }
        try {
            iArr[ka4.SuggestedEvents.ordinal()] = 14;
        } catch (NoSuchFieldError unused14) {
        }
        try {
            iArr[ka4.IntelligentIntegrity.ordinal()] = 15;
        } catch (NoSuchFieldError unused15) {
        }
        try {
            iArr[ka4.StdParamEnforcement.ordinal()] = 16;
        } catch (NoSuchFieldError unused16) {
        }
        try {
            iArr[ka4.ProtectedMode.ordinal()] = 17;
        } catch (NoSuchFieldError unused17) {
        }
        try {
            iArr[ka4.BannedParamFiltering.ordinal()] = 18;
        } catch (NoSuchFieldError unused18) {
        }
        try {
            iArr[ka4.MACARuleMatching.ordinal()] = 19;
        } catch (NoSuchFieldError unused19) {
        }
        try {
            iArr[ka4.BlocklistEvents.ordinal()] = 20;
        } catch (NoSuchFieldError unused20) {
        }
        try {
            iArr[ka4.FilterRedactedEvents.ordinal()] = 21;
        } catch (NoSuchFieldError unused21) {
        }
        try {
            iArr[ka4.FilterSensitiveParams.ordinal()] = 22;
        } catch (NoSuchFieldError unused22) {
        }
        try {
            iArr[ka4.ModelRequest.ordinal()] = 23;
        } catch (NoSuchFieldError unused23) {
        }
        try {
            iArr[ka4.EventDeactivation.ordinal()] = 24;
        } catch (NoSuchFieldError unused24) {
        }
        try {
            iArr[ka4.OnDeviceEventProcessing.ordinal()] = 25;
        } catch (NoSuchFieldError unused25) {
        }
        try {
            iArr[ka4.OnDevicePostInstallEventProcessing.ordinal()] = 26;
        } catch (NoSuchFieldError unused26) {
        }
        try {
            iArr[ka4.IapLogging.ordinal()] = 27;
        } catch (NoSuchFieldError unused27) {
        }
        try {
            iArr[ka4.IapLoggingLib2.ordinal()] = 28;
        } catch (NoSuchFieldError unused28) {
        }
        try {
            iArr[ka4.IapLoggingLib5To7.ordinal()] = 29;
        } catch (NoSuchFieldError unused29) {
        }
        try {
            iArr[ka4.AndroidManualImplicitPurchaseDedupe.ordinal()] = 30;
        } catch (NoSuchFieldError unused30) {
        }
        try {
            iArr[ka4.AndroidManualImplicitSubsDedupe.ordinal()] = 31;
        } catch (NoSuchFieldError unused31) {
        }
        try {
            iArr[ka4.AndroidIAPSubscriptionAutoLogging.ordinal()] = 32;
        } catch (NoSuchFieldError unused32) {
        }
        try {
            iArr[ka4.Monitoring.ordinal()] = 33;
        } catch (NoSuchFieldError unused33) {
        }
        try {
            iArr[ka4.Megatron.ordinal()] = 34;
        } catch (NoSuchFieldError unused34) {
        }
        try {
            iArr[ka4.Elora.ordinal()] = 35;
        } catch (NoSuchFieldError unused35) {
        }
        try {
            iArr[ka4.GPSARATriggers.ordinal()] = 36;
        } catch (NoSuchFieldError unused36) {
        }
        try {
            iArr[ka4.GPSPACAProcessing.ordinal()] = 37;
        } catch (NoSuchFieldError unused37) {
        }
        try {
            iArr[ka4.GPSTopicsObservation.ordinal()] = 38;
        } catch (NoSuchFieldError unused38) {
        }
        try {
            iArr[ka4.ReferrerForDeepLink.ordinal()] = 39;
        } catch (NoSuchFieldError unused39) {
        }
        try {
            iArr[ka4.ServiceUpdateCompliance.ordinal()] = 40;
        } catch (NoSuchFieldError unused40) {
        }
        try {
            iArr[ka4.Login.ordinal()] = 41;
        } catch (NoSuchFieldError unused41) {
        }
        try {
            iArr[ka4.ChromeCustomTabsPrefetching.ordinal()] = 42;
        } catch (NoSuchFieldError unused42) {
        }
        try {
            iArr[ka4.IgnoreAppSwitchToLoggedOut.ordinal()] = 43;
        } catch (NoSuchFieldError unused43) {
        }
        try {
            iArr[ka4.BypassAppSwitch.ordinal()] = 44;
        } catch (NoSuchFieldError unused44) {
        }
        try {
            iArr[ka4.Share.ordinal()] = 45;
        } catch (NoSuchFieldError unused45) {
        }
        a = iArr;
    }
}
