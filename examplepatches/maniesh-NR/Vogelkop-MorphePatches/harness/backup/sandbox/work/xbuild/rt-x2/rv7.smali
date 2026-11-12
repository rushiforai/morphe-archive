.class public final Lrv7;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lfe5;

.field public final b:Lpde;

.field public final c:Landroid/widget/FrameLayout;

.field public final d:Lhz4;

.field public final e:Liv7;

.field public final f:Lp8f;

.field public final g:Lpde;

.field public final h:Ljv3;

.field public final i:Ltsd;

.field public final j:Lwzg;

.field public final k:Ligi;

.field public final l:Lj1k;

.field public final m:Lhd;

.field public final n:Lyv7;

.field public final o:Lmlj;

.field public final p:Lks6;

.field public final q:Lmv7;

.field public r:Z

.field public s:Lfbn;

.field public final t:Lxpm;

.field public final u:Lpde;

.field public final v:Lqde;

.field public w:Lpv7;


# direct methods
.method public constructor <init>(Lfe5;Lpde;Landroid/widget/FrameLayout;Lhz4;Liv7;Lky1;Lx5f;Lysj;Ljv3;Lp8f;Lpde;Ljv3;Ltsd;Lwzg;Ligi;Lki;Lj1k;)V
    .registers 34

    move-object/from16 v2, p0

    move-object/from16 v1, p1

    move-object/from16 v11, p2

    move-object/from16 v4, p5

    move-object/from16 v10, p15

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v1, v2, Lrv7;->a:Lfe5;

    iput-object v11, v2, Lrv7;->b:Lpde;

    move-object/from16 v0, p3

    iput-object v0, v2, Lrv7;->c:Landroid/widget/FrameLayout;

    move-object/from16 v12, p4

    iput-object v12, v2, Lrv7;->d:Lhz4;

    iput-object v4, v2, Lrv7;->e:Liv7;

    move-object/from16 v3, p10

    iput-object v3, v2, Lrv7;->f:Lp8f;

    move-object/from16 v3, p11

    iput-object v3, v2, Lrv7;->g:Lpde;

    move-object/from16 v3, p12

    iput-object v3, v2, Lrv7;->h:Ljv3;

    move-object/from16 v3, p13

    iput-object v3, v2, Lrv7;->i:Ltsd;

    move-object/from16 v3, p14

    iput-object v3, v2, Lrv7;->j:Lwzg;

    iput-object v10, v2, Lrv7;->k:Ligi;

    move-object/from16 v3, p17

    iput-object v3, v2, Lrv7;->l:Lj1k;

    new-instance v3, Lhd;

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object v5, v4

    move-object v4, v1

    invoke-direct/range {v3 .. v9}, Lhd;-><init>(Lfe5;Liv7;Lky1;Lx5f;Lysj;Ljv3;)V

    move-object v13, v3

    iput-object v13, v2, Lrv7;->m:Lhd;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    new-instance v0, Lqv7;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v1, 0x0

    const-class v3, Lrv7;

    const-string v4, "onClearUrlFieldClicked"

    const-string v5, "onClearUrlFieldClicked()V"

    invoke-direct/range {v0 .. v7}, Lqv7;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object v14, v2

    new-instance v1, Lyv7;

    new-instance v6, Llv7;

    const/4 v15, 0x0

    invoke-direct {v6, v14, v15}, Llv7;-><init>(Lrv7;B)V

    new-instance v7, Llv7;

    const/4 v2, 0x1

    invoke-direct {v7, v14, v2}, Llv7;-><init>(Lrv7;B)V

    move-object/from16 v4, p5

    move-object/from16 v9, p16

    move-object v5, v0

    move-object v0, v1

    move-object v3, v12

    move-object/from16 v1, p1

    move v12, v2

    move-object v2, v8

    move-object v8, v10

    move-object/from16 v10, p7

    invoke-direct/range {v0 .. v10}, Lyv7;-><init>(Lfe5;Landroid/content/Context;Lhz4;Liv7;Lqv7;Llv7;Llv7;Ligi;Lki;Lx5f;)V

    iput-object v0, v14, Lrv7;->n:Lyv7;

    new-instance v2, Lmlj;

    const/4 v3, 0x0

    move-object/from16 v5, p8

    invoke-direct {v2, v5, v3}, Lmlj;-><init>(Lysj;Landroid/view/View;)V

    iput-object v2, v14, Lrv7;->o:Lmlj;

    new-instance v2, Lks6;

    const/4 v3, 0x3

    invoke-direct {v2, v14, v3}, Lks6;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v14, Lrv7;->p:Lks6;

    new-instance v2, Lmv7;

    invoke-direct {v2, v14, v15}, Lmv7;-><init>(Lrv7;B)V

    iput-object v2, v14, Lrv7;->q:Lmv7;

    iget-object v2, v0, Lyv7;->o:Lxpm;

    iput-object v2, v14, Lrv7;->t:Lxpm;

    iget-object v0, v0, Lyv7;->i:Lpde;

    iput-object v0, v14, Lrv7;->u:Lpde;

    iget-object v0, v13, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Lqde;

    iput-object v0, v14, Lrv7;->v:Lqde;

    new-instance v0, Lnv7;

    invoke-direct {v0, v14, v15}, Lnv7;-><init>(Lrv7;B)V

    new-instance v2, Lug;

    const/16 v3, 0x14

    invoke-direct {v2, v0, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v11, v1, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v8, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lode;

    new-instance v2, Lnv7;

    invoke-direct {v2, v14, v12}, Lnv7;-><init>(Lrv7;B)V

    new-instance v5, Lug;

    invoke-direct {v5, v2, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, v5}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v4, Liv7;->f:Lpde;

    new-instance v2, Lnv7;

    const/4 v4, 0x2

    invoke-direct {v2, v14, v4}, Lnv7;-><init>(Lrv7;B)V

    new-instance v4, Lug;

    invoke-direct {v4, v2, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    invoke-virtual {v0, v1, v4}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object p0, p0, Lrv7;->n:Lyv7;

    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/widget/TextView;->hasSelection()Z

    move-result v0

    if-eqz v0, :cond_13

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V

    :cond_13
    return-void
.end method

.method public final b(Llbf;Ljava/lang/Integer;)V
    .registers 6

    iget-object v0, p0, Lrv7;->w:Lpv7;

    if-eqz v0, :cond_11

    iget-object v1, v0, Lpv7;->b:Lha6;

    if-eqz v1, :cond_11

    iget-object v1, v1, Lha6;->m:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v1, :cond_11

    iget-boolean v1, v1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->u:Z

    goto :goto_12

    :cond_11
    const/4 v1, 0x0

    :goto_12
    if-eqz v0, :cond_21

    iget-object v0, v0, Lpv7;->b:Lha6;

    if-eqz v0, :cond_21

    iget-object v0, v0, Lha6;->m:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    if-eqz v0, :cond_21

    invoke-virtual {v0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->s()V

    :cond_21
    sget-object v0, Llbf;->a:Llbf;

    iget-object p0, p0, Lrv7;->m:Lhd;

    if-eq p1, v0, :cond_59

    iget-object p1, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p1, Liy1;

    if-eqz v1, :cond_30

    sget-object p2, Lez1;->c:Lez1;

    goto :goto_4c

    :cond_30
    if-eqz p2, :cond_3d

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v2, 0x1e

    if-ne v0, v2, :cond_3d

    sget-object p2, Lez1;->a:Lez1;

    goto :goto_4c

    :cond_3d
    if-eqz p2, :cond_4a

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/16 v0, 0x1f

    if-ne p2, v0, :cond_4a

    sget-object p2, Lez1;->b:Lez1;

    goto :goto_4c

    :cond_4a
    sget-object p2, Lez1;->c:Lez1;

    :goto_4c
    iget-object v0, p1, Liy1;->j:La52;

    iget-object p1, p1, Liy1;->m:Lqde;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-virtual {v0, p1, p2, v1}, La52;->c(Ljava/util/List;Lez1;Z)V

    :cond_59
    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Liy1;

    invoke-virtual {p0}, Liy1;->b()V

    return-void
.end method

.method public final c(Z)V
    .registers 3

    iget-object v0, p0, Lrv7;->k:Ligi;

    invoke-virtual {v0}, Ligi;->y0()V

    if-eqz p1, :cond_20

    iget-object p1, p0, Lrv7;->l:Lj1k;

    invoke-virtual {p1}, Lj1k;->invoke()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_20

    new-instance p1, Lmv7;

    const/4 v0, 0x1

    invoke-direct {p1, p0, v0}, Lmv7;-><init>(Lrv7;B)V

    iget-object p0, p0, Lrv7;->c:Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_20
    return-void
.end method

.method public final d()V
    .registers 11

    iget-object v0, p0, Lrv7;->k:Ligi;

    iget-object v0, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lhbn;

    instance-of v1, v0, Lbbn;

    const/4 v2, 0x1

    const-wide v3, 0x7ffffffffffffffcL

    iget-object v5, p0, Lrv7;->e:Liv7;

    iget-object v6, p0, Lrv7;->c:Landroid/widget/FrameLayout;

    if-eqz v1, :cond_27

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f140122

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_b1

    :cond_27
    sget-object v1, Lcbn;->a:Lcbn;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const v7, 0x7f141339

    const v8, 0x7f140159

    const/4 v9, 0x0

    if-nez v1, :cond_79

    instance-of v1, v0, Lebn;

    if-nez v1, :cond_79

    instance-of v1, v0, Lfbn;

    if-nez v1, :cond_79

    instance-of v1, v0, Lgbn;

    if-nez v1, :cond_79

    sget-object v1, Ldbn;->a:Ldbn;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_79

    if-nez v0, :cond_75

    invoke-virtual {v5}, Liv7;->b()Z

    move-result v0

    if-nez v0, :cond_60

    iget-object v0, v5, Liv7;->c:Llg;

    invoke-virtual {v0}, Llg;->b()Leri;

    move-result-object v0

    invoke-interface {v0}, Leri;->getId()J

    move-result-wide v0

    cmp-long v0, v0, v3

    if-nez v0, :cond_61

    :cond_60
    move v9, v2

    :cond_61
    if-eqz v9, :cond_6c

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_b1

    :cond_6c
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_b1

    :cond_75
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_79
    iget-boolean v0, p0, Lrv7;->r:Z

    if-eqz v0, :cond_89

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f140162

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_b1

    :cond_89
    invoke-virtual {v5}, Liv7;->b()Z

    move-result v0

    if-nez v0, :cond_9d

    iget-object v0, v5, Liv7;->c:Llg;

    invoke-virtual {v0}, Llg;->b()Leri;

    move-result-object v0

    invoke-interface {v0}, Leri;->getId()J

    move-result-wide v0

    cmp-long v0, v0, v3

    if-nez v0, :cond_9e

    :cond_9d
    move v9, v2

    :cond_9e
    if-eqz v9, :cond_a9

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_b1

    :cond_a9
    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_b1
    iget-object p0, p0, Lrv7;->n:Lyv7;

    iget-object v1, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/OperaEditText;->g(Ljava/lang/String;)V

    invoke-virtual {v5}, Liv7;->b()Z

    move-result v0

    if-nez v0, :cond_ce

    iget-object v0, v5, Liv7;->c:Llg;

    invoke-virtual {v0}, Llg;->b()Leri;

    move-result-object v0

    invoke-interface {v0}, Leri;->getId()J

    move-result-wide v0

    cmp-long v0, v0, v3

    if-eqz v0, :cond_ce

    const/16 v2, 0x11

    :cond_ce
    iget-object v0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/widget/TextView;->getInputType()I

    move-result v0

    if-eq v0, v2, :cond_db

    iget-object p0, p0, Lyv7;->l:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setInputType(I)V

    :cond_db
    return-void
.end method
