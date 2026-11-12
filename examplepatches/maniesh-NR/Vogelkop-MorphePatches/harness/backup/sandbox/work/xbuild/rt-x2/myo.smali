.class public final Lmyo;
.super Landroid/webkit/WebChromeClient;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/view/ViewGroup;


# direct methods
.method public synthetic constructor <init>(Landroid/view/ViewGroup;B)V
    .registers 3

    iput-byte p2, p0, Lmyo;->a:B

    iput-object p1, p0, Lmyo;->b:Landroid/view/ViewGroup;

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    return-void
.end method


# virtual methods
.method public final getDefaultVideoPoster()Landroid/graphics/Bitmap;
    .registers 2

    iget-byte v0, p0, Lmyo;->a:B

    packed-switch v0, :pswitch_data_14

    invoke-super {p0}, Landroid/webkit/WebChromeClient;->getDefaultVideoPoster()Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :pswitch_a
    sget-object p0, Ltlp;->b:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/graphics/Bitmap;

    return-object p0

    nop

    :pswitch_data_14
    .packed-switch 0x1
        :pswitch_a
    .end packed-switch
.end method

.method public final onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .registers 4

    iget-byte v0, p0, Lmyo;->a:B

    packed-switch v0, :pswitch_data_16

    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    return-void

    :pswitch_9
    if-eqz p2, :cond_15

    iget-object p0, p0, Lmyo;->b:Landroid/view/ViewGroup;

    check-cast p0, La3p;

    iget-boolean p0, p0, La3p;->h:Z

    const/4 v0, 0x0

    invoke-interface {p2, p1, p0, v0}, Landroid/webkit/GeolocationPermissions$Callback;->invoke(Ljava/lang/String;ZZ)V

    :cond_15
    return-void

    :pswitch_data_16
    .packed-switch 0x1
        :pswitch_9
    .end packed-switch
.end method

.method public final onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .registers 6

    iget-byte v0, p0, Lmyo;->a:B

    packed-switch v0, :pswitch_data_12

    sget-object v0, Lito;->a:[Lito;

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p0

    return p0

    :pswitch_c
    invoke-virtual {p4}, Landroid/webkit/JsResult;->confirm()V

    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final onJsBeforeUnload(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .registers 6

    iget-byte v0, p0, Lmyo;->a:B

    packed-switch v0, :pswitch_data_10

    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsBeforeUnload(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p0

    return p0

    :pswitch_a
    invoke-virtual {p4}, Landroid/webkit/JsResult;->confirm()V

    const/4 p0, 0x1

    return p0

    nop

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .registers 5

    iget-byte p0, p0, Lmyo;->a:B

    const/4 p1, 0x1

    packed-switch p0, :pswitch_data_10

    sget-object p0, Lito;->a:[Lito;

    invoke-virtual {p4}, Landroid/webkit/JsResult;->cancel()V

    return p1

    :pswitch_c
    invoke-virtual {p4}, Landroid/webkit/JsResult;->confirm()V

    return p1

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .registers 6

    iget-byte p0, p0, Lmyo;->a:B

    const/4 p1, 0x1

    packed-switch p0, :pswitch_data_10

    sget-object p0, Lito;->a:[Lito;

    invoke-virtual {p5}, Landroid/webkit/JsResult;->cancel()V

    return p1

    :pswitch_c
    invoke-virtual {p5}, Landroid/webkit/JsResult;->confirm()V

    return p1

    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_c
    .end packed-switch
.end method

.method public final onProgressChanged(Landroid/webkit/WebView;I)V
    .registers 5

    iget-byte v0, p0, Lmyo;->a:B

    packed-switch v0, :pswitch_data_36

    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    return-void

    :pswitch_9
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    iget-object p0, p0, Lmyo;->b:Landroid/view/ViewGroup;

    check-cast p0, Lnyo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lnyo;->d:J

    iget-boolean v0, p0, Lnyo;->e:Z

    if-nez v0, :cond_34

    sget-object v0, Lsjo;->b:Lygo;

    invoke-virtual {v0}, Li7c;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_34

    const/16 v0, 0x32

    if-lt p2, v0, :cond_34

    const-string p2, "javascript:function onExportPageLoaded() {    window.location = \'operaadx://FINISHED\';}window.addEventListener(\'load\', function() {    onExportPageLoaded();}, false);"

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lnyo;->e:Z

    :cond_34
    return-void

    nop

    :pswitch_data_36
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method
