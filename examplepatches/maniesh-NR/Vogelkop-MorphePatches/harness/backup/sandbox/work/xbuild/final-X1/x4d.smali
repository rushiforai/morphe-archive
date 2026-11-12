.class public final synthetic Lx4d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/ad/mraid/MRAIDView;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/ad/mraid/MRAIDView;B)V
    .registers 3

    iput-byte p2, p0, Lx4d;->a:B

    iput-object p1, p0, Lx4d;->b:Lcom/opera/ad/mraid/MRAIDView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 7

    iget-byte v0, p0, Lx4d;->a:B

    iget-object p0, p0, Lx4d;->b:Lcom/opera/ad/mraid/MRAIDView;

    packed-switch v0, :pswitch_data_d4

    sget v0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    invoke-virtual {p0}, Lcom/opera/ad/mraid/MRAIDView;->I()V

    return-void

    :pswitch_d
    sget v0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->A:Landroid/app/Activity;

    if-eqz v0, :cond_1e

    invoke-virtual {v0}, Landroid/app/Activity;->getRequestedOrientation()I

    move-result v1

    iget v2, p0, Lcom/opera/ad/mraid/MRAIDView;->b0:I

    if-eq v1, v2, :cond_1e

    invoke-virtual {v0, v2}, Landroid/app/Activity;->setRequestedOrientation(I)V

    :cond_1e
    if-eqz v0, :cond_51

    iget-boolean v1, p0, Lcom/opera/ad/mraid/MRAIDView;->U:Z

    if-nez v1, :cond_2d

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x400

    invoke-virtual {v1, v2}, Landroid/view/Window;->clearFlags(I)V

    :cond_2d
    iget-boolean v1, p0, Lcom/opera/ad/mraid/MRAIDView;->V:Z

    if-eqz v1, :cond_3a

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    const/16 v2, 0x800

    invoke-virtual {v1, v2}, Landroid/view/Window;->addFlags(I)V

    :cond_3a
    iget-boolean v1, p0, Lcom/opera/ad/mraid/MRAIDView;->a0:Z

    if-eqz v1, :cond_48

    invoke-virtual {v0}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object p0

    if-eqz p0, :cond_51

    invoke-virtual {p0}, Landroid/app/ActionBar;->show()V

    goto :goto_51

    :cond_48
    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->T:Landroid/view/View;

    if-eqz v0, :cond_51

    iget p0, p0, Lcom/opera/ad/mraid/MRAIDView;->W:I

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_51
    :goto_51
    return-void

    :pswitch_52
    sget v0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->c0:Landroid/os/Handler;

    iget-byte v1, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    if-eqz v1, :cond_d2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_d2

    const/4 v3, 0x4

    if-eq v1, v3, :cond_d2

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x3

    if-eq v1, v2, :cond_6e

    if-eq v1, v3, :cond_6e

    if-ne v1, v5, :cond_d2

    iput-byte v2, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    iput-boolean v2, p0, Lcom/opera/ad/mraid/MRAIDView;->S:Z

    throw v4

    :cond_6e
    if-eq v1, v3, :cond_72

    if-ne v1, v5, :cond_74

    :cond_72
    iput-byte v2, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    :cond_74
    iput-boolean v2, p0, Lcom/opera/ad/mraid/MRAIDView;->S:Z

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->A:Landroid/app/Activity;

    invoke-static {v1, p0}, Lupj;->f(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_8a

    iget-object v5, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_8a
    iput-object v4, p0, Lcom/opera/ad/mraid/MRAIDView;->x:Landroid/widget/RelativeLayout;

    iput-object v4, p0, Lcom/opera/ad/mraid/MRAIDView;->y:Landroid/widget/ImageButton;

    new-instance v1, Lx4d;

    invoke-direct {v1, p0, v2}, Lx4d;-><init>(Lcom/opera/ad/mraid/MRAIDView;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    if-nez v1, :cond_a2

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    if-eqz v1, :cond_ca

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_ca

    :cond_a2
    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    invoke-virtual {v1, v4}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    invoke-virtual {v1}, Lb5d;->destroy()V

    iput-object v4, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    new-instance v2, La5d;

    const/4 v4, 0x0

    invoke-direct {v2, v4}, La5d;-><init>(B)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    new-instance v2, Lc5d;

    invoke-direct {v2, p0, v4}, Lc5d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    iput-object v1, p0, Lcom/opera/ad/mraid/MRAIDView;->w:Lb5d;

    :cond_ca
    :goto_ca
    new-instance v1, Lx4d;

    invoke-direct {v1, p0, v3}, Lx4d;-><init>(Lcom/opera/ad/mraid/MRAIDView;B)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_d2
    return-void

    nop

    :pswitch_data_d4
    .packed-switch 0x0
        :pswitch_52
        :pswitch_d
    .end packed-switch
.end method
