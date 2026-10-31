package e10;

import android.content.ComponentName;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import com.teslacoilsw.launcher.homereset.HomeReset;
import java.util.Iterator;
import java.util.List;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;

/* loaded from: classes4.dex */
public final class v0 extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ int f51849t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ PackageManager f51850u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ v0(PackageManager packageManager, Continuation continuation, int i5) {
        super(2, continuation);
        this.f51849t = i5;
        this.f51850u = packageManager;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        switch (this.f51849t) {
            case 0:
                return new v0(this.f51850u, continuation, 0);
            default:
                return new v0(this.f51850u, continuation, 1);
        }
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        t70.j0 j0Var = (t70.j0) obj;
        Continuation continuation = (Continuation) obj2;
        switch (this.f51849t) {
        }
        return ((v0) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        ResolveInfo next;
        String string;
        int i5 = this.f51849t;
        PackageManager packageManager = this.f51850u;
        switch (i5) {
            case 0:
                CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                ComponentName componentNameB = HomeReset.b(packageManager);
                if (componentNameB != null) {
                    return componentNameB.getPackageName();
                }
                return null;
            default:
                CoroutineSingletons coroutineSingletons2 = CoroutineSingletons.f71806a;
                ResultKt.b(obj);
                List<ResolveInfo> listQueryIntentActivities = packageManager.queryIntentActivities(HomeReset.d(), 64);
                if (listQueryIntentActivities != null) {
                    Iterator<ResolveInfo> it = listQueryIntentActivities.iterator();
                    while (it.hasNext()) {
                        next = it.next();
                        if (next.filter.hasCategory("android.intent.category.DEFAULT") || (next.activityInfo.applicationInfo.flags & 1) != 0) {
                        }
                    }
                    next = null;
                } else {
                    next = null;
                }
                if (next == null) {
                    return new Pair(null, null);
                }
                ActivityInfo activityInfo = next.activityInfo;
                ComponentName componentName = new ComponentName(activityInfo.packageName, activityInfo.name);
                CharSequence charSequenceLoadLabel = next.activityInfo.applicationInfo.loadLabel(packageManager);
                if (charSequenceLoadLabel == null || (string = charSequenceLoadLabel.toString()) == null) {
                    string = next.activityInfo.packageName;
                }
                return new Pair(componentName, string);
        }
    }
}
