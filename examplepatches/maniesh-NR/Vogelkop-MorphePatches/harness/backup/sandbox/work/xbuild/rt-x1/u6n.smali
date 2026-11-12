.class public final Lu6n;
.super Lz6n;
.source "SourceFile"


# instance fields
.field public final b:I

.field public final c:Lagm;

.field public final d:Ltjn;

.field public final e:Lc5b;

.field public f:Laln;

.field public g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;ZILagm;Ltjn;)V
    .registers 9

    new-instance v0, Lft9;

    new-instance v1, Lk6n;

    const/4 v2, 0x3

    invoke-direct {v1, p5, v2}, Lk6n;-><init>(Ltjn;B)V

    invoke-direct {v0, p1, v1, v1}, Ly46;-><init>(Landroid/content/Context;Lhcb;Lhcb;)V

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput p3, p0, Lu6n;->b:I

    iput-object p4, p0, Lu6n;->c:Lagm;

    iput-object p5, p0, Lu6n;->d:Ltjn;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iget-object p3, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p3, Landroid/view/ViewGroup;

    const p4, 0x7f0d047d

    const/4 v0, 0x0

    invoke-virtual {p1, p4, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p3, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p3, 0x7f0a0322

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p4

    check-cast p4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p4, :cond_ac

    const p3, 0x7f0a06c5

    invoke-static {p3, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_ac

    new-instance p3, Lc5b;

    check-cast p1, Landroid/widget/LinearLayout;

    invoke-direct {p3, p1, p4, v1}, Lc5b;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;)V

    iput-object p3, p0, Lu6n;->e:Lc5b;

    invoke-interface {p5}, Ltjn;->a()I

    move-result p1

    int-to-float p1, p1

    iget-object p3, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const p4, 0x7f070152

    invoke-virtual {p3, p4}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p3

    cmpl-float p1, p1, p3

    const/4 p3, 0x1

    if-ltz p1, :cond_64

    move v0, p3

    :cond_64
    const p1, 0x7f040998

    if-eqz p2, :cond_6b

    move p2, p1

    goto :goto_6e

    :cond_6b
    const p2, 0x7f040995

    :goto_6e
    iget-object p4, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p4

    invoke-static {p2, p4, p1}, Lf03;->E(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextAppearance(I)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0402ba

    const p4, 0x7f060ad0

    invoke-static {p2, p1, p4}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    if-eqz v0, :cond_91

    const/4 p3, 0x2

    :cond_91
    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setMaxLines(I)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lpkm;

    const/4 p3, 0x4

    invoke-direct {p2, p0, p3}, Lpkm;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance p2, Lsvk;

    const/16 p3, 0xf

    invoke-direct {p2, p0, p3}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void

    :cond_ac
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final U(Laln;)V
    .registers 8

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lu6n;->d:Ltjn;

    invoke-interface {v1}, Ltjn;->a()I

    move-result v1

    new-instance v2, Lo2c;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-direct {v2, v3, v1, v1, v4}, Lo2c;-><init>(ZIIZ)V

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-interface {p1, v1, v2}, Laln;->c(Landroid/content/Context;Lo2c;)Lxkn;

    move-result-object p1

    new-instance v3, Lvk2;

    const/16 v4, 0x19

    invoke-direct {v3, v4}, Lvk2;-><init>(B)V

    new-instance v4, Lqjn;

    iget-object v5, p0, Lu6n;->c:Lagm;

    invoke-direct {v4, v5, p1, v3, v2}, Lqjn;-><init>(Lagm;Lxkn;Lcom/opera/api/Callback;Lo2c;)V

    iget p1, p0, Lu6n;->b:I

    invoke-virtual {v4, p1, v1}, Lqjn;->a(ILandroid/content/Context;)Llkn;

    move-result-object v1

    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v2, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v1, v1, Llkn;->a:Lxkn;

    iget-boolean v1, v1, Lxkn;->g:Z

    if-eqz v1, :cond_42

    const v1, 0x7f060f8c

    goto :goto_45

    :cond_42
    const v1, 0x7f060f8d

    :goto_45
    invoke-virtual {v0, v1}, Landroid/content/Context;->getColor(I)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1, v0, p1}, Lxgh;->i(Landroid/graphics/drawable/ShapeDrawable;Landroid/content/res/ColorStateList;I)Landroid/graphics/drawable/RippleDrawable;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lu6n;->e:Lc5b;

    iget-object p1, p1, Lc5b;->c:Lcom/opera/android/custom_views/StylingImageView;

    iget-boolean p0, p0, Lu6n;->g:Z

    if-eqz p0, :cond_61

    const p0, 0x7f080518

    goto :goto_64

    :cond_61
    const p0, 0x7f0804f0

    :goto_64
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    return-void
.end method
