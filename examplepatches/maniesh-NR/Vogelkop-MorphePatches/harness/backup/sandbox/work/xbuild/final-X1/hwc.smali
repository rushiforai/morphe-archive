.class public final Lhwc;
.super Lab2;
.source "SourceFile"


# instance fields
.field public final d:Lowc;

.field public e:Ljava/lang/String;

.field public final synthetic f:B


# direct methods
.method public constructor <init>(Landroid/view/View;B)V
    .registers 13

    iput-byte p2, p0, Lhwc;->f:B

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    const p2, 0x7f0a0394

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v3, :cond_70

    const p2, 0x7f0a0395

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_70

    const p2, 0x7f0a04b5

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v5, :cond_70

    const p2, 0x7f0a0586

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/LinearLayout;

    if-eqz v6, :cond_70

    const p2, 0x7f0a086e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v7, :cond_70

    const p2, 0x7f0a0958

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_70

    const p2, 0x7f0a0c88

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    if-eqz v9, :cond_70

    new-instance v1, Lowc;

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-direct/range {v1 .. v9}, Lowc;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Landroid/view/View;)V

    iput-object v1, p0, Lhwc;->d:Lowc;

    new-instance p1, Llzb;

    const/4 p2, 0x7

    invoke-direct {p1, p0, p2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v5}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-eqz p0, :cond_6f

    invoke-static {p0, v5, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_6f
    return-void

    :cond_70
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 9

    iget-byte p2, p0, Lhwc;->f:B

    const/4 v0, 0x0

    iget-object v1, p0, Lhwc;->d:Lowc;

    const/4 v2, 0x0

    packed-switch p2, :pswitch_data_116

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p2

    check-cast p2, Lewc;

    iput-object p0, p2, Lewc;->c:Lhwc;

    move-object p2, p1

    check-cast p2, Lkwc;

    iget-object v3, p2, Lewc;->b:Late;

    iget-object v3, v3, Late;->a:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lhwc;->c0(Ljava/lang/String;)V

    iget-object p0, v1, Lowc;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object p2, p2, Lewc;->b:Late;

    iget-object v4, p2, Late;->b:Ljava/lang/String;

    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const-string p0, "zz"

    invoke-virtual {v3, p0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    iget-object v3, v1, Lowc;->h:Lcom/opera/android/custom_views/StylingTextView;

    if-nez p0, :cond_30

    const/16 v0, 0x8

    :cond_30
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    if-eqz p0, :cond_38

    iget-object p0, p2, Late;->c:Ljava/lang/String;

    goto :goto_39

    :cond_38
    move-object p0, v2

    :goto_39
    invoke-virtual {v3, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v1, Lowc;->b:Landroid/widget/LinearLayout;

    new-instance p2, Lgwc;

    const/4 v0, 0x4

    invoke-direct {p2, p1, v0}, Lgwc;-><init>(Lja2;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v1, Lowc;->d:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, v1, Lowc;->g:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_52
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p2

    check-cast p2, Lewc;

    iput-object p0, p2, Lewc;->c:Lhwc;

    move-object p2, p1

    check-cast p2, Ljwc;

    iget-object v3, p2, Ljwc;->d:Late;

    iget-object v3, v3, Late;->a:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lhwc;->c0(Ljava/lang/String;)V

    iget-object p0, v1, Lowc;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v3, p2, Ljwc;->d:Late;

    iget-object v3, v3, Late;->b:Ljava/lang/String;

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v1, Lowc;->h:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget p2, p2, Ljwc;->e:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v5, 0x7f12004d

    invoke-virtual {v3, v5, p2, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v1, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v1, Lowc;->b:Landroid/widget/LinearLayout;

    new-instance p2, Lgwc;

    const/4 v0, 0x3

    invoke-direct {p2, p1, v0}, Lgwc;-><init>(Lja2;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v1, Lowc;->d:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, v1, Lowc;->g:Landroid/widget/FrameLayout;

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_a2
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p2

    check-cast p2, Lewc;

    iput-object p0, p2, Lewc;->c:Lhwc;

    move-object p2, p1

    check-cast p2, Liwc;

    iget-object v0, p2, Lewc;->b:Late;

    iget-object v0, v0, Late;->a:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lhwc;->c0(Ljava/lang/String;)V

    invoke-virtual {p0, p2}, Lhwc;->e0(Liwc;)V

    iget-object v0, v1, Lowc;->b:Landroid/widget/LinearLayout;

    new-instance v3, Lgwc;

    const/4 v4, 0x2

    invoke-direct {v3, p1, v4}, Lgwc;-><init>(Lja2;B)V

    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, v1, Lowc;->d:Landroid/widget/LinearLayout;

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, v1, Lowc;->g:Landroid/widget/FrameLayout;

    invoke-virtual {p1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iput-object p0, p2, Lewc;->c:Lhwc;

    return-void

    :pswitch_cf
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p2

    check-cast p2, Lewc;

    iput-object p0, p2, Lewc;->c:Lhwc;

    move-object p2, p1

    check-cast p2, Lfwc;

    iget-object v3, p2, Lfwc;->d:Late;

    iget-object v3, v3, Late;->a:Ljava/lang/String;

    invoke-virtual {p0, v3}, Lhwc;->c0(Ljava/lang/String;)V

    iget-object p0, v1, Lowc;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object p2, p2, Lfwc;->d:Late;

    iget-object v3, p2, Late;->b:Ljava/lang/String;

    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v1, Lowc;->h:Lcom/opera/android/custom_views/StylingTextView;

    iget-object p2, p2, Late;->c:Ljava/lang/String;

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, v1, Lowc;->d:Landroid/widget/LinearLayout;

    new-instance p2, Lgwc;

    invoke-direct {p2, p1, v0}, Lgwc;-><init>(Lja2;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v1, Lowc;->i:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v1, Lowc;->c:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v1, Lowc;->g:Landroid/widget/FrameLayout;

    new-instance p2, Lgwc;

    const/4 v0, 0x1

    invoke-direct {p2, p1, v0}, Lgwc;-><init>(Lja2;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v1, Lowc;->b:Landroid/widget/LinearLayout;

    invoke-virtual {p0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_data_116
    .packed-switch 0x0
        :pswitch_cf
        :pswitch_a2
        :pswitch_52
    .end packed-switch
.end method

.method public final Y()V
    .registers 2

    iget-byte v0, p0, Lhwc;->f:B

    packed-switch v0, :pswitch_data_1a

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lewc;

    const/4 v0, 0x0

    iput-object v0, p0, Lewc;->c:Lhwc;

    return-void

    :pswitch_f
    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Liwc;

    const/4 v0, 0x0

    iput-object v0, p0, Lewc;->c:Lhwc;

    return-void

    nop

    :pswitch_data_1a
    .packed-switch 0x1
        :pswitch_f
    .end packed-switch
.end method

.method public final b0()V
    .registers 1

    return-void
.end method

.method public final c0(Ljava/lang/String;)V
    .registers 5

    iput-object p1, p0, Lhwc;->e:Ljava/lang/String;

    iget-object p0, p0, Lhwc;->d:Lowc;

    iget-object p0, p0, Lowc;->f:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0803c5

    invoke-static {v1, p1}, Lvtp;->K(ILjava/lang/String;)I

    move-result p1

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2, p1}, Lddh;->o(ZLandroid/content/Context;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public final e0(Liwc;)V
    .registers 5

    iget-object p0, p0, Lhwc;->d:Lowc;

    iget-object v0, p0, Lowc;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p1, Lewc;->b:Late;

    iget-object v2, v1, Late;->b:Ljava/lang/String;

    iget-object v1, v1, Late;->d:Landroid/util/Range;

    invoke-static {v2, v1}, Lx7d;->K(Ljava/lang/String;Landroid/util/Range;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lowc;->h:Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, p1, Lewc;->b:Late;

    iget-object v0, p1, Late;->c:Ljava/lang/String;

    iget-object p1, p1, Late;->e:Landroid/util/Range;

    invoke-static {v0, p1}, Lx7d;->K(Ljava/lang/String;Landroid/util/Range;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
