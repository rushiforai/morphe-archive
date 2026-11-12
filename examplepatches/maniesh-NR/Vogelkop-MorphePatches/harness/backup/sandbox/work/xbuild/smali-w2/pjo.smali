.class public final Lpjo;
.super Lljo;
.source "SourceFile"


# instance fields
.field public final b:Ljava/util/ArrayList;

.field public final c:Ljava/util/concurrent/Semaphore;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/Semaphore;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/Semaphore;-><init>(I)V

    iput-object v0, p0, Lpjo;->c:Ljava/util/concurrent/Semaphore;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lpjo;->b:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final b(Ljava/net/URLConnection;Ljro;Ljava/io/File;)V
    .registers 13

    iget-object v4, p2, Ljro;->e:Lwci;

    const/4 v7, 0x0

    :try_start_3
    invoke-static {p1, p2}, Lljo;->a(Ljava/net/URLConnection;Ljro;)V

    move-object p2, p1

    check-cast p2, Ljava/net/HttpURLConnection;

    invoke-virtual {p2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p2
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_d} :catch_c3
    .catchall {:try_start_3 .. :try_end_d} :catchall_c0

    const/16 v0, 0xc8

    if-ne p2, v0, :cond_70

    :try_start_11
    invoke-virtual {p1}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_15} :catch_69
    .catchall {:try_start_11 .. :try_end_15} :catchall_c0

    :try_start_15
    invoke-virtual {p1}, Ljava/net/URLConnection;->getContentLength()I

    move-result v0

    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1e
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_1e} :catch_62
    .catchall {:try_start_15 .. :try_end_1e} :catchall_5d

    :try_start_1e
    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v3, Lttn;

    const/16 v5, 0x8

    invoke-direct {v3, v4, v5}, Lttn;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3}, Lgxo;->c(Ljava/lang/Runnable;)V

    const/16 v3, 0x1000

    new-array v3, v3, [B

    :goto_2f
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_3b

    const/4 v6, 0x0

    invoke-virtual {v2, v3, v6, v5}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_2f

    :cond_3b
    invoke-virtual {p3}, Ljava/io/File;->length()J

    move-result-wide v5

    int-to-long v7, v0

    cmp-long v3, v5, v7

    if-eqz v3, :cond_46

    if-nez v0, :cond_4e

    :cond_46
    new-instance v0, Lfmn;

    invoke-direct {v0, v4, p3, p2}, Lfmn;-><init>(Lwci;Ljava/io/File;I)V

    invoke-static {v0}, Lgxo;->c(Ljava/lang/Runnable;)V
    :try_end_4e
    .catch Ljava/io/IOException; {:try_start_1e .. :try_end_4e} :catch_55
    .catchall {:try_start_1e .. :try_end_4e} :catchall_51

    :cond_4e
    move-object v7, v2

    goto/16 :goto_a6

    :catchall_51
    move-exception v0

    move-object p0, v0

    goto/16 :goto_fb

    :catch_55
    move-exception v0

    move-object p2, v0

    move-object v7, v1

    move-object v1, p0

    move-object p0, v2

    move-object v2, p3

    goto/16 :goto_ca

    :catchall_5d
    move-exception v0

    move-object p0, v0

    move-object v8, v1

    goto/16 :goto_f9

    :catch_62
    move-exception v0

    move-object p2, v0

    move-object v2, p3

    move-object v8, v1

    move-object v1, p0

    goto/16 :goto_c8

    :catch_69
    move-exception v0

    move-object p2, v0

    move-object v1, p0

    move-object v2, p3

    :goto_6d
    move-object v8, v7

    goto/16 :goto_c8

    :cond_70
    :try_start_70
    move-object v0, p1

    check-cast v0, Ljava/net/HttpURLConnection;

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v8
    :try_end_77
    .catch Ljava/io/IOException; {:try_start_70 .. :try_end_77} :catch_c3
    .catchall {:try_start_70 .. :try_end_77} :catchall_c0

    if-nez v8, :cond_81

    :try_start_79
    const-string v0, ""
    :try_end_7b
    .catch Ljava/io/IOException; {:try_start_79 .. :try_end_7b} :catch_7c
    .catchall {:try_start_79 .. :try_end_7b} :catchall_b4

    goto :goto_85

    :catch_7c
    move-exception v0

    move-object p2, v0

    move-object v1, p0

    move-object v2, p3

    goto :goto_c8

    :cond_81
    :try_start_81
    invoke-static {v8}, Ldyg;->c(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v0

    :goto_85
    move-object v5, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "-"

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v0, Lbu3;
    :try_end_9c
    .catch Ljava/io/IOException; {:try_start_81 .. :try_end_9c} :catch_b7
    .catchall {:try_start_81 .. :try_end_9c} :catchall_b4

    const/4 v6, 0x0

    move-object v1, p0

    move-object v2, p3

    :try_start_9f
    invoke-direct/range {v0 .. v6}, Lbu3;-><init>(Lpjo;Ljava/io/File;Ljava/lang/String;Lwci;Ljava/lang/String;Z)V

    invoke-static {v0}, Lgxo;->c(Ljava/lang/Runnable;)V
    :try_end_a5
    .catch Ljava/io/IOException; {:try_start_9f .. :try_end_a5} :catch_b0
    .catchall {:try_start_9f .. :try_end_a5} :catchall_b4

    move-object v1, v8

    :goto_a6
    invoke-static {p1}, Lhn9;->f(Ljava/net/URLConnection;)V

    invoke-static {v7}, Lr9h;->l(Ljava/io/Closeable;)V

    invoke-static {v1}, Lr9h;->l(Ljava/io/Closeable;)V

    return-void

    :catch_b0
    move-exception v0

    goto :goto_ba

    :goto_b2
    move-object p2, p0

    goto :goto_c8

    :catchall_b4
    move-exception v0

    move-object p0, v0

    goto :goto_f9

    :catch_b7
    move-exception v0

    move-object v1, p0

    move-object v2, p3

    :goto_ba
    move-object p0, v0

    goto :goto_b2

    :goto_bc
    move-object v8, v7

    goto :goto_f9

    :goto_be
    move-object p2, p0

    goto :goto_6d

    :catchall_c0
    move-exception v0

    move-object p0, v0

    goto :goto_bc

    :catch_c3
    move-exception v0

    move-object v1, p0

    move-object v2, p3

    move-object p0, v0

    goto :goto_be

    :goto_c8
    move-object p0, v7

    move-object v7, v8

    :goto_ca
    :try_start_ca
    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v5

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "exception\uff1a"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v0, Lbu3;

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v6}, Lbu3;-><init>(Lpjo;Ljava/io/File;Ljava/lang/String;Lwci;Ljava/lang/String;Z)V

    invoke-static {v0}, Lgxo;->c(Ljava/lang/Runnable;)V
    :try_end_e8
    .catchall {:try_start_ca .. :try_end_e8} :catchall_f6

    invoke-static {p1}, Lhn9;->f(Ljava/net/URLConnection;)V

    invoke-static {p0}, Lr9h;->l(Ljava/io/Closeable;)V

    invoke-static {v7}, Lr9h;->l(Ljava/io/Closeable;)V

    return-void

    :goto_f2
    move-object v8, v7

    move-object v7, p0

    move-object p0, p2

    goto :goto_f9

    :catchall_f6
    move-exception v0

    move-object p2, v0

    goto :goto_f2

    :goto_f9
    move-object v2, v7

    move-object v1, v8

    :goto_fb
    invoke-static {p1}, Lhn9;->f(Ljava/net/URLConnection;)V

    invoke-static {v2}, Lr9h;->l(Ljava/io/Closeable;)V

    invoke-static {v1}, Lr9h;->l(Ljava/io/Closeable;)V

    throw p0
.end method
