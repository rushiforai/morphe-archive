.class public final Lb5d;
.super Landroid/webkit/WebView;
.source "SourceFile"


# instance fields
.field public a:Z

.field public b:Z

.field public final synthetic c:Lcom/opera/ad/mraid/MRAIDView;


# direct methods
.method public constructor <init>(Lcom/opera/ad/mraid/MRAIDView;Landroid/content/Context;)V
    .registers 3

    iput-object p1, p0, Lb5d;->c:Lcom/opera/ad/mraid/MRAIDView;

    invoke-direct {p0, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final destroy()V
    .registers 2

    invoke-super {p0}, Landroid/webkit/WebView;->destroy()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lb5d;->b:Z

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/webkit/WebView;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget p0, p1, Landroid/content/res/Configuration;->orientation:I

    return-void
.end method

.method public final onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 6

    const/4 v0, 0x4

    if-ne p1, v0, :cond_12

    iget-object v0, p0, Lb5d;->c:Lcom/opera/ad/mraid/MRAIDView;

    iget-byte v1, v0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    const/4 v2, 0x2

    if-eq v1, v2, :cond_d

    const/4 v2, 0x3

    if-ne v1, v2, :cond_12

    :cond_d
    invoke-virtual {v0}, Lcom/opera/ad/mraid/MRAIDView;->close()V

    const/4 p0, 0x1

    return p0

    :cond_12
    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    sget p1, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    iget-object p1, p0, Lb5d;->c:Lcom/opera/ad/mraid/MRAIDView;

    iget-object p2, p1, Lcom/opera/ad/mraid/MRAIDView;->w:Lb5d;

    const/4 p3, 0x0

    const/4 p4, 0x1

    if-ne p0, p2, :cond_f

    move p0, p4

    goto :goto_10

    :cond_f
    move p0, p3

    :goto_10
    iget-byte p2, p1, Lcom/opera/ad/mraid/MRAIDView;->C:B

    if-eqz p0, :cond_39

    iget-boolean p0, p1, Lcom/opera/ad/mraid/MRAIDView;->P:Z

    if-eqz p0, :cond_1b

    iput-boolean p3, p1, Lcom/opera/ad/mraid/MRAIDView;->P:Z

    return-void

    :cond_1b
    if-eqz p2, :cond_1f

    if-ne p2, p4, :cond_25

    :cond_1f
    invoke-virtual {p1}, Lcom/opera/ad/mraid/MRAIDView;->H()V

    invoke-virtual {p1}, Lcom/opera/ad/mraid/MRAIDView;->G()V

    :cond_25
    iget-boolean p0, p1, Lcom/opera/ad/mraid/MRAIDView;->S:Z

    if-nez p0, :cond_2c

    invoke-virtual {p1, p4}, Lcom/opera/ad/mraid/MRAIDView;->C(Z)V

    :cond_2c
    iget-boolean p0, p1, Lcom/opera/ad/mraid/MRAIDView;->Q:Z

    if-eqz p0, :cond_39

    iput-boolean p3, p1, Lcom/opera/ad/mraid/MRAIDView;->Q:Z

    iget-boolean p0, p1, Lcom/opera/ad/mraid/MRAIDView;->R:Z

    if-nez p0, :cond_39

    invoke-virtual {p1}, Lcom/opera/ad/mraid/MRAIDView;->I()V

    :cond_39
    return-void
.end method

.method public final onVisibilityChanged(Landroid/view/View;I)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/webkit/WebView;->onVisibilityChanged(Landroid/view/View;I)V

    sget p0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    return-void
.end method

.method public final onWindowVisibilityChanged(I)V
    .registers 3

    invoke-super {p0, p1}, Landroid/webkit/WebView;->onWindowVisibilityChanged(I)V

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    sget v0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    if-eqz p1, :cond_1b

    iget-object p1, p0, Lb5d;->c:Lcom/opera/ad/mraid/MRAIDView;

    iget-byte p1, p1, Lcom/opera/ad/mraid/MRAIDView;->C:B

    const/4 v0, 0x2

    if-eq p1, v0, :cond_28

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {p0}, Landroid/webkit/WebView;->onPause()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lb5d;->a:Z

    return-void

    :cond_1b
    iget-boolean p1, p0, Lb5d;->a:Z

    if-eqz p1, :cond_28

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    invoke-virtual {p0}, Landroid/webkit/WebView;->onResume()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lb5d;->a:Z

    :cond_28
    return-void
.end method
