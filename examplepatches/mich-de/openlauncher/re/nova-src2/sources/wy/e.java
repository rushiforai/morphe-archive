package wy;

import androidx.fragment.app.h1;
import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmissionPayload;
import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFoldersSubmissionDialog;
import e10.y2;
import java.io.IOException;
import java.util.regex.Pattern;
import kotlin.NoWhenBranchMatchedException;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlinx.serialization.json.Json;
import t70.i2;
import t70.k0;
import t70.m0;
import t70.y0;
import x80.a0;
import x80.d0;
import x80.e0;
import x80.g0;
import x80.h0;
import x80.i0;
import x80.j0;
import x80.z;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public static final e0 f94894a = new e0(new d0());

    /* renamed from: b, reason: collision with root package name */
    public static final y70.d f94895b;

    static {
        i2 i2VarD = m0.d();
        a80.e eVar = y0.f88884a;
        f94895b = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, a80.d.f488c));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static final Object a(SmartFolderSubmissionPayload smartFolderSubmissionPayload, ContinuationImpl continuationImpl) throws Throwable {
        d dVar;
        boolean zBooleanValue;
        if (continuationImpl instanceof d) {
            dVar = (d) continuationImpl;
            int i5 = dVar.f94893u;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                dVar.f94893u = i5 - Integer.MIN_VALUE;
            } else {
                dVar = new d(continuationImpl);
            }
        }
        Object objY = dVar.f94892t;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = dVar.f94893u;
        try {
            if (i11 == 0) {
                ResultKt.b(objY);
                String strEncodeToString = Json.INSTANCE.encodeToString(SmartFolderSubmissionPayload.CREATOR.serializer(), smartFolderSubmissionPayload);
                j0 j0Var = x80.k0.Companion;
                Pattern pattern = a0.f95396e;
                a0 a0VarB = z.b("application/json");
                j0Var.getClass();
                i0 i0VarA = j0.a(strEncodeToString, a0VarB);
                g0 g0Var = new g0();
                g0Var.k("https://novalauncher.com/smartfolders/index.php");
                g0Var.h(i0VarA);
                h0 h0VarB = g0Var.b();
                a80.e eVar = y0.f88884a;
                a80.d dVar2 = a80.d.f488c;
                u6.a aVar = new u6.a(h0VarB, null, 6);
                dVar.f94893u = 1;
                objY = m0.y(dVar2, aVar, dVar);
                if (objY == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objY);
            }
            zBooleanValue = ((Boolean) objY).booleanValue();
        } catch (IOException e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("SmartFolderSubmissionManager");
            bVar.p(e3, "Failed to submit smart folder data", new Object[0]);
            zBooleanValue = false;
        }
        return Boolean.valueOf(zBooleanValue);
    }

    public static void b(SmartFolderSubmissionPayload smartFolderSubmissionPayload, h1 h1Var, t70.j0 j0Var) {
        y2.f51877a.getClass();
        int iOrdinal = ((h) y2.x1().l()).ordinal();
        if (iOrdinal == 0) {
            try {
                SmartFoldersSubmissionDialog smartFoldersSubmissionDialog = new SmartFoldersSubmissionDialog();
                smartFoldersSubmissionDialog.setArguments(w.b.a(new Pair("payload", qp.a.f84296a.encodeToString(SmartFolderSubmissionPayload.CREATOR.serializer(), smartFolderSubmissionPayload))));
                smartFoldersSubmissionDialog.show(h1Var, "SmartFolderSubmissionManager");
                return;
            } catch (Exception e3) {
                mc0.d.f76206a.o(e3);
                return;
            }
        }
        if (iOrdinal == 1) {
            m0.t(j0Var, null, null, new c(smartFolderSubmissionPayload, null, 0), 3);
        } else {
            if (iOrdinal != 2) {
                throw new NoWhenBranchMatchedException();
            }
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("SmartFolderSubmissionManager");
            bVar.m("Skipped sending smart folders user submission due to DO_NOT_SEND preference.", new Object[0]);
        }
    }
}
