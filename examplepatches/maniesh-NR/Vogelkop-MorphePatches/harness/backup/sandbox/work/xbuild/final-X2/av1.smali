.class public final Lav1;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lcq3;

.field public c:Lf7j;

.field public final synthetic d:Lbv1;


# direct methods
.method public constructor <init>(Lbv1;Lcq3;)V
    .registers 4

    iput-object p1, p0, Lav1;->d:Lbv1;

    iget-object p1, p2, Lcq3;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/ThemeSelector;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lav1;->b:Lcq3;

    new-instance p2, Lu7;

    const/16 v0, 0xb

    invoke-direct {p2, p0, v0}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_19

    return-void

    :cond_19
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final U(Lf7j;Lcom/opera/android/custom_views/ThemeSelector;)V
    .registers 5

    sget-object v0, Lf7j;->d:Lf7j;

    const v1, 0x7f06063b

    if-eq p1, v0, :cond_20

    sget-object v0, Lf7j;->e:Lf7j;

    if-ne p1, v0, :cond_11

    iget-object p0, p0, Lav1;->d:Lbv1;

    iget-boolean p0, p0, Lbv1;->b:Z

    if-nez p0, :cond_20

    :cond_11
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f0402c7

    invoke-static {p1, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    const p1, 0x7f0809f0

    goto :goto_2e

    :cond_20
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const p1, 0x7f0402c5

    invoke-static {p1, p0, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    const p1, 0x7f0809ef

    :goto_2e
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p2, Lcom/opera/android/custom_views/ThemeSelector;->c:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method
