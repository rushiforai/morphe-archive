.class public final Lmji;
.super Landroid/print/b;
.source "SourceFile"


# instance fields
.field public final synthetic a:Landroid/os/ParcelFileDescriptor;

.field public final synthetic b:Lqji;


# direct methods
.method public constructor <init>(Lqji;Landroid/os/ParcelFileDescriptor;)V
    .registers 3

    invoke-direct {p0}, Landroid/print/b;-><init>()V

    iput-object p2, p0, Lmji;->a:Landroid/os/ParcelFileDescriptor;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lmji;->b:Lqji;

    return-void
.end method


# virtual methods
.method public final onWriteCancelled()V
    .registers 3

    iget-object v0, p0, Lmji;->b:Lqji;

    iget-object v1, v0, Lqji;->i:Lmji;

    if-ne p0, v1, :cond_a

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lqji;->d(Ljava/lang/CharSequence;)V

    :cond_a
    return-void
.end method

.method public final onWriteFailed(Ljava/lang/CharSequence;)V
    .registers 4

    iget-object v0, p0, Lmji;->b:Lqji;

    iget-object v1, v0, Lqji;->i:Lmji;

    if-ne p0, v1, :cond_9

    invoke-virtual {v0, p1}, Lqji;->d(Ljava/lang/CharSequence;)V

    :cond_9
    return-void
.end method

.method public final onWriteFinished([Landroid/print/PageRange;)V
    .registers 7

    iget-object v0, p0, Lmji;->b:Lqji;

    iget-object v1, v0, Lqji;->i:Lmji;

    if-ne p0, v1, :cond_4c

    iget-object p0, p0, Lmji;->a:Landroid/os/ParcelFileDescriptor;

    const/4 v1, 0x0

    :try_start_9
    new-instance v2, Ljava/io/FileInputStream;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V
    :try_end_12
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_12} :catch_26
    .catchall {:try_start_9 .. :try_end_12} :catchall_21

    :try_start_12
    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v3
    :try_end_1a
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_1a} :catch_27
    .catchall {:try_start_12 .. :try_end_1a} :catchall_1e

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_2c

    :catchall_1e
    move-exception p0

    move-object v1, v2

    goto :goto_22

    :catchall_21
    move-exception p0

    :goto_22
    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_26
    move-object v2, v1

    :catch_27
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    const-wide/16 v3, 0x0

    :goto_2c
    iput-wide v3, v0, Lqji;->o:J

    iput-object p1, v0, Lqji;->p:[Landroid/print/PageRange;

    iput-object v1, v0, Lqji;->i:Lmji;

    iget-boolean p0, v0, Lqji;->n:Z

    if-eqz p0, :cond_3f

    const/4 p0, 0x0

    iput-boolean p0, v0, Lqji;->n:Z

    iget-object p0, v0, Lqji;->e:Landroid/print/PrintAttributes;

    invoke-virtual {v0, p0}, Lqji;->g(Landroid/print/PrintAttributes;)V

    goto :goto_4c

    :cond_3f
    iget-object p0, v0, Lqji;->k:Lpji;

    iput-object v1, v0, Lqji;->k:Lpji;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lqji;->f(I)V

    if-eqz p0, :cond_4c

    invoke-interface {p0, p1}, Lpji;->f([Landroid/print/PageRange;)V

    :cond_4c
    :goto_4c
    return-void
.end method
