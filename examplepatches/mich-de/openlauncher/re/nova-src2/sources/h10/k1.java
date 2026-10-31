package h10;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.model.PaymentMethod;
import com.teslacoilsw.launcher.preferences.fragments.SettingsSearchBar;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendFunction;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import nova.branch.engage.sesame_lite.api_integration.ExternalLink;
import nova.branch.engage.sesame_lite.internal.Pkgs;
import nova.branch.engage.sesame_lite.internal.Strs;
import ou.g2;
import tx.k2;

/* loaded from: classes4.dex */
public final /* synthetic */ class k1 extends FunctionReferenceImpl implements Function2, SuspendFunction {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f58913d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ k1(int i5, Object obj, Class cls, String str, String str2, int i11, int i12) {
        super(i5, i11, cls, obj, str, str2);
        this.f58913d = i12;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f58913d) {
            case 0:
                ((SettingsSearchBar) this.receiver).A();
                break;
            case 1:
                ((SettingsSearchBar) this.receiver).A();
                break;
            case 2:
                ((SettingsSearchBar) this.receiver).A();
                break;
            case 3:
                ((SettingsSearchBar) this.receiver).A();
                break;
            case 4:
                ((SettingsSearchBar) this.receiver).A();
                break;
            case 5:
                String p12 = (String) obj2;
                Intrinsics.g(p12, "p1");
                ((ou.d) ((ou.o) this.receiver)).d((uu.b) obj, p12);
                break;
            case 6:
                break;
            case 7:
                com.stripe.android.customersheet.d.f((com.stripe.android.customersheet.d) this.receiver, (PaymentMethod) obj, (Continuation) obj2);
                break;
            case 8:
                String p13 = (String) obj2;
                Intrinsics.g(p13, "p1");
                ((ou.d) ((ou.o) this.receiver)).d((uu.b) obj, p13);
                break;
            case 9:
                String p14 = (String) obj2;
                Intrinsics.g(p14, "p1");
                ((ou.d) ((ou.o) this.receiver)).d((uu.b) obj, p14);
                break;
            case 10:
                ((k5.a) this.receiver).getClass();
                break;
            case 11:
                ((k5.a) this.receiver).getClass();
                break;
            case 12:
                String str = (String) obj;
                ((o20.f) this.receiver).getClass();
                List<p20.b> list = ((p20.a) obj2).f82009a;
                ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
                for (p20.b bVar : list) {
                    String strK = b.c0.k("slack_conv/", bVar.f82011a);
                    String str2 = bVar.f82012b;
                    String intentUri = Strs.INSTANCE.toIntentUri(new Intent("android.intent.action.VIEW", Uri.parse("slack://channel?team=" + str + "&id=" + bVar.f82011a)).setPackage(Pkgs.SLACK));
                    Intrinsics.d(intentUri);
                    arrayList.add(new ExternalLink(strK, str2, null, null, intentUri, null, null, 228));
                }
                break;
            case 13:
                String str3 = (String) obj;
                ((o20.f) this.receiver).getClass();
                List list2 = ((p20.j) obj2).f82030a;
                ArrayList arrayList2 = new ArrayList();
                for (Object obj3 : list2) {
                    if (!((p20.f) obj3).f82018c) {
                        arrayList2.add(obj3);
                    }
                }
                ArrayList arrayList3 = new ArrayList(b70.c.u0(arrayList2, 10));
                Iterator it = arrayList2.iterator();
                while (it.hasNext()) {
                    p20.f fVar = (p20.f) it.next();
                    String strK2 = b.c0.k("slack_member/", fVar.f82016a);
                    String str4 = fVar.f82019d;
                    String strA = ((p20.e) fVar.f82020e.f80413c).a();
                    String intentUri2 = Strs.INSTANCE.toIntentUri(new Intent("android.intent.action.VIEW", Uri.parse("slack://user?team=" + str3 + "&id=" + fVar.f82016a)).setPackage(Pkgs.SLACK));
                    Intrinsics.d(intentUri2);
                    arrayList3.add(new ExternalLink(strK2, str4, null, strA, intentUri2, null, null, 228));
                }
                break;
            case 14:
                Object objD = ((g2) this.receiver).d((PaymentMethod) obj, (Continuation) obj2);
                if (objD != CoroutineSingletons.f71806a) {
                    break;
                }
                break;
            case 15:
                int iIntValue = ((Number) obj2).intValue();
                ((zy.c) this.receiver).getClass();
                break;
            case 16:
                boolean zBooleanValue = ((Boolean) obj2).booleanValue();
                ((zy.c) this.receiver).getClass();
                break;
            case 17:
                int iIntValue2 = ((Number) obj2).intValue();
                ((zy.c) this.receiver).getClass();
                break;
            case 18:
                break;
            case 19:
                ((k2) this.receiver).getClass();
                t70.m0.t(k2.f89841c, null, null, new tx.h0(((Context) obj).getApplicationContext(), (Function1) obj2, (Continuation) null, 3), 3);
                break;
            default:
                ((ou.t) this.receiver).a((ResolvableString) obj, ((Boolean) obj2).booleanValue());
                break;
        }
        return Unit.f71706a;
    }
}
