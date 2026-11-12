.class public final Ly5e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lx79;

.field public final b:Lx3i;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lx3i;->f:Lhr5;

    return-void
.end method

.method public constructor <init>(Lx79;Lx3i;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ly5e;->a:Lx79;

    iput-object p2, p0, Ly5e;->b:Lx3i;

    return-void
.end method


# virtual methods
.method public final a(Lj14;Lnt5;)Ljava/lang/Enum;
    .registers 9

    instance-of v0, p2, Lx5e;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lx5e;

    iget v1, v0, Lx5e;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lx5e;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lx5e;

    invoke-direct {v0, p0, p2}, Lx5e;-><init>(Ly5e;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lx5e;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lx5e;->v:I

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_36

    if-eq v2, v5, :cond_32

    if-ne v2, v3, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_ed

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_59

    :cond_36
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    if-eqz p1, :cond_f0

    instance-of p2, p1, Ll0f;

    if-eqz p2, :cond_42

    sget-object p0, Lx1f;->c:Lx1f;

    return-object p0

    :cond_42
    instance-of p2, p1, Lq0f;

    if-eqz p2, :cond_49

    sget-object p0, Lx1f;->c:Lx1f;

    return-object p0

    :cond_49
    instance-of p2, p1, Ln0f;

    iget-object v2, p0, Ly5e;->b:Lx3i;

    if-eqz p2, :cond_5c

    check-cast p1, Ln0f;

    iput v5, v0, Lx5e;->v:I

    invoke-virtual {v2, p1, v0}, Lx3i;->a(Ln0f;Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, v1, :cond_ec

    :goto_59
    check-cast p2, Lx1f;

    return-object p2

    :cond_5c
    instance-of p2, p1, Lp0f;

    if-eqz p2, :cond_ae

    check-cast p1, Lp0f;

    iget-object p0, p0, Ly5e;->a:Lx79;

    iget-object p2, p0, Lx79;->c:Ljava/lang/Object;

    check-cast p2, Lx5f;

    iget-object v0, p0, Lx79;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Lx79;->a:Ljava/lang/Object;

    check-cast v1, Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lk3i;

    invoke-virtual {v1}, Lk3i;->c()Z

    move-result v1

    if-nez v1, :cond_7f

    sget-object p0, Lx1f;->b:Lx1f;

    goto :goto_ad

    :cond_7f
    const-string v1, "rewards"

    invoke-static {v0, v1}, Lwbh;->m(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_8a

    sget-object p0, Lx1f;->b:Lx1f;

    goto :goto_ad

    :cond_8a
    :try_start_8a
    new-instance v1, Lnbh;

    iget-object v2, p0, Lx79;->b:Ljava/lang/Object;

    check-cast v2, Lumi;

    iget-object p0, p0, Lx79;->d:Ljava/lang/Object;

    check-cast p0, Lx5f;

    invoke-direct {v1, v0, v2, p2, p0}, Lnbh;-><init>(Landroid/content/Context;Lumi;Lorm;Lskm;)V

    invoke-static {p1}, Lmfh;->m(Lp0f;)Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {v1, v0, p0, v5}, Lnbh;->a(Landroid/content/Context;Landroid/os/Bundle;Z)Lwbh;

    move-result-object p0
    :try_end_9f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8a .. :try_end_9f} :catch_ab

    invoke-static {p0, p2}, Lybh;->l(Lwbh;Lorm;)Z

    move-result p0

    if-nez p0, :cond_a8

    sget-object p0, Lx1f;->c:Lx1f;

    goto :goto_ad

    :cond_a8
    sget-object p0, Lx1f;->a:Lx1f;

    goto :goto_ad

    :catch_ab
    sget-object p0, Lx1f;->c:Lx1f;

    :goto_ad
    return-object p0

    :cond_ae
    instance-of p0, p1, Lo0f;

    if-eqz p0, :cond_f0

    check-cast p1, Lo0f;

    iput v3, v0, Lx5e;->v:I

    iget-object p0, v2, Lx3i;->a:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    const-string p2, "rewards_notifications"

    invoke-virtual {p0, p2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_e7

    iget-object p0, v2, Lx3i;->b:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lk3i;

    invoke-virtual {p0}, Lk3i;->c()Z

    move-result p0

    if-eqz p0, :cond_e7

    sget-object p0, Lbb7;->a:Lcv6;

    sget-object p0, Ls6d;->a:Ld7a;

    iget-object p0, p0, Ld7a;->e:Ld7a;

    new-instance p2, Lfb9;

    const/16 v3, 0x1b

    invoke-direct {p2, v2, p1, v4, v3}, Lfb9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p0, p2, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    :goto_e5
    move-object p2, p0

    goto :goto_ea

    :cond_e7
    sget-object p0, Lx1f;->b:Lx1f;

    goto :goto_e5

    :goto_ea
    if-ne p2, v1, :cond_ed

    :cond_ec
    return-object v1

    :cond_ed
    :goto_ed
    check-cast p2, Lx1f;

    return-object p2

    :cond_f0
    invoke-static {}, Lh9o;->p()V

    return-object v4
.end method
