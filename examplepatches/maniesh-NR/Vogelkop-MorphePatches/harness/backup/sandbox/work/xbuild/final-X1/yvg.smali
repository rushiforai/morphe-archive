.class public final Lyvg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ltcc;

.field public final c:Lz77;

.field public final d:Lumi;

.field public e:Loml;

.field public final f:Lzvg;

.field public final g:Lc1a;

.field public h:Lgkj;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltcc;Lgmk;Lz77;Lumi;Lc1a;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyvg;->a:Landroid/content/Context;

    iput-object p2, p0, Lyvg;->b:Ltcc;

    iput-object p4, p0, Lyvg;->c:Lz77;

    iput-object p5, p0, Lyvg;->d:Lumi;

    iput-object p6, p0, Lyvg;->g:Lc1a;

    new-instance p1, Lzvg;

    new-instance p4, Lpjg;

    const/4 p5, 0x7

    invoke-direct {p4, p0, p5}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2, p3, p4}, Lzvg;-><init>(Ltcc;Lgmk;Lpjg;)V

    iput-object p1, p0, Lyvg;->f:Lzvg;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-object v0, p0, Lyvg;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "premium.upgrade_notification.is_pending"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object v0, p0, Lyvg;->e:Loml;

    if-eqz v0, :cond_21

    invoke-virtual {v0, v3}, Loml;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lyvg;->e:Loml;

    :cond_21
    iget-object p0, p0, Lyvg;->f:Lzvg;

    invoke-virtual {p0}, Lzvg;->a()V

    return-void
.end method

.method public final b(I)V
    .registers 8

    iget-object v0, p0, Lyvg;->e:Loml;

    if-eqz v0, :cond_b

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lyvg;->e:Loml;

    :cond_b
    iget-object v0, p0, Lyvg;->h:Lgkj;

    if-nez v0, :cond_2c

    new-instance v0, Lbr;

    const/16 v1, 0x14

    invoke-direct {v0, p0, p1, v1}, Lbr;-><init>(Ljava/lang/Object;IB)V

    iget-object p1, p0, Lyvg;->d:Lumi;

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    iput-object v0, p0, Lyvg;->e:Loml;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x3

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_2c
    return-void
.end method

.method public final c()V
    .registers 5

    iget-object v0, p0, Lyvg;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    invoke-virtual {v0}, Lru9;->b()Lnv6;

    move-result-object v0

    iget-object v1, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v1, Landroid/content/SharedPreferences$Editor;

    const-string v2, "premium.upgrade_notification.is_pending"

    const/4 v3, 0x1

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v0}, Lnv6;->w()V

    iget-object p0, p0, Lyvg;->f:Lzvg;

    iget-boolean v0, p0, Lzvg;->d:Z

    if-nez v0, :cond_28

    iget-object v0, p0, Lzvg;->a:Ltcc;

    move-object v1, v0

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->a:Lqcc;

    if-ne v1, v2, :cond_29

    :cond_28
    return-void

    :cond_29
    iput-boolean v3, p0, Lzvg;->d:Z

    invoke-virtual {v0, p0}, Ltcc;->a(Lmdc;)V

    iget-object v0, p0, Lzvg;->b:Lgmk;

    iget-object v0, v0, Lgmk;->a:Lkze;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final d()V
    .registers 5

    iget-object p0, p0, Lyvg;->g:Lc1a;

    iget-object v0, p0, Lc1a;->c:Ljava/lang/Object;

    check-cast v0, Lydn;

    invoke-virtual {v0}, Lydn;->p()Lwdn;

    move-result-object v1

    invoke-virtual {v1}, Lwdn;->a()Z

    move-result v1

    if-eqz v1, :cond_21

    iget-object v0, p0, Lc1a;->e:Ljava/lang/Object;

    check-cast v0, Lz77;

    invoke-virtual {p0}, Lc1a;->R()Lb23;

    move-result-object p0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lijm;->b:Lijm;

    invoke-virtual {v0, p0, v1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_21
    iget-object v1, p0, Lc1a;->b:Ljava/lang/Object;

    check-cast v1, Ltcc;

    iget-object v2, p0, Lc1a;->h:Ljava/lang/Object;

    check-cast v2, Lnlk;

    if-nez v2, :cond_34

    move-object v2, v1

    check-cast v2, Lqdc;

    iget-object v2, v2, Lqdc;->i:Lqcc;

    sget-object v3, Lqcc;->a:Lqcc;

    if-ne v2, v3, :cond_35

    :cond_34
    return-void

    :cond_35
    new-instance v2, Lnlk;

    const/4 v3, 0x4

    invoke-direct {v2, p0, v3}, Lnlk;-><init>(Ljava/lang/Object;B)V

    iput-object v2, p0, Lc1a;->h:Ljava/lang/Object;

    invoke-virtual {v0, v2}, Lydn;->b(Ltdn;)V

    invoke-virtual {v1, p0}, Ltcc;->a(Lmdc;)V

    return-void
.end method
