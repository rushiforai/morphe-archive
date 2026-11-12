.class public interface abstract Lt3e;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lh5e;Lt1e;)V
    .registers 6

    iget-object v0, p0, Lh5e;->a:Lnx5;

    new-instance v1, Lqmb;

    const/4 v2, 0x7

    const/4 v3, 0x0

    invoke-direct {v1, p0, p1, v3, v2}, Lqmb;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void
.end method
