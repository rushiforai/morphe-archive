package q10;

import java.io.DataOutputStream;
import kotlin.ResultKt;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import pu.q;
import t70.m0;
import t70.y0;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: e, reason: collision with root package name */
    public static final b f83431e = new b();

    /* renamed from: a, reason: collision with root package name */
    public Process f83432a;

    /* renamed from: b, reason: collision with root package name */
    public DataOutputStream f83433b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f83434c;

    /* renamed from: d, reason: collision with root package name */
    public final Object f83435d = new Object();

    public final Object a(String str, ContinuationImpl continuationImpl) {
        a80.e eVar = y0.f88884a;
        return m0.y(a80.d.f488c, new q(this, str, null, 6), continuationImpl);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object b(ContinuationImpl continuationImpl) {
        a aVar;
        b bVar;
        if (continuationImpl instanceof a) {
            aVar = (a) continuationImpl;
            int i5 = aVar.f83430w;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                aVar.f83430w = i5 - Integer.MIN_VALUE;
            } else {
                aVar = new a(this, continuationImpl);
            }
        }
        Object obj = aVar.f83428u;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = aVar.f83430w;
        if (i11 == 0) {
            ResultKt.b(obj);
            a80.e eVar = y0.f88884a;
            a80.d dVar = a80.d.f488c;
            q qVar = new q(this, (Continuation) null, 8);
            aVar.f83427t = this;
            aVar.f83430w = 1;
            if (m0.y(dVar, qVar, aVar) == coroutineSingletons) {
                return coroutineSingletons;
            }
            bVar = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            bVar = aVar.f83427t;
            ResultKt.b(obj);
        }
        return Boolean.valueOf(bVar.f83432a != null && bVar.f83434c);
    }

    public final void c() {
        try {
            DataOutputStream dataOutputStream = this.f83433b;
            if (dataOutputStream != null) {
                dataOutputStream.close();
            }
        } catch (Exception unused) {
        }
        this.f83433b = null;
        try {
            Process process = this.f83432a;
            if (process != null) {
                process.destroy();
            }
        } catch (Exception unused2) {
        }
        this.f83432a = null;
    }
}
