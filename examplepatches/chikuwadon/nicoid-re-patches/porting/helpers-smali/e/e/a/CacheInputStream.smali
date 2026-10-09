.class public final Le/e/a/CacheInputStream;
.super Ljava/io/FileInputStream;
.source "CacheInputStream.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/CacheInputStream$Opened;
    }
.end annotation


# static fields
.field private static final opening:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Le/e/a/CacheInputStream$Opened;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final descriptor:Landroid/os/ParcelFileDescriptor;

.field private remaining:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 6
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Le/e/a/CacheInputStream;->opening:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .registers 6
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 12
    invoke-static {p1}, Le/e/a/CacheInputStream;->open(Ljava/io/File;)Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 7
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    .line 12
    sget-object v0, Le/e/a/CacheInputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/CacheInputStream$Opened;

    .local v0, "o":Le/e/a/CacheInputStream$Opened;
    sget-object v1, Le/e/a/CacheInputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->remove()V

    iget-object v1, v0, Le/e/a/CacheInputStream$Opened;->descriptor:Landroid/os/ParcelFileDescriptor;

    iput-object v1, p0, Le/e/a/CacheInputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    iget-object v1, v0, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    if-eqz v1, :cond_42

    :try_start_20
    invoke-virtual {p0}, Le/e/a/CacheInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    iget-object v2, v0, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    iget-wide v2, v2, Le/e/a/CachePackIndex$Entry;->offset:J

    invoke-virtual {v1, v2, v3}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    iget-object v1, v0, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    iget-wide v1, v1, Le/e/a/CachePackIndex$Entry;->size:J

    iput-wide v1, p0, Le/e/a/CacheInputStream;->remaining:J
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_31} :catch_32

    goto :goto_42

    :catch_32
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    :try_start_33
    iget-object v2, p0, Le/e/a/CacheInputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v2}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_38} :catch_39

    goto :goto_3a

    :catch_39
    move-exception v2

    :goto_3a
    new-instance v2, Ljava/io/FileNotFoundException;

    const-string v3, "Cache container is not seekable"

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v2

    .end local v1    # "e":Ljava/io/IOException;
    :cond_42
    :goto_42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "path"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 13
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    return-void
.end method

.method private static open(Ljava/io/File;)Ljava/io/FileDescriptor;
    .registers 5
    .param p0, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 8
    new-instance v0, Le/e/a/CacheInputStream$Opened;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/CacheInputStream$Opened;-><init>(Le/e/a/CacheInputStream$1;)V

    .line 9
    .local v0, "o":Le/e/a/CacheInputStream$Opened;
    :try_start_6
    invoke-static {p0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_19

    invoke-static {p0, v2}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_19

    invoke-static {p0}, Le/e/a/CachePack;->entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    .line 10
    :cond_19
    iget-object v1, v0, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    if-nez v1, :cond_1f

    move-object v1, p0

    goto :goto_23

    :cond_1f
    invoke-static {p0}, Le/e/a/CachePack;->archive(Ljava/io/File;)Ljava/io/File;

    move-result-object v1

    :goto_23
    invoke-static {v1, v2, v2}, Le/e/a/CacheFolders;->open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CacheInputStream$Opened;->descriptor:Landroid/os/ParcelFileDescriptor;

    sget-object v1, Le/e/a/CacheInputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    iget-object v1, v0, Le/e/a/CacheInputStream$Opened;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v1
    :try_end_34
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_34} :catch_35

    return-object v1

    .line 11
    :catch_35
    move-exception v1

    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Ljava/io/FileNotFoundException;

    invoke-virtual {v1}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .local v2, "x":Ljava/io/FileNotFoundException;
    invoke-virtual {v2, v1}, Ljava/io/FileNotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v2
.end method


# virtual methods
.method public available()I
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    iget-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gez v4, :cond_d

    invoke-super {p0}, Ljava/io/FileInputStream;->available()I

    move-result v0

    goto :goto_17

    :cond_d
    const-wide/32 v0, 0x7fffffff

    iget-wide v2, p0, Le/e/a/CacheInputStream;->remaining:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v0, v0

    :goto_17
    return v0
.end method

.method public close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    :try_start_0
    invoke-super {p0}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_9

    iget-object v0, p0, Le/e/a/CacheInputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V

    return-void

    :catchall_9
    move-exception v0

    iget-object v1, p0, Le/e/a/CacheInputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {v1}, Landroid/os/ParcelFileDescriptor;->close()V

    throw v0
.end method

.method public read()I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    iget-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_a

    const/4 v0, -0x1

    return v0

    :cond_a
    invoke-super {p0}, Ljava/io/FileInputStream;->read()I

    move-result v0

    .local v0, "n":I
    if-ltz v0, :cond_1d

    iget-wide v4, p0, Le/e/a/CacheInputStream;->remaining:J

    cmp-long v1, v4, v2

    if-lez v1, :cond_1d

    iget-wide v1, p0, Le/e/a/CacheInputStream;->remaining:J

    const-wide/16 v3, 0x1

    sub-long/2addr v1, v3

    iput-wide v1, p0, Le/e/a/CacheInputStream;->remaining:J

    :cond_1d
    return v0
.end method

.method public read([B)I
    .registers 4
    .param p1, "b"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Le/e/a/CacheInputStream;->read([BII)I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .registers 10
    .param p1, "b"    # [B
    .param p2, "off"    # I
    .param p3, "len"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    if-nez p3, :cond_4

    const/4 v0, 0x0

    return v0

    :cond_4
    iget-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_e

    const/4 v0, -0x1

    return v0

    :cond_e
    iget-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_16

    move v1, p3

    goto :goto_1e

    :cond_16
    int-to-long v0, p3

    iget-wide v4, p0, Le/e/a/CacheInputStream;->remaining:J

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int v1, v0

    :goto_1e
    invoke-super {p0, p1, p2, v1}, Ljava/io/FileInputStream;->read([BII)I

    move-result v0

    .local v0, "n":I
    if-lez v0, :cond_30

    iget-wide v4, p0, Le/e/a/CacheInputStream;->remaining:J

    cmp-long v1, v4, v2

    if-lez v1, :cond_30

    iget-wide v1, p0, Le/e/a/CacheInputStream;->remaining:J

    int-to-long v3, v0

    sub-long/2addr v1, v3

    iput-wide v1, p0, Le/e/a/CacheInputStream;->remaining:J

    :cond_30
    return v0
.end method

.method public skip(J)J
    .registers 10
    .param p1, "n"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 17
    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_7

    return-wide v0

    :cond_7
    iget-wide v2, p0, Le/e/a/CacheInputStream;->remaining:J

    cmp-long v4, v2, v0

    if-gez v4, :cond_f

    move-wide v2, p1

    goto :goto_15

    :cond_f
    iget-wide v2, p0, Le/e/a/CacheInputStream;->remaining:J

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    :goto_15
    invoke-super {p0, v2, v3}, Ljava/io/FileInputStream;->skip(J)J

    move-result-wide v2

    .local v2, "skipped":J
    iget-wide v4, p0, Le/e/a/CacheInputStream;->remaining:J

    cmp-long v6, v4, v0

    if-ltz v6, :cond_24

    iget-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    sub-long/2addr v0, v2

    iput-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    :cond_24
    return-wide v2
.end method
