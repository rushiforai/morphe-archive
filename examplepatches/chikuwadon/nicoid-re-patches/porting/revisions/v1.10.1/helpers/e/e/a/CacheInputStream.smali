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
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 12
    invoke-static {p1}, Le/e/a/CacheInputStream;->open(Ljava/io/File;)Ljava/io/FileDescriptor;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/FileDescriptor;)V

    .line 7
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    .line 12
    sget-object p1, Le/e/a/CacheInputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le/e/a/CacheInputStream$Opened;

    sget-object v0, Le/e/a/CacheInputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    iget-object v0, p1, Le/e/a/CacheInputStream$Opened;->descriptor:Landroid/os/ParcelFileDescriptor;

    iput-object v0, p0, Le/e/a/CacheInputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    iget-object v0, p1, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    if-eqz v0, :cond_42

    :try_start_20
    invoke-virtual {p0}, Le/e/a/CacheInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iget-object v1, p1, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    iget-wide v1, v1, Le/e/a/CachePackIndex$Entry;->offset:J

    invoke-virtual {v0, v1, v2}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    iget-object p1, p1, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    iget-wide v0, p1, Le/e/a/CachePackIndex$Entry;->size:J

    iput-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J
    :try_end_31
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_31} :catch_32

    goto :goto_42

    :catch_32
    move-exception p1

    :try_start_33
    iget-object p1, p0, Le/e/a/CacheInputStream;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {p1}, Landroid/os/ParcelFileDescriptor;->close()V
    :try_end_38
    .catch Ljava/io/IOException; {:try_start_33 .. :try_end_38} :catch_39

    goto :goto_3a

    :catch_39
    move-exception p1

    :goto_3a
    new-instance p1, Ljava/io/FileNotFoundException;

    const-string v0, "Cache container is not seekable"

    invoke-direct {p1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_42
    :goto_42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
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
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 8
    new-instance v0, Le/e/a/CacheInputStream$Opened;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Le/e/a/CacheInputStream$Opened;-><init>(Le/e/a/CacheInputStream$Opened;)V

    .line 9
    :try_start_6
    invoke-static {p0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_14

    invoke-static {p0, v2}, Le/e/a/CacheFolders;->document(Ljava/io/File;Z)Landroid/net/Uri;

    move-result-object v1

    if-nez v1, :cond_2a

    :goto_13
    goto :goto_24

    :cond_14
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2a

    goto :goto_13

    :goto_24
    invoke-static {p0}, Le/e/a/CachePack;->entry(Ljava/io/File;)Le/e/a/CachePackIndex$Entry;

    move-result-object v1

    iput-object v1, v0, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    .line 10
    :cond_2a
    iget-object v1, v0, Le/e/a/CacheInputStream$Opened;->entry:Le/e/a/CachePackIndex$Entry;

    if-nez v1, :cond_2f

    goto :goto_33

    :cond_2f
    invoke-static {p0}, Le/e/a/CachePack;->archive(Ljava/io/File;)Ljava/io/File;

    move-result-object p0

    :goto_33
    invoke-static {p0, v2, v2}, Le/e/a/CacheFolders;->open(Ljava/io/File;ZZ)Landroid/os/ParcelFileDescriptor;

    move-result-object p0

    iput-object p0, v0, Le/e/a/CacheInputStream$Opened;->descriptor:Landroid/os/ParcelFileDescriptor;

    sget-object p0, Le/e/a/CacheInputStream;->opening:Ljava/lang/ThreadLocal;

    invoke-virtual {p0, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    iget-object p0, v0, Le/e/a/CacheInputStream$Opened;->descriptor:Landroid/os/ParcelFileDescriptor;

    invoke-virtual {p0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object p0
    :try_end_44
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_44} :catch_45

    return-object p0

    .line 11
    :catch_45
    move-exception p0

    new-instance v0, Ljava/io/FileNotFoundException;

    invoke-virtual {p0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/io/FileNotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v0
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
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    const/4 v0, 0x0

    array-length v1, p1

    invoke-virtual {p0, p1, v0, v1}, Le/e/a/CacheInputStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    if-nez p3, :cond_4

    const/4 p1, 0x0

    return p1

    :cond_4
    iget-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_e

    const/4 p1, -0x1

    return p1

    :cond_e
    iget-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_15

    goto :goto_1d

    :cond_15
    int-to-long v0, p3

    iget-wide v4, p0, Le/e/a/CacheInputStream;->remaining:J

    invoke-static {v0, v1, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p3, v0

    :goto_1d
    invoke-super {p0, p1, p2, p3}, Ljava/io/FileInputStream;->read([BII)I

    move-result p1

    if-lez p1, :cond_2f

    iget-wide p2, p0, Le/e/a/CacheInputStream;->remaining:J

    cmp-long v0, p2, v2

    if-lez v0, :cond_2f

    iget-wide p2, p0, Le/e/a/CacheInputStream;->remaining:J

    int-to-long v0, p1

    sub-long/2addr p2, v0

    iput-wide p2, p0, Le/e/a/CacheInputStream;->remaining:J

    :cond_2f
    return p1
.end method

.method public skip(J)J
    .registers 8
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

    if-gez v4, :cond_e

    goto :goto_14

    :cond_e
    iget-wide v2, p0, Le/e/a/CacheInputStream;->remaining:J

    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    :goto_14
    invoke-super {p0, p1, p2}, Ljava/io/FileInputStream;->skip(J)J

    move-result-wide p1

    iget-wide v2, p0, Le/e/a/CacheInputStream;->remaining:J

    cmp-long v4, v2, v0

    if-ltz v4, :cond_23

    iget-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    sub-long/2addr v0, p1

    iput-wide v0, p0, Le/e/a/CacheInputStream;->remaining:J

    :cond_23
    return-wide p1
.end method
