.class public final Lcom/cosmos/photon/push/image/DiskLruCache$Editor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/cosmos/photon/push/image/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;
    }
.end annotation


# instance fields
.field private committed:Z

.field private final entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

.field private hasErrors:Z

.field final synthetic this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

.field private final written:[Z


# direct methods
.method private constructor <init>(Lcom/cosmos/photon/push/image/DiskLruCache;Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 7
    .line 8
    invoke-static {p2}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->access$600(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Z

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
    invoke-static {p1}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1800(Lcom/cosmos/photon/push/image/DiskLruCache;)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    new-array p1, p1, [Z

    .line 21
    .line 22
    :goto_0
    iput-object p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->written:[Z

    .line 23
    .line 24
    return-void
.end method

.method public synthetic constructor <init>(Lcom/cosmos/photon/push/image/DiskLruCache;Lcom/cosmos/photon/push/image/DiskLruCache$Entry;Lcom/cosmos/photon/push/image/DiskLruCache$1;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1, p2}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;-><init>(Lcom/cosmos/photon/push/image/DiskLruCache;Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)V

    return-void
.end method

.method public static synthetic access$1400(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;)Lcom/cosmos/photon/push/image/DiskLruCache$Entry;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$1500(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;)[Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->written:[Z

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$2302(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->hasErrors:Z

    .line 2
    .line 3
    return p1
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
    iget-object v0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, p0, v1}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$2200(Lcom/cosmos/photon/push/image/DiskLruCache;Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public abortUnlessCommitted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->committed:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    invoke-virtual {p0}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->abort()V
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
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->hasErrors:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {v1, p0, v0}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$2200(Lcom/cosmos/photon/push/image/DiskLruCache;Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->access$1100(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/cosmos/photon/push/image/DiskLruCache;->remove(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    invoke-static {v1, p0, v2}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$2200(Lcom/cosmos/photon/push/image/DiskLruCache;Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Z)V

    .line 25
    .line 26
    .line 27
    :goto_0
    iput-boolean v2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->committed:Z

    .line 28
    .line 29
    return-void
.end method

.method public getString(I)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->newInputStream(I)Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1700(Ljava/io/InputStream;)Ljava/lang/String;

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

.method public newInputStream(I)Ljava/io/InputStream;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->access$700(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-ne v1, p0, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 13
    .line 14
    invoke-static {v1}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->access$600(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Z

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
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->getCleanFile(I)Ljava/io/File;

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

.method public newOutputStream(I)Ljava/io/OutputStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_2

    .line 3
    .line 4
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 5
    .line 6
    invoke-static {v1}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1800(Lcom/cosmos/photon/push/image/DiskLruCache;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge p1, v1, :cond_2

    .line 11
    .line 12
    iget-object v1, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 13
    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->access$700(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Lcom/cosmos/photon/push/image/DiskLruCache$Editor;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    if-ne v2, p0, :cond_1

    .line 22
    .line 23
    iget-object v2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 24
    .line 25
    invoke-static {v2}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->access$600(Lcom/cosmos/photon/push/image/DiskLruCache$Entry;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    iget-object v2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->written:[Z

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    aput-boolean v3, v2, p1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    goto :goto_2

    .line 39
    :cond_0
    :goto_0
    iget-object v2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->entry:Lcom/cosmos/photon/push/image/DiskLruCache$Entry;

    .line 40
    .line 41
    invoke-virtual {v2, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Entry;->getDirtyFile(I)Ljava/io/File;

    .line 42
    .line 43
    .line 44
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    :try_start_1
    new-instance v2, Ljava/io/FileOutputStream;

    .line 46
    .line 47
    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catch_0
    :try_start_2
    iget-object v2, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 52
    .line 53
    invoke-static {v2}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1900(Lcom/cosmos/photon/push/image/DiskLruCache;)Ljava/io/File;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    .line 59
    .line 60
    :try_start_3
    new-instance v2, Ljava/io/FileOutputStream;

    .line 61
    .line 62
    invoke-direct {v2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_3
    .catch Ljava/io/FileNotFoundException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 63
    .line 64
    .line 65
    :goto_1
    :try_start_4
    new-instance p1, Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;

    .line 66
    .line 67
    invoke-direct {p1, p0, v2, v0}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor$FaultHidingOutputStream;-><init>(Lcom/cosmos/photon/push/image/DiskLruCache$Editor;Ljava/io/OutputStream;Lcom/cosmos/photon/push/image/DiskLruCache$1;)V

    .line 68
    .line 69
    .line 70
    monitor-exit v1

    .line 71
    return-object p1

    .line 72
    :catch_1
    invoke-static {}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$2000()Ljava/io/OutputStream;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    monitor-exit v1

    .line 77
    return-object p0

    .line 78
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 79
    .line 80
    invoke-direct {p0}, Ljava/lang/IllegalStateException;-><init>()V

    .line 81
    .line 82
    .line 83
    throw p0

    .line 84
    :goto_2
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 85
    throw p0

    .line 86
    :cond_2
    const-string v1, "Expected index "

    .line 87
    .line 88
    const-string v2, " to be greater than 0 and less than the maximum value count of "

    .line 89
    .line 90
    iget-object p0, p0, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->this$0:Lcom/cosmos/photon/push/image/DiskLruCache;

    .line 91
    .line 92
    invoke-static {p0}, Lcom/cosmos/photon/push/image/DiskLruCache;->access$1800(Lcom/cosmos/photon/push/image/DiskLruCache;)I

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    invoke-static {v1, p1, v2, p0}, Ll/dpq0;->a(Ljava/lang/String;ILjava/lang/Object;I)V

    .line 97
    .line 98
    .line 99
    return-object v0
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
    new-instance v1, Ljava/io/OutputStreamWriter;

    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/image/DiskLruCache$Editor;->newOutputStream(I)Ljava/io/OutputStream;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget-object p1, Lcom/cosmos/photon/push/image/Util;->UTF_8:Ljava/nio/charset/Charset;

    .line 9
    .line 10
    invoke-direct {v1, p0, p1}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/nio/charset/Charset;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 11
    .line 12
    .line 13
    :try_start_1
    invoke-virtual {v1, p2}, Ljava/io/Writer;->write(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 14
    .line 15
    .line 16
    invoke-static {v1}, Lcom/cosmos/photon/push/image/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    move-object v0, v1

    .line 22
    goto :goto_0

    .line 23
    :catchall_1
    move-exception p0

    .line 24
    :goto_0
    invoke-static {v0}, Lcom/cosmos/photon/push/image/Util;->closeQuietly(Ljava/io/Closeable;)V

    .line 25
    .line 26
    .line 27
    throw p0
.end method
