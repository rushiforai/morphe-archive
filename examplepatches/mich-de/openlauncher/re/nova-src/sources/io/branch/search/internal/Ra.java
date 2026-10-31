package io.branch.search.internal;

import android.graphics.Path;
import java.util.ArrayList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Ra {
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a1 A[Catch: NumberFormatException -> 0x00a5, LOOP:3: B:29:0x007e->B:46:0x00a1, LOOP_END, TryCatch #0 {NumberFormatException -> 0x00a5, blocks: (B:26:0x0069, B:28:0x0076, B:30:0x0080, B:46:0x00a1, B:51:0x00ab, B:53:0x00b0, B:54:0x00bb, B:55:0x00c0), top: B:73:0x0069 }] */
    /* JADX WARN: Removed duplicated region for block: B:89:0x00a0 A[SYNTHETIC] */
    @NotNull
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static Path a(@NotNull String pathData) {
        int i5;
        float[] fArr;
        Intrinsics.g(pathData, "pathData");
        Path path = new Path();
        ArrayList arrayList = new ArrayList();
        int i11 = 0;
        int i12 = 0;
        int i13 = 1;
        while (i13 < pathData.length()) {
            int i14 = i13;
            while (true) {
                if (i14 >= pathData.length()) {
                    i13 = i14;
                    break;
                }
                char cCharAt = pathData.charAt(i14);
                if ((cCharAt - 'Z') * (cCharAt - 'A') > 0) {
                    if ((cCharAt - 'z') * (cCharAt - 'a') > 0) {
                        continue;
                    }
                    i14++;
                }
                if (cCharAt != 'e' && cCharAt != 'E') {
                    break;
                }
                i14++;
            }
            String strSubstring = pathData.substring(i12, i13);
            Intrinsics.f(strSubstring, "this as java.lang.String…ing(startIndex, endIndex)");
            String string = r70.k.u1(strSubstring).toString();
            if (string.length() > 0) {
                if (string.charAt(i11) == 'z' || string.charAt(i11) == 'Z') {
                    fArr = new float[i11];
                } else {
                    try {
                        int length = string.length();
                        float[] fArr2 = new float[length];
                        int length2 = string.length();
                        int i15 = 1;
                        while (i15 < length2) {
                            int length3 = string.length();
                            int i16 = i11;
                            int i17 = i16;
                            int i18 = i17;
                            for (int i19 = i15; i19 < length3; i19++) {
                                char cCharAt2 = string.charAt(i15);
                                if (cCharAt2 == ' ' || cCharAt2 == ',') {
                                    i18 = 1;
                                    if (i18 == 0) {
                                    }
                                } else {
                                    if (cCharAt2 != '-' && cCharAt2 == '.') {
                                        if (i17 == 0) {
                                            i17 = 1;
                                        } else {
                                            i16 = 1;
                                            i18 = 1;
                                        }
                                    }
                                    if (i18 == 0) {
                                        break;
                                    }
                                }
                            }
                            if (i16 == 0) {
                                i15++;
                            }
                            i11 = 0;
                        }
                        if (length < 0) {
                            throw new ArrayIndexOutOfBoundsException();
                        }
                        int iMin = Math.min(0, length);
                        fArr = new float[0];
                        System.arraycopy(fArr2, 0, fArr, 0, iMin);
                    } catch (NumberFormatException e3) {
                        throw new RuntimeException(h6.c1.m(AbstractJsonLexerKt.STRING, "error in parsing \"", string), e3);
                    }
                }
                arrayList.add(new Qa(fArr));
            }
            i12 = i13;
            i13++;
            i11 = 0;
        }
        if (i13 - i12 != 1 || i12 >= pathData.length()) {
            i5 = 0;
        } else {
            i5 = 0;
            arrayList.add(new Qa(new float[0]));
        }
        try {
            r4.b.b(new r4.b[i5], path);
            return path;
        } catch (RuntimeException e11) {
            throw new RuntimeException("Error in parsing ".concat(pathData), e11);
        }
    }
}
