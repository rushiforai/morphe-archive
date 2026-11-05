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

.field private final file:Ljava/io/File;


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
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 8
    invoke-static {p1, p2}, Le/e/a/CacheOutputStream;->open(Ljava/io/File;Z)Ljava/io/FileDescriptor;

    move-result-object p2

    invoke-direct {p0, p2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/FileDescriptor;)V

    iput-object p1, p0, Le/e/a/CacheOutputStream;->file:Ljava/io/File;

    sget-object p1, Le/e/a/CacheOutputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/ParcelFileDescriptor;

    iput-object p1, p0, Le/e/a/CacheOutputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    sget-object p1, Le/e/a/CacheOutputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->remove()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 10
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-direct {p0, v0, p1}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 4
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
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 7
    const/4 v0, 0x1

    invoke-static {p0, v0, p1}, Le/e/a/CacheFolders;->open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    sget-object p1, Le/e/a/CacheOutputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {p1, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p0

    return-object p0
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
    .catchall {:try_start_0 .. :try_end_3} :catchall_15

    :try_start_3
    iget-object v0, p0, Le/e/a/CacheOutputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_8
    .catchall {:try_start_3 .. :try_end_8} :catchall_e

    iget-object v0, p0, Le/e/a/CacheOutputStream;->file:Ljava/io/File;

    invoke-static {v0}, Le/e/a/CacheFolders;->changed(Ljava/io/File;)V

    return-void

    :catchall_e
    move-exception v0

    iget-object v1, p0, Le/e/a/CacheOutputStream;->file:Ljava/io/File;

    invoke-static {v1}, Le/e/a/CacheFolders;->changed(Ljava/io/File;)V

    throw v0

    :catchall_15
    move-exception v0

    :try_start_16
    iget-object v1, p0, Le/e/a/CacheOutputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_1b
    .catchall {:try_start_16 .. :try_end_1b} :catchall_21

    iget-object v1, p0, Le/e/a/CacheOutputStream;->file:Ljava/io/File;

    invoke-static {v1}, Le/e/a/CacheFolders;->changed(Ljava/io/File;)V

    throw v0

    :catchall_21
    move-exception v0

    iget-object v1, p0, Le/e/a/CacheOutputStream;->file:Ljava/io/File;

    invoke-static {v1}, Le/e/a/CacheFolders;->changed(Ljava/io/File;)V

    throw v0
.end method
