package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class ye4 implements Runnable {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ j50 b;

    public /* synthetic */ ye4(j50 j50Var) {
        this.b = j50Var;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i = this.a;
        j50 j50Var = this.b;
        switch (i) {
            case 0:
                j50Var.getClass();
                break;
            default:
                j50Var.getClass();
                na4.a(new z10(5), ka4.AAM);
                na4.a(new z10(18), ka4.RestrictiveDataFiltering);
                na4.a(new z10(19), ka4.PrivacyProtection);
                na4.a(new z10(20), ka4.EventDeactivation);
                na4.a(new z10(6), ka4.BannedParamFiltering);
                na4.a(new z10(7), ka4.IapLogging);
                na4.a(new z10(8), ka4.StdParamEnforcement);
                na4.a(new z10(9), ka4.ProtectedMode);
                na4.a(new z10(10), ka4.MACARuleMatching);
                na4.a(new z10(11), ka4.BlocklistEvents);
                na4.a(new z10(12), ka4.FilterRedactedEvents);
                na4.a(new z10(13), ka4.FilterSensitiveParams);
                na4.a(new z10(14), ka4.CloudBridge);
                na4.a(new z10(15), ka4.GPSARATriggers);
                na4.a(new z10(16), ka4.GPSPACAProcessing);
                na4.a(new z10(17), ka4.GPSTopicsObservation);
                break;
        }
    }

    public /* synthetic */ ye4(j50 j50Var, xe4 xe4Var) {
        this.b = j50Var;
    }
}
