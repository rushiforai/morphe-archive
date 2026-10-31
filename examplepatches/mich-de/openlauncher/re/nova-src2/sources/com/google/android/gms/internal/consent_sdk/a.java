package com.google.android.gms.internal.consent_sdk;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.content.res.XmlResourceParser;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.Log;
import android.util.Xml;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.lang.reflect.Array;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.math.MathKt;

/* loaded from: classes3.dex */
public final class a implements a5.a0, p1.c, se.d, vf.j {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f31983a;

    /* renamed from: b, reason: collision with root package name */
    public int f31984b;

    /* renamed from: c, reason: collision with root package name */
    public int f31985c;

    /* renamed from: d, reason: collision with root package name */
    public Object f31986d;

    public a(Context context) {
        this.f31983a = 7;
        this.f31985c = 0;
        this.f31986d = context;
    }

    public int A() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        int i11 = i5 + 1;
        this.f31984b = i11;
        int i12 = (bArr[i5] & 255) << 24;
        int i13 = i5 + 2;
        this.f31984b = i13;
        int i14 = ((bArr[i11] & 255) << 16) | i12;
        int i15 = i5 + 3;
        this.f31984b = i15;
        int i16 = i14 | ((bArr[i13] & 255) << 8);
        this.f31984b = i5 + 4;
        return (bArr[i15] & 255) | i16;
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x006d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public String B() {
        if (g() == 0) {
            return null;
        }
        int i5 = this.f31984b;
        while (i5 < this.f31985c) {
            byte b11 = ((byte[]) this.f31986d)[i5];
            int i11 = wf.v.f94376a;
            if (b11 == 10 || b11 == 13) {
                break;
            }
            i5++;
        }
        int i12 = this.f31984b;
        if (i5 - i12 >= 3) {
            byte[] bArr = (byte[]) this.f31986d;
            if (bArr[i12] == -17 && bArr[i12 + 1] == -69 && bArr[i12 + 2] == -65) {
                this.f31984b = i12 + 3;
            }
        }
        byte[] bArr2 = (byte[]) this.f31986d;
        int i13 = this.f31984b;
        int i14 = wf.v.f94376a;
        String str = new String(bArr2, i13, i5 - i13, vk.e.f92809c);
        this.f31984b = i5;
        int i15 = this.f31985c;
        if (i5 != i15) {
            byte[] bArr3 = (byte[]) this.f31986d;
            if (bArr3[i5] == 13) {
                int i16 = i5 + 1;
                this.f31984b = i16;
                if (i16 != i15) {
                    int i17 = this.f31984b;
                    if (bArr3[i17] == 10) {
                        this.f31984b = i17 + 1;
                    }
                }
            }
        }
        return str;
    }

    public int C() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        int i11 = i5 + 1;
        this.f31984b = i11;
        int i12 = bArr[i5] & 255;
        int i13 = i5 + 2;
        this.f31984b = i13;
        int i14 = ((bArr[i11] & 255) << 8) | i12;
        int i15 = i5 + 3;
        this.f31984b = i15;
        int i16 = i14 | ((bArr[i13] & 255) << 16);
        this.f31984b = i5 + 4;
        return ((bArr[i15] & 255) << 24) | i16;
    }

    public long D() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        this.f31984b = i5 + 1;
        this.f31984b = i5 + 2;
        this.f31984b = i5 + 3;
        long j11 = (bArr[i5] & 255) | ((bArr[r2] & 255) << 8) | ((bArr[r7] & 255) << 16);
        this.f31984b = i5 + 4;
        long j12 = j11 | ((bArr[r8] & 255) << 24);
        this.f31984b = i5 + 5;
        long j13 = j12 | ((bArr[r7] & 255) << 32);
        this.f31984b = i5 + 6;
        long j14 = j13 | ((bArr[r8] & 255) << 40);
        this.f31984b = i5 + 7;
        long j15 = j14 | ((bArr[r7] & 255) << 48);
        this.f31984b = i5 + 8;
        return ((bArr[r8] & 255) << 56) | j15;
    }

    public long E() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        this.f31984b = i5 + 1;
        this.f31984b = i5 + 2;
        this.f31984b = i5 + 3;
        long j11 = (bArr[i5] & 255) | ((bArr[r2] & 255) << 8) | ((bArr[r7] & 255) << 16);
        this.f31984b = i5 + 4;
        return ((bArr[r4] & 255) << 24) | j11;
    }

    public int F() {
        int iC = C();
        if (iC >= 0) {
            return iC;
        }
        throw new IllegalStateException(b.c0.h(iC, "Top bit not zero: "));
    }

    public int G() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        int i11 = i5 + 1;
        this.f31984b = i11;
        int i12 = bArr[i5] & 255;
        this.f31984b = i5 + 2;
        return ((bArr[i11] & 255) << 8) | i12;
    }

    public long H() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        this.f31984b = i5 + 1;
        this.f31984b = i5 + 2;
        this.f31984b = i5 + 3;
        long j11 = ((bArr[i5] & 255) << 56) | ((bArr[r2] & 255) << 48) | ((bArr[r7] & 255) << 40);
        this.f31984b = i5 + 4;
        long j12 = j11 | ((bArr[r4] & 255) << 32);
        this.f31984b = i5 + 5;
        long j13 = j12 | ((bArr[r7] & 255) << 24);
        this.f31984b = i5 + 6;
        long j14 = j13 | ((bArr[r4] & 255) << 16);
        this.f31984b = i5 + 7;
        long j15 = j14 | ((bArr[r7] & 255) << 8);
        this.f31984b = i5 + 8;
        return (bArr[r4] & 255) | j15;
    }

    public String I() {
        if (g() == 0) {
            return null;
        }
        int i5 = this.f31984b;
        while (i5 < this.f31985c && ((byte[]) this.f31986d)[i5] != 0) {
            i5++;
        }
        byte[] bArr = (byte[]) this.f31986d;
        int i11 = this.f31984b;
        int i12 = wf.v.f94376a;
        String str = new String(bArr, i11, i5 - i11, vk.e.f92809c);
        this.f31984b = i5;
        if (i5 < this.f31985c) {
            this.f31984b = i5 + 1;
        }
        return str;
    }

    public String J(int i5) {
        if (i5 == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int i11 = this.f31984b;
        int i12 = (i11 + i5) - 1;
        int i13 = (i12 >= this.f31985c || ((byte[]) this.f31986d)[i12] != 0) ? i5 : i5 - 1;
        byte[] bArr = (byte[]) this.f31986d;
        int i14 = wf.v.f94376a;
        String str = new String(bArr, i11, i13, vk.e.f92809c);
        this.f31984b += i5;
        return str;
    }

    public short K() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        int i11 = i5 + 1;
        this.f31984b = i11;
        int i12 = (bArr[i5] & 255) << 8;
        this.f31984b = i5 + 2;
        return (short) ((bArr[i11] & 255) | i12);
    }

    public String L(int i5, Charset charset) {
        String str = new String((byte[]) this.f31986d, this.f31984b, i5, charset);
        this.f31984b += i5;
        return str;
    }

    public int M() {
        return (N() << 21) | (N() << 14) | (N() << 7) | N();
    }

    public int N() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        this.f31984b = i5 + 1;
        return bArr[i5] & 255;
    }

    public long O() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        this.f31984b = i5 + 1;
        this.f31984b = i5 + 2;
        this.f31984b = i5 + 3;
        long j11 = ((bArr[i5] & 255) << 24) | ((bArr[r2] & 255) << 16) | ((bArr[r7] & 255) << 8);
        this.f31984b = i5 + 4;
        return (bArr[r4] & 255) | j11;
    }

    public int P() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        int i11 = i5 + 1;
        this.f31984b = i11;
        int i12 = (bArr[i5] & 255) << 16;
        int i13 = i5 + 2;
        this.f31984b = i13;
        int i14 = ((bArr[i11] & 255) << 8) | i12;
        this.f31984b = i5 + 3;
        return (bArr[i13] & 255) | i14;
    }

    public int Q() {
        int iA = A();
        if (iA >= 0) {
            return iA;
        }
        throw new IllegalStateException(b.c0.h(iA, "Top bit not zero: "));
    }

    public long R() {
        long jH = H();
        if (jH >= 0) {
            return jH;
        }
        throw new IllegalStateException(b.u4.g(jH, "Top bit not zero: "));
    }

    public int S() {
        byte[] bArr = (byte[]) this.f31986d;
        int i5 = this.f31984b;
        int i11 = i5 + 1;
        this.f31984b = i11;
        int i12 = (bArr[i5] & 255) << 8;
        this.f31984b = i5 + 2;
        return (bArr[i11] & 255) | i12;
    }

    public long T() {
        int i5;
        int i11;
        long j11 = ((byte[]) this.f31986d)[this.f31984b];
        int i12 = 7;
        while (true) {
            if (i12 < 0) {
                break;
            }
            if (((1 << i12) & j11) != 0) {
                i12--;
            } else if (i12 < 6) {
                j11 &= r6 - 1;
                i11 = 7 - i12;
            } else if (i12 == 7) {
                i11 = 1;
            }
        }
        i11 = 0;
        if (i11 == 0) {
            throw new NumberFormatException(b.u4.g(j11, "Invalid UTF-8 sequence first byte: "));
        }
        for (i5 = 1; i5 < i11; i5++) {
            if ((((byte[]) this.f31986d)[this.f31984b + i5] & 192) != 128) {
                throw new NumberFormatException(b.u4.g(j11, "Invalid UTF-8 sequence continuation byte: "));
            }
            j11 = (j11 << 6) | (r3 & 63);
        }
        this.f31984b += i11;
        return j11;
    }

    public void U(int i5) {
        byte[] bArr = (byte[]) this.f31986d;
        if (bArr.length < i5) {
            bArr = new byte[i5];
        }
        V(i5, bArr);
    }

    public void V(int i5, byte[] bArr) {
        this.f31986d = bArr;
        this.f31985c = i5;
        this.f31984b = 0;
    }

    public void W(int i5, int i11, int i12) {
        ((byte[][]) this.f31986d)[i11][i5] = (byte) i12;
    }

    public void X(int i5) {
        wf.a.e(i5 >= 0 && i5 <= ((byte[]) this.f31986d).length);
        this.f31985c = i5;
    }

    public void Y(int i5) {
        wf.a.e(i5 >= 0 && i5 <= this.f31985c);
        this.f31984b = i5;
    }

    public void Z(int i5) {
        Y(this.f31984b + i5);
    }

    @Override // se.d
    public int a() {
        int i5 = this.f31984b;
        return i5 == -1 ? ((a) this.f31986d).Q() : i5;
    }

    public synchronized int a0() {
        int i5 = this.f31985c;
        if (i5 != 0) {
            return i5;
        }
        Context context = (Context) this.f31986d;
        PackageManager packageManager = context.getPackageManager();
        if (zg.b.a(context).f19206a.getPackageManager().checkPermission("com.google.android.c2dm.permission.SEND", "com.google.android.gms") == -1) {
            Log.e("Metadata", "Google Play services missing or without correct permission.");
            return 0;
        }
        Intent intent = new Intent("com.google.iid.TOKEN_REQUEST");
        intent.setPackage("com.google.android.gms");
        List<ResolveInfo> listQueryBroadcastReceivers = packageManager.queryBroadcastReceivers(intent, 0);
        if (listQueryBroadcastReceivers != null && !listQueryBroadcastReceivers.isEmpty()) {
            this.f31985c = 2;
            return 2;
        }
        Log.w("Metadata", "Failed to resolve IID implementation package, falling back");
        this.f31985c = 2;
        return 2;
    }

    @Override // se.d
    public int b() {
        return this.f31984b;
    }

    public synchronized int b0() {
        PackageInfo packageInfoC;
        if (this.f31984b == 0) {
            try {
                packageInfoC = zg.b.a((Context) this.f31986d).c(0, "com.google.android.gms");
            } catch (PackageManager.NameNotFoundException e3) {
                Log.w("Metadata", "Failed to find package ".concat(e3.toString()));
                packageInfoC = null;
            }
            if (packageInfoC != null) {
                this.f31984b = packageInfoC.versionCode;
            }
        }
        return this.f31984b;
    }

    @Override // p1.c
    public void c(int i5, int i11, int i12) {
        int i13 = this.f31985c == 0 ? this.f31984b : 0;
        ((p1.c) this.f31986d).c(i5 + i13, i11 + i13, i12);
    }

    @Override // p1.c
    public void d(int i5, int i11) {
        ((p1.c) this.f31986d).d(i5 + (this.f31985c == 0 ? this.f31984b : 0), i11);
    }

    @Override // p1.c
    public void e(Object obj, Function2 function2) {
        ((p1.c) this.f31986d).e(obj, function2);
    }

    @Override // se.d
    public int f() {
        return this.f31985c;
    }

    public int g() {
        return this.f31985c - this.f31984b;
    }

    @Override // vf.j
    public vf.k h() {
        return new vf.t(this.f31984b, this.f31985c, (m.w) this.f31986d);
    }

    public void i(Canvas canvas, float f11, Rect rect, Rect rect2, Paint paint) {
        Bitmap bitmap = (Bitmap) this.f31986d;
        rect2.set(0, 0, MathKt.b(bitmap.getWidth() * f11), MathKt.b(bitmap.getHeight() * f11));
        rect2.offset(rect.left - MathKt.b(this.f31984b * f11), rect.top - MathKt.b(this.f31985c * f11));
        canvas.drawBitmap(bitmap, (Rect) null, rect2, paint);
    }

    @Override // p1.c
    public void j(int i5, Object obj) {
        ((p1.c) this.f31986d).j(i5 + (this.f31985c == 0 ? this.f31984b : 0), obj);
    }

    @Override // p1.c
    public Object l() {
        return ((p1.c) this.f31986d).l();
    }

    @Override // p1.c
    public void m(int i5, Object obj) {
        ((p1.c) this.f31986d).m(i5 + (this.f31985c == 0 ? this.f31984b : 0), obj);
    }

    @Override // p1.c
    public void n(Object obj) {
        this.f31985c++;
        ((p1.c) this.f31986d).n(obj);
    }

    @Override // p1.c
    public void o() {
        ((p1.c) this.f31986d).o();
    }

    public void p(int i5) {
        byte[] bArr = (byte[]) this.f31986d;
        if (i5 > bArr.length) {
            this.f31986d = Arrays.copyOf(bArr, i5);
        }
    }

    @Override // p1.c
    public void q() {
        if (!(this.f31985c > 0)) {
            p1.u.c("OffsetApplier up called with no corresponding down");
        }
        this.f31985c--;
        ((p1.c) this.f31986d).q();
    }

    public int r(int i5) {
        int i11 = this.f31984b;
        if (i11 == 0) {
            return -1;
        }
        int i12 = i11 - 1;
        for (int i13 = this.f31985c; i13 != 0; i13--) {
            i12 -= 2;
            for (int i14 = ((int[]) this.f31986d)[i12]; i14 != 0; i14--) {
                int[] iArr = (int[]) this.f31986d;
                if (iArr[i12 + 1] == i5) {
                    return iArr[i12];
                }
                i12 -= 2;
            }
        }
        return -1;
    }

    public byte s(int i5, int i11) {
        return ((byte[][]) this.f31986d)[i11][i5];
    }

    public int t(int i5, boolean z11) {
        if (this.f31984b == 0 || i5 < 0) {
            return -1;
        }
        int i11 = 0;
        for (int i12 = this.f31985c; i12 != 0; i12--) {
            int[] iArr = (int[]) this.f31986d;
            int i13 = iArr[i11];
            if (i5 < i13) {
                int i14 = (i5 * 2) + 1 + i11;
                if (!z11) {
                    i14++;
                }
                return iArr[i14];
            }
            i5 -= i13;
            i11 += (i13 * 2) + 2;
        }
        return -1;
    }

    public String toString() {
        switch (this.f31983a) {
            case 10:
                int i5 = this.f31984b;
                int i11 = this.f31985c;
                StringBuilder sb2 = new StringBuilder((i5 * 2 * i11) + 2);
                for (int i12 = 0; i12 < i11; i12++) {
                    byte[] bArr = ((byte[][]) this.f31986d)[i12];
                    for (int i13 = 0; i13 < i5; i13++) {
                        byte b11 = bArr[i13];
                        if (b11 == 0) {
                            sb2.append(" 0");
                        } else if (b11 != 1) {
                            sb2.append("  ");
                        } else {
                            sb2.append(" 1");
                        }
                    }
                    sb2.append('\n');
                }
                return sb2.toString();
            default:
                return super.toString();
        }
    }

    @Override // a5.a0
    public a5.h2 u(View view, a5.h2 h2Var) {
        View view2 = (View) this.f31986d;
        int i5 = h2Var.f296a.g(7).top;
        int i11 = this.f31984b;
        if (i11 >= 0) {
            view2.getLayoutParams().height = i11 + i5;
            view2.setLayoutParams(view2.getLayoutParams());
        }
        view2.setPadding(view2.getPaddingLeft(), this.f31985c + i5, view2.getPaddingRight(), view2.getPaddingBottom());
        return h2Var;
    }

    public int v() {
        return this.f31985c;
    }

    public Function0 w() {
        return (Function0) this.f31986d;
    }

    public int x() {
        return this.f31984b;
    }

    public void y() {
        int[] iArr = (int[]) this.f31986d;
        int length = iArr.length;
        int i5 = this.f31984b;
        int i11 = length - i5;
        if (i11 <= 2) {
            int[] iArr2 = new int[(iArr.length + i11) * 2];
            System.arraycopy(iArr, 0, iArr2, 0, i5);
            this.f31986d = iArr2;
        }
        int i12 = this.f31984b;
        int[] iArr3 = (int[]) this.f31986d;
        iArr3[i12] = 0;
        iArr3[i12 + 1] = 0;
        this.f31984b = i12 + 2;
        this.f31985c++;
    }

    public void z(int i5, int i11, byte[] bArr) {
        System.arraycopy((byte[]) this.f31986d, this.f31984b, bArr, i5, i11);
        this.f31984b += i11;
    }

    public /* synthetic */ a(Object obj, int i5, int i11, int i12) {
        this.f31983a = i12;
        this.f31984b = i5;
        this.f31985c = i11;
        this.f31986d = obj;
    }

    public a(Bitmap bitmap, int i5, int i11) {
        this.f31983a = 4;
        this.f31986d = bitmap;
        this.f31984b = i5;
        this.f31985c = i11;
    }

    public a(int i5, int i11) {
        this.f31983a = 10;
        this.f31986d = (byte[][]) Array.newInstance((Class<?>) Byte.TYPE, i11, i5);
        this.f31984b = i5;
        this.f31985c = i11;
    }

    public a(int i5, byte b11) {
        this.f31983a = i5;
        switch (i5) {
            case 12:
                this.f31986d = new m.w(21);
                this.f31984b = 8000;
                this.f31985c = 8000;
                break;
            case 13:
                this.f31986d = wf.v.f94381f;
                break;
        }
    }

    public a(int i5) {
        this.f31983a = 13;
        this.f31986d = new byte[i5];
        this.f31985c = i5;
    }

    public a(byte[] bArr) {
        this.f31983a = 13;
        this.f31986d = bArr;
        this.f31985c = bArr.length;
    }

    public a(byte[] bArr, int i5) {
        this.f31983a = 13;
        this.f31986d = bArr;
        this.f31985c = i5;
    }

    public a(Context context, XmlResourceParser xmlResourceParser) throws Resources.NotFoundException {
        this.f31983a = 3;
        this.f31986d = new ArrayList();
        this.f31985c = -1;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(Xml.asAttributeSet(xmlResourceParser), j4.p.f69056h);
        int indexCount = typedArrayObtainStyledAttributes.getIndexCount();
        for (int i5 = 0; i5 < indexCount; i5++) {
            int index = typedArrayObtainStyledAttributes.getIndex(i5);
            if (index == 0) {
                this.f31984b = typedArrayObtainStyledAttributes.getResourceId(index, this.f31984b);
            } else if (index == 1) {
                int resourceId = typedArrayObtainStyledAttributes.getResourceId(index, this.f31985c);
                this.f31985c = resourceId;
                String resourceTypeName = context.getResources().getResourceTypeName(resourceId);
                context.getResources().getResourceName(resourceId);
                if ("layout".equals(resourceTypeName)) {
                    new j4.m().b((ConstraintLayout) LayoutInflater.from(context).inflate(resourceId, (ViewGroup) null));
                }
            }
        }
        typedArrayObtainStyledAttributes.recycle();
    }

    public a(p1.c cVar, int i5) {
        this.f31983a = 8;
        this.f31986d = cVar;
        this.f31984b = i5;
    }

    public a(View view, int i5, int i11) {
        this.f31983a = 1;
        this.f31984b = i5;
        this.f31986d = view;
        this.f31985c = i11;
    }

    public a(se.b bVar, fe.k0 k0Var) {
        this.f31983a = 9;
        a aVar = bVar.f87239c;
        this.f31986d = aVar;
        aVar.Y(12);
        int iQ = aVar.Q();
        if ("audio/raw".equals(k0Var.f54883l)) {
            int iP = wf.v.p(k0Var.A, k0Var.f54894y);
            if (iQ == 0 || iQ % iP != 0) {
                wf.a.D("AtomParsers", "Audio sample size mismatch. stsd sample size: " + iP + ", stsz sample size: " + iQ);
                iQ = iP;
            }
        }
        this.f31984b = iQ == 0 ? -1 : iQ;
        this.f31985c = aVar.Q();
    }
}
