.class public final synthetic Ly1p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lt2p;


# direct methods
.method public synthetic constructor <init>(Lt2p;B)V
    .registers 3

    iput-byte p2, p0, Ly1p;->a:B

    iput-object p1, p0, Ly1p;->b:Lt2p;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    iget-byte p1, p0, Ly1p;->a:B

    iget-object p0, p0, Ly1p;->b:Lt2p;

    packed-switch p1, :pswitch_data_34

    invoke-virtual {p0}, Lt2p;->c()V

    return-void

    :pswitch_b
    iget-object p0, p0, Lt2p;->a:Landroid/webkit/WebView;

    if-eqz p0, :cond_12

    invoke-virtual {p0}, Landroid/webkit/WebView;->reload()V

    :cond_12
    return-void

    :pswitch_13
    iget-object p1, p0, Lt2p;->a:Landroid/webkit/WebView;

    if-eqz p1, :cond_22

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoForward()Z

    move-result p1

    if-eqz p1, :cond_22

    iget-object p0, p0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/webkit/WebView;->goForward()V

    :cond_22
    return-void

    :pswitch_23
    iget-object p1, p0, Lt2p;->a:Landroid/webkit/WebView;

    if-eqz p1, :cond_32

    invoke-virtual {p1}, Landroid/webkit/WebView;->canGoBack()Z

    move-result p1

    if-eqz p1, :cond_32

    iget-object p0, p0, Lt2p;->a:Landroid/webkit/WebView;

    invoke-virtual {p0}, Landroid/webkit/WebView;->goBack()V

    :cond_32
    return-void

    nop

    :pswitch_data_34
    .packed-switch 0x0
        :pswitch_23
        :pswitch_13
        :pswitch_b
    .end packed-switch
.end method
