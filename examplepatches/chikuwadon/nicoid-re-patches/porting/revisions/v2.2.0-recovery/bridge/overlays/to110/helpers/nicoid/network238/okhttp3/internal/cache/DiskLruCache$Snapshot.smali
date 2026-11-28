.class public final Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "Snapshot"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0016\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\u0008\u0086\u0004\u0018\u00002\u00020\u0001B/\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u000c\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007\u0012\u0006\u0010\t\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0006\u0010\u0002\u001a\u00020\u0003J\u000c\u0010\r\u001a\u0008\u0018\u00010\u000eR\u00020\u000fJ\u000e\u0010\u0010\u001a\u00020\u00082\u0006\u0010\u0011\u001a\u00020\u0012J\u000e\u0010\u0013\u001a\u00020\u00052\u0006\u0010\u0011\u001a\u00020\u0012J\u0008\u0010\u0014\u001a\u00020\u0015H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;",
        "Ljava/io/Closeable;",
        "key",
        "",
        "sequenceNumber",
        "",
        "sources",
        "",
        "Lnicoid/network238/okio/Source;",
        "lengths",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;JLjava/util/List;[J)V",
        "edit",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;",
        "Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;",
        "getSource",
        "index",
        "",
        "getLength",
        "close",
        "",
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
.field private final key:Ljava/lang/String;

.field private final lengths:[J

.field private final sequenceNumber:J

.field private final sources:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okio/Source;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;Ljava/lang/String;JLjava/util/List;[J)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okio/Source;",
            ">;[J)V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 843
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 844
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    .line 845
    iput-wide p3, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->sequenceNumber:J

    .line 846
    iput-object p5, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->sources:Ljava/util/List;

    .line 847
    iput-object p6, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->lengths:[J

    return-void
.end method


# virtual methods
.method public close()V
    .registers 3

    .line 865
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->sources:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okio/Source;

    .line 866
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public final edit()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 856
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->this$0:Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->sequenceNumber:J

    invoke-virtual {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache;->edit(Ljava/lang/String;J)Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Editor;

    move-result-object v0

    return-object v0
.end method

.method public final getLength(I)J
    .registers 4

    .line 862
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->lengths:[J

    aget-wide v0, v0, p1

    return-wide v0
.end method

.method public final getSource(I)Lnicoid/network238/okio/Source;
    .registers 3

    .line 859
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->sources:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/okio/Source;

    return-object p1
.end method

.method public final key()Ljava/lang/String;
    .registers 2

    .line 849
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->key:Ljava/lang/String;

    return-object v0
.end method
