.class public final Ltk4;
.super Landroid/view/ViewOutlineProvider;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Ltk4;->a:B

    iput-object p1, p0, Ltk4;->b:Ljava/lang/Object;

    invoke-direct {p0}, Landroid/view/ViewOutlineProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public final getOutline(Landroid/view/View;Landroid/graphics/Outline;)V
    .registers 16

    iget-byte v0, p0, Ltk4;->a:B

    iget-object p0, p0, Ltk4;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_86

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v5

    check-cast p0, Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const/high16 p1, 0x41000000    # 8.0f

    invoke-static {p0, p1}, Lz7h;->i(Landroid/content/Context;F)F

    move-result v6

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    return-void

    :pswitch_22
    move-object v7, p2

    check-cast p0, Lwbj;

    iget-object p1, p0, Ln1f;->b:Ljava/lang/Object;

    check-cast p1, Lsaj;

    if-eqz p1, :cond_4a

    iget-object p1, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_4a

    iget-object p1, p0, Ln1f;->c:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/RectF;

    iget p2, p1, Landroid/graphics/RectF;->left:F

    float-to-int v8, p2

    iget p2, p1, Landroid/graphics/RectF;->top:F

    float-to-int v9, p2

    iget p2, p1, Landroid/graphics/RectF;->right:F

    float-to-int v10, p2

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    float-to-int v11, p1

    iget v12, p0, Lwbj;->f:F

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    :cond_4a
    return-void

    :pswitch_4b
    move-object v7, p2

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v10

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    check-cast p0, Lm9f;

    iget p0, p0, Lm9f;->b:I

    add-int v11, p1, p0

    int-to-float v12, p0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    return-void

    :pswitch_61
    move-object v7, p2

    check-cast p0, Lcom/google/android/material/chip/Chip;

    iget-object p0, p0, Lcom/google/android/material/chip/Chip;->e:Ltx4;

    if-eqz p0, :cond_6c

    invoke-virtual {p0, v7}, Ltx4;->getOutline(Landroid/graphics/Outline;)V

    goto :goto_70

    :cond_6c
    const/4 p0, 0x0

    invoke-virtual {v7, p0}, Landroid/graphics/Outline;->setAlpha(F)V

    :goto_70
    return-void

    :pswitch_71
    move-object v7, p2

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v10

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result v11

    check-cast p0, Lcom/opera/android/custom_views/CardView;

    iget p0, p0, Lcom/opera/android/custom_views/CardView;->f:I

    int-to-float v12, p0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v7 .. v12}, Landroid/graphics/Outline;->setRoundRect(IIIIF)V

    return-void

    nop

    :pswitch_data_86
    .packed-switch 0x0
        :pswitch_71
        :pswitch_61
        :pswitch_4b
        :pswitch_22
    .end packed-switch
.end method
