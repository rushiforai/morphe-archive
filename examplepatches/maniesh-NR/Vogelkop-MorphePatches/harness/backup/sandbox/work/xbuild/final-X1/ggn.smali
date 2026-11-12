.class public final Lggn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu9j;


# instance fields
.field public final a:Lydn;

.field public final b:Lktg;

.field public final c:Lslk;

.field public final d:Lxb;

.field public final e:Lien;

.field public final f:Lmw3;

.field public final g:Lyen;

.field public final h:Lkw3;

.field public final i:Lpfn;

.field public final j:Lru9;

.field public final k:Lzyk;

.field public final l:Lv9j;

.field public final m:Lnlk;

.field public final n:Lx53;

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:Lnfn;


# direct methods
.method public constructor <init>(Lydn;Lktg;Lslk;Lxb;Lien;Lmw3;Lyen;Lkw3;Lpfn;Lru9;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lggn;->a:Lydn;

    iput-object p2, p0, Lggn;->b:Lktg;

    iput-object p3, p0, Lggn;->c:Lslk;

    iput-object p4, p0, Lggn;->d:Lxb;

    iput-object p5, p0, Lggn;->e:Lien;

    iput-object p6, p0, Lggn;->f:Lmw3;

    iput-object p7, p0, Lggn;->g:Lyen;

    iput-object p8, p0, Lggn;->h:Lkw3;

    iput-object p9, p0, Lggn;->i:Lpfn;

    iput-object p10, p0, Lggn;->j:Lru9;

    new-instance p1, Lm2n;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lm2n;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lggn;->k:Lzyk;

    new-instance p1, Lv9j;

    invoke-direct {p1, p0}, Lv9j;-><init>(Lu9j;)V

    iput-object p1, p0, Lggn;->l:Lv9j;

    new-instance p1, Lnlk;

    invoke-direct {p1, p0, p2}, Lnlk;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lggn;->m:Lnlk;

    new-instance p1, Lx53;

    invoke-direct {p1, p0}, Lx53;-><init>(Lggn;)V

    iput-object p1, p0, Lggn;->n:Lx53;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 25

    move-object/from16 v0, p0

    iget-object v1, v0, Lggn;->c:Lslk;

    iget-object v2, v1, Lslk;->i:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lwvg;

    iget-object v3, v0, Lggn;->j:Lru9;

    iget-object v3, v3, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "vpn_pro.kill_switch.on"

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    invoke-virtual {v2}, Lwvg;->a()Z

    move-result v4

    iget v6, v2, Lwvg;->e:I

    iget-object v7, v0, Lggn;->a:Lydn;

    iget-object v8, v7, Lydn;->c:Lgfn;

    invoke-interface {v8}, Lgfn;->isEnabled()Z

    move-result v8

    const/4 v9, 0x1

    if-nez v8, :cond_2e

    if-eqz v3, :cond_2c

    if-nez v4, :cond_2e

    :cond_2c
    move v8, v5

    goto :goto_2f

    :cond_2e
    move v8, v9

    :goto_2f
    iget-object v10, v0, Lggn;->b:Lktg;

    iget-object v10, v10, Lktg;->b:Lkze;

    invoke-virtual {v10}, Lekc;->g()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Boolean;

    invoke-virtual {v10}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v10

    iget-object v11, v7, Lydn;->c:Lgfn;

    invoke-interface {v11}, Lgfn;->isEnabled()Z

    move-result v11

    if-nez v11, :cond_4b

    if-eqz v3, :cond_49

    if-nez v4, :cond_4b

    :cond_49
    move v11, v5

    goto :goto_4c

    :cond_4b
    move v11, v9

    :goto_4c
    invoke-virtual {v7}, Lydn;->p()Lwdn;

    move-result-object v12

    invoke-virtual {v12}, Lwdn;->a()Z

    move-result v12

    if-nez v12, :cond_5c

    if-eqz v3, :cond_5a

    if-nez v4, :cond_5c

    :cond_5a
    move v4, v5

    goto :goto_5d

    :cond_5c
    move v4, v9

    :goto_5d
    invoke-virtual {v7}, Lydn;->p()Lwdn;

    move-result-object v7

    iget-boolean v7, v7, Lwdn;->e:Z

    const/4 v12, 0x2

    if-eqz v4, :cond_74

    if-nez v7, :cond_6a

    if-eqz v11, :cond_74

    :cond_6a
    if-eqz v10, :cond_6e

    if-eqz v11, :cond_74

    :cond_6e
    if-eqz v8, :cond_72

    move v15, v12

    goto :goto_75

    :cond_72
    move v15, v9

    goto :goto_75

    :cond_74
    move v15, v5

    :goto_75
    const/4 v4, 0x5

    const/4 v7, 0x0

    const/4 v8, 0x4

    if-ne v6, v4, :cond_7f

    sget-object v10, Lbfn;->a:Lbfn;

    :goto_7c
    move-object/from16 v22, v10

    goto :goto_91

    :cond_7f
    const/4 v10, 0x6

    if-eq v6, v10, :cond_8e

    if-eq v6, v8, :cond_8e

    if-ne v15, v12, :cond_8b

    if-eqz v3, :cond_8b

    sget-object v10, Lafn;->a:Lafn;

    goto :goto_7c

    :cond_8b
    move-object/from16 v22, v7

    goto :goto_91

    :cond_8e
    sget-object v10, Lzen;->a:Lzen;

    goto :goto_7c

    :goto_91
    new-instance v13, Legn;

    invoke-static {v2}, Luvg;->d(Lwvg;)Luvg;

    move-result-object v14

    const/4 v10, 0x3

    if-eq v6, v10, :cond_9c

    if-ne v6, v8, :cond_a1

    :cond_9c
    if-nez v3, :cond_a1

    move/from16 v16, v9

    goto :goto_a3

    :cond_a1
    move/from16 v16, v5

    :goto_a3
    iget-boolean v3, v0, Lggn;->o:Z

    iget-boolean v11, v0, Lggn;->p:Z

    iget-boolean v5, v0, Lggn;->q:Z

    invoke-virtual {v2}, Lwvg;->b()Z

    move-result v18

    if-nez v18, :cond_b7

    if-eq v6, v12, :cond_c6

    if-eq v6, v10, :cond_c6

    if-eq v6, v8, :cond_c6

    if-eq v6, v4, :cond_c6

    :cond_b7
    invoke-virtual {v2}, Lwvg;->b()Z

    move-result v4

    if-eqz v4, :cond_c3

    invoke-virtual {v2}, Lwvg;->a()Z

    move-result v2

    if-nez v2, :cond_c6

    :cond_c3
    const/16 v20, 0x0

    goto :goto_c8

    :cond_c6
    move/from16 v20, v9

    :goto_c8
    if-eqz v22, :cond_cd

    :goto_ca
    move-object/from16 v21, v7

    goto :goto_d0

    :cond_cd
    iget-object v7, v0, Lggn;->r:Lnfn;

    goto :goto_ca

    :goto_d0
    iget-object v1, v1, Lslk;->c:Lpy9;

    iget-object v1, v1, Lpy9;->g:Lkze;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqtg;

    iget v1, v1, Lqtg;->a:I

    if-ne v1, v9, :cond_e7

    move/from16 v23, v9

    :goto_e0
    move/from16 v17, v3

    move/from16 v19, v5

    move/from16 v18, v11

    goto :goto_ea

    :cond_e7
    const/16 v23, 0x0

    goto :goto_e0

    :goto_ea
    invoke-direct/range {v13 .. v23}, Legn;-><init>(Luvg;IZZZZZLnfn;Ldgh;Z)V

    iget-object v0, v0, Lggn;->l:Lv9j;

    invoke-virtual {v0, v13}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final j()V
    .registers 7

    invoke-virtual {p0}, Lggn;->a()V

    iget-object v0, p0, Lggn;->a:Lydn;

    iget-object v1, p0, Lggn;->m:Lnlk;

    invoke-virtual {v0, v1}, Lydn;->b(Ltdn;)V

    iget-object v0, p0, Lggn;->c:Lslk;

    iget-object v1, v0, Lslk;->i:Lkze;

    new-instance v2, Lfgn;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lfgn;-><init>(Lggn;B)V

    new-instance v3, Lt7d;

    const/16 v4, 0x1c

    invoke-direct {v3, v2, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v2, p0, Lggn;->l:Lv9j;

    invoke-virtual {v2, v1, v3}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, v0, Lslk;->c:Lpy9;

    iget-object v0, v0, Lpy9;->g:Lkze;

    new-instance v1, Lfgn;

    const/4 v3, 0x1

    invoke-direct {v1, p0, v3}, Lfgn;-><init>(Lggn;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v1, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v0, v3}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, p0, Lggn;->b:Lktg;

    iget-object v0, v0, Lktg;->b:Lkze;

    new-instance v1, Lfgn;

    const/4 v3, 0x2

    invoke-direct {v1, p0, v3}, Lfgn;-><init>(Lggn;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v1, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v0, v3}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, p0, Lggn;->d:Lxb;

    iget-object v0, v0, Lxb;->e:Ljze;

    new-instance v1, Lfgn;

    const/4 v3, 0x3

    invoke-direct {v1, p0, v3}, Lfgn;-><init>(Lggn;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v1, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v0, v3}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, p0, Lggn;->e:Lien;

    iget-object v0, v0, Lyi2;->d:Ljava/lang/Object;

    check-cast v0, Lkze;

    new-instance v1, Lfgn;

    const/4 v3, 0x4

    invoke-direct {v1, p0, v3}, Lfgn;-><init>(Lggn;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v1, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v0, v3}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, p0, Lggn;->g:Lyen;

    iget-object v1, v0, Lyi2;->d:Ljava/lang/Object;

    check-cast v1, Lkze;

    new-instance v3, Lfgn;

    const/4 v5, 0x5

    invoke-direct {v3, p0, v5}, Lfgn;-><init>(Lggn;B)V

    new-instance v5, Lt7d;

    invoke-direct {v5, v3, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v1, v5}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, v0, Lyen;->j:Lkze;

    new-instance v1, Lfgn;

    const/4 v3, 0x6

    invoke-direct {v1, p0, v3}, Lfgn;-><init>(Lggn;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v1, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v0, v3}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, p0, Lggn;->i:Lpfn;

    iget-object v0, v0, Lpfn;->k:Lode;

    new-instance v1, Lfgn;

    const/4 v3, 0x7

    invoke-direct {v1, p0, v3}, Lfgn;-><init>(Lggn;B)V

    new-instance v3, Lt7d;

    invoke-direct {v3, v1, v4}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v2, v0, v3}, Lh42;->s(Lekc;Lf7f;)V

    iget-object v0, p0, Lggn;->j:Lru9;

    iget-object p0, p0, Lggn;->n:Lx53;

    invoke-virtual {v0, p0}, Lru9;->a(Ln1;)V

    return-void
.end method

.method public final onStopped()V
    .registers 4

    iget-object v0, p0, Lggn;->a:Lydn;

    iget-object v1, p0, Lggn;->m:Lnlk;

    invoke-virtual {v0, v1}, Lydn;->A(Ltdn;)V

    iget-object v0, p0, Lggn;->c:Lslk;

    iget-object v1, v0, Lslk;->i:Lkze;

    iget-object v2, p0, Lggn;->l:Lv9j;

    invoke-virtual {v2, v1}, Lh42;->t(Lekc;)V

    iget-object v0, v0, Lslk;->c:Lpy9;

    iget-object v0, v0, Lpy9;->g:Lkze;

    invoke-virtual {v2, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lggn;->b:Lktg;

    iget-object v0, v0, Lktg;->b:Lkze;

    invoke-virtual {v2, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lggn;->d:Lxb;

    iget-object v0, v0, Lxb;->e:Ljze;

    invoke-virtual {v2, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lggn;->e:Lien;

    iget-object v0, v0, Lyi2;->d:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v2, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lggn;->g:Lyen;

    iget-object v1, v0, Lyi2;->d:Ljava/lang/Object;

    check-cast v1, Lkze;

    invoke-virtual {v2, v1}, Lh42;->t(Lekc;)V

    iget-object v0, v0, Lyen;->j:Lkze;

    invoke-virtual {v2, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lggn;->i:Lpfn;

    iget-object v0, v0, Lpfn;->k:Lode;

    invoke-virtual {v2, v0}, Lh42;->t(Lekc;)V

    iget-object v0, p0, Lggn;->j:Lru9;

    iget-object p0, p0, Lggn;->n:Lx53;

    invoke-virtual {v0, p0}, Lru9;->d(Ln1;)V

    return-void
.end method
