package tx;

import com.teslacoilsw.launcher.ai.NovaAiChatActivity;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes4.dex */
public final class c0 extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public String f89672t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f89673u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ NovaAiChatActivity f89674v;

    /* renamed from: w, reason: collision with root package name */
    public int f89675w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public c0(NovaAiChatActivity novaAiChatActivity, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f89674v = novaAiChatActivity;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f89673u = obj;
        this.f89675w |= Integer.MIN_VALUE;
        return NovaAiChatActivity.b0(this.f89674v, this);
    }
}
