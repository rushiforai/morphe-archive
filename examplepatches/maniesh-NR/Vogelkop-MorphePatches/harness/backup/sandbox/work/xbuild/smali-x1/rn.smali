.class public abstract Lrn;
.super Lk43;
.source "SourceFile"


# instance fields
.field public final k:Landroid/app/Activity;

.field public final l:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lao;Landroid/app/Activity;Lzy;Ldl;Ljava/util/List;)V
    .registers 6

    .line 54
    invoke-direct {p0, p1, p3, p4}, Lk43;-><init>(Lbqi;Lzy;Ldl;)V

    .line 55
    iput-object p2, p0, Lrn;->k:Landroid/app/Activity;

    .line 56
    iput-object p5, p0, Lrn;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Loo8;Landroid/app/Activity;Lzy;Ldl;)V
    .registers 5

    iput-object p1, p0, Lrn;->l:Ljava/lang/Object;

    invoke-direct {p0, p1, p3, p4}, Lk43;-><init>(Lbqi;Lzy;Ldl;)V

    iput-object p2, p0, Lrn;->k:Landroid/app/Activity;

    sget-object p0, Loo8;->q:Lnrl;

    if-eqz p0, :cond_c

    return-void

    :cond_c
    new-instance p0, Lnrl;

    const/16 p1, 0x1a

    invoke-direct {p0, p1}, Lnrl;-><init>(B)V

    sput-object p0, Loo8;->q:Lnrl;

    invoke-static {p2}, Lhn9;->g(Landroid/app/Activity;)V

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance p1, Lypi;

    const-string p2, "pub13861483759168/ep13861483759744/app14131723392384"

    const-string p3, "Opera"

    const/4 p4, 0x0

    invoke-direct {p1, p2, p3, p4, p4}, Lypi;-><init>(Ljava/lang/String;Ljava/lang/String;Lc30;Ljava/lang/Integer;)V

    new-instance p2, Lthf;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    new-instance p3, Ljbd;

    const/16 p4, 0x9

    invoke-direct {p3, p0, p1, p2, p4}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p3}, Lpfp;->c(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 9

    sget-object v0, Loo8;->q:Lnrl;

    if-eqz v0, :cond_30

    iget-boolean v1, v0, Lnrl;->a:Z

    if-eqz v1, :cond_26

    sget-boolean v0, Loo8;->r:Z

    if-eqz v0, :cond_21

    iget-object v0, p0, Lrn;->l:Ljava/lang/Object;

    check-cast v0, Loo8;

    const-string v1, "ads provider not available"

    iget-object v0, v0, Lbqi;->g:Ljava/lang/String;

    invoke-static {v1, v0}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void

    :cond_21
    move-object v2, p0

    invoke-virtual {v2}, Lrn;->g()V

    return-void

    :cond_26
    move-object v2, p0

    new-instance p0, Lvdf;

    const/4 v1, 0x1

    invoke-direct {p0, v2, v1}, Lvdf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_30
    return-void
.end method

.method public abstract g()V
.end method

.method public final h(Lcm;Lv50;)V
    .registers 13

    iget v0, p1, Lcm;->b:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x5

    if-ne v0, v3, :cond_9

    move v5, v2

    goto :goto_a

    :cond_9
    move v5, v1

    :goto_a
    iget-object v6, p1, Lcm;->c:Ljava/lang/String;

    const/4 p1, 0x4

    if-eq v0, p1, :cond_13

    if-eq v0, v3, :cond_13

    move v7, v1

    goto :goto_14

    :cond_13
    move v7, v2

    :goto_14
    const/4 v9, 0x0

    move-object v4, p0

    move-object v8, p2

    invoke-virtual/range {v4 .. v9}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void
.end method
