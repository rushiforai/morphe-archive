package defpackage;

import android.animation.ObjectAnimator;
import android.animation.PropertyValuesHolder;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Path;
import android.graphics.PathMeasure;
import android.os.Build;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.InflateException;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import androidx.core.widget.nRCC.nGxjfIr;
import androidx.credentials.exceptions.CreateCredentialCancellationException;
import androidx.credentials.exceptions.CreateCredentialCustomException;
import androidx.credentials.exceptions.CreateCredentialException;
import androidx.credentials.exceptions.CreateCredentialInterruptedException;
import androidx.credentials.exceptions.CreateCredentialNoCreateOptionException;
import androidx.credentials.exceptions.CreateCredentialProviderConfigurationException;
import androidx.credentials.exceptions.CreateCredentialUnknownException;
import androidx.credentials.exceptions.CreateCredentialUnsupportedException;
import androidx.credentials.exceptions.GetCredentialCancellationException;
import androidx.credentials.exceptions.GetCredentialCustomException;
import androidx.credentials.exceptions.GetCredentialException;
import androidx.credentials.exceptions.GetCredentialInterruptedException;
import androidx.credentials.exceptions.GetCredentialProviderConfigurationException;
import androidx.credentials.exceptions.GetCredentialUnknownException;
import androidx.credentials.exceptions.GetCredentialUnsupportedException;
import androidx.credentials.exceptions.NoCredentialException;
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialDomException;
import androidx.credentials.exceptions.publickeycredential.CreatePublicKeyCredentialException;
import androidx.credentials.exceptions.publickeycredential.GetPublicKeyCredentialDomException;
import androidx.credentials.exceptions.publickeycredential.GetPublicKeyCredentialException;
import androidx.credentials.internal.FrameworkClassParsingException;
import com.drew.lang.RandomAccessStreamReader;
import com.drew.metadata.exif.ExifDirectoryBase;
import com.drew.metadata.exif.makernotes.OlympusMakernoteDirectory;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxUltraFireMakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.medium.android.data.settings.NotificationNetwork;
import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;
import com.medium.reader.R;
import com.medium.refinerecommendations.RefineRecommendationsFilter;
import java.io.IOException;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicLong;
import org.xmlpull.v1.XmlPullParser;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public abstract class qb8 {
    public static final no3 d;
    public static final zi5 e;
    public static final /* synthetic */ int q = 0;
    public static final /* synthetic */ int r = 0;
    public static final /* synthetic */ int s = 0;
    public static final /* synthetic */ int t = 0;
    public static final int u = 9;
    public static final int v = 10;
    public static final int w = 12;
    public static final /* synthetic */ int x = 0;
    public static final fa4 a = new fa4(12);
    public static final xsa b = new xsa(11);
    public static final rz5 c = new rz5(12);
    public static final dq1 f = new dq1(12);
    public static final uob g = new uob(11);
    public static final mz1 h = new mz1(new p02(23), false, 1465943507);
    public static final mz1 i = new mz1(new c02(13), false, -2068855996);
    public static final mz1 j = new mz1(new c02(14), false, -1905785668);
    public static final mz1 k = new mz1(new n02(17), false, 833241747);
    public static final mz1 l = new mz1(new n02(18), false, 1403513553);
    public static final mz1 m = new mz1(new m02(19), false, -1005517045);
    public static final qo0 n = new qo0();
    public static final d1g o = new d1g(16, "NO_OWNER", false);
    public static final hl4 p = new hl4(0);

    static {
        int i2 = 11;
        d = new no3(i2);
        e = new zi5(i2);
    }

    public static boolean A(b72 b72Var) {
        a72 a72Var;
        a72 a72Var2;
        a72[] a72VarArr = b72Var.U;
        a72 a72Var3 = a72VarArr[0];
        a72 a72Var4 = a72VarArr[1];
        c72 c72Var = b72Var.V;
        if (c72Var == null) {
            c72Var = null;
        }
        if (c72Var != null) {
            a72 a72Var5 = c72Var.U[0];
            a72 a72Var6 = a72.FIXED;
        }
        if (c72Var != null) {
            a72 a72Var7 = c72Var.U[1];
            a72 a72Var8 = a72.FIXED;
        }
        a72 a72Var9 = a72.FIXED;
        boolean z = a72Var3 == a72Var9 || b72Var.B() || a72Var3 == a72.WRAP_CONTENT || (a72Var3 == (a72Var2 = a72.MATCH_CONSTRAINT) && b72Var.s == 0 && b72Var.Y == 0.0f && b72Var.u(0)) || (a72Var3 == a72Var2 && b72Var.s == 1 && b72Var.v(0, b72Var.r()));
        boolean z2 = a72Var4 == a72Var9 || b72Var.C() || a72Var4 == a72.WRAP_CONTENT || (a72Var4 == (a72Var = a72.MATCH_CONSTRAINT) && b72Var.t == 0 && b72Var.Y == 0.0f && b72Var.u(1)) || (a72Var4 == a72Var && b72Var.t == 1 && b72Var.v(1, b72Var.l()));
        return (b72Var.Y > 0.0f && (z || z2)) || (z && z2);
    }

    public static byte[] B(ArrayDeque arrayDeque, int i2) {
        if (arrayDeque.isEmpty()) {
            return new byte[0];
        }
        byte[] bArr = (byte[]) arrayDeque.remove();
        if (bArr.length == i2) {
            return bArr;
        }
        int length = i2 - bArr.length;
        byte[] bArrCopyOf = Arrays.copyOf(bArr, i2);
        while (length > 0) {
            byte[] bArr2 = (byte[]) arrayDeque.remove();
            int iMin = Math.min(length, bArr2.length);
            System.arraycopy(bArr2, 0, bArrCopyOf, i2 - length, iMin);
            length -= iMin;
        }
        return bArrCopyOf;
    }

    public static PropertyValuesHolder F(TypedArray typedArray, int i2, int i3, int i4, String str) {
        PropertyValuesHolder propertyValuesHolderOfFloat;
        TypedValue typedValuePeekValue = typedArray.peekValue(i3);
        boolean z = typedValuePeekValue != null;
        int i5 = z ? typedValuePeekValue.type : 0;
        TypedValue typedValuePeekValue2 = typedArray.peekValue(i4);
        boolean z2 = typedValuePeekValue2 != null;
        int i6 = z2 ? typedValuePeekValue2.type : 0;
        if (i2 == 4) {
            i2 = ((z && J(i5)) || (z2 && J(i6))) ? 3 : 0;
        }
        boolean z3 = i2 == 0;
        PropertyValuesHolder propertyValuesHolderOfInt = null;
        if (i2 == 2) {
            String string = typedArray.getString(i3);
            String string2 = typedArray.getString(i4);
            i69[] i69VarArrM = wo7.m(string);
            i69[] i69VarArrM2 = wo7.m(string2);
            if (i69VarArrM != null || i69VarArrM2 != null) {
                if (i69VarArrM != null) {
                    fx fxVar = new fx();
                    if (i69VarArrM2 == null) {
                        return PropertyValuesHolder.ofObject(str, fxVar, i69VarArrM);
                    }
                    if (wo7.j(i69VarArrM, i69VarArrM2)) {
                        return PropertyValuesHolder.ofObject(str, fxVar, i69VarArrM, i69VarArrM2);
                    }
                    throw new InflateException(lv8.r(" Can't morph from ", string, " to ", string2));
                }
                if (i69VarArrM2 != null) {
                    return PropertyValuesHolder.ofObject(str, new fx(), i69VarArrM2);
                }
            }
            return null;
        }
        d70 d70Var = i2 == 3 ? d70.a : null;
        if (z3) {
            if (z) {
                float dimension = i5 == 5 ? typedArray.getDimension(i3, 0.0f) : typedArray.getFloat(i3, 0.0f);
                if (z2) {
                    propertyValuesHolderOfFloat = PropertyValuesHolder.ofFloat(str, dimension, i6 == 5 ? typedArray.getDimension(i4, 0.0f) : typedArray.getFloat(i4, 0.0f));
                } else {
                    propertyValuesHolderOfFloat = PropertyValuesHolder.ofFloat(str, dimension);
                }
            } else {
                propertyValuesHolderOfFloat = PropertyValuesHolder.ofFloat(str, i6 == 5 ? typedArray.getDimension(i4, 0.0f) : typedArray.getFloat(i4, 0.0f));
            }
            propertyValuesHolderOfInt = propertyValuesHolderOfFloat;
        } else if (z) {
            int dimension2 = i5 == 5 ? (int) typedArray.getDimension(i3, 0.0f) : J(i5) ? typedArray.getColor(i3, 0) : typedArray.getInt(i3, 0);
            if (z2) {
                propertyValuesHolderOfInt = PropertyValuesHolder.ofInt(str, dimension2, i6 == 5 ? (int) typedArray.getDimension(i4, 0.0f) : J(i6) ? typedArray.getColor(i4, 0) : typedArray.getInt(i4, 0));
            } else {
                propertyValuesHolderOfInt = PropertyValuesHolder.ofInt(str, dimension2);
            }
        } else if (z2) {
            propertyValuesHolderOfInt = PropertyValuesHolder.ofInt(str, i6 == 5 ? (int) typedArray.getDimension(i4, 0.0f) : J(i6) ? typedArray.getColor(i4, 0) : typedArray.getInt(i4, 0));
        }
        if (propertyValuesHolderOfInt != null && d70Var != null) {
            propertyValuesHolderOfInt.setEvaluator(d70Var);
        }
        return propertyValuesHolderOfInt;
    }

    public static Object G(Intent intent, String str, Class cls) {
        if (Build.VERSION.SDK_INT >= 34) {
            return v4.k(intent, str, cls);
        }
        Parcelable parcelableExtra = intent.getParcelableExtra(str);
        if (cls.isInstance(parcelableExtra)) {
            return parcelableExtra;
        }
        return null;
    }

    public static void H(int i2, ro0 ro0Var, b72 b72Var, boolean z) {
        l52 l52Var;
        l52 l52Var2;
        char c2;
        l52 l52Var3;
        l52 l52Var4;
        if (b72Var.n) {
            return;
        }
        if (!(b72Var instanceof c72) && b72Var.A() && A(b72Var)) {
            c72.b0(b72Var, ro0Var, new qo0());
        }
        l52 l52VarJ = b72Var.j(k52.LEFT);
        l52 l52VarJ2 = b72Var.j(k52.RIGHT);
        int iD = l52VarJ.d();
        int iD2 = l52VarJ2.d();
        HashSet<l52> hashSet = l52VarJ.a;
        if (hashSet != null && l52VarJ.c) {
            for (l52 l52Var5 : hashSet) {
                b72 b72Var2 = l52Var5.d;
                int i3 = i2 + 1;
                boolean zA = A(b72Var2);
                l52 l52Var6 = b72Var2.J;
                l52 l52Var7 = b72Var2.L;
                if (b72Var2.A() && zA) {
                    c2 = 0;
                    c72.b0(b72Var2, ro0Var, new qo0());
                } else {
                    c2 = 0;
                }
                char c3 = ((l52Var5 == l52Var6 && (l52Var4 = l52Var7.f) != null && l52Var4.c) || (l52Var5 == l52Var7 && (l52Var3 = l52Var6.f) != null && l52Var3.c)) ? (char) 1 : c2;
                a72 a72Var = b72Var2.U[c2];
                a72 a72Var2 = a72.MATCH_CONSTRAINT;
                if (a72Var != a72Var2 || zA) {
                    if (!b72Var2.A()) {
                        if (l52Var5 == l52Var6 && l52Var7.f == null) {
                            int iE = l52Var6.e() + iD;
                            b72Var2.L(iE, b72Var2.r() + iE);
                            H(i3, ro0Var, b72Var2, z);
                        } else if (l52Var5 == l52Var7 && l52Var6.f == null) {
                            int iE2 = iD - l52Var7.e();
                            b72Var2.L(iE2 - b72Var2.r(), iE2);
                            H(i3, ro0Var, b72Var2, z);
                        } else if (c3 != 0 && !b72Var2.y()) {
                            W(i3, ro0Var, b72Var2, z);
                        }
                    }
                } else if (a72Var == a72Var2 && b72Var2.w >= 0 && b72Var2.v >= 0 && (b72Var2.i0 == 8 || (b72Var2.s == 0 && b72Var2.Y == 0.0f))) {
                    if (!b72Var2.y() && !b72Var2.G && c3 != 0 && !b72Var2.y()) {
                        X(i3, b72Var, ro0Var, b72Var2, z);
                    }
                }
            }
        }
        if (b72Var instanceof sh5) {
            return;
        }
        HashSet<l52> hashSet2 = l52VarJ2.a;
        if (hashSet2 != null && l52VarJ2.c) {
            for (l52 l52Var8 : hashSet2) {
                b72 b72Var3 = l52Var8.d;
                int i4 = i2 + 1;
                boolean zA2 = A(b72Var3);
                l52 l52Var9 = b72Var3.J;
                l52 l52Var10 = b72Var3.L;
                if (b72Var3.A() && zA2) {
                    c72.b0(b72Var3, ro0Var, new qo0());
                }
                boolean z2 = (l52Var8 == l52Var9 && (l52Var2 = l52Var10.f) != null && l52Var2.c) || (l52Var8 == l52Var10 && (l52Var = l52Var9.f) != null && l52Var.c);
                a72 a72Var3 = b72Var3.U[0];
                a72 a72Var4 = a72.MATCH_CONSTRAINT;
                if (a72Var3 != a72Var4 || zA2) {
                    if (!b72Var3.A()) {
                        if (l52Var8 == l52Var9 && l52Var10.f == null) {
                            int iE3 = l52Var9.e() + iD2;
                            b72Var3.L(iE3, b72Var3.r() + iE3);
                            H(i4, ro0Var, b72Var3, z);
                        } else if (l52Var8 == l52Var10 && l52Var9.f == null) {
                            int iE4 = iD2 - l52Var10.e();
                            b72Var3.L(iE4 - b72Var3.r(), iE4);
                            H(i4, ro0Var, b72Var3, z);
                        } else if (z2 && !b72Var3.y()) {
                            W(i4, ro0Var, b72Var3, z);
                        }
                    }
                } else if (a72Var3 == a72Var4 && b72Var3.w >= 0 && b72Var3.v >= 0) {
                    if (b72Var3.i0 == 8 || (b72Var3.s == 0 && b72Var3.Y == 0.0f)) {
                        if (!b72Var3.y() && !b72Var3.G && z2 && !b72Var3.y()) {
                            X(i4, b72Var, ro0Var, b72Var3, z);
                        }
                    }
                }
            }
        }
        b72Var.n = true;
    }

    public static boolean J(int i2) {
        return i2 >= 28 && i2 <= 31;
    }

    public static final void L(ai6 ai6Var) {
        cm4.p.getClass();
        g04 entries = zu7.getEntries();
        g04 entries2 = zu7.getEntries();
        ArrayList arrayList = new ArrayList(cu1.k0(entries2, 10));
        Iterator<E> it2 = entries2.iterator();
        while (it2.hasNext()) {
            arrayList.add(((zu7) it2.next()).getFlag$kotlin_metadata());
        }
        entries.getClass();
    }

    public static final ku3 M(ai6 ai6Var) {
        yl4 yl4Var = cm4.e;
        yl4Var.getClass();
        g04 entries = b28.getEntries();
        g04 entries2 = b28.getEntries();
        ArrayList arrayList = new ArrayList(cu1.k0(entries2, 10));
        Iterator<E> it2 = entries2.iterator();
        while (it2.hasNext()) {
            arrayList.add(((b28) it2.next()).getFlag$kotlin_metadata());
        }
        return new ku3(ai6Var, yl4Var, entries, arrayList);
    }

    public static void N(int i2, int[] iArr, int[] iArr2, boolean z) {
        int i3 = 0;
        int i4 = 0;
        for (int i5 : iArr) {
            i4 += i5;
        }
        float f2 = (i2 - i4) / 2.0f;
        if (!z) {
            int length = iArr.length;
            int i6 = 0;
            while (i3 < length) {
                int i7 = iArr[i3];
                iArr2[i6] = Math.round(f2);
                f2 += i7;
                i3++;
                i6++;
            }
            return;
        }
        int length2 = iArr.length;
        while (true) {
            length2--;
            if (-1 >= length2) {
                return;
            }
            int i8 = iArr[length2];
            iArr2[length2] = Math.round(f2);
            f2 += i8;
        }
    }

    public static void O(int i2, int[] iArr, int[] iArr2, boolean z) {
        int i3 = 0;
        int i4 = 0;
        for (int i5 : iArr) {
            i4 += i5;
        }
        float length = iArr.length == 0 ? 0.0f : (i2 - i4) / iArr.length;
        float f2 = length / 2.0f;
        if (!z) {
            int length2 = iArr.length;
            int i6 = 0;
            while (i3 < length2) {
                int i7 = iArr[i3];
                iArr2[i6] = Math.round(f2);
                f2 += i7 + length;
                i3++;
                i6++;
            }
            return;
        }
        int length3 = iArr.length;
        while (true) {
            length3--;
            if (-1 >= length3) {
                return;
            }
            int i8 = iArr[length3];
            iArr2[length3] = Math.round(f2);
            f2 += i8 + length;
        }
    }

    public static void P(int i2, int[] iArr, int[] iArr2, boolean z) {
        if (iArr.length == 0) {
            return;
        }
        int i3 = 0;
        int i4 = 0;
        for (int i5 : iArr) {
            i4 += i5;
        }
        float fMax = (i2 - i4) / Math.max(iArr.length - 1, 1);
        float f2 = (z && iArr.length == 1) ? fMax : 0.0f;
        if (z) {
            for (int length = iArr.length - 1; -1 < length; length--) {
                int i6 = iArr[length];
                iArr2[length] = Math.round(f2);
                f2 += i6 + fMax;
            }
            return;
        }
        int length2 = iArr.length;
        int i7 = 0;
        while (i3 < length2) {
            int i8 = iArr[i3];
            iArr2[i7] = Math.round(f2);
            f2 += i8 + fMax;
            i3++;
            i7++;
        }
    }

    public static void Q(AtomicLong atomicLong, long j2) {
        long j3;
        long j4;
        do {
            j3 = atomicLong.get();
            if (j3 == Long.MAX_VALUE) {
                return;
            }
            j4 = j3 - j2;
            if (j4 < 0) {
                ok7.H(new IllegalStateException(ho2.D(j4, "More produced than requested: ")));
                j4 = 0;
            }
        } while (!atomicLong.compareAndSet(j3, j4));
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object R(defpackage.nhc r7, android.content.res.Resources r8, defpackage.we1 r9, defpackage.n92 r10) {
        /*
            boolean r0 = r10 instanceof defpackage.gg1
            if (r0 == 0) goto L14
            r0 = r10
            gg1 r0 = (defpackage.gg1) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r5 = r0
            goto L1a
        L14:
            gg1 r0 = new gg1
            r0.<init>(r10)
            goto L12
        L1a:
            java.lang.Object r10 = r5.c
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.d
            r2 = 1
            if (r1 == 0) goto L32
            if (r1 != r2) goto L2b
            we1 r9 = r5.b
            defpackage.br7.v(r10)
            goto L56
        L2b:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L32:
            defpackage.br7.v(r10)
            r10 = 2132017398(0x7f1400f6, float:1.9673073E38)
            java.lang.String r10 = r8.getString(r10)
            r10.getClass()
            r1 = 2132017504(0x7f140160, float:1.9673288E38)
            java.lang.String r3 = r8.getString(r1)
            bhc r4 = defpackage.bhc.Long
            r5.b = r9
            r5.d = r2
            r6 = 4
            r1 = r7
            r2 = r10
            java.lang.Object r10 = defpackage.nhc.c(r1, r2, r3, r4, r5, r6)
            if (r10 != r0) goto L56
            return r0
        L56:
            aic r10 = (defpackage.aic) r10
            aic r7 = defpackage.aic.ActionPerformed
            if (r10 != r7) goto L5f
            r9.invoke()
        L5f:
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qb8.R(nhc, android.content.res.Resources, we1, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object S(defpackage.nhc r7, android.content.res.Resources r8, defpackage.we1 r9, defpackage.n92 r10) {
        /*
            boolean r0 = r10 instanceof defpackage.hg1
            if (r0 == 0) goto L14
            r0 = r10
            hg1 r0 = (defpackage.hg1) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r5 = r0
            goto L1a
        L14:
            hg1 r0 = new hg1
            r0.<init>(r10)
            goto L12
        L1a:
            java.lang.Object r10 = r5.c
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.d
            r2 = 1
            if (r1 == 0) goto L32
            if (r1 != r2) goto L2b
            we1 r9 = r5.b
            defpackage.br7.v(r10)
            goto L56
        L2b:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L32:
            defpackage.br7.v(r10)
            r10 = 2132017399(0x7f1400f7, float:1.9673075E38)
            java.lang.String r10 = r8.getString(r10)
            r10.getClass()
            r1 = 2132017539(0x7f140183, float:1.967336E38)
            java.lang.String r3 = r8.getString(r1)
            bhc r4 = defpackage.bhc.Short
            r5.b = r9
            r5.d = r2
            r6 = 4
            r1 = r7
            r2 = r10
            java.lang.Object r10 = defpackage.nhc.c(r1, r2, r3, r4, r5, r6)
            if (r10 != r0) goto L56
            return r0
        L56:
            aic r10 = (defpackage.aic) r10
            aic r7 = defpackage.aic.ActionPerformed
            if (r10 != r7) goto L5f
            r9.invoke()
        L5f:
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qb8.S(nhc, android.content.res.Resources, we1, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object T(defpackage.nhc r7, android.content.res.Resources r8, defpackage.we1 r9, defpackage.n92 r10) {
        /*
            boolean r0 = r10 instanceof defpackage.ig1
            if (r0 == 0) goto L14
            r0 = r10
            ig1 r0 = (defpackage.ig1) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r5 = r0
            goto L1a
        L14:
            ig1 r0 = new ig1
            r0.<init>(r10)
            goto L12
        L1a:
            java.lang.Object r10 = r5.c
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.d
            r2 = 1
            if (r1 == 0) goto L32
            if (r1 != r2) goto L2b
            we1 r9 = r5.b
            defpackage.br7.v(r10)
            goto L56
        L2b:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L32:
            defpackage.br7.v(r10)
            r10 = 2132017549(0x7f14018d, float:1.967338E38)
            java.lang.String r10 = r8.getString(r10)
            r10.getClass()
            r1 = 2132017504(0x7f140160, float:1.9673288E38)
            java.lang.String r3 = r8.getString(r1)
            bhc r4 = defpackage.bhc.Long
            r5.b = r9
            r5.d = r2
            r6 = 4
            r1 = r7
            r2 = r10
            java.lang.Object r10 = defpackage.nhc.c(r1, r2, r3, r4, r5, r6)
            if (r10 != r0) goto L56
            return r0
        L56:
            aic r10 = (defpackage.aic) r10
            aic r7 = defpackage.aic.ActionPerformed
            if (r10 != r7) goto L5f
            r9.invoke()
        L5f:
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qb8.T(nhc, android.content.res.Resources, we1, n92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final java.lang.Object U(defpackage.nhc r7, android.content.res.Resources r8, defpackage.we1 r9, defpackage.n92 r10) {
        /*
            boolean r0 = r10 instanceof defpackage.jg1
            if (r0 == 0) goto L14
            r0 = r10
            jg1 r0 = (defpackage.jg1) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.d = r1
        L12:
            r5 = r0
            goto L1a
        L14:
            jg1 r0 = new jg1
            r0.<init>(r10)
            goto L12
        L1a:
            java.lang.Object r10 = r5.c
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r5.d
            r2 = 1
            if (r1 == 0) goto L32
            if (r1 != r2) goto L2b
            we1 r9 = r5.b
            defpackage.br7.v(r10)
            goto L56
        L2b:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            r7 = 0
            return r7
        L32:
            defpackage.br7.v(r10)
            r10 = 2132017550(0x7f14018e, float:1.9673382E38)
            java.lang.String r10 = r8.getString(r10)
            r10.getClass()
            r1 = 2132017539(0x7f140183, float:1.967336E38)
            java.lang.String r3 = r8.getString(r1)
            bhc r4 = defpackage.bhc.Short
            r5.b = r9
            r5.d = r2
            r6 = 4
            r1 = r7
            r2 = r10
            java.lang.Object r10 = defpackage.nhc.c(r1, r2, r3, r4, r5, r6)
            if (r10 != r0) goto L56
            return r0
        L56:
            aic r10 = (defpackage.aic) r10
            aic r7 = defpackage.aic.ActionPerformed
            if (r10 != r7) goto L5f
            r9.invoke()
        L5f:
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qb8.U(nhc, android.content.res.Resources, we1, n92):java.lang.Object");
    }

    public static final ob8 V() {
        return new ob8(false, false, -1, false, false, R.anim.common_slide_in_right, R.anim.common_slide_out_left, R.anim.common_slide_in_left, R.anim.common_slide_out_right);
    }

    public static void W(int i2, ro0 ro0Var, b72 b72Var, boolean z) {
        float f2 = b72Var.f0;
        l52 l52Var = b72Var.J;
        int iD = l52Var.f.d();
        l52 l52Var2 = b72Var.L;
        int iD2 = l52Var2.f.d();
        int iE = l52Var.e() + iD;
        int iE2 = iD2 - l52Var2.e();
        if (iD == iD2) {
            f2 = 0.5f;
        } else {
            iD = iE;
            iD2 = iE2;
        }
        int iR = b72Var.r();
        int i3 = (iD2 - iD) - iR;
        if (iD > iD2) {
            i3 = (iD - iD2) - iR;
        }
        int i4 = ((int) (i3 > 0 ? (f2 * i3) + 0.5f : f2 * i3)) + iD;
        int i5 = i4 + iR;
        if (iD > iD2) {
            i5 = i4 - iR;
        }
        b72Var.L(i4, i5);
        H(i2 + 1, ro0Var, b72Var, z);
    }

    public static void X(int i2, b72 b72Var, ro0 ro0Var, b72 b72Var2, boolean z) {
        float f2 = b72Var2.f0;
        l52 l52Var = b72Var2.J;
        int iE = l52Var.e() + l52Var.f.d();
        l52 l52Var2 = b72Var2.L;
        int iD = l52Var2.f.d() - l52Var2.e();
        if (iD >= iE) {
            int iR = b72Var2.r();
            if (b72Var2.i0 != 8) {
                int i3 = b72Var2.s;
                if (i3 == 2) {
                    iR = (int) (b72Var2.f0 * 0.5f * (b72Var instanceof c72 ? b72Var.r() : b72Var.V.r()));
                } else if (i3 == 0) {
                    iR = iD - iE;
                }
                iR = Math.max(b72Var2.v, iR);
                int i4 = b72Var2.w;
                if (i4 > 0) {
                    iR = Math.min(i4, iR);
                }
            }
            int i5 = iE + ((int) ((f2 * ((iD - iE) - iR)) + 0.5f));
            b72Var2.L(i5, iR + i5);
            H(i2 + 1, ro0Var, b72Var2, z);
        }
    }

    public static void Y(int i2, ro0 ro0Var, b72 b72Var) {
        float f2 = b72Var.g0;
        l52 l52Var = b72Var.K;
        int iD = l52Var.f.d();
        l52 l52Var2 = b72Var.M;
        int iD2 = l52Var2.f.d();
        int iE = l52Var.e() + iD;
        int iE2 = iD2 - l52Var2.e();
        if (iD == iD2) {
            f2 = 0.5f;
        } else {
            iD = iE;
            iD2 = iE2;
        }
        int iL = b72Var.l();
        int i3 = (iD2 - iD) - iL;
        if (iD > iD2) {
            i3 = (iD - iD2) - iL;
        }
        int i4 = (int) (i3 > 0 ? (f2 * i3) + 0.5f : f2 * i3);
        int i5 = iD + i4;
        int i6 = i5 + iL;
        if (iD > iD2) {
            i5 = iD - i4;
            i6 = i5 - iL;
        }
        b72Var.M(i5, i6);
        f0(i2 + 1, ro0Var, b72Var);
    }

    public static void Z(int i2, b72 b72Var, ro0 ro0Var, b72 b72Var2) {
        float f2 = b72Var2.g0;
        l52 l52Var = b72Var2.K;
        int iE = l52Var.e() + l52Var.f.d();
        l52 l52Var2 = b72Var2.M;
        int iD = l52Var2.f.d() - l52Var2.e();
        if (iD >= iE) {
            int iL = b72Var2.l();
            if (b72Var2.i0 != 8) {
                int i3 = b72Var2.t;
                if (i3 == 2) {
                    iL = (int) (f2 * 0.5f * (b72Var instanceof c72 ? b72Var.l() : b72Var.V.l()));
                } else if (i3 == 0) {
                    iL = iD - iE;
                }
                iL = Math.max(b72Var2.y, iL);
                int i4 = b72Var2.z;
                if (i4 > 0) {
                    iL = Math.min(i4, iL);
                }
            }
            int i5 = iE + ((int) ((f2 * ((iD - iE) - iL)) + 0.5f));
            b72Var2.M(i5, iL + i5);
            f0(i2 + 1, ro0Var, b72Var2);
        }
    }

    public static final void a(p pVar, iaa iaaVar, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        pVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(100776817);
        int i3 = (p65Var.f(pVar) ? 4 : 2) | i2 | (p65Var.f(iaaVar) ? 32 : 16) | 384;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            o28 o28Var = o28.b;
            m40.p(w2g.F(o28Var, 12.0f, 18.0f, 12.0f, 34.0f), null, null, null, 0, 0, pxf.E(1837835756, new m(iaaVar, pVar), p65Var), p65Var, 1572864, 62);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new b45(i2, 1, pVar, iaaVar, r28Var2);
        }
    }

    public static byte[] a0(w11 w11Var) throws IOException {
        ArrayDeque arrayDeque = new ArrayDeque(20);
        int iMin = Math.min(8192, Math.max(128, Integer.highestOneBit(0) * 2));
        int i2 = 0;
        while (i2 < 2147483639) {
            int iMin2 = Math.min(iMin, 2147483639 - i2);
            byte[] bArr = new byte[iMin2];
            arrayDeque.add(bArr);
            int i3 = 0;
            while (i3 < iMin2) {
                int i4 = w11Var.read(bArr, i3, iMin2 - i3);
                if (i4 == -1) {
                    return B(arrayDeque, i2);
                }
                i3 += i4;
                i2 += i4;
            }
            long j2 = ((long) iMin) * ((long) (iMin < 4096 ? 4 : 2));
            iMin = j2 > 2147483647L ? Integer.MAX_VALUE : j2 < -2147483648L ? Integer.MIN_VALUE : (int) j2;
        }
        if (w11Var.read() == -1) {
            return B(arrayDeque, 2147483639);
        }
        throw new OutOfMemoryError("input is too large to fit in a byte array");
    }

    public static final void b(nj8 nj8Var, boolean z, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1606947556);
        int i3 = i2 | (p65Var.f(nj8Var) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarF = jfc.f(jfc.d(o28Var, 1.0f), 56.0f, 0.0f, 2);
            sn3 sn3Var = kt7.b;
            r28 r28VarN = bgf.N(w2g.D(flb.a0(r28VarF, ((zo7) p65Var.j(sn3Var)).a, rv8.r), 24.0f, 12.0f), "notification_pref_".concat(nj8Var.a));
            omb ombVarA = nmb.a(new h70(12.0f, true, new z10(21)), z46.n, p65Var, 54);
            long j4 = p65Var.T;
            int i6 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarN);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            jjd.b(vo7.R(p65Var, nj8Var.b), new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 2, false, 2, 0, null, mkd.a(((bu7) p65Var.j(jt7.c)).m, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 24960, 110588);
            p65Var = p65Var;
            hk7.b(nj8Var.c, x45Var, null, z, null, null, p65Var, ((i3 >> 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 << 6) & 7168), 52);
            b09.H(p65Var, true, true, true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(nj8Var, z, x45Var, r28Var2, i2, 5);
        }
    }

    public static final String b0(NotificationNetwork notificationNetwork, x12 x12Var) {
        p65 p65Var;
        int i2;
        int i3;
        int i4 = dqa.a[notificationNetwork.ordinal()];
        if (i4 == 1) {
            p65Var = (p65) x12Var;
            i2 = R.string.notification_settings_notification_network_all;
            i3 = 1269035158;
        } else if (i4 == 2) {
            p65Var = (p65) x12Var;
            i2 = R.string.notification_settings_notification_network_network;
            i3 = 1269038586;
        } else {
            if (i4 != 3) {
                throw ho2.L((p65) x12Var, 1269033979, false);
            }
            p65Var = (p65) x12Var;
            i2 = R.string.notification_settings_notification_network_off;
            i3 = 1269042006;
        }
        return km4.w(p65Var, i3, i2, p65Var, false);
    }

    public static final void c(int i2, long j2, x12 x12Var, r28 r28Var) {
        long j3;
        r28 r28Var2;
        long j4;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(603858381);
        int i3 = i2 | 22;
        if (p65Var.P(i3 & 1, (i3 & 19) != 18)) {
            p65Var.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                j4 = ((zo7) p65Var.j(kt7.b)).b;
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                j4 = j2;
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var3, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j5 = p65Var.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j6 = p65Var.T;
            int i6 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            wv1 wv1VarA = uv1.a(c, z46.p, p65Var, 0);
            long j7 = p65Var.T;
            int i7 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            r28 r28VarD2 = w2g.D(jfc.f(flb.a0(jfc.d(o28Var, 1.0f), ((zo7) p65Var.j(kt7.b)).a, rv8.r), 56.0f, 0.0f, 2), 24.0f, 12.0f);
            omb ombVarA = nmb.a(new h70(12.0f, true, new z10(21)), z46.n, p65Var, 54);
            long j8 = p65Var.T;
            int i8 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            long j9 = j4;
            ok7.r(Float.NaN, 48, 0, j9, p65Var, new sq6(1.0f, true), ((bu7) p65Var.j(jt7.c)).m);
            hk7.c(0, j9, p65Var, null);
            p65Var.p(true);
            tp7.c(0.0f, 0, 5, j9, p65Var, null);
            b09.H(p65Var, true, true, true);
            j3 = j9;
            r28Var2 = r28Var3;
        } else {
            p65Var.S();
            j3 = j2;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new po(r28Var2, j3, i2, 16);
        }
    }

    public static final String c0(long j2) {
        return String.format(Locale.US, "#%02x%02x%02x", Arrays.copyOf(new Object[]{Integer.valueOf((int) (uu1.g(j2) * 255.0f)), Integer.valueOf((int) (uu1.f(j2) * 255.0f)), Integer.valueOf((int) (uu1.d(j2) * 255.0f))}, 3));
    }

    public static final void d(gqa gqaVar, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1414835184);
        int i3 = i2 | (p65Var.f(gqaVar) ? 4 : 2) | (p65Var.h(x45Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            boolean z = gqaVar.b;
            r28 r28VarN = bgf.N(jfc.d(r28Var, 1.0f), "notification_settings_content");
            h70 h70Var = new h70(0.0f, true, new z10(21));
            boolean zG = ((i3 & 14) == 4) | p65Var.g(z) | ((i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
            Object objM = p65Var.M();
            if (zG || objM == w12.a) {
                objM = new rb(gqaVar, z, x45Var);
                p65Var.j0(objM);
            }
            k40.t(r28VarN, null, null, h70Var, null, null, false, null, (x45) objM, p65Var, 24576, 494);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 20, gqaVar, x45Var, r28Var);
        }
    }

    /* JADX WARN: Failed to restore switch over string. Please report as a decompilation issue */
    public static final CreateCredentialException d0(CharSequence charSequence, String str) {
        switch (str.hashCode()) {
            case -2055374133:
                if (str.equals("android.credentials.CreateCredentialException.TYPE_USER_CANCELED")) {
                    return new CreateCredentialCancellationException(charSequence);
                }
                break;
            case -1166690414:
                if (str.equals("androidx.credentials.TYPE_CREATE_CREDENTIAL_UNSUPPORTED_EXCEPTION")) {
                    return new CreateCredentialUnsupportedException(charSequence);
                }
                break;
            case -580283253:
                if (str.equals("androidx.credentials.TYPE_CREATE_CREDENTIAL_PROVIDER_CONFIGURATION_EXCEPTION")) {
                    return new CreateCredentialProviderConfigurationException(charSequence);
                }
                break;
            case 1316905704:
                if (str.equals("android.credentials.CreateCredentialException.TYPE_UNKNOWN")) {
                    return new CreateCredentialUnknownException(charSequence);
                }
                break;
            case 2092588512:
                if (str.equals("android.credentials.CreateCredentialException.TYPE_INTERRUPTED")) {
                    return new CreateCredentialInterruptedException(charSequence);
                }
                break;
            case 2131915191:
                if (str.equals("android.credentials.CreateCredentialException.TYPE_NO_CREATE_OPTIONS")) {
                    return new CreateCredentialNoCreateOptionException(charSequence);
                }
                break;
        }
        if (!tuc.N(str, "androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION", false)) {
            return new CreateCredentialCustomException(charSequence, str);
        }
        int i2 = CreatePublicKeyCredentialException.b;
        String string = charSequence != null ? charSequence.toString() : null;
        try {
            if (!muc.Q(str, "androidx.credentials.TYPE_CREATE_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION", false)) {
                throw new FrameworkClassParsingException();
            }
            int i3 = CreatePublicKeyCredentialDomException.c;
            return hlg.v(str, string);
        } catch (FrameworkClassParsingException unused) {
            return new CreateCredentialCustomException(string, str);
        }
    }

    public static final void e(oj8 oj8Var, boolean z, x45 x45Var, r28 r28Var, x12 x12Var, int i2) {
        r28 r28Var2;
        l78 l78Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1620788053);
        int i3 = i2 | (p65Var.f(oj8Var) ? 4 : 2) | (p65Var.g(z) ? 32 : 16) | (p65Var.h(x45Var) ? 256 : 128) | 3072;
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (objM == uobVar) {
                objM = qo7.u(Boolean.FALSE);
                p65Var.j0(objM);
            }
            l78 l78Var2 = (l78) objM;
            String strB0 = b0(oj8Var.c, p65Var);
            boolean z2 = !z;
            jp7 jp7Var = (jp7) p65Var.j(kt7.a);
            o28 o28Var = o28.b;
            r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarJ);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            ar0 ar0Var = z46.d;
            zk7 zk7VarC2 = dy0.c(ar0Var, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            sn3 sn3Var = kt7.b;
            r28 r28VarA0 = flb.a0(r28VarD2, ((zo7) p65Var.j(sn3Var)).a, rv8.r);
            vkb vkbVar = new vkb(0);
            Object objM2 = p65Var.M();
            int i6 = 28;
            if (objM2 == uobVar) {
                objM2 = new dq7(l78Var2, i6);
                p65Var.j0(objM2);
            }
            r28 r28VarN = bgf.N(w2g.D(hlg.r(r28VarA0, z2, null, vkbVar, (m45) objM2, 10), 24.0f, 12.0f), "notification_pref_".concat(oj8Var.a));
            wv1 wv1VarA = uv1.a(c, z46.p, p65Var, 0);
            long j4 = p65Var.T;
            int i7 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarN);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            zq0 zq0Var = z46.n;
            r28 r28VarF = jfc.f(o28Var, 40.0f, 0.0f, 2);
            omb ombVarA = nmb.a(a, zq0Var, p65Var, 48);
            long j5 = p65Var.T;
            int i8 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            String strR = vo7.R(p65Var, oj8Var.b);
            sn3 sn3Var2 = jt7.c;
            jjd.b(strR, new sq6(1.0f, true), 0L, 0L, 0L, null, null, 0L, 2, false, 2, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).m, ((zo7) p65Var.j(sn3Var)).o, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 24960, 110588);
            hp7.t(p65Var, jfc.l(o28Var, 12.0f));
            zk7 zk7VarC3 = dy0.c(ar0Var, false);
            long j6 = p65Var.T;
            int i9 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL5 = p65Var.l();
            r28 r28VarR5 = gx1.R(p65Var, o28Var);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC3);
            tp7.B(p65Var, cuVar2, i89VarL5);
            ka1.z(i9, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR5);
            r28 r28VarQ = jfc.q(o28Var, ((m73) p65Var.j(z22.h)).z(en7.B(ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER)), 0.0f, 2);
            omb ombVarA2 = nmb.a(b, zq0Var, p65Var, 54);
            long j7 = p65Var.T;
            int i10 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL6 = p65Var.l();
            r28 r28VarR6 = gx1.R(p65Var, r28VarQ);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA2);
            tp7.B(p65Var, cuVar2, i89VarL6);
            ka1.z(i10, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR6);
            jjd.b(strB0, null, 0L, 0L, 0L, null, null, 0L, 0, false, 0, 0, null, mkd.a(((bu7) p65Var.j(sn3Var2)).m, ((zo7) p65Var.j(sn3Var)).r, 0L, null, null, null, 0L, 0L, null, 0, 0L, null, null, 16777214), p65Var, 0, 0, 131070);
            qv5.b(vn7.J(R.drawable.ic_chevron_down_16, 0, p65Var), null, null, ((zo7) p65Var.j(sn3Var)).r, p65Var, 56, 4);
            p65Var.p(true);
            boolean zBooleanValue = ((Boolean) l78Var2.getValue()).booleanValue();
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                l78Var = l78Var2;
                objM3 = new dq7(l78Var, 29);
                p65Var.j0(objM3);
            } else {
                l78Var = l78Var2;
            }
            xp7.b(zBooleanValue, (m45) objM3, null, 0L, null, null, null, 0L, 0.0f, pxf.E(211843347, new gx4(oj8Var, x45Var, l78Var, 28), p65Var), p65Var, 48, 2044);
            p65Var = p65Var;
            ho2.N(p65Var, true, true, true, true);
            p65Var.p(true);
            r28Var2 = o28Var;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ov0(oj8Var, z, x45Var, r28Var2, i2, 4);
        }
    }

    public static final void f(float f2, int i2, long j2, x12 x12Var, r28 r28Var) {
        float f3;
        long j3;
        r28 r28Var2;
        float fZ;
        long j4;
        r28 r28Var3;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(216483778);
        int i3 = i2 | 150;
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            p65Var.U();
            int i4 = i2 & 1;
            o28 o28Var = o28.b;
            if (i4 == 0 || p65Var.z()) {
                fZ = ((m73) p65Var.j(z22.h)).z(en7.B(110));
                j4 = ((zo7) p65Var.j(kt7.b)).b;
                r28Var3 = o28Var;
            } else {
                p65Var.S();
                fZ = f2;
                j4 = j2;
                r28Var3 = r28Var;
            }
            p65Var.q();
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var3, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j5 = p65Var.T;
            int i5 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i5);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j6 = p65Var.T;
            int i6 = (int) (j6 ^ (j6 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            r28 r28VarD2 = w2g.D(flb.a0(jfc.d(o28Var, 1.0f), ((zo7) p65Var.j(kt7.b)).a, rv8.r), 24.0f, 12.0f);
            wv1 wv1VarA = uv1.a(c, z46.p, p65Var, 0);
            float f4 = fZ;
            r28 r28Var4 = r28Var3;
            long j7 = p65Var.T;
            int i7 = (int) (j7 ^ (j7 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i7, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            zq0 zq0Var = z46.n;
            r28 r28VarF = jfc.f(o28Var, 40.0f, 0.0f, 2);
            omb ombVarA = nmb.a(a, zq0Var, p65Var, 48);
            long j8 = p65Var.T;
            int i8 = (int) (j8 ^ (j8 >>> 32));
            i89 i89VarL4 = p65Var.l();
            r28 r28VarR4 = gx1.R(p65Var, r28VarF);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, ombVarA);
            tp7.B(p65Var, cuVar2, i89VarL4);
            ka1.z(i8, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR4);
            sn3 sn3Var = jt7.c;
            ok7.r(Float.NaN, 48, 0, j4, p65Var, new sq6(1.0f, true), ((bu7) p65Var.j(sn3Var)).m);
            ok7.r(f4, 0, 4, j4, p65Var, null, ((bu7) lv8.n(o28Var, 12.0f, p65Var, sn3Var)).m);
            hp7.t(p65Var, jfc.p(o28Var, 4.0f));
            dy0.a(flb.a0(jfc.l(o28Var, 16.0f), j4, bmb.a(4.0f)), p65Var, 0);
            p65Var.p(true);
            tp7.c(0.0f, 0, 5, j4, p65Var, null);
            b09.H(p65Var, true, true, true);
            f3 = f4;
            j3 = j4;
            r28Var2 = r28Var4;
        } else {
            p65Var.S();
            f3 = f2;
            j3 = j2;
            r28Var2 = r28Var;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new up7(r28Var2, f3, j3, i2);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void f0(int i2, ro0 ro0Var, b72 b72Var) {
        l52 l52Var;
        l52 l52Var2;
        float f2;
        l52 l52Var3;
        l52 l52Var4;
        if (b72Var.o) {
            return;
        }
        if (!(b72Var instanceof c72) && b72Var.A() && A(b72Var)) {
            c72.b0(b72Var, ro0Var, new qo0());
        }
        l52 l52VarJ = b72Var.j(k52.TOP);
        l52 l52VarJ2 = b72Var.j(k52.BOTTOM);
        int iD = l52VarJ.d();
        int iD2 = l52VarJ2.d();
        HashSet<l52> hashSet = l52VarJ.a;
        char c2 = 1;
        if (hashSet != null && l52VarJ.c) {
            for (l52 l52Var5 : hashSet) {
                b72 b72Var2 = l52Var5.d;
                int i3 = i2 + 1;
                boolean zA = A(b72Var2);
                l52 l52Var6 = b72Var2.K;
                l52 l52Var7 = b72Var2.M;
                if (b72Var2.A() && zA) {
                    f2 = 0.0f;
                    c72.b0(b72Var2, ro0Var, new qo0());
                } else {
                    f2 = 0.0f;
                }
                char c3 = ((l52Var5 == l52Var6 && (l52Var4 = l52Var7.f) != null && l52Var4.c) || (l52Var5 == l52Var7 && (l52Var3 = l52Var6.f) != null && l52Var3.c)) ? c2 : (char) 0;
                a72 a72Var = b72Var2.U[c2];
                char c4 = c2;
                a72 a72Var2 = a72.MATCH_CONSTRAINT;
                if (a72Var != a72Var2 || zA) {
                    if (!b72Var2.A()) {
                        if (l52Var5 == l52Var6 && l52Var7.f == null) {
                            int iE = l52Var6.e() + iD;
                            b72Var2.M(iE, b72Var2.l() + iE);
                            f0(i3, ro0Var, b72Var2);
                        } else if (l52Var5 == l52Var7 && l52Var6.f == null) {
                            int iE2 = iD - l52Var7.e();
                            b72Var2.M(iE2 - b72Var2.l(), iE2);
                            f0(i3, ro0Var, b72Var2);
                        } else if (c3 != 0 && !b72Var2.z()) {
                            Y(i3, ro0Var, b72Var2);
                        }
                    }
                } else if (a72Var == a72Var2 && b72Var2.z >= 0 && b72Var2.y >= 0 && ((b72Var2.i0 == 8 || (b72Var2.t == 0 && b72Var2.Y == f2)) && !b72Var2.z() && !b72Var2.G && c3 != 0 && !b72Var2.z())) {
                    Z(i3, b72Var, ro0Var, b72Var2);
                }
                c2 = c4;
            }
        }
        char c5 = c2;
        if (b72Var instanceof sh5) {
            return;
        }
        HashSet<l52> hashSet2 = l52VarJ2.a;
        if (hashSet2 != null && l52VarJ2.c) {
            for (l52 l52Var8 : hashSet2) {
                b72 b72Var3 = l52Var8.d;
                int i4 = i2 + 1;
                boolean zA2 = A(b72Var3);
                l52 l52Var9 = b72Var3.K;
                l52 l52Var10 = b72Var3.M;
                if (b72Var3.A() && zA2) {
                    c72.b0(b72Var3, ro0Var, new qo0());
                }
                char c6 = ((l52Var8 == l52Var9 && (l52Var2 = l52Var10.f) != null && l52Var2.c) || (l52Var8 == l52Var10 && (l52Var = l52Var9.f) != null && l52Var.c)) ? c5 : (char) 0;
                a72 a72Var3 = b72Var3.U[c5];
                a72 a72Var4 = a72.MATCH_CONSTRAINT;
                if (a72Var3 != a72Var4 || zA2) {
                    if (!b72Var3.A()) {
                        if (l52Var8 == l52Var9 && l52Var10.f == null) {
                            int iE3 = l52Var9.e() + iD2;
                            b72Var3.M(iE3, b72Var3.l() + iE3);
                            f0(i4, ro0Var, b72Var3);
                        } else if (l52Var8 == l52Var10 && l52Var9.f == null) {
                            int iE4 = iD2 - l52Var10.e();
                            b72Var3.M(iE4 - b72Var3.l(), iE4);
                            f0(i4, ro0Var, b72Var3);
                        } else if (c6 != 0 && !b72Var3.z()) {
                            Y(i4, ro0Var, b72Var3);
                        }
                    }
                } else if (a72Var3 == a72Var4 && b72Var3.z >= 0 && b72Var3.y >= 0 && (b72Var3.i0 == 8 || (b72Var3.t == 0 && b72Var3.Y == 0.0f))) {
                    if (!b72Var3.z() && !b72Var3.G && c6 != 0 && !b72Var3.z()) {
                        Z(i4, b72Var, ro0Var, b72Var3);
                    }
                }
            }
        }
        l52 l52VarJ3 = b72Var.j(k52.BASELINE);
        if (l52VarJ3.a != null && l52VarJ3.c) {
            int iD3 = l52VarJ3.d();
            for (l52 l52Var11 : l52VarJ3.a) {
                b72 b72Var4 = l52Var11.d;
                int i5 = i2 + 1;
                boolean zA3 = A(b72Var4);
                l52 l52Var12 = b72Var4.N;
                if (b72Var4.A() && zA3) {
                    c72.b0(b72Var4, ro0Var, new qo0());
                }
                if (b72Var4.U[c5] != a72.MATCH_CONSTRAINT || zA3) {
                    if (b72Var4.A()) {
                        continue;
                    } else if (l52Var11 == l52Var12) {
                        int iE5 = l52Var11.e() + iD3;
                        if (b72Var4.F) {
                            int i6 = iE5 - b72Var4.c0;
                            int i7 = b72Var4.X + i6;
                            b72Var4.b0 = i6;
                            b72Var4.K.l(i6);
                            b72Var4.M.l(i7);
                            l52Var12.l(iE5);
                            b72Var4.m = c5;
                        }
                        f0(i5, ro0Var, b72Var4);
                    }
                }
                c5 = 1;
            }
        }
        b72Var.o = true;
    }

    public static final void g(b24 b24Var, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(512021650);
        int i3 = i2 | (p65Var.f(b24Var) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            iq7.a(b24Var, bgf.N(r28Var, "notification_settings_error"), null, null, null, null, m45Var, null, p65Var, (i3 & 14) | ((i3 << 15) & 3670016), 188);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new se9(i2, 21, b24Var, m45Var, r28Var);
        }
    }

    public static final void g0(ai6 ai6Var) {
        cm4.d.getClass();
        g04 entries = owe.getEntries();
        g04 entries2 = owe.getEntries();
        ArrayList arrayList = new ArrayList(cu1.k0(entries2, 10));
        Iterator<E> it2 = entries2.iterator();
        while (it2.hasNext()) {
            arrayList.add(((owe) it2.next()).getFlag$kotlin_metadata());
        }
        entries.getClass();
    }

    public static final void h(List list, ig5 ig5Var, sh9 sh9Var, x12 x12Var, int i2) {
        boolean z;
        ig5Var.getClass();
        sh9Var.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1668315365);
        int i3 = i2 | (p65Var.h(list) ? 4 : 2) | (p65Var.d(ig5Var.ordinal()) ? 32 : 16) | (p65Var.f(sh9Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            long j2 = ((zo7) p65Var.j(kt7.b)).c;
            nr5 nr5Var = rv8.r;
            o28 o28Var = o28.b;
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), flb.a0(o28Var, j2, nr5Var), 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j3 = p65Var.T;
            int i4 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j4 = p65Var.T;
            int i5 = (int) (j4 ^ (j4 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            boolean z2 = vj3.a(((m73) p65Var.j(z22.h)).N(((Context) p65Var.j(eo.b)).getResources().getDisplayMetrics().widthPixels), 648.0f) < 0;
            r28 r28VarD2 = jfc.d(o28Var, 1.0f);
            wv1 wv1VarA = uv1.a(c, z46.p, p65Var, 0);
            boolean z3 = z2;
            long j5 = p65Var.T;
            int i6 = (int) (j5 ^ (j5 >>> 32));
            i89 i89VarL3 = p65Var.l();
            r28 r28VarR3 = gx1.R(p65Var, r28VarD2);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, wv1VarA);
            tp7.B(p65Var, cuVar2, i89VarL3);
            ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR3);
            if (z3) {
                p65Var.Y(1647525412);
                Iterator it2 = list.iterator();
                while (it2.hasNext()) {
                    nk7.q((dr9) it2.next(), ig5Var, sh9Var, jfc.d(o28Var, 1.0f), null, p65Var, (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | 3072 | (i3 & 896), 16);
                    tp7.c(0.0f, 6, 6, 0L, p65Var, jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f));
                }
                p65Var.p(false);
            } else {
                p65Var.Y(1648103314);
                if (list.isEmpty()) {
                    p65Var.Y(1646055578);
                } else {
                    p65Var.Y(1648129385);
                    w((dr9) list.get(0), (dr9) bu1.A0(1, list), ig5Var, sh9Var, p65Var, (i3 << 3) & 8064);
                    p65Var = p65Var;
                }
                p65Var.p(false);
                if (list.size() >= 3) {
                    p65Var.Y(1648473609);
                    p65 p65Var2 = p65Var;
                    w((dr9) list.get(2), (dr9) bu1.A0(3, list), ig5Var, sh9Var, p65Var2, (i3 << 3) & 8064);
                    p65Var = p65Var2;
                    z = false;
                } else {
                    z = false;
                    p65Var.Y(1646055578);
                }
                p65Var.p(z);
                tp7.c(0.0f, 6, 6, 0L, p65Var, jfc.d(w2g.G(o28Var, 24.0f, 0.0f, 24.0f, 0.0f, 10), 1.0f));
                p65Var.p(false);
            }
            b09.H(p65Var, true, true, true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new wp3(i2, 26, list, ig5Var, sh9Var);
        }
    }

    public static final void i(up5 up5Var, jp5 jp5Var, r28 r28Var, x12 x12Var, int i2) {
        up5 up5Var2 = up5Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1029155519);
        int i3 = i2 | (p65Var.f(up5Var2) ? 4 : 2) | (p65Var.f(jp5Var) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            r28 r28VarX = ho2.x((jp7) p65Var.j(kt7.a), r28Var, 3, 1.0f);
            zk7 zk7VarC = dy0.c(z46.h, false);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarX);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            cu cuVar = q12.f;
            tp7.B(p65Var, cuVar, zk7VarC);
            cu cuVar2 = q12.e;
            tp7.B(p65Var, cuVar2, i89VarL);
            Integer numValueOf = Integer.valueOf(i4);
            cu cuVar3 = q12.g;
            tp7.B(p65Var, cuVar3, numValueOf);
            fn fnVar = q12.h;
            tp7.y(p65Var, fnVar);
            cu cuVar4 = q12.d;
            tp7.B(p65Var, cuVar4, r28VarR);
            r28 r28VarD = jfc.d(jfc.o(o28.b, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
            zk7 zk7VarC2 = dy0.c(z46.d, false);
            long j3 = p65Var.T;
            int i5 = (int) (j3 ^ (j3 >>> 32));
            i89 i89VarL2 = p65Var.l();
            r28 r28VarR2 = gx1.R(p65Var, r28VarD);
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, cuVar, zk7VarC2);
            tp7.B(p65Var, cuVar2, i89VarL2);
            ka1.z(i5, p65Var, cuVar3, p65Var, fnVar);
            tp7.B(p65Var, cuVar4, r28VarR2);
            up5Var2 = up5Var;
            b24 b24Var = up5Var2.a;
            rh4 rh4Var = jfc.c;
            boolean z = (i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32;
            Object objM = p65Var.M();
            if (z || objM == w12.a) {
                ek5 ek5Var = new ek5(0, jp5Var, jp5.class, "onRefresh", "onRefresh()V", 0, 7);
                p65Var.j0(ek5Var);
                objM = ek5Var;
            }
            iq7.a(b24Var, rh4Var, null, null, null, null, (m45) ((qh6) objM), null, p65Var, 48, 188);
            p65Var.p(true);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ho5(i2, 2, up5Var2, jp5Var, r28Var);
        }
    }

    public static final void j(wp5 wp5Var, kv6 kv6Var, jp5 jp5Var, md3 md3Var, k8b k8bVar, x12 x12Var, int i2) {
        float f2;
        jp5 jp5Var2 = jp5Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1289050642);
        int i3 = i2 | (p65Var.f(wp5Var) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(jp5Var2) ? 256 : 128) | (p65Var.f(md3Var) ? 2048 : 1024) | (p65Var.f(k8bVar) ? 16384 : 8192);
        if (p65Var.P(i3 & 1, (i3 & 9363) != 9362)) {
            sn3 sn3Var = kt7.a;
            ((jp7) p65Var.j(sn3Var)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            ((jp7) p65Var.j(sn3Var)).getClass();
            int i4 = lp5.a[jp7.a(p65Var).ordinal()];
            if (i4 == 1) {
                f2 = 0.0f;
            } else {
                if (i4 != 2 && i4 != 3) {
                    ygf.a();
                    return;
                }
                f2 = 24.0f;
            }
            jy8 jy8VarH = w2g.h(0.0f, 0.0f, 0.0f, 88.0f, 7);
            boolean zC = ((i3 & 7168) == 2048) | ((i3 & 14) == 4) | p65Var.c(f2) | p65Var.d(stcVar.ordinal()) | ((57344 & i3) == 16384);
            Object objM = p65Var.M();
            uob uobVar = w12.a;
            if (zC || objM == uobVar) {
                ko5 ko5Var = new ko5(wp5Var, f2, stcVar, md3Var, k8bVar, 1);
                p65Var.j0(ko5Var);
                objM = ko5Var;
            }
            int i5 = i3 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION;
            k40.t(null, kv6Var, jy8VarH, null, null, null, false, null, (x45) objM, p65Var, i5 | 384, 505);
            int i6 = i3 & 896;
            boolean z = (i6 == 256) | (i5 == 32);
            Object objM2 = p65Var.M();
            n92 n92Var = null;
            if (z || objM2 == uobVar) {
                jp5Var2 = jp5Var;
                objM2 = new xs3(kv6Var, jp5Var2, n92Var, 17);
                p65Var.j0(objM2);
            } else {
                jp5Var2 = jp5Var;
            }
            kyd.k(p65Var, (b55) objM2, kv6Var);
            Object objM3 = p65Var.M();
            if (objM3 == uobVar) {
                objM3 = bjc.b(new f91(kv6Var, 4));
                p65Var.j0(objM3);
            }
            upc upcVar = (upc) objM3;
            Boolean bool = (Boolean) upcVar.getValue();
            bool.booleanValue();
            boolean z2 = i6 == 256;
            Object objM4 = p65Var.M();
            if (z2 || objM4 == uobVar) {
                objM4 = new rc0(jp5Var2, upcVar, n92Var, 18);
                p65Var.j0(objM4);
            }
            kyd.k(p65Var, (b55) objM4, bool);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new e45(wp5Var, kv6Var, jp5Var2, md3Var, k8bVar, i2, 24);
        }
    }

    public static final void k(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1625472625);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        boolean z = true;
        boolean z2 = false;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            ((jp7) p65Var.j(kt7.a)).getClass();
            stc stcVar = jp7.a(p65Var) == ip7.COMPACT ? stc.M : stc.L;
            wv1 wv1VarA = uv1.a(c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            char c2 = ' ';
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28Var);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            p65Var.Y(1669462201);
            int iR = 0;
            while (iR < 10) {
                jp7 jp7Var = (jp7) p65Var.j(kt7.a);
                o28 o28Var = o28.b;
                r28 r28VarJ = ka1.j(jp7Var, o28Var, 3, 1.0f);
                zk7 zk7VarC = dy0.c(z46.h, z2);
                long j3 = p65Var.T;
                int i5 = (int) (j3 ^ (j3 >>> c2));
                i89 i89VarL2 = p65Var.l();
                r28 r28VarR2 = gx1.R(p65Var, r28VarJ);
                r12.W.getClass();
                ot2 ot2Var2 = q12.b;
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                cu cuVar = q12.f;
                tp7.B(p65Var, cuVar, zk7VarC);
                cu cuVar2 = q12.e;
                tp7.B(p65Var, cuVar2, i89VarL2);
                Integer numValueOf = Integer.valueOf(i5);
                cu cuVar3 = q12.g;
                tp7.B(p65Var, cuVar3, numValueOf);
                fn fnVar = q12.h;
                tp7.y(p65Var, fnVar);
                char c3 = c2;
                cu cuVar4 = q12.d;
                tp7.B(p65Var, cuVar4, r28VarR2);
                r28 r28VarD = jfc.d(jfc.o(o28Var, 0.0f, 0.0f, 648.0f, 0.0f, 11), 1.0f);
                zk7 zk7VarC2 = dy0.c(z46.d, z2);
                long j4 = p65Var.T;
                int i6 = (int) (j4 ^ (j4 >>> c3));
                i89 i89VarL3 = p65Var.l();
                r28 r28VarR3 = gx1.R(p65Var, r28VarD);
                p65Var.c0();
                if (p65Var.S) {
                    p65Var.k(ot2Var2);
                } else {
                    p65Var.m0();
                }
                tp7.B(p65Var, cuVar, zk7VarC2);
                tp7.B(p65Var, cuVar2, i89VarL3);
                ka1.z(i6, p65Var, cuVar3, p65Var, fnVar);
                tp7.B(p65Var, cuVar4, r28VarR3);
                il7.l(stcVar, null, 0L, null, p65Var, 0, 14);
                iR = wgd.r(p65Var, true, true, iR, 1);
                c2 = c3;
                z = true;
                z2 = false;
            }
            p65Var.p(z2);
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new ow4(r28Var, i2, 8);
        }
    }

    public static final void l(wp5 wp5Var, kv6 kv6Var, jp5 jp5Var, md3 md3Var, k8b k8bVar, r28 r28Var, x12 x12Var, int i2) {
        boolean z;
        int i3;
        uob uobVar;
        jp5 jp5Var2 = jp5Var;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(321289661);
        int i4 = i2 | (p65Var.f(wp5Var) ? 4 : 2) | (p65Var.f(kv6Var) ? 32 : 16) | (p65Var.f(jp5Var2) ? 256 : 128) | (p65Var.f(md3Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024) | (p65Var.f(k8bVar) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | (p65Var.f(r28Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID);
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            boolean z2 = wp5Var.b;
            int i5 = i4 & 896;
            boolean z3 = i5 == 256;
            Object objM = p65Var.M();
            uob uobVar2 = w12.a;
            if (z3 || objM == uobVar2) {
                z = z2;
                i3 = i5;
                uobVar = uobVar2;
                ek5 ek5Var = new ek5(0, jp5Var, jp5.class, "onRefresh", "onRefresh()V", 0, 9);
                p65Var.j0(ek5Var);
                objM = ek5Var;
            } else {
                z = z2;
                i3 = i5;
                uobVar = uobVar2;
            }
            int i6 = (i4 >> 9) & 896;
            er7.d(z, (m45) ((qh6) objM), r28Var, null, 0L, 0L, false, 0.0f, null, null, pxf.E(-2047723409, new g91(wp5Var, kv6Var, jp5Var, md3Var, k8bVar, 16), p65Var), p65Var, i6, PhotoshopDirectory.TAG_COLOR_TRANSFER_FUNCTIONS);
            boolean z4 = i3 == 256;
            Object objM2 = p65Var.M();
            if (z4 || objM2 == uobVar) {
                jp5Var2 = jp5Var;
                objM2 = new lo5(jp5Var2, null, 1);
                p65Var.j0(objM2);
            } else {
                jp5Var2 = jp5Var;
            }
            kyd.k(p65Var, (b55) objM2, c1e.a);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 14, r28Var, wp5Var, kv6Var, jp5Var2, md3Var, k8bVar);
        }
    }

    public static final void m(xp5 xp5Var, jp5 jp5Var, md3 md3Var, k8b k8bVar, r28 r28Var, kv6 kv6Var, x12 x12Var, int i2) {
        int i3;
        jp5 jp5Var2;
        p65 p65Var;
        p65 p65Var2 = (p65) x12Var;
        p65Var2.a0(-1753513265);
        if ((i2 & 6) == 0) {
            i3 = (p65Var2.f(xp5Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            jp5Var2 = jp5Var;
            i3 |= p65Var2.f(jp5Var2) ? 32 : 16;
        } else {
            jp5Var2 = jp5Var;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var2.f(md3Var) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var2.f(k8bVar) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if ((i2 & 24576) == 0) {
            i3 |= p65Var2.f(r28Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192;
        }
        if ((196608 & i2) == 0) {
            i3 |= p65Var2.f(kv6Var) ? 131072 : ReconyxUltraFireMakernoteDirectory.MAKERNOTE_ID;
        }
        if (p65Var2.P(i3 & 1, (74899 & i3) != 74898)) {
            p65Var2.U();
            if ((i2 & 1) != 0 && !p65Var2.z()) {
                p65Var2.S();
            }
            p65Var2.q();
            Object objM = p65Var2.M();
            if (objM == w12.a) {
                objM = new cq4(25);
                p65Var2.j0(objM);
            }
            p65Var = p65Var2;
            pr7.b(bgf.N(rv8.J(wxb.a(r28Var, false, (x45) objM), jq7.t(p65Var2), null), "home_for_you"), null, null, null, null, 0, 0L, 0L, p, pxf.E(1564535902, new g91((Object) xp5Var, (Object) jp5Var2, kv6Var, (Object) md3Var, (Object) k8bVar, 15), p65Var2), p65Var, 805306368, ExifDirectoryBase.TAG_NEW_SUBFILE_TYPE);
        } else {
            p65Var = p65Var2;
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new iu0(i2, 5, r28Var, xp5Var, jp5Var, md3Var, k8bVar, kv6Var);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r10v12 */
    /* JADX WARN: Type inference failed for: r10v13, types: [boolean, int] */
    /* JADX WARN: Type inference failed for: r10v14 */
    /* JADX WARN: Type inference failed for: r15v1, types: [p65, x12] */
    /* JADX WARN: Type inference failed for: r6v27, types: [r28] */
    /* JADX WARN: Type inference failed for: r6v29 */
    /* JADX WARN: Type inference failed for: r6v35 */
    public static final void n(String str, bo4 bo4Var, nhc nhcVar, rq5 rq5Var, m45 m45Var, r28 r28Var, bq5 bq5Var, x12 x12Var, int i2) {
        r28 r28Var2;
        bq5 bq5Var2;
        bq5 bq5Var3;
        int i3;
        r28 r28Var3;
        ?? r10;
        ?? r6;
        str.getClass();
        bo4Var.getClass();
        nhcVar.getClass();
        rq5Var.getClass();
        m45Var.getClass();
        ?? r15 = (p65) x12Var;
        r15.a0(458730968);
        int i4 = i2 | (r15.f(str) ? 4 : 2) | (r15.h(bo4Var) ? 32 : 16) | (r15.f(nhcVar) ? 256 : 128) | (r15.f(rq5Var) ? 2048 : 1024) | (r15.h(m45Var) ? OlympusMakernoteDirectory.TAG_MAIN_INFO : 8192) | 720896;
        if (r15.P(i4 & 1, (599187 & i4) != 599186)) {
            r15.U();
            int i5 = i2 & 1;
            Object obj = w12.a;
            if (i5 == 0 || r15.z()) {
                Object objJ = r15.j(r57.a);
                objJ.getClass();
                xy1 xy1Var = (xy1) objJ;
                boolean z = (i4 & 14) == 4;
                Object objM = r15.M();
                if (z || objM == obj) {
                    objM = new mb(str, 28);
                    r15.j0(objM);
                }
                bq5Var3 = (bq5) to7.z(n1b.a.b(bq5.class), xy1Var, t40.E(xy1Var, r15), r40.N(xy1Var.getDefaultViewModelCreationExtras(), (x45) objM), r15);
                i3 = i4 & (-3670017);
                r28Var3 = o28.b;
            } else {
                r15.S();
                i3 = i4 & (-3670017);
                r28Var3 = r28Var;
                bq5Var3 = bq5Var;
            }
            r15.q();
            l78 l78VarZ = guc.z(bq5Var3.o, r15, 0);
            l78 l78VarZ2 = guc.z(bq5Var3.l, r15, 0);
            kv6 kv6VarA = pv6.a(r15);
            Context context = (Context) r15.j(eo.b);
            jp5 jp5Var = new jp5(bq5Var3, m45Var);
            boolean zF = ((i3 & 7168) == 2048) | r15.f(bq5Var3) | r15.f(context);
            Object objM2 = r15.M();
            if (zF || objM2 == obj) {
                objM2 = new kp5(rq5Var, context, bq5Var3);
                r15.j0(objM2);
            }
            kp5 kp5Var = (kp5) objM2;
            md3 md3Var = new md3(rq5Var, 3, bq5Var3);
            m((xp5) l78VarZ.getValue(), jp5Var, md3Var, kp5Var, r28Var3, kv6VarA, r15, 24576);
            Resources resources = (Resources) r15.j(eo.c);
            boolean zH = r15.h(bq5Var3) | ((i3 & 896) == 256) | r15.h(resources) | r15.f(md3Var) | r15.f(kp5Var);
            Object objM3 = r15.M();
            if (zH || objM3 == obj) {
                objM3 = new b9((Object) bq5Var3, nhcVar, resources, (Object) md3Var, (Object) kp5Var, (n92) null, 23);
                r15.j0(objM3);
            }
            c1e c1eVar = c1e.a;
            kyd.k(r15, (b55) objM3, c1eVar);
            boolean zH2 = r15.h(bo4Var) | r15.h(bq5Var3) | r15.f(kv6VarA);
            Object objM4 = r15.M();
            if (zH2 || objM4 == obj) {
                n92 n92Var = null;
                r10 = 0;
                mo5 mo5Var = new mo5(bo4Var, bq5Var3, kv6VarA, n92Var, 1);
                r15.j0(mo5Var);
                objM4 = mo5Var;
                r6 = n92Var;
            } else {
                r6 = 0;
                r10 = 0;
            }
            kyd.k(r15, (b55) objM4, c1eVar);
            qp5 qp5Var = (qp5) l78VarZ2.getValue();
            if (qp5Var != null) {
                r15.Y(-517198188);
                w2g.c(qp5Var.a, new ip5(bq5Var3, rq5Var, r10), r6, r15, r10);
                r15.p(r10);
            } else {
                if (qp5Var != null) {
                    throw ho2.L(r15, -1540708189, r10);
                }
                r15.Y(-1540676420);
                r15.p(r10);
            }
            bq5Var2 = bq5Var3;
            r28Var2 = r28Var3;
        } else {
            r15.S();
            r28Var2 = r28Var;
            bq5Var2 = bq5Var;
        }
        mwa mwaVarS = r15.s();
        if (mwaVarS != null) {
            mwaVarS.d = new mc3(str, bo4Var, nhcVar, rq5Var, m45Var, r28Var2, bq5Var2, i2, 4);
        }
    }

    public static final void o(mz1 mz1Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-709502251);
        if (p65Var.P(i2 & 1, (i2 & 3) != 2)) {
            sn3 sn3Var = sob.a;
            qob qobVar = (qob) p65Var.j(sn3Var);
            oob oobVarX = qo7.x(p65Var);
            Object[] objArr = {qobVar};
            mya myaVar = new mya(new p44(20), 3, new si3(qobVar, 23, oobVarX));
            boolean zH = p65Var.h(qobVar) | p65Var.h(oobVarX);
            Object objM = p65Var.M();
            if (zH || objM == w12.a) {
                objM = new ps5(qobVar, 6, oobVarX);
                p65Var.j0(objM);
            }
            sv6 sv6Var = (sv6) hp7.F(objArr, myaVar, (m45) objM, p65Var, 0);
            k40.c(sn3Var.a(sv6Var), pxf.E(-412824043, new hm4(mz1Var, 18, sv6Var), p65Var), p65Var, 56);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new dd(mz1Var, i2, 5);
        }
    }

    public static final void p(r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-2111395405);
        int i3 = (p65Var.f(r28Var) ? 4 : 2) | i2;
        if (p65Var.P(i3 & 1, (i3 & 3) != 2)) {
            r28 r28VarN = bgf.N(m40.V(r28Var, p65Var, i3 & 14), "notification_settings_loading");
            wv1 wv1VarA = uv1.a(c, z46.p, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarN);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, wv1VarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            c(0, 0L, p65Var, null);
            c(0, 0L, p65Var, null);
            c(0, 0L, p65Var, null);
            o28 o28Var = o28.b;
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            f(0.0f, 0, 0L, p65Var, null);
            c(0, 0L, p65Var, null);
            f(0.0f, 0, 0L, p65Var, null);
            f(0.0f, 0, 0L, p65Var, null);
            f(0.0f, 0, 0L, p65Var, null);
            f(0.0f, 0, 0L, p65Var, null);
            c(0, 0L, p65Var, null);
            hp7.t(p65Var, jfc.l(o28Var, 32.0f));
            c(0, 0L, p65Var, null);
            c(0, 0L, p65Var, null);
            p65Var.p(true);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new cx9(r28Var, i2, 18);
        }
    }

    public static a98 q() {
        return new a98();
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0057  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x005f  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00a9  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00b5  */
    /* JADX WARN: Removed duplicated region for block: B:43:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void r(defpackage.kqa r20, defpackage.cqa r21, defpackage.r28 r22, defpackage.x12 r23, int r24, int r25) {
        /*
            r1 = r20
            r2 = r21
            r4 = r24
            r1.getClass()
            r0 = r23
            p65 r0 = (defpackage.p65) r0
            r3 = 725350571(0x2b3bf8ab, float:6.678084E-13)
            r0.a0(r3)
            r3 = r4 & 6
            if (r3 != 0) goto L22
            boolean r3 = r0.f(r1)
            if (r3 == 0) goto L1f
            r3 = 4
            goto L20
        L1f:
            r3 = 2
        L20:
            r3 = r3 | r4
            goto L23
        L22:
            r3 = r4
        L23:
            r5 = r4 & 48
            if (r5 != 0) goto L33
            boolean r5 = r0.f(r2)
            if (r5 == 0) goto L30
            r5 = 32
            goto L32
        L30:
            r5 = 16
        L32:
            r3 = r3 | r5
        L33:
            r5 = r25 & 4
            if (r5 == 0) goto L3c
            r3 = r3 | 384(0x180, float:5.38E-43)
        L39:
            r6 = r22
            goto L4e
        L3c:
            r6 = r4 & 384(0x180, float:5.38E-43)
            if (r6 != 0) goto L39
            r6 = r22
            boolean r7 = r0.f(r6)
            if (r7 == 0) goto L4b
            r7 = 256(0x100, float:3.59E-43)
            goto L4d
        L4b:
            r7 = 128(0x80, float:1.8E-43)
        L4d:
            r3 = r3 | r7
        L4e:
            r7 = r3 & 147(0x93, float:2.06E-43)
            r8 = 146(0x92, float:2.05E-43)
            r9 = 1
            if (r7 == r8) goto L57
            r7 = r9
            goto L58
        L57:
            r7 = 0
        L58:
            r3 = r3 & r9
            boolean r3 = r0.P(r3, r7)
            if (r3 == 0) goto La9
            if (r5 == 0) goto L64
            o28 r3 = defpackage.o28.b
            goto L65
        L64:
            r3 = r6
        L65:
            rh4 r5 = defpackage.jfc.c
            r28 r5 = r3.b(r5)
            java.lang.String r6 = "notification_settings_screen"
            r28 r5 = defpackage.bgf.N(r5, r6)
            v08 r6 = new v08
            r7 = 26
            r6.<init>(r7, r2)
            r7 = -588952025(0xffffffffdce54e27, float:-5.163496E17)
            mz1 r6 = defpackage.pxf.E(r7, r6, r0)
            sn3 r7 = defpackage.kt7.b
            java.lang.Object r7 = r0.j(r7)
            zo7 r7 = (defpackage.zo7) r7
            long r11 = r7.c
            qg9 r7 = new qg9
            r8 = 11
            r7.<init>(r1, r8, r2)
            r8 = -802369668(0xffffffffd02ccf7c, float:-1.1597115E10)
            mz1 r16 = defpackage.pxf.E(r8, r7, r0)
            r18 = 805306416(0x30000030, float:4.6566395E-10)
            r19 = 444(0x1bc, float:6.22E-43)
            r7 = 0
            r8 = 0
            r9 = 0
            r10 = 0
            r13 = 0
            r15 = 0
            r17 = r0
            defpackage.pr7.b(r5, r6, r7, r8, r9, r10, r11, r13, r15, r16, r17, r18, r19)
            goto Laf
        La9:
            r17 = r0
            r17.S()
            r3 = r6
        Laf:
            mwa r7 = r17.s()
            if (r7 == 0) goto Lc0
            oc0 r0 = new oc0
            r6 = 9
            r5 = r25
            r0.<init>(r1, r2, r3, r4, r5, r6)
            r7.d = r0
        Lc0:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qb8.r(kqa, cqa, r28, x12, int, int):void");
    }

    public static final void s(String str, olb olbVar, r28 r28Var, nqa nqaVar, x12 x12Var, int i2) {
        nqa nqaVar2;
        int i3;
        nqa nqaVar3;
        str.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(-1394671731);
        int i4 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.f(olbVar) ? 32 : 16) | (p65Var.f(r28Var) ? 256 : 128) | 1024;
        if (p65Var.P(i4 & 1, (i4 & 1171) != 1170)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = (i4 & 14) == 4;
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new ov5(str, 21);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    i3 = i4 & (-7169);
                    nqaVar3 = (nqa) to7.z(n1b.a.b(nqa.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                }
            } else {
                p65Var.S();
                i3 = i4 & (-7169);
                nqaVar3 = nqaVar;
            }
            p65Var.q();
            Context context = (Context) p65Var.j(eo.b);
            g7 g7Var = new g7(3);
            boolean zH = p65Var.h(nqaVar3);
            Object objM2 = p65Var.M();
            if (zH || objM2 == uobVar) {
                g98 g98Var = new g98(1, nqaVar3, nqa.class, "onPermissionRequestResult", "onPermissionRequestResult(Z)V", 0, 28);
                p65Var.j0(g98Var);
                objM2 = g98Var;
            }
            r((kqa) guc.z(nqaVar3.m, p65Var, 0).getValue(), new cqa(olbVar, sgg.T(g7Var, (x45) ((qh6) objM2), p65Var, 0), nqaVar3), r28Var, p65Var, i3 & 896, 0);
            boolean zH2 = p65Var.h(context) | p65Var.h(nqaVar3);
            Object objM3 = p65Var.M();
            if (zH2 || objM3 == uobVar) {
                objM3 = new n79(context, nqaVar3, null, 10);
                p65Var.j0(objM3);
            }
            kyd.k(p65Var, (b55) objM3, c1e.a);
            nqaVar2 = nqaVar3;
        } else {
            p65Var.S();
            nqaVar2 = nqaVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new kf3(i2, 29, str, olbVar, r28Var, nqaVar2);
        }
    }

    public static final void t(String str, m45 m45Var, r28 r28Var, x12 x12Var, int i2) {
        p65 p65Var = (p65) x12Var;
        p65Var.a0(404867368);
        int i3 = i2 | (p65Var.f(str) ? 4 : 2) | (p65Var.h(m45Var) ? 32 : 16);
        if (p65Var.P(i3 & 1, (i3 & 147) != 146)) {
            fo7.k(((i3 << 3) & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | ((i3 >> 3) & 14) | 384, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, null, p65Var, m45Var, xn7.M, w2g.G(r28Var, 8.0f, 16.0f, 0.0f, 0.0f, 12), str, false, false);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new qb(str, m45Var, r28Var, i2, 5);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:55:0x00a8  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x00b3  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0126  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0132  */
    /* JADX WARN: Removed duplicated region for block: B:78:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void u(defpackage.e2d r25, defpackage.q1d r26, defpackage.obe r27, defpackage.cs1 r28, defpackage.e9d r29, defpackage.r28 r30, defpackage.x12 r31, int r32, int r33) {
        /*
            Method dump skipped, instruction units count: 328
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qb8.u(e2d, q1d, obe, cs1, e9d, r28, x12, int, int):void");
    }

    public static final void v(RefineRecommendationsFilter refineRecommendationsFilter, String str, nhc nhcVar, pkf pkfVar, r28 r28Var, j2d j2dVar, x12 x12Var, int i2) {
        r28 r28Var2;
        j2d j2dVar2;
        j2d j2dVar3;
        int i3;
        r28 r28Var3;
        j2d j2dVar4;
        str.getClass();
        nhcVar.getClass();
        p65 p65Var = (p65) x12Var;
        p65Var.a0(476818547);
        int i4 = i2 | (p65Var.d(refineRecommendationsFilter == null ? -1 : refineRecommendationsFilter.ordinal()) ? 4 : 2) | (p65Var.f(str) ? 32 : 16) | (p65Var.f(nhcVar) ? 256 : 128) | (p65Var.f(pkfVar) ? 2048 : 1024) | 90112;
        if (p65Var.P(i4 & 1, (74899 & i4) != 74898)) {
            p65Var.U();
            int i5 = i2 & 1;
            uob uobVar = w12.a;
            if (i5 == 0 || p65Var.z()) {
                boolean z = ((i4 & 14) == 4) | ((i4 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) == 32);
                Object objM = p65Var.M();
                if (z || objM == uobVar) {
                    objM = new pda(refineRecommendationsFilter, 17, str);
                    p65Var.j0(objM);
                }
                x45 x45Var = (x45) objM;
                wue wueVarA = e67.a(p65Var);
                if (wueVarA == null) {
                    ygf.f("No ViewModelStoreOwner was provided via LocalViewModelStoreOwner");
                    return;
                } else {
                    j2dVar3 = (j2d) to7.z(n1b.a.b(j2d.class), wueVarA, t40.E(wueVarA, p65Var), wueVarA instanceof pi5 ? r40.N(((pi5) wueVarA).getDefaultViewModelCreationExtras(), x45Var) : r40.N(og2.b, x45Var), p65Var);
                    i3 = i4 & (-458753);
                    r28Var3 = o28.b;
                }
            } else {
                p65Var.S();
                i3 = i4 & (-458753);
                r28Var3 = r28Var;
                j2dVar3 = j2dVar;
            }
            p65Var.q();
            l78 l78VarZ = guc.z(j2dVar3.v, p65Var, 0);
            int i6 = i3 & 7168;
            boolean zF = (i6 == 2048) | p65Var.f(j2dVar3);
            Object objM2 = p65Var.M();
            if (zF || objM2 == uobVar) {
                objM2 = new s1d(j2dVar3, pkfVar);
                p65Var.j0(objM2);
            }
            s1d s1dVar = (s1d) objM2;
            boolean zF2 = (i6 == 2048) | p65Var.f(j2dVar3);
            Object objM3 = p65Var.M();
            if (zF2 || objM3 == uobVar) {
                objM3 = new p1d(j2dVar3, pkfVar);
                p65Var.j0(objM3);
            }
            p1d p1dVar = (p1d) objM3;
            boolean zF3 = (i6 == 2048) | p65Var.f(j2dVar3);
            Object objM4 = p65Var.M();
            if (zF3 || objM4 == uobVar) {
                objM4 = new r1d(j2dVar3, pkfVar);
                p65Var.j0(objM4);
            }
            r1d r1dVar = (r1d) objM4;
            boolean zF4 = (i6 == 2048) | p65Var.f(j2dVar3);
            Object objM5 = p65Var.M();
            if (zF4 || objM5 == uobVar) {
                objM5 = new q1d(j2dVar3, pkfVar);
                p65Var.j0(objM5);
            }
            u((e2d) l78VarZ.getValue(), (q1d) objM5, s1dVar, p1dVar, r1dVar, r28Var3, p65Var, 196608, 0);
            Resources resources = (Resources) p65Var.j(eo.c);
            Object objM6 = p65Var.M();
            if (objM6 == uobVar) {
                objM6 = kyd.M(p65Var);
                p65Var.j0(objM6);
            }
            sb2 sb2Var = (sb2) objM6;
            boolean zH = p65Var.h(j2dVar3) | ((i3 & 896) == 256) | p65Var.h(sb2Var) | p65Var.h(resources) | p65Var.f(p1dVar) | p65Var.f(s1dVar) | p65Var.f(r1dVar);
            Object objM7 = p65Var.M();
            if (zH || objM7 == uobVar) {
                j2dVar4 = j2dVar3;
                objM7 = new nz(j2dVar4, nhcVar, sb2Var, resources, p1dVar, s1dVar, r1dVar, null, 18);
                p65Var.j0(objM7);
            } else {
                j2dVar4 = j2dVar3;
            }
            kyd.k(p65Var, (b55) objM7, c1e.a);
            r28Var2 = r28Var3;
            j2dVar2 = j2dVar4;
        } else {
            p65Var.S();
            r28Var2 = r28Var;
            j2dVar2 = j2dVar;
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new t8(i2, 23, r28Var2, (que) j2dVar2, (Object) refineRecommendationsFilter, (Object) nhcVar, (Object) pkfVar, str);
        }
    }

    public static final void w(dr9 dr9Var, dr9 dr9Var2, ig5 ig5Var, sh9 sh9Var, x12 x12Var, int i2) {
        int i3;
        boolean z;
        p65 p65Var = (p65) x12Var;
        p65Var.a0(1136692369);
        if ((i2 & 6) == 0) {
            i3 = (p65Var.f(dr9Var) ? 4 : 2) | i2;
        } else {
            i3 = i2;
        }
        if ((i2 & 48) == 0) {
            i3 |= p65Var.f(dr9Var2) ? 32 : 16;
        }
        if ((i2 & 384) == 0) {
            i3 |= p65Var.d(ig5Var.ordinal()) ? 256 : 128;
        }
        if ((i2 & 3072) == 0) {
            i3 |= p65Var.f(sh9Var) ? RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH : 1024;
        }
        if (p65Var.P(i3 & 1, (i3 & 1171) != 1170)) {
            r28 r28VarD = jfc.d(o28.b, 1.0f);
            omb ombVarA = nmb.a(a, z46.m, p65Var, 0);
            long j2 = p65Var.T;
            int i4 = (int) (j2 ^ (j2 >>> 32));
            i89 i89VarL = p65Var.l();
            r28 r28VarR = gx1.R(p65Var, r28VarD);
            r12.W.getClass();
            ot2 ot2Var = q12.b;
            p65Var.c0();
            if (p65Var.S) {
                p65Var.k(ot2Var);
            } else {
                p65Var.m0();
            }
            tp7.B(p65Var, q12.f, ombVarA);
            tp7.B(p65Var, q12.e, i89VarL);
            tp7.B(p65Var, q12.g, Integer.valueOf(i4));
            tp7.y(p65Var, q12.h);
            tp7.B(p65Var, q12.d, r28VarR);
            sq6 sq6Var = new sq6(1.0f, true);
            int i5 = i3 & 14;
            int i6 = i3 >> 3;
            nk7.q(dr9Var, ig5Var, sh9Var, sq6Var, null, p65Var, i5 | (i6 & PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION) | (i6 & 896), 16);
            if (dr9Var2 != null) {
                p65Var.Y(1537227536);
                z = true;
                nk7.q(dr9Var2, ig5Var, sh9Var, sq6Var, null, p65Var, i6 & PhotoshopDirectory.TAG_QUICK_MASK_INFORMATION, 16);
                p65Var.p(false);
            } else {
                z = true;
                p65Var.Y(1537456223);
                hp7.t(p65Var, sq6Var);
                p65Var.p(false);
            }
            p65Var.p(z);
        } else {
            p65Var.S();
        }
        mwa mwaVarS = p65Var.s();
        if (mwaVarS != null) {
            mwaVarS.d = new v8(i2, 22, dr9Var, dr9Var2, ig5Var, sh9Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0088  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x008a  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x008f  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0091  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:49:0x00a4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static final void x(boolean r10, defpackage.m45 r11, defpackage.m45 r12, defpackage.r28 r13, defpackage.x12 r14, int r15) {
        /*
            Method dump skipped, instruction units count: 210
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qb8.x(boolean, m45, m45, r28, x12, int):void");
    }

    public static void y(AtomicLong atomicLong, long j2) {
        long j3;
        long j4;
        do {
            j3 = atomicLong.get();
            if (j3 == Long.MAX_VALUE) {
                return;
            } else {
                j4 = j3 + j2;
            }
        } while (!atomicLong.compareAndSet(j3, j4 >= 0 ? j4 : Long.MAX_VALUE));
    }

    public abstract String D();

    public void I(anb anbVar, Object obj) {
        anbVar.getClass();
        if (obj == null) {
            return;
        }
        gnb gnbVarB0 = anbVar.B0(D());
        try {
            z(gnbVarB0, obj);
            gnbVarB0.w0();
            xz5.F(gnbVarB0, null);
        } finally {
        }
    }

    public abstract void z(gnb gnbVar, Object obj);

    /* JADX WARN: Code restructure failed: missing block: B:122:0x020e, code lost:
    
        r4 = r19;
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x0212, code lost:
    
        if (r4 == null) goto L179;
     */
    /* JADX WARN: Code restructure failed: missing block: B:124:0x0214, code lost:
    
        r2 = r4.size();
     */
    /* JADX WARN: Code restructure failed: missing block: B:125:0x0218, code lost:
    
        if (r2 <= 0) goto L179;
     */
    /* JADX WARN: Code restructure failed: missing block: B:126:0x021a, code lost:
    
        r6 = (android.animation.Keyframe) r4.get(0);
        r8 = (android.animation.Keyframe) r4.get(r2 - 1);
        r19 = r8.getFraction();
        r21 = r2;
        r2 = java.lang.Integer.TYPE;
        r5 = java.lang.Float.TYPE;
     */
    /* JADX WARN: Code restructure failed: missing block: B:127:0x0237, code lost:
    
        if (r19 >= 1.0f) goto L139;
     */
    /* JADX WARN: Code restructure failed: missing block: B:129:0x023d, code lost:
    
        if (r19 >= 0.0f) goto L131;
     */
    /* JADX WARN: Code restructure failed: missing block: B:130:0x023f, code lost:
    
        r19 = r10;
        r8.setFraction(1.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:131:0x0247, code lost:
    
        r19 = r10;
        r10 = r4.size();
     */
    /* JADX WARN: Code restructure failed: missing block: B:132:0x0255, code lost:
    
        if (r8.getType() != r5) goto L134;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x0257, code lost:
    
        r8 = android.animation.Keyframe.ofFloat(1.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:135:0x0260, code lost:
    
        if (r8.getType() != r2) goto L137;
     */
    /* JADX WARN: Code restructure failed: missing block: B:136:0x0262, code lost:
    
        r8 = android.animation.Keyframe.ofInt(1.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:137:0x0267, code lost:
    
        r8 = android.animation.Keyframe.ofObject(1.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:138:0x026b, code lost:
    
        r4.add(r10, r8);
        r21 = r21 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:139:0x0273, code lost:
    
        r19 = r10;
     */
    /* JADX WARN: Code restructure failed: missing block: B:140:0x0275, code lost:
    
        r8 = r6.getFraction();
     */
    /* JADX WARN: Code restructure failed: missing block: B:141:0x027c, code lost:
    
        if (r8 == 0.0f) goto L154;
     */
    /* JADX WARN: Code restructure failed: missing block: B:143:0x0280, code lost:
    
        if (r8 >= 0.0f) goto L145;
     */
    /* JADX WARN: Code restructure failed: missing block: B:144:0x0282, code lost:
    
        r6.setFraction(0.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:146:0x028a, code lost:
    
        if (r6.getType() != r5) goto L149;
     */
    /* JADX WARN: Code restructure failed: missing block: B:147:0x028c, code lost:
    
        r2 = android.animation.Keyframe.ofFloat(0.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:150:0x0296, code lost:
    
        if (r6.getType() != r2) goto L152;
     */
    /* JADX WARN: Code restructure failed: missing block: B:151:0x0298, code lost:
    
        r2 = android.animation.Keyframe.ofInt(0.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:152:0x029d, code lost:
    
        r2 = android.animation.Keyframe.ofObject(0.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:153:0x02a2, code lost:
    
        r4.add(0, r2);
        r21 = r21 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:154:0x02a7, code lost:
    
        r2 = r21;
        r5 = new android.animation.Keyframe[r2];
        r4.toArray(r5);
        r8 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:155:0x02af, code lost:
    
        if (r8 >= r2) goto L242;
     */
    /* JADX WARN: Code restructure failed: missing block: B:156:0x02b1, code lost:
    
        r4 = r5[r8];
     */
    /* JADX WARN: Code restructure failed: missing block: B:157:0x02ba, code lost:
    
        if (r4.getFraction() >= 0.0f) goto L160;
     */
    /* JADX WARN: Code restructure failed: missing block: B:158:0x02bc, code lost:
    
        if (r8 != 0) goto L161;
     */
    /* JADX WARN: Code restructure failed: missing block: B:159:0x02be, code lost:
    
        r4.setFraction(0.0f);
     */
    /* JADX WARN: Code restructure failed: missing block: B:160:0x02c1, code lost:
    
        r21 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:161:0x02c6, code lost:
    
        r6 = r2 - 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:162:0x02c8, code lost:
    
        if (r8 != r6) goto L164;
     */
    /* JADX WARN: Code restructure failed: missing block: B:163:0x02ca, code lost:
    
        r4.setFraction(1.0f);
        r21 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:164:0x02d4, code lost:
    
        r4 = r8 + 1;
        r10 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:165:0x02d9, code lost:
    
        if (r4 >= r6) goto L246;
     */
    /* JADX WARN: Code restructure failed: missing block: B:167:0x02e5, code lost:
    
        if (r5[r4].getFraction() < 0.0f) goto L169;
     */
    /* JADX WARN: Code restructure failed: missing block: B:169:0x02e8, code lost:
    
        r10 = r4;
        r4 = r4 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:171:0x02f2, code lost:
    
        r4 = (r5[r10 + 1].getFraction() - r5[r8 - 1].getFraction()) / ((r10 - r8) + 2);
        r6 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:172:0x030a, code lost:
    
        if (r6 > r10) goto L248;
     */
    /* JADX WARN: Code restructure failed: missing block: B:173:0x030c, code lost:
    
        r26 = r4;
        r5[r6].setFraction(r5[r6 - 1].getFraction() + r26);
        r6 = r6 + 1;
        r2 = r2;
        r4 = r26;
     */
    /* JADX WARN: Code restructure failed: missing block: B:174:0x0326, code lost:
    
        r21 = r2;
     */
    /* JADX WARN: Code restructure failed: missing block: B:175:0x0328, code lost:
    
        r8 = r8 + 1;
        r2 = r21;
     */
    /* JADX WARN: Code restructure failed: missing block: B:176:0x032d, code lost:
    
        r2 = android.animation.PropertyValuesHolder.ofKeyframe(r11, r5);
        r5 = 3;
     */
    /* JADX WARN: Code restructure failed: missing block: B:177:0x0332, code lost:
    
        if (r1 != 3) goto L180;
     */
    /* JADX WARN: Code restructure failed: missing block: B:178:0x0334, code lost:
    
        r2.setEvaluator(defpackage.d70.a);
     */
    /* JADX WARN: Code restructure failed: missing block: B:179:0x033a, code lost:
    
        r19 = r10;
        r5 = 3;
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:180:0x033f, code lost:
    
        r6 = 1;
        r8 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:181:0x0341, code lost:
    
        if (r2 != null) goto L183;
     */
    /* JADX WARN: Code restructure failed: missing block: B:182:0x0343, code lost:
    
        r2 = F(r9, r3, 0, 1, r11);
     */
    /* JADX WARN: Code restructure failed: missing block: B:183:0x0347, code lost:
    
        if (r2 == null) goto L187;
     */
    /* JADX WARN: Code restructure failed: missing block: B:184:0x0349, code lost:
    
        if (r15 != null) goto L186;
     */
    /* JADX WARN: Code restructure failed: missing block: B:185:0x034b, code lost:
    
        r15 = new java.util.ArrayList();
     */
    /* JADX WARN: Code restructure failed: missing block: B:186:0x0351, code lost:
    
        r15.add(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:187:0x0354, code lost:
    
        r9.recycle();
     */
    /* JADX WARN: Code restructure failed: missing block: B:190:0x0377, code lost:
    
        r6 = r3;
        r22 = r8;
        r19 = r10;
        r8 = r11;
     */
    /* JADX WARN: Code restructure failed: missing block: B:191:0x037d, code lost:
    
        if (r15 == null) goto L195;
     */
    /* JADX WARN: Code restructure failed: missing block: B:192:0x037f, code lost:
    
        r1 = r15.size();
        r2 = new android.animation.PropertyValuesHolder[r1];
        r11 = r8;
     */
    /* JADX WARN: Code restructure failed: missing block: B:193:0x0386, code lost:
    
        if (r11 >= r1) goto L249;
     */
    /* JADX WARN: Code restructure failed: missing block: B:194:0x0388, code lost:
    
        r2[r11] = (android.animation.PropertyValuesHolder) r15.get(r11);
        r11 = r11 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:195:0x0393, code lost:
    
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:196:0x0395, code lost:
    
        if (r2 == null) goto L200;
     */
    /* JADX WARN: Code restructure failed: missing block: B:198:0x0399, code lost:
    
        if ((r0 instanceof android.animation.ValueAnimator) == false) goto L200;
     */
    /* JADX WARN: Code restructure failed: missing block: B:199:0x039b, code lost:
    
        ((android.animation.ValueAnimator) r0).setValues(r2);
     */
    /* JADX WARN: Code restructure failed: missing block: B:200:0x03a1, code lost:
    
        r11 = r6;
        r0 = r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:211:0x03d2, code lost:
    
        if (r33 == null) goto L221;
     */
    /* JADX WARN: Code restructure failed: missing block: B:212:0x03d4, code lost:
    
        if (r19 == null) goto L221;
     */
    /* JADX WARN: Code restructure failed: missing block: B:213:0x03d6, code lost:
    
        r1 = new android.animation.Animator[r19.size()];
        r2 = r19.iterator();
        r11 = 0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:215:0x03e5, code lost:
    
        if (r2.hasNext() == false) goto L230;
     */
    /* JADX WARN: Code restructure failed: missing block: B:216:0x03e7, code lost:
    
        r1[r11] = (android.animation.Animator) r2.next();
        r11 = r11 + 1;
     */
    /* JADX WARN: Code restructure failed: missing block: B:217:0x03f3, code lost:
    
        if (r34 != 0) goto L220;
     */
    /* JADX WARN: Code restructure failed: missing block: B:218:0x03f5, code lost:
    
        r33.playTogether(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:219:0x03f8, code lost:
    
        return r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:220:0x03f9, code lost:
    
        r33.playSequentially(r1);
     */
    /* JADX WARN: Code restructure failed: missing block: B:221:0x03fc, code lost:
    
        return r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:8:0x0017, code lost:
    
        r19 = r10;
     */
    /* JADX WARN: Removed duplicated region for block: B:207:0x03b4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static android.animation.Animator C(android.content.Context r28, android.content.res.Resources r29, android.content.res.Resources.Theme r30, org.xmlpull.v1.XmlPullParser r31, android.util.AttributeSet r32, android.animation.AnimatorSet r33, int r34) throws org.xmlpull.v1.XmlPullParserException, java.io.IOException {
        /*
            Method dump skipped, instruction units count: 1021
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.qb8.C(android.content.Context, android.content.res.Resources, android.content.res.Resources$Theme, org.xmlpull.v1.XmlPullParser, android.util.AttributeSet, android.animation.AnimatorSet, int):android.animation.Animator");
    }

    public static final void E(vl4 vl4Var) {
        int i2 = ql4.b;
        if (vl4Var.b == 1 && vl4Var.c == 1) {
            return;
        }
        ywb.g(y30.o("BooleanFlagDelegate can work only with boolean flags (bitWidth = 1 and value = 1), but ", vl4Var, nGxjfIr.cMlJZFiAwg));
    }

    public static ValueAnimator K(Context context, Resources resources, Resources.Theme theme, AttributeSet attributeSet, ObjectAnimator objectAnimator, XmlPullParser xmlPullParser) {
        int i2;
        TypedArray typedArrayW = dl7.w(resources, theme, attributeSet, g01.g);
        TypedArray typedArrayW2 = dl7.w(resources, theme, attributeSet, g01.k);
        ValueAnimator valueAnimator = objectAnimator == null ? new ValueAnimator() : objectAnimator;
        long j2 = dl7.t(xmlPullParser, "duration") ? typedArrayW.getInt(1, 300) : 300;
        long j3 = xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "startOffset") != null ? typedArrayW.getInt(2, 0) : 0;
        int i3 = xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "valueType") != null ? typedArrayW.getInt(7, 4) : 4;
        if (xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "valueFrom") != null && xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "valueTo") != null) {
            if (i3 == 4) {
                TypedValue typedValuePeekValue = typedArrayW.peekValue(5);
                boolean z = typedValuePeekValue != null;
                int i4 = z ? typedValuePeekValue.type : 0;
                TypedValue typedValuePeekValue2 = typedArrayW.peekValue(6);
                boolean z2 = typedValuePeekValue2 != null;
                i3 = ((z && J(i4)) || (z2 && J(z2 ? typedValuePeekValue2.type : 0))) ? 3 : 0;
            }
            PropertyValuesHolder propertyValuesHolderF = F(typedArrayW, i3, 5, 6, "");
            if (propertyValuesHolderF != null) {
                valueAnimator.setValues(propertyValuesHolderF);
            }
        }
        valueAnimator.setDuration(j2);
        valueAnimator.setStartDelay(j3);
        valueAnimator.setRepeatCount(xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "repeatCount") != null ? typedArrayW.getInt(3, 0) : 0);
        valueAnimator.setRepeatMode(xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "repeatMode") != null ? typedArrayW.getInt(4, 1) : 1);
        if (typedArrayW2 != null) {
            ObjectAnimator objectAnimator2 = (ObjectAnimator) valueAnimator;
            String strQ = dl7.q(typedArrayW2, xmlPullParser, "pathData", 1);
            if (strQ != null) {
                String strQ2 = dl7.q(typedArrayW2, xmlPullParser, "propertyXName", 2);
                String strQ3 = dl7.q(typedArrayW2, xmlPullParser, "propertyYName", 3);
                if (i3 != 2) {
                }
                if (strQ2 == null && strQ3 == null) {
                    throw new InflateException(typedArrayW2.getPositionDescription() + " propertyXName or propertyYName is needed for PathData");
                }
                Path path = new Path();
                try {
                    wo7.r(wo7.m(strQ), path);
                    PathMeasure pathMeasure = new PathMeasure(path, false);
                    ArrayList arrayList = new ArrayList();
                    arrayList.add(Float.valueOf(0.0f));
                    float length = 0.0f;
                    do {
                        length = pathMeasure.getLength() + length;
                        arrayList.add(Float.valueOf(length));
                    } while (pathMeasure.nextContour());
                    PathMeasure pathMeasure2 = new PathMeasure(path, false);
                    int iMin = Math.min(100, ((int) (length / 0.5f)) + 1);
                    float[] fArr = new float[iMin];
                    float[] fArr2 = new float[iMin];
                    float[] fArr3 = new float[2];
                    float f2 = length / (iMin - 1);
                    int i5 = 0;
                    float f3 = 0.0f;
                    int i6 = 0;
                    while (i5 < iMin) {
                        int i7 = iMin;
                        int i8 = i5;
                        pathMeasure2.getPosTan(f3 - ((Float) arrayList.get(i6)).floatValue(), fArr3, null);
                        fArr[i8] = fArr3[0];
                        fArr2[i8] = fArr3[1];
                        int i9 = i6 + 1;
                        f3 += f2;
                        if (i9 < arrayList.size() && f3 > ((Float) arrayList.get(i9)).floatValue()) {
                            pathMeasure2.nextContour();
                            i6 = i9;
                        }
                        i5 = i8 + 1;
                        iMin = i7;
                    }
                    PropertyValuesHolder propertyValuesHolderOfFloat = strQ2 != null ? PropertyValuesHolder.ofFloat(strQ2, fArr) : null;
                    PropertyValuesHolder propertyValuesHolderOfFloat2 = strQ3 != null ? PropertyValuesHolder.ofFloat(strQ3, fArr2) : null;
                    if (propertyValuesHolderOfFloat == null) {
                        objectAnimator2.setValues(propertyValuesHolderOfFloat2);
                    } else if (propertyValuesHolderOfFloat2 == null) {
                        objectAnimator2.setValues(propertyValuesHolderOfFloat);
                    } else {
                        objectAnimator2.setValues(propertyValuesHolderOfFloat, propertyValuesHolderOfFloat2);
                    }
                    i2 = 0;
                } catch (RuntimeException e2) {
                    lg8.p("Error in parsing ".concat(strQ), e2);
                    return null;
                }
            } else {
                i2 = 0;
                objectAnimator2.setPropertyName(dl7.q(typedArrayW2, xmlPullParser, KLTXZbnQvj.gBAoFHkwNOvK, 0));
            }
        } else {
            i2 = 0;
        }
        int resourceId = xmlPullParser.getAttributeValue("http://schemas.android.com/apk/res/android", "interpolator") != null ? typedArrayW.getResourceId(i2, i2) : i2;
        if (resourceId > 0) {
            Interpolator interpolatorLoadInterpolator = AnimationUtils.loadInterpolator(context, resourceId);
            if (interpolatorLoadInterpolator == null) {
                z72.c("Failed to parse interpolator, no start tag found");
                return null;
            }
            valueAnimator.setInterpolator(interpolatorLoadInterpolator);
        }
        typedArrayW.recycle();
        if (typedArrayW2 != null) {
            typedArrayW2.recycle();
        }
        return valueAnimator;
    }

    public static final GetCredentialException e0(CharSequence charSequence, String str) {
        String string;
        str.getClass();
        switch (str.hashCode()) {
            case -781118336:
                if (str.equals("android.credentials.GetCredentialException.TYPE_UNKNOWN")) {
                    return new GetCredentialUnknownException(charSequence);
                }
                break;
            case -408155724:
                if (str.equals(mBTDfueQiGWRV.NSoUQLeUSTnjytM)) {
                    return new GetCredentialUnsupportedException(charSequence);
                }
                break;
            case -45448328:
                if (str.equals("android.credentials.GetCredentialException.TYPE_INTERRUPTED")) {
                    return new GetCredentialInterruptedException(charSequence);
                }
                break;
            case 580557411:
                if (str.equals("android.credentials.GetCredentialException.TYPE_USER_CANCELED")) {
                    return new GetCredentialCancellationException(charSequence);
                }
                break;
            case 627896683:
                if (str.equals("android.credentials.GetCredentialException.TYPE_NO_CREDENTIAL")) {
                    return new NoCredentialException(charSequence);
                }
                break;
            case 1594095913:
                if (str.equals("androidx.credentials.TYPE_GET_CREDENTIAL_PROVIDER_CONFIGURATION_EXCEPTION")) {
                    return new GetCredentialProviderConfigurationException(charSequence);
                }
                break;
        }
        if (tuc.N(str, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION", false)) {
            int i2 = GetPublicKeyCredentialException.b;
            if (charSequence != null) {
                string = charSequence.toString();
            } else {
                string = null;
            }
            try {
                if (tuc.N(str, "androidx.credentials.TYPE_GET_PUBLIC_KEY_CREDENTIAL_DOM_EXCEPTION", false)) {
                    int i3 = GetPublicKeyCredentialDomException.c;
                    return ht2.f0(str, string);
                }
                throw new FrameworkClassParsingException();
            } catch (FrameworkClassParsingException unused) {
                return new GetCredentialCustomException(string, str);
            }
        }
        return new GetCredentialCustomException(charSequence, str);
    }
}
