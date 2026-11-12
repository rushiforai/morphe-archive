.class public final Lzu4;
.super Lol7;
.source "SourceFile"


# instance fields
.field public final synthetic b:B

.field public c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Landroid/graphics/drawable/Drawable;)V
    .registers 3

    .line 9
    const/4 v0, 0x1

    iput-byte v0, p0, Lzu4;->b:B

    invoke-direct {p0, p1}, Lol7;-><init>(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/custom_views/CheckBox;Landroid/graphics/drawable/Drawable;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lzu4;->b:B

    iput-object p1, p0, Lzu4;->c:Ljava/lang/Object;

    invoke-direct {p0, p2}, Lol7;-><init>(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 6

    iget-byte v0, p0, Lzu4;->b:B

    packed-switch v0, :pswitch_data_56

    invoke-super {p0, p1}, Lol7;->draw(Landroid/graphics/Canvas;)V

    return-void

    :pswitch_9
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    iget-object v1, p0, Lzu4;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/CheckBox;

    iget v2, v1, Lcom/opera/android/custom_views/CheckBox;->o:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_4f

    invoke-virtual {v1}, Landroid/widget/TextView;->getLineCount()I

    move-result v2

    const/4 v3, 0x1

    if-le v2, v3, :cond_4f

    invoke-virtual {v1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/text/Layout;->getLineBottom(I)I

    move-result v2

    invoke-virtual {v1}, Landroid/widget/TextView;->getLineSpacingExtra()F

    move-result v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    sub-int/2addr v2, v3

    iget-object v3, p0, Lol7;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    sub-int/2addr v2, v3

    div-int/lit8 v2, v2, 0x2

    invoke-virtual {v1}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/text/Layout;->getHeight()I

    move-result v1

    iget-object v3, p0, Lol7;->a:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    sub-int/2addr v1, v3

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v2, v1

    int-to-float v1, v2

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Canvas;->translate(FF)V

    :cond_4f
    invoke-super {p0, p1}, Lol7;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void

    :pswitch_data_56
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final mutate()Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-byte v0, p0, Lzu4;->b:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object v0, p0, Lol7;->a:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_11

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    :cond_11
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .registers 6

    iget-byte v0, p0, Lzu4;->b:B

    packed-switch v0, :pswitch_data_2c

    invoke-super {p0, p1}, Lol7;->onBoundsChange(Landroid/graphics/Rect;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Lzu4;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Rect;

    if-eqz v0, :cond_24

    iput-object v0, p0, Lzu4;->c:Ljava/lang/Object;

    iget-object p1, p0, Lol7;->a:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_20

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    iget v3, v0, Landroid/graphics/Rect;->right:I

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v1, v2, v3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_20
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    goto :goto_2b

    :cond_24
    iget-object p0, p0, Lol7;->a:Landroid/graphics/drawable/Drawable;

    if-eqz p0, :cond_2b

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    :cond_2b
    :goto_2b
    return-void

    :pswitch_data_2c
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
