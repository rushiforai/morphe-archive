.class public final Lctf;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Ljava/nio/charset/Charset;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public d:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "UTF-8"

    invoke-static {v0}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v0

    sput-object v0, Lctf;->e:Ljava/nio/charset/Charset;

    new-instance v0, Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lctf;->a:Landroid/content/Context;

    iput-object p3, p0, Lctf;->b:Ljava/lang/String;

    iput-object p4, p0, Lctf;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a(Lab9;)I
    .registers 13

    iget-object v0, p1, Lab9;->d:Ljava/lang/Object;

    check-cast v0, Lrsf;

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_9
    iget-wide v2, p1, Lab9;->a:J

    invoke-interface {v0, v1, v2, v3}, Lrsf;->h(Ljava/io/ByteArrayOutputStream;J)V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_e} :catch_103

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p1

    invoke-interface {v0}, Lrsf;->f()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lctf;->c:Ljava/lang/String;

    const-string v2, "Basic "

    const/4 v3, 0x0

    const/4 v4, 0x2

    :try_start_1c
    new-instance v5, Ljava/net/URL;

    iget-object v6, p0, Lctf;->b:Ljava/lang/String;

    invoke-direct {v5, v6}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance v6, Lqhi;

    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v5

    invoke-direct {v6, v5}, Lqhi;-><init>(Ljava/net/URLConnection;)V

    iget-object v7, v6, Lqhi;->a:Ljava/net/URLConnection;
    :try_end_2e
    .catch Ljava/io/IOException; {:try_start_1c .. :try_end_2e} :catch_f8
    .catchall {:try_start_1c .. :try_end_2e} :catchall_ea

    :try_start_2e
    instance-of v8, v5, Ljava/net/HttpURLConnection;

    if-eqz v8, :cond_39

    move-object v8, v5

    check-cast v8, Ljava/net/HttpURLConnection;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    :cond_39
    const-string v8, "POST"

    instance-of v9, v5, Ljava/net/HttpURLConnection;

    if-eqz v9, :cond_dc

    move-object v9, v5

    check-cast v9, Ljava/net/HttpURLConnection;

    invoke-virtual {v9, v8}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 v8, 0x1

    invoke-virtual {v5, v8}, Ljava/net/URLConnection;->setDoOutput(Z)V

    const-string v9, "Content-Type"

    const-string v10, "application/x-osp"

    invoke-virtual {v5, v9, v10}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v9, "Content-Length"

    array-length v10, p1

    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v5, v9, v10}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_7b

    const-string v9, "authorization"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v2, Lctf;->e:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-static {v1, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v5, v9, v1}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7b
    invoke-virtual {v6}, Lqhi;->a()V
    :try_end_7e
    .catch Ljava/io/IOException; {:try_start_2e .. :try_end_7e} :catch_e5
    .catchall {:try_start_2e .. :try_end_7e} :catchall_e2

    :try_start_7e
    invoke-virtual {v7}, Ljava/net/URLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1
    :try_end_82
    .catch Ljava/io/IOException; {:try_start_7e .. :try_end_82} :catch_da
    .catch Ljava/lang/NullPointerException; {:try_start_7e .. :try_end_82} :catch_88
    .catchall {:try_start_7e .. :try_end_82} :catchall_83

    goto :goto_8d

    :catchall_83
    move-exception v1

    :try_start_84
    invoke-static {v1}, Lt3p;->r(Ljava/lang/Throwable;)V

    goto :goto_8c

    :catch_88
    move-exception v1

    invoke-static {v1}, Lt3p;->r(Ljava/lang/Throwable;)V
    :try_end_8c
    .catch Ljava/io/IOException; {:try_start_84 .. :try_end_8c} :catch_e5
    .catchall {:try_start_84 .. :try_end_8c} :catchall_e2

    :goto_8c
    move-object v1, v3

    :goto_8d
    :try_start_8d
    invoke-virtual {v1, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_90
    .catch Ljava/io/IOException; {:try_start_8d .. :try_end_90} :catch_fa
    .catchall {:try_start_8d .. :try_end_90} :catchall_d8

    :try_start_90
    invoke-virtual {v6}, Lqhi;->c()Ljava/io/InputStream;

    move-result-object p1
    :try_end_94
    .catch Ljava/io/IOException; {:try_start_90 .. :try_end_94} :catch_96
    .catchall {:try_start_90 .. :try_end_94} :catchall_d8

    move-object v3, p1

    goto :goto_a8

    :catch_96
    :try_start_96
    instance-of p1, v7, Ljava/net/HttpURLConnection;

    if-eqz p1, :cond_a8

    invoke-virtual {v6}, Lqhi;->a()V
    :try_end_9d
    .catch Ljava/io/IOException; {:try_start_96 .. :try_end_9d} :catch_fa
    .catchall {:try_start_96 .. :try_end_9d} :catchall_d8

    :try_start_9d
    check-cast v7, Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v3
    :try_end_a3
    .catchall {:try_start_9d .. :try_end_a3} :catchall_a4

    goto :goto_a8

    :catchall_a4
    move-exception p1

    :try_start_a5
    invoke-static {p1}, Lt3p;->r(Ljava/lang/Throwable;)V

    :cond_a8
    :goto_a8
    if-eqz v3, :cond_ce

    new-instance p1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    invoke-static {v3, p1}, Lxvg;->n(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-virtual {v6}, Lqhi;->d()I

    move-result v2

    invoke-virtual {p1}, Ljava/io/ByteArrayOutputStream;->toString()Ljava/lang/String;

    move-result-object p1

    iput v2, p0, Lctf;->d:I

    div-int/lit8 v2, v2, 0x64

    if-eq v2, v4, :cond_c3

    const/4 p0, 0x3

    :goto_c1
    move v4, p0

    goto :goto_ce

    :cond_c3
    if-eqz v0, :cond_cd

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0
    :try_end_c9
    .catch Ljava/io/IOException; {:try_start_a5 .. :try_end_c9} :catch_fa
    .catchall {:try_start_a5 .. :try_end_c9} :catchall_d8

    if-nez p0, :cond_cd

    const/4 p0, 0x5

    goto :goto_c1

    :cond_cd
    move v4, v8

    :cond_ce
    :goto_ce
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    :cond_d4
    invoke-virtual {v6}, Lqhi;->b()V

    goto :goto_102

    :catchall_d8
    move-exception p0

    goto :goto_ec

    :catch_da
    move-exception p0

    :try_start_db
    throw p0

    :cond_dc
    new-instance p0, Ljava/net/ProtocolException;

    invoke-direct {p0}, Ljava/net/ProtocolException;-><init>()V

    throw p0
    :try_end_e2
    .catch Ljava/io/IOException; {:try_start_db .. :try_end_e2} :catch_e5
    .catchall {:try_start_db .. :try_end_e2} :catchall_e2

    :catchall_e2
    move-exception p0

    move-object v1, v3

    goto :goto_ec

    :catch_e5
    move-object v1, v3

    goto :goto_fa

    :goto_e7
    move-object v1, v3

    move-object v6, v1

    goto :goto_ec

    :catchall_ea
    move-exception p0

    goto :goto_e7

    :goto_ec
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    if-eqz v6, :cond_f7

    invoke-virtual {v6}, Lqhi;->b()V

    :cond_f7
    throw p0

    :catch_f8
    move-object v1, v3

    move-object v6, v1

    :catch_fa
    :goto_fa
    invoke-static {v3}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    if-nez v6, :cond_d4

    :goto_102
    return v4

    :catch_103
    const/4 p0, 0x6

    return p0
.end method
