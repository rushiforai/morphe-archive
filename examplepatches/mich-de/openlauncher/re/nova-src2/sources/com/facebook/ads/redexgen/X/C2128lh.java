package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.content.SharedPreferences;
import android.util.Log;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.internal.util.process.ProcessUtils;
import com.vungle.ads.internal.protos.Sdk;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.atomic.AtomicInteger;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.lh, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2128lh {
    public static byte[] A00;
    public static String[] A01 = {"TEIgz1GSUxi0w6HxI", "WqDufwBE7AlvD41n6qdN4YbCXU2LtDad", "95AkSvnB6didgYS0", "q9Pm9O4XheyxpjJIaV85netzFUNpUTJ1", "laKi0sQOm1cRNFPmXQKezZzTFfBBOlTJ", "R9By8R7rHrFXxi8d0eZrOpOQKJFwFXXr", "DNKj97yZe49oXEmfRz7aINNiwqbkjDQZ", "HsAQREGxpVIGFVt11mTJ2r8ajNtMZb1h"};
    public static final Object A02;
    public static final String A03;
    public static final Map<String, Integer> A04;
    public static final Set<String> A05;
    public static final AtomicInteger A06;

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 9 out of bounds for length 9
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:135)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static C2130lj A01(String str, C2095lA c2095lA, Map<String, String> map) {
        C2130lj c2130lj = null;
        try {
            c2130lj = new C2130lj(c2095lA.A09().A01(), c2095lA.A09().A02(), new C2114lT(str, map, true).A02());
            A0C(c2130lj, c2095lA);
            return c2130lj;
        } catch (Exception unused) {
            return c2130lj;
        }
    }

    public static String A02(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A00, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE);
        }
        return new String(bArrCopyOfRange);
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 12 out of bounds for length 12
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static JSONArray A04(C2095lA c2095lA, int i5) {
        InterfaceC2125le interfaceC2125leA08;
        JSONArray jSONArray = new JSONArray();
        synchronized (A02) {
            FileInputStream fileInputStreamOpenFileInput = null;
            InputStreamReader inputStreamReader = null;
            BufferedReader bufferedReader = null;
            try {
                try {
                    if (new File(c2095lA.getFilesDir(), ProcessUtils.getProcessSpecificName(A02(281, 9, 51), c2095lA)).exists()) {
                        fileInputStreamOpenFileInput = c2095lA.openFileInput(ProcessUtils.getProcessSpecificName(A02(281, 9, 51), c2095lA));
                        inputStreamReader = new InputStreamReader(fileInputStreamOpenFileInput);
                        bufferedReader = new BufferedReader(inputStreamReader);
                        while (true) {
                            String line = bufferedReader.readLine();
                            if (line == null || i5 == 0) {
                                break;
                            }
                            JSONObject jSONObject = new JSONObject(line);
                            if (!jSONObject.has(A02(260, 7, 27))) {
                                jSONObject.put(A02(260, 7, 27), String.valueOf(0));
                            }
                            String string = jSONObject.getString(A02(343, 2, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
                            if (!A05.contains(string)) {
                                int i11 = jSONObject.getInt(A02(260, 7, 27));
                                if (A04.containsKey(string)) {
                                    jSONObject.put(A02(260, 7, 27), String.valueOf(A04.get(string)));
                                } else {
                                    A0E(string, i11);
                                }
                                jSONArray.put(jSONObject);
                                if (i5 > 0) {
                                    i5--;
                                }
                            }
                        }
                    }
                    if (bufferedReader != null) {
                        try {
                            bufferedReader.close();
                        } catch (IOException e3) {
                            e = e3;
                            interfaceC2125leA08 = c2095lA.A08();
                            interfaceC2125leA08.A4j(e);
                            return jSONArray;
                        }
                    }
                    if (inputStreamReader != null) {
                        inputStreamReader.close();
                    }
                    if (fileInputStreamOpenFileInput != null) {
                        fileInputStreamOpenFileInput.close();
                    }
                } catch (IOException | JSONException e11) {
                    c2095lA.A08().A4j(e11);
                    if (bufferedReader != null) {
                        try {
                            bufferedReader.close();
                        } catch (IOException e12) {
                            e = e12;
                            interfaceC2125leA08 = c2095lA.A08();
                            interfaceC2125leA08.A4j(e);
                            return jSONArray;
                        }
                    }
                    if (inputStreamReader != null) {
                        inputStreamReader.close();
                    }
                    if (fileInputStreamOpenFileInput != null) {
                        fileInputStreamOpenFileInput.close();
                    }
                }
            } finally {
                if (bufferedReader != null) {
                    try {
                    } catch (IOException e13) {
                    }
                }
            }
        }
        return jSONArray;
    }

    public static void A06() {
        A00 = new byte[]{7, 95, 83, 55, 1, 28, 3, 48, 28, 6, 29, 7, 22, 1, 73, 83, 63, 29, 18, 91, 8, 92, 24, 25, 16, 25, 8, 25, 92, 24, 25, 30, 9, 27, 92, 25, 10, 25, 18, 8, 15, 92, 26, 21, 16, 25, 82, 14, 44, 35, 106, 57, 109, 41, 40, 33, 40, 57, 40, 109, 43, 36, 33, 40, 108, 119, 118, 113, 102, 116, 108, 99, 97, 118, 117, 42, 25, 10, 1, 27, 44, 0, 26, 1, 27, 41, 45, 46, 26, 11, 6, 10, 1, 12, 10, 33, 10, 27, 24, 0, 29, 4, 31, 58, 61, 40, 42, 111, 43, 42, 45, 58, 40, 111, 42, 57, 42, 33, 59, 60, 111, 41, 38, 35, 42, 97, 69, 9, 38, 35, 42, 111, 60, 38, 53, 42, 117, 111, 111, 87, 85, 76, 76, 89, 88, 28, 89, 74, 89, 82, 72, 79, 18, 40, 16, 18, 11, 11, 18, 21, 28, 91, 24, 20, 9, 9, 14, 11, 15, 30, 31, 91, 31, 30, 25, 14, 28, 91, 30, 13, 30, 21, 15, 91, 23, 18, 21, 30, 85, 98, 68, 79, 95, 88, 81, 22, 66, 89, 22, 67, 70, 82, 87, 66, 83, 22, 67, 88, 68, 83, 85, 89, 68, 82, 83, 82, 22, 82, 83, 84, 67, 81, 122, 89, 81, 115, 64, 83, 88, 66, 24, 22, 87, 82, 82, 95, 88, 81, 22, 66, 89, 22, 121, 88, 81, 89, 95, 88, 81, 115, 64, 83, 88, 66, 24, 58, 17, 0, 8, 21, 6, 19, 19, 2, 10, 23, 19, 88, 93, 72, 93, AbstractJsonLexerKt.TC_INVALID, 126, 68, 119, 116, 124, 124, 114, 117, 124, 43, 42, 45, 58, 40, 35, 32, 40, 60, 91, 84, 83, 84, 78, 85, 88, 89, 29, 88, 75, 88, 83, 73, 29, 78, 85, 82, 72, 81, 89, 29, 83, 82, 73, 29, 95, 88, 29, 72, 77, 89, 92, 73, 88, 89, 29, 73, 82, 29, 114, 83, 90, 82, 84, 83, 90, 120, 75, 88, 83, 73, 19, 107, 102, 126, 104, 126, 126, 100, 98, 99, 82, 100, 105, 72, 94, 72, 72, 82, 84, 85, 100, 79, 82, 86, 94, 105, 113, 115, 106, 106, AbstractJsonLexerKt.TC_INVALID, 126, 95, 108, AbstractJsonLexerKt.TC_INVALID, 116, 110, 105, 58, 39, 58, 49, 55, 32, 54, 59, 50, 39, 75, 77, 90, 76, 65, 72, 93, 103, 91, 87, 92, 93, 119, 106, 110, 102, 85, 88, 81, 68};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 16 out of bounds for length 15
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:147)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    public static boolean A0G(C2095lA c2095lA) {
        JSONArray jSONArray = new JSONArray();
        synchronized (A02) {
            int i5 = 0;
            FileInputStream fileInputStreamOpenFileInput = null;
            InputStreamReader inputStreamReader = null;
            BufferedReader bufferedReader = null;
            FileOutputStream fileOutputStreamOpenFileOutput = null;
            try {
                try {
                    if (new File(c2095lA.getFilesDir(), ProcessUtils.getProcessSpecificName(A02(281, 9, 51), c2095lA)).exists()) {
                        fileInputStreamOpenFileInput = c2095lA.openFileInput(ProcessUtils.getProcessSpecificName(A02(281, 9, 51), c2095lA));
                        inputStreamReader = new InputStreamReader(fileInputStreamOpenFileInput);
                        bufferedReader = new BufferedReader(inputStreamReader);
                        while (true) {
                            String line = bufferedReader.readLine();
                            if (line == null) {
                                break;
                            }
                            JSONObject jSONObject = new JSONObject(line);
                            String string = jSONObject.getString(A02(343, 2, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
                            if (!A05.contains(string)) {
                                if (A04.containsKey(string)) {
                                    Integer num = A04.get(string);
                                    Integer numValueOf = Integer.valueOf(num != null ? num.intValue() : 0);
                                    int iA02 = AbstractC2205mx.A02(c2095lA);
                                    if (iA02 <= -1 || numValueOf.intValue() <= iA02 - 1) {
                                        jSONObject.put(A02(260, 7, 27), String.valueOf(numValueOf));
                                        jSONArray.put(jSONObject);
                                    } else {
                                        A0D(string);
                                        i5++;
                                    }
                                } else {
                                    jSONArray.put(jSONObject);
                                }
                            }
                        }
                        StringBuilder sb2 = new StringBuilder();
                        int length = jSONArray.length();
                        for (int i11 = 0; i11 < length; i11++) {
                            sb2.append(jSONArray.getJSONObject(i11).toString()).append('\n');
                        }
                        fileOutputStreamOpenFileOutput = c2095lA.openFileOutput(ProcessUtils.getProcessSpecificName(A02(281, 9, 51), c2095lA), 0);
                        fileOutputStreamOpenFileOutput.write(sb2.toString().getBytes());
                    }
                    A09(c2095lA, A00(c2095lA));
                    if (i5 > 0) {
                        c2095lA.A08().ABz(A02(271, 10, 103), AbstractC2126lf.A2Y, new C2127lg(A02(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 15, 64), A02(367, 16, 102) + i5));
                    }
                    if (bufferedReader != null) {
                        try {
                            bufferedReader.close();
                        } catch (IOException e3) {
                            c2095lA.A08().A4j(e3);
                        }
                    }
                    if (inputStreamReader != null) {
                        inputStreamReader.close();
                    }
                    if (fileInputStreamOpenFileInput != null) {
                        fileInputStreamOpenFileInput.close();
                    }
                    if (fileOutputStreamOpenFileOutput != null) {
                        fileOutputStreamOpenFileOutput.close();
                    }
                    A05.clear();
                    A04.clear();
                    return true;
                } finally {
                    if (bufferedReader != null) {
                        try {
                        } catch (IOException e11) {
                        }
                    }
                }
            } catch (IOException | JSONException e12) {
                c2095lA.A08().A4j(e12);
                if (bufferedReader != null) {
                    try {
                        bufferedReader.close();
                    } catch (IOException e13) {
                        c2095lA.A08().A4j(e13);
                        A05.clear();
                        A04.clear();
                        return false;
                    }
                }
                if (inputStreamReader != null) {
                    inputStreamReader.close();
                }
                if (fileInputStreamOpenFileInput != null) {
                    fileInputStreamOpenFileInput.close();
                }
                if (fileOutputStreamOpenFileOutput != null) {
                    fileOutputStreamOpenFileOutput.close();
                }
                A05.clear();
                A04.clear();
                return false;
            }
        }
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 18 out of bounds for length 18
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    /* JADX WARN: Removed duplicated region for block: B:100:0x01fc A[Catch: IOException -> 0x020a, all -> 0x0254, TryCatch #7 {IOException -> 0x020a, blocks: (B:94:0x01ed, B:96:0x01f2, B:98:0x01f7, B:100:0x01fc, B:102:0x0201, B:104:0x0206), top: B:137:0x01ed, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:102:0x0201 A[Catch: IOException -> 0x020a, all -> 0x0254, TryCatch #7 {IOException -> 0x020a, blocks: (B:94:0x01ed, B:96:0x01f2, B:98:0x01f7, B:100:0x01fc, B:102:0x0201, B:104:0x0206), top: B:137:0x01ed, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0206 A[Catch: IOException -> 0x020a, all -> 0x0254, TRY_LEAVE, TryCatch #7 {IOException -> 0x020a, blocks: (B:94:0x01ed, B:96:0x01f2, B:98:0x01f7, B:100:0x01fc, B:102:0x0201, B:104:0x0206), top: B:137:0x01ed, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0229 A[Catch: IOException -> 0x0241, all -> 0x0254, TryCatch #8 {IOException -> 0x0241, blocks: (B:115:0x0224, B:117:0x0229, B:119:0x022e, B:121:0x0233, B:123:0x0238, B:125:0x023d), top: B:139:0x0224, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:119:0x022e A[Catch: IOException -> 0x0241, all -> 0x0254, TryCatch #8 {IOException -> 0x0241, blocks: (B:115:0x0224, B:117:0x0229, B:119:0x022e, B:121:0x0233, B:123:0x0238, B:125:0x023d), top: B:139:0x0224, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:121:0x0233 A[Catch: IOException -> 0x0241, all -> 0x0254, TryCatch #8 {IOException -> 0x0241, blocks: (B:115:0x0224, B:117:0x0229, B:119:0x022e, B:121:0x0233, B:123:0x0238, B:125:0x023d), top: B:139:0x0224, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0238 A[Catch: IOException -> 0x0241, all -> 0x0254, TryCatch #8 {IOException -> 0x0241, blocks: (B:115:0x0224, B:117:0x0229, B:119:0x022e, B:121:0x0233, B:123:0x0238, B:125:0x023d), top: B:139:0x0224, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:125:0x023d A[Catch: IOException -> 0x0241, all -> 0x0254, TRY_LEAVE, TryCatch #8 {IOException -> 0x0241, blocks: (B:115:0x0224, B:117:0x0229, B:119:0x022e, B:121:0x0233, B:123:0x0238, B:125:0x023d), top: B:139:0x0224, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:137:0x01ed A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:139:0x0224 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:164:0x0111 A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:168:0x005d A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x01f2 A[Catch: IOException -> 0x020a, all -> 0x0254, TryCatch #7 {IOException -> 0x020a, blocks: (B:94:0x01ed, B:96:0x01f2, B:98:0x01f7, B:100:0x01fc, B:102:0x0201, B:104:0x0206), top: B:137:0x01ed, outer: #17 }] */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01f7 A[Catch: IOException -> 0x020a, all -> 0x0254, TryCatch #7 {IOException -> 0x020a, blocks: (B:94:0x01ed, B:96:0x01f2, B:98:0x01f7, B:100:0x01fc, B:102:0x0201, B:104:0x0206), top: B:137:0x01ed, outer: #17 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static boolean A0H(C2095lA c2095lA) {
        int iIntValue;
        synchronized (A02) {
            int i5 = 0;
            FileInputStream fileInputStreamOpenFileInput = null;
            InputStreamReader inputStreamReader = null;
            BufferedReader bufferedReader = null;
            FileOutputStream fileOutputStreamOpenFileOutput = null;
            FileInputStream fileInputStreamOpenFileInput2 = null;
            FileOutputStream fileOutputStreamOpenFileOutput2 = null;
            try {
                try {
                    String processSpecificName = ProcessUtils.getProcessSpecificName(A02(281, 9, 51), c2095lA);
                    File file = new File(c2095lA.getFilesDir(), processSpecificName);
                    String str = processSpecificName + A02(255, 5, 25);
                    A0A(c2095lA, str);
                    if (file.exists()) {
                        fileOutputStreamOpenFileOutput2 = c2095lA.openFileOutput(str, SQLiteDatabase.OPEN_NOMUTEX);
                        fileInputStreamOpenFileInput = c2095lA.openFileInput(processSpecificName);
                        try {
                            inputStreamReader = new InputStreamReader(fileInputStreamOpenFileInput);
                            try {
                                bufferedReader = new BufferedReader(inputStreamReader);
                                while (true) {
                                    try {
                                        String line = bufferedReader.readLine();
                                        if (line == null) {
                                            break;
                                        }
                                        try {
                                            JSONObject jSONObject = new JSONObject(line);
                                            String string = jSONObject.getString(A02(343, 2, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE));
                                            if (!A05.contains(string)) {
                                                if (A04.containsKey(string)) {
                                                    try {
                                                        Integer num = A04.get(string);
                                                        if (num != null) {
                                                            try {
                                                                iIntValue = num.intValue();
                                                            } catch (IOException e3) {
                                                                e = e3;
                                                                c2095lA.A08().A4j(e);
                                                                if (bufferedReader != null) {
                                                                }
                                                                if (inputStreamReader != null) {
                                                                }
                                                                if (fileInputStreamOpenFileInput != null) {
                                                                }
                                                                if (fileOutputStreamOpenFileOutput != null) {
                                                                }
                                                                if (fileInputStreamOpenFileInput2 != null) {
                                                                }
                                                                if (fileOutputStreamOpenFileOutput2 != null) {
                                                                }
                                                                A05.clear();
                                                                A04.clear();
                                                                return false;
                                                            } catch (JSONException e11) {
                                                                e = e11;
                                                                if (!c2095lA.A05().AB6()) {
                                                                }
                                                            } catch (Throwable th2) {
                                                                th = th2;
                                                                if (bufferedReader != null) {
                                                                }
                                                                if (inputStreamReader != null) {
                                                                }
                                                                if (fileInputStreamOpenFileInput != null) {
                                                                }
                                                                if (fileOutputStreamOpenFileOutput != null) {
                                                                }
                                                                if (fileInputStreamOpenFileInput2 != null) {
                                                                }
                                                                if (fileOutputStreamOpenFileOutput2 != null) {
                                                                }
                                                                A05.clear();
                                                                A04.clear();
                                                                throw th;
                                                            }
                                                        } else {
                                                            iIntValue = 0;
                                                        }
                                                        Integer numValueOf = Integer.valueOf(iIntValue);
                                                        int iA02 = AbstractC2205mx.A02(c2095lA);
                                                        if (iA02 > -1) {
                                                            try {
                                                                if (numValueOf.intValue() > iA02 - 1) {
                                                                    try {
                                                                        try {
                                                                            A0D(string);
                                                                            i5++;
                                                                        } catch (JSONException e12) {
                                                                            e = e12;
                                                                            if (!c2095lA.A05().AB6()) {
                                                                                Log.e(A03, A02(153, 36, 7), e);
                                                                            }
                                                                        }
                                                                    } catch (IOException e13) {
                                                                        e = e13;
                                                                        c2095lA.A08().A4j(e);
                                                                        if (bufferedReader != null) {
                                                                            try {
                                                                                bufferedReader.close();
                                                                            } catch (IOException e14) {
                                                                                c2095lA.A08().A4j(e14);
                                                                                A05.clear();
                                                                                A04.clear();
                                                                                return false;
                                                                            }
                                                                        }
                                                                        if (inputStreamReader != null) {
                                                                            inputStreamReader.close();
                                                                        }
                                                                        if (fileInputStreamOpenFileInput != null) {
                                                                            fileInputStreamOpenFileInput.close();
                                                                        }
                                                                        if (fileOutputStreamOpenFileOutput != null) {
                                                                            fileOutputStreamOpenFileOutput.close();
                                                                        }
                                                                        if (fileInputStreamOpenFileInput2 != null) {
                                                                            fileInputStreamOpenFileInput2.close();
                                                                        }
                                                                        if (fileOutputStreamOpenFileOutput2 != null) {
                                                                            fileOutputStreamOpenFileOutput2.close();
                                                                        }
                                                                        A05.clear();
                                                                        A04.clear();
                                                                        return false;
                                                                    } catch (Throwable th3) {
                                                                        th = th3;
                                                                        if (bufferedReader != null) {
                                                                            try {
                                                                                bufferedReader.close();
                                                                            } catch (IOException e15) {
                                                                                c2095lA.A08().A4j(e15);
                                                                                A05.clear();
                                                                                A04.clear();
                                                                                throw th;
                                                                            }
                                                                        }
                                                                        if (inputStreamReader != null) {
                                                                            inputStreamReader.close();
                                                                        }
                                                                        if (fileInputStreamOpenFileInput != null) {
                                                                            fileInputStreamOpenFileInput.close();
                                                                        }
                                                                        if (fileOutputStreamOpenFileOutput != null) {
                                                                            fileOutputStreamOpenFileOutput.close();
                                                                        }
                                                                        if (fileInputStreamOpenFileInput2 != null) {
                                                                            fileInputStreamOpenFileInput2.close();
                                                                        }
                                                                        if (fileOutputStreamOpenFileOutput2 != null) {
                                                                            fileOutputStreamOpenFileOutput2.close();
                                                                        }
                                                                        A05.clear();
                                                                        A04.clear();
                                                                        throw th;
                                                                    }
                                                                }
                                                            } catch (IOException e16) {
                                                                e = e16;
                                                                c2095lA.A08().A4j(e);
                                                                if (bufferedReader != null) {
                                                                }
                                                                if (inputStreamReader != null) {
                                                                }
                                                                if (fileInputStreamOpenFileInput != null) {
                                                                }
                                                                if (fileOutputStreamOpenFileOutput != null) {
                                                                }
                                                                if (fileInputStreamOpenFileInput2 != null) {
                                                                }
                                                                if (fileOutputStreamOpenFileOutput2 != null) {
                                                                }
                                                                A05.clear();
                                                                A04.clear();
                                                                return false;
                                                            } catch (JSONException e17) {
                                                                e = e17;
                                                            } catch (Throwable th4) {
                                                                th = th4;
                                                                if (bufferedReader != null) {
                                                                }
                                                                if (inputStreamReader != null) {
                                                                }
                                                                if (fileInputStreamOpenFileInput != null) {
                                                                }
                                                                if (fileOutputStreamOpenFileOutput != null) {
                                                                }
                                                                if (fileInputStreamOpenFileInput2 != null) {
                                                                }
                                                                if (fileOutputStreamOpenFileOutput2 != null) {
                                                                }
                                                                A05.clear();
                                                                A04.clear();
                                                                throw th;
                                                            }
                                                        }
                                                        jSONObject.put(A02(260, 7, 27), String.valueOf(numValueOf));
                                                        fileOutputStreamOpenFileOutput2.write((jSONObject.toString() + '\n').getBytes());
                                                    } catch (IOException e18) {
                                                        e = e18;
                                                    } catch (JSONException e19) {
                                                        e = e19;
                                                    } catch (Throwable th5) {
                                                        th = th5;
                                                    }
                                                } else {
                                                    fileOutputStreamOpenFileOutput2.write((jSONObject.toString() + '\n').getBytes());
                                                }
                                            }
                                        } catch (JSONException e21) {
                                            e = e21;
                                        }
                                    } catch (IOException e22) {
                                        e = e22;
                                    } catch (Throwable th6) {
                                        th = th6;
                                    }
                                }
                                fileInputStreamOpenFileInput2 = c2095lA.openFileInput(str);
                                fileOutputStreamOpenFileOutput = c2095lA.openFileOutput(processSpecificName, 0);
                                byte[] bArr = new byte[1024];
                                while (true) {
                                    int i11 = fileInputStreamOpenFileInput2.read(bArr);
                                    if (i11 <= 0) {
                                        break;
                                    }
                                    fileOutputStreamOpenFileOutput.write(bArr, 0, i11);
                                }
                                fileInputStreamOpenFileInput2.close();
                                fileOutputStreamOpenFileOutput2.close();
                                A0A(c2095lA, str);
                            } catch (IOException e23) {
                                e = e23;
                            } catch (Throwable th7) {
                                th = th7;
                            }
                        } catch (IOException e24) {
                            e = e24;
                        } catch (Throwable th8) {
                            th = th8;
                        }
                    }
                    A09(c2095lA, A00(c2095lA));
                    if (i5 > 0) {
                        c2095lA.A08().ABz(A02(271, 10, 103), AbstractC2126lf.A2Y, new C2127lg(A02(Sdk.SDKError.Reason.CONFIG_REFRESH_FAILED_VALUE, 15, 64), A02(367, 16, 102) + i5));
                    }
                    if (bufferedReader != null) {
                        try {
                            bufferedReader.close();
                        } catch (IOException e25) {
                            c2095lA.A08().A4j(e25);
                        }
                    }
                    if (inputStreamReader != null) {
                        inputStreamReader.close();
                    }
                    if (fileInputStreamOpenFileInput != null) {
                        fileInputStreamOpenFileInput.close();
                    }
                    if (fileOutputStreamOpenFileOutput != null) {
                        fileOutputStreamOpenFileOutput.close();
                    }
                    if (fileInputStreamOpenFileInput2 != null) {
                        fileInputStreamOpenFileInput2.close();
                    }
                    if (fileOutputStreamOpenFileOutput2 != null) {
                        fileOutputStreamOpenFileOutput2.close();
                    }
                    A05.clear();
                    A04.clear();
                    return true;
                } catch (IOException e26) {
                    e = e26;
                }
            } catch (Throwable th9) {
                th = th9;
            }
        }
    }

    static {
        A06();
        A03 = C2128lh.class.getName();
        A02 = new Object();
        A05 = Collections.synchronizedSet(new HashSet());
        A04 = Collections.synchronizedMap(new HashMap());
        A06 = new AtomicInteger();
    }

    public static int A00(Context context) {
        return context.getSharedPreferences(ProcessUtils.getProcessSpecificName(A02(65, 10, 79), context), 0).getInt(A02(75, 10, 19), 0) - A05.size();
    }

    public static JSONArray A03(C2095lA c2095lA) {
        return A04(c2095lA, -1);
    }

    public static JSONObject A05(C2130lj c2130lj) throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put(A02(343, 2, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), UUID.randomUUID().toString());
        jSONObject.put(A02(TTAdConstant.LANDING_PAGE_TYPE_CODE, 4, 93), c2130lj.A03());
        jSONObject.put(A02(TTAdConstant.AD_ID_IS_NULL_CODE, 4, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE), C2416qS.A03(c2130lj.A01()));
        jSONObject.put(A02(355, 12, 71), C2416qS.A03(c2130lj.A00()));
        jSONObject.put(A02(345, 10, 113), c2130lj.A02());
        jSONObject.put(A02(267, 4, 64), c2130lj.A04() != null ? new JSONObject(c2130lj.A04()) : new JSONObject());
        jSONObject.put(A02(260, 7, 27), String.valueOf(0));
        return jSONObject;
    }

    public static void A07(Context context) {
        synchronized (A02) {
            File file = new File(context.getFilesDir(), ProcessUtils.getProcessSpecificName(A02(281, 9, 51), context));
            if (file.exists()) {
                file.delete();
            }
            A09(context, 0);
            A05.clear();
            A04.clear();
        }
    }

    public static void A08(Context context) {
        A09(context, context.getSharedPreferences(ProcessUtils.getProcessSpecificName(A02(65, 10, 79), context), 0).getInt(A02(75, 10, 19), 0) + 1);
    }

    public static void A09(Context context, int i5) {
        int i11 = 0;
        SharedPreferences sharedPreferences = context.getSharedPreferences(ProcessUtils.getProcessSpecificName(A02(65, 10, 79), context), 0);
        SharedPreferences.Editor editorEdit = sharedPreferences.edit();
        if (i5 >= 0) {
            i11 = i5;
        }
        editorEdit.putInt(A02(75, 10, 19), i11).apply();
    }

    public static void A0A(C2095lA c2095lA, String str) {
        File file = new File(c2095lA.getFilesDir(), str);
        if (file.exists() && !file.delete()) {
            c2095lA.A08().A4j(new RuntimeException(A02(47, 18, 49)));
        }
    }

    public static void A0B(C0957Hh c0957Hh, String str) {
        Integer num = A04.get(str);
        if (num == null) {
            if (c0957Hh.A05().AB6()) {
                Log.e(A03, A02(189, 66, 74));
            }
            num = 0;
        } else {
            A04.remove(str);
        }
        Map<String, Integer> map = A04;
        Integer attempt = Integer.valueOf(num.intValue() + 1);
        map.put(str, attempt);
    }

    public static void A0C(C2130lj c2130lj, C2095lA c2095lA) {
        if (c2130lj != null && c2095lA != null) {
            synchronized (A02) {
                try {
                    String processSpecificName = ProcessUtils.getProcessSpecificName(A02(281, 9, 51), c2095lA);
                    File file = new File(c2095lA.getFilesDir(), processSpecificName);
                    if (file.exists()) {
                        int debugLogFileSizeLimit = AbstractC2205mx.A07(c2095lA);
                        long length = file.length();
                        if (debugLogFileSizeLimit > 0 && length > debugLogFileSizeLimit) {
                            boolean zDelete = file.delete();
                            A09(c2095lA, 0);
                            A05.clear();
                            A04.clear();
                            if (zDelete) {
                                Map<String, String> mapA69 = c2095lA.A04().A69();
                                mapA69.put(A02(383, 7, 62), A02(271, 10, 103));
                                mapA69.put(A02(390, 12, 68), String.valueOf(2401));
                                A01(A02(102, 36, 51) + length + A02(1, 15, 15) + A06.getAndIncrement(), c2095lA, mapA69);
                                return;
                            }
                            String processSpecificName2 = A02(85, 17, 19);
                            Log.e(processSpecificName2, A02(16, 31, 0));
                        }
                    }
                    JSONObject jSONObjectA05 = A05(c2130lj);
                    FileOutputStream outputStream = c2095lA.openFileOutput(processSpecificName, SQLiteDatabase.OPEN_NOMUTEX);
                    outputStream.write((jSONObjectA05.toString() + A02(0, 1, 113)).getBytes());
                    outputStream.close();
                    A08(c2095lA);
                } catch (Exception e3) {
                    c2095lA.A08().A4j(e3);
                }
            }
        }
    }

    public static void A0D(String str) {
        A04.remove(str);
        A05.add(str);
    }

    public static void A0E(String str, int i5) {
        if (!A05.contains(str)) {
            boolean zContainsKey = A04.containsKey(str);
            if (A01[7].charAt(23) == 'F') {
                throw new RuntimeException();
            }
            A01[6] = "rEqe91lv7lznGuMpeMm8YlOivWfc8wjs";
            if (zContainsKey) {
                A04.remove(str);
            }
            A04.put(str, Integer.valueOf(i5));
            return;
        }
        throw new RuntimeException(A02(290, 53, 65));
    }

    public static boolean A0F(C2095lA c2095lA) {
        if (AbstractC2205mx.A0O(c2095lA)) {
            return A0H(c2095lA);
        }
        boolean zA0G = A0G(c2095lA);
        String[] strArr = A01;
        if (strArr[0].length() == strArr[5].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A01;
        strArr2[3] = "3ABJ1YchwKShiC4YrWnTlA0erUDCQvCN";
        strArr2[1] = "wuaZskSkctYpKQ1vHIoiu3NDqUJM9HRQ";
        return zA0G;
    }

    public static boolean A0I(String str) {
        return A05.contains(str) || A04.containsKey(str);
    }
}
