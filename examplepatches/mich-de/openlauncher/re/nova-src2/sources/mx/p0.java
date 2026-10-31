package mx;

import android.content.ComponentName;
import android.content.Intent;
import android.os.Handler;
import androidx.activity.result.ActivityResult;
import com.teslacoilsw.launcher.NovaLauncher;
import com.teslacoilsw.launcher.drawer.drawergroups.smart.crowdsourced.SmartFolderSubmissionPayload;
import kotlin.coroutines.Continuation;
import kotlin.jvm.functions.Function1;
import kw.s3;
import l1.g4;

/* loaded from: classes.dex */
public final /* synthetic */ class p0 implements j.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f77222a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f77223b;

    public /* synthetic */ p0(Object obj, int i5) {
        this.f77222a = i5;
        this.f77223b = obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // j.a
    public final void onActivityResult(Object obj) {
        int i5 = 2;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        switch (this.f77222a) {
            case 0:
                NovaLauncher novaLauncher = (NovaLauncher) this.f77223b;
                ComponentName componentName = NovaLauncher.f45646r1;
                a80.e eVar = t70.y0.f88884a;
                t70.m0.t(novaLauncher, a80.d.f488c, null, new g4(novaLauncher, (ActivityResult) obj, objArr == true ? 1 : 0, 10), 2);
                break;
            case 1:
                NovaLauncher novaLauncher2 = (NovaLauncher) this.f77223b;
                ComponentName componentName2 = NovaLauncher.f45646r1;
                a80.e eVar2 = t70.y0.f88884a;
                t70.m0.t(novaLauncher2, a80.d.f488c, null, new s3((Object) novaLauncher2, obj, (Continuation) (objArr2 == true ? 1 : 0), 15), 2);
                break;
            case 2:
                NovaLauncher novaLauncher3 = (NovaLauncher) this.f77223b;
                ComponentName componentName3 = NovaLauncher.f45646r1;
                Handler handler = yx.f.f97697a;
                a10.a aVar = yx.f.f97698b;
                if (aVar != null) {
                    yx.f.f97697a.removeCallbacks(aVar);
                }
                yx.f.f97698b = null;
                yx.f.f97699c.execute(new com.tiktok.appevents.d(novaLauncher3, i5));
                break;
            case 3:
                NovaLauncher novaLauncher4 = (NovaLauncher) this.f77223b;
                ActivityResult activityResult = (ActivityResult) obj;
                ComponentName componentName4 = NovaLauncher.f45646r1;
                if (activityResult.f13597a == -1) {
                    Intent intent = activityResult.f13598b;
                    SmartFolderSubmissionPayload smartFolderSubmissionPayload = intent != null ? (SmartFolderSubmissionPayload) intent.getParcelableExtra("SmartFolderSubmissionPayload") : null;
                    if (smartFolderSubmissionPayload != null) {
                        x80.e0 e0Var = wy.e.f94894a;
                        wy.e.b(smartFolderSubmissionPayload, novaLauncher4.getSupportFragmentManager(), novaLauncher4);
                        break;
                    }
                }
                break;
            default:
                ((Function1) ((p1.e1) this.f77223b).getValue()).invoke(obj);
                break;
        }
    }
}
