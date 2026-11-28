.class public final Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Entry"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000v\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u0016\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0001\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0080\u0004\u0018\u00002\u00020\u0001B\u0011\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001b\u0010/\u001a\u0002002\u000c\u00101\u001a\u0008\u0012\u0004\u0012\u00020\u000302H\u0000\u00a2\u0006\u0002\u00083J\u0015\u00104\u001a\u0002002\u0006\u00105\u001a\u000206H\u0000\u00a2\u0006\u0002\u00087J\u0016\u00108\u001a\u0002092\u000c\u00101\u001a\u0008\u0012\u0004\u0012\u00020\u000302H\u0002J\u0013\u0010:\u001a\u0008\u0018\u00010;R\u00020\u001eH\u0000\u00a2\u0006\u0002\u0008<J\u0010\u0010=\u001a\u00020>2\u0006\u0010?\u001a\u00020$H\u0002R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u00020\tX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u001a\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010R\u001a\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0012\u0010\u0010R\u001a\u0010\u0013\u001a\u00020\u0014X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018R\u001a\u0010\u0019\u001a\u00020\u0014X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001a\u0010\u0016\"\u0004\u0008\u001b\u0010\u0018R \u0010\u001c\u001a\u0008\u0018\u00010\u001dR\u00020\u001eX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001f\u0010 \"\u0004\u0008!\u0010\"R\u001a\u0010#\u001a\u00020$X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008%\u0010&\"\u0004\u0008\'\u0010(R\u001a\u0010)\u001a\u00020*X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008+\u0010,\"\u0004\u0008-\u0010.\u00a8\u0006@"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;",
        "",
        "key",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;)V",
        "getKey$okhttp",
        "()Ljava/lang/String;",
        "lengths",
        "",
        "getLengths$okhttp",
        "()[J",
        "cleanFiles",
        "",
        "Lnicoid/network238/okio/Path;",
        "getCleanFiles$okhttp",
        "()Ljava/util/List;",
        "dirtyFiles",
        "getDirtyFiles$okhttp",
        "readable",
        "",
        "getReadable$okhttp",
        "()Z",
        "setReadable$okhttp",
        "(Z)V",
        "zombie",
        "getZombie$okhttp",
        "setZombie$okhttp",
        "currentEditor",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "getCurrentEditor$okhttp",
        "()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
        "setCurrentEditor$okhttp",
        "(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V",
        "lockingSourceCount",
        "",
        "getLockingSourceCount$okhttp",
        "()I",
        "setLockingSourceCount$okhttp",
        "(I)V",
        "sequenceNumber",
        "",
        "getSequenceNumber$okhttp",
        "()J",
        "setSequenceNumber$okhttp",
        "(J)V",
        "setLengths",
        "",
        "strings",
        "",
        "setLengths$okhttp",
        "writeLengths",
        "writer",
        "Lnicoid/network238/okio/BufferedSink;",
        "writeLengths$okhttp",
        "invalidLengths",
        "",
        "snapshot",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
        "snapshot$okhttp",
        "newSource",
        "Lnicoid/network238/okio/Source;",
        "index",
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
.field private final cleanFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation
.end field

.field private currentEditor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

.field private final dirtyFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation
.end field

.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private lockingSourceCount:I

.field private readable:Z

.field private sequenceNumber:J

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

.field private zombie:Z


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 972
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 973
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->key:Ljava/lang/String;

    .line 976
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getValueCount$okhttp()I

    move-result v0

    new-array v0, v0, [J

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lengths:[J

    .line 977
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->cleanFiles:Ljava/util/List;

    .line 978
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->dirtyFiles:Ljava/util/List;

    .line 1003
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/16 p2, 0x2e

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p2

    .line 1004
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    .line 1005
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getValueCount$okhttp()I

    move-result p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p1, :cond_0

    .line 1006
    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1007
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->cleanFiles:Ljava/util/List;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getDirectory()Lnicoid/network238/okio/Path;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 1008
    const-string v2, ".tmp"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1009
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->dirtyFiles:Ljava/util/List;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getDirectory()Lnicoid/network238/okio/Path;

    move-result-object v3

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnicoid/network238/okio/Path;->resolve(Ljava/lang/String;)Lnicoid/network238/okio/Path;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 1010
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->setLength(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private final invalidLengths(Ljava/util/List;)Ljava/lang/Void;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/Void;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1039
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unexpected journal line: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final newSource(I)Lnicoid/network238/okio/Source;
    .registers 4

    .line 1075
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getFileSystem$okhttp()Lnicoid/network238/okio/FileSystem;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->cleanFiles:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okio/Path;

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/FileSystem;->source(Lnicoid/network238/okio/Path;)Lnicoid/network238/okio/Source;

    move-result-object p1

    .line 1076
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    # getter for: Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->civilizedFileSystem:Z
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$getCivilizedFileSystem$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    .line 1078
    :cond_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lockingSourceCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lockingSourceCount:I

    .line 1079
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-direct {v0, p1, v1, p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry$newSource$1;-><init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)V

    return-object v0
.end method


# virtual methods
.method public final getCleanFiles$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation

    .line 977
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->cleanFiles:Ljava/util/List;

    return-object v0
.end method

.method public final getCurrentEditor$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;
    .registers 2

    .line 990
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->currentEditor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    return-object v0
.end method

.method public final getDirtyFiles$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Path;",
            ">;"
        }
    .end annotation

    .line 978
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->dirtyFiles:Ljava/util/List;

    return-object v0
.end method

.method public final getKey$okhttp()Ljava/lang/String;
    .registers 2

    .line 973
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->key:Ljava/lang/String;

    return-object v0
.end method

.method public final getLengths$okhttp()[J
    .registers 2

    .line 976
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lengths:[J

    return-object v0
.end method

.method public final getLockingSourceCount$okhttp()I
    .registers 2

    .line 996
    iget v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lockingSourceCount:I

    return v0
.end method

.method public final getReadable$okhttp()Z
    .registers 2

    .line 981
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->readable:Z

    return v0
.end method

.method public final getSequenceNumber$okhttp()J
    .registers 3

    .line 999
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->sequenceNumber:J

    return-wide v0
.end method

.method public final getZombie$okhttp()Z
    .registers 2

    .line 984
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->zombie:Z

    return v0
.end method

.method public final setCurrentEditor$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;)V
    .registers 2

    .line 990
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->currentEditor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    return-void
.end method

.method public final setLengths$okhttp(Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1017
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getValueCount$okhttp()I

    move-result v1

    if-ne v0, v1, :cond_1

    .line 1022
    :try_start_0
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 1023
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lengths:[J

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    aput-wide v3, v2, v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    .line 1026
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->invalidLengths(Ljava/util/List;)Ljava/lang/Void;

    new-instance p1, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {p1}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw p1

    .line 1018
    :cond_1
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->invalidLengths(Ljava/util/List;)Ljava/lang/Void;

    new-instance p1, Lnicoid/network238/kotlin/KotlinNothingValueException;

    invoke-direct {p1}, Lnicoid/network238/kotlin/KotlinNothingValueException;-><init>()V

    throw p1
.end method

.method public final setLockingSourceCount$okhttp(I)V
    .registers 2

    .line 996
    iput p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lockingSourceCount:I

    return-void
.end method

.method public final setReadable$okhttp(Z)V
    .registers 2

    .line 981
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->readable:Z

    return-void
.end method

.method public final setSequenceNumber$okhttp(J)V
    .registers 3

    .line 999
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->sequenceNumber:J

    return-void
.end method

.method public final setZombie$okhttp(Z)V
    .registers 2

    .line 984
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->zombie:Z

    return-void
.end method

.method public final snapshot$okhttp()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;
    .registers 10

    .line 1047
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    .line 1123
    sget-boolean v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1124
    new-instance v1, Ljava/lang/AssertionError;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Thread "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " MUST hold lock on "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v1

    .line 1049
    :cond_0
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->readable:Z

    if-nez v0, :cond_1

    goto :goto_2

    .line 1050
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    # getter for: Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->civilizedFileSystem:Z
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->access$getCivilizedFileSystem$p(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;)Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->currentEditor:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->zombie:Z

    if-eqz v0, :cond_3

    :cond_2
    goto :goto_2

    .line 1052
    :cond_3
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 1053
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lengths:[J

    invoke-virtual {v0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, [J

    .line 1055
    const/4 v8, 0x0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->getValueCount$okhttp()I

    move-result v0

    move v1, v8

    :goto_0
    if-ge v1, v0, :cond_4

    .line 1056
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->newSource(I)Lnicoid/network238/okio/Source;

    move-result-object v2

    invoke-interface {v6, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1058
    :cond_4
    new-instance v1, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->key:Ljava/lang/String;

    iget-wide v4, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->sequenceNumber:J

    invoke-direct/range {v1 .. v7}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;JLjava/util/List;[J)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    .line 1061
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_1
    if-ge v8, v0, :cond_5

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v8, v8, 0x1

    check-cast v1, Lnicoid/network238/okio/Source;

    .line 1062
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_1

    .line 1067
    :cond_5
    :try_start_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->removeEntry$okhttp(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_2

    :catch_1
    move-exception v0

    :goto_2
    const/4 v0, 0x0

    return-object v0
.end method

.method public final writeLengths$okhttp(Lnicoid/network238/okio/BufferedSink;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1033
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Entry;->lengths:[J

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-wide v3, v0, v2

    .line 1034
    const/16 v5, 0x20

    invoke-interface {p1, v5}, Lnicoid/network238/okio/BufferedSink;->writeByte(I)Lnicoid/network238/okio/BufferedSink;

    move-result-object v5

    invoke-interface {v5, v3, v4}, Lnicoid/network238/okio/BufferedSink;->writeDecimalLong(J)Lnicoid/network238/okio/BufferedSink;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
