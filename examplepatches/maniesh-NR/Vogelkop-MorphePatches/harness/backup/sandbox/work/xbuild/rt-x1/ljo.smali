.class public abstract Lljo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lljo;->a:Ljava/util/HashMap;

    return-void
.end method

.method public static a(Ljava/net/URLConnection;Ljro;)V
    .registers 9

    iget-byte v0, p1, Ljro;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    :try_start_4
    invoke-virtual {p0, v1}, Ljava/net/URLConnection;->setDoInput(Z)V

    const/16 v3, 0x2710

    invoke-virtual {p0, v3}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    invoke-virtual {p0, v3}, Ljava/net/URLConnection;->setReadTimeout(I)V

    move-object v3, p0

    check-cast v3, Ljava/net/HttpURLConnection;

    invoke-virtual {v3, v1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_15} :catch_87
    .catchall {:try_start_4 .. :try_end_15} :catchall_82

    iget-object p1, p1, Ljro;->c:Ljava/lang/String;

    const/16 v3, 0xb

    const/16 v4, 0xc

    if-ne v0, v3, :cond_20

    :try_start_1d
    const-string v1, "GET"

    goto :goto_27

    :cond_20
    if-ne v0, v4, :cond_2d

    invoke-virtual {p0, v1}, Ljava/net/URLConnection;->setDoOutput(Z)V

    const-string v1, "POST"

    :goto_27
    move-object v3, p0

    check-cast v3, Ljava/net/HttpURLConnection;

    invoke-virtual {v3, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    :cond_2d
    const-string v1, "User-Agent"

    sget-object v3, Lg1p;->g:Ljava/lang/String;

    sget-object v5, Lljo;->a:Ljava/util/HashMap;

    invoke-virtual {v5, v1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_3e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_66

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {p0, v5, v6}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    goto :goto_3e

    :cond_66
    if-ne v0, v4, :cond_7e

    invoke-virtual {p0}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7b

    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    :cond_7b
    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V

    :cond_7e
    invoke-virtual {p0}, Ljava/net/URLConnection;->connect()V
    :try_end_81
    .catch Ljava/io/IOException; {:try_start_1d .. :try_end_81} :catch_87
    .catchall {:try_start_1d .. :try_end_81} :catchall_82

    goto :goto_87

    :catchall_82
    move-exception p0

    invoke-static {v2}, Lr9h;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_87
    :goto_87
    invoke-static {v2}, Lr9h;->l(Ljava/io/Closeable;)V

    return-void
.end method
