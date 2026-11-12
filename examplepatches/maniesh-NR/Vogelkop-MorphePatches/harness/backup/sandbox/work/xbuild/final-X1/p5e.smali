.class public final Lp5e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lp5e;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 9

    instance-of v0, p1, Ln5e;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Ln5e;

    iget v1, v0, Ln5e;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ln5e;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Ln5e;

    invoke-direct {v0, p0, p1}, Ln5e;-><init>(Lp5e;Lnt5;)V

    :goto_18
    iget-object p1, v0, Ln5e;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ln5e;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p0, v0, Ln5e;->t:Ljava/lang/Long;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_4e

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lp5e;->a:Landroid/content/Context;

    invoke-static {p1}, Lr9n;->t(Landroid/content/Context;)Landroid/content/pm/PackageInfo;

    move-result-object p1

    iget-wide v4, p1, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    new-instance p1, Ljava/lang/Long;

    invoke-direct {p1, v4, v5}, Ljava/lang/Long;-><init>(J)V

    iput-object p1, v0, Ln5e;->t:Ljava/lang/Long;

    iput v3, v0, Ln5e;->w:I

    invoke-virtual {p0, v0}, Lp5e;->b(Lnt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_4b

    return-object v1

    :cond_4b
    move-object v6, p1

    move-object p1, p0

    move-object p0, v6

    :goto_4e
    check-cast p1, Ljava/lang/String;

    new-instance v0, Lnab;

    invoke-direct {v0, p1, p0}, Lnab;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    return-object v0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lo5e;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lo5e;

    iget v1, v0, Lo5e;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lo5e;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lo5e;

    invoke-direct {v0, p0, p1}, Lo5e;-><init>(Lp5e;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lo5e;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lo5e;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3d

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    sget-object p1, Lcak;->d:Lavj;

    iput v4, v0, Lo5e;->v:I

    const/4 p1, 0x2

    invoke-static {p1, v0}, Lmfh;->w(ILmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_3d

    return-object v1

    :cond_3d
    :goto_3d
    iget-object p0, p0, Lp5e;->a:Landroid/content/Context;

    invoke-static {v4, p0}, Lvtp;->G(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_51

    invoke-static {v4, p0}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "opera_rewards"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_52

    :cond_51
    return-object v3

    :cond_52
    const/4 p1, 0x4

    invoke-static {p1, p0}, Loup;->a0(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
