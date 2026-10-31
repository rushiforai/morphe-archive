package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.graphics.Bitmap;
import android.util.Log;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Semaphore;

/* loaded from: assets/audience_network/classes.dex */
public final class NI implements InterfaceC1612dD {
    public static byte[] A09;
    public static String[] A0A = {"2hmAfzTadn", "1uDqsMr9wv4o5ZghfCOZg4FuDp7sllqp", "nT1KYDstdBBAZ5nN", "UVqk4rMzzgqbiyaJgpoGMOUy0jQCoEBq", "ewXxsmpHr", "rT44HeCpkJQ", "C3kiv90mrVS0BL1BSM5Dfu9lHf0n3Csl", "grgxNBq6hb"};
    public static final String A0B;
    public final int A00;
    public final int A01;
    public final C1620dL A02;
    public final InterfaceC1633dY A04;
    public final C2095lA A05;
    public final boolean A08;
    public final Map<String, File> A06 = Collections.synchronizedMap(new HashMap());
    public final Map<String, Semaphore> A07 = new HashMap();
    public final C1622dN A03 = new C1622dN();

    /* JADX WARN: Code restructure failed: missing block: B:37:0x00cd, code lost:
    
        r8 = r6.A03();
        r6.A06();
        r6 = java.lang.System.currentTimeMillis() - r13;
        r21.A00().A5m(r4, r16.A04);
        r16.A06.put(r10, r4);
        r16.A04.AIh(r10, 2112, null, java.lang.Long.valueOf(r8), java.lang.Long.valueOf(r6), r17);
     */
    /* JADX WARN: Code restructure failed: missing block: B:38:0x00f9, code lost:
    
        return r4;
     */
    /* JADX WARN: Failed to calculate best type for var: r5v0 ??
    java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:56)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.calculateFromBounds(FixTypesVisitor.java:156)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.setBestType(FixTypesVisitor.java:133)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.deduceType(FixTypesVisitor.java:238)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryDeduceTypes(FixTypesVisitor.java:221)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:91)
     */
    /* JADX WARN: Failed to calculate best type for var: r5v0 ??
    java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:56)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.calculateFromBounds(TypeInferenceVisitor.java:145)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.setBestType(TypeInferenceVisitor.java:123)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.lambda$runTypePropagation$2(TypeInferenceVisitor.java:101)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runTypePropagation(TypeInferenceVisitor.java:101)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:75)
     */
    /* JADX WARN: Failed to calculate best type for var: r5v1 ??
    java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:56)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.calculateFromBounds(FixTypesVisitor.java:156)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.setBestType(FixTypesVisitor.java:133)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.deduceType(FixTypesVisitor.java:238)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryDeduceTypes(FixTypesVisitor.java:221)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:91)
     */
    /* JADX WARN: Failed to calculate best type for var: r5v1 ??
    java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:56)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.calculateFromBounds(TypeInferenceVisitor.java:145)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.setBestType(TypeInferenceVisitor.java:123)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.lambda$runTypePropagation$2(TypeInferenceVisitor.java:101)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runTypePropagation(TypeInferenceVisitor.java:101)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:75)
     */
    /* JADX WARN: Failed to calculate best type for var: r9v0 ??
    java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.applyInvokeTypes(TypeUpdate.java:390)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.invokeListener(TypeUpdate.java:355)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:56)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.calculateFromBounds(FixTypesVisitor.java:156)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.setBestType(FixTypesVisitor.java:133)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.deduceType(FixTypesVisitor.java:238)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryDeduceTypes(FixTypesVisitor.java:221)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:91)
     */
    /* JADX WARN: Failed to calculate best type for var: r9v0 ??
    java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.applyInvokeTypes(TypeUpdate.java:390)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.invokeListener(TypeUpdate.java:355)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:56)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.calculateFromBounds(TypeInferenceVisitor.java:145)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.setBestType(TypeInferenceVisitor.java:123)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.lambda$runTypePropagation$2(TypeInferenceVisitor.java:101)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runTypePropagation(TypeInferenceVisitor.java:101)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:75)
     */
    /* JADX WARN: Failed to calculate best type for var: r9v1 ??
    java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.applyInvokeTypes(TypeUpdate.java:390)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.invokeListener(TypeUpdate.java:355)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:56)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.calculateFromBounds(FixTypesVisitor.java:156)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.setBestType(FixTypesVisitor.java:133)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.deduceType(FixTypesVisitor.java:238)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.tryDeduceTypes(FixTypesVisitor.java:221)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:91)
     */
    /* JADX WARN: Failed to calculate best type for var: r9v1 ??
    java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.applyInvokeTypes(TypeUpdate.java:390)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.invokeListener(TypeUpdate.java:355)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:56)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.calculateFromBounds(TypeInferenceVisitor.java:145)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.setBestType(TypeInferenceVisitor.java:123)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.lambda$runTypePropagation$2(TypeInferenceVisitor.java:101)
    	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runTypePropagation(TypeInferenceVisitor.java:101)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:75)
     */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException
     */
    /* JADX WARN: Multi-variable type inference failed. Error: java.lang.NullPointerException: Cannot invoke "jadx.core.dex.instructions.args.InsnArg.getType()" because "changeArg" is null
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.moveListener(TypeUpdate.java:439)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:183)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.applyInvokeTypes(TypeUpdate.java:390)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.invokeListener(TypeUpdate.java:355)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.runListeners(TypeUpdate.java:232)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.requestUpdate(TypeUpdate.java:212)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeForSsaVar(TypeUpdate.java:188)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.updateTypeChecked(TypeUpdate.java:112)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.apply(TypeUpdate.java:83)
    	at jadx.core.dex.visitors.typeinference.TypeUpdate.applyWithWiderIgnSame(TypeUpdate.java:70)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.applyResolvedVars(TypeSearch.java:100)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:76)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.runMultiVariableSearch(FixTypesVisitor.java:116)
    	at jadx.core.dex.visitors.typeinference.FixTypesVisitor.visit(FixTypesVisitor.java:91)
     */
    /* JADX WARN: Not initialized variable reg: 10, insn: 0x0106: INVOKE 
      (r9v1 ?? I:com.facebook.ads.redexgen.X.dY)
      (r10 I:java.lang.String)
      (r11 I:int)
      (r12 I:java.lang.String)
      (r13 I:java.lang.Long)
      (r14 I:java.lang.Long)
      (r15 I:com.facebook.ads.redexgen.X.dJ)
     INTERFACE call: com.facebook.ads.redexgen.X.dY.AIh(java.lang.String, int, java.lang.String, java.lang.Long, java.lang.Long, com.facebook.ads.redexgen.X.dJ):void A[MD:(java.lang.String, int, java.lang.String, java.lang.Long, java.lang.Long, com.facebook.ads.redexgen.X.dJ):void (m)], block:B:40:0x00fb */
    /* JADX WARN: Not initialized variable reg: 10, insn: 0x0120: INVOKE 
      (r9v0 ?? I:com.facebook.ads.redexgen.X.dY)
      (r10 I:java.lang.String)
      (r11 I:int)
      (r12 I:java.lang.String)
      (r13 I:java.lang.Long)
      (r14 I:java.lang.Long)
      (r15 I:com.facebook.ads.redexgen.X.dJ)
     INTERFACE call: com.facebook.ads.redexgen.X.dY.AIh(java.lang.String, int, java.lang.String, java.lang.Long, java.lang.Long, com.facebook.ads.redexgen.X.dJ):void A[MD:(java.lang.String, int, java.lang.String, java.lang.Long, java.lang.Long, com.facebook.ads.redexgen.X.dJ):void (m)], block:B:46:0x0115 */
    /* JADX WARN: Not initialized variable reg: 5, insn: 0x0105: MOVE (r15 I:??[OBJECT, ARRAY]) = (r5 I:??[OBJECT, ARRAY]), block:B:40:0x00fb */
    /* JADX WARN: Not initialized variable reg: 5, insn: 0x011f: MOVE (r15 I:??[OBJECT, ARRAY]) = (r5 I:??[OBJECT, ARRAY]), block:B:46:0x0115 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private File A02(C1618dJ c1618dJ, String str, String str2, int i5, C1621dM<?> c1621dM) throws Throwable {
        C1618dJ c1618dJ2;
        String strAIh;
        C1618dJ c1618dJ3;
        String strAIh2;
        NB nb2;
        String strA03 = A03(Sdk.SDKError.Reason.INVALID_WATERFALL_PLACEMENT_ID_VALUE, 22, 68);
        try {
            String str3 = str;
            long jCurrentTimeMillis = System.currentTimeMillis();
            File file = new File(A01(this.A05), str2);
            final long jA0P = C2203mv.A0P(this.A05);
            NB nb3 = new NB(file, new NH(jA0P) { // from class: com.facebook.ads.redexgen.X.88
                public static byte[] A01;
                public static String[] A02 = {"rUhg5nWIULCK5t0gW05eAQLFFSPSWMvZ", "IWlot4Qxgt9kC5cL8sfJp7UuHzQVcIMi", "pyGO9NZUXO3VfNbPYY8A9lbBjy3aVFuI", "BR2eyutWjUUloqp0GJ1CKmWpDC9ci7iC", "R8", "7OIMX1dy42ob61A4JIfUI17XWGQLX3ws", "f7SraaJMsc9s0A0ZVYKOMxYCK6pogew2", "N778iUAZTctb3pJ5Cpi07oq2oMO9GnTO"};
                public final long A00;

                public static String A00(int i11, int i12, int i13) {
                    byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i11, i11 + i12);
                    int i14 = 0;
                    while (true) {
                        int length = bArrCopyOfRange.length;
                        String[] strArr = A02;
                        if (strArr[1].charAt(11) == strArr[7].charAt(11)) {
                            throw new RuntimeException();
                        }
                        A02[2] = "gnOcZLWDvxdPQhFZXDuJbQjlKnJrGFNK";
                        if (i14 >= length) {
                            return new String(bArrCopyOfRange);
                        }
                        bArrCopyOfRange[i14] = (byte) ((bArrCopyOfRange[i14] - i13) - 84);
                        i14++;
                    }
                }

                public static void A01() {
                    A01 = new byte[]{-71, -51, -28, -116, -33, -43, -26, -47, -116, -39, -31, -33, -32, -116, -50, -47, -116, -36, -37, -33, -43, -32, -43, -30, -47, -116, -38, -31, -39, -50, -47, -34, -115};
                }

                static {
                    A01();
                }

                {
                    if (jA0P > 0) {
                        this.A00 = jA0P;
                        return;
                    }
                    throw new IllegalArgumentException(A00(0, 33, 24));
                }

                @Override // com.facebook.ads.redexgen.X.NH
                public final boolean A08(File file2, long j11, int i11) {
                    return j11 <= this.A00;
                }

                @Override // com.facebook.ads.redexgen.X.NH, com.facebook.ads.redexgen.X.InterfaceC1623dO
                public final /* bridge */ /* synthetic */ void ALl(File file2) throws IOException {
                    super.ALl(file2);
                }
            });
            if (nb3.A09()) {
                if (this.A08) {
                    String str4 = A03(49, 22, 106) + nb3.A00.getName();
                }
                this.A06.put(str3, file);
                nb3.A06();
                this.A04.AIi(str3, true, c1618dJ);
                return file;
            }
            if (this.A08) {
                String str5 = A03(71, 26, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE) + nb3.A00.getName();
            }
            if (!c1621dM.A04()) {
                return null;
            }
            this.A04.AIi(str3, false, c1618dJ);
            int i11 = 0;
            while (true) {
                if (i11 >= this.A00) {
                    nb2 = nb3;
                    break;
                }
                try {
                    str3 = str3;
                    nb2 = nb3;
                } catch (C1629dU e3) {
                    e = e3;
                    nb2 = nb3;
                }
                try {
                    A05(this.A05, nb3, str3, i5, i11, jCurrentTimeMillis);
                    break;
                } catch (C1629dU e11) {
                    e = e11;
                    if (i11 == this.A00 - 1) {
                        A06(nb2);
                        if (e instanceof NE) {
                            throw ((NE) e);
                        }
                        if (e instanceof N8) {
                            throw ((N8) e);
                        }
                    }
                    i11++;
                    nb3 = nb2;
                }
                i11++;
                nb3 = nb2;
            }
        } catch (N8 e12) {
            this.A04.AIh(strAIh2, 2113, e12.toString(), null, null, c1618dJ3);
            if (!this.A08) {
                return null;
            }
            Log.e(A0B, strA03, e12);
            return null;
        } catch (NE e13) {
            this.A04.AIh(strAIh, 2119, e13.toString(), null, null, c1618dJ2);
            if (!this.A08) {
                return null;
            }
            Log.e(A0B, strA03, e13);
            return null;
        }
    }

    public static String A03(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A09, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            int i14 = bArrCopyOfRange[i13] - i12;
            String[] strArr = A0A;
            if (strArr[5].length() == strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0A;
            strArr2[5] = "m9U6X0moZlc";
            strArr2[7] = "IfCNkNm6kG";
            bArrCopyOfRange[i13] = (byte) (i14 - 76);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A04() {
        A09 = new byte[]{-105, -33, -40, -22, -105, -39, -36, -36, -27, -105, -32, -27, -21, -36, -23, -23, -20, -25, -21, -36, -37, -91, -63, -75, -5, -2, 1, -6, -75, -8, 1, -6, -10, 3, -6, -7, -49, -75, -125, 117, -106, -55, -55, -70, -62, -59, -55, -113, 117, -7, 23, 25, 30, 31, 36, 29, -42, 28, 31, 34, 27, -42, 25, 37, 35, 38, 34, 27, 42, 27, -42, 4, 34, 36, 41, 42, 47, 40, -31, 39, 42, 45, 38, -31, 47, 48, 53, -31, 36, 48, 46, 49, 45, 38, 53, 38, -31, -91, -61, -59, -54, -53, -48, -55, -126, -47, -56, -126, -32, -2, 11, -60, 17, -67, 0, 9, 12, 16, 2, -67, 0, -2, 0, 5, 2, -67, 3, 6, 9, 2, -53, -80, -50, -37, -108, -31, -115, -33, -46, -50, -47, -115, -50, -32, -32, -46, -31, -32, -101, -69, -39, -26, -97, -20, -104, -22, -35, -39, -36, -104, -28, -35, -26, -33, -20, -32, -104, -25, -34, -104, -72, -39, -32, -39, -24, -35, -30, -37, -108, -41, -43, -41, -36, -39, -108, -38, -35, -32, -39, -108, -43, -38, -24, -39, -26, -108, -39, -20, -41, -39, -39, -40, -35, -30, -37, -108, -26, -39, -24, -26, -19, -108, -43, -24, -24, -39, -31, -28, -24, -25, -82, -108, -43, 2, 2, -1, 2, -80, -13, -15, -13, -8, -7, -2, -9, -80, 4, -8, -11, -80, -10, -7, -4, -11, -54, -9, -9, -12, -9, -91, -24, -15, -22, -26, -13, -18, -13, -20, -91, -21, -18, -15, -22, -72, -27, -27, -30, -27, -109, -42, -33, -30, -26, -36, -31, -38, -109, -26, -30, -24, -27, -42, -40, -72, -35, -46, -34, -36, -33, -37, -44, -29, -44, -113, -31, -44, -30, -33, -34, -35, -30, -44, -99, -65, -35, -28, -44, -39, -46, -117, -33, -38, -117, -35, -48, -52, -49, -117, -73, -70, -60, -51, -125, -68, -65, -62, -69, -125, -71, -73, -71, -66, -69, -18, 0, 0, -14, 1, -57, -68, -68, -68, 5, 8, 11, 4, -39, -50, -50, -50, 0, 13, 3, 17, 14, 8, 3, -2, 0, 18, 18, 4, 19, -50};
        String[] strArr = A0A;
        if (strArr[1].charAt(5) == strArr[3].charAt(5)) {
            throw new RuntimeException();
        }
        A0A[6] = "1YrvosXM8zHw8wsMUb3ulJ8Xgx5scBHO";
    }

    static {
        A04();
        A0B = NI.class.getSimpleName();
    }

    public NI(C2095lA c2095lA, C1620dL c1620dL, InterfaceC1633dY interfaceC1633dY) {
        this.A05 = c2095lA;
        this.A08 = c1620dL.A02();
        this.A00 = c1620dL.A00();
        this.A04 = interfaceC1633dY;
        this.A01 = c1620dL.A01();
        this.A02 = c1620dL;
    }

    public static NG A00(Context context, String str) throws C1629dU, IOException {
        try {
            InputStream inputStreamOpen = context.getAssets().open(str);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte[] bArr = new byte[1024];
            while (true) {
                int i5 = inputStreamOpen.read(bArr, 0, bArr.length);
                if (i5 != -1) {
                    byteArrayOutputStream.write(bArr, 0, i5);
                } else {
                    return new NG(byteArrayOutputStream.toByteArray());
                }
            }
        } catch (IOException e3) {
            throw new C1629dU(A03(Sdk.SDKError.Reason.MRAID_JS_WRITE_FAILED_VALUE, 18, 33), e3);
        }
    }

    public static File A01(Context context) {
        return new File(context.getCacheDir(), A03(Sdk.SDKError.Reason.AD_CLOSED_MISSING_HEARTBEAT_VALUE, 15, 10));
    }

    /* JADX WARN: Removed duplicated region for block: B:106:0x023c  */
    /* JADX WARN: Removed duplicated region for block: B:112:0x01a5 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x011c A[Catch: all -> 0x0124, dU -> 0x016b, TRY_ENTER, TRY_LEAVE, TryCatch #14 {dU -> 0x016b, all -> 0x0124, blocks: (B:12:0x007c, B:38:0x0109, B:44:0x011c, B:36:0x0103, B:28:0x00bd, B:30:0x00c5), top: B:115:0x007c }] */
    /* JADX WARN: Removed duplicated region for block: B:70:0x017f  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x019a  */
    /* JADX WARN: Removed duplicated region for block: B:83:0x01ce A[Catch: all -> 0x020b, PHI: r21
      0x01ce: PHI (r21v2 int) = (r21v0 int), (r21v1 int) binds: [B:75:0x01a3, B:76:0x01a5] A[DONT_GENERATE, DONT_INLINE], TRY_ENTER, TRY_LEAVE, TryCatch #7 {all -> 0x020b, blocks: (B:74:0x01a1, B:83:0x01ce), top: B:110:0x01a1 }] */
    /* JADX WARN: Removed duplicated region for block: B:86:0x01f1  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01fe  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A05(Context context, NB nb2, String str, int i5, int i11, long j11) throws Throwable {
        InterfaceC1632dX n9;
        String[] strArr;
        String[] strArr2;
        String[] strArr3;
        String strA03 = A03(263, 20, 39);
        String strA032 = A03(342, 22, 83);
        if (str.startsWith(strA032)) {
            String localUrl = str.substring(strA032.length());
            n9 = A00(context, localUrl);
        } else {
            String strA033 = A03(333, 9, 65);
            if (str.startsWith(strA033)) {
                String localUrl2 = str.substring(strA033.length());
                n9 = A00(context, localUrl2);
            } else {
                n9 = new N9(str, i5);
            }
        }
        try {
            if (this.A08) {
                try {
                    try {
                        String str2 = A03(303, 15, 31) + str + A03(38, 11, 9) + i11;
                        int iA03 = nb2.A03();
                        int length = n9.length();
                        if (A0A[2].length() == 16) {
                            throw new RuntimeException();
                        }
                        String[] strArr4 = A0A;
                        strArr4[1] = "eTbeym3Ey2TfwhNFyBG6ZkfAKtzQxWab";
                        strArr4[3] = "sd4JUTjhNLXLgefrlj4RQDt9w4Pjz5Uj";
                        boolean z11 = length < 0;
                        if (z11) {
                            boolean zA07 = A07(nb2);
                            if (this.A08) {
                                String str3 = A03(149, 21, 44) + str + A03(22, 16, 73) + zA07;
                            }
                        }
                        try {
                            try {
                                if (z11 || iA03 < length) {
                                    n9.AHw(iA03);
                                    byte[] buffer = new byte[UserMetadata.MAX_INTERNAL_KEY_SIZE];
                                    while (true) {
                                        int i12 = n9.read(buffer);
                                        if (i12 != -1) {
                                            nb2.A08(buffer, i12);
                                        }
                                    }
                                    if (!z11 || nb2.A03() == length) {
                                        nb2.A07();
                                        int iA06 = 0;
                                        if (n9 instanceof N9) {
                                            iA06 = ((N9) n9).A06();
                                        }
                                        this.A05.A08().ACc(j11, System.currentTimeMillis() - j11, nb2.A03(), 0L, iA06, null);
                                        n9.close();
                                        return;
                                    }
                                    throw new NE(A03(283, 20, 35));
                                }
                                n9.close();
                                return;
                            } catch (C1629dU | IllegalArgumentException e3) {
                                if (this.A08) {
                                    Log.e(A0B, strA03, e3);
                                    return;
                                }
                                return;
                            }
                            if (!z11) {
                                nb2.A07();
                            } else {
                                throw new NE(A03(283, 20, 35));
                            }
                            int iA062 = 0;
                            if (n9 instanceof N9) {
                            }
                            this.A05.A08().ACc(j11, System.currentTimeMillis() - j11, nb2.A03(), 0L, iA062, null);
                        } catch (C1629dU e11) {
                            e = e11;
                            int iA063 = 0;
                            strArr = A0A;
                            if (strArr[5].length() != strArr[7].length()) {
                                A0A[6] = "T9HhHUPHmRtDRYih6csTBmWckuigXZik";
                            }
                            try {
                                if (!(n9 instanceof N9)) {
                                    try {
                                        iA063 = ((N9) n9).A06();
                                        InterfaceC2125le interfaceC2125leA08 = this.A05.A08();
                                        long jCurrentTimeMillis = System.currentTimeMillis() - j11;
                                        strArr2 = A0A;
                                        if (strArr2[0].length() == strArr2[4].length()) {
                                            String[] strArr5 = A0A;
                                            strArr5[0] = "1ebbv6sZsY";
                                            strArr5[4] = "jsueFKzO4";
                                        } else {
                                            A0A[6] = "KSAyepUp6Lv8t3ZYZ0KE3Pcqgz9Tryir";
                                        }
                                        try {
                                            interfaceC2125leA08.ACc(j11, jCurrentTimeMillis, 0L, 0L, iA063, null);
                                            throw e;
                                        } catch (Throwable th2) {
                                            th = th2;
                                        }
                                    } catch (Throwable th3) {
                                        th = th3;
                                        String[] strArr6 = A0A;
                                        if (strArr6[0].length() == strArr6[4].length()) {
                                            throw new RuntimeException();
                                        }
                                        A0A[6] = "ImVXE49sB20dM2EoLXCVvjDoDOKBzvDP";
                                    }
                                } else {
                                    InterfaceC2125le interfaceC2125leA082 = this.A05.A08();
                                    long jCurrentTimeMillis2 = System.currentTimeMillis() - j11;
                                    strArr2 = A0A;
                                    if (strArr2[0].length() == strArr2[4].length()) {
                                    }
                                    interfaceC2125leA082.ACc(j11, jCurrentTimeMillis2, 0L, 0L, iA063, null);
                                    throw e;
                                }
                            } catch (Throwable th4) {
                                th = th4;
                                if (A0A[2].length() != 16) {
                                    throw new RuntimeException();
                                }
                                String[] strArr7 = A0A;
                                strArr7[1] = "6fSXCo91bn6LAd9tVoL5ppajSHGCeKrb";
                                strArr7[3] = "7b6W6Np6OlCq8n45whdvZaRJ0dkqNrQI";
                            }
                            n9.close();
                            throw th;
                        } catch (Throwable th5) {
                            th = th5;
                        }
                    } catch (C1629dU e12) {
                        e = e12;
                        strArr3 = A0A;
                        if (strArr3[1].charAt(5) != strArr3[3].charAt(5)) {
                            throw new RuntimeException();
                        }
                        A0A[2] = "FEvgLDxHgmJHNXql";
                        int iA0632 = 0;
                        strArr = A0A;
                        if (strArr[5].length() != strArr[7].length()) {
                        }
                        if (!(n9 instanceof N9)) {
                        }
                        n9.close();
                        throw th;
                    } catch (Throwable th6) {
                        th = th6;
                    }
                } catch (C1629dU e13) {
                    e = e13;
                    strArr3 = A0A;
                    if (strArr3[1].charAt(5) != strArr3[3].charAt(5)) {
                    }
                } catch (Throwable th7) {
                    th = th7;
                }
            } else {
                int iA032 = nb2.A03();
                int length2 = n9.length();
                if (A0A[2].length() == 16) {
                }
            }
        } catch (C1629dU e14) {
            e = e14;
        } catch (Throwable th8) {
            th = th8;
        }
        try {
            n9.close();
        } catch (C1629dU | IllegalArgumentException e15) {
            if (this.A08) {
                Log.e(A0B, strA03, e15);
            }
        }
        throw th;
    }

    private void A06(NB nb2) {
        try {
            File fileA04 = nb2.A04();
            if (fileA04.exists()) {
                nb2.A06();
                boolean zDelete = fileA04.delete();
                if (this.A08) {
                    Log.i(A0B, A03(170, 52, 40) + zDelete);
                }
            }
        } catch (Exception e3) {
            if (this.A08) {
                Log.e(A0B, A03(108, 23, 81), e3);
            }
        }
    }

    private boolean A07(NB nb2) {
        try {
            nb2.A05();
            return true;
        } catch (N8 e3) {
            boolean z11 = this.A08;
            if (A0A[6].charAt(7) == 'U') {
                throw new RuntimeException();
            }
            A0A[6] = "AEs2mSbxTVyMZvMH4XlDgcN9VznTkYzp";
            if (z11) {
                Log.e(A0B, A03(244, 19, 57), e3);
                return false;
            }
            return false;
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.dM != com.facebook.ads.cache.config.CacheRequestConfig<T> */
    public final <T> C1614dF<T> A08(C1618dJ c1618dJ, C1621dM<T> c1621dM) {
        Semaphore semaphore;
        if (c1621dM.A03()) {
            File file = this.A06.get(c1618dJ.A09);
            if (file != null) {
                this.A04.AIi(c1618dJ.A09, true, c1618dJ);
                return c1621dM.A00().A4N(file, this.A04);
            }
            this.A04.AIi(c1618dJ.A09, false, c1618dJ);
            return new C1614dF<>(false, null);
        }
        String str = c1618dJ.A09;
        String str2 = c1618dJ.A04;
        StringBuilder sb2 = new StringBuilder();
        String baseUrl = this.A03.A03(str);
        String extension = sb2.append(baseUrl).append(str2).toString();
        synchronized (this.A07) {
            semaphore = this.A07.get(extension);
            if (semaphore == null) {
                semaphore = new Semaphore(1);
                this.A07.put(extension, semaphore);
            }
            try {
            } catch (Throwable th2) {
                semaphore.release();
                synchronized (this.A07) {
                    this.A07.remove(extension);
                    throw th2;
                }
            }
        }
        try {
            semaphore.acquire();
            File fileA02 = A02(c1618dJ, str, extension, this.A01, c1621dM);
            if (fileA02 != null) {
                C1614dF<T> c1614dFA4N = c1621dM.A00().A4N(fileA02, this.A04);
                semaphore.release();
                synchronized (this.A07) {
                    this.A07.remove(extension);
                }
                return c1614dFA4N;
            }
            C1614dF<T> c1614dF = new C1614dF<>(false, null);
            semaphore.release();
            synchronized (this.A07) {
                this.A07.remove(extension);
            }
            return c1614dF;
        } catch (InterruptedException unused) {
            if (this.A08) {
                StringBuilder sb3 = new StringBuilder();
                String baseUrl2 = A03(97, 11, 22);
                StringBuilder sbAppend = sb3.append(baseUrl2).append(str);
                String baseUrl3 = A03(0, 22, 43);
                sbAppend.append(baseUrl3).toString();
            }
            C1614dF<T> c1614dF2 = new C1614dF<>(false, null);
            semaphore.release();
            synchronized (this.A07) {
                this.A07.remove(extension);
                return c1614dF2;
            }
        }
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1612dD
    public final C1614dF<Bitmap> AJw(C1618dJ c1618dJ, boolean z11) {
        return A08(c1618dJ, new C1621dM(new NP(c1618dJ.A01, c1618dJ.A00, this.A02.A04(), this.A02.A03(), z11)));
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.dM != com.facebook.ads.cache.config.CacheRequestConfig<java.io.File> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1612dD
    public final File AJx(C1618dJ c1618dJ) {
        C1621dM c1621dM = new C1621dM(new NO());
        c1621dM.A01(true);
        c1621dM.A02(false);
        return (File) A08(c1618dJ, c1621dM).A00();
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1612dD
    public final String AJy(C1618dJ c1618dJ) {
        return (String) A08(c1618dJ, new C1621dM(new NJ())).A00();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.dM != com.facebook.ads.cache.config.CacheRequestConfig<java.lang.String> */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1612dD
    public final String AJz(C1618dJ c1618dJ) {
        C1621dM c1621dM = new C1621dM(new NJ());
        c1621dM.A01(true);
        c1621dM.A02(false);
        return (String) A08(c1618dJ, c1621dM).A00();
    }
}
