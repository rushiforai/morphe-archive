package e1;

import android.content.Context;
import android.os.LocaleList;
import android.view.textclassifier.TextClassification;
import android.view.textclassifier.TextClassifier;
import com.google.android.gms.internal.consent_sdk.h5;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Locale;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.internal.Intrinsics;
import p1.s2;
import p1.z2;

/* loaded from: classes2.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final CoroutineContext f51340a;

    /* renamed from: b, reason: collision with root package name */
    public final Context f51341b;

    /* renamed from: c, reason: collision with root package name */
    public final q f51342c;

    /* renamed from: d, reason: collision with root package name */
    public final t3.b f51343d;

    /* renamed from: f, reason: collision with root package name */
    public TextClassifier f51345f;

    /* renamed from: e, reason: collision with root package name */
    public final c80.d f51344e = new c80.d();

    /* renamed from: g, reason: collision with root package name */
    public final p1.e1 f51346g = androidx.compose.runtime.d.k(null);

    /* renamed from: h, reason: collision with root package name */
    public final Object f51347h = new Object();

    public n(CoroutineContext coroutineContext, Context context, q qVar, t3.b bVar) {
        this.f51340a = coroutineContext;
        this.f51341b = context;
        this.f51342c = qVar;
        this.f51343d = bVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(n nVar, CharSequence charSequence, long j11, TextClassifier textClassifier, ContinuationImpl continuationImpl) {
        l lVar;
        long j12;
        CharSequence charSequence2;
        TextClassifier textClassifier2;
        c80.d dVar;
        TextClassification textClassificationClassifyText;
        long j13;
        CharSequence charSequence3;
        c80.d dVar2 = nVar.f51344e;
        p1.e1 e1Var = nVar.f51346g;
        if (continuationImpl instanceof l) {
            lVar = (l) continuationImpl;
            int i5 = lVar.f51327z;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                lVar.f51327z = i5 - Integer.MIN_VALUE;
            } else {
                lVar = new l(nVar, continuationImpl);
            }
        }
        Object obj = lVar.f51325x;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = lVar.f51327z;
        try {
            if (i11 == 0) {
                ResultKt.b(obj);
                lVar.f51321t = charSequence;
                lVar.f51322u = textClassifier;
                lVar.f51323v = dVar2;
                j12 = j11;
                lVar.f51324w = j12;
                lVar.f51327z = 1;
                if (dVar2.e(lVar) != coroutineSingletons) {
                    charSequence2 = charSequence;
                    textClassifier2 = textClassifier;
                    dVar = dVar2;
                }
                return coroutineSingletons;
            }
            if (i11 != 1) {
                if (i11 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                j13 = lVar.f51324w;
                dVar2 = lVar.f51323v;
                textClassificationClassifyText = (TextClassification) lVar.f51322u;
                charSequence3 = lVar.f51321t;
                ResultKt.b(obj);
                try {
                    ((s2) e1Var).setValue(new n0(charSequence3, j13, textClassificationClassifyText));
                    Unit unit = Unit.f71706a;
                    dVar2.g(null);
                    return Unit.f71706a;
                } finally {
                }
            }
            j12 = lVar.f51324w;
            dVar = lVar.f51323v;
            textClassifier2 = (TextClassifier) lVar.f51322u;
            charSequence2 = lVar.f51321t;
            ResultKt.b(obj);
            n0 n0Var = (n0) ((s2) e1Var).getValue();
            if (n0Var != null) {
                z2 z2Var = p.f51361a;
                if (m3.o0.b(j12, n0Var.f51349b) && Intrinsics.b(charSequence2, n0Var.f51348a)) {
                    return Unit.f71706a;
                }
            }
            Unit unit2 = Unit.f71706a;
            dVar2.g(null);
            h5.t();
            textClassificationClassifyText = textClassifier2.classifyText(h5.h(charSequence2, m3.o0.f(j12), m3.o0.e(j12)).setDefaultLocales(nVar.b()).build());
            lVar.f51321t = charSequence2;
            lVar.f51322u = textClassificationClassifyText;
            lVar.f51323v = dVar2;
            lVar.f51324w = j12;
            lVar.f51327z = 2;
            if (dVar2.e(lVar) != coroutineSingletons) {
                j13 = j12;
                charSequence3 = charSequence2;
                ((s2) e1Var).setValue(new n0(charSequence3, j13, textClassificationClassifyText));
                Unit unit3 = Unit.f71706a;
                dVar2.g(null);
                return Unit.f71706a;
            }
            return coroutineSingletons;
        } finally {
        }
    }

    public final LocaleList b() {
        t3.b bVar = this.f51343d;
        if (bVar == null) {
            return new LocaleList(t3.c.f88513a.p().c().f88509a);
        }
        ArrayList arrayList = new ArrayList(b70.c.u0(bVar, 10));
        Iterator it = bVar.f88511a.iterator();
        while (it.hasNext()) {
            arrayList.add(((t3.a) it.next()).f88509a);
        }
        Locale[] localeArr = (Locale[]) arrayList.toArray(new Locale[0]);
        return new LocaleList((Locale[]) Arrays.copyOf(localeArr, localeArr.length));
    }

    public final Object c(String str, long j11, x0 x0Var) {
        if (str.length() == 0 || m3.o0.c(j11)) {
            return Unit.f71706a;
        }
        return t70.m0.y(this.f51340a, new androidx.room.p(this, new e0.b(this, str, j11, (Continuation) null, 3), (Continuation) null), x0Var);
    }
}
