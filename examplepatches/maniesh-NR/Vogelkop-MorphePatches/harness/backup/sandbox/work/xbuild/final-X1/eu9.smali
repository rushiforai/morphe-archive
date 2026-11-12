.class public final Leu9;
.super Lxv8;
.source "SourceFile"


# static fields
.field public static final synthetic E:I


# instance fields
.field public final D:Lcom/opera/android/custom_views/StylingImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;Lkze;)V
    .registers 4

    new-instance v0, Lfu9;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0, p1, v0, p2}, Lxv8;-><init>(Landroid/view/View;Lwv8;Lize;)V

    new-instance p2, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    iput-object p2, p0, Leu9;->D:Lcom/opera/android/custom_views/StylingImageView;

    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-virtual {p0, p2}, Lxv8;->h0(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 3

    invoke-super {p0, p1, p2}, Lxv8;->V(Lja2;Z)V

    if-nez p2, :cond_1c

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p1

    iget-object p1, p1, Lmq;->d:Lyz;

    check-cast p1, Lgu9;

    iget-object p1, p1, Lyz;->d:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_1c

    iget-object p2, p0, Leu9;->D:Lcom/opera/android/custom_views/StylingImageView;

    iget-object p0, p0, Lxv8;->k:Lga6;

    invoke-static {p1, p2, p0}, Lgu8;->g0(Ljava/lang/String;Landroid/widget/ImageView;Lga6;)V

    :cond_1c
    return-void
.end method

.method public final f0()Lyz;
    .registers 1

    invoke-virtual {p0}, Lo43;->Z()Lmq;

    move-result-object p0

    iget-object p0, p0, Lmq;->d:Lyz;

    check-cast p0, Lgu9;

    return-object p0
.end method
