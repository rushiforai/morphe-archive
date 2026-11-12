.class public abstract Lw2p;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:La64;

.field public static final b:La64;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object v0

    sget-object v1, Lbb7;->a:Lcv6;

    sget-object v1, Ls6d;->a:Ld7a;

    invoke-static {v0, v1}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    invoke-static {v0}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object v0

    sput-object v0, Lw2p;->a:La64;

    invoke-static {}, Lzch;->a()Lcsk;

    move-result-object v0

    sget-object v1, Lmr6;->b:Lmr6;

    invoke-static {v0, v1}, Lkotlin/coroutines/e;->a(Lkotlin/coroutines/CoroutineContext;Lkotlin/coroutines/CoroutineContext;)Lkotlin/coroutines/CoroutineContext;

    move-result-object v0

    invoke-static {v0}, Lsgb;->b(Lkotlin/coroutines/CoroutineContext;)La64;

    move-result-object v0

    sput-object v0, Lw2p;->b:La64;

    return-void
.end method
