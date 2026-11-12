.class public final Lhvl;
.super Luul;
.source "SourceFile"


# instance fields
.field public final l:I

.field public final m:Lp3k;

.field public final n:Lk5o;

.field public final o:Lyhe;

.field public final p:Lx43;

.field public final q:Lcom/opera/android/custom_views/TabCountButton;

.field public final r:Landroid/view/View;

.field public final s:Landroid/view/View;

.field public final t:Landroid/view/View;

.field public final u:Lua7;

.field public final v:Ltt3;


# direct methods
.method public constructor <init>(Lpt3;Lk6l;Ltt3;Lcom/opera/android/bar/TopToolbarContainer;Lnwf;Lysl;Lv1f;Ltt3;Lcom/opera/android/BrowserActivity;Lpde;)V
    .registers 19

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p6

    move-object/from16 v1, p9

    move-object/from16 v7, p10

    invoke-direct/range {v0 .. v7}, Luul;-><init>(Lcom/opera/android/BrowserActivity;Lpt3;Lk6l;Lesk;Lcom/opera/android/bar/TopToolbarContainer;Lysl;Lpde;)V

    new-instance p1, Lx43;

    sget-object p3, Lyul;->d:Lyul;

    invoke-direct {p1, p3}, Lx43;-><init>(Lyul;)V

    iput-object p1, p0, Lhvl;->p:Lx43;

    invoke-virtual {p4}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f070080

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lhvl;->l:I

    new-instance p1, Lp3k;

    iget-object p3, p0, Luul;->j:Lcom/opera/android/bar/TopToolbarContainer;

    sget-object p6, Lp3k;->j:Ljava/util/Set;

    invoke-direct {p1, p3, p6}, Lp3k;-><init>(Landroid/view/View;Ljava/util/Set;)V

    iput-object p1, p0, Lhvl;->m:Lp3k;

    new-instance p1, Lk5o;

    const p3, 0x7f0a0061

    invoke-virtual {p4, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    invoke-interface/range {p9 .. p9}, Lndc;->getLifecycle()Ltcc;

    move-result-object p6

    new-instance v1, Lop3;

    const/4 v2, 0x0

    invoke-direct {v1, p5, v2}, Lop3;-><init>(Lnwf;B)V

    invoke-direct {p1, p3, p7, p6, v1}, Lk5o;-><init>(Landroid/widget/ImageView;Lv1f;Ltcc;Landroid/view/View$OnClickListener;)V

    iput-object p1, p0, Lhvl;->n:Lk5o;

    new-instance p1, Lyhe;

    const p3, 0x7f0a0bbc

    invoke-virtual {p4, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    invoke-direct {p1, p3, p5, p5}, Lyhe;-><init>(Landroid/view/View;Lgim;Lhim;)V

    iput-object p1, p0, Lhvl;->o:Lyhe;

    const p1, 0x7f0a0b30

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/TabCountButton;

    iput-object p1, p0, Lhvl;->q:Lcom/opera/android/custom_views/TabCountButton;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p3, Lshf;

    new-instance p6, Lz61;

    invoke-direct {p6, p1}, Lz61;-><init>(Landroid/view/View;)V

    iget-object p6, p6, Lz61;->b:Ljava/lang/Object;

    check-cast p6, Lkze;

    iget-object p7, p1, Lcom/opera/android/custom_views/TabCountButton;->k:Lm3l;

    new-instance v1, Ln6k;

    const/16 v2, 0x12

    invoke-direct {v1, p1, v2}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3, p6, p2, p7, v1}, Lshf;-><init>(Lkze;Lk6l;Lm3l;Lkotlin/jvm/functions/Function1;)V

    new-instance p2, Lop3;

    const/4 p3, 0x2

    invoke-direct {p2, p5, p3}, Lop3;-><init>(Lnwf;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lzt;

    const/16 p3, 0xe

    invoke-direct {p2, p5, p3}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance p2, Lsvk;

    const/4 p6, 0x3

    invoke-direct {p2, p1, p6}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p7

    if-eqz p7, :cond_9d

    invoke-static {p7, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_9d
    invoke-virtual {p2, p1}, Lsvk;->a(Landroid/view/View;)V

    const p1, 0x7f0a013d

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lhvl;->r:Landroid/view/View;

    const p2, 0x7f0a04ce

    invoke-virtual {p4, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lhvl;->s:Landroid/view/View;

    new-instance p7, Lua7;

    invoke-direct {p7, p5, p1, p2}, Lua7;-><init>(Lnwf;Landroid/view/View;Landroid/view/View;)V

    iput-object p7, p0, Lhvl;->u:Lua7;

    move-object/from16 p1, p8

    iput-object p1, p0, Lhvl;->v:Ltt3;

    const p1, 0x7f0a0058

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lhvl;->t:Landroid/view/View;

    new-instance p2, Lop3;

    invoke-direct {p2, p5, p6}, Lop3;-><init>(Lnwf;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lz43;->g:Ljava/lang/Object;

    check-cast p0, Lw43;

    iget-object p0, p0, Lw43;->d:Ljava/lang/Object;

    check-cast p0, Lkze;

    new-instance p2, Lk9;

    invoke-direct {p2, p1, p3}, Lk9;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v1, p9

    invoke-virtual {p0, v1, p2}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final A(Lx43;)V
    .registers 2

    return-void
.end method

.method public final B(Z)V
    .registers 2

    return-void
.end method

.method public final b(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;)Lv73;
    .registers 23

    new-instance v0, Lfq3;

    const/4 v11, 0x1

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move-object/from16 v10, p10

    invoke-direct/range {v0 .. v11}, Lfq3;-><init>(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;B)V

    return-object v0
.end method

.method public final c(Landroid/content/Context;Lwv1;Ldu3;Lnue;Ldu3;Lnwf;)Ldbl;
    .registers 16

    new-instance v0, Ldbl;

    iget-object v1, p0, Lz43;->g:Ljava/lang/Object;

    check-cast v1, Lw43;

    iget-object v1, v1, Lw43;->d:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Lkze;

    iget-object v6, p0, Lhvl;->v:Ltt3;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Ldbl;-><init>(Landroid/content/Context;Lwv1;Ldu3;Lnue;Ldu3;Lesk;Lkze;Lnwf;)V

    return-object v0
.end method

.method public final e()I
    .registers 1

    iget p0, p0, Lhvl;->l:I

    return p0
.end method

.method public final f()Landroid/widget/ImageView;
    .registers 1

    iget-object p0, p0, Lhvl;->n:Lk5o;

    iget-object p0, p0, Lk5o;->b:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    return-object p0
.end method

.method public final g(Lnje;)Landroid/view/View;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_25

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1c

    const/4 v1, 0x2

    if-ne p1, v1, :cond_16

    iget-object p0, p0, Lhvl;->t:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2e

    return-object p0

    :cond_16
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_1c
    iget-object p0, p0, Lhvl;->s:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2e

    return-object p0

    :cond_25
    iget-object p0, p0, Lhvl;->r:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2e

    return-object p0

    :cond_2e
    return-object v0
.end method

.method public final h()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lhvl;->o:Lyhe;

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    return-object p0
.end method

.method public final i()Lbp;
    .registers 4

    iget-object p0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast p0, Lgbf;

    invoke-virtual {p0}, Lgbf;->q()Lcom/opera/android/bar/OmniButtonView;

    move-result-object p0

    if-eqz p0, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const/16 v1, 0x258

    if-lt v0, v1, :cond_29

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    new-instance v1, Lbp;

    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    neg-int v0, v0

    invoke-direct {v1, p0, v0}, Lbp;-><init>(Ljava/lang/Object;I)V

    return-object v1

    :cond_29
    const/4 p0, 0x0

    return-object p0
.end method

.method public final j()J
    .registers 3

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public final k()Lx43;
    .registers 1

    iget-object p0, p0, Lhvl;->p:Lx43;

    return-object p0
.end method

.method public final l()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lhvl;->q:Lcom/opera/android/custom_views/TabCountButton;

    return-object p0
.end method

.method public final n()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final w(Z)V
    .registers 3

    iget-object p0, p0, Lhvl;->m:Lp3k;

    iget-object p0, p0, Lp3k;->a:Lcom/opera/android/bar/ExtraSideActionsAppbar;

    iget-object p0, p0, Lcom/opera/android/bar/ExtraSideActionsAppbar;->d:Lbn8;

    iget-boolean v0, p0, Lbn8;->f:Z

    if-ne v0, p1, :cond_b

    return-void

    :cond_b
    iput-boolean p1, p0, Lbn8;->f:Z

    iget-object p0, p0, Lbn8;->k:Lcom/opera/android/bar/ExtraSideActionsAppbar;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final z(Lb2l;)V
    .registers 4

    invoke-super {p0, p1}, Luul;->z(Lb2l;)V

    iget-object p0, p0, Lhvl;->u:Lua7;

    iget-object v0, p0, Lua7;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->f()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object p0, p0, Lua7;->d:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    invoke-virtual {p1}, Ld7l;->n()Z

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method
