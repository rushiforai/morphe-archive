.class public final Ld21;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lpde;Lpde;)V
    .registers 5

    const/4 v0, 0x1

    iput-byte v0, p0, Ld21;->a:B

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    iput-object p3, p0, Ld21;->b:Ljava/lang/Object;

    new-instance p1, Lks6;

    const/4 v0, 0x5

    invoke-direct {p1, p0, v0}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-static {p3, p2, p1}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Ld21;->a:B

    .line 19
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 20
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Ld21;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Landroid/content/Context;B)V
    .registers 4

    .line 18
    iput-byte p3, p0, Ld21;->a:B

    iput-object p1, p0, Ld21;->b:Ljava/lang/Object;

    invoke-direct {p0, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_7

    return-void

    :cond_7
    iget-object p0, p0, Ld21;->b:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Leyj;

    iget-object v1, p0, Leyj;->j:Loxj;

    iget-object v1, v1, Loxj;->e:Landroid/util/Size;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object p0, p0, Leyj;->j:Loxj;

    iget-object p0, p0, Loxj;->e:Landroid/util/Size;

    invoke-virtual {p0}, Landroid/util/Size;->getHeight()I

    move-result p0

    iput p0, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    return-void
.end method

.method public final getRootView()Landroid/view/View;
    .registers 2

    iget-byte v0, p0, Ld21;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Ld21;->b:Ljava/lang/Object;

    check-cast p0, Li21;

    iget-object p0, p0, Li21;->e:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final getWindowToken()Landroid/os/IBinder;
    .registers 2

    iget-byte v0, p0, Ld21;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object p0

    return-object p0

    :pswitch_a
    iget-object p0, p0, Ld21;->b:Ljava/lang/Object;

    check-cast p0, Li21;

    iget-object p0, p0, Li21;->e:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getApplicationWindowToken()Landroid/os/IBinder;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 9

    iget-byte v0, p0, Ld21;->a:B

    packed-switch v0, :pswitch_data_20

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    return-void

    :pswitch_9
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v4, v0

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    int-to-float v5, v0

    iget-object p0, p0, Ld21;->b:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Landroid/graphics/Paint;

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void

    nop

    :pswitch_data_20
    .packed-switch 0x2
        :pswitch_9
    .end packed-switch
.end method

.method public final onPointerCaptureChange(Z)V
    .registers 3

    iget-byte v0, p0, Ld21;->a:B

    packed-switch v0, :pswitch_data_20

    invoke-super {p0, p1}, Landroid/view/View;->onPointerCaptureChange(Z)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Landroid/view/View;->onPointerCaptureChange(Z)V

    iget-object p0, p0, Ld21;->b:Ljava/lang/Object;

    check-cast p0, Lorg/chromium/ui/base/WindowAndroid;

    sget-object v0, Lorg/chromium/ui/base/WindowAndroid;->B:Lb2b;

    if-nez p1, :cond_1c

    iget-object p1, p0, Lorg/chromium/ui/base/WindowAndroid;->p:Landroid/view/View;

    const/4 p1, 0x0

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lorg/chromium/ui/base/WindowAndroid;->q(ZZ)V

    goto :goto_1f

    :cond_1c
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_1f
    return-void

    :pswitch_data_20
    .packed-switch 0x3
        :pswitch_9
    .end packed-switch
.end method

.method public final setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    .registers 3

    iget-byte v0, p0, Ld21;->a:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :pswitch_9
    invoke-super {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Ld21;->a()V

    return-void

    :pswitch_data_10
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method
