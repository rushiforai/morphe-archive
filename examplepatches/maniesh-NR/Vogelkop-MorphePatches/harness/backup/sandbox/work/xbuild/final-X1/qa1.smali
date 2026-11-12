.class public final Lqa1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lsjj;


# instance fields
.field public final a:Lcb7;


# direct methods
.method public constructor <init>(Lcb7;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqa1;->a:Lcb7;

    return-void
.end method


# virtual methods
.method public final a([BLavb;Lnt5;)Ljava/lang/Object;
    .registers 7

    iget-object p0, p0, Lqa1;->a:Lcb7;

    check-cast p0, Lkzd;

    iget-object p0, p0, Lkzd;->a:Lab7;

    invoke-interface {p0}, Lab7;->a()Ldx5;

    move-result-object p0

    new-instance v0, Lpa1;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, p1, p2, v1, v2}, Lpa1;-><init>([BLavb;Lmt5;B)V

    invoke-static {p0, v0, p3}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
