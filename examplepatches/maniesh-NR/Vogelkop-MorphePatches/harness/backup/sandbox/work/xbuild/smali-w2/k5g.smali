.class public final Lk5g;
.super Lm5g;
.source "SourceFile"

# interfaces
.implements Lh4g;


# instance fields
.field public final b:Lvs;

.field public final c:Lqfb;

.field public final d:Lw4g;

.field public final e:I

.field public f:Ljava/lang/Integer;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lqfb;Lw4g;)V
    .registers 10

    const v0, 0x7f0d0096

    const/4 v1, 0x0

    invoke-static {p1, v0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    move-object v1, p1

    check-cast v1, Lcom/opera/android/widget/SelectableRelativeLayout;

    const v0, 0x7f0a05b3

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_4a

    const v0, 0x7f0a05b8

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v3, :cond_4a

    const v0, 0x7f0a05bf

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_4a

    new-instance v0, Lvs;

    const/4 v5, 0x7

    invoke-direct/range {v0 .. v5}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lk5g;->b:Lvs;

    iput-object p2, p0, Lk5g;->c:Lqfb;

    iput-object p3, p0, Lk5g;->d:Lw4g;

    sget p1, Lvmj;->g:I

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Ltmj;->i(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lk5g;->e:I

    return-void

    :cond_4a
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final P(ILjava/lang/String;)Z
    .registers 4

    iget-object v0, p0, Lk5g;->f:Ljava/lang/Integer;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-ne p1, v0, :cond_14

    iget-object p0, p0, Lk5g;->g:Ljava/lang/String;

    invoke-static {p2, p0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final s()V
    .registers 9

    iget-object v0, p0, Lk5g;->b:Lvs;

    iget-object v1, v0, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    sget v2, Lvmj;->g:I

    iget-object v0, v0, Lvs;->b:Landroid/view/ViewGroup;

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v0, p0, Lk5g;->h:Ljava/lang/String;

    if-nez v0, :cond_16

    iget-object v0, p0, Lk5g;->g:Ljava/lang/String;

    :cond_16
    if-nez v0, :cond_1a

    const-string v0, ""

    :cond_1a
    move-object v3, v0

    const/4 v6, 0x0

    const/16 v7, 0x3c

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v2 .. v7}, Ltmj;->m(Landroid/content/Context;Ljava/lang/String;IILna5;I)Lvmj;

    move-result-object p0

    invoke-virtual {v1, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final w(Landroid/graphics/Bitmap;)V
    .registers 6

    iget v0, p0, Lk5g;->e:I

    div-int/lit8 v1, v0, 0x2

    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Ls8i;->d:Landroid/view/animation/PathInterpolator;

    new-instance v3, Lp8i;

    invoke-direct {v3, v0, v1, v2, p1}, Lp8i;-><init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lf03;->s(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v3, p1}, Lp8i;->a(I)V

    iget-object p0, p0, Lk5g;->b:Lvs;

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v3}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
