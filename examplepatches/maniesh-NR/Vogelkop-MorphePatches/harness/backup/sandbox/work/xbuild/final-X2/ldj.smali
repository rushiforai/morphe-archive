.class public final Lldj;
.super Landroid/os/AsyncTask;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:[B

.field public final synthetic d:Lcom/opera/api/Callback;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;[BLcom/opera/api/Callback;)V
    .registers 5

    iput-object p1, p0, Lldj;->a:Landroid/content/Context;

    iput-object p2, p0, Lldj;->b:Ljava/lang/String;

    iput-object p3, p0, Lldj;->c:[B

    iput-object p4, p0, Lldj;->d:Lcom/opera/api/Callback;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public final doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    check-cast p1, [Ljava/lang/Void;

    const/4 p1, 0x0

    :try_start_3
    iget-object v0, p0, Lldj;->a:Landroid/content/Context;

    const-string v1, ""

    iget-object v2, p0, Lldj;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Ln1h;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-nez v0, :cond_10

    return-object p1

    :cond_10
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_15
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_15} :catch_2c
    .catchall {:try_start_3 .. :try_end_15} :catchall_27

    :try_start_15
    iget-object p0, p0, Lldj;->c:[B

    invoke-virtual {v1, p0}, Ljava/io/FileOutputStream;->write([B)V

    invoke-virtual {v1}, Ljava/io/OutputStream;->flush()V

    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_20
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_20} :catch_2d
    .catchall {:try_start_15 .. :try_end_20} :catchall_24

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object v0

    :catchall_24
    move-exception p0

    move-object p1, v1

    goto :goto_28

    :catchall_27
    move-exception p0

    :goto_28
    invoke-static {p1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_2c
    move-object v1, p1

    :catch_2d
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    return-object p1
.end method

.method public final onPostExecute(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Ljava/io/File;

    if-nez p1, :cond_6

    const/4 p1, 0x0

    goto :goto_a

    :cond_6
    invoke-static {p1}, Lw7d;->x(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    :goto_a
    iget-object p0, p0, Lldj;->d:Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method
