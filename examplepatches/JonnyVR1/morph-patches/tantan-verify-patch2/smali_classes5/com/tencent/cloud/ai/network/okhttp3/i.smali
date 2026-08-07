.class public final Lcom/tencent/cloud/ai/network/okhttp3/i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;


# direct methods
.method public constructor <init>()V
    .locals 4

    const/4 v0, 0x5

    const-wide/16 v1, 0x5

    .line 12
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/i;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/i;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/f;

    .line 10
    .line 11
    return-void
.end method
