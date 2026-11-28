.class public final Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Editor"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0018\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0004\u0018\u00002\u00020\u0001B\u0015\u0008\u0000\u0012\n\u0010\u0002\u001a\u00060\u0003R\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\r\u0010\u000f\u001a\u00020\u0010H\u0000\u00a2\u0006\u0002\u0008\u0011J\u0010\u0010\u0012\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0014\u001a\u00020\u0015J\u000e\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0014\u001a\u00020\u0015J\u0006\u0010\u0018\u001a\u00020\u0010J\u0006\u0010\u0019\u001a\u00020\u0010R\u0018\u0010\u0002\u001a\u00060\u0003R\u00020\u0004X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0016\u0010\t\u001a\u0004\u0018\u00010\nX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
        "",
        "entry",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)V",
        "getEntry$okhttp",
        "()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
        "written",
        "",
        "getWritten$okhttp",
        "()[Z",
        "done",
        "",
        "detach",
        "",
        "detach$okhttp",
        "newSource",
        "Lnicoid/network238/okio/Source;",
        "index",
        "",
        "newSink",
        "Lnicoid/network238/okio/Sink;",
        "commit",
        "abort",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private done:Z

.field private final entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

.field private final written:[Z


# direct methods
.method public static synthetic $r8$lambda$A4Vm2KUtMTjVaHywVLE7iXxpmms(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Ljava/io/IOException;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    invoke-static {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->newSink$lambda$0$0(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Ljava/io/IOException;)Lnicoid/network238/kotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 872
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 873
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    .line 875
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getReadable$okhttp()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getValueCount$okhttp()I

    move-result p1

    new-array p1, p1, [Z

    :goto_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->written:[Z

    return-void
.end method

.method private static final newSink$lambda$0$0(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Ljava/io/IOException;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 934
    monitor-enter p0

    .line 935
    :try_start_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->detach$okhttp()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 934
    monitor-exit p0

    .line 937
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0

    :catchall_0
    move-exception p1

    .line 934
    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public final abort()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 962
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    monitor-enter v0

    .line 963
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->done:Z

    if-nez v1, :cond_1

    .line 964
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v1

    invoke-static {v1, p0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 965
    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->completeEdit$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Z)V

    :cond_0
    nop

    .line 967
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->done:Z

    .line 968
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 962
    monitor-exit v0

    return-void

    .line 963
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Check failed."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 962
    monitor-exit v0

    throw v1
.end method

.method public final commit()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 947
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    monitor-enter v0

    .line 948
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->done:Z

    if-nez v1, :cond_1

    .line 949
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v1

    invoke-static {v1, p0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 950
    invoke-virtual {v0, p0, v2}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->completeEdit$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Z)V

    :cond_0
    nop

    .line 952
    iput-boolean v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->done:Z

    .line 953
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 947
    monitor-exit v0

    return-void

    .line 948
    :cond_1
    :try_start_1
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Check failed."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 947
    monitor-exit v0

    throw v1
.end method

.method public final detach$okhttp()V
    .registers 3

    .line 885
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v0

    invoke-static {v0, p0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 886
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    # getter for: Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->civilizedFileSystem:Z
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$getCivilizedFileSystem$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 887
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->completeEdit$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;Z)V

    return-void

    .line 889
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->setZombie$okhttp(Z)V

    :cond_1
    return-void
.end method

.method public final getEntry$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;
    .registers 2

    .line 873
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    return-object v0
.end method

.method public final getWritten$okhttp()[Z
    .registers 2

    .line 875
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->written:[Z

    return-object v0
.end method

.method public final newSink(I)Lnicoid/network238/okio/Sink;
    .registers 5

    .line 918
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    monitor-enter v0

    .line 919
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->done:Z

    if-nez v1, :cond_2

    .line 920
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v1

    invoke-static {v1, p0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 921
    invoke-static {}, Lnicoid/network238/okio/Okio;->blackhole()Lnicoid/network238/okio/Sink;

    move-result-object p1

    goto :goto_0

    .line 923
    :cond_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getReadable$okhttp()Z

    move-result v1

    if-nez v1, :cond_1

    .line 924
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->written:[Z

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v2, 0x1

    aput-boolean v2, v1, p1

    .line 926
    :cond_1
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getDirtyFiles$okhttp()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okio/Path;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 929
    :try_start_1
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getFileSystem$okhttp()Lnicoid/network238/okio/FileSystem;

    move-result-object v1

    invoke-virtual {v1, p1}, Lnicoid/network238/okio/FileSystem;->sink(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Sink;

    move-result-object p1
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 933
    :try_start_2
    new-instance v1, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;

    new-instance v2, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor$0;

    invoke-direct {v2, v0, p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor$0;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V

    invoke-direct {v1, p1, v2}, Lnicoid/network238/okhttp3/internal/cache/FaultHidingSink;-><init>(Lnicoid/network238/okio/Sink;Lnicoid/network238/kotlin/jvm/functions/Function1;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 918
    monitor-exit v0

    return-object v1

    :catch_0
    move-exception p1

    .line 931
    :try_start_3
    invoke-static {}, Lnicoid/network238/okio/Okio;->blackhole()Lnicoid/network238/okio/Sink;

    move-result-object p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 918
    :goto_0
    monitor-exit v0

    return-object p1

    .line 919
    :cond_2
    :try_start_4
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception p1

    .line 918
    monitor-exit v0

    throw p1
.end method

.method public final newSource(I)Lnicoid/network238/okio/Source;
    .registers 6

    .line 899
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    monitor-enter v0

    .line 900
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->done:Z

    if-nez v1, :cond_1

    .line 901
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getReadable$okhttp()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v1

    invoke-static {v1, p0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getZombie$okhttp()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 905
    :try_start_1
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getFileSystem$okhttp()Lnicoid/network238/okio/FileSystem;

    move-result-object v1

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;->entry:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->getCleanFiles$okhttp()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okio/Path;

    invoke-virtual {v1, p1}, Lnicoid/network238/okio/FileSystem;->source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;

    move-result-object v2
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 899
    :cond_0
    :goto_0
    monitor-exit v0

    return-object v2

    .line 900
    :cond_1
    :try_start_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v1, "Check failed."

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception p1

    .line 899
    monitor-exit v0

    throw p1
.end method
