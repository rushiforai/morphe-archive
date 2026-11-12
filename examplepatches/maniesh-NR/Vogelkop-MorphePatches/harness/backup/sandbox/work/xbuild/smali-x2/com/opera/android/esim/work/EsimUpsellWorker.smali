.class public final Lcom/opera/android/esim/work/EsimUpsellWorker;
.super Landroidx/work/CoroutineWorker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/opera/android/esim/work/EsimUpsellWorker;",
        "Landroidx/work/CoroutineWorker;",
        "Landroid/content/Context;",
        "appContext",
        "Landroidx/work/WorkerParameters;",
        "params",
        "Lhfd;",
        "maybeShowUpsellNotification",
        "<init>",
        "(Landroid/content/Context;Landroidx/work/WorkerParameters;Lhfd;)V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public final g:Lhfd;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;Lhfd;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/WorkerParameters;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lhfd;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroidx/work/CoroutineWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    iput-object p3, p0, Lcom/opera/android/esim/work/EsimUpsellWorker;->g:Lhfd;

    return-void
.end method


# virtual methods
.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p1, Lfa8;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lfa8;

    iget v1, v0, Lfa8;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lfa8;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lfa8;

    invoke-direct {v0, p0, p1}, Lfa8;-><init>(Lcom/opera/android/esim/work/EsimUpsellWorker;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lfa8;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lfa8;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_61

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lajc;->b:Landroidx/work/WorkerParameters;

    iget-object p1, p1, Landroidx/work/WorkerParameters;->b:Lib6;

    const-string v2, "plan_id"

    iget-object p1, p1, Lib6;->a:Ljava/util/HashMap;

    invoke-virtual {p1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    instance-of v2, p1, Ljava/lang/String;

    if-eqz v2, :cond_48

    check-cast p1, Ljava/lang/String;

    goto :goto_49

    :cond_48
    move-object p1, v3

    :goto_49
    if-nez p1, :cond_51

    new-instance p0, Lwic;

    invoke-direct {p0}, Lwic;-><init>()V

    return-object p0

    :cond_51
    new-instance v2, Lu11;

    const/16 v5, 0xc

    invoke-direct {v2, p0, p1, v3, v5}, Lu11;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    iput v4, v0, Lfa8;->v:I

    invoke-static {v2, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_61

    return-object v1

    :cond_61
    :goto_61
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-nez p1, :cond_68

    return-object p0

    :cond_68
    new-instance p0, Lwic;

    invoke-direct {p0}, Lwic;-><init>()V

    return-object p0
.end method
