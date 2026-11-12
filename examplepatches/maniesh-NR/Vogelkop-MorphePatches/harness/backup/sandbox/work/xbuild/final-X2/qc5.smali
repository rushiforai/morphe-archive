.class public final Lqc5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final a:Ljl4;

.field public final b:Lcom/opera/android/suggestion/CompactSuggestionChip;

.field public final c:Ljxb;

.field public d:Lcom/opera/android/suggestion/Suggestion;

.field public e:I

.field public final synthetic f:Lcom/opera/android/suggestion/CompactSuggestionView;


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/CompactSuggestionView;Lcom/opera/android/suggestion/CompactSuggestionView;Ljl4;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqc5;->f:Lcom/opera/android/suggestion/CompactSuggestionView;

    new-instance p1, Ljxb;

    invoke-direct {p1, p0}, Ljxb;-><init>(Lqc5;)V

    iput-object p1, p0, Lqc5;->c:Ljxb;

    iput-object p3, p0, Lqc5;->a:Ljl4;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0d00ce

    const/4 p3, 0x0

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_46

    check-cast p1, Lcom/opera/android/suggestion/CompactSuggestionChip;

    iput-object p1, p0, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    new-instance p2, Llb4;

    const/16 p3, 0x14

    invoke-direct {p2, p0, p3}, Llb4;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Lcom/opera/android/suggestion/CompactSuggestionChip;->A:Llb4;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    new-instance p2, Lpc5;

    invoke-direct {p2, p0, v0}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_42

    return-void

    :cond_42
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_46
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw p3
.end method


# virtual methods
.method public final a()V
    .registers 9

    iget-object v0, p0, Lqc5;->d:Lcom/opera/android/suggestion/Suggestion;

    const/4 v1, 0x0

    if-eqz v0, :cond_65

    iget-object v2, p0, Lqc5;->a:Ljl4;

    if-eqz v2, :cond_65

    iget-object v2, v2, Ljl4;->b:Ljava/lang/Object;

    check-cast v2, Lrc5;

    new-instance v3, Letc;

    invoke-direct {v3}, Letc;-><init>()V

    iget-object v4, v2, Lrc5;->c:Ljava/lang/Object;

    check-cast v4, Lkf;

    iget-object v4, v4, Lkf;->b:Landroid/view/View;

    check-cast v4, Lcom/opera/android/suggestion/CompactSuggestionView;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    sget-object v6, Lrc5;->d:Lixh;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v6, v4}, Ly7h;->k(Landroid/content/Context;)I

    move-result v4

    invoke-virtual {v3, v1, v4, v4}, Landroid/graphics/drawable/LayerDrawable;->setLayerSize(III)V

    invoke-static {v5}, Lf03;->G(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object v6

    invoke-virtual {v6}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v6

    invoke-static {v4, v6}, Lj14;->D(II)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v6

    invoke-static {v6, v5, v4}, Lrc5;->Z(Landroid/graphics/drawable/Drawable;Landroid/content/Context;I)Landroid/graphics/drawable/LayerDrawable;

    move-result-object v6

    iget-boolean v7, v3, Letc;->b:Z

    if-nez v7, :cond_45

    invoke-virtual {v3, v1, v6}, Landroid/graphics/drawable/LayerDrawable;->setDrawable(ILandroid/graphics/drawable/Drawable;)V

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_45
    sget-object v6, Lyne;->b:Ldeg;

    iget-object v0, v0, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    invoke-virtual {v6, v0}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object v0

    new-instance v6, Leh7;

    invoke-direct {v6, v4}, Leh7;-><init>(I)V

    iget-object v7, v0, Ldwh;->b:Lgvh;

    invoke-virtual {v7, v6}, Lgvh;->c(Le2m;)V

    new-instance v6, Lphi;

    new-instance v7, Llt2;

    invoke-direct {v7, v3, v2, v5, v4}, Llt2;-><init>(Letc;Lrc5;Landroid/content/Context;I)V

    invoke-direct {v6, v7}, Lphi;-><init>(Lcom/opera/api/Callback;)V

    invoke-virtual {v0, v6}, Ldwh;->f(Lacl;)V

    goto :goto_66

    :cond_65
    const/4 v3, 0x0

    :goto_66
    if-eqz v3, :cond_69

    const/4 v1, 0x1

    :cond_69
    iget-object p0, p0, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    iget-object v0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz v0, :cond_72

    invoke-virtual {v0, v1}, Ltx4;->Q(Z)V

    :cond_72
    iget-object p0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz p0, :cond_79

    invoke-virtual {p0, v3}, Ltx4;->P(Landroid/graphics/drawable/Drawable;)V

    :cond_79
    return-void
.end method

.method public final b(I)V
    .registers 5

    iget v0, p0, Lqc5;->e:I

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    const/high16 v0, -0x80000000

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    sget v1, Lcom/opera/android/suggestion/CompactSuggestionView;->n:I

    const/4 v1, 0x0

    iget-object v2, p0, Lqc5;->b:Lcom/opera/android/suggestion/CompactSuggestionChip;

    invoke-virtual {v2, v0, v1}, Landroid/view/View;->measure(II)V

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    iget-object v1, p0, Lqc5;->f:Lcom/opera/android/suggestion/CompactSuggestionView;

    iget-object v2, v1, Lcom/opera/android/suggestion/CompactSuggestionView;->j:Landroid/graphics/Point;

    iget v2, v2, Landroid/graphics/Point;->x:I

    add-int/2addr v0, v2

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    int-to-float v0, v0

    sget-object v2, Lfan;->a:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v0, v1

    float-to-int v0, v0

    add-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lqc5;->c:Ljxb;

    iput v0, v1, Ljxb;->a:I

    iput p1, p0, Lqc5;->e:I

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 6

    iget-object p1, p0, Lqc5;->f:Lcom/opera/android/suggestion/CompactSuggestionView;

    iget-object v0, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->c:Lhqk;

    if-eqz v0, :cond_2d

    iget-object v1, p0, Lqc5;->d:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v1, :cond_2d

    iget-boolean v2, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->i:Z

    if-eqz v2, :cond_20

    invoke-virtual {v1}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->b:Ld5o;

    iget-object v3, v3, Ld5o;->b:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_20

    const/4 v2, 0x1

    goto :goto_21

    :cond_20
    const/4 v2, 0x0

    :goto_21
    invoke-virtual {v0, v1, v2}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    iget-object p1, p1, Lcom/opera/android/suggestion/CompactSuggestionView;->d:Lnv6;

    if-eqz p1, :cond_2d

    iget-object p0, p0, Lqc5;->d:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p1, p0}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    :cond_2d
    return-void
.end method
