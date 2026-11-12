.class public final Lcom/google/ads/interactivemedia/v3/internal/zzeg;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/concurrent/ConcurrentLinkedQueue;

.field public final b:Lwpp;

.field public c:B


# direct methods
.method public constructor <init>(Lwpp;)V
    .registers 3

    new-instance v0, Lcom/google/ads/interactivemedia/v3/internal/zzfc;

    invoke-direct {v0}, Lcom/google/ads/interactivemedia/v3/internal/zzfc;-><init>()V

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    const/4 v0, 0x1

    iput-byte v0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->c:B

    iput-object p1, p0, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->b:Lwpp;

    return-void
.end method


# virtual methods
.method public final a(Lcom/google/ads/interactivemedia/v3/impl/data/zzbk;)V
    .registers 6

    new-instance v0, Lwmb;

    sget-object v1, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;->adsLoader:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    sget-object v2, Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;->nativeInstrumentation:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    const-string v3, "*"

    invoke-direct {v0, v1, v2, v3, p1}, Lwmb;-><init>(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljava/lang/String;Ljava/lang/Object;)V

    iget-byte p1, p0, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->c:B

    add-int/lit8 v1, p1, -0x1

    if-eqz p1, :cond_2e

    if-eqz v1, :cond_1d

    const/4 p1, 0x1

    if-eq v1, p1, :cond_17

    return-void

    :cond_17
    iget-object p0, p0, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->b:Lwpp;

    invoke-virtual {p0, v0}, Lwpp;->a(Lwmb;)V

    return-void

    :cond_1d
    iget-object p1, p0, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->a:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v1

    const/4 v2, 0x6

    if-le v1, v2, :cond_2a

    const/4 p1, 0x3

    iput-byte p1, p0, Lcom/google/ads/interactivemedia/v3/internal/zzeg;->c:B

    return-void

    :cond_2a
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    return-void

    :cond_2e
    const/4 p0, 0x0

    throw p0
.end method
