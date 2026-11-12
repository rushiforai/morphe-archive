.class public final Lorg/chromium/components/download/InMemoryDownloadFile;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/io/FileOutputStream;

.field public final b:Landroid/os/ParcelFileDescriptor;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/system/Os;->memfd_create(Ljava/lang/String;I)Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-static {p1}, Landroid/os/ParcelFileDescriptor;->dup(Ljava/io/FileDescriptor;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    iput-object v0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->b:Landroid/os/ParcelFileDescriptor;

    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    iput-object v0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->a:Ljava/io/FileOutputStream;

    return-void
.end method

.method public static createFile(Ljava/lang/String;)Lorg/chromium/components/download/InMemoryDownloadFile;
    .registers 2

    :try_start_0
    new-instance v0, Lorg/chromium/components/download/InMemoryDownloadFile;

    invoke-direct {v0, p0}, Lorg/chromium/components/download/InMemoryDownloadFile;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_6

    return-object v0

    :catch_6
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final destroy()V
    .registers 2

    :try_start_0
    iget-object v0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->a:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    :cond_7
    iget-object p0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->b:Landroid/os/ParcelFileDescriptor;

    if-eqz p0, :cond_e

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_e} :catch_e

    :catch_e
    :cond_e
    return-void
.end method

.method public final finish()V
    .registers 2

    :try_start_0
    iget-object v0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->a:Ljava/io/FileOutputStream;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->a:Ljava/io/FileOutputStream;

    :cond_a
    iget-object p0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->b:Landroid/os/ParcelFileDescriptor;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->detachFd()I
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_11

    :catch_11
    :cond_11
    return-void
.end method

.method public final getFd()I
    .registers 1

    iget-object p0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->b:Landroid/os/ParcelFileDescriptor;

    if-eqz p0, :cond_9

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFd()I

    move-result p0

    return p0

    :cond_9
    const/4 p0, 0x0

    return p0
.end method

.method public final writeData([B)V
    .registers 2

    :try_start_0
    iget-object p0, p0, Lorg/chromium/components/download/InMemoryDownloadFile;->a:Ljava/io/FileOutputStream;

    invoke-virtual {p0, p1}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_5} :catch_5

    :catch_5
    return-void
.end method
