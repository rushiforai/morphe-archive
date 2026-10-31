package e00;

import android.content.Context;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;

/* loaded from: classes4.dex */
public final class k extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ File f50599t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ Ref.ObjectRef f50600u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ Context f50601v;

    /* renamed from: w, reason: collision with root package name */
    public final /* synthetic */ h.k f50602w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public k(File file, Ref.ObjectRef objectRef, Context context, h.k kVar, Continuation continuation) {
        super(2, continuation);
        this.f50599t = file;
        this.f50600u = objectRef;
        this.f50601v = context;
        this.f50602w = kVar;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new k(this.f50599t, this.f50600u, this.f50601v, this.f50602w, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((k) create((t70.j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IOException {
        Context context = this.f50601v;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        File file = this.f50599t;
        file.mkdirs();
        File file2 = new File(file, (String) this.f50600u.f71863a);
        try {
            File parentFile = file2.getParentFile();
            Intrinsics.d(parentFile);
            parentFile.mkdirs();
            ay.i.d(context, new FileOutputStream(file2));
        } catch (FileNotFoundException e3) {
            e3.printStackTrace();
        }
        this.f50602w.a(o4.d.getUriForFile(context, "com.teslacoilsw.launcher.fileprovider", file2), null);
        return Unit.f71706a;
    }
}
