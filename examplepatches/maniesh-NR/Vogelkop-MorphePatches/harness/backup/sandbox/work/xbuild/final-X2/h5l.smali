.class public final Lh5l;
.super Ljal;
.source "SourceFile"

# interfaces
.implements Lpkb;
.implements Lhlb;
.implements Lklb;


# instance fields
.field public final b:Ld5l;

.field public final c:Lypd;

.field public final d:Lpde;

.field public final e:Ls9i;

.field public final f:Ltsd;

.field public g:I

.field public h:Lu2l;

.field public i:Lu2l;

.field public final j:Lqz;

.field public k:Landroid/graphics/drawable/Drawable;

.field public final l:Lkol;

.field public final m:Lkol;

.field public final n:Lh5k;


# direct methods
.method public constructor <init>(Lpde;Ld5l;Lypd;Lpde;Ls9i;Lyqa;)V
    .registers 15

    iget-object v0, p2, Ld5l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v1, p2, Ld5l;->j:Landroid/view/View;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lh5l;->b:Ld5l;

    iput-object p3, p0, Lh5l;->c:Lypd;

    iput-object p4, p0, Lh5l;->d:Lpde;

    iput-object p5, p0, Lh5l;->e:Ls9i;

    invoke-static {v0}, Lp37;->z(Landroid/view/View;)Lkze;

    move-result-object p3

    invoke-static {p1, p3}, La26;->w(Likc;Lkze;)Ltsd;

    move-result-object v4

    iput-object v4, p0, Lh5l;->f:Ltsd;

    new-instance p1, Lqz;

    const/16 p3, 0x1d

    invoke-direct {p1, p0, p3}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lh5l;->j:Lqz;

    iget-object p1, p2, Ld5l;->i:Landroid/view/View;

    new-instance v2, Lkol;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance p3, Lbvk;

    const/4 v5, 0x6

    invoke-direct {p3, v5}, Lbvk;-><init>(B)V

    invoke-static {p4, p3}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p3

    invoke-static {p3}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v5

    new-instance v7, Le5l;

    const/4 p3, 0x1

    invoke-direct {v7, p0, p3}, Le5l;-><init>(Lh5l;B)V

    move-object v6, p6

    invoke-direct/range {v2 .. v7}, Lkol;-><init>(Landroid/content/Context;Lpde;Likc;Lyqa;Lkotlin/jvm/functions/Function1;)V

    new-instance p6, Lanh;

    invoke-direct {p6, v2, p3}, Lanh;-><init>(Lkol;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_50

    invoke-static {v3, p1, p6}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_50
    iput-object v2, p0, Lh5l;->l:Lkol;

    const/4 p1, 0x2

    if-eqz v1, :cond_80

    new-instance v2, Lkol;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    new-instance p6, Lbvk;

    const/4 v5, 0x7

    invoke-direct {p6, v5}, Lbvk;-><init>(B)V

    invoke-static {p4, p6}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p6

    invoke-static {p6}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v5

    new-instance v7, Le5l;

    invoke-direct {v7, p0, p1}, Le5l;-><init>(Lh5l;B)V

    invoke-direct/range {v2 .. v7}, Lkol;-><init>(Landroid/content/Context;Lpde;Likc;Lyqa;Lkotlin/jvm/functions/Function1;)V

    new-instance p6, Lanh;

    invoke-direct {p6, v2, p1}, Lanh;-><init>(Lkol;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v3

    if-eqz v3, :cond_81

    invoke-static {v3, v1, p6}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    goto :goto_81

    :cond_80
    const/4 v2, 0x0

    :cond_81
    :goto_81
    iput-object v2, p0, Lh5l;->m:Lkol;

    new-instance p6, Lh5k;

    invoke-direct {p6, v4, p4, p2}, Lh5k;-><init>(Ltsd;Lpde;Lre5;)V

    iput-object p6, p0, Lh5l;->n:Lh5k;

    new-instance p4, Le5l;

    const/4 p6, 0x0

    invoke-direct {p4, p0, p6}, Le5l;-><init>(Lh5l;B)V

    new-instance v1, Lw4i;

    const/16 v2, 0x16

    invoke-direct {v1, p4, v2}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v1}, Lekc;->k(Lf7f;)V

    iget-object p4, p2, Ld5l;->d:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v1, Lf5l;

    invoke-direct {v1, p0, p6}, Lf5l;-><init>(Lh5l;B)V

    invoke-virtual {p4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p4, p2, Ld5l;->e:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz p4, :cond_b0

    new-instance v1, Lf5l;

    invoke-direct {v1, p0, p3}, Lf5l;-><init>(Lh5l;B)V

    invoke-virtual {p4, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_b0
    iget-object p2, p2, Ld5l;->f:Lcom/opera/android/custom_views/StylingImageButton;

    new-instance p4, Lf5l;

    invoke-direct {p4, p0, p1}, Lf5l;-><init>(Lh5l;B)V

    invoke-virtual {p2, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lf5l;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lf5l;-><init>(Lh5l;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lzt;

    const/16 p2, 0xf

    invoke-direct {p1, p0, p2}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p1, p5, Ls9i;->c:Ljava/lang/Object;

    check-cast p1, Lpde;

    new-instance p2, Lg5l;

    invoke-direct {p2, p0, p6}, Lg5l;-><init>(Lh5l;B)V

    invoke-static {p1, v4, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    iget-object p1, p5, Ls9i;->d:Ljava/lang/Object;

    check-cast p1, Lpde;

    new-instance p2, Lg5l;

    invoke-direct {p2, p0, p3}, Lg5l;-><init>(Lh5l;B)V

    invoke-static {p1, v4, p2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 3

    iget-object v0, p0, Lh5l;->i:Lu2l;

    if-eqz v0, :cond_d

    iget-object v0, v0, Lu2l;->a:Lb2l;

    iget-object p0, p0, Lh5l;->c:Lypd;

    sget-object v1, Lpdb;->a:Lpdb;

    invoke-virtual {p0, v0, v1}, Lypd;->p(Lb2l;Lpdb;)V

    :cond_d
    return-void
.end method

.method public final F()V
    .registers 7

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, p0, Lh5l;->d:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-wide v1, p0, Leyj;->C:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-static {v0}, La26;->r(Landroid/view/View;)V

    invoke-static {v0}, La26;->A(Landroid/view/View;)Luh7;

    move-result-object v3

    new-instance v4, Luh7;

    const/high16 p0, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    invoke-direct {v4, p0, p0, v5}, Luh7;-><init>(FFF)V

    const/4 v5, 0x1

    invoke-static/range {v0 .. v5}, La26;->g(Landroid/view/View;JLuh7;Luh7;Z)V

    return-void
.end method

.method public final L()V
    .registers 8

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p0, p0, Lh5l;->d:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget-wide v1, v1, Leyj;->C:J

    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget p0, p0, Leyj;->B:F

    invoke-static {v0}, La26;->r(Landroid/view/View;)V

    invoke-static {v0}, La26;->A(Landroid/view/View;)Luh7;

    move-result-object v3

    new-instance v4, Luh7;

    const/high16 v5, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    invoke-direct {v4, p0, v5, v6}, Luh7;-><init>(FFF)V

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, La26;->g(Landroid/view/View;JLuh7;Luh7;Z)V

    return-void
.end method

.method public final M(Lial;)V
    .registers 5

    iget-object p1, p1, Lial;->a:Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->m0(Ljava/lang/Iterable;)Ljava/util/LinkedHashSet;

    move-result-object p1

    iget-object v0, p0, Lh5l;->i:Lu2l;

    if-eqz v0, :cond_5c

    iget-object v0, v0, Lu2l;->a:Lb2l;

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5c

    move-object v1, v0

    check-cast v1, Ld7l;

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v2

    iget v2, v2, Lcom/opera/android/browser/TabInfo;->d:I

    if-eqz v2, :cond_2c

    iget-object v0, v1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_47

    :cond_2c
    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->J(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object v0

    iget v0, v0, Lcom/opera/android/browser/TabInfo;->d:I

    if-eqz v0, :cond_46

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_47

    :cond_46
    const/4 v0, 0x0

    :goto_47
    if-nez v0, :cond_4c

    sget-object v1, Lvr0;->g:Lvr0;

    goto :goto_57

    :cond_4c
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_55

    sget-object v1, Lvr0;->h:Lvr0;

    goto :goto_57

    :cond_55
    sget-object v1, Lvr0;->q:Lvr0;

    :goto_57
    iget-object p0, p0, Lh5l;->c:Lypd;

    invoke-virtual {p0, v0, p1, v1}, Lypd;->P(Ljava/lang/Integer;Ljava/util/Set;Lvr0;)V

    :cond_5c
    return-void
.end method

.method public final U()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lh5l;->b:Ld5l;

    iget-object p0, p0, Ld5l;->c:Landroid/view/View;

    return-object p0
.end method

.method public final X()Ljava/util/List;
    .registers 1

    iget-object p0, p0, Lh5l;->h:Lu2l;

    if-eqz p0, :cond_b

    iget-object p0, p0, Lu2l;->a:Lb2l;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_b
    sget-object p0, Ll08;->a:Ll08;

    return-object p0
.end method

.method public final Z()V
    .registers 4

    iget-object v0, p0, Lh5l;->i:Lu2l;

    if-eqz v0, :cond_2c

    iget-object v0, v0, Lu2l;->a:Lb2l;

    iget-object v1, p0, Lh5l;->e:Ls9i;

    invoke-virtual {v1, v0}, Ls9i;->Z(Lb2l;)Z

    move-result v2

    iget-object p0, p0, Lh5l;->b:Ld5l;

    iget-object p0, p0, Ld5l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v2, :cond_21

    iget-object v1, v1, Ls9i;->c:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-virtual {v1, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_29

    :cond_21
    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isActive()Z

    move-result v0

    :goto_29
    invoke-virtual {p0, v0}, Landroid/view/View;->setSelected(Z)V

    :cond_2c
    return-void
.end method

.method public final a0()V
    .registers 4

    iget v0, p0, Lh5l;->g:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    iget-object v1, p0, Lh5l;->n:Lh5k;

    iget-boolean v2, v1, Lh5k;->a:Z

    if-eq v0, v2, :cond_12

    iput-boolean v0, v1, Lh5k;->a:Z

    invoke-virtual {v1}, Lh5k;->e()V

    :cond_12
    iget-object p0, p0, Lh5l;->b:Ld5l;

    iget-object p0, p0, Ld5l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_22

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    :cond_22
    return-void
.end method

.method public final b0()V
    .registers 6

    iget-object v0, p0, Lh5l;->i:Lu2l;

    if-eqz v0, :cond_74

    iget-object v0, v0, Lu2l;->a:Lb2l;

    move-object v1, v0

    check-cast v1, Ld7l;

    invoke-virtual {v1}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lfol;

    invoke-interface {v0}, Lb9l;->T()Lp6l;

    move-result-object v0

    iget-object v4, v1, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->getId()I

    move-result v4

    invoke-direct {v3, v4, v0, v2}, Lfol;-><init>(ILp6l;Ljava/lang/String;)V

    iget-object v0, p0, Lh5l;->l:Lkol;

    if-eqz v0, :cond_23

    invoke-virtual {v0, v3}, Lkol;->j(Lfol;)V

    :cond_23
    iget-object v0, p0, Lh5l;->m:Lkol;

    if-eqz v0, :cond_2a

    invoke-virtual {v0, v3}, Lkol;->j(Lfol;)V

    :cond_2a
    iget-object p0, p0, Lh5l;->b:Ld5l;

    iget-object v0, p0, Ld5l;->h:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v3, p0, Ld5l;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v0, :cond_74

    iget-object v0, v1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f14017c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_6f

    :cond_4a
    invoke-virtual {v1}, Ld7l;->g0()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->r(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_58

    invoke-static {v0}, Lwqm;->H(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_58
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_6f

    invoke-static {v2}, Lwqm;->w(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6f

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f14083d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_6f
    :goto_6f
    iget-object p0, p0, Ld5l;->h:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_74
    return-void
.end method

.method public final c0()V
    .registers 3

    iget-object v0, p0, Lh5l;->i:Lu2l;

    if-eqz v0, :cond_23

    iget-object v0, v0, Lu2l;->a:Lb2l;

    iget-object p0, p0, Lh5l;->b:Ld5l;

    iget-object p0, p0, Ld5l;->f:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-static {v0}, Lexg;->f(Lb2l;)Z

    move-result v1

    invoke-static {v0}, Lexg;->h(Lb2l;)Z

    move-result v0

    if-nez v1, :cond_1c

    if-nez v0, :cond_1c

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_1c
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-static {p0, v1}, Llah;->e(Lcom/opera/android/custom_views/StylingImageButton;Z)V

    :cond_23
    return-void
.end method

.method public final e0()V
    .registers 4

    iget-object v0, p0, Lh5l;->f:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lng;->a:Lng;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Lh5l;->h:Lu2l;

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    iget-object v1, p0, Lh5l;->i:Lu2l;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_51

    iget-object v1, p0, Lh5l;->i:Lu2l;

    iget-object v2, p0, Lh5l;->j:Lqz;

    if-eqz v1, :cond_27

    iget-object v1, v1, Lu2l;->a:Lb2l;

    check-cast v1, Ld7l;

    invoke-virtual {v1, v2}, Ld7l;->s0(La2l;)V

    :cond_27
    iput-object v0, p0, Lh5l;->i:Lu2l;

    if-eqz v0, :cond_51

    iget-object v0, v0, Lu2l;->a:Lb2l;

    check-cast v0, Ld7l;

    invoke-virtual {v0, v2}, Ld7l;->e0(La2l;)V

    invoke-virtual {p0}, Lh5l;->a0()V

    iget-object v0, p0, Lh5l;->i:Lu2l;

    if-eqz v0, :cond_48

    iget-object v0, v0, Lu2l;->a:Lb2l;

    iget-object v1, p0, Lh5l;->b:Ld5l;

    iget-object v1, v1, Ld5l;->g:Lcom/opera/android/ui/catalog/widget/OperaTextView;

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_48
    invoke-virtual {p0}, Lh5l;->b0()V

    invoke-virtual {p0}, Lh5l;->Z()V

    invoke-virtual {p0}, Lh5l;->c0()V

    :cond_51
    return-void
.end method

.method public final getGroupId()I
    .registers 1

    iget p0, p0, Lh5l;->g:I

    return p0
.end method

.method public final h(Landroidx/recyclerview/widget/i;)Z
    .registers 3

    iget-object v0, p0, Lh5l;->c:Lypd;

    invoke-virtual {v0, p0, p1}, Lypd;->I(Ljal;Landroidx/recyclerview/widget/i;)Z

    move-result p0

    return p0
.end method

.method public final k()Ljava/lang/Class;
    .registers 1

    iget-object p0, p0, Lh5l;->h:Lu2l;

    if-eqz p0, :cond_13

    iget-object p0, p0, Lu2l;->a:Lb2l;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->isActive()Z

    move-result p0

    if-nez p0, :cond_13

    const-class p0, Lh5l;

    return-object p0

    :cond_13
    const/4 p0, 0x0

    return-object p0
.end method

.method public final z(Lial;)Z
    .registers 2

    iget-object p0, p0, Lh5l;->i:Lu2l;

    if-eqz p0, :cond_1a

    iget-object p0, p0, Lu2l;->a:Lb2l;

    iget-object p1, p1, Lial;->a:Ljava/lang/Iterable;

    check-cast p0, Ld7l;

    iget-object p0, p0, Ld7l;->j:Le7l;

    invoke-interface {p0}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p0

    iget p0, p0, Lcom/opera/android/browser/TabInfo;->d:I

    invoke-static {p1, p0}, Lrm5;->k(Ljava/lang/Iterable;I)Z

    move-result p0

    if-eqz p0, :cond_1a

    const/4 p0, 0x1

    return p0

    :cond_1a
    const/4 p0, 0x0

    return p0
.end method
