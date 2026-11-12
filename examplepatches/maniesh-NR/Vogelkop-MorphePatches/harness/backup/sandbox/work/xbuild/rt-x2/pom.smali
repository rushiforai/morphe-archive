.class public final Lpom;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lumi;

.field public final c:Lx5f;

.field public final d:Lb59;

.field public final e:Lud7;

.field public final f:Lssi;

.field public final g:Z

.field public final h:I

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lumi;Lx5f;IZ)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lud7;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lud7;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lpom;->e:Lud7;

    new-instance v0, Lssi;

    const/16 v1, 0x12

    invoke-direct {v0, p0, v1}, Lssi;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lpom;->f:Lssi;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lpom;->a:Landroid/content/Context;

    iput-object p2, p0, Lpom;->b:Lumi;

    iput-object p3, p0, Lpom;->c:Lx5f;

    const/4 p3, 0x0

    new-array p3, p3, [Lbg1;

    const-string v0, "upgrade_message"

    invoke-static {p1, p2, v0, p3}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lpom;->d:Lb59;

    iput p4, p0, Lpom;->h:I

    iput-boolean p5, p0, Lpom;->g:Z

    return-void
.end method


# virtual methods
.method public final R(Lgt0;)V
    .registers 5

    new-instance v0, Lroj;

    const/4 v1, 0x6

    invoke-direct {v0, p0, p1, v1}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p1, Lt1;

    const/16 v1, 0xb

    iget-object v2, p0, Lpom;->a:Landroid/content/Context;

    invoke-direct {p1, v2, v1}, Lt1;-><init>(Landroid/content/Context;B)V

    iget-object p0, p0, Lpom;->b:Lumi;

    invoke-interface {p0, p1}, Ltcl;->b(Lesk;)Lnml;

    move-result-object p1

    new-instance v1, Lkqd;

    const/16 v2, 0xc

    invoke-direct {v1, v0, v2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {p1, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public final S()V
    .registers 3

    iget-boolean v0, p0, Lpom;->i:Z

    if-eqz v0, :cond_17

    iget-object v0, p0, Lpom;->a:Landroid/content/Context;

    invoke-static {v0}, Lhom;->t(Landroid/content/Context;)Lhom;

    move-result-object v0

    iget-object v1, p0, Lpom;->e:Lud7;

    invoke-virtual {v0, v1}, Lno7;->p(Lmo7;)V

    iget-object v0, p0, Lpom;->f:Lssi;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lpom;->i:Z

    :cond_17
    return-void
.end method

.method public final T(I)V
    .registers 7

    iget-object v0, p0, Lpom;->a:Landroid/content/Context;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v2, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v2, Landroid/content/SharedPreferences$Editor;

    const-string v3, "startpage.upgrade_page_will_be_shown"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    if-eqz p1, :cond_2b

    iget-object v1, p0, Lpom;->d:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "last_checksum"

    invoke-interface {v1, v2, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-static {v1, v2, p1}, Lcom/appsflyer/internal/j;->b(Landroid/content/SharedPreferences;Ljava/lang/String;I)V

    goto :goto_2c

    :cond_2b
    move v3, v4

    :goto_2c
    iget v1, p0, Lpom;->h:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_58

    new-instance p1, Lcrk;

    const/16 v1, 0x18

    invoke-direct {p1, p0, v1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lt1;

    const/16 v2, 0xb

    invoke-direct {v1, v0, v2}, Lt1;-><init>(Landroid/content/Context;B)V

    iget-object p0, p0, Lpom;->b:Lumi;

    invoke-interface {p0, v1}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v0

    new-instance v1, Lkqd;

    const/16 v2, 0xc

    invoke-direct {v1, p1, v2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :cond_58
    iget-boolean v1, p0, Lpom;->g:Z

    if-eqz v1, :cond_62

    sget-object p1, Lgt0;->c:Lgt0;

    invoke-virtual {p0, p1}, Lpom;->R(Lgt0;)V

    return-void

    :cond_62
    if-nez p1, :cond_6a

    sget-object p1, Lgt0;->d:Lgt0;

    invoke-virtual {p0, p1}, Lpom;->R(Lgt0;)V

    return-void

    :cond_6a
    invoke-static {v0}, Lhom;->t(Landroid/content/Context;)Lhom;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfom;

    iget-object v0, v0, Lfom;->b:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_82

    sget-object p1, Lgt0;->e:Lgt0;

    invoke-virtual {p0, p1}, Lpom;->R(Lgt0;)V

    return-void

    :cond_82
    if-ne p1, v3, :cond_8a

    sget-object p1, Lgt0;->f:Lgt0;

    invoke-virtual {p0, p1}, Lpom;->R(Lgt0;)V

    return-void

    :cond_8a
    sget-object p1, Llqm;->q:Llqm;

    invoke-static {v0, p1, v4}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p1, v2}, Lvx3;->c(Z)V

    invoke-virtual {p1, v2}, Lvx3;->a(Z)V

    iput-boolean v4, p1, Lvx3;->f:Z

    invoke-static {p1}, Lam2;->v(Lvx3;)V

    sget-object p1, Lgt0;->b:Lgt0;

    invoke-virtual {p0, p1}, Lpom;->R(Lgt0;)V

    return-void
.end method

.method public final W(Lndc;)V
    .registers 4

    const/4 p1, 0x1

    iput-boolean p1, p0, Lpom;->i:Z

    iget-object p1, p0, Lpom;->f:Lssi;

    const-wide/16 v0, 0x1388

    invoke-static {p1, v0, v1}, Lvml;->d(Ljava/lang/Runnable;J)V

    iget-object p1, p0, Lpom;->a:Landroid/content/Context;

    invoke-static {p1}, Lhom;->t(Landroid/content/Context;)Lhom;

    move-result-object p1

    iget-object p0, p0, Lpom;->e:Lud7;

    invoke-virtual {p1, p0}, Lno7;->g(Lmo7;)V

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 2

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    invoke-virtual {p0}, Lpom;->S()V

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    iget-boolean p1, p0, Lpom;->i:Z

    if-eqz p1, :cond_9

    iget-object p0, p0, Lpom;->f:Lssi;

    invoke-virtual {p0}, Lssi;->run()V

    :cond_9
    return-void
.end method
