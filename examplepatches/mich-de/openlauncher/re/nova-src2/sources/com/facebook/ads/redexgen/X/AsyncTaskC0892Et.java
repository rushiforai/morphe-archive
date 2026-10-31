package com.facebook.ads.redexgen.X;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.AsyncTask;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Et, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class AsyncTaskC0892Et extends AsyncTask<String, Void, Bitmap[]> implements InterfaceC2091l6 {
    public static byte[] A0A;
    public static String[] A0B = {"Y", "r8ye64eLoQHeOJVpmB1uxWw1zCCHhuzX", "pvZIfONmKv3cVbimQPa9", "RLgA2SApOIsDDawooMs2KL5D8ZiCWoW1", "kM6akDIqkvY", "0vJdyNO9qrz2JF8Kt31GcmRDql8haFQB", "b8N1ZLVb0I2QrMIKflin5UtA7D7V4D", "X"};
    public int A00;
    public int A01;
    public InterfaceC2617th A02;
    public boolean A03;
    public final int A04;
    public final int A05;
    public final WeakReference<C2614te> A06;
    public final WeakReference<C0958Hi> A07;
    public final WeakReference<ImageView> A08;
    public final WeakReference<ViewGroup> A09;

    public static String A00(int i5, int i11, int i12) {
        byte[] bArrCopyOfRange = Arrays.copyOfRange(A0A, i5, i5 + i11);
        for (int i13 = 0; i13 < bArrCopyOfRange.length; i13++) {
            bArrCopyOfRange[i13] = (byte) ((bArrCopyOfRange[i13] - i12) - 48);
        }
        return new String(bArrCopyOfRange);
    }

    public static void A01() {
        A0A = new byte[]{-89, -91, -82, -91, -78, -87, -93};
    }

    /* JADX WARN: Failed to parse debug info
    java.lang.ArrayIndexOutOfBoundsException: Index 15 out of bounds for length 14
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.startVar(DebugInfoParser.java:203)
    	at jadx.plugins.input.dex.sections.debuginfo.DebugInfoParser.process(DebugInfoParser.java:125)
    	at jadx.plugins.input.dex.sections.DexCodeReader.getDebugInfo(DexCodeReader.java:122)
    	at jadx.core.dex.nodes.MethodNode.getDebugInfo(MethodNode.java:638)
    	at jadx.core.dex.visitors.debuginfo.DebugInfoAttachVisitor.visit(DebugInfoAttachVisitor.java:38)
     */
    private final Bitmap[] A03(String... strArr) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            String str = strArr[0];
            Bitmap bitmapA0O = null;
            Bitmap bitmapA01 = null;
            C0958Hi c0958Hi = this.A07.get();
            if (c0958Hi == null) {
                return new Bitmap[]{null, null};
            }
            try {
                bitmapA0O = new C2086kz(c0958Hi).A0O(str, this.A00, this.A01);
                if (bitmapA0O != null && !this.A03) {
                    bitmapA01 = AbstractC2436qm.A01(c0958Hi, bitmapA0O, this.A04, this.A05);
                }
            } catch (Throwable th2) {
                c0958Hi.A08().ABz(A00(0, 7, 16), AbstractC2126lf.A1V, new C2127lg(th2));
            }
            return new Bitmap[]{bitmapA0O, bitmapA01};
        } catch (Throwable th3) {
            AbstractC2311oi.A00(th3, this);
            return null;
        }
    }

    static {
        A01();
    }

    public AsyncTaskC0892Et(ViewGroup viewGroup, int i5, int i11, C0958Hi c0958Hi) {
        this.A03 = false;
        this.A00 = -1;
        this.A01 = -1;
        this.A07 = new WeakReference<>(c0958Hi);
        this.A06 = null;
        this.A08 = null;
        this.A09 = new WeakReference<>(viewGroup);
        this.A04 = i5;
        this.A05 = i11;
    }

    public AsyncTaskC0892Et(ViewGroup viewGroup, C0958Hi c0958Hi) {
        this(viewGroup, 12, 16, c0958Hi);
    }

    public AsyncTaskC0892Et(ImageView imageView, C0958Hi c0958Hi) {
        this.A03 = false;
        this.A00 = -1;
        this.A01 = -1;
        this.A07 = new WeakReference<>(c0958Hi);
        this.A06 = null;
        this.A08 = new WeakReference<>(imageView);
        this.A09 = null;
        this.A04 = 0;
        this.A05 = 1;
    }

    public AsyncTaskC0892Et(C2614te c2614te, C0958Hi c0958Hi) {
        this.A03 = false;
        this.A00 = -1;
        this.A01 = -1;
        this.A07 = new WeakReference<>(c0958Hi);
        this.A06 = new WeakReference<>(c2614te);
        this.A08 = null;
        this.A09 = null;
        this.A04 = 12;
        this.A05 = 16;
    }

    private final void A02(Bitmap[] result) throws Throwable {
        C0958Hi context;
        C2614te c2614te;
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            if (this.A08 != null) {
                ImageView imageView = this.A08.get();
                if (result[1] != null && !this.A03 && this.A04 != 0 && imageView != null) {
                    imageView.setImageBitmap(result[1]);
                    return;
                } else if (imageView != null) {
                    imageView.setImageBitmap(result[0]);
                }
            }
            if (this.A06 != null && (c2614te = this.A06.get()) != null) {
                c2614te.setImage(result[0], result[1]);
            }
            if (this.A09 != null && this.A09.get() != null && result[1] != null && (context = this.A07.get()) != null) {
                AbstractC2426qc.A0W(this.A09.get(), new BitmapDrawable(context.getResources(), result[1]));
            }
            if (this.A02 != null) {
                this.A02.AFA(new C2616tg(result[0]));
            }
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
        }
    }

    public final AsyncTaskC0892Et A04() {
        this.A00 = -1;
        this.A01 = -1;
        return this;
    }

    public final AsyncTaskC0892Et A05(int i5, int i11) {
        this.A00 = i5;
        this.A01 = i11;
        return this;
    }

    public final AsyncTaskC0892Et A06(InterfaceC2617th interfaceC2617th) {
        this.A02 = interfaceC2617th;
        return this;
    }

    public final void A07(String str) {
        if (TextUtils.isEmpty(str)) {
            if (this.A02 != null) {
                this.A02.AFA(new C2616tg(null));
                return;
            }
            return;
        }
        executeOnExecutor(ExecutorC2431qh.A06, str);
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC2091l6
    public final C0958Hi A7M() {
        return this.A07.get();
    }

    @Override // android.os.AsyncTask
    public final /* bridge */ /* synthetic */ Bitmap[] doInBackground(String[] strArr) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return null;
        }
        try {
            return A03(strArr);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            return null;
        }
    }

    @Override // android.os.AsyncTask
    public final /* bridge */ /* synthetic */ void onPostExecute(Bitmap[] bitmapArr) throws Throwable {
        if (AbstractC2311oi.A02(this)) {
            return;
        }
        try {
            A02(bitmapArr);
        } catch (Throwable th2) {
            AbstractC2311oi.A00(th2, this);
            String[] strArr = A0B;
            if (strArr[0].length() != strArr[7].length()) {
                throw new RuntimeException();
            }
            String[] strArr2 = A0B;
            strArr2[0] = "X";
            strArr2[7] = "y";
        }
    }
}
