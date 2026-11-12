.class public final Lpxk;
.super Lq73;
.source "SourceFile"


# instance fields
.field public final c:Lbyk;

.field public final d:Lu7k;


# direct methods
.method public constructor <init>(Lmej;Lbyk;Lu7k;)V
    .registers 4

    invoke-direct {p0, p1}, Ldej;-><init>(Lmej;)V

    iput-object p2, p0, Lpxk;->c:Lbyk;

    iput-object p3, p0, Lpxk;->d:Lu7k;

    return-void
.end method


# virtual methods
.method public final d(Landroid/widget/FrameLayout;)Landroid/view/View;
    .registers 7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d03a0

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p1, 0x7f0a0b14

    invoke-static {p1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/CircleImageView;

    if-eqz v1, :cond_52

    const p1, 0x7f0a0b15

    invoke-static {p1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_52

    const p1, 0x7f0a0b16

    invoke-static {p1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_52

    check-cast v0, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object p0, p0, Lpxk;->c:Lbyk;

    iget-object p1, p0, Lbyk;->b:Ljava/lang/String;

    iget-object v4, p0, Lbyk;->a:Ljava/lang/String;

    if-eqz p1, :cond_4c

    if-eqz v4, :cond_4c

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lbyk;->c:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p0}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    return-object v0

    :cond_4c
    const/16 p0, 0x8

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    return-object v0

    :cond_52
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final e(Lqb7;)V
    .registers 5

    new-instance v0, Loxk;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Loxk;-><init>(Lpxk;B)V

    const v1, 0x7f0803fe

    const v2, 0x7f1411f0

    invoke-virtual {p1, v1, v2, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    new-instance v0, Loxk;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Loxk;-><init>(Lpxk;B)V

    const v1, 0x7f0805c4

    const v2, 0x7f1411fd

    invoke-virtual {p1, v1, v2, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    new-instance v0, Loxk;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Loxk;-><init>(Lpxk;B)V

    const p0, 0x7f080540

    const v1, 0x7f1411ed

    invoke-virtual {p1, p0, v1, v0}, Lqb7;->k(IILandroid/view/View$OnClickListener;)V

    return-void
.end method
