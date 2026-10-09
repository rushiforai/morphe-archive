.class public final Le/e/a/CacheOutputStream;
.super Ljava/io/FileOutputStream;
.source "CacheOutputStream.java"


# static fields
.field private static final opening:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/os/ParcelFileDescriptor;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final descriptor:Landroid/os/ParcelFileDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 5
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/CacheOutputStream;->opening:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 9
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Z)V
    .registers 4
    .param p1, "file"    # Ljava/io/File;
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 8
    invoke-static {p1, p2}, Le/e/a/CacheOutputStream;->open(Ljava/io/File;Z)Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    sget-object v0, Le/e/a/CacheOutputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Le/e/a/CacheOutputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    sget-object v0, Le/e/a/CacheOutputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 10
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 4
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 11
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    return-void
.end method

.method private static open(Ljava/io/File;Z)Ljava/io/FileDescriptor;
    .registers 4
    .param p0, "file"    # Ljava/io/File;
    .param p1, "append"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 7
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Le/e/a/CacheFolders;->open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .local v0, "fd":Landroid/os/ParcelFileDescriptor;
    sget-object v1, Le/e/a/CacheOutputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1

    return-object v1
.end method


# virtual methods
.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    :try_start_0
    invoke-super {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_9

    iget-object v0, p0, Le/e/a/CacheOutputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V

    return-void

    :catchall_9
    move-exception v0

    iget-object v1, p0, Le/e/a/CacheOutputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V

    throw v0
.end method
