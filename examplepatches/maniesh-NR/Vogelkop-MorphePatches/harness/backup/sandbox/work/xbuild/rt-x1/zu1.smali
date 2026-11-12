.class public final Lzu1;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lcq3;

.field public c:Lg7j;

.field public final synthetic d:Ldt1;


# direct methods
.method public constructor <init>(Ldt1;Lcq3;)V
    .registers 4

    iput-object p1, p0, Lzu1;->d:Ldt1;

    iget-object p1, p2, Lcq3;->b:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/AccentSelector;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p2, p0, Lzu1;->b:Lcq3;

    new-instance p2, Lu7;

    const/16 v0, 0xa

    invoke-direct {p2, p0, v0}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_19

    return-void

    :cond_19
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method

.method public static U(Lg7j;Lcom/opera/android/custom_views/AccentSelector;)V
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lg7j;->a:I

    const v2, 0x7f06063b

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object v1, p1, Lcom/opera/android/custom_views/AccentSelector;->c:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lg7j;->b:I

    invoke-static {v1, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    iget-object v1, p1, Lcom/opera/android/custom_views/AccentSelector;->d:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v1, p1, Lcom/opera/android/custom_views/AccentSelector;->f:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget p0, p0, Lg7j;->c:I

    invoke-static {p0, v0, v2}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    iget-object v0, p1, Lcom/opera/android/custom_views/AccentSelector;->e:Landroid/graphics/Paint;

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    return-void
.end method
