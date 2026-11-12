.class public final Lk00;
.super Lf00;
.source "SourceFile"


# instance fields
.field public final F:Lcom/opera/android/widget/RoundedImageView;

.field public final G:Lcom/opera/android/widget/RoundedImageView;

.field public final H:Lcom/opera/android/widget/RoundedImageView;

.field public final I:I

.field public J:Z


# direct methods
.method public constructor <init>(Landroid/view/View;ZLkze;)V
    .registers 11

    invoke-direct {p0, p1, p3}, Lf00;-><init>(Landroid/view/View;Lkze;)V

    const/4 p3, 0x1

    iput-boolean p3, p0, Lk00;->J:Z

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f0d015c

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    sget-object v2, Lr5n;->a:Ljava/util/WeakHashMap;

    const v2, 0x7f0a0476

    invoke-static {v1, v2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    check-cast v2, Lcom/opera/android/widget/RoundedImageView;

    iput-object v2, p0, Lk00;->F:Lcom/opera/android/widget/RoundedImageView;

    const v3, 0x7f0a0477

    invoke-static {v1, v3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    check-cast v3, Lcom/opera/android/widget/RoundedImageView;

    iput-object v3, p0, Lk00;->G:Lcom/opera/android/widget/RoundedImageView;

    const v4, 0x7f0a0478

    invoke-static {v1, v4}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    check-cast v4, Lcom/opera/android/widget/RoundedImageView;

    iput-object v4, p0, Lk00;->H:Lcom/opera/android/widget/RoundedImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v5, 0x7f0408de

    const/4 v6, 0x0

    invoke-static {v5, p1, v6}, Lf03;->w(ILandroid/content/Context;I)I

    move-result p1

    iput p1, p0, Lk00;->I:I

    if-nez p2, :cond_85

    const/high16 p1, 0x431e0000    # 158.0f

    invoke-static {p1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    const/high16 p2, 0x42ec0000    # 118.0f

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {p3, p2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p2

    float-to-int p2, p2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    iput p1, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v2, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    iput p1, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v3, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    iput p1, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p2, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {v4, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_85
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 p2, -0x1

    invoke-direct {p1, p2, p2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/4 p2, -0x2

    iput p2, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    invoke-virtual {v1, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, v1}, Lxv8;->h0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final J(Lwa2;)V
    .registers 5

    invoke-super {p0, p1}, Lbu8;->J(Lwa2;)V

    iget p1, p0, Lbu8;->g:I

    const/4 v0, 0x0

    if-nez p1, :cond_a

    const/4 p1, 0x1

    goto :goto_b

    :cond_a
    move p1, v0

    :goto_b
    iget-boolean v1, p0, Lk00;->J:Z

    if-ne v1, p1, :cond_10

    return-void

    :cond_10
    iput-boolean p1, p0, Lk00;->J:Z

    iget v1, p0, Lk00;->I:I

    if-eqz p1, :cond_18

    move p1, v0

    goto :goto_19

    :cond_18
    move p1, v1

    :goto_19
    iget-object v2, p0, Lk00;->F:Lcom/opera/android/widget/RoundedImageView;

    invoke-virtual {v2, p1, v1}, Lcom/opera/android/widget/RoundedImageView;->f(II)V

    iget-boolean p1, p0, Lk00;->J:Z

    if-nez p1, :cond_23

    move v0, v1

    :cond_23
    iget-object p0, p0, Lk00;->H:Lcom/opera/android/widget/RoundedImageView;

    invoke-virtual {p0, v1, v0}, Lcom/opera/android/widget/RoundedImageView;->f(II)V

    return-void
.end method

.method public final V(Lja2;Z)V
    .registers 5

    invoke-super {p0, p1, p2}, Lxv8;->V(Lja2;Z)V

    if-nez p2, :cond_44

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object p2, p0, Lk00;->F:Lcom/opera/android/widget/RoundedImageView;

    invoke-static {p2, p1}, Lgu8;->i0(Landroid/view/View;Landroid/view/View;)Lga6;

    move-result-object p1

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v0

    iget-object v0, v0, Lw10;->u:Lcie;

    iget-object v0, v0, Lcie;->w:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1e

    invoke-static {v0, p2, p1}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    :cond_1e
    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p2

    iget-object p2, p2, Lw10;->u:Lcie;

    iget-object p2, p2, Lcie;->x:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_31

    iget-object v0, p0, Lk00;->G:Lcom/opera/android/widget/RoundedImageView;

    invoke-static {p2, v0, p1}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    :cond_31
    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p2

    iget-object p2, p2, Lw10;->u:Lcie;

    iget-object p2, p2, Lcie;->y:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_44

    iget-object p0, p0, Lk00;->H:Lcom/opera/android/widget/RoundedImageView;

    invoke-static {p2, p0, p1}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    :cond_44
    return-void
.end method
