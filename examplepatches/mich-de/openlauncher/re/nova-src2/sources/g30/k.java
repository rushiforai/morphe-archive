package g30;

import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import t70.j0;

/* loaded from: classes.dex */
public final class k extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ IBinder f57047t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ float f57048u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(IBinder iBinder, float f11, Continuation continuation) {
        super(2, continuation);
        this.f57047t = iBinder;
        this.f57048u = f11;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new k(this.f57047t, this.f57048u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((k) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Method method;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        Class cls = l.f57049j;
        if (cls != null && (method = l.f57050k) != null) {
            a70.d dVar = l.f57051l;
            if (((Number) dVar.getValue()).intValue() != -1) {
                try {
                    Object objInvoke = method.invoke(cls, null);
                    Intrinsics.e(objInvoke, "null cannot be cast to non-null type android.os.IInterface");
                    IBinder iBinderAsBinder = ((IInterface) objInvoke).asBinder();
                    Parcel parcelObtain = Parcel.obtain();
                    try {
                        try {
                            parcelObtain.writeInterfaceToken("android.view.IWindowSession");
                            parcelObtain.writeStrongBinder(this.f57047t);
                            parcelObtain.writeFloat(this.f57048u);
                            iBinderAsBinder.transact(((Number) dVar.getValue()).intValue(), parcelObtain, null, 1);
                        } catch (RemoteException e3) {
                            e3.printStackTrace();
                            Unit unit = Unit.f71706a;
                        }
                    } finally {
                        parcelObtain.recycle();
                    }
                } catch (IllegalAccessException e11) {
                    e11.printStackTrace();
                } catch (InvocationTargetException e12) {
                    e12.printStackTrace();
                }
            }
        }
        return Unit.f71706a;
    }
}
