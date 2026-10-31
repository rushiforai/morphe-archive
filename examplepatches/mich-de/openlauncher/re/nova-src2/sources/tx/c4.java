package tx;

import kotlin.Metadata;
import kotlin.coroutines.Continuation;
import kotlinx.serialization.json.JsonObject;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000(\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J$\u0010\u0007\u001a\u00020\u00062\b\b\u0001\u0010\u0003\u001a\u00020\u00022\b\b\u0003\u0010\u0005\u001a\u00020\u0004H§@¢\u0006\u0004\b\u0007\u0010\bJ\u001a\u0010\u000b\u001a\u00020\n2\b\b\u0001\u0010\u0005\u001a\u00020\tH§@¢\u0006\u0004\b\u000b\u0010\f¨\u0006\r"}, d2 = {"Ltx/c4;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "userId", "Lkotlinx/serialization/json/JsonObject;", "body", "Ltx/t3;", "a", "(Ljava/lang/String;Lkotlinx/serialization/json/JsonObject;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Ltx/c;", "Ltx/f;", "b", "(Ltx/c;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "nova-android_novaForPublicRelease"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public interface c4 {
    @gb0.k({"Cache-Control: no-store"})
    @gb0.o("v1/ai/get-person-id")
    @Nullable
    Object a(@gb0.i("user-id") @NotNull String str, @gb0.a @NotNull JsonObject jsonObject, @NotNull Continuation<? super t3> continuation);

    @gb0.k({"Cache-Control: no-store"})
    @gb0.o("v1/client/signin")
    @Nullable
    Object b(@gb0.a @NotNull c cVar, @NotNull Continuation<? super f> continuation);
}
