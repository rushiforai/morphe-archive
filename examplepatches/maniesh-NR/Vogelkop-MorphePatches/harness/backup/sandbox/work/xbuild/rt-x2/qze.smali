.class public final Lqze;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final synthetic a:Lsze;


# direct methods
.method public constructor <init>(Lsze;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqze;->a:Lsze;

    return-void
.end method


# virtual methods
.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 5

    iget-object p0, p0, Lqze;->a:Lsze;

    iget-object p1, p0, Lsze;->a:Lddc;

    new-instance v0, Lpze;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2, v1}, Lpze;-><init>(Lsze;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {p1, v2, v2, v0, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method

.method public final onStart(Lndc;)V
    .registers 5

    iget-object p0, p0, Lqze;->a:Lsze;

    iget-object p1, p0, Lsze;->a:Lddc;

    new-instance v0, Lpze;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2, v1}, Lpze;-><init>(Lsze;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {p1, v2, v2, v0, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method
