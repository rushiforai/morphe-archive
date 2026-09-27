.class public final Lkotlin/DeepRecursiveKt;
.super Ljava/lang/Object;
.source "DeepRecursive.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u001aA\u0010\u0000\u001a\u0002H\u0001\"\u0004\u0008\u0000\u0010\u0002\"\u0004\u0008\u0001\u0010\u0001*\u000e\u0012\u0004\u0012\u0002H\u0002\u0012\u0004\u0012\u0002H\u00010\u00032\u0006\u0010\u0004\u001a\u0002H\u0002H\u0087\u0082\u0004b\u000c\u0008\u0006\u0012\u0008\u0008\u0007\u0012\u0004\u0008\u0008(\u0008\u00a2\u0006\u0002\u0010\u0005\"\u0017\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u0010X\u0082\u0084\u0008\u00a2\u0006\u0004\n\u0002\u0010\u0011*r\u0008\u0002\u0010\t\"5\u0008\u0001\u0012\u000c\u0012\n\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u000c\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u000c0\r\u0012\u0006\u0012\u0004\u0018\u00010\u000c0\n\u00a2\u0006\u0002\u0008\u000e25\u0008\u0001\u0012\u000c\u0012\n\u0012\u0002\u0008\u0003\u0012\u0002\u0008\u00030\u000b\u0012\u0006\u0012\u0004\u0018\u00010\u000c\u0012\u000c\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u000c0\r\u0012\u0006\u0012\u0004\u0018\u00010\u000c0\n\u00a2\u0006\u0002\u0008\u000e\u00a8\u0006\u0012"
    }
    d2 = {
        "invoke",
        "R",
        "T",
        "Lkotlin/DeepRecursiveFunction;",
        "value",
        "(Lkotlin/DeepRecursiveFunction;Ljava/lang/Object;)Ljava/lang/Object;",
        "Lkotlin/SinceKotlin;",
        "version",
        "1.7",
        "DeepRecursiveFunctionBlock",
        "Lkotlin/Function3;",
        "Lkotlin/DeepRecursiveScope;",
        "",
        "Lkotlin/coroutines/Continuation;",
        "Lkotlin/ExtensionFunctionType;",
        "UNDEFINED_RESULT",
        "Lkotlin/Result;",
        "Ljava/lang/Object;",
        "kotlin-stdlib"
    }
    k = 0x2
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final UNDEFINED_RESULT:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 124
    sget-object v0, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    sput-object v0, Lkotlin/DeepRecursiveKt;->UNDEFINED_RESULT:Ljava/lang/Object;

    return-void
.end method

.method public static final synthetic access$getUNDEFINED_RESULT$p()Ljava/lang/Object;
    .registers 1

    .line 1
    sget-object v0, Lkotlin/DeepRecursiveKt;->UNDEFINED_RESULT:Ljava/lang/Object;

    return-object v0
.end method

.method public static final invoke(Lkotlin/DeepRecursiveFunction;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/DeepRecursiveFunction<",
            "TT;TR;>;TT;)TR;"
        }
    .end annotation

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 83
    new-instance v0, Lkotlin/DeepRecursiveScopeImpl;

    invoke-virtual {p0}, Lkotlin/DeepRecursiveFunction;->getBlock$kotlin_stdlib()Lkotlin/jvm/functions/Function3;

    move-result-object p0

    invoke-direct {v0, p0, p1}, Lkotlin/DeepRecursiveScopeImpl;-><init>(Lkotlin/jvm/functions/Function3;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lkotlin/DeepRecursiveScopeImpl;->runCallLoop()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
