.class public final Lxt5;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lor2;

.field public final c:F


# direct methods
.method public constructor <init>(Lor2;Lwg5;Lcv2;)V
    .registers 6

    iget-object v0, p1, Lor2;->c:Landroid/view/View;

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lxt5;->b:Lor2;

    iget-object p1, p1, Lor2;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f07013b

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lxt5;->c:F

    new-instance p1, Lnf;

    const/16 v1, 0x1c

    invoke-direct {p1, p0, p2, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lys2;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p3, p2}, Lys2;-><init>(Landroidx/recyclerview/widget/i;Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method


# virtual methods
.method public final U(Landroid/graphics/Bitmap;)V
    .registers 8

    iget-object v0, p0, Lxt5;->b:Lor2;

    iget-object v1, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v2, Ljq4;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v3

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v4, 0x7f04002f

    const v5, 0x7f061084

    invoke-static {v4, v0, v5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget p0, p0, Lxt5;->c:F

    invoke-direct {v2, p0, v3, v0, p1}, Ljq4;-><init>(FIILandroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method
