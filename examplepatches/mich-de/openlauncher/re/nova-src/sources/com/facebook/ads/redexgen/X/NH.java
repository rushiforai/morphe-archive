package com.facebook.ads.redexgen.X;

import android.util.Log;
import com.vungle.ads.internal.protos.Sdk;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: assets/audience_network/classes.dex */
public abstract class NH implements InterfaceC1623dO {
    public static byte[] A01;
    public static String[] A02 = {"0PvfoUFANCVNmnYZfPoejD6ohCtuxysE", "CTVBuEwwodohpQOP7b4j4", "9BgxiAbaVpMmFPJgyPUrG0VpyjL4diCu", "0p8mXLPxFyBv4phdqx8YrWMD1W9nJbZf", "G0yvPsPNC2vYmeMn8hYLEKyQ1tXXfhoe", "IW3zcZDApc8b2NyXBv", "Oqr2oLquorC4BSN9LXFNL8a9XNzmbM1Z", "n"};
    public static final String A03;
    public final ExecutorService A00 = Executors.newSingleThreadExecutor();

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 7 out of bounds for length 7
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private long A02(List<File> list) {
        long length = 0;
        Iterator<File> it = list.iterator();
        while (it.hasNext()) {
            length += it.next().length();
        }
        return length;
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 54);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A01 = new byte[]{-104, -34, -25, -22, -104, -20, -22, -31, -27, -27, -31, -26, -33, -104, -37, -39, -37, -32, -35, -50, 23, 33, -50, 18, 19, 26, 19, 34, 19, 18, -50, 16, 19, 17, 15, 35, 33, 19, -50, 23, 34, -50, 19, 38, 17, 19, 19, 18, 33, -50, 17, 15, 17, 22, 19, -50, 26, 23, 27, 23, 34, -125, -95, -93, -88, -91, 96, -90, -87, -84, -91, 96, -10, 35, 35, 32, 35, -47, 21, 22, 29, 22, 37, 26, 31, 24, -47, 23, 26, 29, 22, -47};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 13 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private void A07(List<File> list) {
        long jA02 = A02(list);
        int size = list.size();
        for (File file : list) {
            String[] strArr = A02;
            if (strArr[5].length() == strArr[1].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A02;
            strArr2[0] = "0WEexOrIiLXDlCjHBxNry1dxuPi8TFF2";
            strArr2[3] = "0ARlW4XVdH4TDXa7R7a2wpH1vFPRrHRN";
            if (!A08(file, jA02, size)) {
                long length = file.length();
                if (file.delete()) {
                    size--;
                    jA02 -= length;
                    Log.i(A03, A03(61, 11, 10) + file + A03(19, 42, 120));
                } else {
                    Log.e(A03, A03(72, 20, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE) + file + A03(0, 19, 66));
                }
            }
        }
    }

    public abstract boolean A08(File file, long j11, int i5);

    static {
        A04();
        A03 = NH.class.getSimpleName();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A06(File file) throws IOException {
        C1626dR.A03(file);
        List<File> files = C1626dR.A01(file.getParentFile());
        A07(files);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1623dO
    public void ALl(File file) throws IOException {
        this.A00.submit(new CallableC1627dS(this, file));
    }
}
