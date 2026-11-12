.class public final Lsmo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzhp;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lsmo;->a:B

    iput-object p1, p0, Lsmo;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 2

    iget-byte p1, p0, Lsmo;->a:B

    iget-object p0, p0, Lsmo;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_2e

    check-cast p0, Lg94;

    const/4 p1, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lg94;->l(Ljava/lang/Object;)V

    return-void

    :pswitch_12
    check-cast p0, Lt8p;

    const/4 p1, 0x0

    iput-object p1, p0, Lt8p;->y:Ljava/lang/String;

    iget-object p0, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-static {p0}, Lupj;->j(Landroid/view/View;)V

    return-void

    :pswitch_1d
    check-cast p0, Landroid/widget/ImageView;

    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    sget-object p1, Lbbp;->d:Lbbp;

    invoke-virtual {p1}, Lbbp;->h()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_12
    .end packed-switch
.end method

.method public final b(Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Z)V
    .registers 4

    iget-byte p3, p0, Lsmo;->a:B

    iget-object p0, p0, Lsmo;->b:Ljava/lang/Object;

    packed-switch p3, :pswitch_data_2c

    check-cast p0, Lg94;

    if-nez p1, :cond_f

    if-nez p2, :cond_f

    const/4 p1, 0x0

    goto :goto_10

    :cond_f
    const/4 p1, 0x1

    :goto_10
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-interface {p0, p1}, Lg94;->l(Ljava/lang/Object;)V

    return-void

    :pswitch_18
    check-cast p0, Lt8p;

    iget-object p0, p0, Lt8p;->v:Landroid/widget/ImageView;

    invoke-static {p0, p1, p2}, Lupj;->h(Landroid/widget/ImageView;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_20
    check-cast p0, Landroid/widget/ImageView;

    sget-object p3, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, p3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    invoke-static {p0, p1, p2}, Lupj;->h(Landroid/widget/ImageView;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V

    return-void

    nop

    :pswitch_data_2c
    .packed-switch 0x0
        :pswitch_20
        :pswitch_18
    .end packed-switch
.end method
