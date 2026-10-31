package com.google.android.gms.internal.measurement;

import android.animation.Animator;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProviderInfo;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import android.icu.text.AlphabeticIndex;
import android.os.Build;
import android.os.LocaleList;
import android.os.UserHandle;
import android.util.ArrayMap;
import android.util.AtomicFile;
import android.util.DisplayMetrics;
import android.util.Log;
import android.util.Xml;
import android.view.View;
import android.view.WindowManager;
import android.view.autofill.AutofillManager;
import androidx.compose.ui.node.LayoutNode;
import androidx.compose.ui.platform.AndroidComposeView;
import androidx.datastore.core.CorruptionException;
import androidx.profileinstaller.ProfileInstallReceiver;
import com.android.launcher3.CellLayout;
import com.android.launcher3.folder.Folder;
import com.android.launcher3.folder.FolderIcon;
import com.android.launcher3.folder.FolderPagedView;
import com.android.launcher3.icons.BitmapInfo;
import com.android.launcher3.model.WidgetItem;
import com.android.launcher3.util.ComponentKey;
import com.android.launcher3.widget.LauncherAppWidgetProviderInfo;
import com.google.ads.mediation.vungle.VungleMediationAdapter;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.tasks.Task;
import com.google.android.gms.tasks.Tasks;
import com.vungle.ads.BidTokenCallback;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.CancellationException;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.ULong;
import kotlin.Unit;
import kotlin.jdk7.AutoCloseableKt;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.ranges.IntRange;
import org.jf.util.ExceptionWithContext;
import org.xmlpull.v1.XmlSerializer;

/* loaded from: classes.dex */
public final class v6 implements vd.b, com.google.android.gms.internal.consent_sdk.m7, fi.e, ba.d, fi.c, BidTokenCallback, z8.b, t5.b, o9.p2 {

    /* renamed from: c, reason: collision with root package name */
    public static volatile v6 f33134c;

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f33135a;

    /* renamed from: b, reason: collision with root package name */
    public Object f33136b;

    public /* synthetic */ v6(Object obj, int i5) {
        this.f33135a = i5;
        this.f33136b = obj;
    }

    public static ga.h r(Context context, ComponentName componentName, UserHandle userHandle) {
        ArrayMap arrayMap;
        synchronized (ab.e0.class) {
            arrayMap = ab.e0.f709b;
            if (arrayMap == null) {
                ab.e0.M(context);
                arrayMap = ab.e0.f709b;
            }
        }
        if (!arrayMap.containsKey(componentName)) {
            return new ga.h(-1, userHandle, componentName.getPackageName());
        }
        Iterator it = ((ya.r) arrayMap.get(componentName)).iterator();
        int iIntValue = -1;
        while (true) {
            u uVar = (u) it;
            if (!uVar.hasNext() || iIntValue != -1) {
                break;
            }
            iIntValue = ((Integer) uVar.next()).intValue();
        }
        return new ga.h(iIntValue, userHandle, componentName.getPackageName());
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:161:0x029a  */
    /* JADX WARN: Removed duplicated region for block: B:177:0x02d2  */
    /* JADX WARN: Removed duplicated region for block: B:211:0x03d2  */
    /* JADX WARN: Removed duplicated region for block: B:215:0x03ea  */
    /* JADX WARN: Removed duplicated region for block: B:217:0x03ef  */
    /* JADX WARN: Removed duplicated region for block: B:221:0x03fc  */
    /* JADX WARN: Removed duplicated region for block: B:328:0x040b A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:84:0x0194  */
    /* JADX WARN: Removed duplicated region for block: B:86:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01a7  */
    /* JADX WARN: Type inference failed for: r20v0 */
    /* JADX WARN: Type inference failed for: r20v1 */
    /* JADX WARN: Type inference failed for: r20v13 */
    /* JADX WARN: Type inference failed for: r20v14 */
    /* JADX WARN: Type inference failed for: r20v6 */
    /* JADX WARN: Type inference failed for: r20v7 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static ArrayList v(v6 v6Var, String str) {
        int i5;
        int i11;
        char cCharAt;
        char c11;
        int i12;
        ?? r202;
        int i13;
        long j11;
        boolean z11;
        char cCharAt2;
        int i14;
        int i15;
        char c12;
        char c13;
        int i16;
        int i17;
        int i18;
        int i19;
        int i21;
        int i22;
        long j12;
        boolean z12;
        long j13;
        int iFloatToRawIntBits;
        long jFloatToRawIntBits;
        long j14;
        int i23;
        long j15;
        long jFloatToRawIntBits2;
        int i24;
        boolean z13;
        float fIntBitsToFloat;
        ArrayList arrayList = new ArrayList();
        int length = str.length();
        int i25 = 0;
        while (true) {
            i5 = 32;
            if (i25 >= length || Intrinsics.h(str.charAt(i25), 32) > 0) {
                break;
            }
            i25++;
        }
        while (length > i25 && Intrinsics.h(str.charAt(length - 1), 32) <= 0) {
            length--;
        }
        int i26 = 0;
        while (i25 < length) {
            while (true) {
                i11 = i25 + 1;
                cCharAt = str.charAt(i25);
                int i27 = cCharAt | ' ';
                if ((i27 - 122) * (i27 - 97) > 0 || i27 == 101) {
                    if (i11 >= length) {
                        cCharAt = 0;
                    } else {
                        i25 = i11;
                    }
                }
            }
            if (cCharAt != 0) {
                if ((cCharAt | ' ') != 122) {
                    i26 = 0;
                    while (true) {
                        if (i11 >= length || Intrinsics.h(str.charAt(i11), i5) > 0) {
                            if (i11 == length) {
                                int i28 = i5;
                                i13 = i26;
                                jFloatToRawIntBits = (i11 << i28) | (Float.floatToRawIntBits(Float.NaN) & 4294967295L);
                                c11 = cCharAt;
                                i12 = i28;
                            } else {
                                int i29 = i5;
                                i13 = i26;
                                char cCharAt3 = str.charAt(i11);
                                boolean z14 = cCharAt3 == '-';
                                i12 = i29;
                                if (z14) {
                                    i14 = i11 + 1;
                                    if (i14 == length) {
                                        jFloatToRawIntBits = (i14 << i12) | (Float.floatToRawIntBits(Float.NaN) & 4294967295L);
                                        c11 = cCharAt;
                                    } else {
                                        z11 = true;
                                        z13 = true;
                                        z11 = true;
                                        cCharAt2 = str.charAt(i14);
                                        j11 = 4294967295L;
                                        if (((char) (cCharAt2 - '0')) >= '\n' && cCharAt2 != '.') {
                                            j15 = i14 << i12;
                                            jFloatToRawIntBits2 = Float.floatToRawIntBits(Float.NaN);
                                        }
                                        jFloatToRawIntBits = j15 | (jFloatToRawIntBits2 & j11);
                                        c11 = cCharAt;
                                        r202 = z13;
                                        int i31 = (int) (jFloatToRawIntBits >>> i12);
                                        fIntBitsToFloat = Float.intBitsToFloat((int) (jFloatToRawIntBits & j11));
                                        if (Float.isNaN(fIntBitsToFloat)) {
                                            i11 = i31;
                                            i26 = i13;
                                        } else {
                                            float[] fArr = (float[]) v6Var.f33136b;
                                            i26 = i13 + 1;
                                            fArr[i13] = fIntBitsToFloat;
                                            if (i26 >= fArr.length) {
                                                float[] fArr2 = new float[i26 * 2];
                                                v6Var.f33136b = fArr2;
                                                System.arraycopy(fArr, 0, fArr2, 0, fArr.length);
                                            }
                                            i11 = i31;
                                        }
                                        while (i11 < length && str.charAt(i11) == ',') {
                                            i11++;
                                        }
                                        if (i11 < length && !Float.isNaN(fIntBitsToFloat)) {
                                            i5 = i12;
                                            cCharAt = c11;
                                        }
                                    }
                                } else {
                                    j11 = 4294967295L;
                                    z11 = true;
                                    cCharAt2 = cCharAt3;
                                    i14 = i11;
                                }
                                int length2 = str.length();
                                int i32 = i14;
                                long j16 = 0;
                                while (i32 != length) {
                                    int i33 = cCharAt2 - '0';
                                    if (((char) i33) < '\n') {
                                        int i34 = i11;
                                        j16 = (j16 * 10) + i33;
                                        i32++;
                                        cCharAt2 = i32 < length2 ? str.charAt(i32) : (char) 0;
                                        i11 = i34;
                                    } else {
                                        int i35 = i11;
                                        i15 = i32 - i14;
                                        if (i32 == length && cCharAt2 == '.') {
                                            int i36 = i32 + 1;
                                            i16 = i36;
                                            c12 = 16;
                                            while (true) {
                                                c13 = '0';
                                                if (length - i16 >= 4) {
                                                    i24 = i36;
                                                    long jCharAt = str.charAt(i16) | (str.charAt(i16 + 1) << 16) | (str.charAt(i16 + 2) << i12) | (str.charAt(i16 + 3) << 48);
                                                    long j17 = jCharAt - 13511005043687472L;
                                                    int i37 = (((jCharAt + 19703549022044230L) | j17) & (-35747867511423104L)) != 0 ? -1 : (int) ((j17 * 281475406208040961L) >>> 48);
                                                    if (i37 >= 0) {
                                                        j16 = (j16 * com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h.f42227c) + i37;
                                                        i16 += 4;
                                                        i36 = i24;
                                                    }
                                                } else {
                                                    i24 = i36;
                                                }
                                            }
                                            char cCharAt4 = i16 < length2 ? str.charAt(i16) : (char) 0;
                                            while (true) {
                                                cCharAt2 = cCharAt4;
                                                while (i16 != length) {
                                                    int i38 = cCharAt2 - '0';
                                                    if (((char) i38) < '\n') {
                                                        j16 = (j16 * 10) + i38;
                                                        i16++;
                                                        if (i16 < length2) {
                                                            break;
                                                        }
                                                        cCharAt2 = 0;
                                                    }
                                                }
                                                cCharAt4 = str.charAt(i16);
                                            }
                                            int i39 = i24 - i16;
                                            i15 -= i39;
                                            i18 = i39;
                                            i17 = i24;
                                        } else {
                                            c12 = 16;
                                            c13 = '0';
                                            i16 = i32;
                                            i17 = i16;
                                            i18 = 0;
                                        }
                                        if (i15 != 0) {
                                            j15 = i16 << i12;
                                            jFloatToRawIntBits2 = Float.floatToRawIntBits(Float.NaN);
                                            z13 = z11;
                                            jFloatToRawIntBits = j15 | (jFloatToRawIntBits2 & j11);
                                            c11 = cCharAt;
                                            r202 = z13;
                                            int i312 = (int) (jFloatToRawIntBits >>> i12);
                                            fIntBitsToFloat = Float.intBitsToFloat((int) (jFloatToRawIntBits & j11));
                                            if (Float.isNaN(fIntBitsToFloat)) {
                                            }
                                            while (i11 < length) {
                                                i11++;
                                            }
                                            if (i11 < length) {
                                            }
                                        } else {
                                            if ((cCharAt2 | ' ') == 101) {
                                                i21 = i16 + 1;
                                                char cCharAt5 = i21 < length2 ? str.charAt(i21) : (char) 0;
                                                boolean z15 = cCharAt5 == '-' ? z11 ? 1 : 0 : false;
                                                i19 = i35;
                                                if (z15 || cCharAt5 == '+') {
                                                    i21 = i16 + 2;
                                                }
                                                char cCharAt6 = str.charAt(i21);
                                                int i40 = 0;
                                                while (true) {
                                                    if (i21 != length) {
                                                        int i41 = cCharAt6 - '0';
                                                        i23 = i18;
                                                        if (((char) i41) < '\n') {
                                                            if (i40 < 1024) {
                                                                i40 = (i40 * 10) + i41;
                                                            }
                                                            i21++;
                                                            cCharAt6 = i21 < length2 ? str.charAt(i21) : (char) 0;
                                                            i18 = i23;
                                                        }
                                                    } else {
                                                        i23 = i18;
                                                    }
                                                }
                                                i22 = z15 ? -i40 : i40;
                                                i18 = i23 + i22;
                                            } else {
                                                i19 = i35;
                                                i21 = i16;
                                                i22 = 0;
                                            }
                                            int i42 = 19;
                                            if (i15 > 19) {
                                                char cCharAt7 = str.charAt(i14);
                                                int i43 = i14;
                                                while (true) {
                                                    if (i21 != length) {
                                                        if (cCharAt7 == c13 || cCharAt7 == '.') {
                                                            if (cCharAt7 == '0') {
                                                                i15--;
                                                            }
                                                            int i44 = i43 + 1;
                                                            cCharAt7 = i44 < length2 ? str.charAt(i44) : (char) 0;
                                                            i43 = i44;
                                                            i42 = 19;
                                                            c13 = '0';
                                                        } else {
                                                            i42 = 19;
                                                        }
                                                    }
                                                }
                                                if (i15 > i42) {
                                                    char cCharAt8 = str.charAt(i14);
                                                    int i45 = i22;
                                                    c11 = cCharAt;
                                                    j12 = 0;
                                                    while (true) {
                                                        if (i14 != i32) {
                                                            ULong.Companion companion = ULong.f71699b;
                                                            if (Long.compareUnsigned(j12, 1000000000000000000L) < 0) {
                                                                j12 = (j12 * 10) + (cCharAt8 - '0');
                                                                i14++;
                                                                cCharAt8 = i14 < length2 ? str.charAt(i14) : (char) 0;
                                                            }
                                                        }
                                                    }
                                                    ULong.Companion companion2 = ULong.f71699b;
                                                    if (Long.compareUnsigned(j12, 1000000000000000000L) >= 0) {
                                                        i18 = (i32 - i14) + i45;
                                                    } else {
                                                        char cCharAt9 = str.charAt(i17);
                                                        int i46 = i17;
                                                        for (j14 = 1000000000000000000L; i46 != i16 && Long.compareUnsigned(j12, j14) < 0; j14 = 1000000000000000000L) {
                                                            j12 = (j12 * 10) + (cCharAt9 - '0');
                                                            i46++;
                                                            cCharAt9 = i46 < length2 ? str.charAt(i46) : (char) 0;
                                                        }
                                                        i18 = (i17 - i46) + i45;
                                                    }
                                                    z12 = z11 ? 1 : 0;
                                                } else {
                                                    c11 = cCharAt;
                                                    j12 = j16;
                                                    z12 = false;
                                                }
                                                if (-10 > i18 || i18 >= 11 || z12) {
                                                    if (j12 == 0) {
                                                        j13 = i21 << i12;
                                                        iFloatToRawIntBits = Float.floatToRawIntBits(z14 ? -0.0f : 0.0f);
                                                    } else if (-126 > i18 || i18 >= 128) {
                                                        String strSubstring = str.substring(i19, i21);
                                                        Intrinsics.f(strSubstring, "substring(...)");
                                                        j13 = i21 << i12;
                                                        iFloatToRawIntBits = Float.floatToRawIntBits(Float.parseFloat(strSubstring));
                                                    } else {
                                                        long j18 = o2.b.f79207b[i18 + 325];
                                                        ULong.Companion companion3 = ULong.f71699b;
                                                        int iNumberOfLeadingZeros = Long.numberOfLeadingZeros(j12);
                                                        long j19 = j12 << iNumberOfLeadingZeros;
                                                        long j21 = j19 & j11;
                                                        long j22 = j19 >>> i12;
                                                        long j23 = j18 & j11;
                                                        long j24 = j18 >>> i12;
                                                        long j25 = j22 * j24;
                                                        long j26 = j24 * j21;
                                                        long j27 = j25 + ((((j22 * j23) + ((j21 * j23) >>> i12)) + (j26 & j11)) >>> i12) + (j26 >>> i12);
                                                        int i47 = (int) (j27 >>> 63);
                                                        long j28 = j27 >>> (i47 + 9);
                                                        int i48 = iNumberOfLeadingZeros + (i47 ^ 1);
                                                        long j29 = j27 & 511;
                                                        if (j29 == 511 || (j29 == 0 && (3 & j28) == 1)) {
                                                            String strSubstring2 = str.substring(i19, i21);
                                                            Intrinsics.f(strSubstring2, "substring(...)");
                                                            j13 = i21 << i12;
                                                            iFloatToRawIntBits = Float.floatToRawIntBits(Float.parseFloat(strSubstring2));
                                                        } else {
                                                            long j31 = (j28 + 1) >>> (z11 ? 1L : 0L);
                                                            if (j31 >= 9007199254740992L) {
                                                                i48--;
                                                                j31 = 4503599627370496L;
                                                            }
                                                            long j32 = j31 & (-4503599627370497L);
                                                            long j33 = ((((i18 * 217706) >> c12) + 1024) + 63) - i48;
                                                            if (j33 < 1 || j33 > 2046) {
                                                                String strSubstring3 = str.substring(i19, i21);
                                                                Intrinsics.f(strSubstring3, "substring(...)");
                                                                j13 = i21 << i12;
                                                                iFloatToRawIntBits = Float.floatToRawIntBits(Float.parseFloat(strSubstring3));
                                                            } else {
                                                                j13 = i21 << i12;
                                                                iFloatToRawIntBits = Float.floatToRawIntBits((float) Double.longBitsToDouble((j33 << 52) | j32 | (z14 ? Long.MIN_VALUE : 0L)));
                                                            }
                                                        }
                                                    }
                                                    jFloatToRawIntBits = j13 | (iFloatToRawIntBits & j11);
                                                    r202 = z11;
                                                    int i3122 = (int) (jFloatToRawIntBits >>> i12);
                                                    fIntBitsToFloat = Float.intBitsToFloat((int) (jFloatToRawIntBits & j11));
                                                    if (Float.isNaN(fIntBitsToFloat)) {
                                                    }
                                                    while (i11 < length) {
                                                    }
                                                    if (i11 < length) {
                                                    }
                                                } else {
                                                    ULong.Companion companion4 = ULong.f71699b;
                                                    if (Long.compareUnsigned(j12, 16777216L) <= 0) {
                                                        float f11 = j12;
                                                        float[] fArr3 = o2.b.f79206a;
                                                        float f12 = i18 < 0 ? f11 / fArr3[-i18] : f11 * fArr3[i18];
                                                        if (z14) {
                                                            f12 = -f12;
                                                        }
                                                        j13 = i21 << i12;
                                                        iFloatToRawIntBits = Float.floatToRawIntBits(f12);
                                                    }
                                                    jFloatToRawIntBits = j13 | (iFloatToRawIntBits & j11);
                                                    r202 = z11;
                                                    int i31222 = (int) (jFloatToRawIntBits >>> i12);
                                                    fIntBitsToFloat = Float.intBitsToFloat((int) (jFloatToRawIntBits & j11));
                                                    if (Float.isNaN(fIntBitsToFloat)) {
                                                    }
                                                    while (i11 < length) {
                                                    }
                                                    if (i11 < length) {
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                int i352 = i11;
                                i15 = i32 - i14;
                                if (i32 == length) {
                                    c12 = 16;
                                    c13 = '0';
                                    i16 = i32;
                                    i17 = i16;
                                    i18 = 0;
                                    if (i15 != 0) {
                                    }
                                }
                            }
                            j11 = 4294967295L;
                            r202 = 1;
                            int i312222 = (int) (jFloatToRawIntBits >>> i12);
                            fIntBitsToFloat = Float.intBitsToFloat((int) (jFloatToRawIntBits & j11));
                            if (Float.isNaN(fIntBitsToFloat)) {
                            }
                            while (i11 < length) {
                            }
                            if (i11 < length) {
                            }
                        } else {
                            i11++;
                        }
                    }
                } else {
                    c11 = cCharAt;
                    i12 = i5;
                    r202 = 1;
                }
                i25 = i11;
                float[] fArr4 = (float[]) v6Var.f33136b;
                int i49 = 2;
                switch (c11) {
                    case 'A':
                        int i51 = i26 - 7;
                        for (int i52 = 0; i52 <= i51; i52 += 7) {
                            arrayList.add(new o2.k(fArr4[i52], fArr4[i52 + 1], fArr4[i52 + 2], Float.compare(fArr4[i52 + 3], 0.0f) != 0 ? r202 : false, Float.compare(fArr4[i52 + 4], 0.0f) != 0 ? r202 : false, fArr4[i52 + 5], fArr4[i52 + 6]));
                        }
                        i5 = i12;
                        break;
                    case 'C':
                        int i53 = i26 - 6;
                        for (int i54 = 0; i54 <= i53; i54 += 6) {
                            arrayList.add(new o2.m(fArr4[i54], fArr4[i54 + 1], fArr4[i54 + 2], fArr4[i54 + 3], fArr4[i54 + 4], fArr4[i54 + 5]));
                        }
                        i5 = i12;
                        break;
                    case 'H':
                        int i55 = i26 - 1;
                        for (int i56 = 0; i56 <= i55; i56++) {
                            arrayList.add(new o2.n(fArr4[i56]));
                        }
                        i5 = i12;
                        break;
                    case 'L':
                        int i57 = i26 - 2;
                        for (int i58 = 0; i58 <= i57; i58 += 2) {
                            arrayList.add(new o2.o(fArr4[i58], fArr4[i58 + 1]));
                        }
                        i5 = i12;
                        break;
                    case 'M':
                        int i59 = i26 - 2;
                        if (i59 >= 0) {
                            arrayList.add(new o2.p(fArr4[0], fArr4[r202]));
                            while (i49 <= i59) {
                                arrayList.add(new o2.o(fArr4[i49], fArr4[i49 + 1]));
                                i49 += 2;
                            }
                        }
                        i5 = i12;
                        break;
                    case 'Q':
                        int i61 = i26 - 4;
                        for (int i62 = 0; i62 <= i61; i62 += 4) {
                            arrayList.add(new o2.q(fArr4[i62], fArr4[i62 + 1], fArr4[i62 + 2], fArr4[i62 + 3]));
                        }
                        i5 = i12;
                        break;
                    case 'S':
                        int i63 = i26 - 4;
                        for (int i64 = 0; i64 <= i63; i64 += 4) {
                            arrayList.add(new o2.r(fArr4[i64], fArr4[i64 + 1], fArr4[i64 + 2], fArr4[i64 + 3]));
                        }
                        i5 = i12;
                        break;
                    case 'T':
                        int i65 = i26 - 2;
                        for (int i66 = 0; i66 <= i65; i66 += 2) {
                            arrayList.add(new o2.s(fArr4[i66], fArr4[i66 + 1]));
                        }
                        i5 = i12;
                        break;
                    case 'V':
                        int i67 = i26 - 1;
                        for (int i68 = 0; i68 <= i67; i68++) {
                            arrayList.add(new o2.c0(fArr4[i68]));
                        }
                        i5 = i12;
                        break;
                    case 'Z':
                    case INVALID_ADS_ENDPOINT_VALUE:
                        arrayList.add(o2.l.f79317c);
                        i5 = i12;
                        break;
                    case ads_mobile_sdk.pd.H0 /* 97 */:
                        int i69 = i26 - 7;
                        for (int i71 = 0; i71 <= i69; i71 += 7) {
                            arrayList.add(new o2.t(fArr4[i71], fArr4[i71 + 1], fArr4[i71 + 2], Float.compare(fArr4[i71 + 3], 0.0f) != 0 ? r202 : false, Float.compare(fArr4[i71 + 4], 0.0f) != 0 ? r202 : false, fArr4[i71 + 5], fArr4[i71 + 6]));
                        }
                        i5 = i12;
                        break;
                    case ads_mobile_sdk.pd.R0 /* 99 */:
                        int i72 = i26 - 6;
                        for (int i73 = 0; i73 <= i72; i73 += 6) {
                            arrayList.add(new o2.u(fArr4[i73], fArr4[i73 + 1], fArr4[i73 + 2], fArr4[i73 + 3], fArr4[i73 + 4], fArr4[i73 + 5]));
                        }
                        i5 = i12;
                        break;
                    case 'h':
                        int i74 = i26 - 1;
                        for (int i75 = 0; i75 <= i74; i75++) {
                            arrayList.add(new o2.v(fArr4[i75]));
                        }
                        i5 = i12;
                        break;
                    case 'l':
                        int i76 = i26 - 2;
                        for (int i77 = 0; i77 <= i76; i77 += 2) {
                            arrayList.add(new o2.w(fArr4[i77], fArr4[i77 + 1]));
                        }
                        i5 = i12;
                        break;
                    case 'm':
                        int i78 = i26 - 2;
                        if (i78 >= 0) {
                            arrayList.add(new o2.x(fArr4[0], fArr4[r202]));
                            while (i49 <= i78) {
                                arrayList.add(new o2.w(fArr4[i49], fArr4[i49 + 1]));
                                i49 += 2;
                            }
                        }
                        i5 = i12;
                        break;
                    case 'q':
                        int i79 = i26 - 4;
                        for (int i81 = 0; i81 <= i79; i81 += 4) {
                            arrayList.add(new o2.y(fArr4[i81], fArr4[i81 + 1], fArr4[i81 + 2], fArr4[i81 + 3]));
                        }
                        i5 = i12;
                        break;
                    case 's':
                        int i82 = i26 - 4;
                        for (int i83 = 0; i83 <= i82; i83 += 4) {
                            arrayList.add(new o2.z(fArr4[i83], fArr4[i83 + 1], fArr4[i83 + 2], fArr4[i83 + 3]));
                        }
                        i5 = i12;
                        break;
                    case GZIP_ENCODE_ERROR_VALUE:
                        int i84 = i26 - 2;
                        for (int i85 = 0; i85 <= i84; i85 += 2) {
                            arrayList.add(new o2.a0(fArr4[i85], fArr4[i85 + 1]));
                        }
                        i5 = i12;
                        break;
                    case PROTOBUF_SERIALIZATION_ERROR_VALUE:
                        int i86 = i26 - 1;
                        for (int i87 = 0; i87 <= i86; i87++) {
                            arrayList.add(new o2.b0(fArr4[i87]));
                        }
                        i5 = i12;
                        break;
                    default:
                        throw new IllegalArgumentException("Unknown command for: " + c11);
                }
            } else {
                i25 = i11;
            }
        }
        return arrayList;
    }

    public boolean A(LayoutNode layoutNode) {
        if (!layoutNode.isAttached()) {
            y2.a.b("DepthSortedSet.remove called on an unattached node");
        }
        return ((b3.q2) this.f33136b).remove(layoutNode);
    }

    public void B() {
        r1.e eVar = (r1.e) this.f33136b;
        IntRange intRangeM0 = kotlin.ranges.a.m0(0, eVar.f85079c);
        int i5 = intRangeM0.f71906a;
        int i11 = intRangeM0.f71907b;
        if (i5 <= i11) {
            while (true) {
                t70.m mVar = ((g0.f) eVar.f85077a[i5]).f56513b;
                Unit unit = Unit.f71706a;
                int i12 = Result.f71687b;
                mVar.resumeWith(unit);
                if (i5 == i11) {
                    break;
                } else {
                    i5++;
                }
            }
        }
        eVar.g();
    }

    public synchronized void C(ArrayList arrayList, o9.t1 t1Var, ya.g0 g0Var) {
        try {
            vm.c cVar = new vm.c(10);
            if (g0Var == null) {
                ((HashMap) this.f33136b).clear();
            } else {
                ((HashMap) this.f33136b).remove(cVar.l(g0Var));
            }
            HashMap map = (HashMap) this.f33136b;
            Stream stream = arrayList.stream();
            fa.c1 c1Var = new fa.c1();
            t1Var.getClass();
            ((WindowManager) t1Var.f80132a.getSystemService("window")).getDefaultDisplay().getRealMetrics(new DisplayMetrics());
            map.putAll((Map) stream.filter(c1Var).flatMap(new fa.b1(this, t1Var, cVar)).collect(Collectors.groupingBy(new fa.n(8), Collectors.mapping(new fa.n(9), Collectors.toList()))));
            fz.d0 d0Var = t1Var.f80135d;
            Iterator it = ((z.d) ((z.e) cVar.f92857b).values()).iterator();
            while (true) {
                z.a aVar = (z.a) it;
                if (aVar.hasNext()) {
                    d0Var.u((ga.h) aVar.next(), true);
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public ArrayList D(o9.t1 t1Var, ya.g0 g0Var) throws Exception {
        Context context = t1Var.f80132a;
        fz.d0 d0Var = t1Var.f80135d;
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        try {
            o9.z0 z0Var = t1Var.f80136e;
            PackageManager packageManager = t1Var.f80132a.getPackageManager();
            Iterator<AppWidgetProviderInfo> it = (g0Var == null ? (List) Stream.concat(((ja.h) ja.h.f69294h.h(context)).f().stream().flatMap(new ab.b0((AppWidgetManager) context.getSystemService(AppWidgetManager.class), 0)), ((bb.b) bb.b.f17790h.h(context)).f17795d.stream()).collect(Collectors.toList()) : AppWidgetManager.getInstance(context).getInstalledProvidersForPackage(g0Var.f97138a, g0Var.f97140c)).iterator();
            while (it.hasNext()) {
                LauncherAppWidgetProviderInfo launcherAppWidgetProviderInfoE = LauncherAppWidgetProviderInfo.e(context, it.next());
                arrayList.add(new WidgetItem(launcherAppWidgetProviderInfoE, z0Var, d0Var));
                arrayList2.add(launcherAppWidgetProviderInfoE);
            }
            Iterator it2 = ja.f.f(context, g0Var).iterator();
            while (it2.hasNext()) {
                ja.f fVar = (ja.f) it2.next();
                arrayList.add(new WidgetItem(fVar, d0Var, packageManager));
                arrayList2.add(fVar);
            }
            if (g0Var == null) {
                for (ja.f fVar2 : w20.h.f(context)) {
                    arrayList.add(new WidgetItem(fVar2, d0Var, packageManager));
                    arrayList2.add(fVar2);
                }
            }
            C(arrayList, t1Var, g0Var);
            return arrayList2;
        } catch (Exception e3) {
            if (o9.g3.n(e3)) {
                return arrayList2;
            }
            throw e3;
        }
    }

    public void E(Context context, List list) throws IllegalStateException, IOException, IllegalArgumentException {
        String str = (String) this.f33136b;
        AtomicFile atomicFile = new AtomicFile(context.getFileStreamPath(str));
        try {
            FileOutputStream fileOutputStreamStartWrite = atomicFile.startWrite();
            ja.h hVar = (ja.h) ja.h.f69294h.h(context);
            try {
                XmlSerializer xmlSerializerNewSerializer = Xml.newSerializer();
                xmlSerializerNewSerializer.setOutput(fileOutputStreamStartWrite, StandardCharsets.UTF_8.name());
                xmlSerializerNewSerializer.startDocument(null, Boolean.TRUE);
                xmlSerializerNewSerializer.startTag(null, "items");
                Iterator it = list.iterator();
                while (it.hasNext()) {
                    ga.e eVar = (ga.e) it.next();
                    Intent intentD = eVar.d();
                    if (intentD != null) {
                        xmlSerializerNewSerializer.startTag(null, "entry");
                        xmlSerializerNewSerializer.attribute(null, "itemType", Integer.toString(eVar.f57290b));
                        xmlSerializerNewSerializer.attribute(null, "profileId", Long.toString(hVar.d(eVar.o)));
                        xmlSerializerNewSerializer.attribute(null, "intent", intentD.toUri(0));
                        xmlSerializerNewSerializer.endTag(null, "entry");
                    }
                }
                xmlSerializerNewSerializer.endTag(null, "items");
                xmlSerializerNewSerializer.endDocument();
                atomicFile.finishWrite(fileOutputStreamStartWrite);
            } catch (IOException e3) {
                atomicFile.failWrite(fileOutputStreamStartWrite);
                Log.e("PersistedItemArray", "Unable to persist items in " + str, e3);
            }
        } catch (IOException e11) {
            Log.e("PersistedItemArray", "Unable to persist items in " + str, e11);
        }
    }

    public void a(LayoutNode layoutNode) {
        if (!layoutNode.isAttached()) {
            y2.a.b("DepthSortedSet.add called on an unattached node");
        }
        ((b3.q2) this.f33136b).add(layoutNode);
    }

    public boolean b(x7.q qVar) throws IOException {
        List list = (List) this.f33136b;
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            u7.c cVar = (u7.c) obj;
            cVar.getClass();
            if (cVar.b(qVar) && cVar.c(cVar.f90665a.a())) {
                arrayList.add(obj);
            }
        }
        if (!arrayList.isEmpty()) {
            o7.r rVarC = o7.r.c();
            int i5 = t7.h.f88768a;
            b70.g.f1(arrayList, null, null, null, 0, t7.g.f88767j, 31);
            rVarC.getClass();
        }
        return arrayList.isEmpty();
    }

    @Override // ba.d
    public CharSequence d(Object obj) {
        ComponentKey componentKey = (ComponentKey) obj;
        PackageManager packageManager = ((fz.d0) this.f33136b).f556b.getPackageManager();
        try {
            return packageManager.getActivityInfo(componentKey.f21251a, 0).loadLabel(packageManager);
        } catch (Exception unused) {
            return componentKey.f21251a.flattenToShortString();
        }
    }

    @Override // ba.d
    public BitmapInfo e(Context context, Object obj) throws PackageManager.NameNotFoundException {
        ComponentKey componentKey = (ComponentKey) obj;
        fz.d0 d0Var = (fz.d0) this.f33136b;
        try {
            ActivityInfo activityInfo = d0Var.f556b.getPackageManager().getActivityInfo(componentKey.f21251a, 0);
            aa.g0 g0VarA = aa.g0.A(context, d0Var.f56214w);
            try {
                BitmapInfo bitmapInfoC = g0VarA.c(d0Var.k(activityInfo), componentKey.f21252b, 28);
                AutoCloseableKt.a(g0VarA, null);
                return bitmapInfoC;
            } finally {
            }
        } catch (Exception unused) {
            return d0Var.h(componentKey.f21252b);
        }
    }

    @Override // z8.b
    public void g(Drawable drawable) {
    }

    @Override // w60.a
    public Object get() {
        switch (this.f33135a) {
            case 4:
                return new be.m((Context) ((w60.a) this.f33136b).get(), "com.google.android.datatransport.events", Integer.valueOf(be.m.f17854d).intValue());
            default:
                return this.f33136b;
        }
    }

    @Override // z8.b
    public void h(Drawable drawable) {
        n8.l lVar = (n8.l) this.f33136b;
        lVar.k(new n8.f(drawable != null ? lVar.j(drawable) : null));
    }

    @Override // ba.d
    public UserHandle i(Object obj) {
        return ((ComponentKey) obj).f21252b;
    }

    @Override // t5.b
    public Object j(CorruptionException corruptionException) {
        return ((Function1) this.f33136b).invoke(corruptionException);
    }

    @Override // ba.d
    public boolean l() {
        return false;
    }

    @Override // ba.d
    public ComponentName m(Object obj) {
        return ((ComponentKey) obj).f21251a;
    }

    public void n(CancellationException cancellationException) {
        r1.e eVar = (r1.e) this.f33136b;
        int i5 = eVar.f85079c;
        t70.l[] lVarArr = new t70.l[i5];
        for (int i11 = 0; i11 < i5; i11++) {
            lVarArr[i11] = ((g0.f) eVar.f85077a[i11]).f56513b;
        }
        for (int i12 = 0; i12 < i5; i12++) {
            lVarArr[i12].a(cancellationException);
        }
        if (eVar.f85079c == 0) {
            return;
        }
        j0.b.c("uncancelled requests present");
    }

    public void o() {
        ((p1.w) this.f33136b).getClass();
    }

    @Override // o9.p2
    public void onAlarm() {
        int i5;
        int i11;
        switch (this.f33135a) {
            case 26:
                Folder folder = (Folder) this.f33136b;
                if (folder.f79742a) {
                    FolderPagedView folderPagedView = folder.f21117q;
                    int i12 = folder.f21124x;
                    int i13 = folder.f21122v;
                    if (folderPagedView.f21144i0) {
                        folderPagedView.w0();
                        int iG = folderPagedView.G();
                        int i14 = folderPagedView.W.f96946d;
                        int i15 = i13 % i14;
                        if (i13 / i14 != iG) {
                            Log.e("FolderPagedView", "Cannot animate when the target cell is invisible");
                        }
                        int i16 = i12 % i14;
                        int i17 = i12 / i14;
                        if (i13 != i12) {
                            int i18 = -1;
                            if (i13 > i12) {
                                if (i17 < iG) {
                                    i18 = iG * i14;
                                    i16 = 0;
                                } else {
                                    i12 = -1;
                                }
                                i11 = 1;
                            } else {
                                if (i17 > iG) {
                                    i5 = ((iG + 1) * i14) - 1;
                                    i16 = i14 - 1;
                                } else {
                                    i12 = -1;
                                    i5 = -1;
                                }
                                i18 = i5;
                                i11 = -1;
                            }
                            while (i12 != i18) {
                                int i19 = i12 + i11;
                                int i21 = i19 / i14;
                                int i22 = i19 % i14;
                                int i23 = folderPagedView.f21138c0;
                                int i24 = i22 % i23;
                                int i25 = i22 / i23;
                                CellLayout cellLayout = (CellLayout) folderPagedView.getChildAt(i21);
                                View viewA = cellLayout.P.a(i24, i25);
                                if (viewA != null && (viewA.getTag() instanceof ga.j)) {
                                    if (iG != i21) {
                                        cellLayout.removeView(viewA);
                                        folderPagedView.t0(viewA, (ga.j) viewA.getTag(), i12);
                                    } else {
                                        y9.s sVar = new y9.s(folderPagedView, viewA, viewA.getTranslationX(), i12);
                                        viewA.animate().translationXBy((i11 > 0) ^ folderPagedView.T ? -viewA.getWidth() : viewA.getWidth()).setDuration(230L).setStartDelay(0L).withEndAction(sVar);
                                        folderPagedView.V.put(viewA, sVar);
                                    }
                                }
                                i12 = i19;
                            }
                            if ((i15 - i16) * i11 > 0) {
                                CellLayout cellLayout2 = (CellLayout) folderPagedView.getChildAt(iG);
                                float f11 = 30.0f;
                                int i26 = 0;
                                while (i16 != i15) {
                                    int i27 = i16 + i11;
                                    int i28 = folderPagedView.f21138c0;
                                    View viewA2 = cellLayout2.P.a(i27 % i28, i27 / i28);
                                    int i29 = folderPagedView.f21138c0;
                                    CellLayout cellLayout3 = cellLayout2;
                                    boolean zB = cellLayout3.b(viewA2, i16 % i29, i16 / i29, 230, i26, true, true);
                                    int i31 = i26;
                                    if (zB) {
                                        int i32 = (int) (i31 + f11);
                                        f11 *= 0.9f;
                                        i26 = i32;
                                    } else {
                                        i26 = i31;
                                    }
                                    i16 = i27;
                                    cellLayout2 = cellLayout3;
                                }
                            }
                        }
                    }
                    folder.f21124x = folder.f21122v;
                    break;
                }
                break;
            default:
                FolderIcon folderIcon = (FolderIcon) this.f33136b;
                Folder folder2 = folderIcon.H;
                folder2.f21116p = folderIcon;
                folder2.D = true;
                folder2.E = true;
                folder2.f21114l.a(folder2);
                ArrayList arrayList = new ArrayList(folder2.f21115m.H);
                folder2.f21124x = arrayList.size();
                arrayList.add(null);
                folder2.U(folder2.f21124x / folder2.f21117q.W.f96946d, arrayList, true);
                break;
        }
    }

    @Override // com.vungle.ads.BidTokenCallback
    public void onBidTokenCollected(String str) {
        ((ai.x0) ((gg.b) this.f33136b)).onSuccess(str);
    }

    @Override // com.vungle.ads.BidTokenCallback
    public void onBidTokenError(String str) {
        bg.a aVar = new bg.a(108, "Liftoff Monetize returned an empty bid token.", VungleMediationAdapter.ERROR_DOMAIN);
        Log.w(VungleMediationAdapter.TAG, aVar.toString());
        ((ai.x0) ((gg.b) this.f33136b)).onFailure(aVar);
    }

    @Override // fi.e
    public void onComplete(Task task) {
        t70.m mVar = (t70.m) this.f33136b;
        Exception excL = task.l();
        if (excL != null) {
            int i5 = Result.f71687b;
            mVar.resumeWith(ResultKt.a(excL));
        } else if (task.o()) {
            mVar.a(null);
        } else {
            int i11 = Result.f71687b;
            mVar.resumeWith(task.m());
        }
    }

    public synchronized ArrayList p(Context context) {
        ArrayList arrayList;
        String str;
        try {
            arrayList = new ArrayList();
            LocaleList locales = context.getResources().getConfiguration().getLocales();
            int size = locales.size();
            Locale locale = size == 0 ? Locale.ENGLISH : locales.get(0);
            AlphabeticIndex alphabeticIndex = new AlphabeticIndex(locale);
            for (int i5 = 1; i5 < size; i5++) {
                alphabeticIndex.addLabels(locales.get(i5));
            }
            alphabeticIndex.addLabels(Locale.ENGLISH);
            AlphabeticIndex.ImmutableIndex immutableIndexBuildImmutableIndex = alphabeticIndex.buildImmutableIndex();
            String str2 = locale.getLanguage().equals(Locale.JAPANESE.getLanguage()) ? "他" : "∙";
            for (Map.Entry entry : ((HashMap) this.f33136b).entrySet()) {
                ga.h hVar = (ga.h) entry.getKey();
                List list = (List) entry.getValue();
                if ("com.teslacoilsw.launcher".equals(hVar.f57319x)) {
                    str = ":NOVA:";
                } else {
                    CharSequence charSequence = hVar.f57300l;
                    if (charSequence == null) {
                        str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                    } else {
                        String strW = o9.g3.w(charSequence);
                        String label = immutableIndexBuildImmutableIndex.getBucket(immutableIndexBuildImmutableIndex.getBucketIndex(strW)).getLabel();
                        if ((o9.g3.w(label).isEmpty() || "…".equals(label)) && strW.length() > 0) {
                            int iCodePointAt = strW.codePointAt(0);
                            label = Character.isDigit(iCodePointAt) ? "#" : Character.isLetter(iCodePointAt) ? str2 : "∙";
                        }
                        str = label;
                    }
                }
                arrayList.add(new db.f(hVar, str, list, false));
                arrayList.add(new db.d(hVar, str, list, 0));
            }
        } catch (Throwable th2) {
            throw th2;
        }
        return arrayList;
    }

    public boolean q(int i5) {
        if (i5 < 0) {
            return false;
        }
        c30.c cVar = (c30.c) this.f33136b;
        if (i5 >= cVar.f19532b) {
            return false;
        }
        n0.f fVarI = cVar.i(i5);
        Function1 function1 = ((o0.d) fVarI.f77413c).f78725c;
        return function1 != null && function1.invoke(Integer.valueOf(i5 - fVarI.f77411a)) == o0.b0.f78718a;
    }

    public void s(View view, int i5, boolean z11) {
        if (Build.VERSION.SDK_INT >= 27) {
            t2.c.G(i5, view, (AutofillManager) this.f33136b, z11);
        }
    }

    public void t(int i5, Object obj) {
        String str;
        switch (i5) {
            case 1:
                str = "RESULT_INSTALL_SUCCESS";
                break;
            case 2:
                str = "RESULT_ALREADY_INSTALLED";
                break;
            case 3:
                str = "RESULT_UNSUPPORTED_ART_VERSION";
                break;
            case 4:
                str = "RESULT_NOT_WRITABLE";
                break;
            case 5:
                str = "RESULT_DESIRED_FORMAT_UNSUPPORTED";
                break;
            case 6:
                str = "RESULT_BASELINE_PROFILE_NOT_FOUND";
                break;
            case 7:
                str = "RESULT_IO_EXCEPTION";
                break;
            case 8:
                str = "RESULT_PARSE_EXCEPTION";
                break;
            case 9:
            default:
                str = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                break;
            case 10:
                str = "RESULT_INSTALL_SKIP_FILE_SUCCESS";
                break;
            case 11:
                str = "RESULT_DELETE_SKIP_FILE_SUCCESS";
                break;
        }
        if (i5 == 6 || i5 == 7 || i5 == 8) {
            Log.e("ProfileInstaller", str, (Throwable) obj);
        }
        ((ProfileInstallReceiver) this.f33136b).setResultCode(i5);
    }

    @Override // fi.c
    public Object then(Task task) {
        hh.d dVar = (hh.d) this.f33136b;
        if (task.q() || task.o()) {
            return task;
        }
        Exception excL = task.l();
        if (!(excL instanceof ApiException)) {
            return task;
        }
        int iA = ((ApiException) excL).a();
        return (iA == 43001 || iA == 43002 || iA == 43003 || iA == 17) ? ((hh.d) dVar.f59859c).getAppSetIdInfo() : iA == 43000 ? Tasks.c(new Exception("Failed to get app set ID due to an internal error. Please try again later.")) : iA != 15 ? task : Tasks.c(new Exception("The operation to get app set ID timed out. Please try again later."));
    }

    public String toString() {
        switch (this.f33135a) {
            case 2:
                return ((b3.q2) this.f33136b).toString();
            default:
                return super.toString();
        }
    }

    @Override // z8.b
    public void u(Drawable drawable) {
    }

    public e1.m0 w(og.i iVar, AndroidComposeView androidComposeView) {
        long jC;
        boolean zA;
        long jMo54screenToLocalMKHz9U;
        z.v vVar = (z.v) this.f33136b;
        z.v vVar2 = new z.v(iVar.l().size());
        List listL = iVar.l();
        int size = listL.size();
        for (int i5 = 0; i5 < size; i5++) {
            v2.v vVar3 = (v2.v) listL.get(i5);
            v2.u uVar = (v2.u) vVar.c(vVar3.c());
            if (uVar == null) {
                zA = false;
                jC = vVar3.j();
                jMo54screenToLocalMKHz9U = vVar3.e();
            } else {
                jC = uVar.c();
                zA = uVar.a();
                jMo54screenToLocalMKHz9U = androidComposeView.mo54screenToLocalMKHz9U(uVar.b());
            }
            vVar2.e(vVar3.c(), new v2.t(vVar3.c(), vVar3.j(), vVar3.e(), vVar3.a(), vVar3.g(), jC, jMo54screenToLocalMKHz9U, zA, vVar3.i(), vVar3.b(), vVar3.h(), vVar3.d()));
            if (vVar3.a()) {
                vVar.e(vVar3.c(), new v2.u(vVar3.j(), vVar3.f(), vVar3.a()));
            } else {
                vVar.f(vVar3.c());
            }
        }
        return new e1.m0(10, vVar2, iVar);
    }

    public int y(int i5) {
        byte[] bArr = (byte[]) this.f33136b;
        int i11 = (bArr[i5 + 3] << 24) | (bArr[i5] & 255) | ((bArr[i5 + 1] & 255) << 8) | ((bArr[i5 + 2] & 255) << 16);
        if (i11 >= 0) {
            return i11;
        }
        throw new ExceptionWithContext(null, "Encountered small uint that is out of range at offset 0x%x", Integer.valueOf(i5));
    }

    public int z(int i5) {
        byte[] bArr = (byte[]) this.f33136b;
        return ((bArr[i5 + 1] & 255) << 8) | (bArr[i5] & 255);
    }

    @Override // com.google.android.gms.internal.consent_sdk.m7
    public /* bridge */ /* synthetic */ Object zzb() {
        return new com.google.android.gms.internal.consent_sdk.e((com.google.android.gms.internal.consent_sdk.d) ((com.google.android.gms.internal.consent_sdk.d) this.f33136b).f32026a);
    }

    public v6(int i5) {
        this.f33135a = i5;
        switch (i5) {
            case 2:
                this.f33136b = new b3.q2();
                break;
            case 3:
                this.f33136b = new LinkedHashSet();
                break;
            case 8:
                this.f33136b = new HashMap();
                break;
            case 10:
                this.f33136b = new r1.e(new g0.f[16]);
                break;
            case 16:
                break;
            case 18:
                this.f33136b = new Animator[0];
                break;
            case 21:
                this.f33136b = new z.v((Object) null);
                break;
            case 28:
                this.f33136b = "apps_to_install.xml";
                break;
            default:
                this.f33136b = new CopyOnWriteArrayList();
                break;
        }
    }

    public v6(int i5, long j11) {
        this.f33135a = 24;
        TimeUnit timeUnit = TimeUnit.MINUTES;
        Intrinsics.g(timeUnit, "timeUnit");
        this.f33136b = new b90.n(a90.e.f524i, i5, j11);
    }

    public v6(View view) {
        this.f33135a = 1;
        if (Build.VERSION.SDK_INT >= 30) {
            a5.i0 i0Var = new a5.i0(view);
            i0Var.f298b = view;
            this.f33136b = i0Var;
            return;
        }
        this.f33136b = new a5.e0(view);
    }

    public v6(v7.j trackers) {
        this.f33135a = 19;
        Intrinsics.g(trackers, "trackers");
        u7.a aVar = new u7.a(trackers.f92137a, 0);
        u7.a aVar2 = new u7.a(trackers.f92138b);
        u7.a aVar3 = new u7.a(trackers.f92140d, 4);
        v7.e eVar = trackers.f92139c;
        List controllers = ul.b.Q(aVar, aVar2, aVar3, new u7.a(eVar, 2), new u7.a(eVar, 3), new u7.e(eVar), new u7.d(eVar));
        Intrinsics.g(controllers, "controllers");
        this.f33136b = controllers;
    }
}
