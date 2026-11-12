.class public final synthetic Ly4d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/ad/mraid/MRAIDView;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/ad/mraid/MRAIDView;Ljava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Ly4d;->a:B

    iput-object p1, p0, Ly4d;->b:Lcom/opera/ad/mraid/MRAIDView;

    iput-object p2, p0, Ly4d;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 10

    iget-byte v0, p0, Ly4d;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x3

    const/4 v3, 0x0

    iget-object v4, p0, Ly4d;->c:Ljava/lang/String;

    iget-object p0, p0, Ly4d;->b:Lcom/opera/ad/mraid/MRAIDView;

    packed-switch v0, :pswitch_data_106

    sget v0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    iget-byte v0, p0, Lcom/opera/ad/mraid/MRAIDView;->C:B

    if-eq v0, v2, :cond_3a

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->u:Lb5d;

    invoke-virtual {v0, v3}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v0, p0, Laoo;->a:Landroid/content/Context;

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->A(Landroid/content/Context;)Lb5d;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    invoke-virtual {p0, v0}, Laoo;->s(Landroid/view/View;)V

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    const-string v2, "text/html"

    const-string v3, "UTF-8"

    invoke-virtual {v0, v4, v2, v3}, Landroid/webkit/WebView;->loadData(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->v:Lb5d;

    iput-object v0, p0, Lcom/opera/ad/mraid/MRAIDView;->w:Lb5d;

    iput-boolean v1, p0, Lcom/opera/ad/mraid/MRAIDView;->R:Z

    invoke-virtual {p0, v0}, Lcom/opera/ad/mraid/MRAIDView;->B(Lb5d;)V

    return-void

    :cond_3a
    throw v3

    :pswitch_3b
    sget v0, Lcom/opera/ad/mraid/MRAIDView;->e0:I

    const-string v0, "file:///"

    invoke-virtual {v4, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_8e

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "/"

    invoke-virtual {v4, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v2, v3, v2

    const-string v4, "android_asset"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8a

    :try_start_5a
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    iget-object v5, p0, Lcom/opera/ad/mraid/MRAIDView;->z:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v5

    const/4 v6, 0x4

    aget-object v3, v3, v6

    invoke-virtual {v5, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    goto :goto_77

    :goto_72
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v3, :cond_7c

    :goto_77
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    goto :goto_72

    :cond_7c
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_5a .. :try_end_7f} :catch_80

    goto :goto_84

    :catch_80
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    :goto_84
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_ea

    :cond_8a
    const-string v0, ""

    goto/16 :goto_ea

    :cond_8e
    :try_start_8e
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v4}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0
    :try_end_97
    .catch Ljava/io/IOException; {:try_start_8e .. :try_end_97} :catch_db
    .catchall {:try_start_8e .. :try_end_97} :catchall_d8

    :try_start_97
    move-object v2, v0

    check-cast v2, Ljava/net/HttpURLConnection;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2
    :try_end_9e
    .catch Ljava/io/IOException; {:try_start_97 .. :try_end_9e} :catch_d5
    .catchall {:try_start_97 .. :try_end_9e} :catchall_ca

    const/16 v4, 0xc8

    if-ne v2, v4, :cond_d1

    :try_start_a2
    invoke-virtual {v0}, Ljava/net/URLConnection;->getContentLength()I

    invoke-virtual {v0}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_a9
    .catch Ljava/io/IOException; {:try_start_a2 .. :try_end_a9} :catch_ce
    .catchall {:try_start_a2 .. :try_end_a9} :catchall_ca

    const/16 v4, 0x1000

    :try_start_ab
    new-array v4, v4, [B

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    :goto_b2
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v6

    const/4 v7, -0x1

    if-eq v6, v7, :cond_c3

    new-instance v7, Ljava/lang/String;

    const/4 v8, 0x0

    invoke-direct {v7, v4, v8, v6}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_b2

    :cond_c3
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3
    :try_end_c7
    .catch Ljava/io/IOException; {:try_start_ab .. :try_end_c7} :catch_c8
    .catchall {:try_start_ab .. :try_end_c7} :catchall_fb

    goto :goto_d2

    :catch_c8
    move-exception v4

    goto :goto_de

    :catchall_ca
    move-exception p0

    move-object v2, v3

    :goto_cc
    move-object v3, v0

    goto :goto_fd

    :catch_ce
    move-exception v4

    :goto_cf
    move-object v2, v3

    goto :goto_de

    :cond_d1
    move-object v2, v3

    :goto_d2
    if-eqz v0, :cond_e6

    goto :goto_e3

    :catch_d5
    move-exception v2

    move-object v4, v2

    goto :goto_cf

    :catchall_d8
    move-exception p0

    move-object v2, v3

    goto :goto_fd

    :catch_db
    move-exception v4

    move-object v0, v3

    move-object v2, v0

    :goto_de
    :try_start_de
    invoke-virtual {v4}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;
    :try_end_e1
    .catchall {:try_start_de .. :try_end_e1} :catchall_fb

    if-eqz v0, :cond_e6

    :goto_e3
    invoke-static {v0}, Lhn9;->f(Ljava/net/URLConnection;)V

    :cond_e6
    invoke-static {v2}, Lr9h;->l(Ljava/io/Closeable;)V

    move-object v0, v3

    :goto_ea
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_fa

    iget-object v2, p0, Lcom/opera/ad/mraid/MRAIDView;->c0:Landroid/os/Handler;

    new-instance v3, Ly4d;

    invoke-direct {v3, p0, v0, v1}, Ly4d;-><init>(Lcom/opera/ad/mraid/MRAIDView;Ljava/lang/String;B)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_fa
    return-void

    :catchall_fb
    move-exception p0

    goto :goto_cc

    :goto_fd
    if-eqz v3, :cond_102

    invoke-static {v3}, Lhn9;->f(Ljava/net/URLConnection;)V

    :cond_102
    invoke-static {v2}, Lr9h;->l(Ljava/io/Closeable;)V

    throw p0

    :pswitch_data_106
    .packed-switch 0x0
        :pswitch_3b
    .end packed-switch
.end method
