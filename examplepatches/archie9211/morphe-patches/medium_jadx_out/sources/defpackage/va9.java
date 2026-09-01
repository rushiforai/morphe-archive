package defpackage;

import android.app.RemoteAction;
import android.content.Context;
import android.os.LocaleList;
import android.text.TextUtils;
import android.view.textclassifier.TextClassification;
import android.view.textclassifier.TextClassifier;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class va9 implements qa9 {
    public final ib2 a;
    public final Context b;
    public final vwb c;
    public final h67 d;
    public TextClassifier f;
    public final a98 e = new a98();
    public final k49 g = qo7.u(null);
    public final Object h = new Object();

    public va9(ib2 ib2Var, Context context, vwb vwbVar, h67 h67Var) {
        this.a = ib2Var;
        this.b = context;
        this.c = vwbVar;
        this.d = h67Var;
    }

    public final void a(ugd ugdVar, String str, long j, pi9 pi9Var) throws Exception {
        a98 a98Var = this.e;
        TextClassification textClassification = null;
        if (a98Var.e(null)) {
            sgd sgdVar = (sgd) this.g.getValue();
            TextClassification textClassification2 = (sgdVar != null && bkd.b(j, sgdVar.b) && g76.L(str, sgdVar.a)) ? sgdVar.c : null;
            a98Var.f(null);
            textClassification = textClassification2;
        }
        if (textClassification == null) {
            pi9Var.invoke(ugdVar);
            return;
        }
        boolean zIsEmpty = textClassification.getActions().isEmpty();
        Object obj = this.h;
        if (!zIsEmpty) {
            ugdVar.a.a(new lhd(obj, textClassification, 0));
        } else if ((textClassification.getIcon() != null || !TextUtils.isEmpty(textClassification.getLabel())) && (textClassification.getIntent() != null || textClassification.getOnClickListener() != null)) {
            ugdVar.a.a(new lhd(obj, textClassification, -1));
        }
        pi9Var.invoke(ugdVar);
        List<RemoteAction> actions = textClassification.getActions();
        int size = actions.size();
        for (int i = 0; i < size; i++) {
            actions.get(i);
            if (i > 0) {
                ugdVar.a.a(new lhd(obj, textClassification, i));
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0092 A[DONT_GENERATE] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(java.lang.CharSequence r17, long r18, android.view.textclassifier.TextClassifier r20, defpackage.p92 r21) {
        /*
            Method dump skipped, instruction units count: 225
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.va9.b(java.lang.CharSequence, long, android.view.textclassifier.TextClassifier, p92):java.lang.Object");
    }

    public final LocaleList c() {
        h67 h67Var = this.d;
        if (h67Var == null) {
            cm0.c();
            return cm0.a(new Locale[]{ka9.a.f().d().a});
        }
        ArrayList arrayList = new ArrayList(cu1.k0(h67Var, 10));
        Iterator it2 = h67Var.a.iterator();
        while (it2.hasNext()) {
            arrayList.add(((f67) it2.next()).a);
        }
        Locale[] localeArr = (Locale[]) arrayList.toArray(new Locale[0]);
        return cm0.a((Locale[]) Arrays.copyOf(localeArr, localeArr.length));
    }
}
