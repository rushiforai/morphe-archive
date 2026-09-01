package defpackage;

import android.content.Context;
import android.content.res.Resources;
import android.net.Uri;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.TextPaint;
import android.text.style.AbsoluteSizeSpan;
import android.text.style.LeadingMarginSpan;
import android.view.ViewGroup;
import android.widget.TextView;
import com.medium.proto.model.MarkupModel;
import com.medium.proto.model.ParagraphPb;
import com.medium.proto.obv.post.Alignment;
import com.medium.proto.obv.post.MarkupType;
import com.medium.proto.obv.post.ParagraphType;
import com.medium.reader.R;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c39 {
    public static final Map s;
    public static final hb8 t;
    public static final hb8 u;
    public final Context a;
    public final cxd b;
    public final String c;
    public final eh3 d;
    public final l09 e;
    public final f29 f;
    public final u29 g;
    public final boolean h;
    public final z19 i;
    public final mya j;
    public final l29 k;
    public final ViewGroup l;
    public final TextView m;
    public final TextView n;
    public final TextPaint o;
    public final SpannableStringBuilder p;
    public final nq7 q;
    public final Boolean r;

    static {
        ParagraphType paragraphType = ParagraphType.H1;
        Integer numValueOf = Integer.valueOf(R.style.TextStyle_StoryH2);
        f09 f09Var = new f09(paragraphType, numValueOf);
        f09 f09Var2 = new f09(ParagraphType.H2, numValueOf);
        f09 f09Var3 = new f09(ParagraphType.H3, Integer.valueOf(R.style.TextStyle_StoryH3));
        f09 f09Var4 = new f09(ParagraphType.H4, Integer.valueOf(R.style.TextStyle_StoryH4));
        f09 f09Var5 = new f09(ParagraphType.PQ, Integer.valueOf(R.style.TextStyle_StoryPullQuote));
        f09 f09Var6 = new f09(ParagraphType.BQ, Integer.valueOf(R.style.TextStyle_StoryBody));
        f09 f09Var7 = new f09(ParagraphType.PRE, Integer.valueOf(R.style.TextStyle_StoryPre));
        ParagraphType paragraphType2 = ParagraphType.IMG;
        Integer numValueOf2 = Integer.valueOf(R.style.TextStyle_StoryMediaCaption);
        s = ei7.Q(f09Var, f09Var2, f09Var3, f09Var4, f09Var5, f09Var6, f09Var7, new f09(paragraphType2, numValueOf2), new f09(ParagraphType.IFRAME, numValueOf2));
        t = new hb8(23);
        u = new hb8(24);
    }

    public c39(Context context, cxd cxdVar, String str, eh3 eh3Var, l09 l09Var, f29 f29Var, u29 u29Var, boolean z, z19 z19Var) {
        SpannableStringBuilder spannableStringBuilder;
        nq7 nq7Var;
        context.getClass();
        cxdVar.getClass();
        eh3Var.getClass();
        int i = l09Var.d;
        u29Var.getClass();
        z19Var.getClass();
        this.a = context;
        this.b = cxdVar;
        this.c = str;
        this.d = eh3Var;
        this.e = l09Var;
        this.f = f29Var;
        this.g = u29Var;
        this.h = z;
        this.i = z19Var;
        Resources resources = context.getResources();
        resources.getClass();
        Resources.Theme theme = context.getTheme();
        theme.getClass();
        this.j = new mya(resources, 12, theme);
        ParagraphPb paragraphPbA = o54.a(l09Var.b());
        l29 l29Var = new l29();
        l29Var.a = paragraphPbA;
        l29Var.f();
        this.k = l29Var;
        this.l = f29Var.getContainer();
        TextView text = f29Var.getText();
        this.m = text;
        this.n = f29Var.getBullet();
        f29Var.getSectionSeparatorView();
        this.o = text != null ? text.getPaint() : null;
        boolean z2 = (text != null ? text.getText() : null) instanceof SpannableStringBuilder;
        this.r = Boolean.valueOf(z2);
        if (z2) {
            CharSequence text2 = text != null ? text.getText() : null;
            text2.getClass();
            spannableStringBuilder = (SpannableStringBuilder) text2;
        } else {
            spannableStringBuilder = new SpannableStringBuilder("");
        }
        this.p = spannableStringBuilder;
        if (u29Var != u29.VIEW || eh3Var.a() != zy4.OPEN_DYSLEXIC) {
            ParagraphType paragraphType = l29Var.a.type;
            if (!l09Var.e(i)) {
                if (!l09Var.i(i)) {
                    if (!l09Var.h(i)) {
                        switch (paragraphType != null ? bxd.a[paragraphType.ordinal()] : -1) {
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                                nq7Var = nq7.SOHNE_MEDIUM;
                                break;
                            case 5:
                            case 6:
                            case 7:
                                nq7Var = nq7.SOHNE_REGULAR;
                                break;
                            case 8:
                                nq7Var = nq7.SOHNE_REGULAR_ITALIC;
                                break;
                            case 9:
                                nq7Var = nq7.FELL_REGULAR;
                                break;
                            case 10:
                                nq7Var = nq7.MONO;
                                break;
                            default:
                                nq7Var = nq7.SOURCE_SERIF_PRO;
                                break;
                        }
                    } else {
                        nq7Var = nq7.SOHNE_REGULAR;
                    }
                } else {
                    nq7Var = nq7.SOHNE_MEDIUM;
                }
            } else {
                nq7Var = nq7.SOHNE_REGULAR;
            }
        } else {
            ParagraphType paragraphType2 = l29Var.a.type;
            if (!l09Var.e(i)) {
                if (!l09Var.i(i)) {
                    if (!l09Var.h(i)) {
                        switch (paragraphType2 != null ? bxd.a[paragraphType2.ordinal()] : -1) {
                            case 1:
                            case 2:
                            case 3:
                            case 4:
                                nq7Var = nq7.OPEN_DYSLEXIC_BOLD;
                                break;
                            case 5:
                            case 6:
                            case 7:
                                nq7Var = nq7.OPEN_DYSLEXIC;
                                break;
                            case 8:
                                nq7Var = nq7.OPEN_DYSLEXIC_ITALIC;
                                break;
                            case 9:
                                nq7Var = nq7.OPEN_DYSLEXIC;
                                break;
                            case 10:
                                nq7Var = nq7.OPEN_DYSLEXIC_MONO;
                                break;
                            default:
                                nq7Var = nq7.OPEN_DYSLEXIC;
                                break;
                        }
                    } else {
                        nq7Var = nq7.OPEN_DYSLEXIC;
                    }
                } else {
                    nq7Var = nq7.OPEN_DYSLEXIC_BOLD;
                }
            } else {
                nq7Var = nq7.OPEN_DYSLEXIC;
            }
        }
        this.q = nq7Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:20:0x003b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a() {
        /*
            Method dump skipped, instruction units count: 298
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c39.a():void");
    }

    public final void b() {
        l29 l29Var = this.k;
        ParagraphType paragraphType = l29Var.a.type;
        if (bu1.p0(l28.e, paragraphType) || paragraphType == ParagraphType.BQ || l28.b(paragraphType)) {
            return;
        }
        Alignment alignment = l29Var.a.alignment;
        if (alignment == null) {
            alignment = Alignment.LEFT;
        }
        if (alignment != Alignment.CENTER && m()) {
            String str = l29Var.a.text;
            if (str == null) {
                str = "";
            }
            TextPaint textPaint = this.o;
            k(new y29(-Math.min(textPaint != null ? (int) textPaint.measureText(str, 0, 1) : 0, 60), 0), 0, 1, 17);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:132:0x0254  */
    /* JADX WARN: Removed duplicated region for block: B:149:0x029f A[FALL_THROUGH] */
    /* JADX WARN: Removed duplicated region for block: B:14:0x002b  */
    /* JADX WARN: Removed duplicated region for block: B:150:0x02a3  */
    /* JADX WARN: Removed duplicated region for block: B:158:0x02bc  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x004f  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x005e  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01a7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c() {
        /*
            Method dump skipped, instruction units count: 1418
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c39.c():void");
    }

    /* JADX WARN: Removed duplicated region for block: B:35:0x007c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d() {
        /*
            r6 = this;
            android.widget.TextView r0 = r6.m
            if (r0 == 0) goto L9e
            java.lang.CharSequence r1 = r0.getText()
            r2 = 0
            if (r1 == 0) goto L10
            int r3 = r1.length()
            goto L11
        L10:
            r3 = r2
        L11:
            int r4 = r0.getSelectionStart()
            if (r4 < 0) goto L22
            if (r4 > r3) goto L22
            int r4 = r0.getSelectionEnd()
            if (r4 < 0) goto L22
            if (r4 > r3) goto L22
            goto L2f
        L22:
            boolean r3 = r1 instanceof android.text.Spannable
            if (r3 == 0) goto L29
            android.text.Spannable r1 = (android.text.Spannable) r1
            goto L2a
        L29:
            r1 = 0
        L2a:
            if (r1 == 0) goto L2f
            android.text.Selection.setSelection(r1, r2, r2)
        L2f:
            android.text.InputFilter[] r1 = r0.getFilters()
            android.text.InputFilter[] r2 = new android.text.InputFilter[r2]
            r0.setFilters(r2)
            l29 r2 = r6.k
            com.medium.proto.model.ParagraphPb r2 = r2.a
            com.medium.proto.obv.post.ParagraphType r2 = r2.type
            l09 r3 = r6.e
            int r4 = r3.d
            boolean r5 = r3.i(r4)
            if (r5 == 0) goto L4c
            r2 = 2132083400(0x7f1502c8, float:1.9806941E38)
            goto L7d
        L4c:
            boolean r5 = r3.h(r4)
            if (r5 == 0) goto L56
            r2 = 2132083399(0x7f1502c7, float:1.980694E38)
            goto L7d
        L56:
            boolean r3 = r3.e(r4)
            if (r3 == 0) goto L60
            r2 = 2132083395(0x7f1502c3, float:1.9806931E38)
            goto L7d
        L60:
            r3 = 2132083390(0x7f1502be, float:1.980692E38)
            if (r2 == 0) goto L7c
            java.util.Map r4 = defpackage.c39.s
            boolean r5 = r4.containsKey(r2)
            if (r5 == 0) goto L7c
            java.lang.Integer r3 = java.lang.Integer.valueOf(r3)
            java.lang.Object r2 = j$.util.Map.EL.getOrDefault(r4, r2, r3)
            java.lang.Number r2 = (java.lang.Number) r2
            int r2 = r2.intValue()
            goto L7d
        L7c:
            r2 = r3
        L7d:
            r0.setTextAppearance(r2)
            cxd r2 = r6.b
            nq7 r3 = r6.q
            android.graphics.Typeface r2 = r2.a(r3)
            r0.setTypeface(r2)
            eh3 r6 = r6.d
            zy4 r6 = r6.a()
            zy4 r2 = defpackage.zy4.OPEN_DYSLEXIC
            if (r6 != r2) goto L9b
            r6 = 0
            r2 = 1065353216(0x3f800000, float:1.0)
            r0.setLineSpacing(r6, r2)
        L9b:
            r0.setFilters(r1)
        L9e:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c39.d():void");
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0111  */
    /* JADX WARN: Type inference failed for: r3v23, types: [java.util.AbstractMap, java.util.LinkedHashMap] */
    /* JADX WARN: Type inference failed for: r3v28, types: [java.util.Map] */
    /* JADX WARN: Type inference failed for: r3v32, types: [fy3] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e() {
        /*
            Method dump skipped, instruction units count: 1011
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c39.e():void");
    }

    public final void f() {
        j(u);
        d();
        c();
        b();
        a();
        i();
    }

    public final ni7 g(MarkupModel markupModel) {
        MarkupType markupType = markupModel.type;
        ParagraphType paragraphType = this.k.a.type;
        if (paragraphType == null) {
            return new e1e(markupModel);
        }
        if (markupType != MarkupType.A || paragraphType == ParagraphType.MIXTAPE_EMBED) {
            MarkupType markupType2 = MarkupType.EM;
            mya myaVar = this.j;
            cxd cxdVar = this.b;
            if (markupType == markupType2 || markupType == MarkupType.STRONG) {
                return new pi7(paragraphType, markupModel, cxdVar, myaVar);
            }
            if (markupType != MarkupType.CODE || paragraphType == ParagraphType.PRE) {
                return new e1e(markupModel);
            }
            cxdVar.getClass();
            return new qp1(paragraphType, markupModel, cxdVar, myaVar);
        }
        String str = markupModel.user_id;
        Uri uri = null;
        if (str == null || str.length() <= 0) {
            str = null;
        }
        String str2 = markupModel.href;
        if (str2 != null) {
            if (str2.length() <= 0) {
                str2 = null;
            }
            if (str2 != null) {
                uri = Uri.parse(str2);
            }
        }
        if (str != null) {
            return new lde(this.a, markupModel, new ps5(this, 23, str));
        }
        return uri != null ? new dk(paragraphType, markupModel, new ps5(this, 24, uri)) : new e1e(markupModel);
    }

    public final int h() {
        int iA = this.e.a();
        kyd.I(10);
        String string = Integer.toString(iA, 10);
        string.getClass();
        if (string.length() <= 1) {
            return 0;
        }
        int length = string.length() - 1;
        TextPaint textPaint = this.o;
        return Math.min(textPaint != null ? (int) textPaint.measureText(string, 0, length) : 0, 125);
    }

    public final void i() {
        String str;
        TextView textView = this.n;
        if (textView == null) {
            return;
        }
        x2b x2bVar = l28.a;
        l29 l29Var = this.k;
        textView.setVisibility(bu1.p0(l28.e, l29Var.a.type) ? 0 : 8);
        ParagraphType paragraphType = l29Var.a.type;
        int i = paragraphType == null ? -1 : b39.a[paragraphType.ordinal()];
        if (i == 1) {
            str = "•\t";
        } else if (i != 2) {
            str = "";
        } else {
            str = this.e.a() + ".\t";
        }
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder(str);
        ParagraphType paragraphType2 = l29Var.a.type;
        ParagraphType paragraphType3 = ParagraphType.ULI;
        nq7 nq7Var = this.q;
        cxd cxdVar = this.b;
        if (paragraphType2 == paragraphType3) {
            Context context = this.a;
            spannableStringBuilder.setSpan(new AbsoluteSizeSpan(context.getResources().getDimensionPixelSize(R.dimen.common_text_size_uli_dot)), 0, 1, 0);
            spannableStringBuilder.setSpan(new un0(-context.getResources().getDimensionPixelSize(R.dimen.common_text_size_uli_dot_bottom_pad)), 0, 1, 0);
            textView.setText(spannableStringBuilder);
            textView.setTypeface(cxdVar.a(nq7Var));
            return;
        }
        if (paragraphType2 == ParagraphType.OLI) {
            int i2 = -h();
            spannableStringBuilder.setSpan(new LeadingMarginSpan.Standard(i2, i2), 0, spannableStringBuilder.length(), 0);
            textView.setText(spannableStringBuilder);
            textView.setTypeface(cxdVar.a(nq7Var));
        }
    }

    public final void j(x45 x45Var) {
        TextView textView = this.m;
        CharSequence text = textView != null ? textView.getText() : null;
        Spannable spannable = text instanceof Spannable ? (Spannable) text : null;
        if (spannable != null) {
            Object[] spans = spannable.getSpans(0, spannable.length(), Object.class);
            spans.getClass();
            ArrayList arrayList = new ArrayList();
            for (Object obj : spans) {
                if (((Boolean) x45Var.invoke(obj)).booleanValue()) {
                    arrayList.add(obj);
                }
            }
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                spannable.removeSpan(it2.next());
            }
        }
    }

    public final void k(e39 e39Var, int i, int i2, int i3) {
        SpannableStringBuilder spannableStringBuilder = this.p;
        int iV = iq7.v(i, 0, spannableStringBuilder.length());
        int iV2 = iq7.v(i2, 0, spannableStringBuilder.length());
        spannableStringBuilder.setSpan(e39Var, Math.min(iV, iV2), Math.max(iV, iV2), i3);
    }

    public final void l(e39 e39Var) {
        String str = this.k.a.text;
        if (str == null) {
            str = "";
        }
        k(e39Var, 0, str.length(), 18);
    }

    public final boolean m() {
        Character chValueOf;
        l29 l29Var = this.k;
        String str = l29Var.a.text;
        if (str != null && str.length() > 0) {
            String str2 = l29Var.a.text;
            if (str2 == null) {
                chValueOf = null;
            } else {
                if (str2.length() == 0) {
                    ywb.h("Char sequence is empty.");
                    return false;
                }
                chValueOf = Character.valueOf(str2.charAt(0));
            }
            if (chValueOf == null) {
                ay0.e("Required value was null.");
            } else if (muc.R("'\"“‘„”", chValueOf.charValue())) {
                return true;
            }
        }
        return false;
    }
}
