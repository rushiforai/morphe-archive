package kotlin.reflect;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.internal.IntrinsicConstEvaluation;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000T\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u0011\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000b\n\u0002\b\t\bf\u0018\u0000*\u0006\b\u0000\u0010\u0001 \u00012\u00020\u0002J%\u0010\u0016\u001a\u00028\u00002\u0016\u0010\u0017\u001a\f\u0012\b\b\u0001\u0012\u0004\u0018\u00010\u00190\u0018\"\u0004\u0018\u00010\u0019H&¢\u0006\u0002\u0010\u001aJ#\u0010\u001b\u001a\u00028\u00002\u0014\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u00190\u001cH&¢\u0006\u0002\u0010\u001dR\u001a\u0010\u0003\u001a\u00020\u00048&X§\u0004¢\u0006\f\u0012\u0004\b\u0005\u0010\u0006\u001a\u0004\b\u0007\u0010\bR\u0018\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u000b0\nX¦\u0004¢\u0006\u0006\u001a\u0004\b\f\u0010\rR\u0012\u0010\u000e\u001a\u00020\u000fX¦\u0004¢\u0006\u0006\u001a\u0004\b\u0010\u0010\u0011R \u0010\u0012\u001a\b\u0012\u0004\u0012\u00020\u00130\n8&X§\u0004¢\u0006\f\u0012\u0004\b\u0014\u0010\u0006\u001a\u0004\b\u0015\u0010\rR\u001c\u0010\u001e\u001a\u0004\u0018\u00010\u001f8&X§\u0004¢\u0006\f\u0012\u0004\b \u0010\u0006\u001a\u0004\b!\u0010\"R\u001a\u0010#\u001a\u00020$8&X§\u0004¢\u0006\f\u0012\u0004\b%\u0010\u0006\u001a\u0004\b#\u0010&R\u001a\u0010'\u001a\u00020$8&X§\u0004¢\u0006\f\u0012\u0004\b(\u0010\u0006\u001a\u0004\b'\u0010&R\u001a\u0010)\u001a\u00020$8&X§\u0004¢\u0006\f\u0012\u0004\b*\u0010\u0006\u001a\u0004\b)\u0010&R\u001a\u0010+\u001a\u00020$8&X§\u0004¢\u0006\f\u0012\u0004\b,\u0010\u0006\u001a\u0004\b+\u0010&¨\u0006-"}, d2 = {"Lkotlin/reflect/KCallable;", "R", "Lkotlin/reflect/KAnnotatedElement;", PendingUpgradeStore.KEY_NAME, b.f42142b, "getName$annotations", "()V", "getName", "()Ljava/lang/String;", "parameters", b.f42142b, "Lkotlin/reflect/KParameter;", "getParameters", "()Ljava/util/List;", "returnType", "Lkotlin/reflect/KType;", "getReturnType", "()Lkotlin/reflect/KType;", "typeParameters", "Lkotlin/reflect/KTypeParameter;", "getTypeParameters$annotations", "getTypeParameters", ActionCategory.CALL, "args", b.f42142b, b.f42142b, "([Ljava/lang/Object;)Ljava/lang/Object;", "callBy", b.f42142b, "(Ljava/util/Map;)Ljava/lang/Object;", "visibility", "Lkotlin/reflect/KVisibility;", "getVisibility$annotations", "getVisibility", "()Lkotlin/reflect/KVisibility;", "isFinal", b.f42142b, "isFinal$annotations", "()Z", "isOpen", "isOpen$annotations", "isAbstract", "isAbstract$annotations", "isSuspend", "isSuspend$annotations", "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface KCallable<R> extends KAnnotatedElement {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes4.dex */
    public static final class DefaultImpls {
        @IntrinsicConstEvaluation
        public static /* synthetic */ void getName$annotations() {
        }

        @SinceKotlin
        public static /* synthetic */ void getTypeParameters$annotations() {
        }

        @SinceKotlin
        public static /* synthetic */ void getVisibility$annotations() {
        }

        @SinceKotlin
        public static /* synthetic */ void isAbstract$annotations() {
        }

        @SinceKotlin
        public static /* synthetic */ void isFinal$annotations() {
        }

        @SinceKotlin
        public static /* synthetic */ void isOpen$annotations() {
        }

        @SinceKotlin
        public static /* synthetic */ void isSuspend$annotations() {
        }
    }

    R call(@NotNull Object... args);

    R callBy(@NotNull Map<KParameter, ? extends Object> args);

    @NotNull
    String getName();

    @NotNull
    List<KParameter> getParameters();

    @NotNull
    KType getReturnType();

    @NotNull
    List<KTypeParameter> getTypeParameters();

    @Nullable
    KVisibility getVisibility();

    boolean isAbstract();

    boolean isFinal();

    boolean isOpen();

    boolean isSuspend();
}
