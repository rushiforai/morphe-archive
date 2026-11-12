.class public final Lj00;
.super Lf00;
.source "SourceFile"


# instance fields
.field public final F:Lcom/opera/android/custom_views/StylingImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;ZLkze;)V
    .registers 6

    invoke-direct {p0, p1, p3}, Lf00;-><init>(Landroid/view/View;Lkze;)V

    new-instance p3, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p3, v0, v1}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p3, p0, Lj00;->F:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, p3}, Lxv8;->h0(Landroid/view/View;)V

    if-eqz p2, :cond_33

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iget-object p0, p0, Lxv8;->j:Landroid/widget/FrameLayout;

    const p2, 0x7f070212

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    const p3, 0x7f070211

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p3

    iput p2, p3, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput p1, p3, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-virtual {p0, p3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_33
    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 4

    invoke-super {p0, p1, p2}, Lxv8;->V(Lja2;Z)V

    if-nez p2, :cond_20

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p1

    iget-object p1, p1, Lw10;->u:Lcie;

    iget-object p1, p1, Lcie;->o:Ljava/lang/String;

    iget-object p2, p0, Lxv8;->j:Landroid/widget/FrameLayout;

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p2, v0}, Lgu8;->i0(Landroid/view/View;Landroid/view/View;)Lga6;

    move-result-object p2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_20

    iget-object p0, p0, Lj00;->F:Lcom/opera/android/custom_views/StylingImageView;

    invoke-static {p1, p0, p2}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    :cond_20
    return-void
.end method
