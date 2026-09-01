package defpackage;

import android.os.Build;
import android.view.textclassifier.TextClassification;
import android.view.textclassifier.TextClassifier;
import android.view.textclassifier.TextSelection;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ua9 extends p4d implements b55 {
    public a98 b;
    public va9 c;
    public CharSequence d;
    public long e;
    public int f;
    public /* synthetic */ Object g;
    public final /* synthetic */ CharSequence h;
    public final /* synthetic */ long i;
    public final /* synthetic */ va9 j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ua9(long j, n92 n92Var, va9 va9Var, CharSequence charSequence) {
        super(2, n92Var);
        this.h = charSequence;
        this.i = j;
        this.j = va9Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        ua9 ua9Var = new ua9(this.i, n92Var, this.j, this.h);
        ua9Var.g = obj;
        return ua9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((ua9) create(lg8.c(obj), (n92) obj2)).invokeSuspend(c1e.a);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        long j;
        a98 a98Var;
        va9 va9Var;
        TextSelection textSelection;
        CharSequence charSequence;
        tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
        int i = this.f;
        if (i == 0) {
            br7.v(obj);
            TextClassifier textClassifierC = lg8.c(this.g);
            long j2 = this.i;
            int iF = bkd.f(j2);
            int iE = bkd.e(j2);
            CharSequence charSequence2 = this.h;
            TextSelection.Request.Builder builder = new TextSelection.Request.Builder(charSequence2, iF, iE);
            va9 va9Var2 = this.j;
            TextSelection.Request.Builder defaultLocales = builder.setDefaultLocales(va9Var2.c());
            int i2 = Build.VERSION.SDK_INT;
            if (i2 >= 31) {
                defaultLocales.setIncludeTextClassification(true);
            }
            TextSelection textSelectionSuggestSelection = textClassifierC.suggestSelection(defaultLocales.build());
            long jQ = lk7.q(textSelectionSuggestSelection.getSelectionStartIndex(), textSelectionSuggestSelection.getSelectionEndIndex());
            if (i2 < 31 || textSelectionSuggestSelection.getTextClassification() == null) {
                this.e = jQ;
                this.f = 2;
                if (this.j.b(this.h, jQ, textClassifierC, this) != tb2Var) {
                    j = jQ;
                }
            } else {
                a98Var = va9Var2.e;
                this.g = textSelectionSuggestSelection;
                this.b = a98Var;
                this.c = va9Var2;
                this.d = charSequence2;
                this.e = jQ;
                this.f = 1;
                if (a98Var.m(this, null) != tb2Var) {
                    va9Var = va9Var2;
                    textSelection = textSelectionSuggestSelection;
                    charSequence = charSequence2;
                    j = jQ;
                    TextClassification textClassification = textSelection.getTextClassification();
                    textClassification.getClass();
                    va9Var.g.setValue(new sgd(charSequence, j, textClassification));
                }
            }
            return tb2Var;
        }
        if (i == 1) {
            j = this.e;
            charSequence = this.d;
            va9Var = this.c;
            a98Var = this.b;
            textSelection = (TextSelection) this.g;
            br7.v(obj);
            try {
                TextClassification textClassification2 = textSelection.getTextClassification();
                textClassification2.getClass();
                va9Var.g.setValue(new sgd(charSequence, j, textClassification2));
            } finally {
                a98Var.f(null);
            }
        } else {
            if (i != 2) {
                ygf.f("call to 'resume' before 'invoke' with coroutine");
                return null;
            }
            j = this.e;
            br7.v(obj);
        }
        return new bkd(j);
    }
}
