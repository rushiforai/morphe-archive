.class public final Lugo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzhp;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/widget/ImageView;Lcom/opera/ad/interstitial/AdActivity;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lugo;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lugo;->b:Ljava/lang/Object;

    iput-object p2, p0, Lugo;->c:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    .line 11
    iput-byte p3, p0, Lugo;->a:B

    iput-object p1, p0, Lugo;->c:Ljava/lang/Object;

    iput-object p2, p0, Lugo;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    iget-byte p1, p0, Lugo;->a:B

    iget-object v0, p0, Lugo;->b:Ljava/lang/Object;

    sget-object v1, Lbbp;->d:Lbbp;

    iget-object p0, p0, Lugo;->c:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_3c

    check-cast p0, Lu2p;

    iget-object p1, p0, Lu2p;->u:Landroid/widget/ImageView;

    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object p0, p0, Lu2p;->u:Landroid/widget/ImageView;

    invoke-virtual {v1}, Lbbp;->h()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    return-void

    :pswitch_1e
    check-cast v0, Landroid/widget/ImageView;

    check-cast p0, Llro;

    iget-object p0, p0, Llro;->y:Landroid/content/Context;

    invoke-virtual {v1, p0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    return-void

    :pswitch_2e
    check-cast v0, Landroid/widget/ImageView;

    check-cast p0, Lcom/opera/ad/interstitial/AdActivity;

    invoke-virtual {v1, p0}, Lbbp;->d(Landroid/content/Context;)Landroid/graphics/drawable/BitmapDrawable;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    sget-object p0, Ljava/util/Locale;->US:Ljava/util/Locale;

    return-void

    :pswitch_data_3c
    .packed-switch 0x0
        :pswitch_2e
        :pswitch_1e
    .end packed-switch
.end method

.method public final b(Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;Z)V
    .registers 5

    iget-byte p3, p0, Lugo;->a:B

    iget-object v0, p0, Lugo;->b:Ljava/lang/Object;

    packed-switch p3, :pswitch_data_2a

    iget-object p0, p0, Lugo;->c:Ljava/lang/Object;

    check-cast p0, Lu2p;

    iget-object p3, p0, Lu2p;->u:Landroid/widget/ImageView;

    invoke-static {p3, p1, p2}, Lupj;->h(Landroid/widget/ImageView;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V

    iget-object p1, p0, Lu2p;->u:Landroid/widget/ImageView;

    check-cast v0, Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iget-object p1, p0, Lu2p;->u:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Laoo;->v(Landroid/view/View;)V

    return-void

    :pswitch_1d
    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0, p1, p2}, Lupj;->h(Landroid/widget/ImageView;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_23
    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0, p1, p2}, Lupj;->h(Landroid/widget/ImageView;Landroid/graphics/Bitmap;Landroid/graphics/drawable/Drawable;)V

    return-void

    nop

    :pswitch_data_2a
    .packed-switch 0x0
        :pswitch_23
        :pswitch_1d
    .end packed-switch
.end method
