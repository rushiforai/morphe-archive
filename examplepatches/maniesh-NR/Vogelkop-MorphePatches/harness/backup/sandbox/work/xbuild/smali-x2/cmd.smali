.class public final Lcmd;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lxbf;

.field public final c:Lor2;

.field public final d:Lc5o;

.field public e:Lqjd;

.field public f:J

.field public g:Lkg7;

.field public final h:Lig2;


# direct methods
.method public constructor <init>(Lxbf;Landroid/view/View;Lyzb;Lz0c;)V
    .registers 13

    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    new-instance v0, Lc5o;

    const/16 v1, 0x1d

    invoke-direct {v0, v1}, Lc5o;-><init>(B)V

    iput-object v0, p0, Lcmd;->d:Lc5o;

    iput-object p1, p0, Lcmd;->b:Lxbf;

    const p1, 0x7f0a0341

    invoke-static {p1, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v3, :cond_a3

    const p1, 0x7f0a0357

    invoke-static {p1, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_a3

    const p1, 0x7f0a0586

    invoke-static {p1, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout;

    if-eqz v0, :cond_a3

    const p1, 0x7f0a05b8

    invoke-static {p1, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v5, :cond_a3

    const p1, 0x7f0a0970

    invoke-static {p1, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/widget/SelectableRelativeLayout;

    if-eqz v6, :cond_a3

    const p1, 0x7f0a06c5

    invoke-static {p1, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_a3

    new-instance v1, Lor2;

    move-object v2, p2

    check-cast v2, Landroid/widget/FrameLayout;

    invoke-direct/range {v1 .. v7}, Lor2;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageView;Lcom/opera/android/widget/SelectableRelativeLayout;Lcom/opera/android/custom_views/StylingTextView;)V

    iput-object v1, p0, Lcmd;->c:Lor2;

    const/4 p1, 0x1

    invoke-virtual {v6, p1}, Lcom/opera/android/widget/SelectableRelativeLayout;->d(Z)V

    new-instance p1, Ljf7;

    const/16 v0, 0x13

    invoke-direct {p1, p0, p3, v0}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v6, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lbmd;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p4, p3}, Lbmd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance p1, Lig2;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    const/high16 p4, 0x41c00000    # 24.0f

    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p4, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p4

    invoke-direct {p1, p3, p4}, Lig2;-><init>(Landroid/content/Context;I)V

    iput-object p1, p0, Lcmd;->h:Lig2;

    new-instance p1, Llzb;

    const/16 p3, 0xc

    invoke-direct {p1, p0, p3}, Llzb;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lq9n;->c:Ll5b;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p0

    if-nez p0, :cond_9f

    return-void

    :cond_9f
    invoke-static {p0, p2, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_a3
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final U()V
    .registers 8

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcmd;->c:Lor2;

    iget-object v2, v1, Lor2;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v3, Lw3a;

    iget-object v4, p0, Lcmd;->g:Lkg7;

    const/4 v5, 0x1

    invoke-virtual {v4, v5, v0}, Lkg7;->g(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    const/16 v5, 0x11

    const/4 v6, 0x0

    invoke-direct {v3, v4, v5, v6}, Lw3a;-><init>(Landroid/graphics/drawable/Drawable;IZ)V

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/SelectableRelativeLayout;

    iget-object v2, p0, Lcmd;->g:Lkg7;

    iget v2, v2, Lkg7;->d:I

    const v3, 0x7f06063b

    invoke-static {v2, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    const v4, 0x3df5c28f    # 0.12f

    invoke-static {v4, v2}, Lp37;->a0(FI)I

    move-result v2

    iput v2, v1, Lcom/opera/android/widget/SelectableRelativeLayout;->g:I

    iget-object v1, p0, Lcmd;->g:Lkg7;

    iget v1, v1, Lkg7;->b:I

    invoke-static {v1, v0, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object p0, p0, Lcmd;->h:Lig2;

    iget v1, p0, Lig2;->K:I

    if-ne v1, v0, :cond_45

    return-void

    :cond_45
    iput v0, p0, Lig2;->K:I

    invoke-virtual {p0}, Lf3d;->invalidateSelf()V

    return-void
.end method

.method public final V()V
    .registers 7

    iget-object v0, p0, Lcmd;->b:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    iget-object v1, p0, Lcmd;->e:Lqjd;

    invoke-interface {v0}, Lgig;->g()Lqjd;

    move-result-object v2

    invoke-virtual {v1, v2}, Lqjd;->equals(Ljava/lang/Object;)Z

    move-result v1

    iget-object v2, p0, Lcmd;->h:Lig2;

    if-nez v1, :cond_1e

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lf3d;->p(I)V

    :cond_1e
    invoke-interface {v0}, Lgig;->e0()Z

    move-result v0

    iget-boolean v3, v2, Lig2;->J:Z

    if-eq v3, v0, :cond_34

    iput-boolean v0, v2, Lig2;->J:Z

    if-eqz v0, :cond_2e

    invoke-virtual {v2}, Lf3d;->k()V

    goto :goto_31

    :cond_2e
    invoke-virtual {v2}, Lf3d;->j()V

    :goto_31
    invoke-virtual {v2}, Lf3d;->invalidateSelf()V

    :cond_34
    iget-object v0, p0, Lcmd;->c:Lor2;

    iget-object v3, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-nez v1, :cond_49

    iget-object v2, p0, Lcmd;->g:Lkg7;

    iget-object v4, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v2, v5, v4}, Lkg7;->h(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    :cond_49
    invoke-virtual {v3, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    invoke-virtual {p0}, Lcmd;->X()V

    return-void
.end method

.method public final X()V
    .registers 10

    iget-object v0, p0, Lcmd;->c:Lor2;

    iget-object v1, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    move-result v1

    iget-object v2, p0, Lcmd;->d:Lc5o;

    if-eqz v1, :cond_4a

    iget-object v1, p0, Lcmd;->b:Lxbf;

    iget-object v1, v1, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgig;

    invoke-interface {v1}, Lgig;->getCurrentPosition()J

    move-result-wide v3

    iget-wide v5, p0, Lcmd;->f:J

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v1, v5, v7

    if-nez v1, :cond_2e

    invoke-virtual {v2, v3, v4}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object p0

    goto :goto_50

    :cond_2e
    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v2, v3, v4}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object v3

    iget-wide v4, p0, Lcmd;->f:J

    invoke-virtual {v2, v4, v5}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object p0

    filled-new-array {v3, p0}, [Ljava/lang/Object;

    move-result-object p0

    const v2, 0x7f140a25

    invoke-virtual {v1, v2, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    goto :goto_50

    :cond_4a
    iget-wide v3, p0, Lcmd;->f:J

    invoke-virtual {v2, v3, v4}, Lc5o;->t(J)Ljava/lang/String;

    move-result-object p0

    :goto_50
    iget-object v0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
