package com.facebook.ads.redexgen.X;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.vungle.ads.internal.protos.Sdk;
import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.Arrays;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;

/* renamed from: com.facebook.ads.redexgen.X.Sp, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1233Sp implements InterfaceC1155Pi {
    public static byte[] A05;
    public static String[] A06 = {"w7FmdcKa8pngMAI1ofM9tGcPgubEwS6I", "G4XM5A1ldBG3E5yA3epg3o5qg0QLp1T2", "glDZUWNu5T0zJFmfXUIs5xtG", "o9sC3VMeizDjQUTAC5wAvBEfTWobkrYh", "qsnEDthQ3OJnai8XV", "VFXKzS", "a5IEfHye95zKOrvSHpcHTRp6SfP6mQmG", "5rWd8cfd9Po2GSZijgcRQcfntIzg1gOO"};
    public WB A00;
    public final int A01;
    public final long A02;
    public final Context A03;
    public final InterfaceC1212Ru A04;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A05, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] ^ i12) ^ 46);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A05 = new byte[]{73, 104, 107, 108, 120, 97, 121, 95, 104, 99, 105, 104, AbstractJsonLexerKt.TC_INVALID, 104, AbstractJsonLexerKt.TC_INVALID, 126, 75, 108, 110, 121, 98, AbstractJsonLexerKt.TC_INVALID, 116, 82, 101, 101, 120, 101, 55, 126, 121, 100, 99, 118, 121, 99, 126, 118, 99, 126, 121, 112, 55, 81, 81, 122, 103, 114, 112, 55, 114, 111, 99, 114, 121, 100, 126, 120, 121, 76, 123, 123, 102, 123, 41, 96, 103, 122, 125, 104, 103, 125, 96, 104, 125, 96, 103, 110, 41, 79, 69, 72, 74, 41, 108, 113, 125, 108, 103, 122, 96, 102, 103, 12, 59, 59, 38, 59, 105, 32, 39, 58, 61, 40, 39, 61, 32, 40, 61, 32, 39, 46, 105, 6, 57, 60, 58, 105, 44, 49, 61, 44, 39, 58, 32, 38, 39, 95, 104, 104, 117, 104, 58, 115, 116, 105, 110, 123, 116, 110, 115, 123, 110, 115, 116, 125, 58, 76, 74, 35, 58, AbstractJsonLexerKt.TC_INVALID, 98, 110, AbstractJsonLexerKt.TC_INVALID, 116, 105, 115, 117, 116, 122, 89, 87, 82, 83, 82, 22, 112, 80, 91, 70, 83, 81, 119, 67, 82, 95, 89, 100, 83, 88, 82, 83, 68, 83, 68, 24, 39, 4, 10, 15, 14, 15, 75, 39, 2, 9, 13, 7, 10, 8, 42, 30, 15, 2, 4, 57, 14, 5, 15, 14, 25, 14, 25, 69, 13, 46, 32, 37, 36, 37, 97, 13, 40, 35, 46, 49, 52, 50, 0, 52, 37, 40, 46, 19, 36, 47, 37, 36, 51, 36, 51, 111, 17, 50, 60, 57, 56, 57, 125, 17, 52, 63, 43, 45, 37, 11, 52, 57, 56, 50, 15, 56, 51, 57, 56, 47, 56, 47, 115, 14, 2, 0, 67, 11, 12, 14, 8, 15, 2, 2, 6, 67, 12, 9, 30, 67, 12, 3, 9, 31, 2, 4, 9, 21, 67, 0, 8, 9, 4, 12, 94, 67, 8, 21, 2, 29, 1, 12, 20, 8, 31, 67, 8, 21, 25, 67, 11, 11, 0, 29, 8, 10, 67, 43, 11, 0, 29, 8, 10, 44, 24, 9, 4, 2, 63, 8, 3, 9, 8, 31, 8, 31, 119, 123, 121, 58, 114, 117, 119, 113, 118, 123, 123, AbstractJsonLexerKt.TC_INVALID, 58, 117, 112, 103, 58, 117, 122, 112, 102, 123, 125, 112, 108, 58, 121, 113, 112, 125, 117, 39, 58, 113, 108, 123, 100, 120, 117, 109, 113, 102, 58, 113, 108, 96, 58, 114, 120, 117, 119, 58, 88, 125, 118, 114, 120, 117, 119, 85, 97, 112, 125, 123, 70, 113, 122, 112, 113, 102, 113, 102, 19, 31, 29, 94, 22, 17, 19, 21, 18, 31, 31, 27, 94, 17, 20, 3, 94, 17, 30, 20, 2, 31, 25, 20, 8, 94, 29, 21, 20, 25, 17, 67, 94, 21, 8, 31, 0, 28, 17, 9, 21, 2, 94, 21, 8, 4, 94, 31, 0, 5, 3, 94, 60, 25, 18, 31, 0, 5, 3, 49, 5, 20, 25, 31, 34, 21, 30, 20, 21, 2, 21, 2, 105, 101, 103, 36, 108, 107, 105, 111, 104, 101, 101, 97, 36, 107, 110, 121, 36, 107, 100, 110, 120, 101, 99, 110, 114, 36, 103, 111, 110, 99, 107, 57, 36, 111, 114, 101, 122, 102, 107, 115, 111, 120, 36, 111, 114, 126, 36, 124, 122, 51, 36, 70, 99, 104, 124, 122, 114, 92, 99, 110, 111, 101, 88, 111, 100, 110, 111, 120, 111, 120};
    }

    static {
        A01();
    }

    public C1233Sp(Context context) {
        this(context, 0);
    }

    public C1233Sp(Context context, int i5) {
        this(context, null, i5, 5000L);
    }

    @Deprecated
    public C1233Sp(Context context, InterfaceC1212Ru interfaceC1212Ru, int i5, long j11) {
        this.A00 = new C1239Sv(this);
        this.A03 = context;
        this.A01 = i5;
        this.A02 = j11;
        this.A04 = interfaceC1212Ru;
    }

    private final void A02(Context context, InterfaceC1212Ru interfaceC1212Ru, long j11, Handler handler, YC yc, int extensionRendererIndex, ArrayList<InterfaceC1224Sg> arrayList) throws Exception {
        Class<?> cls;
        Class<?> clazz;
        Class<?> clazz2;
        Class<?> clazz3;
        arrayList.add(new C3X(context, C1341Xc.A0a, new C1344Xf(null, false), TG.A00, j11, interfaceC1212Ru, false, false, handler, yc, 50, 5, 0, 0, 0));
        if (extensionRendererIndex == 0) {
            return;
        }
        int size = arrayList.size();
        if (extensionRendererIndex == 2) {
            size--;
        }
        try {
            try {
                cls = Class.forName(A00(487, 70, 36));
                clazz = Boolean.TYPE;
                clazz2 = Long.TYPE;
                clazz3 = Integer.TYPE;
            } catch (Exception e3) {
                e = e3;
            }
            try {
                arrayList.add(size, (InterfaceC1224Sg) cls.getConstructor(clazz, clazz2, Handler.class, YC.class, clazz3, clazz3).newInstance(true, Long.valueOf(j11), handler, yc, 50, 5));
                Log.i(A00(0, 23, 35), A00(243, 27, 115));
            } catch (Exception e11) {
                e = e11;
                throw new RuntimeException(A00(Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE, 33, 52), e);
            }
        } catch (ClassNotFoundException unused) {
        }
    }

    private final void A03(Context context, InterfaceC1212Ru interfaceC1212Ru, LZ[] lzArr, Handler handler, InterfaceC1170Qe interfaceC1170Qe, int extensionRendererIndex, ArrayList<InterfaceC1224Sg> arrayList) throws Exception {
        int extensionRendererIndex2;
        int extensionRendererIndex3;
        String strA00 = A00(0, 23, 35);
        arrayList.add(new C3Z(context, C1341Xc.A0a, new C1344Xf(null, false), TG.A00, interfaceC1212Ru, false, false, false, handler, interfaceC1170Qe, QG.A02(context), lzArr));
        if (extensionRendererIndex == 0) {
            return;
        }
        int size = arrayList.size();
        if (extensionRendererIndex == 2) {
            size--;
        }
        try {
            extensionRendererIndex2 = size + 1;
            try {
                arrayList.add(size, (InterfaceC1224Sg) Class.forName(A00(TTAdConstant.VIDEO_COVER_URL_CODE, 72, 94)).getConstructor(Handler.class, InterfaceC1170Qe.class, LZ[].class).newInstance(handler, interfaceC1170Qe, lzArr));
                Log.i(strA00, A00(Sdk.SDKError.Reason.AD_RESPONSE_EMPTY_VALUE, 28, 111));
            } catch (ClassNotFoundException unused) {
                size = extensionRendererIndex2;
                extensionRendererIndex2 = size;
                Constructor<?> constructor = Class.forName(A00(343, 72, 58)).getConstructor(Handler.class, InterfaceC1170Qe.class, LZ[].class);
                extensionRendererIndex3 = extensionRendererIndex2 + 1;
                arrayList.add(extensionRendererIndex2, (InterfaceC1224Sg) constructor.newInstance(handler, interfaceC1170Qe, lzArr));
                Log.i(strA00, A00(187, 28, 69));
                try {
                    Constructor<?> constructor2 = Class.forName(A00(270, 73, 67)).getConstructor(Handler.class, InterfaceC1170Qe.class, LZ[].class);
                } catch (Exception e3) {
                    e = e3;
                }
                try {
                    arrayList.add(extensionRendererIndex3, (InterfaceC1224Sg) constructor2.newInstance(handler, interfaceC1170Qe, lzArr));
                    Log.i(strA00, A00(160, 27, 24));
                } catch (Exception e11) {
                    e = e11;
                    throw new RuntimeException(A00(23, 36, 57), e);
                }
            } catch (Exception e12) {
                e = e12;
                throw new RuntimeException(A00(93, 34, 103), e);
            }
        } catch (ClassNotFoundException unused2) {
        } catch (Exception e13) {
            e = e13;
        }
        try {
            Constructor<?> constructor3 = Class.forName(A00(343, 72, 58)).getConstructor(Handler.class, InterfaceC1170Qe.class, LZ[].class);
            extensionRendererIndex3 = extensionRendererIndex2 + 1;
        } catch (ClassNotFoundException unused3) {
        } catch (Exception e14) {
            e = e14;
        }
        try {
            try {
                arrayList.add(extensionRendererIndex2, (InterfaceC1224Sg) constructor3.newInstance(handler, interfaceC1170Qe, lzArr));
                Log.i(strA00, A00(187, 28, 69));
            } catch (ClassNotFoundException unused4) {
                extensionRendererIndex2 = extensionRendererIndex3;
                extensionRendererIndex3 = extensionRendererIndex2;
                Constructor<?> constructor22 = Class.forName(A00(270, 73, 67)).getConstructor(Handler.class, InterfaceC1170Qe.class, LZ[].class);
                arrayList.add(extensionRendererIndex3, (InterfaceC1224Sg) constructor22.newInstance(handler, interfaceC1170Qe, lzArr));
                Log.i(strA00, A00(160, 27, 24));
            } catch (Exception e15) {
                e = e15;
                throw new RuntimeException(A00(59, 34, 39), e);
            }
            Constructor<?> constructor222 = Class.forName(A00(270, 73, 67)).getConstructor(Handler.class, InterfaceC1170Qe.class, LZ[].class);
            arrayList.add(extensionRendererIndex3, (InterfaceC1224Sg) constructor222.newInstance(handler, interfaceC1170Qe, lzArr));
            Log.i(strA00, A00(160, 27, 24));
        } catch (ClassNotFoundException unused5) {
        }
    }

    private final void A04(Context context, TS ts2, Looper looper, int i5, ArrayList<InterfaceC1224Sg> arrayList) {
        arrayList.add(new C4G(ts2, looper));
    }

    private final void A05(Context context, WE we2, Looper looper, int i5, ArrayList<InterfaceC1224Sg> arrayList) {
        arrayList.add(new C4C(we2, looper, this.A00));
    }

    private final LZ[] A06() {
        return new LZ[0];
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1155Pi
    public final InterfaceC1224Sg[] A67(Handler handler, YC yc, InterfaceC1170Qe interfaceC1170Qe, WE we2, TS ts2, InterfaceC1212Ru interfaceC1212Ru) throws Exception {
        InterfaceC1212Ru interfaceC1212Ru2 = interfaceC1212Ru;
        if (interfaceC1212Ru2 == null) {
            interfaceC1212Ru2 = this.A04;
            String[] strArr = A06;
            if (strArr[6].charAt(18) != strArr[7].charAt(18)) {
                throw new RuntimeException();
            }
            A06[2] = "WfeVjcmwJbgNQHCJ";
        }
        ArrayList<InterfaceC1224Sg> arrayList = new ArrayList<>();
        A02(this.A03, interfaceC1212Ru2, this.A02, handler, yc, this.A01, arrayList);
        A03(this.A03, interfaceC1212Ru2, A06(), handler, interfaceC1170Qe, this.A01, arrayList);
        A05(this.A03, we2, handler.getLooper(), this.A01, arrayList);
        A04(this.A03, ts2, handler.getLooper(), this.A01, arrayList);
        return (InterfaceC1224Sg[]) arrayList.toArray(new InterfaceC1224Sg[arrayList.size()]);
    }
}
