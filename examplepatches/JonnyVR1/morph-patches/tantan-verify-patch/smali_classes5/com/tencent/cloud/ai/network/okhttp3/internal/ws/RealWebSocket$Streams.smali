.class public abstract Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Streams"
.end annotation


# instance fields
.field public final client:Z

.field public final sink:Lcom/tencent/cloud/ai/network/okio/f;

.field public final source:Lcom/tencent/cloud/ai/network/okio/g;


# direct methods
.method public constructor <init>(ZLcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okio/f;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;->client:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;->source:Lcom/tencent/cloud/ai/network/okio/g;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;->sink:Lcom/tencent/cloud/ai/network/okio/f;

    .line 9
    .line 10
    return-void
.end method
