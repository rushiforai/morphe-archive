.class public Le/e/a/y0$b;
.super Ljava/lang/Object;
.source ""

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/y0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public a:Ljava/lang/Integer;

.field public b:Ljava/lang/String;

.field public final synthetic c:Le/e/a/y0;


# direct methods
.method public constructor <init>(Le/e/a/y0;Ljava/lang/String;Ljava/lang/Integer;)V
    .registers 4

    iput-object p1, p0, Le/e/a/y0$b;->c:Le/e/a/y0;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Le/e/a/y0$b;->a:Ljava/lang/Integer;

    iput-object p2, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 11

    sget-object v0, Le/e/a/y0;->f:Le/e/a/y0$a;

    iget-object v1, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ld/e/f;->a(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/Bitmap;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v4, v2

    :goto_0
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v5

    if-eqz v5, :cond_5

    :cond_0
    const/4 v5, 0x3

    if-ge v3, v5, :cond_5

    :try_start_0
    new-instance v5, Ljava/net/URL;

    iget-object v6, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v5}, Lnicoid/network238/ReadOnlyConnection239;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v5

    check-cast v5, Ljava/net/HttpURLConnection;

    const-string v6, "GET"

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const-string v6, "Accept-Language"

    const-string v7, "jp"

    invoke-virtual {v5, v6, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const/16 v6, 0x1388

    invoke-virtual {v5, v6}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->connect()V

    new-instance v6, Ljava/io/BufferedInputStream;

    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v7, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v7}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    invoke-virtual {v5}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    const/16 v8, 0xc8

    if-ne v5, v8, :cond_2

    const/16 v5, 0x1000

    new-array v5, v5, [B

    :goto_1
    invoke-virtual {v6, v5}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v8
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/4 v9, -0x1

    if-eq v8, v9, :cond_1

    :try_start_2
    invoke-virtual {v7, v5, v1, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v5

    :try_start_3
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5

    new-instance v8, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v8}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    sget-object v9, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v9, v8, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    array-length v9, v5

    invoke-static {v5, v1, v9, v8}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v4, :cond_3

    iput-object v4, p0, Le/e/a/y0$b;->b:Ljava/lang/String;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_2

    :cond_2
    move-object v0, v2

    :cond_3
    :goto_2
    :try_start_4
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_4
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/io/FileNotFoundException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    :catchall_0
    move-exception v0

    goto :goto_4

    :catch_1
    move-exception v5

    :try_start_5
    invoke-virtual {v5}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    :goto_3
    :try_start_6
    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->close()V

    goto :goto_6

    :goto_4
    invoke-virtual {v7}, Ljava/io/ByteArrayOutputStream;->close()V

    invoke-virtual {v6}, Ljava/io/BufferedInputStream;->close()V

    throw v0
    :try_end_6
    .catch Ljava/net/SocketTimeoutException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_3
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_5

    :catch_3
    move-exception v0

    const-string v5, "404 Thumbnail / "

    invoke-static {v5}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    iget-object v5, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    const-string v6, "M"

    invoke-virtual {v5, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    iget-object v4, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    const-string v5, "\\.M"

    const-string v6, ""

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    :cond_4
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    goto :goto_5

    :catch_4
    const-string v0, "\u30bf\u30a4\u30e0\u30a2\u30a6\u30c8 Thumbnail / "

    invoke-static {v0}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v5, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :goto_5
    move-object v0, v2

    :goto_6
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_5
    if-eqz v0, :cond_6

    iget-object v1, p0, Le/e/a/y0$b;->c:Le/e/a/y0;

    new-instance v3, Le/e/a/y0$e;

    iget-object v6, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    const/4 v7, 0x0

    iget-object v8, p0, Le/e/a/y0$b;->a:Ljava/lang/Integer;

    move-object v4, v3

    move-object v5, v1

    move-object v9, v0

    invoke-direct/range {v4 .. v9}, Le/e/a/y0$e;-><init>(Le/e/a/y0;Ljava/lang/String;Landroid/widget/ImageView;Ljava/lang/Integer;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v3}, Le/e/a/y0;->b(Ljava/lang/Runnable;)V

    sget-object v1, Le/e/a/y0;->f:Le/e/a/y0$a;

    iget-object v3, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    invoke-virtual {v1, v3, v0}, Ld/e/f;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_6
    sget-object v0, Le/e/a/y0;->g:Ljava/util/HashMap;

    iget-object v1, p0, Le/e/a/y0$b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
