package uf;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.text.Layout;
import android.text.SpannableStringBuilder;
import android.text.StaticLayout;
import android.text.TextPaint;
import android.text.TextUtils;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.BackgroundColorSpan;
import android.text.style.ForegroundColorSpan;
import android.view.View;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/* loaded from: classes3.dex */
public final class a extends View {

    /* renamed from: a, reason: collision with root package name */
    public final ArrayList f91088a;

    /* renamed from: b, reason: collision with root package name */
    public List f91089b;

    /* renamed from: c, reason: collision with root package name */
    public float f91090c;

    /* renamed from: d, reason: collision with root package name */
    public b f91091d;

    /* renamed from: e, reason: collision with root package name */
    public float f91092e;

    public a(Context context) {
        super(context, null);
        this.f91088a = new ArrayList();
        this.f91089b = Collections.EMPTY_LIST;
        this.f91090c = 0.0533f;
        this.f91091d = b.f91093g;
        this.f91092e = 0.08f;
    }

    /* JADX WARN: Removed duplicated region for block: B:205:0x048b  */
    /* JADX WARN: Removed duplicated region for block: B:207:0x048e  */
    /* JADX WARN: Removed duplicated region for block: B:35:0x00a3  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void dispatchDraw(Canvas canvas) {
        List list;
        float f11;
        float f12;
        float f13;
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        char c11;
        float f14;
        int i15;
        float f15;
        int i16;
        int iMax;
        int iMin;
        int iRound;
        int i17;
        a aVar = this;
        List list2 = aVar.f91089b;
        if (list2.isEmpty()) {
            return;
        }
        int height = aVar.getHeight();
        int paddingLeft = aVar.getPaddingLeft();
        int paddingTop = aVar.getPaddingTop();
        int width = aVar.getWidth() - aVar.getPaddingRight();
        int paddingBottom = height - aVar.getPaddingBottom();
        if (paddingBottom <= paddingTop || width <= paddingLeft) {
            return;
        }
        int i18 = paddingBottom - paddingTop;
        float f16 = aVar.f91090c;
        float f17 = f16 == -3.4028235E38f ? -3.4028235E38f : f16 * i18;
        float f18 = 0.0f;
        if (f17 <= 0.0f) {
            return;
        }
        int size = list2.size();
        int i19 = 0;
        while (i19 < size) {
            jf.b bVarA = (jf.b) list2.get(i19);
            float f19 = f18;
            if (bVarA.f69519p != Integer.MIN_VALUE) {
                jf.a aVarA = bVarA.a();
                float f21 = bVarA.f69510e;
                list = list2;
                aVarA.f69496h = -3.4028235E38f;
                aVarA.f69497i = Integer.MIN_VALUE;
                aVarA.f69491c = null;
                if (bVarA.f69511f == 0) {
                    aVarA.f69493e = 1.0f - f21;
                    i17 = 0;
                    aVarA.f69494f = 0;
                } else {
                    i17 = 0;
                    aVarA.f69493e = (-f21) - 1.0f;
                    aVarA.f69494f = 1;
                }
                int i21 = bVarA.f69512g;
                if (i21 == 0) {
                    aVarA.f69495g = 2;
                } else if (i21 == 2) {
                    aVarA.f69495g = i17;
                }
                bVarA = aVarA.a();
            } else {
                list = list2;
            }
            int i22 = bVarA.n;
            float f22 = bVarA.o;
            if (f22 != -3.4028235E38f) {
                if (i22 == 0) {
                    f11 = i18;
                } else if (i22 != 1) {
                    f12 = i22 != 2 ? -3.4028235E38f : f22;
                } else {
                    f11 = height;
                }
                f12 = f11 * f22;
            }
            v vVar = (v) aVar.f91088a.get(i19);
            b bVar = aVar.f91091d;
            float f23 = aVar.f91092e;
            TextPaint textPaint = vVar.f91245f;
            int i23 = height;
            Bitmap bitmap = bVarA.f69509d;
            int i24 = i18;
            float f24 = bVarA.f69516k;
            int i25 = size;
            float f25 = bVarA.f69515j;
            int i26 = i19;
            int i27 = bVarA.f69514i;
            float f26 = bVarA.f69513h;
            float f27 = f12;
            int i28 = bVarA.f69512g;
            float f28 = f17;
            int i29 = bVarA.f69511f;
            float f29 = bVarA.f69510e;
            Layout.Alignment alignment = bVarA.f69507b;
            CharSequence charSequence = bVarA.f69506a;
            boolean z11 = bitmap == null;
            if (z11) {
                if (!TextUtils.isEmpty(charSequence)) {
                    f13 = f26;
                    i5 = bVarA.f69517l ? bVarA.f69518m : bVar.f91096c;
                }
                i13 = paddingTop;
                i14 = width;
                f17 = f28;
                c11 = 65535;
                i12 = paddingLeft;
                i19 = i26 + 1;
                aVar = this;
                f18 = f19;
                list2 = list;
                height = i23;
                i18 = i24;
                size = i25;
                paddingLeft = i12;
                paddingTop = i13;
                width = i14;
            } else {
                f13 = f26;
                i5 = -16777216;
            }
            CharSequence charSequence2 = vVar.f91248i;
            if ((charSequence2 == charSequence || (charSequence2 != null && charSequence2.equals(charSequence))) && wf.v.a(vVar.f91249j, alignment) && vVar.f91250k == bitmap && vVar.f91251l == f29 && vVar.f91252m == i29) {
                i11 = i28;
                if (Integer.valueOf(vVar.n).equals(Integer.valueOf(i11)) && vVar.o == f13 && Integer.valueOf(vVar.f91253p).equals(Integer.valueOf(i27)) && vVar.f91254q == f25 && vVar.f91255r == f24 && vVar.f91256s == bVar.f91094a && vVar.f91257t == bVar.f91095b && vVar.f91258u == i5 && vVar.f91260w == bVar.f91097d && vVar.f91259v == bVar.f91098e && wf.v.a(textPaint.getTypeface(), bVar.f91099f) && vVar.f91261x == f28 && vVar.f91262y == f27 && vVar.f91263z == f23 && vVar.A == paddingLeft && vVar.B == paddingTop && vVar.C == width && vVar.D == paddingBottom) {
                    vVar.a(canvas, z11);
                    i13 = paddingTop;
                    i14 = width;
                    f17 = f28;
                    c11 = 65535;
                    i12 = paddingLeft;
                    i19 = i26 + 1;
                    aVar = this;
                    f18 = f19;
                    list2 = list;
                    height = i23;
                    i18 = i24;
                    size = i25;
                    paddingLeft = i12;
                    paddingTop = i13;
                    width = i14;
                }
            } else {
                i11 = i28;
            }
            vVar.f91248i = charSequence;
            vVar.f91249j = alignment;
            vVar.f91250k = bitmap;
            vVar.f91251l = f29;
            vVar.f91252m = i29;
            vVar.n = i11;
            vVar.o = f13;
            vVar.f91253p = i27;
            vVar.f91254q = f25;
            vVar.f91255r = f24;
            vVar.f91256s = bVar.f91094a;
            vVar.f91257t = bVar.f91095b;
            vVar.f91258u = i5;
            vVar.f91260w = bVar.f91097d;
            vVar.f91259v = bVar.f91098e;
            textPaint.setTypeface(bVar.f91099f);
            f17 = f28;
            vVar.f91261x = f17;
            vVar.f91262y = f27;
            vVar.f91263z = f23;
            vVar.A = paddingLeft;
            vVar.B = paddingTop;
            vVar.C = width;
            vVar.D = paddingBottom;
            if (z11) {
                vVar.f91248i.getClass();
                CharSequence charSequence3 = vVar.f91248i;
                SpannableStringBuilder spannableStringBuilder = charSequence3 instanceof SpannableStringBuilder ? (SpannableStringBuilder) charSequence3 : new SpannableStringBuilder(vVar.f91248i);
                int i31 = vVar.C - vVar.A;
                int i32 = vVar.D - vVar.B;
                textPaint.setTextSize(vVar.f91261x);
                int i33 = (int) ((vVar.f91261x * 0.125f) + 0.5f);
                int i34 = i33 * 2;
                int i35 = i31 - i34;
                float f31 = vVar.f91254q;
                if (f31 != -3.4028235E38f) {
                    i35 = (int) (i35 * f31);
                }
                int i36 = i35;
                if (i36 <= 0) {
                    wf.a.D("SubtitlePainter", "Skipped drawing subtitle cue (insufficient space)");
                    i12 = paddingLeft;
                    i13 = paddingTop;
                    i14 = width;
                } else {
                    if (vVar.f91262y > f19) {
                        i12 = paddingLeft;
                        i13 = paddingTop;
                        i16 = 0;
                        spannableStringBuilder.setSpan(new AbsoluteSizeSpan((int) vVar.f91262y), 0, spannableStringBuilder.length(), 16711680);
                    } else {
                        i12 = paddingLeft;
                        i13 = paddingTop;
                        i16 = 0;
                    }
                    SpannableStringBuilder spannableStringBuilder2 = new SpannableStringBuilder(spannableStringBuilder);
                    if (vVar.f91260w == 1) {
                        ForegroundColorSpan[] foregroundColorSpanArr = (ForegroundColorSpan[]) spannableStringBuilder2.getSpans(i16, spannableStringBuilder2.length(), ForegroundColorSpan.class);
                        int i37 = 0;
                        for (int length = foregroundColorSpanArr.length; i37 < length; length = length) {
                            spannableStringBuilder2.removeSpan(foregroundColorSpanArr[i37]);
                            i37++;
                        }
                    }
                    if (Color.alpha(vVar.f91257t) > 0) {
                        int i38 = vVar.f91260w;
                        if (i38 == 0 || i38 == 2) {
                            i14 = width;
                            spannableStringBuilder.setSpan(new BackgroundColorSpan(vVar.f91257t), 0, spannableStringBuilder.length(), 16711680);
                        } else {
                            i14 = width;
                            spannableStringBuilder2.setSpan(new BackgroundColorSpan(vVar.f91257t), 0, spannableStringBuilder2.length(), 16711680);
                        }
                    } else {
                        i14 = width;
                    }
                    Layout.Alignment alignment2 = vVar.f91249j;
                    if (alignment2 == null) {
                        alignment2 = Layout.Alignment.ALIGN_CENTER;
                    }
                    Layout.Alignment alignment3 = alignment2;
                    SpannableStringBuilder spannableStringBuilder3 = spannableStringBuilder;
                    StaticLayout staticLayout = new StaticLayout(spannableStringBuilder3, textPaint, i36, alignment3, vVar.f91243d, vVar.f91244e, true);
                    vVar.E = staticLayout;
                    int height2 = staticLayout.getHeight();
                    int lineCount = vVar.E.getLineCount();
                    int i39 = 0;
                    int iMax2 = 0;
                    while (i39 < lineCount) {
                        iMax2 = Math.max((int) Math.ceil(vVar.E.getLineWidth(i39)), iMax2);
                        i39++;
                        height2 = height2;
                        lineCount = lineCount;
                        spannableStringBuilder2 = spannableStringBuilder2;
                    }
                    SpannableStringBuilder spannableStringBuilder4 = spannableStringBuilder2;
                    int i40 = height2;
                    int i41 = ((vVar.f91254q == -3.4028235E38f || iMax2 >= i36) ? iMax2 : i36) + i34;
                    float f32 = vVar.o;
                    if (f32 != -3.4028235E38f) {
                        int iRound2 = Math.round(i31 * f32);
                        int i42 = vVar.A;
                        int i43 = iRound2 + i42;
                        int i44 = vVar.f91253p;
                        if (i44 == 1) {
                            i43 = ((i43 * 2) - i41) / 2;
                        } else if (i44 == 2) {
                            i43 -= i41;
                        }
                        iMax = Math.max(i43, i42);
                        iMin = Math.min(iMax + i41, vVar.C);
                    } else {
                        iMax = vVar.A + ((i31 - i41) / 2);
                        iMin = iMax + i41;
                    }
                    int i45 = iMin - iMax;
                    if (i45 <= 0) {
                        wf.a.D("SubtitlePainter", "Skipped drawing subtitle cue (invalid horizontal positioning)");
                    } else {
                        float f33 = vVar.f91251l;
                        if (f33 != -3.4028235E38f) {
                            if (vVar.f91252m == 0) {
                                iRound = Math.round(i32 * f33) + vVar.B;
                                int i46 = vVar.n;
                                if (i46 == 2) {
                                    iRound -= i40;
                                } else if (i46 == 1) {
                                    iRound = ((iRound * 2) - i40) / 2;
                                }
                            } else {
                                int lineBottom = vVar.E.getLineBottom(0) - vVar.E.getLineTop(0);
                                float f34 = vVar.f91251l;
                                iRound = f34 >= f19 ? Math.round(f34 * lineBottom) + vVar.B : (Math.round((f34 + 1.0f) * lineBottom) + vVar.D) - i40;
                            }
                            int i47 = iRound + i40;
                            int i48 = vVar.D;
                            if (i47 > i48) {
                                iRound = i48 - i40;
                            } else {
                                int i49 = vVar.B;
                                if (iRound < i49) {
                                    iRound = i49;
                                }
                            }
                        } else {
                            iRound = (vVar.D - i40) - ((int) (i32 * vVar.f91263z));
                        }
                        vVar.E = new StaticLayout(spannableStringBuilder3, textPaint, i45, alignment3, vVar.f91243d, vVar.f91244e, true);
                        vVar.F = new StaticLayout(spannableStringBuilder4, textPaint, i45, alignment3, vVar.f91243d, vVar.f91244e, true);
                        vVar.G = iMax;
                        vVar.H = iRound;
                        vVar.I = i33;
                        c11 = 65535;
                    }
                }
                c11 = 65535;
            } else {
                i12 = paddingLeft;
                i13 = paddingTop;
                i14 = width;
                vVar.f91250k.getClass();
                Bitmap bitmap2 = vVar.f91250k;
                int i51 = vVar.C;
                int i52 = vVar.A;
                int i53 = vVar.D;
                int i54 = vVar.B;
                float f35 = i51 - i52;
                float f36 = (vVar.o * f35) + i52;
                float f37 = i53 - i54;
                float f38 = (vVar.f91251l * f37) + i54;
                int iRound3 = Math.round(f35 * vVar.f91254q);
                float f39 = vVar.f91255r;
                c11 = 65535;
                int iRound4 = f39 != -3.4028235E38f ? Math.round(f37 * f39) : Math.round((bitmap2.getHeight() / bitmap2.getWidth()) * iRound3);
                int i55 = vVar.f91253p;
                if (i55 == 2) {
                    f14 = iRound3;
                } else {
                    if (i55 == 1) {
                        f14 = iRound3 / 2;
                    }
                    int iRound5 = Math.round(f36);
                    i15 = vVar.n;
                    if (i15 != 2) {
                        f15 = iRound4;
                    } else {
                        if (i15 == 1) {
                            f15 = iRound4 / 2;
                        }
                        int iRound6 = Math.round(f38);
                        vVar.J = new Rect(iRound5, iRound6, iRound3 + iRound5, iRound4 + iRound6);
                    }
                    f38 -= f15;
                    int iRound62 = Math.round(f38);
                    vVar.J = new Rect(iRound5, iRound62, iRound3 + iRound5, iRound4 + iRound62);
                }
                f36 -= f14;
                int iRound52 = Math.round(f36);
                i15 = vVar.n;
                if (i15 != 2) {
                }
                f38 -= f15;
                int iRound622 = Math.round(f38);
                vVar.J = new Rect(iRound52, iRound622, iRound3 + iRound52, iRound4 + iRound622);
            }
            vVar.a(canvas, z11);
            i19 = i26 + 1;
            aVar = this;
            f18 = f19;
            list2 = list;
            height = i23;
            i18 = i24;
            size = i25;
            paddingLeft = i12;
            paddingTop = i13;
            width = i14;
        }
    }
}
