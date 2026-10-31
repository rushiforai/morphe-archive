package tx;

import android.content.Context;
import com.instabridge.ai.account.AccountManager;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.FunctionReferenceImpl;

/* loaded from: classes4.dex */
public final /* synthetic */ class d2 extends FunctionReferenceImpl implements Function1 {

    /* renamed from: d, reason: collision with root package name */
    public static final d2 f89697d = new d2(1, AccountManager.class, "<init>", "<init>(Landroid/content/Context;)V", 0);

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        return new AccountManager((Context) obj);
    }
}
