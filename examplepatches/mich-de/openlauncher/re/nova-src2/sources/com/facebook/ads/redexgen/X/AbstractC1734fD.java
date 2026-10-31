package com.facebook.ads.redexgen.X;

import android.text.TextUtils;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.facebook.ads.RewardData;
import com.vungle.ads.internal.protos.Sdk;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.facebook.ads.redexgen.X.fD, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1734fD implements Serializable {
    public static String A1R = null;
    public static byte[] A1S = null;
    public static String[] A1T = {"nQEL7ltu", "3I3h", "XGwMyflu2SSmsRt1RfrJRUY9I72rnsF", "QYAlpzJzU24310l7paj9Ae15", "2mdfEFQBKkTooSy2QZ4PIVa2Ztt82faR", "LWmzkzhltJuYyEaTC5aoGJqcPz9GQgBs", "qY0", "qq9iBauleUUoVYq0iZ43n7I7uVpCZZUg"};
    public static final long serialVersionUID = -8352540727250859603L;
    public double A00;
    public int A01;
    public int A02;
    public int A03;
    public int A04;
    public int A05;
    public long A06;
    public long A07;
    public long A08;
    public long A09;
    public long A0A;
    public RewardData A0B;
    public C1745fO A0C;
    public String A0D;
    public String A0E;
    public String A0F;
    public String A0G;
    public String A0H;
    public String A0I;
    public String A0J;
    public String A0K;
    public String A0L;
    public String A0M;
    public String A0N;
    public String A0O;
    public String A0P;
    public String A0Q;
    public String A0R;
    public String A0S;
    public String A0T;
    public String A0U;
    public String A0V;
    public String A0W;
    public String A0X;
    public String A0Y;
    public String A0Z;
    public String A0a;
    public String A0b;
    public String A0c;
    public String A0d;
    public String A0e;
    public String A0f;
    public boolean A0g;
    public boolean A0h;
    public boolean A0i;
    public boolean A0j;
    public boolean A0k;
    public boolean A0l;
    public boolean A0m;
    public boolean A0n;
    public boolean A0o;
    public boolean A0p;
    public boolean A0q;
    public boolean A0r;
    public boolean A0s;
    public boolean A0t;
    public boolean A0u;
    public boolean A0v;
    public boolean A0w;
    public boolean A0x;
    public boolean A0y;
    public boolean A0z;
    public boolean A10;
    public boolean A11;
    public boolean A12;
    public boolean A13;
    public boolean A14;
    public boolean A15;
    public boolean A16;
    public boolean A17;
    public boolean A18;
    public boolean A19;
    public boolean A1A;
    public boolean A1B;
    public boolean A1C;
    public boolean A1D;
    public boolean A1E;
    public boolean A1F;
    public boolean A1G;
    public boolean A1H;
    public boolean A1I;
    public boolean A1J;
    public boolean A1K;
    public boolean A1L;
    public boolean A1M;
    public boolean A1N;
    public boolean A1O;
    public final List<C2278oA> A1P;
    public final List<C1952io> A1Q;

    public static String A0I(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A1S, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 56);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A0J() {
        A1S = new byte[]{79, 96, 109, 101, 97, 44, 117, 99, 121, 126, 44, 106, 126, 105, 105, 44, 126, 105, 123, 109, 126, 104, 45, 44, 70, 121, AbstractJsonLexerKt.TC_INVALID, 120, 44, 101, 98, AbstractJsonLexerKt.TC_INVALID, 120, 109, 96, 96, 44, 41, AbstractJsonLexerKt.TC_INVALID, 44, 120, 99, 44, AbstractJsonLexerKt.TC_INVALID, 103, 101, 124, 44, 120, 100, 105, 44, 109, 104, 14, 44, 61, 105, 48, 38, 60, 59, 105, 59, 44, 62, 40, 59, 45, 1, 38, 59, 60, 41, 36, 36, 104, 41, 56, 56, 104, 41, 38, 44, 104, 59, 35, 33, 56, 104, 60, 32, 45, 104, 41, 44, 102, 79, 104, 117, 114, 103, 106, 106, 38, 114, 110, 99, 38, 103, 118, 118, 47, 8, 21, 18, 7, 10, 10, 70, 18, 9, 70, 21, 13, 15, 22, 70, 18, 14, 3, 70, 7, 2, 124, 65, 19, 68, 82, 71, 80, 91, 19, 85, 70, 95, 95, 19, 22, 64, 30, 64, 86, 80, 92, 93, 87, 19, 82, 87, 90, 103, 53, 98, 116, 97, 118, 125, 53, 97, 125, 112, 53, 115, 96, 121, 121, 53, 116, 113, 96, 87, 69, 83, 64, 86, 18, 85, 64, 83, 92, 70, 87, 86, 19, 100, 92, 94, 71, 23, 67, 95, 82, 23, 86, 83, 23, 85, 78, 23, 83, 88, 64, 89, 91, 88, 86, 83, 94, 89, 80, 23, 67, 95, 82, 23, 86, 71, 71, 23, 86, 89, 83, 23, 94, 89, 68, 67, 86, 89, 67, 91, 78, 23, 80, 82, 67, 23, 78, 88, 66, 69, 23, 69, 82, 64, 86, 69, 83, 22, 53, 9, 0, 15, 10, 65, 24, 14, 20, 65, 7, 14, 19, 65, 8, 15, 18, 21, 0, 13, 13, 8, 15, 6, 65, 68, 18, 68, 114, 125, 103, 51, 103, 124, 51, 96, 120, 122, 99, 51, 103, 123, 118, 51, 114, 119, 51, 53, 51, 112, AbstractJsonLexerKt.TC_INVALID, 114, 122, 126, 51, 106, 124, 102, 97, 51, 117, 97, 118, 118, 51, 97, 118, 100, 114, 97, 119, 44, 51, 89, 102, 96, 103, 51, 122, 125, 96, 103, 114, AbstractJsonLexerKt.TC_INVALID, AbstractJsonLexerKt.TC_INVALID, 51, 54, 96, 51, 125, 124, 100, 27, 45, 55, 48, 98, 48, 39, 53, 35, 48, 38, 98, 43, 49, 98, 48, 39, 35, 38, 59, 98, 54, 45, 98, 32, 39, 98, 55, 49, 39, 38, 99, 70, 67, 73, 80, 120, 68, 70, 85, 72, 82, 84, 66, 75, 120, 66, 73, 67, 120, 68, 70, 85, 67, 120, 66, 73, 70, 69, 75, 66, 67, 55, 50, 56, 33, 9, 53, 55, 36, 57, 35, 37, 51, 58, 9, 63, 55, 52, 9, 37, 38, 58, 63, 34, 9, 32, 63, 51, 33, 9, 51, 56, 55, 52, 58, 51, 50, 2, 7, 13, 20, 60, 0, 2, 17, 12, 22, 16, 6, 15, 60, 23, 11, 22, 14, 1, 13, 2, 10, 15, 60, 10, 14, 19, 17, 6, 16, 16, 10, 12, 13, 60, 6, 13, 2, 1, 15, 6, 7, 18, 23, 29, 4, 44, 16, 18, 1, 28, 6, 0, 22, 31, 44, 5, 65, 44, 23, 22, 0, 26, 20, 29, 81, 84, 94, 71, 111, 83, 88, 81, 89, 94, 85, 84, 111, 81, 84, 67, 111, 70, 2, 111, 84, 85, 67, 89, 87, 94, 69, 64, 74, 83, 123, 84, 72, 69, 93, 69, 70, 72, 65, 123, 82, 22, 123, 86, 65, 64, 65, 87, 77, 67, 74, 123, 65, 74, 69, 70, 72, 65, 64, 49, 52, 62, 39, 15, 35, 36, 63, 34, 53, 15, 51, 49, 34, 63, 37, 35, 53, 60, 15, 50, 37, 62, 52, 60, 53, 15, 39, 57, 36, 56, 63, 37, 36, 15, 57, 62, 36, 53, 62, 36, 4, 1, 11, 18, 58, 22, 17, 10, 23, 0, 58, 6, 13, 4, 12, 11, 0, 1, 58, 7, 16, 11, 1, 9, 0, 58, 18, 12, 17, 13, 10, 16, 17, 58, 12, 11, 17, 0, 11, 17, 31, 26, 16, 9, 33, 11, 13, 27, 33, 23, 19, 31, 25, 27, 33, 8, 76, 33, 12, 27, 26, 27, 13, 23, 25, 16, 110, 107, 97, 120, 80, 122, 124, 106, 80, 121, 102, 107, 106, 96, 80, 121, 102, 106, 120, 80, 121, 61, 80, 125, 106, 107, 106, 124, 102, 104, 97, 30, 27, 17, 8, 32, 8, 30, 11, 28, 23, 32, 30, 17, 27, 32, 29, 13, 16, 8, 12, 26, 32, 9, 77, 32, 27, 26, 12, 22, 24, 17, 79, 94, 94, 113, 65, 94, 75, 64, 113, 79, 74, 113, 88, 79, 92, 71, 79, 64, 90, 56, 40, 53, 45, 41, 63, 40, 5, 42, 63, 63, 49, 5, 63, 52, 59, 56, 54, 63, 62, 51, 35, 62, 38, 34, 52, 35, 14, 33, 52, 52, 58, 14, 57, 52, 56, 54, 57, 37, 36, 52, 41, 49, 53, 35, 52, 25, 50, 63, 54, 35, 115, 113, 115, 79, 118, 121, 124, 100, 117, 98, 79, 115, 124, 121, 115, 123, 99, 79, AbstractJsonLexerKt.TC_INVALID, 126, 79, 115, 100, 113, 79, 117, 126, 113, 114, 124, 117, 116, 36, 38, 42, 55, 38, 46, 32, 41, 46, 35, 122, 48, 34, 37, 24, 38, 50, 51, 40, 24, 53, 34, 35, 46, 53, 34, 36, 51, 103, 38, 36, 51, 46, 40, 41, 122, 38, 41, 35, 53, 40, 46, 35, 105, 46, 41, 51, 34, 41, 51, 105, 38, 36, 51, 46, 40, 41, 105, 17, 14, 2, 16, 103, 55, 38, 36, 44, 38, 32, 34, 122, 36, 40, 42, 105, 38, 41, 35, 53, 40, 46, 35, 105, 49, 34, 41, 35, 46, 41, 32, 103, 46, 41, 51, 34, 41, 51, 125, 104, 104, 55, 43, 38, 62, 105, 32, 40, 40, 32, 43, 34, 105, 36, 40, 42, 104, 52, 51, 40, 53, 34, 101, 103, 116, 105, 115, 117, 99, 106, 94, 92, 79, 82, 72, 78, 88, 81, 98, 90, 79, 84, 89, 98, 78, 84, 71, 88, 82, 82, 69, 110, 69, 72, 65, 84, 
        92, 87, 94, 86, 81, 96, 79, 94, 77, 94, 82, 76, 89, 86, 83, 89, 81, 101, 94, 95, 86, 91, 67, 101, 86, 85, 93, 93, 83, 84, 93, 101, 87, 73, 90, 85, 80, 90, 82, 102, 80, 88, 91, 102, 95, 80, 85, 77, 92, 75, 80, 87, 94, 102, 92, 87, 88, 91, 85, 92, 93, 58, 54, 52, 119, 63, 56, 58, 60, 59, 54, 54, 50, 119, 56, 61, 42, 119, 48, 55, 45, 60, 43, 42, 45, 48, 45, 48, 56, 53, 119, 58, 53, 48, 58, 50, 60, 61, 75, 90, 77, 73, 92, 65, 94, 77, 119, 73, 91, 119, 75, 92, 73, 119, 77, 70, 73, 74, 68, 77, 76, 49, 32, 55, 51, 38, 59, 36, 55, 13, 51, 33, 13, 49, 38, 51, 13, 55, 60, 51, 48, 62, 55, 54, 13, 60, 51, 38, 59, 36, 55, 13, 48, 51, 60, 60, 55, 32, 23, 6, 17, 16, 29, 0, 43, 24, 29, 26, 17, 43, 29, 69, 76, 26, 43, 29, 25, 21, 19, 17, 6, 17, 4, 58, 6, 9, 12, 6, 14, 58, 1, 0, 9, 4, 28, 58, 9, 10, 2, 2, 12, 11, 2, 58, 8, 22, 79, 91, 74, 116, 78, 69, 79, 116, 72, 74, 89, 79, 116, 91, 89, 68, 79, 94, 72, 95, 88, 73, 94, 65, 114, 69, 68, 73, 72, 114, 67, 76, 91, 68, 74, 76, 89, 68, 66, 67, 114, 72, 67, 76, 79, 65, 72, 73, 15, 24, 7, 52, 3, 24, 52, 14, 5, 10, 9, 7, 14, 15, 88, 79, 80, 99, 84, 69, 94, 78, 85, 88, 99, 89, 82, 93, 94, 80, 89, 88, 87, 74, 93, 82, 94, 90, 80, 108, 64, 87, 88, 108, 95, 82, 74, 86, 65, 108, 91, 71, 94, 95, 108, 70, 65, 95, 48, 59, 54, 39, 44, 37, 33, 48, 49, 10, 54, 37, 56, 27, 16, 26, 33, 29, 31, 12, 26, 33, 10, 7, 14, 27, 95, 85, 86, 88, 77, 89, 80, 77, 92, 90, 96, 79, 80, 77, 75, 77, 94, 86, 75, 96, 82, 80, 91, 90, 96, 90, 81, 94, 93, 83, 90, 91, 121, 113, 113, 121, 114, 123, 65, 110, 114, AbstractJsonLexerKt.TC_INVALID, 103, 65, 118, 113, 109, 106, 65, 109, 106, 108, 119, 112, 121, 87, 86, 91, 90, 96, 94, 91, 96, 91, 90, 75, 94, 86, 83, 76, 96, 91, 90, 76, 92, 77, 86, 79, 75, 86, 80, 81, 96, 90, 81, 94, 93, 83, 90, 91, 9, 8, 5, 4, 62, 2, 14, 20, 15, 21, 5, 14, 22, 15, 62, 4, 15, 0, 3, 13, 4, 5, 21, 20, 25, 24, 34, 13, 15, 18, 26, 15, 24, 14, 14, 34, 31, 28, 15, 34, 24, 19, 28, 31, 17, 24, 25, 113, 118, 106, 109, 70, 120, 105, 105, 70, 112, 122, 118, 119, 70, 108, 107, 117, 41, 46, 50, 53, 30, 32, 49, 49, 30, 47, 32, 44, 36, AbstractJsonLexerKt.TC_INVALID, 123, 119, 113, 115, 45, 41, 37, 35, 33, 27, 49, 54, 40, 4, 3, 30, 25, 12, 1, 1, 50, 12, 3, 9, 50, 10, 8, 25, 50, 31, 8, 26, 12, 31, 9, 50, 9, 8, 30, 14, 31, 4, 29, 25, 4, 2, 3, 48, 55, 42, 45, 56, 53, 53, 6, 56, 55, 61, 6, 62, 60, 45, 6, 43, 60, 46, 56, 43, 61, 6, 60, 55, 56, 59, 53, 60, 61, 37, 34, 56, 41, 62, 45, 47, 56, 37, 58, 41, 19, 45, 57, 56, 35, 19, 63, 47, 62, 35, 32, 32, 19, 37, 34, 40, 37, 47, 45, 56, 35, 62, 19, 56, 37, 33, 41, 62, 19, 37, 34, 19, 33, 63, 84, 83, 73, 88, 79, 92, 94, 73, 84, 75, 88, 98, 91, 82, 79, 94, 88, 89, 98, 73, 84, 80, 88, 106, 109, 119, 102, 113, 98, 96, 119, 106, 117, 102, 92, 115, 113, 108, 103, 118, 96, 119, 112, 106, 109, 119, 102, 113, 98, 96, 119, 106, 117, 102, 92, 119, 122, 115, 102, 50, 53, 47, 62, 41, 56, 62, 43, 47, 4, 44, 62, 57, 4, 50, 53, 40, 47, 58, 55, 55, 4, 57, 46, 47, 47, 52, 53, 33, 38, 60, 45, 58, 59, 60, 33, 60, 33, 41, 36, 104, 114, 94, 96, 113, 113, 94, 110, 113, 100, 111, 94, 96, 101, 34, 56, 20, 61, 34, 47, 46, 36, 20, 56, 35, 36, 57, 63, 20, 45, 36, 57, 38, 81, 72, 100, 76, 94, 89, 100, 82, 85, 72, 79, 90, 87, 87, 100, 89, 78, 79, 79, 84, 85, 108, 111, 99, 107, 95, 119, 97, 116, 99, 104, 95, 97, 110, 100, 95, 98, 114, 111, 119, 115, 101, 95, 101, 110, 97, 98, 108, 101, 100, 1, 9, 8, 5, 13, 51, 13, 31, 28, 9, 15, 24, 51, 30, 13, 24, 5, 3, 57, 54, 35, 62, 33, 50, 96, 124, 113, 105, 62, 119, AbstractJsonLexerKt.TC_INVALID, AbstractJsonLexerKt.TC_INVALID, 119, 124, 117, 62, 115, AbstractJsonLexerKt.TC_INVALID, 125, 112, 114, 101, 95, 114, 101, 119, 97, 114, 100, 95, 99, 116, 97, 95, 98, 117, 116, 116, 111, 110, 95, 116, 101, 120, 116, 117, 119, 96, 90, 119, 96, 114, 100, 119, 97, 90, 97, 96, 118, 102, 119, 108, 117, 113, 108, 106, 107, 0, 2, 21, 47, 2, 21, 7, 17, 2, 20, 47, 21, 30, 17, 18, 28, 21, 20, 91, 89, 78, 116, 89, 78, 92, 74, 89, 79, 116, 95, 66, 95, 71, 78, 110, 108, 123, 65, 108, 123, 105, AbstractJsonLexerKt.TC_INVALID, 108, 122, 65, 105, AbstractJsonLexerKt.TC_INVALID, 106, 125, 118, 65, AbstractJsonLexerKt.TC_INVALID, 122, 65, 124, 107, 106, 106, 113, 112, 65, 106, 123, 102, 106, 88, 90, 77, 78, 77, 90, 119, 91, 77, 90, 94, 77, 90, 119, 64, 71, 91, 92, 119, 73, 88, 88, 119, 65, 75, 71, 70, 76, 78, 89, 90, 89, 78, 99, 79, 89, 78, 74, 
        89, 78, 99, 84, 83, 79, 72, 99, 93, 76, 76, 99, 82, 93, 81, 89, 39, 37, 56, 51, 34, 52, 35, 8, 34, 37, 59, 46, 44, 49, 51, 49, 1, 61, 49, 58, 59, 1, 42, 55, 42, 50, 59, 58, 43, 23, 62, 122, 23, 45, 48, 56, 45, 58, 33, 45, 38, 43, 45, 23, 41, 23, 45, 38, 41, 42, 36, 45, 44, 106, 123, 71, 110, 42, 71, 125, 96, 104, 125, 106, 113, 125, 118, 123, 125, 71, 122, 71, 125, 118, 121, 122, 116, 125, 124, 47, 62, 2, 43, 111, 2, 52, 51, 46, 41, 60, 49, 49, 2, 41, 50, 2, 46, 54, 52, 45, 125, 108, 80, 121, 61, 80, 125, 106, 120, 110, 125, 107, 80, 108, 99, 110, 102, 98, 80, 107, 106, 124, 108, 125, 102, AbstractJsonLexerKt.TC_INVALID, 123, 102, 96, 97, 84, 69, 121, 80, 20, 121, 81, 71, 82, 69, 78, 121, 64, 83, 74, 74, 121, 71, 66, 102, 113, 100, 120, 117, 109, 75, 99, 124, 113, 122, 75, 103, AbstractJsonLexerKt.TC_INVALID, 125, 100, 75, 96, 125, 121, 113, 75, 113, 108, 119, 113, 113, 112, 103, 75, 98, 125, 112, 113, 123, 75, 112, 97, 102, 117, 96, 125, 123, 122, 75, 113, 122, 117, 118, 120, 113, 112, 90, 77, 89, 93, 77, 91, 92, 119, 65, 76, 43, 60, 46, 56, 43, 61, 6, 62, 43, 56, 55, 45, 60, 61, 6, 45, 60, 33, 45, 57, 46, 60, 42, 57, 47, 20, 44, 57, 42, 37, 63, 46, 47, 20, 61, 121, 20, 63, 46, 51, 63, 63, 40, 58, 44, 63, 41, 18, 36, 35, 43, 34, 18, 57, 40, 53, 57, 78, 89, 75, 93, 78, 88, 89, 88, 99, 74, 85, 88, 89, 83, 47, 52, 51, 41, 48, 56, 3, 47, 52, 51, 43, 3, 46, 57, 58, 53, 50, 57, 56, 3, 58, 53, 46, 47, 40, 3, 63, 61, 46, 56, 25, 2, 5, 29, 53, 14, 5, 30, 53, 3, 4, 14, 3, 9, 11, 30, 5, 24, 30, 5, 2, 26, 50, 0, 24, 1, 25, 4, 50, 29, 31, 2, 10, 31, 8, 30, 30, 50, 15, 12, 31, 85, 77, 79, 86, 121, 80, 79, 66, 67, 73, 121, 64, 73, 84, 121, 86, 74, 71, 95, 71, 68, 74, 67, 84, 83, 85, 78, 73, 64, 120, 83, 72, 120, 68, 79, 66, 68, 76, 120, 64, 72, 72, 64, 75, 66, 120, 87, 75, 70, 94, 120, 70, 82, 83, 72, 120, 85, 66, 67, 78, 85, 66, 68, 83, 123, 102, 123, 99, 106, 84, 79, 79, 76, 84, 73, 80, AbstractJsonLexerKt.TC_INVALID, 84, 73, 77, 69, 82, AbstractJsonLexerKt.TC_INVALID, 77, 83, 103, 124, 124, AbstractJsonLexerKt.TC_INVALID, 103, 122, 99, 76, 103, 122, 103, AbstractJsonLexerKt.TC_INVALID, 118, 45, 42, 52, 114, 109, 96, 97, 107, 91, 103, 104, 109, 103, 111, 101, 102, 104, 97, 38, 57, 52, 53, 63, 15, 52, 37, 34, 49, 36, 57, 63, 62, 15, 35, 53, 51, 38, 57, 53, 39, 49, 50, 57, 60, 57, 36, 41, 15, 51, 56, 53, 51, 59, 15, 57, 62, 57, 36, 57, 49, 60, 15, 52, 53, 60, 49, 41, 116, 107, 103, 117, 99, 96, 107, 110, 107, 118, 123, 93, 97, 106, 103, 97, 105, 93, 107, 108, 118, 103, 112, 116, 99, 110, 51, 37, 48, 39, 44, 27, 37, 42, 32, 27, 38, 54, 43, 51, 55, 33, 27, 37, 42, 32, 54, 43, 45, 32, 27, 50, 118, 27, 49, 45, 74, 92, 73, 94, 85, 98, 92, 83, 89, 98, 95, 79, 82, 74, 78, 88, 98, 94, 82, 72, 83, 73, 89, 82, 74, 83, 98, 74, 85, 88, 83, 98, 84, 92, 95, 98, 82, 77, 88, 83};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 14 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private void A0k(JSONObject jSONObject) {
        AbstractC1734fD abstractC1734fD = this;
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(A0I(966, 8, 62));
        if (jSONArrayOptJSONArray != null) {
            int length = jSONArrayOptJSONArray.length();
            if (A1T[1].length() != 4) {
                throw new RuntimeException();
            }
            A1T[5] = "dIGwuZF3s91XUSQaAcjkEOVUFAXBJ6k4";
            if (length > 0) {
                abstractC1734fD.A0i(jSONArrayOptJSONArray);
                return;
            }
        }
        JSONArray jSONArrayOptJSONArray2 = jSONObject.optJSONArray(A0I(1651, 20, 59));
        if (jSONArrayOptJSONArray2 != null) {
            int i5 = 0;
            while (i5 < jSONArrayOptJSONArray2.length()) {
                JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray2.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    String strOptString = jSONObjectOptJSONObject.optString(A0I(1510, 9, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
                    String strOptString2 = jSONObjectOptJSONObject.optString(A0I(2454, 13, 43));
                    long jOptLong = jSONObjectOptJSONObject.optLong(A0I(2438, 16, 24), 0L);
                    String strOptString3 = jSONObjectOptJSONObject.optString(A0I(2016, 11, 111));
                    if (!TextUtils.isEmpty(strOptString)) {
                        List<C1952io> list = abstractC1734fD.A1Q;
                        if (TextUtils.isEmpty(strOptString3)) {
                            strOptString3 = null;
                        }
                        list.add(new C1952io(strOptString, strOptString2, jOptLong, strOptString3));
                    }
                }
                i5++;
                if (A1T[5].charAt(23) != 'Y') {
                    String[] strArr = A1T;
                    strArr[4] = "vEPwHkz7uGhFiAfw384KlPKKyobSGtHJ";
                    strArr[7] = "NeHwdh6gLaaYPW2Lit4NcoYDsUb0llU9";
                    abstractC1734fD = this;
                } else {
                    A1T[5] = "ZcIaUtCba1r81x3XUEvvLhDkdGQZjCqK";
                    abstractC1734fD = this;
                }
            }
        }
    }

    public abstract int A1L();

    public abstract int A1M();

    static {
        A0J();
    }

    public AbstractC1734fD() {
        String strA0I = A0I(0, 0, 100);
        this.A0R = strA0I;
        this.A04 = 200;
        this.A0O = strA0I;
        this.A0Z = strA0I;
        this.A0Y = strA0I;
        this.A0a = strA0I;
        this.A0I = null;
        this.A0V = strA0I;
        this.A0U = strA0I;
        this.A0T = strA0I;
        this.A0W = strA0I;
        this.A0S = strA0I;
        this.A0c = strA0I;
        this.A0d = strA0I;
        this.A16 = false;
        this.A0g = false;
        this.A1C = false;
        this.A11 = false;
        this.A1E = false;
        this.A0w = false;
        this.A15 = false;
        this.A1O = false;
        this.A0u = false;
        this.A0i = false;
        this.A0j = true;
        this.A10 = false;
        this.A18 = false;
        this.A19 = false;
        this.A0t = false;
        this.A1B = false;
        this.A02 = 4;
        this.A08 = 2000L;
        this.A0P = null;
        this.A1Q = new ArrayList();
        this.A1P = new ArrayList();
        this.A09 = 2000L;
        this.A0Q = strA0I;
        this.A0L = A0I(1834, 15, 40);
        this.A0q = false;
        this.A0M = strA0I;
        this.A1H = false;
        this.A0N = strA0I;
        this.A1I = false;
        this.A0D = A0I(1338, 5, 1);
        this.A0f = strA0I;
    }

    public static AbstractC1734fD A0H(JSONObject jSONObject, C0958Hi c0958Hi) {
        boolean zHas = jSONObject.has(A0I(1000, 12, 7));
        boolean z11 = false;
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(A0I(966, 8, 62));
        if (jSONArrayOptJSONArray != null && jSONArrayOptJSONArray.length() > 0) {
            z11 = true;
        }
        AbstractC1734fD abstractC1734fDA00 = null;
        if (zHas) {
            try {
                abstractC1734fDA00 = C1048Kz.A00(jSONObject, c0958Hi);
            } catch (JSONException e3) {
                e3.printStackTrace();
            }
        }
        if (abstractC1734fDA00 == null) {
            zHas = false;
            abstractC1734fDA00 = C07147g.A00(jSONObject, c0958Hi);
        }
        abstractC1734fDA00.A27(zHas);
        abstractC1734fDA00.A0z(z11);
        return abstractC1734fDA00;
    }

    private void A0K(double d5) {
        this.A00 = d5;
    }

    private void A0L(int i5) {
        this.A05 = i5;
    }

    private final void A0M(int i5) {
        this.A02 = i5;
    }

    private final void A0N(int i5) {
        this.A03 = i5;
    }

    private final void A0O(long j11) {
        this.A06 = j11;
    }

    private final void A0P(long j11) {
        this.A07 = j11;
    }

    private final void A0Q(long j11) {
        this.A08 = j11;
    }

    private final void A0R(long j11) {
        this.A09 = j11;
    }

    private void A0S(String str) {
        this.A0G = str;
    }

    private void A0T(String str) {
        this.A0H = str;
    }

    private void A0U(String str) {
        if (!str.isEmpty()) {
            this.A0X = str;
        }
    }

    private void A0V(String str) {
        this.A0b = str;
    }

    private final void A0W(String str) {
        this.A0I = str;
    }

    private final void A0X(String str) {
        this.A0O = str;
    }

    private final void A0Y(String str) {
        this.A0S = str;
    }

    private final void A0Z(String str) {
        this.A0T = str;
    }

    private final void A0a(String str) {
        this.A0U = str;
    }

    private final void A0b(String str) {
        this.A0V = str;
    }

    private final void A0c(String str) {
        this.A0W = str;
    }

    private final void A0d(String str) {
        this.A0Y = str;
    }

    private final void A0e(String str) {
        this.A0Z = str;
    }

    private final void A0f(String str) {
        this.A0a = str;
    }

    private final void A0g(String str) {
        this.A0c = str;
    }

    private final void A0h(String str) {
        this.A0d = str;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0005 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    private void A0i(JSONArray jSONArray) {
        JSONObject jSONObjectOptJSONObject;
        for (int i5 = 0; i5 < i; i5++) {
            JSONObject jSONObjectOptJSONObject2 = jSONArray.optJSONObject(i5);
            if (jSONObjectOptJSONObject2 != null && (jSONObjectOptJSONObject = jSONObjectOptJSONObject2.optJSONObject(A0I(1505, 5, 46))) != null) {
                String strOptString = jSONObjectOptJSONObject.optString(A0I(2467, 3, 96));
                if (!TextUtils.isEmpty(strOptString)) {
                    List<C1952io> list = this.A1Q;
                    String imageUrl = A0I(0, 0, 100);
                    list.add(new C1952io(strOptString, imageUrl, 0L));
                }
            }
        }
    }

    private void A0j(JSONObject jSONObject) {
        JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray(A0I(1206, 21, 19));
        if (jSONArrayOptJSONArray != null) {
            int i5 = 0;
            while (true) {
                int length = jSONArrayOptJSONArray.length();
                String[] strArr = A1T;
                String str = strArr[3];
                String str2 = strArr[6];
                int i11 = str.length();
                if (i11 == str2.length()) {
                    throw new RuntimeException();
                }
                String[] strArr2 = A1T;
                strArr2[2] = "S5z88lf4WKwNg5JoFc3hrl08ycGNwaN";
                strArr2[0] = "lAHDRnSw";
                if (i5 < length) {
                    JSONObject jSONObjectOptJSONObject = jSONArrayOptJSONArray.optJSONObject(i5);
                    if (jSONObjectOptJSONObject != null) {
                        String strOptString = jSONObjectOptJSONObject.optString(A0I(1510, 9, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE));
                        String productUrl = jSONObjectOptJSONObject.optString(A0I(2433, 5, 55));
                        String strOptString2 = jSONObjectOptJSONObject.optString(A0I(2016, 11, 111));
                        if (!TextUtils.isEmpty(strOptString)) {
                            List<C2278oA> list = this.A1P;
                            if (TextUtils.isEmpty(strOptString2)) {
                                strOptString2 = null;
                            }
                            list.add(new C2278oA(strOptString, productUrl, strOptString2));
                        }
                    }
                    i5++;
                } else {
                    return;
                }
            }
        }
    }

    private void A0l(JSONObject jSONObject) {
        this.A0R = jSONObject.toString();
    }

    private void A0m(JSONObject jSONObject) {
        if (!A2d()) {
            return;
        }
        boolean zA2b = A2b();
        String strA0I = A0I(2116, 30, 55);
        if (zA2b) {
            A0e(jSONObject.optString(strA0I, A0I(287, 65, 43)));
        } else {
            A0e(jSONObject.optString(strA0I, A0I(0, 54, 52)));
        }
        String[] strArr = A1T;
        if (strArr[4].charAt(18) != strArr[7].charAt(18)) {
            throw new RuntimeException();
        }
        A1T[1] = "qSPE";
        A0d(jSONObject.optString(A0I(2095, 21, 101), A0I(112, 22, 94)));
        A0f(jSONObject.optString(A0I(2146, 19, 30), A0I(Sdk.SDKError.Reason.STORE_REGION_CODE_ERROR_VALUE, 26, 11)));
    }

    private final void A0n(boolean z11) {
        this.A0r = z11;
    }

    private final void A0o(boolean z11) {
        this.A0t = z11;
    }

    private final void A0p(boolean z11) {
        this.A0u = z11;
    }

    private final void A0q(boolean z11) {
        this.A0w = z11;
    }

    private final void A0r(boolean z11) {
        this.A0x = z11;
    }

    private final void A0s(boolean z11) {
        this.A0y = z11;
    }

    private final void A0t(boolean z11) {
        this.A0z = z11;
    }

    private final void A0u(boolean z11) {
        this.A10 = z11;
    }

    private final void A0v(boolean z11) {
        this.A0n = z11;
    }

    private final void A0w(boolean z11) {
        this.A0o = z11;
    }

    private final void A0x(boolean z11) {
        this.A0p = z11;
    }

    private final void A0y(boolean z11) {
        this.A12 = z11;
    }

    private final void A0z(boolean z11) {
        this.A0s = z11;
    }

    private final void A10(boolean z11) {
        this.A15 = z11;
    }

    private final void A11(boolean z11) {
        this.A1G = z11;
    }

    private final void A12(boolean z11) {
        this.A1J = z11;
    }

    private final void A13(boolean z11) {
        this.A1K = z11;
    }

    private final void A14(boolean z11) {
        this.A17 = z11;
    }

    private final void A15(boolean z11) {
        this.A1L = z11;
    }

    private final void A16(boolean z11) {
        this.A1M = z11;
    }

    private final void A17(boolean z11) {
        this.A1N = z11;
    }

    private final void A18(boolean z11) {
        this.A1O = z11;
    }

    private final void A19(boolean z11) {
        this.A18 = z11;
    }

    private final void A1A(boolean z11) {
        this.A19 = z11;
    }

    private final void A1B(boolean z11) {
        this.A1A = z11;
    }

    private final void A1C(boolean z11) {
        this.A1B = z11;
    }

    private final void A1D(boolean z11) {
        this.A1C = z11;
    }

    private final void A1E(boolean z11) {
        this.A1E = z11;
    }

    public final double A1F() {
        return this.A00;
    }

    public final int A1G() {
        return this.A01;
    }

    public final int A1H() {
        return this.A02;
    }

    public final int A1I() {
        return this.A03;
    }

    public final int A1J() {
        return this.A05;
    }

    public final int A1K() {
        return 0;
    }

    public final long A1N() {
        return this.A07;
    }

    public final long A1O() {
        return this.A08;
    }

    public final long A1P() {
        return this.A09;
    }

    public final long A1Q() {
        return this.A0A;
    }

    public final RewardData A1R() {
        return this.A0B;
    }

    public final C1745fO A1S() {
        return this.A0C;
    }

    public final String A1T() {
        return A1R;
    }

    public final String A1U() {
        return this.A0D;
    }

    public final String A1V() {
        return this.A0E;
    }

    public final String A1W() {
        return this.A0F;
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Removed duplicated region for block: B:17:0x0066  */
    /* JADX WARN: Removed duplicated region for block: B:4:0x0009  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String A1X() {
        char c11;
        String str = this.A0K;
        switch (str.hashCode()) {
            case -1364000502:
                if (!str.equals(A0I(2284, 14, 4))) {
                    c11 = 65535;
                    break;
                } else {
                    c11 = 1;
                    break;
                }
            case -1052618729:
                String[] strArr = A1T;
                if (strArr[2].length() != strArr[0].length()) {
                    String[] strArr2 = A1T;
                    strArr2[4] = "HVd6lECbTZwpNvPLKB49AFB2LODoRB5A";
                    strArr2[7] = "XOoEMM0Y31wmGZ0mC74NUBXm297DQIjG";
                    if (str.equals(A0I(1828, 6, 111))) {
                        c11 = 2;
                        break;
                    }
                } else if (str.equals(A0I(1828, 6, 111))) {
                }
                break;
            case 604727084:
                if (str.equals(A0I(1715, 12, 112))) {
                    c11 = 0;
                    break;
                }
                break;
        }
        switch (c11) {
            case 0:
                return A0I(1061, 37, 97);
            case 1:
                return EnumC1658dy.A04.A03();
            case 2:
                return EnumC1659dz.A03.A03();
            default:
                String strA0I = A0I(0, 0, 100);
                if (A1T[1].length() != 4) {
                    throw new RuntimeException();
                }
                String[] strArr3 = A1T;
                strArr3[4] = "JJjM6PLcBsngjIhBbE4reT0wE3or2kJL";
                strArr3[7] = "FVmcFNC2hDJvIDmuBd4oyOix3HqDBQPX";
                return strA0I;
        }
    }

    public final String A1Y() {
        return this.A0G;
    }

    public final String A1Z() {
        return this.A0H;
    }

    public final String A1a() {
        return this.A0I != null ? this.A0I : A0I(0, 0, 100);
    }

    public final String A1b() {
        return this.A0J;
    }

    public final String A1c() {
        return this.A0K;
    }

    public final String A1d() {
        return this.A0M;
    }

    public final String A1e() {
        return this.A0N;
    }

    public final String A1f() {
        return this.A0O;
    }

    public final String A1g() {
        if (this.A0P != null) {
            return this.A0P;
        }
        String[] strArr = A1T;
        if (strArr[2].length() == strArr[0].length()) {
            throw new RuntimeException();
        }
        String[] strArr2 = A1T;
        strArr2[4] = "cIBnAgVKHsUPHoY80u4pRoNMJx6b2FxB";
        strArr2[7] = "bebLkJEPfEiyVB3EC44cZqT0ST6D66oj";
        return A0I(0, 0, 100);
    }

    public final String A1h() {
        return this.A0Q;
    }

    public final String A1i() {
        return this.A0S;
    }

    public final String A1j() {
        return this.A0T;
    }

    public final String A1k() {
        return this.A0U;
    }

    public final String A1l() {
        return this.A0V;
    }

    public final String A1m() {
        return this.A0W;
    }

    public final String A1n() {
        return this.A0X;
    }

    public final String A1o() {
        return this.A0Y;
    }

    public final String A1p() {
        return this.A0Z;
    }

    public final String A1q() {
        return this.A0a;
    }

    public final String A1r() {
        return this.A0b;
    }

    public final String A1s() {
        return this.A0c;
    }

    public final String A1t() {
        return this.A0d;
    }

    public final String A1u() {
        return this.A0e;
    }

    public final List<C2278oA> A1v() {
        return this.A1P;
    }

    public final List<C1952io> A1w() {
        return this.A1Q;
    }

    public final JSONObject A1x() {
        try {
            return new JSONObject(this.A0R);
        } catch (JSONException unused) {
            return new JSONObject();
        }
    }

    public final void A1y(int i5) {
        this.A04 = i5;
    }

    public final void A1z(long j11) {
        this.A0A = j11;
    }

    public final void A20(RewardData rewardData) {
        this.A0B = rewardData;
    }

    public final void A21(String str) {
        A1R = str;
    }

    public final void A22(String str) {
        this.A0J = str;
    }

    public final void A23(String str) {
        this.A0K = str;
    }

    public final void A24(String str) {
        this.A0e = str;
    }

    public final void A25(JSONObject jSONObject) {
        String strA0I = A0I(2217, 10, 16);
        String strA0I2 = A0I(0, 0, 100);
        A0V(jSONObject.optString(strA0I, strA0I2));
        A0T(jSONObject.optString(A0I(1312, 13, 109)));
        A0l(jSONObject);
        A0L(jSONObject.optInt(A0I(2503, 31, 104), 0));
        A1y(jSONObject.optInt(A0I(2534, 26, 58), 1000));
        A0S(jSONObject.optString(A0I(1286, 26, 11), strA0I2));
        A0s(jSONObject.optBoolean(A0I(1098, 23, 16), false));
        A0t(jSONObject.optBoolean(A0I(1121, 37, 106), false));
        A0n(jSONObject.optBoolean(A0I(813, 32, 40), false));
        A0r(jSONObject.optBoolean(A0I(1034, 27, 1), false));
        A15(jSONObject.optBoolean(A0I(2165, 52, 44), false));
        A0y(jSONObject.optBoolean(A0I(1553, 30, 97), false));
        A0X(jSONObject.optString(A0I(1519, 34, 85), A0I(195, 65, 15)));
        A11(jSONObject.optBoolean(A0I(1897, 18, 72), false));
        A12(jSONObject.optBoolean(A0I(2043, 26, 112), false));
        A13(jSONObject.optBoolean(A0I(2069, 26, 32), false));
        A0m(jSONObject);
        A0x(jSONObject.optBoolean(A0I(1450, 25, 69), false));
        A17(jSONObject.optBoolean(A0I(2346, 23, 85), false));
        A16(jSONObject.optBoolean(A0I(2328, 18, 82), false));
        A14(jSONObject.optBoolean(A0I(2298, 30, 100), false));
        A0v(jSONObject.optBoolean(A0I(1393, 35, 7), false));
        A0W(jSONObject.optString(A0I(1325, 13, 70)));
        A0w(jSONObject.optBoolean(A0I(1428, 22, 89), false));
        A0b(jSONObject.optString(A0I(1915, 16, 19), A0I(54, 15, 113)));
        A1D(jSONObject.optBoolean(A0I(681, 31, 55), false));
        A26(jSONObject.optBoolean(A0I(655, 26, 70), false));
        A1E(jSONObject.optBoolean(A0I(712, 31, 71), false));
        A0q(jSONObject.optBoolean(A0I(515, 26, 8), false));
        A10(jSONObject.optBoolean(A0I(541, 33, 28), false));
        A18(jSONObject.optBoolean(A0I(2369, 23, 30), false));
        A0p(jSONObject.optBoolean(A0I(492, 23, 75), false));
        this.A0i = jSONObject.optBoolean(A0I(TTAdConstant.VIDEO_URL_CODE, 36, 110), false);
        this.A0j = jSONObject.optBoolean(A0I(450, 42, 91), true);
        A0u(jSONObject.optBoolean(A0I(1343, 27, 7), false));
        A19(jSONObject.optBoolean(A0I(574, 41, 104), false));
        A1A(jSONObject.optBoolean(A0I(615, 40, 93), false));
        A0o(jSONObject.optBoolean(A0I(384, 30, 31), false));
        A0M(jSONObject.optInt(A0I(974, 18, 5), 4));
        A0R(jSONObject.optLong(A0I(1628, 23, 5), 2000L));
        this.A0P = jSONObject.optString(A0I(1671, 16, 59));
        A0k(jSONObject);
        A0U(jSONObject.optString(A0I(2027, 16, 102)));
        A0j(jSONObject);
        A0Q(jSONObject.optLong(A0I(1583, 45, Sdk.SDKError.Reason.GZIP_ENCODE_ERROR_VALUE), 2000L));
        A1C(jSONObject.optBoolean(A0I(1741, 19, 115), false));
        A1B(jSONObject.optBoolean(A0I(2470, 15, 60), false));
        A0Z(jSONObject.optString(A0I(1849, 26, 56), A0I(97, 15, 62)));
        A0c(jSONObject.optString(A0I(1931, 31, 38), A0I(160, 20, 45)));
        A0a(jSONObject.optString(A0I(1875, 22, 61), A0I(69, 28, 112)));
        A0Y(jSONObject.optString(A0I(2227, 19, 97), A0I(352, 32, Sdk.SDKError.Reason.INVALID_ADS_ENDPOINT_VALUE)));
        A0g(jSONObject.optString(A0I(2246, 22, 115), A0I(180, 15, 10)));
        A0h(jSONObject.optString(A0I(2268, 16, Sdk.SDKError.Reason.ASSET_FAILED_STATUS_CODE_VALUE), A0I(260, 27, 89)));
        this.A0l = jSONObject.optBoolean(A0I(1254, 14, 83));
        this.A0m = jSONObject.optBoolean(A0I(1268, 18, 4));
        this.A0k = jSONObject.optBoolean(A0I(1227, 27, 21), true);
        this.A13 = jSONObject.optBoolean(A0I(1687, 28, 99), false);
        this.A0Q = jSONObject.optString(A0I(1760, 21, 3), strA0I2);
        A0P(jSONObject.optLong(A0I(TTAdConstant.IMAGE_MODE_1012, 22, 2), -1L));
        A0O(jSONObject.optLong(A0I(1180, 26, 93), -1L));
        A0K(jSONObject.optDouble(A0I(1810, 18, 84), 1.0d));
        this.A0f = jSONObject.optString(A0I(2392, 41, 31), A0I(845, Sdk.SDKError.Reason.TPAT_ERROR_VALUE, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE));
        this.A0L = jSONObject.optString(A0I(1370, 23, 38), A0I(1834, 15, 40));
        this.A14 = jSONObject.optBoolean(A0I(1781, 29, 56), false);
        this.A1F = jSONObject.optBoolean(A0I(2560, 30, Sdk.SDKError.Reason.INVALID_LOG_ERROR_ENDPOINT_VALUE), false);
        this.A1D = jSONObject.optBoolean(A0I(2590, 40, 5), false);
        this.A0q = jSONObject.optBoolean(A0I(1727, 14, 57), false);
        this.A0D = jSONObject.optString(A0I(743, 19, 22), A0I(1338, 5, 1));
        this.A0M = jSONObject.optString(A0I(1475, 17, 33), strA0I2);
        this.A1H = jSONObject.optBoolean(A0I(1962, 27, 16), false);
        this.A0N = jSONObject.optString(A0I(1492, 13, Sdk.SDKError.Reason.TPAT_ERROR_VALUE), strA0I2);
        this.A1I = jSONObject.optBoolean(A0I(1989, 27, 4), false);
        this.A0E = jSONObject.optString(A0I(801, 12, Sdk.SDKError.Reason.ASSET_FAILED_INSUFFICIENT_SPACE_VALUE), null);
        this.A0F = jSONObject.optString(A0I(992, 8, 9), null);
        this.A0h = jSONObject.optBoolean(A0I(762, 20, 98), false);
        this.A01 = jSONObject.optInt(A0I(782, 19, 105), 100);
        JSONObject creditLineImageI18NJson = jSONObject.optJSONObject(A0I(1158, 22, 76));
        if (creditLineImageI18NJson != null) {
            C1745fO c1745fOA00 = C1745fO.A00(creditLineImageI18NJson);
            String[] strArr = A1T;
            if (strArr[3].length() == strArr[6].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A1T;
            strArr2[3] = "hnEXWAdLhVWcnFIzj2c95pGY";
            strArr2[6] = "Kkp";
            this.A0C = c1745fOA00;
        }
        if (A1T[1].length() != 4) {
            String[] strArr3 = A1T;
            strArr3[2] = "60gjaPXaU6hHXQfaQDz3kzbxck6kRJ4";
            strArr3[0] = "tk6bqnoD";
            A0N(jSONObject.optInt(A0I(2485, 18, 104), 0));
            return;
        }
        String[] strArr4 = A1T;
        strArr4[4] = "nwfDmWC8MEdHxcpnYO4nUyVXAsRASaX6";
        strArr4[7] = "441HEAwkQQbt5Aswfq41CTkubeNJwGY3";
        A0N(jSONObject.optInt(A0I(2485, 18, 104), 0));
    }

    public final void A26(boolean z11) {
        this.A11 = z11;
    }

    public final void A27(boolean z11) {
        this.A0v = z11;
    }

    public final void A28(boolean z11) {
        this.A16 = z11;
    }

    public final void A29(boolean z11) {
        this.A0g = z11;
    }

    public final boolean A2A() {
        return this.A0l;
    }

    public final boolean A2B() {
        return this.A0m;
    }

    public final boolean A2C() {
        return this.A0k;
    }

    public final boolean A2D() {
        return this.A0q;
    }

    public final boolean A2E() {
        return this.A0h;
    }

    public final boolean A2F() {
        return this.A0r;
    }

    public final boolean A2G() {
        return this.A0s;
    }

    public final boolean A2H() {
        return this.A0t;
    }

    public final boolean A2I() {
        return this.A0i;
    }

    public final boolean A2J() {
        return this.A0j;
    }

    public final boolean A2K() {
        return this.A0u;
    }

    public final boolean A2L() {
        return this.A0v;
    }

    public final boolean A2M() {
        return this.A0w;
    }

    public final boolean A2N() {
        return this.A0x;
    }

    public final boolean A2O() {
        return this.A0y;
    }

    public final boolean A2P() {
        return this.A0z;
    }

    public final boolean A2Q() {
        return !TextUtils.isEmpty(A1Y());
    }

    public final boolean A2R() {
        return this.A10;
    }

    public final boolean A2S() {
        return this.A0n;
    }

    public final boolean A2T() {
        return this.A0o;
    }

    public final boolean A2U() {
        return this.A0p;
    }

    public final boolean A2V() {
        return this.A11;
    }

    public final boolean A2W() {
        return this.A12;
    }

    public final boolean A2X() {
        return this.A13;
    }

    public final boolean A2Y() {
        return this.A14;
    }

    public final boolean A2Z() {
        return this.A15;
    }

    public final boolean A2a() {
        return this.A1G;
    }

    public final boolean A2b() {
        return this.A1J;
    }

    public final boolean A2c() {
        return this.A1K;
    }

    public final boolean A2d() {
        return A2a() && (A2b() || A2c());
    }

    public final boolean A2e() {
        return this.A16;
    }

    public final boolean A2f() {
        return this.A17;
    }

    public final boolean A2g() {
        return this.A1L;
    }

    public final boolean A2h() {
        return this.A1M;
    }

    public final boolean A2i() {
        return this.A1N;
    }

    public final boolean A2j() {
        return this.A1O;
    }

    public final boolean A2k() {
        return this.A18;
    }

    public final boolean A2l() {
        return this.A19;
    }

    public final boolean A2m() {
        return this.A0g;
    }

    public final boolean A2n() {
        return this.A1B;
    }

    public final boolean A2o() {
        return this.A1C;
    }

    public final boolean A2p() {
        return this.A1D;
    }

    public final boolean A2q() {
        return this.A1E;
    }

    public final boolean A2r() {
        return this.A1F;
    }

    public final boolean A2s() {
        return this.A1H;
    }

    public final boolean A2t() {
        return this.A1I;
    }
}
