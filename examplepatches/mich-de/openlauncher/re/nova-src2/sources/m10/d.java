package m10;

import b.c0;
import db0.m0;
import java.io.File;
import java.io.IOException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.io.FilesKt;
import kotlin.jvm.functions.Function2;
import kotlinx.serialization.protobuf.ProtoBuf;
import t70.j0;

/* loaded from: classes4.dex */
public final class d extends SuspendLambda implements Function2 {

    /* renamed from: t, reason: collision with root package name */
    public final /* synthetic */ File f75806t;

    /* renamed from: u, reason: collision with root package name */
    public final /* synthetic */ m0 f75807u;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d(File file, m0 m0Var, Continuation continuation) {
        super(2, continuation);
        this.f75806t = file;
        this.f75807u = m0Var;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Continuation create(Object obj, Continuation continuation) {
        return new d(this.f75806t, this.f75807u, continuation);
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        return ((d) create((j0) obj, (Continuation) obj2)).invokeSuspend(Unit.f71706a);
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) throws IOException {
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        ResultKt.b(obj);
        m0 m0Var = this.f75807u;
        String strValueOf = String.valueOf(m0Var.f49171a);
        File file = this.f75806t;
        File file2 = new File(file, strValueOf);
        File file3 = new File(file, c0.E(file2.getName(), ".tmp"));
        ProtoBuf.Companion companion = ProtoBuf.INSTANCE;
        companion.getSerializersModule();
        FilesKt.v0(file3, companion.encodeToByteArray(m0.Companion.serializer(), m0Var));
        return Boolean.valueOf(file3.renameTo(file2));
    }
}
