package com.facebook.ads.redexgen.X;

import android.media.MediaCodecInfo;
import android.util.Pair;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.facebook.ads.androidx.media3.common.ColorInfo;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;

@Deprecated
/* loaded from: assets/audience_network/classes.dex */
public final class TN {
    public static int A00;
    public static byte[] A01;
    public static String[] A02 = {"8dUGo6F8AMoPuPIm55ZDmNNDBIRvhzvR", "r8zctQxkAXSUMutWv9iWyLU", "iiYAkITwew9vhpibKXbmKCqqQtEguKth", "v6MBTntR43y4vhVK16MgmrBcTKeItHb7", "Mylxl3Yy3nCYa1MNaOECJxZ6OHISgUso", "Iep63ONt8wdwcLogaAiC6rqWmtK2AiQO", "G57BjPFtxLg7y80mHzBy8KrY7exST9bg", "mwLFLeNGNA6y40PB2bE13TMpMx6Uqito"};
    public static final HashMap<TJ, List<C1234Sq>> A03;
    public static final Pattern A04;

    public static String A0N(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A01, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 14);
        }
        return new String(bArrCopyOfRange);
    }

    /*  JADX ERROR: JadxRuntimeException in pass: ProcessVariables
        jadx.core.utils.exceptions.JadxRuntimeException: Method arg registers not loaded: com.facebook.ads.redexgen.X.TK.<init>(java.lang.Throwable, com.facebook.ads.redexgen.X.TI):void, class status: GENERATED_AND_UNLOADED
        	at jadx.core.dex.nodes.MethodNode.getArgRegs(MethodNode.java:291)
        	at jadx.core.dex.visitors.regions.variables.ProcessVariables$1.isArgUnused(ProcessVariables.java:146)
        	at jadx.core.dex.visitors.regions.variables.ProcessVariables$1.lambda$isVarUnused$0(ProcessVariables.java:131)
        	at jadx.core.utils.ListUtils.allMatch(ListUtils.java:194)
        	at jadx.core.dex.visitors.regions.variables.ProcessVariables$1.isVarUnused(ProcessVariables.java:131)
        	at jadx.core.dex.visitors.regions.variables.ProcessVariables$1.processBlock(ProcessVariables.java:82)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:64)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at java.base/java.util.Collections$UnmodifiableCollection.forEach(Collections.java:1120)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.lambda$traverseInternal$0(DepthRegionTraversal.java:68)
        	at java.base/java.util.ArrayList.forEach(ArrayList.java:1612)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverseInternal(DepthRegionTraversal.java:68)
        	at jadx.core.dex.visitors.regions.DepthRegionTraversal.traverse(DepthRegionTraversal.java:19)
        	at jadx.core.dex.visitors.regions.variables.ProcessVariables.removeUnusedResults(ProcessVariables.java:73)
        	at jadx.core.dex.visitors.regions.variables.ProcessVariables.visit(ProcessVariables.java:48)
        */
    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 25 out of bounds for length 25
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:102:0x00e4 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:106:0x007a A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:111:0x01c8 A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x018b A[Catch: Exception -> 0x020a, TRY_ENTER, TryCatch #3 {Exception -> 0x020a, blocks: (B:3:0x0014, B:5:0x002a, B:8:0x0035, B:11:0x0040, B:72:0x017b, B:75:0x018b, B:77:0x0191, B:80:0x01c8, B:81:0x0202), top: B:94:0x0014 }] */
    /* JADX WARN: Removed duplicated region for block: B:78:0x01be A[LOOP:0: B:4:0x0028->B:78:0x01be, LOOP_END] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static java.util.ArrayList<com.facebook.ads.redexgen.X.C1234Sq> A0Q(com.facebook.ads.redexgen.X.TJ r23, com.facebook.ads.redexgen.X.TL r24) throws java.lang.Exception {
        /*
            Method dump skipped, instructions count: 530
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.ads.redexgen.X.TN.A0Q(com.facebook.ads.redexgen.X.TJ, com.facebook.ads.redexgen.X.TL):java.util.ArrayList");
    }

    public static void A0S() {
        A01 = new byte[]{125, -123, 69, 77, -117, -122, -114, -111, -118, -119, 69, -103, -108, 69, -106, -102, -118, -105, -98, 69, -120, -122, -107, -122, -121, -114, -111, -114, -103, -114, -118, -104, 78, 124, 62, 48, 81, -125, -125, -123, 125, 121, 126, 119, 74, 48, -106, -37, -51, -53, -35, -38, -51, 91, -96, -92, 91, 118, 118, 67, 68, -125, -123, 100, 103, 84, 88, -71, -66, 102, 108, -70, -63, -105, -97, -115, -106, -116, 124, 123, -94, -94, 100, 101, -75, -73, -118, -80, -84, -80, -49, -65, -51, -51, -49, -48, -15, -17, -5, -16, -15, -2, -108, -126, -122, -127, -123, 92, 74, 78, 73, 78, -77, -95, -90, -96, -92, -58, -76, -71, -77, -72, 94, 81, 81, 75, 77, AbstractJsonLexerKt.TC_INVALID, 114, 114, 108, 111, 104, 91, 91, 85, 91, -114, -127, -127, 124, -127, -74, -68, -61, -76, -76, -74, -73, -40, -42, -30, -41, -40, -27, -60, -54, -47, -62, -50, -45, -49, -61, -59, -26, -28, -16, -27, -26, -13, 100, 106, 113, 110, 113, 84, 101, -122, -124, -112, -123, -122, -109, 91, 97, 104, 110, -121, -118, 122, -127, -117, 92, 125, 123, -121, 124, 125, -118, 90, 117, 125, -128, 121, 120, 52, -120, -125, 52, -123, -119, 121, -122, -115, 52, 119, -125, 120, 121, 119, 52, -46, -69, -68, -70, 95, 72, 73, 74, -51, -74, -70, -75, -81, -104, -100, -102, -104, -127, -123, -122, AbstractJsonLexerKt.TC_INVALID, 104, 111, 103, 88, 65, 72, 67, 100, 77, 84, 82, -123, 112, 109, -82, -100, -106, -71, -89, -92, -60, -75, -84, 110, 95, 89, -90, -85, -108, -78, -71, -70, -67, -76, -71, -78, 107, -72, -84, -73, -79, -70, -67, -72, -80, -81, 107, -116, -95, 124, 107, -82, -70, -81, -80, -82, 107, -66, -65, -67, -76, -71, -78, -123, 107, -127, -97, -90, -89, -86, -95, -90, -97, 88, -91, -103, -92, -98, -89, -86, -91, -99, -100, 88, 121, -114, 123, 88, -101, -89, -100, -99, -101, 88, -85, -84, -86, -95, -90, -97, 114, 88, -86, -56, -49, -48, -45, -54, -49, -56, -127, -50, -62, -51, -57, -48, -45, -50, -58, -59, -127, -91, -48, -51, -61, -38, -127, -73, -54, -44, -54, -48, -49, -127, -60, -48, -59, -58, -60, -127, -44, -43, -45, -54, -49, -56, -101, -127, 124, -102, -95, -94, -91, -100, -95, -102, 83, -96, -108, -97, -103, -94, -91, -96, -104, -105, 83, 123, 120, -119, 118, 83, -106, -94, -105, -104, -106, 83, -90, -89, -91, -100, -95, -102, 109, 83, -56, -26, -19, -18, -15, -24, -19, -26, -97, -20, -32, -21, -27, -18, -15, -20, -28, -29, -97, -52, -49, -77, -64, -97, -30, -18, -29, -28, -30, -97, -14, -13, -15, -24, -19, -26, -71, -97, 123, -103, -96, -95, -92, -101, -96, -103, 82, -97, -109, -98, -104, -95, -92, -97, -105, -106, 82, -120, -126, 107, 82, -107, -95, -106, -105, -107, 82, -91, -90, -92, -101, -96, -103, 108, 82, -90, -117, -116, -118, 104, 77, 78, 79, -66, -93, -89, -94, -46, -73, -69, -71, -121, 108, 112, 113, 122, 95, 102, 94, -122, 107, 114, 109, -84, -111, -104, -106, -118, 113, 110, 124, 99, 102, -104, -117, 117, 111, -85, -107, -110, 103, 84, 75, -41, -60, -66, 101, 104, 75, 92, 125, 123, -121, 124, 125, -118, 92, 116, 115, 120, 112, 82, 126, 115, 116, 114, 91, 120, -126, -125, 47, 80, 95, 88, 47, 115, 120, 115, 125, 54, -125, 47, 123, 120, -126, -125, 47, -126, 116, 114, -124, -127, 116, 47, 115, 116, 114, 126, 115, 116, -127, 47, 117, 126, -127, 73, 47, -113, -89, -90, -85, -93, -123, -79, -90, -89, -91, -105, -74, -85, -82, 117, 115, 126, 84, 107, -98, -97, -108, -107, -103, 84, 103, 103, 105, 84, 106, -117, -119, -107, -118, -117, -104, 98, 96, 107, 65, 96, 102, 65, 91, 88, 105, 86, 87, 105, 65, 87, 120, 118, -126, 119, 120, -123, -85, -87, -76, -118, -87, -80, -89, -118, -99, -79, -96, -91, -85, -118, -96, -95, -97, -85, -96, -95, -82, -118, -99, -99, -97, 123, 121, -124, 90, 121, -128, 119, 90, 109, -127, 112, 117, 123, 90, 112, 113, 111, 123, 112, 113, 126, 90, 112, AbstractJsonLexerKt.TC_INVALID, 124, 109, 111, 95, 95, 93, 104, 62, 93, 100, 91, 62, 81, 101, 84, 89, 95, 62, 84, 85, 83, 95, 84, 85, 98, 62, 98, 81, 103, 100, 98, 109, 67, 103, 105, 96, 67, -117, 126, 121, 122, -124, 67, 121, 122, 120, -124, 121, 122, -121, -103, -105, -94, 120, -99, -113, -115, 120, -105, -102, 125, 120, -114, -81, -83, -71, -82, -81, -68, -116, -118, -107, 107, -112, -126, -128, 107, -98, -98, -96, 107, -95, -94, -96, -57, -59, -48, -90, -53, -67, -69, -90, -27, -24, -85, -90, -36, -35, -37, -116, -118, -107, 107, -112, -126, -128, 107, -77, -83, 117, 107, -95, -94, -96, -41, -43, -32, -74, -22, -6, -21, -11, -74, -23, -3, -20, -15, -9, -74, -11, -8, -69, -74, -20, -19, -21, -9, -20, -19, -6, 106, 104, 115, 73, -126, -118, -118, -126, -121, -128, -100, -102, -91, 123, -76, -68, -68, -76, -71, -78, 123, -65, -82, -60, 123, -79, -78, -80, -68, -79, -78, -65, -54, -56, -45, -87, -25, -30, -32, -87, -36, -34, -82, -87, -33, -32, -34, -22, -33, -32, -19, -72, -74, -63, -105, -43, -48, -50, -105, -54, -43, -54, -52, -105, -51, -50, -52, -40, -51, -50, -37, -48, -50, -39, -81, -19, -24, -26, -81, -25, -19, -30, -28, -81, -27, -26, -28, -16, -27, -26, -13, -60, -62, -51, -93, -26, -40, -28, -30, -93, -42, -22, -39, -34, -28, -93, -39, -38, -40, -28, -39, -38, -25, -93, -42, -42, -40, -124, -126, -115, 99, -90, -104, -92, -94, 99, -106, -86, -103, -98, -92, 99, -103, -102, -104, -92, -103, -102, -89, 
        99, -94, -91, 104, -79, -81, -70, -112, -45, -59, -47, -49, -112, -40, -53, -58, -57, -47, -112, -58, -57, -59, -47, -58, -57, -44, -112, -40, -46, -102, -57, -59, -48, -90, -23, -20, -31, -90, -39, -19, -36, -31, -25, -90, -36, -35, -37, -25, -36, -35, -22, -90, -34, -28, -39, -37, 107, 105, 116, 74, -114, -127, 125, -120, -112, -127, -121, 74, -110, -123, -128, -127, -117, 74, -128, -127, AbstractJsonLexerKt.TC_INVALID, -117, -128, -127, -114, 74, -112, -111, -118, -118, -127, -120, -127, -128, 102, 77, -108, -124, 110, 113, 117, -120, -111, -127, 107, 110, 115, -123, -44, -60, -41, -76, -78, 115, 111, 77, 80, 82, 101, -38, -14, -16, -9, -9, -16, -11, -18, -89, -22, -10, -21, -20, -22, -89, -75, -50, -53, -50, -49, -41, -50, -128, -95, -74, -111, -128, -62, -55, -44, -128, -60, -59, -48, -44, -56, -102, -128, -36, -11, -14, -11, -10, -2, -11, -89, -56, -35, -72, -89, -13, -20, -3, -20, -13, -63, -89, -77, -52, -55, -52, -51, -43, -52, 126, -97, -76, -113, 126, -50, -48, -51, -60, -57, -54, -61, -104, 126, -113, -88, -91, -88, -87, -79, -88, 90, 123, -112, 125, 90, -90, -97, -80, -97, -90, 116, 90, -53, -28, -31, -28, -27, -19, -28, -106, -73, -52, -71, -106, -26, -24, -27, -36, -33, -30, -37, -80, -106, -70, -45, -48, -45, -44, -36, -45, -123, -87, -44, -47, -57, -34, -123, -69, -50, -40, -50, -44, -45, -123, -47, -54, -37, -54, -47, -123, -40, -39, -41, -50, -45, -52, -97, -123, -82, -57, -60, -57, -56, -48, -57, 121, -99, -56, -59, -69, -46, 121, -81, -62, -52, -62, -56, -57, 121, -55, -53, -56, -65, -62, -59, -66, 121, -52, -51, -53, -62, -57, -64, -109, 121, 121, -110, -113, -110, -109, -101, -110, 68, 108, 105, 122, 103, 68, -112, -119, -102, -119, -112, 68, -105, -104, -106, -115, -110, -117, 94, 68, -65, -40, -43, -40, -39, -31, -40, -118, -78, -81, -64, -83, -118, -38, -36, -39, -48, -45, -42, -49, -118, -35, -34, -36, -45, -40, -47, -92, -118, 124, -107, -110, -107, -106, -98, -107, 71, 125, 119, 96, 71, -109, -116, -99, -116, -109, 97, 71, 112, -119, -122, -119, -118, -110, -119, 59, 113, 107, 84, 59, -117, -115, -118, -127, -124, -121, -128, 85, 59, -45, -28, -36, -22, -24, -28, -42, -88, -82, -84, -108, -113, 120, -84, -76, 123, 121, 116, -46, -88, -95, -31, -14, -29, -82, -104, -84, -101, -96, -90, 102, -104, -102, 106, 115, -121, 118, 123, -127, 65, 115, 126, 115, 117, -123, -103, -120, -115, -109, 83, -119, -123, -121, 87, -54, -34, -51, -46, -40, -104, -50, -54, -52, -100, -106, -45, -40, -52, -90, -70, -87, -82, -76, 116, -85, -79, -90, -88, -95, -75, -92, -87, -81, 111, -84, -89, 109, -95, -93, 115, -35, -15, -32, -27, -21, -85, -23, -20, -80, -35, -87, -24, -35, -16, -23, -128, -108, -125, -120, -114, 78, -111, -128, -106, -19, 1, -16, -11, -5, -69, 4, -71, -8, -13, -71, -19, -8, -19, -17, -67, -47, -64, -59, -53, -117, -44, -119, -56, -61, -119, -62, -56, -67, -65, -32, -11, -81, -80, -91, -70, -89, 117, -23, -2, -21, -70, -47, -96, -100, -121, 86, 82, -123, -110, -120, -106, -109, -115, -120, -74, -123, -127, -76, -63, -73, -59, -62, -68, -73, -127, -86, 121, 117, -82, -74, -74, -82, -77, -84, 117, -80, 126, -95, -87, -75, -78, -22, -24, -24, -24, -27, -10, -79, -71, -57, -76, -126, -19, -23, -17, -9, -24, -114, -126, -109, -118, -113, -122, -115, -107, -122, -126, -107, -107, -42, -39, -99, -54, -64, -66, -55, AbstractJsonLexerKt.TC_INVALID, -6, -8, 3, -71, -15, -15, -8, -5, -16, -14, -71, -88, -90, -79, 103, -96, -88, -88, -96, -91, -98, 103, -68, -70, -59, 123, -66, -80, -68, -70, 123, -61, -74, -79, -78, -68, 123, -79, -78, -80, -68, -79, -78, -65, 123, -75, -78, -61, -80, -64, -60, -61, -79, -78, -80, -96, -98, -87, 95, -92, -106, -108, 95, -119, -117, -120, -115, -120, -114, -112, 126, -118, -112, -110, -117, -124, -104, -122, -109, -103, -108, -104, -34, -48, -50, -32, -35, -48, -104, -37, -41, -52, -28, -51, -52, -50, -42, -76, -90, -77, -77, -94, -81, -80, -94, 94, -11, -10, -17, -17, -26, -19, -26, -27, -82, -15, -19, -30, -6, -29, -30, -28, -20, -1, -14, -19, -18, -8, -72, -22, -1, -20, -80, -93, -98, -97, -87, 105, -98, -87, -90, -100, -77, 103, -80, -93, -83, -93, -87, -88, -37, -50, -55, -54, -44, -108, -55, -37, -60, -51, -54, -37, -56, -109, -122, -127, -126, -116, 76, -123, -126, -109, -128, 0, -13, -18, -17, -7, -71, -14, -17, 0, -19, -18, 0, -106, -119, -116, -116, -123, -124, 119, 122, 122, 115, 113, 64, -107, -120, -117, -117, -124, -113, -117, -108, -110, -89, -95, 97, 106, 7, -14, -5, -7, 1, -14, -96, -117, -104, -107, -116, -110, -102, -117, 5, -16, -3, -6, -9, -1, -16};
    }

    static {
        A0S();
        A04 = Pattern.compile(A0N(1409, 10, 66));
        A03 = new HashMap<>();
        A00 = -1;
    }

    public static int A00() throws TK {
        if (A00 == -1) {
            int iMax = 0;
            C1234Sq c1234SqA0J = A0J(A0N(1756, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE), false, false);
            if (c1234SqA0J != null) {
                MediaCodecInfo.CodecProfileLevel[] codecProfileLevelArrA0V = c1234SqA0J.A0V();
                if (A02[3].charAt(7) != 'R') {
                    throw new RuntimeException();
                }
                String[] strArr = A02;
                strArr[6] = "tkEGHyvt7UQ9r0Pm2IXrMZ4gOuaW9vA9";
                strArr[0] = "qJ6ht2UDbiHYCZHmVIZrLKtn02GC9vsC";
                for (MediaCodecInfo.CodecProfileLevel codecProfileLevel : codecProfileLevelArrA0V) {
                    iMax = Math.max(A03(codecProfileLevel.level), iMax);
                }
                int result = N1.A02 >= 21 ? 345600 : 172800;
                iMax = Math.max(iMax, result);
            }
            A00 = iMax;
        }
        int result2 = A00;
        return result2;
    }

    public static int A01(int i5) {
        switch (i5) {
            case 0:
                return 1;
            case 1:
                return 2;
            case 2:
                return 4;
            case 3:
                return 8;
            case 4:
                return 16;
            case 5:
                return 32;
            case 6:
                return 64;
            case 7:
                return 128;
            case 8:
                return 256;
            case 9:
                return EventBridgeChannel.QUEUE_CAPACITY;
            case 10:
                return 1024;
            case 11:
                return 2048;
            case 12:
                return androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            case 13:
                return UserMetadata.MAX_INTERNAL_KEY_SIZE;
            case 14:
                return ReaderJsonLexerKt.BATCH_SIZE;
            case 15:
                return SQLiteDatabase.OPEN_NOMUTEX;
            case 16:
                return SQLiteDatabase.OPEN_FULLMUTEX;
            case 17:
                return SQLiteDatabase.OPEN_SHAREDCACHE;
            case 18:
                return SQLiteDatabase.OPEN_PRIVATECACHE;
            case 19:
                return 524288;
            case 20:
                return 1048576;
            case 21:
                return 2097152;
            case 22:
                if (A02[2].charAt(18) == 'r') {
                    throw new RuntimeException();
                }
                String[] strArr = A02;
                strArr[6] = "G72VEvg0byZqgDfmoLnqc6gcDeFRd7JU";
                strArr[0] = "9rYt9JPAGiNoPWwmCzJCxEYPdeoz8MKG";
                return 4194304;
            case 23:
                return 8388608;
            default:
                return -1;
        }
    }

    public static int A02(int i5) {
        switch (i5) {
            case 10:
                return 1;
            case 11:
                return 4;
            case 12:
                return 8;
            case 13:
                return 16;
            case 20:
                return 32;
            case 21:
                return 64;
            case 22:
                return 128;
            case 30:
                return 256;
            case 31:
                return EventBridgeChannel.QUEUE_CAPACITY;
            case 32:
                return 1024;
            case 40:
                return 2048;
            case 41:
                return androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            case 42:
                return UserMetadata.MAX_INTERNAL_KEY_SIZE;
            case 50:
                return ReaderJsonLexerKt.BATCH_SIZE;
            case 51:
                return SQLiteDatabase.OPEN_NOMUTEX;
            case 52:
                return SQLiteDatabase.OPEN_FULLMUTEX;
            default:
                return -1;
        }
    }

    public static int A03(int i5) {
        switch (i5) {
            case 1:
            case 2:
                return 25344;
            case 8:
            case 16:
            case 32:
                return 101376;
            case 64:
                return 202752;
            case 128:
            case 256:
                if (A02[4].charAt(2) != 'l') {
                    throw new RuntimeException();
                }
                A02[3] = "9NTwP7jR1QHHvJZsVMMjIfQzJj7PXppb";
                return 414720;
            case EventBridgeChannel.QUEUE_CAPACITY /* 512 */:
                return 921600;
            case 1024:
                return 1310720;
            case 2048:
            case androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT /* 4096 */:
                return 2097152;
            case UserMetadata.MAX_INTERNAL_KEY_SIZE /* 8192 */:
                return 2228224;
            case ReaderJsonLexerKt.BATCH_SIZE /* 16384 */:
                return 5652480;
            case SQLiteDatabase.OPEN_NOMUTEX /* 32768 */:
            case SQLiteDatabase.OPEN_FULLMUTEX /* 65536 */:
                return 9437184;
            case SQLiteDatabase.OPEN_SHAREDCACHE /* 131072 */:
            case SQLiteDatabase.OPEN_PRIVATECACHE /* 262144 */:
            case 524288:
                return 35651584;
            default:
                return -1;
        }
    }

    public static int A04(int i5) {
        switch (i5) {
            case 66:
                return 1;
            case 77:
                return 2;
            case 88:
                return 4;
            case 100:
                return 8;
            case 110:
                return 16;
            case INVALID_ADS_ENDPOINT_VALUE:
                return 32;
            case 244:
                return 64;
            default:
                return -1;
        }
    }

    public static int A05(int i5) {
        switch (i5) {
            case 1:
                return 1;
            case 2:
                if (A02[3].charAt(7) != 'R') {
                    throw new RuntimeException();
                }
                A02[3] = "eB8BWvgRCOR56DPi9E8V4RotZF3WcVOb";
                return 2;
            case 3:
                return 3;
            case 4:
                return 4;
            case 5:
                return 5;
            case 6:
                return 6;
            case 17:
                return 17;
            case 20:
                return 20;
            case 23:
                return 23;
            case 29:
                return 29;
            case 39:
                return 39;
            case 42:
                return 42;
            default:
                return -1;
        }
    }

    public static int A06(int i5) {
        switch (i5) {
            case 10:
                return 1;
            case 11:
                return 2;
            case 20:
                return 4;
            case 21:
                return 8;
            case 30:
                return 16;
            case 31:
                return 32;
            case 40:
                return 64;
            case 41:
                return 128;
            case 50:
                return 256;
            case 51:
                return EventBridgeChannel.QUEUE_CAPACITY;
            case 60:
                return 2048;
            case 61:
                if (A02[2].charAt(18) == 'r') {
                    throw new RuntimeException();
                }
                A02[3] = "oCnZef6RuMlDl4hDjp9YbNpW5t5yAPGg";
                return androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            case 62:
                return UserMetadata.MAX_INTERNAL_KEY_SIZE;
            default:
                return -1;
        }
    }

    public static int A07(int i5) {
        switch (i5) {
            case 0:
                return 1;
            case 1:
                String[] strArr = A02;
                if (strArr[6].charAt(15) != strArr[0].charAt(15)) {
                    return 2;
                }
                A02[3] = "zjpHGKFRd9AKlJSDPomoSAUO9T5a5LfX";
                return 2;
            case 2:
                String[] strArr2 = A02;
                if (strArr2[5].length() == strArr2[1].length()) {
                    throw new RuntimeException();
                }
                String[] strArr3 = A02;
                strArr3[5] = "lV2izc8g2kw8KhmWtCRKuWOaEoUT3CRn";
                strArr3[1] = "KTznvB6sDbZjnvUopcIGIaZ";
                return 4;
            case 3:
                return 8;
            default:
                return -1;
        }
    }

    public static /* synthetic */ int A08(C1234Sq c1234Sq) {
        String str = c1234Sq.A03;
        String name = A0N(861, 10, 13);
        if (str.startsWith(name)) {
            return 1;
        }
        String name2 = A0N(1560, 10, 22);
        if (str.startsWith(name2)) {
            return 1;
        }
        if (N1.A02 >= 26) {
            return 0;
        }
        String name3 = A0N(725, 25, 2);
        if (str.equals(name3)) {
            return -1;
        }
        return 0;
    }

    public static /* synthetic */ int A09(C1234Sq c1234Sq) {
        return c1234Sq.A03.startsWith(A0N(861, 10, 13)) ? 1 : 0;
    }

    public static /* synthetic */ int A0A(TM tm2, Object obj, Object obj2) {
        return tm2.A9Z(obj2) - tm2.A9Z(obj);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:13:0x0053  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00b0  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Pair<Integer, Integer> A0B(VC vc) throws NumberFormatException {
        if (vc.A0R == null) {
            return null;
        }
        String[] strArrSplit = vc.A0R.split(A0N(1407, 2, 108));
        if (A0N(1765, 18, 44).equals(vc.A0W)) {
            return A0E(vc.A0R, strArrSplit);
        }
        char c11 = 0;
        String str = strArrSplit[0];
        if (A02[2].charAt(18) != 'r') {
            String[] strArr = A02;
            strArr[5] = "g9rKOWN7zDwbh1XMiJbaCPQJhxpJfftf";
            strArr[1] = "v0Jh6jnorZtCk4QF1Ey6pBz";
            switch (str.hashCode()) {
                case 3004662:
                    if (!str.equals(A0N(1545, 4, 113))) {
                        c11 = 65535;
                        break;
                    } else {
                        c11 = 5;
                        break;
                    }
                case 3006243:
                    if (!str.equals(A0N(1549, 4, 54))) {
                    }
                    break;
                case 3006244:
                    if (str.equals(A0N(1553, 4, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE))) {
                        c11 = 1;
                        break;
                    }
                    break;
                case 3199032:
                    if (A02[7].charAt(9) != 'A') {
                        A02[2] = "VO6YVvTiIvgUZEsn7gSa3xNY1khKDZ8p";
                        if (str.equals(A0N(1600, 4, 51))) {
                            c11 = 3;
                            break;
                        }
                    } else {
                        String[] strArr2 = A02;
                        strArr2[6] = "ba5yFE65KxvqqTGmzEVpP5Ni4EGBmMUY";
                        strArr2[0] = "YbACTLMvpFCSlTLmLPHlmPsy2XSMtJB1";
                        if (str.equals(A0N(1600, 4, 114))) {
                        }
                    }
                    break;
                case 3214780:
                    if (str.equals(A0N(1604, 4, 67))) {
                        c11 = 4;
                        break;
                    }
                    break;
                case 3356560:
                    if (str.equals(A0N(1625, 4, 91))) {
                        c11 = 6;
                        break;
                    }
                    break;
                case 3624515:
                    if (str.equals(A0N(1839, 4, 35))) {
                        c11 = 2;
                        break;
                    }
                    break;
            }
            switch (c11) {
                case 0:
                case 1:
                    return A0D(vc.A0R, strArrSplit);
                case 2:
                    return A0F(vc.A0R, strArrSplit);
                case 3:
                case 4:
                    return A0H(vc.A0R, strArrSplit, vc.A0N);
                case 5:
                    return A0G(vc.A0R, strArrSplit, vc.A0N);
                case 6:
                    return A0C(vc.A0R, strArrSplit);
                default:
                    return null;
            }
        }
        throw new RuntimeException();
    }

    public static Pair<Integer, Integer> A0C(String str, String[] strArr) throws NumberFormatException {
        int length = strArr.length;
        String strA0N = A0N(428, 38, 113);
        String strA0N2 = A0N(615, 14, 52);
        if (length != 3) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
        try {
            int objectTypeIndication = Integer.parseInt(strArr[1], 16);
            if (A0N(1491, 15, 110).equals(L8.A05(objectTypeIndication))) {
                int objectTypeIndication2 = Integer.parseInt(strArr[2]);
                int iA05 = A05(objectTypeIndication2);
                if (iA05 != -1) {
                    return new Pair<>(Integer.valueOf(iA05), 0);
                }
            }
        } catch (NumberFormatException unused) {
            MV.A07(strA0N2, strA0N + str);
        }
        return null;
    }

    public static Pair<Integer, Integer> A0D(String str, String[] strArr) throws NumberFormatException {
        int i5;
        int i11;
        int length = strArr.length;
        String strA0N = A0N(Sdk.SDKError.Reason.AD_EXPIRED_ON_PLAY_VALUE, 37, 42);
        String strA0N2 = A0N(615, 14, 52);
        if (length < 2) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
        try {
            if (strArr[1].length() == 6) {
                i5 = Integer.parseInt(strArr[1].substring(0, 2), 16);
                i11 = Integer.parseInt(strArr[1].substring(4), 16);
            } else if (strArr.length >= 3) {
                i5 = Integer.parseInt(strArr[1]);
                i11 = Integer.parseInt(strArr[2]);
            } else {
                MV.A07(strA0N2, strA0N + str);
                return null;
            }
            int iA04 = A04(i5);
            if (iA04 == -1) {
                MV.A07(strA0N2, A0N(1212, 21, 104) + i5);
                return null;
            }
            int levelInteger = A02(i11);
            if (levelInteger == -1) {
                MV.A07(strA0N2, A0N(1193, 19, 44) + i11);
                return null;
            }
            return new Pair<>(Integer.valueOf(iA04), Integer.valueOf(levelInteger));
        } catch (NumberFormatException unused) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
    }

    public static Pair<Integer, Integer> A0E(String str, String[] strArr) {
        int length = strArr.length;
        String strA0N = A0N(344, 46, 83);
        String strA0N2 = A0N(615, 14, 52);
        if (length < 3) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
        Matcher matcher = A04.matcher(strArr[1]);
        if (!matcher.matches()) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
        String strGroup = matcher.group(1);
        Integer numA0L = A0L(strGroup);
        if (numA0L == null) {
            MV.A07(strA0N2, A0N(1268, 37, 75) + strGroup);
            return null;
        }
        String levelString = strArr[2];
        String profileString = A02[7];
        if (profileString.charAt(9) != 'A') {
            throw new RuntimeException();
        }
        String[] strArr2 = A02;
        strArr2[5] = "S9zkjqpoyUH9inSfD9kVhS4ney05wWfo";
        strArr2[1] = "9xt422QbI46eLZqNwVxu0MP";
        Integer numA0K = A0K(levelString);
        if (numA0K == null) {
            MV.A07(strA0N2, A0N(1233, 35, 87) + levelString);
            return null;
        }
        return new Pair<>(numA0L, numA0K);
    }

    public static Pair<Integer, Integer> A0F(String str, String[] strArr) throws NumberFormatException {
        int length = strArr.length;
        String strA0N = A0N(466, 37, 36);
        String strA0N2 = A0N(615, 14, 52);
        if (length < 3) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
        try {
            int i5 = Integer.parseInt(strArr[1]);
            int i11 = Integer.parseInt(strArr[2]);
            int profile = A07(i5);
            if (profile == -1) {
                MV.A07(strA0N2, A0N(1380, 21, 13) + i5);
                return null;
            }
            int profileInteger = A06(i11);
            if (profileInteger == -1) {
                MV.A07(strA0N2, A0N(1361, 19, 25) + i11);
                return null;
            }
            return new Pair<>(Integer.valueOf(profile), Integer.valueOf(profileInteger));
        } catch (NumberFormatException unused) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x00cc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Pair<Integer, Integer> A0G(String str, String[] strArr, ColorInfo colorInfo) throws NumberFormatException {
        int i5;
        int length = strArr.length;
        String strA0N = A0N(270, 37, 61);
        String strA0N2 = A0N(615, 14, 52);
        if (length < 4) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
        try {
            int i11 = Integer.parseInt(strArr[1]);
            int profile = Integer.parseInt(strArr[2].substring(0, 2));
            int i12 = Integer.parseInt(strArr[3]);
            if (i11 != 0) {
                MV.A07(strA0N2, A0N(1172, 21, 80) + i11);
                return null;
            }
            if (i12 != 8 && i12 != 10) {
                MV.A07(strA0N2, A0N(1130, 23, 82) + i12);
                return null;
            }
            if (i12 == 8) {
                i5 = 1;
            } else if (colorInfo != null) {
                if (colorInfo.A04 == null) {
                    int levelInteger = colorInfo.A03;
                    if (levelInteger != 7) {
                        int levelInteger2 = colorInfo.A03;
                        if (levelInteger2 == 6) {
                        }
                    }
                }
                i5 = androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            } else {
                i5 = 2;
            }
            int levelInteger3 = A01(profile);
            if (levelInteger3 == -1) {
                MV.A07(strA0N2, A0N(1153, 19, Sdk.SDKError.Reason.TPAT_ERROR_VALUE) + profile);
                return null;
            }
            return new Pair<>(Integer.valueOf(i5), Integer.valueOf(levelInteger3));
        } catch (NumberFormatException unused) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
    }

    public static Pair<Integer, Integer> A0H(String str, String[] strArr, ColorInfo colorInfo) {
        int i5;
        int length = strArr.length;
        String strA0N = A0N(390, 38, 37);
        String strA0N2 = A0N(615, 14, 52);
        if (length < 4) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
        Matcher matcher = A04.matcher(strArr[1]);
        if (!matcher.matches()) {
            MV.A07(strA0N2, strA0N + str);
            return null;
        }
        String levelString = matcher.group(1);
        if (A0N(77, 1, 77).equals(levelString)) {
            i5 = 1;
        } else if (A0N(86, 1, 74).equals(levelString)) {
            if (colorInfo != null && colorInfo.A03 == 6) {
                i5 = androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT;
            } else {
                i5 = 2;
            }
        } else {
            MV.A07(strA0N2, A0N(1332, 29, 92) + levelString);
            return null;
        }
        String levelString2 = strArr[3];
        Integer numA0M = A0M(levelString2);
        if (numA0M == null) {
            MV.A07(strA0N2, A0N(1305, 27, 22) + levelString2);
            return null;
        }
        return new Pair<>(Integer.valueOf(i5), numA0M);
    }

    public static C1234Sq A0I() throws TK {
        return A0J(A0N(1506, 9, 17), false, false);
    }

    public static C1234Sq A0J(String str, boolean z11, boolean z12) throws TK {
        List<C1234Sq> listA0R = A0R(str, z11, z12);
        if (listA0R.isEmpty()) {
            return null;
        }
        return listA0R.get(0);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0117  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x011e  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0125  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x012c  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0133  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x013a  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:68:0x015e  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x016f  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0174  */
    /* JADX WARN: Removed duplicated region for block: B:78:0x0179  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0010  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0014 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Integer A0K(String str) {
        char c11;
        if (str == null) {
            return null;
        }
        switch (str.hashCode()) {
            case 1537:
                c11 = str.equals(A0N(59, 2, 5)) ? (char) 0 : (char) 65535;
                switch (c11) {
                    case 0:
                        return 1;
                    case 1:
                        return 2;
                    case 2:
                        return 4;
                    case 3:
                        return 8;
                    case 4:
                        return 16;
                    case 5:
                        return 32;
                    case 6:
                        if (A02[4].charAt(2) != 'l') {
                            return 64;
                        }
                        A02[3] = "I0dSnu3RcYiUgXcZOTFCd7cKTt97n99I";
                        return 64;
                    case 7:
                        return 128;
                    case '\b':
                        String[] strArr = A02;
                        if (strArr[6].charAt(15) == strArr[0].charAt(15)) {
                            A02[4] = "TKlLS193G0RDuo6EKixXlatqbVh9bidO";
                            return 256;
                        }
                        break;
                    case '\t':
                        return Integer.valueOf(EventBridgeChannel.QUEUE_CAPACITY);
                    case '\n':
                        return 1024;
                    case 11:
                        return 2048;
                    case '\f':
                        return Integer.valueOf(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                    default:
                        return null;
                }
                throw new RuntimeException();
            case 1538:
                if (str.equals(A0N(61, 2, 69))) {
                    c11 = 1;
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1539:
                if (str.equals(A0N(63, 2, 38))) {
                    c11 = 2;
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1540:
                if (str.equals(A0N(65, 2, 22))) {
                    c11 = 3;
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1541:
                if (str.equals(A0N(67, 2, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE))) {
                    c11 = 4;
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1542:
                if (str.equals(A0N(69, 2, 40))) {
                    c11 = 5;
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1543:
                if (str.equals(A0N(71, 2, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE))) {
                    c11 = 6;
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1544:
                if (str.equals(A0N(73, 2, 89))) {
                    c11 = 7;
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1545:
                if (str.equals(A0N(75, 2, 79))) {
                    c11 = '\b';
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1567:
                if (str.equals(A0N(78, 2, 61))) {
                    c11 = '\t';
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1568:
                if (str.equals(A0N(80, 2, 99))) {
                    c11 = '\n';
                }
                switch (c11) {
                }
                throw new RuntimeException();
            case 1569:
                String[] strArr2 = A02;
                if (strArr2[5].length() != strArr2[1].length()) {
                    A02[2] = "7NdxXyvdwPVJRftqUY2wxMKlj1n7eRzg";
                    if (str.equals(A0N(82, 2, 37))) {
                        c11 = 11;
                    }
                    switch (c11) {
                    }
                }
                throw new RuntimeException();
            case 1570:
                if (str.equals(A0N(84, 2, Sdk.SDKError.Reason.PROTOBUF_SERIALIZATION_ERROR_VALUE))) {
                    c11 = '\f';
                }
                switch (c11) {
                }
                throw new RuntimeException();
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:49:0x011d  */
    /* JADX WARN: Removed duplicated region for block: B:51:0x0124  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x012b  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0158  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x015f  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0166  */
    /* JADX WARN: Removed duplicated region for block: B:65:0x016d  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0172  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x0177  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x017c  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0010  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0014 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Integer A0L(String str) {
        char c11;
        if (str == null) {
            return null;
        }
        switch (str.hashCode()) {
            case 1536:
                c11 = str.equals(A0N(57, 2, 56)) ? (char) 0 : (char) 65535;
                switch (c11) {
                    case 0:
                        return 1;
                    case 1:
                        return 2;
                    case 2:
                        return 4;
                    case 3:
                        return 8;
                    case 4:
                        return 16;
                    case 5:
                        return 32;
                    case 6:
                        return 64;
                    case 7:
                        if (A02[3].charAt(7) != 'R') {
                            A02[7] = "8S2YWKwdKAKe1CQo9HDo1Hu2DfNxbzAD";
                            return 128;
                        }
                        String[] strArr = A02;
                        strArr[6] = "oFJqwurlYXb39u7mQCp61OqscqIeBaZf";
                        strArr[0] = "2VTONKbeJhtvekFmIoqBhFquTYl001GW";
                        return 128;
                    case '\b':
                        return 256;
                    case '\t':
                        return Integer.valueOf(EventBridgeChannel.QUEUE_CAPACITY);
                    default:
                        return null;
                }
            case 1537:
                if (A02[7].charAt(9) == 'A') {
                    String[] strArr2 = A02;
                    strArr2[6] = "24VAuTAi90Z4EtCmrc1fPZHXkeVyN1FF";
                    strArr2[0] = "NjIHQNrKzK0Ns2ImEBzkNMMsijGpPmpK";
                    if (str.equals(A0N(59, 2, 5))) {
                        c11 = 1;
                    }
                    switch (c11) {
                    }
                }
                throw new RuntimeException();
            case 1538:
                if (A02[7].charAt(9) == 'A') {
                    A02[7] = "tzHhCV1q6AHsq615yKmCggqrQ7CwzYSp";
                    if (str.equals(A0N(61, 2, 69))) {
                        c11 = 2;
                    }
                    switch (c11) {
                    }
                }
                throw new RuntimeException();
            case 1539:
                if (str.equals(A0N(63, 2, 38))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 1540:
                if (str.equals(A0N(65, 2, 22))) {
                    c11 = 4;
                }
                switch (c11) {
                }
            case 1541:
                if (str.equals(A0N(67, 2, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE))) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case 1542:
                String[] strArr3 = A02;
                if (strArr3[5].length() != strArr3[1].length()) {
                    String[] strArr4 = A02;
                    strArr4[6] = "AMSiMJ10hGixZEbmMmGVedYDliEnOJen";
                    strArr4[0] = "t71rCTPmCzGvnFImWCDR981xSZqFBmvA";
                    if (str.equals(A0N(69, 2, 40))) {
                        c11 = 6;
                    }
                    switch (c11) {
                    }
                }
                throw new RuntimeException();
            case 1543:
                if (str.equals(A0N(71, 2, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE))) {
                    c11 = 7;
                }
                switch (c11) {
                }
            case 1544:
                if (str.equals(A0N(73, 2, 89))) {
                    c11 = '\b';
                }
                switch (c11) {
                }
            case 1545:
                if (str.equals(A0N(75, 2, 79))) {
                    c11 = '\t';
                }
                switch (c11) {
                }
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:101:0x0242  */
    /* JADX WARN: Removed duplicated region for block: B:103:0x0249  */
    /* JADX WARN: Removed duplicated region for block: B:105:0x0250  */
    /* JADX WARN: Removed duplicated region for block: B:107:0x0257  */
    /* JADX WARN: Removed duplicated region for block: B:109:0x025f  */
    /* JADX WARN: Removed duplicated region for block: B:111:0x0266  */
    /* JADX WARN: Removed duplicated region for block: B:113:0x026d  */
    /* JADX WARN: Removed duplicated region for block: B:115:0x0274  */
    /* JADX WARN: Removed duplicated region for block: B:117:0x027b  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0282  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0287  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x028c  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0293  */
    /* JADX WARN: Removed duplicated region for block: B:127:0x029a  */
    /* JADX WARN: Removed duplicated region for block: B:129:0x02a1  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02a8  */
    /* JADX WARN: Removed duplicated region for block: B:133:0x02af  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x02b6  */
    /* JADX WARN: Removed duplicated region for block: B:137:0x02bd  */
    /* JADX WARN: Removed duplicated region for block: B:139:0x02c4  */
    /* JADX WARN: Removed duplicated region for block: B:145:0x02f2  */
    /* JADX WARN: Removed duplicated region for block: B:147:0x02f9  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x02fe  */
    /* JADX WARN: Removed duplicated region for block: B:151:0x0303  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0012  */
    /* JADX WARN: Removed duplicated region for block: B:84:0x01e3  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x0234  */
    /* JADX WARN: Removed duplicated region for block: B:99:0x023b  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0016 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Integer A0M(String str) {
        char c11;
        if (str == null) {
            return null;
        }
        switch (str.hashCode()) {
            case 70821:
                c11 = str.equals(A0N(253, 3, 47)) ? '\r' : (char) 65535;
                switch (c11) {
                    case 0:
                        return 1;
                    case 1:
                        return 4;
                    case 2:
                        return 16;
                    case 3:
                        return 64;
                    case 4:
                        String[] strArr = A02;
                        if (strArr[6].charAt(15) != strArr[0].charAt(15)) {
                            A02[3] = "Ykig2JKRpXuYZ4YNzXrojwX7NIQTzNG2";
                            return 256;
                        }
                        A02[3] = "m2iijEbR23EvrfZ6Kv0Tj0ffopLNEGiq";
                        return 256;
                    case 5:
                        return 1024;
                    case 6:
                        return Integer.valueOf(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                    case 7:
                        return Integer.valueOf(ReaderJsonLexerKt.BATCH_SIZE);
                    case '\b':
                        return Integer.valueOf(SQLiteDatabase.OPEN_FULLMUTEX);
                    case '\t':
                        return Integer.valueOf(SQLiteDatabase.OPEN_PRIVATECACHE);
                    case '\n':
                        return 1048576;
                    case 11:
                        return 4194304;
                    case '\f':
                        return 16777216;
                    case '\r':
                        return 2;
                    case 14:
                        return 8;
                    case 15:
                        return 32;
                    case 16:
                        return 128;
                    case 17:
                        return Integer.valueOf(EventBridgeChannel.QUEUE_CAPACITY);
                    case 18:
                        return 2048;
                    case 19:
                        return Integer.valueOf(UserMetadata.MAX_INTERNAL_KEY_SIZE);
                    case 20:
                        return Integer.valueOf(SQLiteDatabase.OPEN_NOMUTEX);
                    case 21:
                        return Integer.valueOf(SQLiteDatabase.OPEN_SHAREDCACHE);
                    case 22:
                        return 524288;
                    case 23:
                        return 2097152;
                    case 24:
                        return 8388608;
                    case 25:
                        return 33554432;
                    default:
                        return null;
                }
            case 70914:
                if (str.equals(A0N(256, 3, 88))) {
                    c11 = 14;
                }
                switch (c11) {
                }
            case 70917:
                if (str.equals(A0N(259, 3, 99))) {
                    c11 = 15;
                }
                switch (c11) {
                }
            case 71007:
                if (A02[7].charAt(9) == 'A') {
                    A02[7] = "aoLJil7LMAHjDju71l5axfeNH0uKvG9t";
                    if (str.equals(A0N(262, 3, 110))) {
                    }
                } else if (str.equals(A0N(262, 3, 110))) {
                    c11 = 16;
                }
                switch (c11) {
                }
            case 71010:
                if (str.equals(A0N(265, 3, 24))) {
                    c11 = 17;
                }
                switch (c11) {
                }
            case 74665:
                if (str.equals(A0N(535, 3, 48))) {
                    c11 = 0;
                }
                switch (c11) {
                }
            case 74758:
                if (str.equals(A0N(542, 3, 49))) {
                    c11 = 1;
                }
                switch (c11) {
                }
            case 74761:
                if (str.equals(A0N(545, 3, 81))) {
                    c11 = 2;
                }
                switch (c11) {
                }
            case 74851:
                if (str.equals(A0N(548, 3, 13))) {
                    c11 = 3;
                }
                switch (c11) {
                }
            case 74854:
                if (str.equals(A0N(551, 3, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE))) {
                    c11 = 4;
                }
                switch (c11) {
                }
            case 2193639:
                if (str.equals(A0N(Sdk.SDKError.Reason.AD_LOAD_FAIL_RETRY_AFTER_VALUE, 4, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE))) {
                    c11 = 18;
                }
                switch (c11) {
                }
            case 2193642:
                if (str.equals(A0N(Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE, 4, 9))) {
                    c11 = 19;
                }
                switch (c11) {
                }
            case 2193732:
                if (str.equals(A0N(229, 4, Sdk.SDKError.Reason.JSON_ENCODE_ERROR_VALUE))) {
                    c11 = 20;
                }
                switch (c11) {
                }
            case 2193735:
                if (str.equals(A0N(233, 4, 89))) {
                    c11 = 21;
                }
                switch (c11) {
                }
            case 2193738:
                if (str.equals(A0N(237, 4, 66))) {
                    c11 = 22;
                }
                switch (c11) {
                }
            case 2193825:
                if (str.equals(A0N(241, 4, 41))) {
                    c11 = 23;
                }
                switch (c11) {
                }
            case 2193828:
                if (str.equals(A0N(245, 4, 2))) {
                    c11 = 24;
                }
                switch (c11) {
                }
            case 2193831:
                if (str.equals(A0N(249, 4, 14))) {
                    c11 = 25;
                }
                switch (c11) {
                }
            case 2312803:
                if (str.equals(A0N(PglCryptUtils.COMPRESS_FAILED, 4, 76))) {
                    c11 = 5;
                }
                switch (c11) {
                }
            case 2312806:
                if (A02[3].charAt(7) != 'R') {
                    throw new RuntimeException();
                }
                A02[2] = "fzWK9p6YnDlUuc60NPShoW0cux6m0lRC";
                if (str.equals(A0N(PglCryptUtils.UNKNOWN_ERR, 4, 14))) {
                    c11 = 6;
                }
                switch (c11) {
                }
            case 2312896:
                if (str.equals(A0N(511, 4, 100))) {
                    c11 = 7;
                }
                switch (c11) {
                }
            case 2312899:
                if (str.equals(A0N(515, 4, 120))) {
                    c11 = '\b';
                }
                switch (c11) {
                }
            case 2312902:
                if (str.equals(A0N(519, 4, 45))) {
                    c11 = '\t';
                }
                switch (c11) {
                }
            case 2312989:
                if (str.equals(A0N(523, 4, 32))) {
                    c11 = '\n';
                }
                switch (c11) {
                }
            case 2312992:
                if (str.equals(A0N(527, 4, 44))) {
                    c11 = 11;
                }
                switch (c11) {
                }
            case 2312995:
                if (str.equals(A0N(531, 4, 82))) {
                    c11 = '\f';
                }
                switch (c11) {
                }
        }
    }

    public static String A0O(MediaCodecInfo mediaCodecInfo, String str, String str2) {
        for (String str3 : mediaCodecInfo.getSupportedTypes()) {
            if (str3.equalsIgnoreCase(str2)) {
                return str3;
            }
        }
        if (str2.equals(A0N(1765, 18, 44))) {
            if (A0N(651, 21, 5).equals(str)) {
                return A0N(1806, 12, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
            }
            if (A0N(750, 21, 7).equals(str) || A0N(1056, 34, 14).equals(str)) {
                return A0N(1783, 13, 87);
            }
            return null;
        }
        if (str2.equals(A0N(1435, 10, 4)) && A0N(912, 20, 91).equals(str)) {
            return A0N(1515, 15, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE);
        }
        if (str2.equals(A0N(1469, 10, 55)) && A0N(932, 20, 115).equals(str)) {
            return A0N(1530, 15, 78);
        }
        if (str2.equals(A0N(1426, 9, 41)) && A0N(893, 19, 109).equals(str)) {
            return A0N(1479, 12, 50);
        }
        return null;
    }

    public static String A0P(VC vc) throws NumberFormatException {
        if (A0N(1455, 14, 91).equals(vc.A0W)) {
            return A0N(1445, 10, 22);
        }
        String strA0N = A0N(1765, 18, 44);
        if (A02[3].charAt(7) != 'R') {
            throw new RuntimeException();
        }
        A02[2] = "rqInriroazKdRsv5jXjIPAgzbzIN4TC0";
        if (strA0N.equals(vc.A0W)) {
            Pair<Integer, Integer> pairA0B = A0B(vc);
            if (A02[7].charAt(9) != 'A') {
                A02[2] = "NQfq8aQjQWGHe8sFbgE1hG7FQREG1IYe";
                if (pairA0B == null) {
                    return null;
                }
            } else {
                A02[7] = "XsFRotiGYAAFSsgEYFWT7BVtqhbOagPk";
                if (pairA0B == null) {
                    return null;
                }
            }
            int iIntValue = ((Integer) pairA0B.first).intValue();
            if (A02[2].charAt(18) == 'r') {
                throw new RuntimeException();
            }
            String[] strArr = A02;
            strArr[5] = "iRih6KkEaMp7CFZGb37GmG26CbrMhDzO";
            strArr[1] = "UeJjFOHTtO0f00JDb1ilo8Z";
            if (iIntValue == 16 || iIntValue == 256) {
                return A0N(1796, 10, 15);
            }
            if (iIntValue != 512) {
                return null;
            }
            int profile = A02[2].charAt(18);
            if (profile != 114) {
                String[] strArr2 = A02;
                strArr2[5] = "vIlxmHBbHwVyrZx4UCFLkGU4tMJeC6xE";
                strArr2[1] = "wIzFQwHa4Wsc07pp9aeXx5i";
                return A0N(1756, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
            }
            return A0N(1756, 9, Sdk.SDKError.Reason.INVALID_RI_ENDPOINT_VALUE);
        }
        return null;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.9l != com.google.common.collect.ImmutableList<com.facebook.ads.androidx.media3.exoplayer.mediacodec.MediaCodecInfo> */
    public static synchronized List<C1234Sq> A0R(String str, boolean z11, boolean z12) throws TK {
        TL s72;
        TJ tj2 = new TJ(str, z11, z12);
        List<C1234Sq> list = A03.get(tj2);
        if (list != null) {
            return list;
        }
        if (N1.A02 >= 21) {
            s72 = new S6(z11, z12);
        } else {
            s72 = new S7();
        }
        ArrayList<C1234Sq> arrayListA0Q = A0Q(tj2, s72);
        if (z11 && arrayListA0Q.isEmpty() && 21 <= N1.A02 && N1.A02 <= 23) {
            arrayListA0Q = A0Q(tj2, new S7());
            if (!arrayListA0Q.isEmpty()) {
                MV.A07(A0N(615, 14, 52), A0N(564, 51, 1) + str + A0N(34, 12, 2) + arrayListA0Q.get(0).A03);
            }
        }
        A0T(str, arrayListA0Q);
        AbstractC07549l abstractC07549lA05 = AbstractC07549l.A05(arrayListA0Q);
        A03.put(tj2, abstractC07549lA05);
        return abstractC07549lA05;
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x00bc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static void A0T(String str, List<C1234Sq> list) {
        if (A0N(1506, 9, 17).equals(str)) {
            if (N1.A02 < 26 && N1.A03.equals(A0N(1090, 2, 6)) && list.size() == 1 && list.get(0).A03.equals(A0N(725, 25, 2))) {
                list.add(C1234Sq.A02(A0N(871, 22, 63), A0N(1506, 9, 17), A0N(1506, 9, 17), null, false, true, false, false, false));
            }
            A0U(list, new TM() { // from class: com.facebook.ads.redexgen.X.S9
                @Override // com.facebook.ads.redexgen.X.TM
                public final int A9Z(Object obj) {
                    return TN.A08((C1234Sq) obj);
                }
            });
        }
        if (N1.A02 < 21 && list.size() > 1) {
            String str2 = list.get(0).A03;
            String firstCodecName = A0N(805, 15, 106);
            if (!firstCodecName.equals(str2)) {
                String firstCodecName2 = A0N(771, 19, 60);
                if (!firstCodecName2.equals(str2)) {
                    String firstCodecName3 = A0N(835, 26, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE);
                    if (firstCodecName3.equals(str2)) {
                        A0U(list, new TM() { // from class: com.facebook.ads.redexgen.X.S8
                            @Override // com.facebook.ads.redexgen.X.TM
                            public final int A9Z(Object obj) {
                                return TN.A09((C1234Sq) obj);
                            }
                        });
                    }
                }
            }
        }
        if (N1.A02 < 32 && list.size() > 1) {
            String str3 = list.get(0).A03;
            String firstCodecName4 = A0N(1030, 26, 106);
            if (firstCodecName4.equals(str3)) {
                list.add(list.remove(0));
            }
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.TM != com.facebook.ads.androidx.media3.exoplayer.mediacodec.MediaCodecUtil$ScoreProvider<T> */
    public static <T> void A0U(List<T> list, final TM<T> tm2) {
        Collections.sort(list, new Comparator() { // from class: com.facebook.ads.redexgen.X.TH
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return TN.A0A(tm2, obj, obj2);
            }
        });
    }

    public static boolean A0V(MediaCodecInfo mediaCodecInfo) {
        return N1.A02 >= 29 && A0W(mediaCodecInfo);
    }

    public static boolean A0W(MediaCodecInfo mediaCodecInfo) {
        return mediaCodecInfo.isAlias();
    }

    public static boolean A0X(MediaCodecInfo mediaCodecInfo) {
        return mediaCodecInfo.isHardwareAccelerated();
    }

    public static boolean A0Y(MediaCodecInfo mediaCodecInfo) {
        return mediaCodecInfo.isSoftwareOnly();
    }

    public static boolean A0Z(MediaCodecInfo mediaCodecInfo) {
        if (N1.A02 >= 29) {
            return A0a(mediaCodecInfo);
        }
        String strA01 = XC.A01(mediaCodecInfo.getName());
        String codecName = A0N(1644, 11, 43);
        if (!strA01.startsWith(codecName)) {
            String codecName2 = A0N(1570, 11, 69);
            if (!strA01.startsWith(codecName2)) {
                String codecName3 = A0N(1581, 10, 57);
                if (!strA01.startsWith(codecName3)) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean A0a(MediaCodecInfo mediaCodecInfo) {
        return mediaCodecInfo.isVendor();
    }

    public static boolean A0b(MediaCodecInfo mediaCodecInfo, String str) {
        if (N1.A02 >= 29) {
            return A0X(mediaCodecInfo);
        }
        return !A0c(mediaCodecInfo, str);
    }

    public static boolean A0c(MediaCodecInfo mediaCodecInfo, String str) {
        if (N1.A02 >= 29) {
            return A0Y(mediaCodecInfo);
        }
        if (L8.A0C(str)) {
            return true;
        }
        String strA01 = XC.A01(mediaCodecInfo.getName());
        String codecName = A0N(1422, 4, 114);
        boolean zStartsWith = strA01.startsWith(codecName);
        if (A02[4].charAt(2) == 'l') {
            String[] strArr = A02;
            strArr[6] = "kPKQnTipPTqOrKfmBaU8B0RizfdUv9N2";
            strArr[0] = "yPiEXPzK2jm7ufpmDtWHR21tDFVHIGIt";
            if (zStartsWith) {
                return false;
            }
            if (A02[4].charAt(2) != 'l') {
                String[] strArr2 = A02;
                strArr2[5] = "T1Vmzi3QSMeCtN55oXwOzx8sVY2YMDkl";
                strArr2[1] = "YfLEJN30HrAZTn6s3cLSURc";
                String codecName2 = A0N(1644, 11, 40);
                if (strA01.startsWith(codecName2)) {
                    return true;
                }
            } else {
                A02[3] = "UOJS2AFRQSbQzLO8G4M2TGgqeJJyfnLV";
                String codecName3 = A0N(1644, 11, 43);
                if (strA01.startsWith(codecName3)) {
                    return true;
                }
            }
            String codecName4 = A0N(1633, 11, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE);
            if (strA01.startsWith(codecName4)) {
                return true;
            }
            String[] strArr3 = A02;
            String str2 = strArr3[5];
            String codecName5 = strArr3[1];
            if (str2.length() != codecName5.length()) {
                A02[7] = "acLj2MZZzAWrC0mXSbFvBgGe7y7u70QG";
                String codecName6 = A0N(1688, 8, 35);
                if (strA01.startsWith(codecName6)) {
                    String codecName7 = A0N(53, 4, 31);
                    if (strA01.contains(codecName7)) {
                        return true;
                    }
                }
                String codecName8 = A0N(1655, 33, 63);
                if (strA01.equals(codecName8)) {
                    return true;
                }
                String codecName9 = A0N(1570, 11, 69);
                if (strA01.startsWith(codecName9)) {
                    return true;
                }
                String codecName10 = A0N(1581, 10, 57);
                if (strA01.startsWith(codecName10)) {
                    return true;
                }
                String codecName11 = A0N(1629, 4, 67);
                if (!strA01.startsWith(codecName11)) {
                    String codecName12 = A0N(1557, 3, 96);
                    if (!strA01.startsWith(codecName12)) {
                        return true;
                    }
                }
                return false;
            }
        }
        throw new RuntimeException();
    }

    /* JADX WARN: Code restructure failed: missing block: B:114:0x0339, code lost:
    
        if (A0N(1104, 5, 115).equals(com.facebook.ads.redexgen.X.N1.A03) != false) goto L115;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x00c7, code lost:
    
        if (com.facebook.ads.redexgen.X.N1.A03.startsWith(A0N(268, 2, 80)) != false) goto L33;
     */
    /* JADX WARN: Code restructure failed: missing block: B:65:0x01c5, code lost:
    
        if (A0N(1109, 6, 18).equals(com.facebook.ads.redexgen.X.N1.A03) != false) goto L66;
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:0x0245, code lost:
    
        if (A0N(com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE, 5, com.vungle.ads.internal.protos.Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE).equals(com.facebook.ads.redexgen.X.N1.A03) != false) goto L84;
     */
    /* JADX WARN: Removed duplicated region for block: B:139:0x03d2  */
    /* JADX WARN: Removed duplicated region for block: B:142:0x03e6  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x0236  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x02a6  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0d(MediaCodecInfo mediaCodecInfo, String str, boolean z11, String str2) {
        int i5;
        int i11;
        String[] strArr;
        if (mediaCodecInfo.isEncoder() || (!z11 && str.endsWith(A0N(46, 7, 90)))) {
            return false;
        }
        if (N1.A02 < 21 && (A0N(142, 13, 101).equals(str) || A0N(170, 13, 19).equals(str) || A0N(183, 16, 10).equals(str) || A0N(155, 15, 115).equals(str) || A0N(92, 10, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE).equals(str) || A0N(554, 10, 10).equals(str))) {
            return false;
        }
        if (N1.A02 < 18 && A0N(672, 25, 78).equals(str)) {
            if (!A0N(1419, 3, 99).equals(N1.A03)) {
                if (A0N(1401, 6, 109).equals(N1.A05)) {
                }
            }
            return false;
        }
        if (N1.A02 == 16 && A0N(978, 26, 39).equals(str)) {
            if (!A0N(1593, 4, 47).equals(N1.A03)) {
                if (!A0N(1696, 6, 11).equals(N1.A03)) {
                    if (!A0N(1818, 5, 18).equals(N1.A03)) {
                        if (!A0N(1830, 9, 17).equals(N1.A03)) {
                            if (!A0N(1823, 7, 0).equals(N1.A03) && !N1.A03.startsWith(A0N(1597, 3, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE))) {
                                boolean zEquals = A0N(Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE, 5, 13).equals(N1.A03);
                                if (A02[4].charAt(2) == 'l') {
                                    A02[3] = "9m3PWv4R1nqDZ4K7VZR2qa5S3dN0rssd";
                                    if (!zEquals) {
                                        if (!A0N(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 5, 46).equals(N1.A03)) {
                                            if (!A0N(Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE, 5, 23).equals(N1.A03)) {
                                                if (!A0N(Sdk.SDKError.Reason.TPAT_RETRY_FAILED_VALUE, 5, 61).equals(N1.A03)) {
                                                    if (!A0N(538, 4, 34).equals(N1.A03)) {
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return false;
        }
        if (N1.A02 == 16) {
            String strA0N = A0N(952, 26, 103);
            if (A02[7].charAt(9) == 'A') {
                A02[7] = "T92fq3TYFAoTFAJpbDTTebmTKJyXd1Ra";
                if (strA0N.equals(str)) {
                    if (!A0N(102, 5, 67).equals(N1.A03)) {
                        if (!A0N(107, 5, 11).equals(N1.A03)) {
                            String str3 = N1.A03;
                            if (A02[7].charAt(9) != 'A') {
                                if (!A0N(112, 5, 98).equals(str3)) {
                                }
                            } else {
                                A02[3] = "7uZypqpR7w6iFPcJUn6FEvjRlvwRFQ5U";
                                if (!A0N(112, 5, 98).equals(str3)) {
                                }
                            }
                        }
                    }
                    return false;
                }
                i5 = N1.A02;
                String strA0N2 = A0N(1702, 7, 15);
                if (i5 < 24 && ((A0N(790, 15, 47).equals(str) || A0N(629, 22, 24).equals(str)) && strA0N2.equals(N1.A05))) {
                    if (!N1.A03.startsWith(A0N(1849, 8, 24))) {
                        String str4 = N1.A03;
                        String[] strArr2 = A02;
                        if (strArr2[6].charAt(15) == strArr2[0].charAt(15)) {
                            A02[2] = "w6RNWVPnpt8IhazXmAfz20BbrQs66CSP";
                            if (!str4.startsWith(A0N(1857, 7, Sdk.SDKError.Reason.INVALID_METRICS_ENDPOINT_VALUE)) && !N1.A03.startsWith(A0N(1843, 6, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE))) {
                                if (!A0N(1098, 6, 48).equals(N1.A03)) {
                                    if (!A0N(1613, 12, 19).equals(N1.A03)) {
                                        if (!A0N(87, 5, 110).equals(N1.A03)) {
                                            if (!A0N(1092, 6, 51).equals(N1.A03)) {
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    return false;
                }
                i11 = N1.A02;
                String strA0N3 = A0N(1608, 5, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
                if (i11 > 19 && A0N(820, 15, 47).equals(str) && strA0N2.equals(N1.A05) && (N1.A03.startsWith(A0N(1591, 2, 62)) || N1.A03.startsWith(A0N(1730, 7, 51)) || N1.A03.startsWith(strA0N3) || N1.A03.startsWith(A0N(1709, 6, 23)) || N1.A03.startsWith(A0N(1737, 2, 32)))) {
                    return false;
                }
                if (N1.A02 <= 19 && N1.A03.startsWith(strA0N3)) {
                    strArr = A02;
                    if (strArr[5].length() != strArr[1].length()) {
                        throw new RuntimeException();
                    }
                    A02[4] = "SZl25rkGCC09HgWCVMpMO8iqJ6nsXgdS";
                    if (A0N(1004, 26, 84).equals(str)) {
                        return false;
                    }
                }
                if (N1.A02 > 23 && A0N(1455, 14, 91).equals(str2)) {
                    boolean zEquals2 = A0N(697, 28, 30).equals(str);
                    if (A02[7].charAt(9) != 'A') {
                        throw new RuntimeException();
                    }
                    A02[2] = "XCvQ2pQdHx1eq9FO8GhfJFgwC5Zz1X11";
                    return !zEquals2;
                }
            }
        } else {
            i5 = N1.A02;
            String strA0N22 = A0N(1702, 7, 15);
            if (i5 < 24) {
                if (!N1.A03.startsWith(A0N(1849, 8, 24))) {
                }
                return false;
            }
            i11 = N1.A02;
            String strA0N32 = A0N(1608, 5, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE);
            if (i11 > 19) {
            }
            if (N1.A02 <= 19) {
                strArr = A02;
                if (strArr[5].length() != strArr[1].length()) {
                }
            }
            return N1.A02 > 23 ? true : true;
        }
        throw new RuntimeException();
    }
}
