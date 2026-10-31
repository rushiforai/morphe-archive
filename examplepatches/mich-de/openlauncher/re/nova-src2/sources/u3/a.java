package u3;

import android.graphics.Matrix;
import android.graphics.Shader;
import androidx.compose.ui.graphics.Canvas;
import i2.q;
import i2.t0;
import i2.u0;
import i2.x0;
import java.util.ArrayList;
import kotlin.NoWhenBranchMatchedException;
import m3.p;
import m3.r;
import x3.l;

/* loaded from: classes2.dex */
public abstract class a {
    public static final void a(p pVar, Canvas canvas, i2.p pVar2, float f11, u0 u0Var, l lVar, k2.g gVar) {
        canvas.save();
        ArrayList arrayList = pVar.f75954h;
        if (arrayList.size() <= 1 || (pVar2 instanceof x0)) {
            b(pVar, canvas, pVar2, f11, u0Var, lVar, gVar);
        } else {
            if (!(pVar2 instanceof t0)) {
                throw new NoWhenBranchMatchedException();
            }
            int size = arrayList.size();
            float fMax = 0.0f;
            float fB = 0.0f;
            for (int i5 = 0; i5 < size; i5++) {
                r rVar = (r) arrayList.get(i5);
                fB += rVar.f75962a.b();
                fMax = Math.max(fMax, rVar.f75962a.d());
            }
            Shader shaderB = ((t0) pVar2).b((Float.floatToRawIntBits(fMax) << 32) | (Float.floatToRawIntBits(fB) & 4294967295L));
            Matrix matrix = new Matrix();
            shaderB.getLocalMatrix(matrix);
            int size2 = arrayList.size();
            for (int i11 = 0; i11 < size2; i11++) {
                m3.a aVar = ((r) arrayList.get(i11)).f75962a;
                aVar.g(canvas, new q(shaderB), f11, u0Var, lVar, gVar);
                canvas.translate(0.0f, aVar.b());
                matrix.setTranslate(0.0f, -aVar.b());
                shaderB.setLocalMatrix(matrix);
            }
        }
        canvas.restore();
    }

    public static final void b(p pVar, Canvas canvas, i2.p pVar2, float f11, u0 u0Var, l lVar, k2.g gVar) {
        ArrayList arrayList = pVar.f75954h;
        int size = arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            r rVar = (r) arrayList.get(i5);
            rVar.f75962a.g(canvas, pVar2, f11, u0Var, lVar, gVar);
            canvas.translate(0.0f, rVar.f75962a.b());
        }
    }
}
