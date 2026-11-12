.class public abstract Lpp3;
.super Lz43;
.source "SourceFile"


# instance fields
.field public final j:Lcom/opera/android/bar/BottomBar;

.field public final k:Lx43;

.field public final l:Lp3k;

.field public final m:Lk5o;

.field public final n:Lyhe;

.field public final o:Lcom/opera/android/custom_views/TabCountButton;

.field public final p:Landroid/view/View;

.field public final q:Landroid/view/View;

.field public final r:Landroid/view/View;

.field public final s:Lua7;

.field public final t:Lesk;


# direct methods
.method public constructor <init>(Lpt3;Lk6l;Lesk;Landroid/view/ViewGroup;Lcom/opera/android/bar/BottomBar;Lnwf;Lysl;Lv1f;Lesk;Lcom/opera/android/BrowserActivity;Lpde;Ljava/util/Set;)V
    .registers 21

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p7

    move-object/from16 v1, p10

    move-object/from16 v7, p11

    invoke-direct/range {v0 .. v7}, Lz43;-><init>(Lcom/opera/android/BrowserActivity;Lpt3;Lk6l;Lesk;Landroid/view/ViewGroup;Lysl;Lpde;)V

    new-instance p1, Lx43;

    sget-object p3, Lyul;->d:Lyul;

    invoke-direct {p1, p3}, Lx43;-><init>(Lyul;)V

    iput-object p1, p0, Lpp3;->k:Lx43;

    iput-object p5, p0, Lpp3;->j:Lcom/opera/android/bar/BottomBar;

    new-instance p1, Lp3k;

    move-object/from16 p3, p12

    invoke-direct {p1, p4, p3}, Lp3k;-><init>(Landroid/view/View;Ljava/util/Set;)V

    iput-object p1, p0, Lpp3;->l:Lp3k;

    new-instance p1, Lk5o;

    const p3, 0x7f0a0061

    invoke-virtual {p4, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Landroid/widget/ImageView;

    invoke-interface/range {p10 .. p10}, Lndc;->getLifecycle()Ltcc;

    move-result-object p5

    new-instance p7, Lop3;

    const/4 v1, 0x0

    invoke-direct {p7, p6, v1}, Lop3;-><init>(Lnwf;B)V

    move-object/from16 v1, p8

    invoke-direct {p1, p3, v1, p5, p7}, Lk5o;-><init>(Landroid/widget/ImageView;Lv1f;Ltcc;Landroid/view/View$OnClickListener;)V

    iput-object p1, p0, Lpp3;->m:Lk5o;

    new-instance p1, Lyhe;

    const p3, 0x7f0a0bbc

    invoke-virtual {p4, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    invoke-direct {p1, p3, p6, p6}, Lyhe;-><init>(Landroid/view/View;Lgim;Lhim;)V

    iput-object p1, p0, Lpp3;->n:Lyhe;

    const p1, 0x7f0a0b30

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/TabCountButton;

    iput-object p1, p0, Lpp3;->o:Lcom/opera/android/custom_views/TabCountButton;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p3, Lshf;

    new-instance p5, Lz61;

    invoke-direct {p5, p1}, Lz61;-><init>(Landroid/view/View;)V

    iget-object p5, p5, Lz61;->b:Ljava/lang/Object;

    check-cast p5, Lkze;

    iget-object p7, p1, Lcom/opera/android/custom_views/TabCountButton;->k:Lm3l;

    new-instance v1, Ln6k;

    const/16 v2, 0x12

    invoke-direct {v1, p1, v2}, Ln6k;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p3, p5, p2, p7, v1}, Lshf;-><init>(Lkze;Lk6l;Lm3l;Lkotlin/jvm/functions/Function1;)V

    new-instance p2, Lop3;

    const/4 p3, 0x2

    invoke-direct {p2, p6, p3}, Lop3;-><init>(Lnwf;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lzt;

    const/16 p3, 0xe

    invoke-direct {p2, p6, p3}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    new-instance p2, Lsvk;

    const/4 p5, 0x3

    invoke-direct {p2, p1, p5}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p5

    if-eqz p5, :cond_92

    invoke-static {p5, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_92
    invoke-virtual {p2, p1}, Lsvk;->a(Landroid/view/View;)V

    const p1, 0x7f0a013d

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lpp3;->p:Landroid/view/View;

    const p2, 0x7f0a04ce

    invoke-virtual {p4, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lpp3;->q:Landroid/view/View;

    new-instance p5, Lua7;

    invoke-direct {p5, p6, p1, p2}, Lua7;-><init>(Lnwf;Landroid/view/View;Landroid/view/View;)V

    iput-object p5, p0, Lpp3;->s:Lua7;

    move-object/from16 p1, p9

    iput-object p1, p0, Lpp3;->t:Lesk;

    const p1, 0x7f0a0058

    invoke-virtual {p4, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lpp3;->r:Landroid/view/View;

    new-instance p2, Lop3;

    const/4 p4, 0x1

    invoke-direct {p2, p6, p4}, Lop3;-><init>(Lnwf;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lz43;->g:Ljava/lang/Object;

    check-cast p0, Lw43;

    iget-object p0, p0, Lw43;->d:Ljava/lang/Object;

    check-cast p0, Lkze;

    new-instance p2, Lk9;

    invoke-direct {p2, p1, p3}, Lk9;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v1, p10

    invoke-virtual {p0, v1, p2}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()Ljm7;
    .registers 3

    new-instance p0, Ljm7;

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Ljm7;-><init>(ZI)V

    return-object p0
.end method

.method public final c(Landroid/content/Context;Lwv1;Ldu3;Lnue;Ldu3;Lnwf;)Ldbl;
    .registers 16

    new-instance v0, Ldbl;

    iget-object v1, p0, Lz43;->g:Ljava/lang/Object;

    check-cast v1, Lw43;

    iget-object v1, v1, Lw43;->d:Ljava/lang/Object;

    move-object v7, v1

    check-cast v7, Lkze;

    iget-object v6, p0, Lpp3;->t:Lesk;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v8, p6

    invoke-direct/range {v0 .. v8}, Ldbl;-><init>(Landroid/content/Context;Lwv1;Ldu3;Lnue;Ldu3;Lesk;Lkze;Lnwf;)V

    return-object v0
.end method

.method public final f()Landroid/widget/ImageView;
    .registers 1

    iget-object p0, p0, Lpp3;->m:Lk5o;

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

    iget-object p0, p0, Lpp3;->r:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2e

    return-object p0

    :cond_16
    new-instance p0, Ljava/lang/RuntimeException;

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_1c
    iget-object p0, p0, Lpp3;->q:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2e

    return-object p0

    :cond_25
    iget-object p0, p0, Lpp3;->p:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2e

    return-object p0

    :cond_2e
    return-object v0
.end method

.method public final h()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lpp3;->n:Lyhe;

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    return-object p0
.end method

.method public final k()Lx43;
    .registers 1

    iget-object p0, p0, Lpp3;->k:Lx43;

    return-object p0
.end method

.method public final l()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lpp3;->o:Lcom/opera/android/custom_views/TabCountButton;

    return-object p0
.end method

.method public final p()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final q()Z
    .registers 1

    iget-object p0, p0, Lpp3;->j:Lcom/opera/android/bar/BottomBar;

    invoke-virtual {p0}, Lcom/opera/android/bar/BottomBar;->f()I

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final w(Z)V
    .registers 3

    iget-object p0, p0, Lpp3;->l:Lp3k;

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

    iget-object p0, p0, Lpp3;->s:Lua7;

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
