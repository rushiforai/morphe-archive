.class public Lcom/momo/rtcbase/VideoTrack;
.super Lcom/momo/rtcbase/MediaStreamTrack;
.source "SourceFile"


# instance fields
.field private final sinks:Ljava/util/IdentityHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/IdentityHashMap<",
            "Lcom/momo/rtcbase/VideoSink;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/rtcbase/MediaStreamTrack;-><init>(J)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/IdentityHashMap;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/IdentityHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/momo/rtcbase/VideoTrack;->sinks:Ljava/util/IdentityHashMap;

    .line 10
    .line 11
    return-void
.end method

.method private static native nativeAddSink(JJ)V
.end method

.method private static native nativeFreeSink(J)V
.end method

.method private static native nativeRemoveSink(JJ)V
.end method

.method private static native nativeWrapSink(Lcom/momo/rtcbase/VideoSink;)J
.end method


# virtual methods
.method public addSink(Lcom/momo/rtcbase/VideoSink;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/rtcbase/VideoTrack;->sinks:Ljava/util/IdentityHashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p1}, Lcom/momo/rtcbase/VideoTrack;->nativeWrapSink(Lcom/momo/rtcbase/VideoSink;)J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    iget-object v2, p0, Lcom/momo/rtcbase/VideoTrack;->sinks:Ljava/util/IdentityHashMap;

    .line 16
    .line 17
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-virtual {v2, p1, v3}, Ljava/util/IdentityHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->getNativeMediaStreamTrack()J

    .line 25
    .line 26
    .line 27
    move-result-wide p0

    .line 28
    invoke-static {p0, p1, v0, v1}, Lcom/momo/rtcbase/VideoTrack;->nativeAddSink(JJ)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return-void

    .line 32
    :cond_1
    const-string p0, "The VideoSink is not allowed to be null"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public dispose()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/VideoTrack;->sinks:Ljava/util/IdentityHashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->values()Ljava/util/Collection;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/Long;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 24
    .line 25
    .line 26
    move-result-wide v1

    .line 27
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->getNativeMediaStreamTrack()J

    .line 28
    .line 29
    .line 30
    move-result-wide v3

    .line 31
    invoke-static {v3, v4, v1, v2}, Lcom/momo/rtcbase/VideoTrack;->nativeRemoveSink(JJ)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1, v2}, Lcom/momo/rtcbase/VideoTrack;->nativeFreeSink(J)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/momo/rtcbase/VideoTrack;->sinks:Ljava/util/IdentityHashMap;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/util/IdentityHashMap;->clear()V

    .line 41
    .line 42
    .line 43
    invoke-super {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->dispose()V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public getNativeVideoTrack()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->getNativeMediaStreamTrack()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method public removeSink(Lcom/momo/rtcbase/VideoSink;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/VideoTrack;->sinks:Ljava/util/IdentityHashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/IdentityHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Long;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->getNativeMediaStreamTrack()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    invoke-static {v0, v1, v2, v3}, Lcom/momo/rtcbase/VideoTrack;->nativeRemoveSink(JJ)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 23
    .line 24
    .line 25
    move-result-wide p0

    .line 26
    invoke-static {p0, p1}, Lcom/momo/rtcbase/VideoTrack;->nativeFreeSink(J)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
