package g20;

import com.teslacoilsw.launcher.search.shortcutsearch.ApiIntegrationsSyncWork;
import java.util.Iterator;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class c extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public ApiIntegrationsSyncWork f56927t;

    /* renamed from: u, reason: collision with root package name */
    public Iterator f56928u;

    /* renamed from: v, reason: collision with root package name */
    public a f56929v;

    /* renamed from: w, reason: collision with root package name */
    public /* synthetic */ Object f56930w;

    /* renamed from: x, reason: collision with root package name */
    public final /* synthetic */ ApiIntegrationsSyncWork f56931x;

    /* renamed from: y, reason: collision with root package name */
    public int f56932y;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c(ApiIntegrationsSyncWork apiIntegrationsSyncWork, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f56931x = apiIntegrationsSyncWork;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f56930w = obj;
        this.f56932y |= Integer.MIN_VALUE;
        return this.f56931x.doWork(this);
    }
}
