.class public final Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation


# instance fields
.field private committed:Z

.field private final entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

.field final synthetic this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

.field private final written:[Z


# direct methods
.method private constructor <init>(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

    .line 7
    .line 8
    invoke-static {p2}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;->access$600(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;)Z

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    if-eqz p2, :cond_0

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->access$1800(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    new-array p1, p1, [Z

    .line 21
    .line 22
    :goto_0
    iput-object p1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->written:[Z

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$1;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;-><init>(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;)V

    return-void
.end method

.method public static synthetic access$1400(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;)Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1500(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;)[Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->written:[Z

    .line 2
    .line 3
    return-object p0
.end method

.method private newInputStream(I)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;->access$700(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;)Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-ne v1, p0, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;->access$600(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    return-object v2

    .line 23
    :catchall_0
    move-exception p0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    :try_start_1
    new-instance v1, Ljava/io/FileInputStream;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    :try_start_2
    monitor-exit v0

    .line 37
    return-object v1

    .line 38
    :catch_0
    monitor-exit v0

    .line 39
    return-object v2

    .line 40
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 41
    .line 42
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 43
    .line 44
    .line 45
    throw p0

    .line 46
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    throw p0
.end method


# virtual methods
.method public abort()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, p0, v1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->access$2000(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public abortUnlessCommitted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->committed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->abort()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    :cond_0
    return-void
.end method

.method public commit()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, p0, v1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->access$2000(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;Z)V

    .line 5
    .line 6
    .line 7
    iput-boolean v1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->committed:Z

    .line 8
    .line 9
    return-void
.end method

.method public getFile(I)Ljava/io/File;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;->access$700(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;)Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-ne v1, p0, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;->access$600(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->written:[Z

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    aput-boolean v2, v1, p1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->entry:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;

    .line 29
    .line 30
    invoke-virtual {v1, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iget-object p0, p0, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->this$0:Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;

    .line 35
    .line 36
    invoke-static {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->access$1900(Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;)Ljava/io/File;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 41
    .line 42
    .line 43
    monitor-exit v0

    .line 44
    return-object p1

    .line 45
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 46
    .line 47
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 48
    .line 49
    .line 50
    throw p0

    .line 51
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    throw p0
.end method

.method public getString(I)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->newInputStream(I)Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache;->access$1700(Ljava/io/InputStream;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public set(ILjava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/DiskLruCache$Editor;->getFile(I)Ljava/io/File;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Ljava/io/OutputStreamWriter;

    .line 12
    .line 13
    sget-object p1, Lcom/tantan/library/svga/data/cache/disk/disklrucache/Util;->UTF_8:Ljava/nio/charset/Charset;

    .line 14
    .line 15
    invoke-direct {p0, v1, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 16
    .line 17
    .line 18
    :try_start_1
    invoke-virtual {p0, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 19
    .line 20
    .line 21
    invoke-static {p0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    move-object v0, p0

    .line 27
    goto :goto_0

    .line 28
    :catchall_1
    move-exception p1

    .line 29
    :goto_0
    invoke-static {v0}, Lcom/tantan/library/svga/data/cache/disk/disklrucache/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 30
    .line 31
    .line 32
    throw p1
.end method
