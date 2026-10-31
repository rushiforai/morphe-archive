package tx;

import android.content.Context;
import com.instabridge.ai.account.AccountManager;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* loaded from: classes4.dex */
public final /* synthetic */ class m0 extends FunctionReferenceImpl implements Function1 {

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ int f89873d = 0;

    public m0() {
        super(1, AccountManager.class, "<init>", "<init>(Landroid/content/Context;)V", 0);
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        return new AccountManager((Context) obj);
    }
}
