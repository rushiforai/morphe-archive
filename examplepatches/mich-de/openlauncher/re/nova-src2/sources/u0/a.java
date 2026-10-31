package u0;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import kotlin.Unit;
import kotlin.jvm.functions.Function5;
import m3.o0;

/* loaded from: classes2.dex */
public final /* synthetic */ class a implements Function5 {
    @Override // kotlin.jvm.functions.Function5
    public final Object invoke(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        boolean zBooleanValue = ((Boolean) obj3).booleanValue();
        o0 o0Var = (o0) obj5;
        String string = ((CharSequence) obj4).subSequence(o0.f(o0Var.f75946a), o0.e(o0Var.f75946a)).toString();
        Intent intentPutExtra = new Intent().setAction("android.intent.action.PROCESS_TEXT").setType("text/plain").putExtra("android.intent.extra.PROCESS_TEXT_READONLY", zBooleanValue);
        ActivityInfo activityInfo = ((ResolveInfo) obj2).activityInfo;
        Intent className = intentPutExtra.setClassName(activityInfo.packageName, activityInfo.name);
        className.putExtra("android.intent.extra.PROCESS_TEXT", string);
        ((Context) obj).startActivity(className);
        return Unit.f71706a;
    }
}
