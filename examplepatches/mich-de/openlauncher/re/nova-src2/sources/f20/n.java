package f20;

import com.teslacoilsw.launcher.search.shortcutchips.ShortcutChipsRowView;
import kotlin.coroutines.jvm.internal.ContinuationImpl;

/* loaded from: classes.dex */
public final class n extends ContinuationImpl {

    /* renamed from: t, reason: collision with root package name */
    public ShortcutChipsRowView f54289t;

    /* renamed from: u, reason: collision with root package name */
    public /* synthetic */ Object f54290u;

    /* renamed from: v, reason: collision with root package name */
    public final /* synthetic */ ShortcutChipsRowView f54291v;

    /* renamed from: w, reason: collision with root package name */
    public int f54292w;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public n(ShortcutChipsRowView shortcutChipsRowView, ContinuationImpl continuationImpl) {
        super(continuationImpl);
        this.f54291v = shortcutChipsRowView;
    }

    @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
    public final Object invokeSuspend(Object obj) {
        this.f54290u = obj;
        this.f54292w |= Integer.MIN_VALUE;
        return this.f54291v.j(this);
    }
}
