package kotlin.reflect.jvm.internal.calls;

import b.c0;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.reflect.Member;
import java.lang.reflect.Type;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0004\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0007\n\u0002\u0010\u0011\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\b`\u0018\u0000*\f\b\u0000\u0010\u0001 \u0001*\u0004\u0018\u00010\u00022\u00020\u0003J\u001b\u0010\u000f\u001a\u0004\u0018\u00010\u00032\n\u0010\u0010\u001a\u0006\u0012\u0002\b\u00030\u0011H&¢\u0006\u0002\u0010\u0012J\u0019\u0010\u0013\u001a\u00020\u00142\n\u0010\u0010\u001a\u0006\u0012\u0002\b\u00030\u0011H\u0016¢\u0006\u0002\u0010\u0015R\u0012\u0010\u0004\u001a\u00028\u0000X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006R\u0018\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\t0\bX¦\u0004¢\u0006\u0006\u001a\u0004\b\n\u0010\u000bR\u0012\u0010\f\u001a\u00020\tX¦\u0004¢\u0006\u0006\u001a\u0004\b\r\u0010\u000e¨\u0006\u0016"}, d2 = {"Lkotlin/reflect/jvm/internal/calls/Caller;", "M", "Ljava/lang/reflect/Member;", b.f42142b, "member", "getMember", "()Ljava/lang/reflect/Member;", "parameterTypes", b.f42142b, "Ljava/lang/reflect/Type;", "getParameterTypes", "()Ljava/util/List;", "returnType", "getReturnType", "()Ljava/lang/reflect/Type;", ActionCategory.CALL, "args", b.f42142b, "([Ljava/lang/Object;)Ljava/lang/Object;", "checkArguments", b.f42142b, "([Ljava/lang/Object;)V", "kotlin-reflection"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes5.dex */
public interface Caller<M extends Member> {

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    public static final class DefaultImpls {
        public static <M extends Member> void checkArguments(@NotNull Caller<? extends M> caller, @NotNull Object[] args) {
            Intrinsics.g(args, "args");
            if (CallerKt.getArity(caller) == args.length) {
                return;
            }
            StringBuilder sb2 = new StringBuilder("Callable expects ");
            sb2.append(CallerKt.getArity(caller));
            sb2.append(" arguments, but ");
            throw new IllegalArgumentException(c0.o(sb2, args.length, " were provided."));
        }
    }

    @Nullable
    Object call(@NotNull Object[] args);

    /* renamed from: getMember */
    M mo348getMember();

    @NotNull
    List<Type> getParameterTypes();

    @NotNull
    Type getReturnType();
}
