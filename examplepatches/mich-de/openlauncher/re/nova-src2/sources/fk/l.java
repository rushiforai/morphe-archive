package fk;

import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.view.View;
import androidx.activity.result.IntentSenderRequest;
import b.c0;
import cl.k0;
import com.teslacoilsw.launcher.workspace.CrosshairsCellLayout;
import fk.l;
import java.lang.Character;
import java.text.BreakIterator;
import java.util.Arrays;
import java.util.Locale;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import p6.a1;
import x9.p;
import ya.j0;

/* loaded from: classes3.dex */
public class l implements ke.e {

    /* renamed from: a, reason: collision with root package name */
    public int f55199a;

    /* renamed from: b, reason: collision with root package name */
    public int f55200b;

    /* renamed from: c, reason: collision with root package name */
    public Object f55201c;

    /* renamed from: d, reason: collision with root package name */
    public Object f55202d;

    public l() {
        this.f55201c = new long[10];
        this.f55202d = new Object[10];
    }

    public static Rect h(Drawable drawable) {
        Rect rect = new Rect();
        drawable.copyBounds(rect);
        if (rect.width() == 0 || rect.height() == 0) {
            rect.set(0, 0, drawable.getIntrinsicWidth(), drawable.getIntrinsicHeight());
            return rect;
        }
        rect.offsetTo(0, 0);
        return rect;
    }

    public synchronized void a(long j11, Object obj) {
        if (this.f55200b > 0) {
            if (j11 <= ((long[]) this.f55201c)[((this.f55199a + r0) - 1) % ((Object[]) this.f55202d).length]) {
                d();
            }
        }
        f();
        int i5 = this.f55199a;
        int i11 = this.f55200b;
        Object[] objArr = (Object[]) this.f55202d;
        int length = (i5 + i11) % objArr.length;
        ((long[]) this.f55201c)[length] = j11;
        objArr[length] = obj;
        this.f55200b = i11 + 1;
    }

    public IntentSenderRequest b() {
        return new IntentSenderRequest((IntentSender) this.f55201c, (Intent) this.f55202d, this.f55199a, this.f55200b);
    }

    public void c(int i5) {
        int i11 = this.f55199a;
        int i12 = this.f55200b;
        boolean z11 = false;
        if (i5 <= i12 && i11 <= i5) {
            z11 = true;
        }
        if (z11) {
            return;
        }
        StringBuilder sbT = c0.t(i5, "Invalid offset: ", ". Valid range is [", i11, " , ");
        sbT.append(i12);
        sbT.append(AbstractJsonLexerKt.END_LIST);
        s3.a.a(sbT.toString());
    }

    public synchronized void d() {
        this.f55199a = 0;
        this.f55200b = 0;
        Arrays.fill((Object[]) this.f55202d, (Object) null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public aa.n e() {
        final float scaleX;
        int iWidth;
        int iHeight;
        Rect rect = (Rect) this.f55201c;
        View view = (View) this.f55202d;
        if (view instanceof ab.o) {
            return null;
        }
        if (view instanceof x9.p) {
            x9.p pVar = (x9.p) view;
            scaleX = pVar.l();
            pVar.k(rect);
            iWidth = (int) (rect.width() * scaleX);
            iHeight = (int) (rect.height() * scaleX);
        } else {
            scaleX = view.getScaleX();
            int width = view.getWidth();
            int height = view.getHeight();
            iWidth = width;
            iHeight = height;
        }
        int i5 = this.f55200b;
        return new aa.n(aa.f.a(iWidth + i5, iHeight + i5, new aa.f() { // from class: z9.a
            /* JADX WARN: Multi-variable type inference failed */
            @Override // aa.f
            public final void b(Canvas canvas) throws Exception {
                l lVar = this.f98346a;
                Rect rect2 = (Rect) lVar.f55201c;
                int iSave = canvas.save();
                float f11 = scaleX;
                canvas.scale(f11, f11);
                View view2 = (View) lVar.f55202d;
                if (!(view2 instanceof p)) {
                    throw new IllegalStateException();
                }
                p pVar2 = (p) view2;
                j0 j0VarE = pVar2.e();
                try {
                    pVar2.k(rect2);
                    int i11 = lVar.f55200b;
                    canvas.translate((i11 / 2) - rect2.left, (i11 / 2) - rect2.top);
                    view2.draw(canvas);
                    j0VarE.close();
                    canvas.restoreToCount(iSave);
                } catch (Throwable th2) {
                    try {
                        j0VarE.close();
                    } catch (Throwable th3) {
                        th2.addSuppressed(th3);
                    }
                    throw th2;
                }
            }
        }), 0, false);
    }

    public void f() {
        int length = ((Object[]) this.f55202d).length;
        if (this.f55200b < length) {
            return;
        }
        int i5 = length * 2;
        long[] jArr = new long[i5];
        Object[] objArr = new Object[i5];
        int i11 = this.f55199a;
        int i12 = length - i11;
        System.arraycopy((long[]) this.f55201c, i11, jArr, 0, i12);
        System.arraycopy((Object[]) this.f55202d, this.f55199a, objArr, 0, i12);
        int i13 = this.f55199a;
        if (i13 > 0) {
            System.arraycopy((long[]) this.f55201c, 0, jArr, i12, i13);
            System.arraycopy((Object[]) this.f55202d, 0, objArr, i12, this.f55199a);
        }
        this.f55201c = jArr;
        this.f55202d = objArr;
        this.f55199a = 0;
    }

    public View g() {
        View view = (View) this.f55202d;
        if (view instanceof ab.o) {
            return view;
        }
        return null;
    }

    public float i(Drawable drawable, int[] iArr) {
        View view = (View) this.f55202d;
        float fJ = ((za.d) za.d.p(view.getContext())).u().j(view, iArr);
        if (view instanceof ab.o) {
            fJ /= ((ab.o) view).f750a;
        } else if (view instanceof CrosshairsCellLayout) {
            return 1.0f;
        }
        iArr[0] = Math.round(iArr[0] - ((drawable.getIntrinsicWidth() - (view.getScaleX() * (view.getWidth() * fJ))) / 2.0f));
        iArr[1] = Math.round((iArr[1] - (((1.0f - fJ) * drawable.getIntrinsicHeight()) / 2.0f)) - (this.f55199a / 2));
        return fJ;
    }

    /* JADX WARN: Code restructure failed: missing block: B:32:0x00ab, code lost:
    
        if (r13 == r16) goto L35;
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x00b5, code lost:
    
        return new ke.d(-2, r13, r5 + r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x00b8, code lost:
    
        return ke.d.f71385d;
     */
    @Override // ke.e
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public ke.d j(ke.k kVar, long j11) {
        long j12;
        long position = kVar.getPosition();
        int iMin = (int) Math.min(this.f55200b, kVar.getLength() - position);
        com.google.android.gms.internal.consent_sdk.a aVar = (com.google.android.gms.internal.consent_sdk.a) this.f55202d;
        aVar.U(iMin);
        kVar.b(0, iMin, (byte[]) aVar.f31986d);
        int i5 = aVar.f31985c;
        long j13 = -1;
        long j14 = -1;
        long j15 = -9223372036854775807L;
        while (true) {
            if (aVar.g() < 188) {
                j12 = -9223372036854775807L;
                break;
            }
            byte[] bArr = (byte[]) aVar.f31986d;
            int i11 = aVar.f31984b;
            while (true) {
                if (i11 >= i5) {
                    j12 = -9223372036854775807L;
                    break;
                }
                j12 = -9223372036854775807L;
                if (bArr[i11] == 71) {
                    break;
                }
                i11++;
            }
            int i12 = i11 + 188;
            if (i12 > i5) {
                break;
            }
            long jQ = a1.q(i11, this.f55199a, aVar);
            if (jQ != j12) {
                long jB = ((wf.t) this.f55201c).b(jQ);
                if (jB > j11) {
                    return j15 == j12 ? new ke.d(-1, jB, position) : new ke.d(0, -9223372036854775807L, position + j14);
                }
                if (100000 + jB > j11) {
                    return new ke.d(0, -9223372036854775807L, position + i11);
                }
                j15 = jB;
                j14 = i11;
            }
            aVar.Y(i12);
            j13 = i12;
        }
    }

    public float k(View view, int[] iArr) {
        View view2 = (View) this.f55202d;
        float fJ = ((za.d) za.d.p(view2.getContext())).u().j(view2, iArr);
        if (view2 instanceof ab.o) {
            fJ /= ((ab.o) view2).f750a;
        }
        iArr[0] = Math.round(iArr[0] - ((view.getWidth() - (view2.getScaleX() * (view2.getWidth() * fJ))) / 2.0f));
        iArr[1] = Math.round((iArr[1] - (((1.0f - fJ) * view.getHeight()) / 2.0f)) - (this.f55199a / 2));
        return fJ;
    }

    @Override // ke.e
    public void l() {
        com.google.android.gms.internal.consent_sdk.a aVar = (com.google.android.gms.internal.consent_sdk.a) this.f55202d;
        byte[] bArr = wf.v.f94381f;
        aVar.getClass();
        aVar.V(bArr.length, bArr);
    }

    public boolean m(int i5) {
        CharSequence charSequence = (CharSequence) this.f55201c;
        int i11 = this.f55199a + 1;
        if (i5 > this.f55200b || i11 > i5) {
            return false;
        }
        return Character.isLetterOrDigit(Character.codePointBefore(charSequence, i5)) || Character.isSurrogate(charSequence.charAt(i5 - 1));
    }

    public boolean n(int i5) {
        int i11 = this.f55199a + 1;
        if (i5 > this.f55200b || i11 > i5) {
            return false;
        }
        return k0.H(Character.codePointBefore((CharSequence) this.f55201c, i5));
    }

    public boolean o(int i5) {
        c(i5);
        if (!((BreakIterator) this.f55202d).isBoundary(i5)) {
            return false;
        }
        if (q(i5) && q(i5 - 1) && q(i5 + 1)) {
            return false;
        }
        return i5 <= 0 || i5 >= ((CharSequence) this.f55201c).length() - 1 || !(p(i5) || p(i5 + 1));
    }

    public boolean p(int i5) {
        CharSequence charSequence = (CharSequence) this.f55201c;
        int i11 = i5 - 1;
        Character.UnicodeBlock unicodeBlockOf = Character.UnicodeBlock.of(charSequence.charAt(i11));
        Character.UnicodeBlock unicodeBlock = Character.UnicodeBlock.HIRAGANA;
        if (Intrinsics.b(unicodeBlockOf, unicodeBlock) && Intrinsics.b(Character.UnicodeBlock.of(charSequence.charAt(i5)), Character.UnicodeBlock.KATAKANA)) {
            return true;
        }
        return Intrinsics.b(Character.UnicodeBlock.of(charSequence.charAt(i5)), unicodeBlock) && Intrinsics.b(Character.UnicodeBlock.of(charSequence.charAt(i11)), Character.UnicodeBlock.KATAKANA);
    }

    public boolean q(int i5) {
        CharSequence charSequence = (CharSequence) this.f55201c;
        int i11 = this.f55199a;
        if (i5 >= this.f55200b || i11 > i5) {
            return false;
        }
        return Character.isLetterOrDigit(Character.codePointAt(charSequence, i5)) || Character.isSurrogate(charSequence.charAt(i5));
    }

    public boolean r(int i5) {
        int i11 = this.f55199a;
        if (i5 >= this.f55200b || i11 > i5) {
            return false;
        }
        return k0.H(Character.codePointAt((CharSequence) this.f55201c, i5));
    }

    public int s(int i5) {
        c(i5);
        int iFollowing = ((BreakIterator) this.f55202d).following(i5);
        return (q(iFollowing + (-1)) && q(iFollowing) && !p(iFollowing)) ? s(iFollowing) : iFollowing;
    }

    public Object t(long j11, boolean z11) {
        Object objU = null;
        long j12 = Long.MAX_VALUE;
        while (this.f55200b > 0) {
            long j13 = j11 - ((long[]) this.f55201c)[this.f55199a];
            if (j13 < 0 && (z11 || (-j13) >= j12)) {
                break;
            }
            objU = u();
            j12 = j13;
        }
        return objU;
    }

    public Object u() {
        wf.a.i(this.f55200b > 0);
        Object[] objArr = (Object[]) this.f55202d;
        int i5 = this.f55199a;
        Object obj = objArr[i5];
        objArr[i5] = null;
        this.f55199a = (i5 + 1) % objArr.length;
        this.f55200b--;
        return obj;
    }

    public int v(int i5) {
        c(i5);
        int iPreceding = ((BreakIterator) this.f55202d).preceding(i5);
        return (q(iPreceding) && m(iPreceding) && !p(iPreceding)) ? v(iPreceding) : iPreceding;
    }

    public void w(Intent intent) {
        this.f55202d = intent;
    }

    public void x(int i5, int i11) {
        this.f55200b = i5;
        this.f55199a = i11;
    }

    public l(CharSequence charSequence, int i5, Locale locale) {
        this.f55201c = charSequence;
        if (charSequence.length() < 0) {
            s3.a.a("input start index is outside the CharSequence");
        }
        if (i5 < 0 || i5 > charSequence.length()) {
            s3.a.a("input end index is outside the CharSequence");
        }
        BreakIterator wordInstance = BreakIterator.getWordInstance(locale);
        this.f55202d = wordInstance;
        this.f55199a = Math.max(0, -50);
        this.f55200b = Math.min(charSequence.length(), i5 + 50);
        wordInstance.setText(new n3.c(i5, charSequence));
    }

    public l(View view) throws Resources.NotFoundException {
        Context context = view.getContext();
        this.f55201c = new Rect();
        this.f55202d = view;
        int dimensionPixelSize = context.getResources().getDimensionPixelSize(2131165314);
        this.f55200b = dimensionPixelSize;
        this.f55199a = dimensionPixelSize;
    }

    public l(IntentSender intentSender) {
        Intrinsics.g(intentSender, "intentSender");
        this.f55201c = intentSender;
    }

    public l(int i5, int i11, float[] fArr, float[] fArr2) {
        this.f55199a = i5;
        wf.a.e(((long) fArr.length) * 2 == ((long) fArr2.length) * 3);
        this.f55201c = fArr;
        this.f55202d = fArr2;
        this.f55200b = i11;
    }
}
