.class public final Lsdh;
.super Lns8;
.source "SourceFile"


# instance fields
.field public final B:Lmdh;

.field public final C:Lqdh;

.field public final D:Lorm;

.field public final E:Lskm;

.field public final F:Ltlg;


# direct methods
.method public constructor <init>(Lmdh;Lqdh;Ltq8;Lcom/opera/android/settings/SettingsManager;Ltta;ZLorm;Lskm;Lqr8;Lnv2;Ltlg;Lp6l;)V
    .registers 27

    const/4 v6, 0x1

    const/4 v12, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object/from16 v1, p3

    move-object/from16 v2, p4

    move-object/from16 v5, p5

    move/from16 v7, p6

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    move-object/from16 v11, p11

    move-object/from16 v13, p12

    invoke-direct/range {v0 .. v13}, Lns8;-><init>(Ltq8;Lcom/opera/android/settings/SettingsManager;ZLo28;Ltta;ZZLskm;Lqr8;Lnv2;Ltlg;Lzzj;Lp6l;)V

    iput-object p1, p0, Lsdh;->B:Lmdh;

    move-object/from16 p1, p2

    iput-object p1, p0, Lsdh;->C:Lqdh;

    move-object/from16 p1, p7

    iput-object p1, p0, Lsdh;->D:Lorm;

    iput-object v8, p0, Lsdh;->E:Lskm;

    iput-object v11, p0, Lsdh;->F:Ltlg;

    return-void
.end method


# virtual methods
.method public final H(Landroid/content/Context;Lhq8;)Ljava/util/List;
    .registers 9

    if-eqz p2, :cond_63

    instance-of v0, p2, Lkdh;

    const v1, 0x7f0804df

    const v2, 0x7f140be8

    if-eqz v0, :cond_26

    new-instance p1, Lgtd;

    new-instance v0, Lrxh;

    invoke-direct {v0, v2}, Lrxh;-><init>(I)V

    new-instance v2, Llxh;

    invoke-direct {v2, v1}, Llxh;-><init>(I)V

    new-instance v1, Lrdh;

    const/4 v3, 0x0

    invoke-direct {v1, p0, p2, v3}, Lrdh;-><init>(Lsdh;Lhq8;B)V

    invoke-direct {p1, v0, v2, v1}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_26
    instance-of v0, p2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-eqz v0, :cond_63

    new-instance v0, Lgtd;

    new-instance v3, Lrxh;

    invoke-direct {v3, v2}, Lrxh;-><init>(I)V

    new-instance v2, Llxh;

    invoke-direct {v2, v1}, Llxh;-><init>(I)V

    new-instance v1, Lrdh;

    const/4 v4, 0x1

    invoke-direct {v1, p0, p2, v4}, Lrdh;-><init>(Lsdh;Lhq8;B)V

    invoke-direct {v0, v3, v2, v1}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    new-instance v1, Lgtd;

    new-instance v2, Lrxh;

    const v3, 0x7f140567

    invoke-direct {v2, v3}, Lrxh;-><init>(I)V

    new-instance v3, Llxh;

    const v4, 0x7f080540

    invoke-direct {v3, v4}, Llxh;-><init>(I)V

    new-instance v4, Ldv2;

    const/4 v5, 0x6

    invoke-direct {v4, p0, p1, p2, v5}, Ldv2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v1, v2, v3, v4}, Lgtd;-><init>(Lrxh;Llxh;Landroid/view/View$OnClickListener;)V

    filled-new-array {v0, v1}, [Lgtd;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_63
    const/4 p0, 0x0

    return-object p0
.end method

.method public final I(Landroid/content/Context;Lhq8;)V
    .registers 9

    instance-of p1, p2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-nez p1, :cond_5

    return-void

    :cond_5
    check-cast p2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object v1, p2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-static {p2}, Lsfe;->W(Lhq8;)Lfr;

    move-result-object v2

    const-wide/16 v3, 0x0

    const/4 v5, 0x4

    iget-object v0, p0, Lsdh;->E:Lskm;

    invoke-static/range {v0 .. v5}, Lsfe;->u0(Lskm;Ltqi;Lfr;JI)V

    iget-object p1, p0, Lsdh;->D:Lorm;

    check-cast p1, Lx5f;

    iget-boolean v0, p1, Lx5f;->h:Z

    if-eqz v0, :cond_34

    iget-object v0, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    invoke-static {v0, v1}, Lam2;->g(Lzpa;Lx56;)Lqp0;

    move-result-object v0

    iget-object v0, v0, Lqp0;->b:Lb66;

    const/16 v2, 0x26

    const/4 v3, 0x1

    const-wide/16 v4, 0x1

    invoke-virtual {v0, v2, v3, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {p1, v1}, Lx5f;->U0(Lx56;)V

    :cond_34
    iget-object p0, p0, Lsdh;->B:Lmdh;

    iget-object p1, p0, Lmdh;->b:Lpdh;

    iget-object v0, p0, Lmdh;->h:Lh42;

    iget-object v1, p2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget v1, v1, Ltqi;->a:I

    invoke-virtual {p1, v1}, Lpdh;->b(I)V

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-nez v1, :cond_4b

    sget-object v1, Ll08;->a:Ll08;

    :cond_4b
    invoke-static {p2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-static {v1, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_5b

    invoke-virtual {p1}, Lpdh;->c()V

    invoke-virtual {p0}, Lmdh;->c()V

    :cond_5b
    invoke-virtual {p0}, Lmdh;->a()Ljava/util/List;

    move-result-object p1

    invoke-virtual {v0, p1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lmdh;->c:Lcul;

    invoke-virtual {p0}, Lcul;->e()V

    return-void
.end method

.method public final M(Lcom/opera/android/favorites/e;Lhq8;)V
    .registers 3

    invoke-virtual {p0, p2}, Lsdh;->b0(Lhq8;)V

    invoke-virtual {p1, p2}, Lcom/opera/android/favorites/e;->k(Lhq8;)V

    return-void
.end method

.method public final T()V
    .registers 4

    iget-object v0, p0, Lns8;->c:Ls9i;

    invoke-virtual {v0}, Ls9i;->i0()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lsdh;->F:Ltlg;

    iget-object v1, v0, Ltlg;->g:Lkze;

    iget-object v2, p0, Lns8;->v:Lzr8;

    invoke-virtual {v1, v2}, Lekc;->p(Lf7f;)V

    iget-object v0, v0, Ltlg;->i:Lkze;

    iget-object p0, p0, Lns8;->w:Lzr8;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    :cond_18
    return-void
.end method

.method public final W()V
    .registers 4

    iget-object v0, p0, Lns8;->c:Ls9i;

    invoke-virtual {v0}, Ls9i;->i0()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-object v0, p0, Lsdh;->F:Ltlg;

    iget-object v1, v0, Ltlg;->g:Lkze;

    iget-object v2, p0, Lns8;->v:Lzr8;

    invoke-virtual {v1, v2}, Lekc;->k(Lf7f;)V

    iget-object v0, v0, Ltlg;->i:Lkze;

    iget-object p0, p0, Lns8;->w:Lzr8;

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    :cond_18
    return-void
.end method

.method public final b0(Lhq8;)V
    .registers 11

    if-eqz p1, :cond_3f

    instance-of v0, p1, Lkdh;

    if-eqz v0, :cond_1d

    check-cast p1, Lkdh;

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_f
    if-ge v1, v0, :cond_3f

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhq8;

    invoke-virtual {p0, v2}, Lsdh;->b0(Lhq8;)V

    goto :goto_f

    :cond_1d
    instance-of v0, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-eqz v0, :cond_3f

    check-cast p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object v0, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object v1, p0, Lsdh;->C:Lqdh;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v2, Lidh;->a:Lidh;

    invoke-virtual {v1, v0, v2}, Lqdh;->a(Ltqi;Lidh;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-object v4, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-static {p1}, Lsfe;->W(Lhq8;)Lfr;

    move-result-object v5

    const/4 v8, 0x2

    iget-object v3, p0, Lsdh;->E:Lskm;

    invoke-static/range {v3 .. v8}, Lsfe;->u0(Lskm;Ltqi;Lfr;JI)V

    :cond_3f
    return-void
.end method
