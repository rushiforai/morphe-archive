.class public final Lcom/opera/android/esim/work/EsimPromotionWorker;
.super Landroidx/work/CoroutineWorker;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0007\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\t\u00a8\u0006\n"
    }
    d2 = {
        "Lcom/opera/android/esim/work/EsimPromotionWorker;",
        "Landroidx/work/CoroutineWorker;",
        "Landroid/content/Context;",
        "appContext",
        "Landroidx/work/WorkerParameters;",
        "params",
        "Lgfd;",
        "maybePromoteEsim",
        "<init>",
        "(Landroid/content/Context;Landroidx/work/WorkerParameters;Lgfd;)V",
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
.field public final g:Lgfd;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/work/WorkerParameters;Lgfd;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroidx/work/WorkerParameters;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Lgfd;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroidx/work/CoroutineWorker;-><init>(Landroid/content/Context;Landroidx/work/WorkerParameters;)V

    iput-object p3, p0, Lcom/opera/android/esim/work/EsimPromotionWorker;->g:Lgfd;

    return-void
.end method


# virtual methods
.method public final c(Lnt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lo98;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lo98;

    iget v1, v0, Lo98;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lo98;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lo98;

    invoke-direct {v0, p0, p1}, Lo98;-><init>(Lcom/opera/android/esim/work/EsimPromotionWorker;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lo98;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lo98;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v3, :cond_2b

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    goto :goto_44

    :cond_2b
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, v0, Lo98;->v:I

    iget-object p1, p0, Lcom/opera/android/esim/work/EsimPromotionWorker;->g:Lgfd;

    check-cast p1, Lot6;

    iget-object p0, p0, Lajc;->a:Landroid/content/Context;

    invoke-virtual {p1, p0, v0}, Lot6;->a(Landroid/content/Context;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_44

    return-object v1

    :cond_44
    :goto_44
    invoke-static {p0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object p1

    if-nez p1, :cond_55

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lyic;

    invoke-direct {p0}, Lyic;-><init>()V

    return-object p0

    :cond_55
    new-instance p0, Lwic;

    invoke-direct {p0}, Lwic;-><init>()V

    return-object p0
.end method
