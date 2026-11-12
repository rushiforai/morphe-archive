.class public final Lwmb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/String;

.field public final d:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;


# direct methods
.method public constructor <init>(Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwmb;->a:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    iput-object p2, p0, Lwmb;->d:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    iput-object p3, p0, Lwmb;->c:Ljava/lang/String;

    iput-object p4, p0, Lwmb;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    const/4 v1, 0x0

    if-nez p1, :cond_8

    return v1

    :cond_8
    instance-of v2, p1, Lwmb;

    if-nez v2, :cond_d

    return v1

    :cond_d
    check-cast p1, Lwmb;

    iget-object v2, p0, Lwmb;->a:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    iget-object v3, p1, Lwmb;->a:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    if-eq v2, v3, :cond_16

    return v1

    :cond_16
    iget-object v2, p0, Lwmb;->b:Ljava/lang/Object;

    iget-object v3, p1, Lwmb;->b:Ljava/lang/Object;

    invoke-static {v2, v3}, Lcom/google/ads/interactivemedia/v3/internal/zzoo;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_21

    return v1

    :cond_21
    iget-object v2, p0, Lwmb;->c:Ljava/lang/String;

    iget-object v3, p1, Lwmb;->c:Ljava/lang/String;

    invoke-static {v2, v3}, Lcom/google/ads/interactivemedia/v3/internal/zzoo;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2c

    return v1

    :cond_2c
    iget-object p0, p0, Lwmb;->d:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    iget-object p1, p1, Lwmb;->d:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    if-eq p0, p1, :cond_33

    return v1

    :cond_33
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lwmb;->c:Ljava/lang/String;

    iget-object v1, p0, Lwmb;->d:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    iget-object v2, p0, Lwmb;->a:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    iget-object p0, p0, Lwmb;->b:Ljava/lang/Object;

    filled-new-array {v2, p0, v0, v1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lwmb;->c:Ljava/lang/String;

    iget-object v1, p0, Lwmb;->b:Ljava/lang/Object;

    iget-object v2, p0, Lwmb;->a:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgChannel;

    iget-object p0, p0, Lwmb;->d:Lcom/google/ads/interactivemedia/v3/impl/JavaScriptMessage$MsgType;

    filled-new-array {v2, p0, v0, v1}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "JavaScriptMessage [command=%s, type=%s, sid=%s, data=%s]"

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
