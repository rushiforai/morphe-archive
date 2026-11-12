.class public final Lzyn;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final synthetic a:I

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .registers 3

    iput p1, p0, Lzyn;->a:I

    iput-object p2, p0, Lzyn;->b:Ljava/lang/String;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6

    check-cast p1, [Ljava/lang/Void;

    const/4 p1, 0x0

    :try_start_3
    new-instance v0, Ljava/net/Socket;

    const-string v1, "127.0.0.1"

    iget v2, p0, Lzyn;->a:I

    invoke-direct {v0, v1, v2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_c} :catch_51
    .catchall {:try_start_3 .. :try_end_c} :catchall_42

    :try_start_c
    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_10} :catch_3f
    .catchall {:try_start_c .. :try_end_10} :catchall_3c

    :try_start_10
    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v2

    const/16 v3, 0xff

    if-ne v2, v3, :cond_2f

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v2

    if-nez v2, :cond_2f

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2
    :try_end_22
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_22} :catch_3a
    .catchall {:try_start_10 .. :try_end_22} :catchall_37

    :try_start_22
    iget-object p0, p0, Lzyn;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/io/OutputStream;->write([B)V
    :try_end_2b
    .catch Ljava/io/IOException; {:try_start_22 .. :try_end_2b} :catch_54
    .catchall {:try_start_22 .. :try_end_2b} :catchall_2c

    goto :goto_30

    :catchall_2c
    move-exception p0

    :goto_2d
    move-object p1, v1

    goto :goto_45

    :cond_2f
    move-object v2, p1

    :goto_30
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_5c

    :catchall_37
    move-exception p0

    move-object v2, p1

    goto :goto_2d

    :catch_3a
    move-object v2, p1

    goto :goto_54

    :catchall_3c
    move-exception p0

    move-object v2, p1

    goto :goto_45

    :catch_3f
    move-object v1, p1

    :goto_40
    move-object v2, v1

    goto :goto_54

    :catchall_42
    move-exception p0

    move-object v0, p1

    move-object v2, v0

    :goto_45
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    if-eqz v0, :cond_50

    :try_start_4d
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_50
    .catch Ljava/io/IOException; {:try_start_4d .. :try_end_50} :catch_50

    :catch_50
    :cond_50
    throw p0

    :catch_51
    move-object v0, p1

    move-object v1, v0

    goto :goto_40

    :catch_54
    :goto_54
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    if-eqz v0, :cond_5f

    :goto_5c
    :try_start_5c
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_5f
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_5f} :catch_5f

    :catch_5f
    :cond_5f
    return-object p1
.end method
