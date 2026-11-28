.class public final Lnicoid/network238/okhttp3/Cache$CacheResponseBody$1;
.super Lnicoid/network238/okio/ForwardingSource;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/Cache$CacheResponseBody;-><init>(Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "nicoid/network238/okhttp3/Cache$CacheResponseBody$1",
        "Lnicoid/network238/okio/ForwardingSource;",
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
.field final synthetic this$0:Lnicoid/network238/okhttp3/Cache$CacheResponseBody;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Source;Lnicoid/network238/okhttp3/Cache$CacheResponseBody;)V
    .registers 3

    iput-object p2, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody$1;->this$0:Lnicoid/network238/okhttp3/Cache$CacheResponseBody;

    .line 724
    invoke-direct {p0, p1}, Lnicoid/network238/okio/ForwardingSource;-><init>(Lnicoid/network238/okio/Source;)V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 727
    iget-object v0, p0, Lnicoid/network238/okhttp3/Cache$CacheResponseBody$1;->this$0:Lnicoid/network238/okhttp3/Cache$CacheResponseBody;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Cache$CacheResponseBody;->getSnapshot()Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/DiskLruCache$Snapshot;->close()V

    .line 728
    invoke-super {p0}, Lnicoid/network238/okio/ForwardingSource;->close()V

    return-void
.end method
