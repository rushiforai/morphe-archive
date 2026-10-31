package h60;

import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.TextUtils;
import android.widget.TextView;
import b.u4;
import ba0.r;
import bn.s0;
import io.sentry.e3;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import m.w;

/* loaded from: classes4.dex */
public final class d extends b {

    /* renamed from: a, reason: collision with root package name */
    public final tm.o f59483a;

    /* renamed from: b, reason: collision with root package name */
    public final e3 f59484b;

    /* renamed from: c, reason: collision with root package name */
    public final List f59485c;

    public d(tm.o oVar, e3 e3Var, List list) {
        TextView.BufferType bufferType = TextView.BufferType.SPANNABLE;
        this.f59483a = oVar;
        this.f59484b = e3Var;
        this.f59485c = list;
    }

    @Override // h60.b
    public final ba0.j a(String str) {
        Iterator it = this.f59485c.iterator();
        while (it.hasNext()) {
            str = ((f) it.next()).processMarkdown(str);
        }
        if (str == null) {
            throw new NullPointerException("input must not be null");
        }
        tm.o oVar = this.f59483a;
        y90.g gVar = new y90.g((ArrayList) oVar.f89493b, (b6.e) oVar.f89495d, (ArrayList) oVar.f89494c);
        int i5 = 0;
        while (true) {
            int length = str.length();
            int i11 = i5;
            while (true) {
                if (i11 >= length) {
                    i11 = -1;
                    break;
                }
                char cCharAt = str.charAt(i11);
                if (cCharAt == '\n' || cCharAt == '\r') {
                    break;
                }
                i11++;
            }
            if (i11 == -1) {
                break;
            }
            gVar.i(str.substring(i5, i11));
            i5 = i11 + 1;
            if (i5 < str.length() && str.charAt(i11) == '\r' && str.charAt(i5) == '\n') {
                i5 = i11 + 2;
            }
        }
        if (str.length() > 0 && (i5 == 0 || i5 < str.length())) {
            gVar.i(str.substring(i5));
        }
        gVar.f(gVar.n);
        w wVar = new w(gVar.f97041k, gVar.f97043m, false, 27);
        gVar.f97040j.getClass();
        y90.k kVar = new y90.k(wVar);
        Iterator it2 = gVar.o.iterator();
        while (it2.hasNext()) {
            ((da0.a) it2.next()).g(kVar);
        }
        ba0.j jVar = (ba0.j) gVar.f97042l.f97026b;
        Iterator it3 = ((ArrayList) oVar.f89496e).iterator();
        if (it3.hasNext()) {
            throw u4.e(it3);
        }
        return jVar;
    }

    @Override // h60.b
    public final o b(r rVar) {
        List list = this.f59485c;
        Iterator it = list.iterator();
        while (it.hasNext()) {
            ((f) it.next()).beforeRender(rVar);
        }
        e3 e3Var = this.f59484b;
        h hVar = (h) e3Var.f67208b;
        tm.o oVar = new tm.o((s0) e3Var.f67209c, new h(2), new p(), Collections.unmodifiableMap(hVar.f59486a), new br.a(8));
        rVar.a(oVar);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ((f) it2.next()).afterRender(rVar, oVar);
        }
        p pVar = (p) oVar.f89495d;
        o oVar2 = new o(pVar.f59493a);
        Iterator it3 = pVar.f59494b.iterator();
        while (it3.hasNext()) {
            n nVar = (n) it3.next();
            oVar2.setSpan(nVar.f59489a, nVar.f59490b, nVar.f59491c, nVar.f59492d);
        }
        return oVar2;
    }

    @Override // h60.b
    public final void c(TextView textView, Spanned spanned) {
        List list = this.f59485c;
        Iterator it = list.iterator();
        while (it.hasNext()) {
            ((f) it.next()).beforeSetText(textView, spanned);
        }
        textView.setText(spanned, TextView.BufferType.SPANNABLE);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            ((f) it2.next()).afterSetText(textView);
        }
    }

    @Override // h60.b
    public final SpannableStringBuilder d(String str) {
        o oVarB = b(a(str));
        return (!TextUtils.isEmpty(oVarB) || TextUtils.isEmpty(str)) ? oVarB : new SpannableStringBuilder(str);
    }
}
