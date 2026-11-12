.class public final Luw3;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Let3;

.field public final c:Lcom/opera/android/Lazy;

.field public final d:Llu3;

.field public final e:Lzyk;

.field public final f:Lzyk;

.field public final g:Lzyk;

.field public final h:Lzyk;

.field public final i:Lfv2;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lli;Lli;Lmt3;Llu3;Let3;Lcom/opera/android/Lazy;Llu3;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Luw3;->a:Landroid/content/Context;

    iput-object p6, p0, Luw3;->b:Let3;

    iput-object p7, p0, Luw3;->c:Lcom/opera/android/Lazy;

    iput-object p8, p0, Luw3;->d:Llu3;

    new-instance p1, Loc2;

    const/16 p6, 0x15

    invoke-direct {p1, p2, p6}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Luw3;->e:Lzyk;

    new-instance p1, Loc2;

    const/16 p2, 0x16

    invoke-direct {p1, p3, p2}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Luw3;->f:Lzyk;

    new-instance p1, Loc2;

    const/16 p2, 0x17

    invoke-direct {p1, p4, p2}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Luw3;->g:Lzyk;

    new-instance p1, Loc2;

    const/16 p2, 0x18

    invoke-direct {p1, p5, p2}, Loc2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Luw3;->h:Lzyk;

    new-instance p1, Lfv2;

    const/16 p2, 0x14

    invoke-direct {p1, p0, p2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Luw3;->i:Lfv2;

    return-void
.end method


# virtual methods
.method public final R(ILjava/lang/String;)V
    .registers 4

    iget-object v0, p0, Luw3;->g:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p2}, Lcom/opera/android/settings/SettingsManager;->j(Ljava/lang/String;)Lh7j;

    move-result-object p2

    iget-object p0, p0, Luw3;->e:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorm;

    iget-object v0, p2, Lh7j;->b:Lop0;

    iget-boolean p2, p2, Lh7j;->a:Z

    check-cast p0, Lx5f;

    invoke-virtual {p0, p1, v0, p2}, Lx5f;->M0(ILop0;Z)V

    return-void
.end method

.method public final S()V
    .registers 11

    iget-object v0, p0, Luw3;->b:Let3;

    invoke-virtual {v0}, Let3;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt8k;

    iget-object v1, v0, Lt8k;->d:Lr8k;

    iget-object v2, v0, Lt8k;->c:Ls8k;

    const/16 v3, 0x1d

    const-string v4, "enable_start_page_opera_logo"

    invoke-virtual {p0, v3, v4}, Luw3;->R(ILjava/lang/String;)V

    const/16 v3, 0x1b

    const-string v4, "enable_continue_booking"

    invoke-virtual {p0, v3, v4}, Luw3;->R(ILjava/lang/String;)V

    iget-object v3, p0, Luw3;->g:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v3

    sget-object v4, Le7j;->d:Le7j;

    const/4 v5, 0x1

    if-ne v3, v4, :cond_2d

    move v3, v5

    goto :goto_2e

    :cond_2d
    const/4 v3, 0x0

    :goto_2e
    iget-object v4, p0, Luw3;->h:Lzyk;

    iget-object v6, p0, Luw3;->e:Lzyk;

    const/16 v7, 0x1a

    if-nez v3, :cond_64

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v8

    if-eqz v8, :cond_64

    if-ne v8, v5, :cond_60

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfd;

    sget-object v9, Lpc;->z:Lpc;

    invoke-virtual {v8, v9}, Lfd;->e(Lpc;)Ljf;

    move-result-object v8

    if-nez v8, :cond_5a

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfd;

    sget-object v9, Lpc;->m:Lpc;

    invoke-virtual {v8, v9}, Lfd;->e(Lpc;)Ljf;

    move-result-object v8

    if-eqz v8, :cond_64

    :cond_5a
    const-string v8, "enable_search_shortcuts"

    invoke-virtual {p0, v7, v8}, Luw3;->R(ILjava/lang/String;)V

    goto :goto_6f

    :cond_60
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_64
    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lorm;

    check-cast v8, Lx5f;

    invoke-virtual {v8, v7}, Lx5f;->N0(I)V

    :goto_6f
    const/16 v7, 0x1e

    if-eqz v3, :cond_a5

    iget-object v3, p0, Luw3;->c:Lcom/opera/android/Lazy;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Likc;

    invoke-virtual {v3}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lkl5;

    iget-object v3, v3, Lkl5;->b:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v3

    iget-object v8, p0, Luw3;->a:Landroid/content/Context;

    invoke-static {v3, v8}, Lddh;->t(ILandroid/content/Context;)Lhpj;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    if-eqz v3, :cond_a5

    if-eq v3, v5, :cond_9f

    const/4 v8, 0x2

    if-eq v3, v8, :cond_9f

    const/4 v8, 0x3

    if-eq v3, v8, :cond_9f

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_9f
    const-string v3, "enable_search_shortcuts_tablet"

    invoke-virtual {p0, v7, v3}, Luw3;->R(ILjava/lang/String;)V

    goto :goto_b0

    :cond_a5
    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorm;

    check-cast v3, Lx5f;

    invoke-virtual {v3, v7}, Lx5f;->N0(I)V

    :goto_b0
    iget-object v3, p0, Luw3;->f:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lskm;

    iget-boolean v0, v0, Lt8k;->e:Z

    if-eqz v0, :cond_c3

    sget-object v0, Ls8k;->b:Ls8k;

    if-ne v2, v0, :cond_c3

    sget-object v0, Luq0;->e:Luq0;

    goto :goto_f4

    :cond_c3
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_f2

    if-ne v0, v5, :cond_ee

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfd;

    sget-object v1, Lpc;->z:Lpc;

    invoke-virtual {v0, v1}, Lfd;->e(Lpc;)Ljf;

    move-result-object v0

    if-nez v0, :cond_e7

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfd;

    sget-object v1, Lpc;->m:Lpc;

    invoke-virtual {v0, v1}, Lfd;->e(Lpc;)Ljf;

    move-result-object v0

    if-eqz v0, :cond_f2

    :cond_e7
    sget-object v0, Ls8k;->b:Ls8k;

    if-ne v2, v0, :cond_f2

    sget-object v0, Luq0;->d:Luq0;

    goto :goto_f4

    :cond_ee
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_f2
    sget-object v0, Luq0;->c:Luq0;

    :goto_f4
    check-cast v3, Lx5f;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v3, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v4, Lck0;

    invoke-direct {v4, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    invoke-virtual {v4}, Lck0;->h()Lat0;

    move-result-object v1

    iget-object v1, v1, Lat0;->a:Lzs0;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v4, 0xd

    invoke-virtual {v1, v4, v5, v0}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v3, v2}, Lx5f;->U0(Lx56;)V

    iget-object p0, p0, Luw3;->d:Llu3;

    invoke-virtual {p0}, Llu3;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lctl;

    iget-object p0, p0, Lctl;->e:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbtl;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorm;

    iget-object v1, p0, Lbtl;->e:Lop0;

    iget-boolean p0, p0, Lbtl;->d:Z

    if-eqz p0, :cond_134

    sget-object p0, Lc90;->b:Lc90;

    goto :goto_136

    :cond_134
    sget-object p0, Lc90;->c:Lc90;

    :goto_136
    check-cast v0, Lx5f;

    iget-boolean v2, v0, Lx5f;->h:Z

    if-nez v2, :cond_13d

    return-void

    :cond_13d
    iget-object v2, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    new-instance v4, Lck0;

    invoke-direct {v4, v2, v3}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v2, Ljkc;

    const/16 v5, 0x14

    invoke-direct {v2, v1, p0, v5}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4}, Lck0;->g()Lqp0;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 3

    sget-object p1, Lava;->a:Lcva;

    iget-object v0, p0, Luw3;->i:Lfv2;

    invoke-virtual {p1, v0}, Lcva;->c(Ljava/lang/Runnable;)Z

    invoke-virtual {p0}, Luw3;->S()V

    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    sget-object p1, Lava;->a:Lcva;

    iget-object p0, p0, Luw3;->i:Lfv2;

    invoke-virtual {p1, p0}, Lcva;->a(Ljava/lang/Runnable;)V

    return-void
.end method
