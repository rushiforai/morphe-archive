.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/d;
.super Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/e;ZLcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okio/f;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)V
    .locals 0

    .line 1
    iput-object p5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/d;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;-><init>(ZLcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okio/f;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public close()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/d;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 2
    .line 3
    const/4 v4, 0x1

    .line 4
    const/4 v5, 0x0

    .line 5
    const-wide/16 v1, -0x1

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(JZZLjava/io/IOException;)Ljava/io/IOException;

    .line 9
    .line 10
    .line 11
    return-void
.end method
