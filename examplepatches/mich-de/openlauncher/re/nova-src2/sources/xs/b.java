package xs;

import com.stripe.android.link.ui.verification.VerificationViewState;
import com.stripe.android.model.ConsentUi;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.Unit;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kw.d1;
import kw.g1;
import kw.z0;
import p1.t;

/* loaded from: classes4.dex */
public final class b implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final b f96234a = new b();

    /* JADX WARN: Removed duplicated region for block: B:8:0x0020  */
    @Override // kotlin.jvm.functions.Function2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object invoke(Object obj, Object obj2) {
        p1.o oVar = (p1.o) obj;
        if ((((Number) obj2).intValue() & 3) == 2) {
            t tVar = (t) oVar;
            if (tVar.E()) {
                tVar.V();
            } else {
                VerificationViewState verificationViewState = new VerificationViewState(false, false, null, false, false, "(•••) ••• ••55", "email@email.com", true, false, null, new ConsentUi.ConsentSection("By continuing you’ll share your name, email, and phone with [Merchant]"), false);
                IdentifierSpec.Companion.getClass();
                g1 g1Var = new g1(z0.a("otp"), new d1());
                t tVar2 = (t) oVar;
                tVar2.b0(-877972287);
                Object objP = tVar2.P();
                p1.g1 g1Var2 = p1.n.f81514a;
                if (objP == g1Var2) {
                    objP = new ww.e(8);
                    tVar2.m0(objP);
                }
                Function0 function0 = (Function0) objP;
                Object objF = a2.c.f(-877970911, tVar2, false);
                if (objF == g1Var2) {
                    objF = new ww.e(9);
                    tVar2.m0(objF);
                }
                Function0 function02 = (Function0) objF;
                Object objF2 = a2.c.f(-877969183, tVar2, false);
                if (objF2 == g1Var2) {
                    objF2 = new ww.e(10);
                    tVar2.m0(objF2);
                }
                Function0 function03 = (Function0) objF2;
                Object objF3 = a2.c.f(-877967743, tVar2, false);
                if (objF3 == g1Var2) {
                    objF3 = new ww.e(11);
                    tVar2.m0(objF3);
                }
                Function0 function04 = (Function0) objF3;
                Object objF4 = a2.c.f(-877966335, tVar2, false);
                if (objF4 == g1Var2) {
                    objF4 = new ww.e(12);
                    tVar2.m0(objF4);
                }
                Function0 function05 = (Function0) objF4;
                Object objF5 = a2.c.f(-877965023, tVar2, false);
                if (objF5 == g1Var2) {
                    objF5 = new ww.e(13);
                    tVar2.m0(objF5);
                }
                tVar2.p(false);
                g.f(verificationViewState, g1Var, function0, function02, function03, function04, function05, (Function0) objF5, tVar2, 14380480);
            }
        }
        return Unit.f71706a;
    }
}
