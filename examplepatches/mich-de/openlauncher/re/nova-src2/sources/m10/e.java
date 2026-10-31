package m10;

import com.teslacoilsw.launcher.rawdatalogger.SubmitRawDataLogWork;
import java.io.File;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class e extends ContinuationImpl {
    public int A;

    /* renamed from: t, reason: collision with root package name */
    public long f75808t;

    /* renamed from: u, reason: collision with root package name */
    public File[] f75809u;

    /* renamed from: v, reason: collision with root package name */
    public File f75810v;

    /* renamed from: w, reason: collision with root package name */
    public int f75811w;

    /* renamed from: x, reason: collision with root package name */
    public int f75812x;

    /* renamed from: y, reason: collision with root package name */
    public /* synthetic */ Object f75813y;

    /* renamed from: z, reason: collision with root package name */
    public final /* synthetic */ SubmitRawDataLogWork f75814z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public e(SubmitRawDataLogWork submitRawDataLogWork, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f75814z = submitRawDataLogWork;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f75813y = obj;
        this.A |= Integer.MIN_VALUE;
        return this.f75814z.doWork(this);
    }
}
