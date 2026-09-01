package defpackage;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yt2 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ mu2 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ yt2(mu2 mu2Var, int i) {
        super(0);
        this.a = i;
        this.b = mu2Var;
    }

    @Override // defpackage.m45
    public final Object invoke() throws IOException {
        switch (this.a) {
            case 0:
                return ((zg4) this.b.j.getValue()).c;
            default:
                wg4 wg4Var = this.b.a;
                File canonicalFile = ((File) wg4Var.c.invoke()).getCanonicalFile();
                synchronized (wg4.e) {
                    String absolutePath = canonicalFile.getAbsolutePath();
                    LinkedHashSet linkedHashSet = wg4.d;
                    if (linkedHashSet.contains(absolutePath)) {
                        throw new IllegalStateException(("There are multiple DataStores active for the same file: " + absolutePath + ". You should either maintain your DataStore as a singleton or confirm that there is no two DataStore's active on the same file (by confirming that the scope is cancelled).").toString());
                    }
                    absolutePath.getClass();
                    linkedHashSet.add(absolutePath);
                }
                return new zg4(canonicalFile, wg4Var.a, (b56) wg4Var.b.invoke(canonicalFile), new vp0(canonicalFile, 12));
        }
    }
}
