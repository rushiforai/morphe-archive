.class public final Ljx;
.super Lfr8;
.source "SourceFile"


# instance fields
.field public final synthetic s:B

.field public final t:Ljava/lang/Object;

.field public u:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/graphics/drawable/Drawable;Ljava/lang/String;Ltta;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Ljx;->s:B

    sget-object v1, Lvr8;->l:Lvr8;

    invoke-direct {p0, p1, p4, v1}, Lfr8;-><init>(Landroid/content/Context;Ltta;Lvr8;)V

    iput-object p3, p0, Ljx;->t:Ljava/lang/Object;

    if-eqz p2, :cond_1e

    new-instance p1, Ljl6;

    iget p3, p0, Lfr8;->c:I

    invoke-static {p2, p3, p3}, Lscd;->l0(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    move-result-object p2

    iget-object p3, p0, Lfr8;->a:Lgjf;

    iget p4, p0, Lfr8;->b:I

    iget v1, p0, Lfr8;->f:I

    invoke-direct {p1, p2, p3, p4, v1}, Ljl6;-><init>(Landroid/graphics/Bitmap;Lgjf;II)V

    goto :goto_1f

    :cond_1e
    const/4 p1, 0x0

    :goto_1f
    iput-object p1, p0, Ljx;->u:Ljava/lang/Object;

    invoke-virtual {p0}, Lfr8;->l()V

    iput-boolean v0, p0, Lfr8;->l:Z

    invoke-virtual {p0}, Ljx;->s()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Llf5;Ltta;Lvr8;)V
    .registers 6

    const/4 v0, 0x1

    iput-byte v0, p0, Ljx;->s:B

    .line 45
    invoke-direct {p0, p1, p3, p4}, Lfr8;-><init>(Landroid/content/Context;Ltta;Lvr8;)V

    .line 46
    iput-object p2, p0, Ljx;->t:Ljava/lang/Object;

    .line 47
    invoke-virtual {p0}, Lfr8;->l()V

    return-void
.end method


# virtual methods
.method public final b(Lvr8;Z)V
    .registers 4

    iget-byte v0, p0, Ljx;->s:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0, p1, p2}, Lfr8;->b(Lvr8;Z)V

    return-void

    :pswitch_9
    invoke-super {p0, p1, p2}, Lfr8;->b(Lvr8;Z)V

    const/4 p1, 0x0

    iput-object p1, p0, Ljx;->u:Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final n(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V
    .registers 10

    iget-byte v0, p0, Ljx;->s:B

    packed-switch v0, :pswitch_data_60

    iget-object v0, p0, Ljx;->u:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Drawable;

    if-nez v0, :cond_1f

    iget-object v0, p0, Ljx;->t:Ljava/lang/Object;

    check-cast v0, Llf5;

    iget v1, p0, Lfr8;->c:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v2, p0, Lfr8;->h:Lvr8;

    invoke-virtual {v0, p0, v1, v2}, Llf5;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/Drawable;

    iput-object v0, p0, Ljx;->u:Ljava/lang/Object;

    :cond_1f
    invoke-virtual {v0, p2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    return-void

    :pswitch_26
    invoke-virtual {p2}, Landroid/graphics/Rect;->width()I

    move-result v0

    iget v1, p0, Lfr8;->b:I

    iget-object v2, p0, Lfr8;->a:Lgjf;

    invoke-virtual {v2, v0, v1}, Lgjf;->b(II)Lbcd;

    move-result-object v0

    iget v1, p2, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget v2, p2, Landroid/graphics/Rect;->top:I

    int-to-float v2, v2

    iget-object v3, p0, Lfr8;->h:Lvr8;

    iget-object v3, v3, Lvr8;->e:Lcxh;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcxh;->a(Landroid/content/Context;)I

    move-result v3

    invoke-virtual {v0, p1, v1, v2, v3}, Lbcd;->b(Landroid/graphics/Canvas;FFI)V

    iget-object v0, p0, Ljx;->u:Ljava/lang/Object;

    move-object v1, v0

    check-cast v1, Ljl6;

    if-eqz v1, :cond_5e

    iget p0, p0, Lfr8;->f:I

    iput p0, v1, Ljl6;->c:I

    iget v3, p2, Landroid/graphics/Rect;->left:I

    iget v4, p2, Landroid/graphics/Rect;->top:I

    iget v5, p2, Landroid/graphics/Rect;->right:I

    iget v6, p2, Landroid/graphics/Rect;->bottom:I

    move-object v2, p1

    invoke-virtual/range {v1 .. v6}, Ljl6;->g(Landroid/graphics/Canvas;IIII)V

    :cond_5e
    return-void

    nop

    :pswitch_data_60
    .packed-switch 0x0
        :pswitch_26
    .end packed-switch
.end method

.method public final o()V
    .registers 2

    iget-byte v0, p0, Ljx;->s:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0}, Lfr8;->o()V

    return-void

    :pswitch_9
    iget-boolean v0, p0, Lfr8;->m:Z

    if-eqz v0, :cond_10

    invoke-super {p0}, Lfr8;->o()V

    :cond_10
    return-void

    nop

    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final q(Z)V
    .registers 2

    iget-byte p1, p0, Ljx;->s:B

    packed-switch p1, :pswitch_data_10

    const/4 p1, 0x0

    iput-object p1, p0, Ljx;->u:Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_c
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final s()V
    .registers 2

    iget-byte v0, p0, Ljx;->s:B

    packed-switch v0, :pswitch_data_1a

    const-string v0, " "

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_b
    iget-boolean v0, p0, Lfr8;->l:Z

    if-nez v0, :cond_14

    iget-object v0, p0, Ljx;->t:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_16

    :cond_14
    const-string v0, " "

    :goto_16
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :pswitch_data_1a
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
