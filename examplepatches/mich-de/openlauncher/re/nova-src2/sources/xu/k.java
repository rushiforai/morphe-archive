package xu;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import androidx.compose.ui.graphics.Canvas;
import androidx.compose.ui.platform.AndroidCompositionLocals_androidKt;
import b3.u2;
import com.stripe.android.uicore.elements.IdentifierSpec;
import com.stripe.hcaptcha.HCaptchaException;
import com.teslacoilsw.launcher.novawidget.WeatherWidget;
import hv.h4;
import hv.n2;
import java.util.List;
import k30.x;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import ww.g0;

/* loaded from: classes4.dex */
public final /* synthetic */ class k implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f96365a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f96366b;

    public /* synthetic */ k(Object obj, int i5) {
        this.f96365a = i5;
        this.f96366b = obj;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f96365a) {
            case 0:
                l lVar = (l) this.f96366b;
                cv.f complete = (cv.f) obj;
                Intrinsics.g(complete, "complete");
                return new n2(((cv.w) lVar.f96367a.f48000c.f93973a.getValue()).f48043b, false, complete instanceof cv.e, new ww.e(14));
            case 1:
                n nVar = (n) this.f96366b;
                jv.u state = (jv.u) obj;
                Intrinsics.g(state, "state");
                return state.b(nVar.f96377a);
            case 2:
                r rVar = (r) this.f96366b;
                h4 state2 = (h4) obj;
                Intrinsics.g(state2, "state");
                return new n2(!rVar.f96384a.f60316m, state2.f60300e, state2.f60298c, new d(rVar, 1 == true ? 1 : 0));
            case 3:
                Drawable drawable = (Drawable) this.f96366b;
                k2.f fVar = (k2.f) obj;
                Canvas canvas = fVar.getDrawContext().getCanvas();
                drawable.setBounds(0, 0, (int) Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() >> 32)), (int) Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() & 4294967295L)));
                drawable.draw(i2.c.a(canvas));
                return Unit.f71706a;
            case 4:
                WeatherWidget weatherWidget = (WeatherWidget) this.f96366b;
                weatherWidget.f45928r = (x) obj;
                weatherWidget.B.run();
                return Unit.f71706a;
            case 5:
                yw.a aVar = (yw.a) this.f96366b;
                HCaptchaException exception = (HCaptchaException) obj;
                Intrinsics.g(exception, "exception");
                aVar.getClass();
                aVar.f18672b = exception;
                aVar.a();
                return Unit.f71706a;
            case 6:
                z0.b bVar = (z0.b) this.f96366b;
                bVar.f97877a.invoke((v0.a) obj, b3.g.c(bVar, AndroidCompositionLocals_androidKt.f14166b));
                return Unit.f71706a;
            case 7:
                ((Function1) obj).invoke((v0.a) this.f96366b);
                return Unit.f71706a;
            case 8:
                k kVar = (k) this.f96366b;
                u2 u2Var = (u2) obj;
                if (!(u2Var instanceof z0.a)) {
                    throw new IllegalStateException("TextContextMenuDataNode.TraverseKey key must only be attached to instances of TextContextMenuDataNode.");
                }
                kVar.invoke(((z0.a) u2Var).f97876a);
                return Boolean.TRUE;
            case 9:
                com.stripe.android.paymentsheet.paymentdatacollection.ach.g gVar = (com.stripe.android.paymentsheet.paymentdatacollection.ach.g) this.f96366b;
                List it = (List) obj;
                Intrinsics.g(it, "it");
                IdentifierSpec identifierSpec = (IdentifierSpec) b70.g.i1(it);
                return identifierSpec == null ? gVar.o : identifierSpec;
            default:
                ImageView imageView = (ImageView) this.f96366b;
                Bitmap bitmap = (Bitmap) obj;
                if (bitmap != null) {
                    imageView.setVisibility(0);
                    imageView.setImageBitmap(bitmap);
                } else {
                    imageView.setVisibility(8);
                }
                return Unit.f71706a;
        }
    }

    public /* synthetic */ k(k kVar, g0 g0Var) {
        this.f96365a = 8;
        this.f96366b = kVar;
    }
}
