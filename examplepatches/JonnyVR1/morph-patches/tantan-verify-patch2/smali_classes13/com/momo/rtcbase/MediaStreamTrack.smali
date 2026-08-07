.class public Lcom/momo/rtcbase/MediaStreamTrack;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/MediaStreamTrack$MediaType;,
        Lcom/momo/rtcbase/MediaStreamTrack$State;
    }
.end annotation


# static fields
.field public static final AUDIO_TRACK_KIND:Ljava/lang/String; = ""

.field public static final VIDEO_TRACK_KIND:Ljava/lang/String; = ""


# instance fields
.field private nativeTrack:J


# direct methods
.method public constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, p1, v0

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iput-wide p1, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const-string p0, "nativeTrack may not be null"

    .line 14
    .line 15
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    throw p0
.end method

.method private checkMediaStreamTrackExists()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const-string p0, "MediaStreamTrack has been disposed."

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static createMediaStreamTrack(J)Lcom/momo/rtcbase/MediaStreamTrack;
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    invoke-static {p0, p1}, Lcom/momo/rtcbase/MediaStreamTrack;->nativeGetKind(J)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v2, ""

    .line 14
    .line 15
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-eqz v3, :cond_1

    .line 20
    .line 21
    new-instance v0, Lcom/momo/rtcbase/AudioTrack;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/AudioTrack;-><init>(J)V

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    new-instance v0, Lcom/momo/rtcbase/VideoTrack;

    .line 34
    .line 35
    invoke-direct {v0, p0, p1}, Lcom/momo/rtcbase/VideoTrack;-><init>(J)V

    .line 36
    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_2
    return-object v1
.end method

.method private static native nativeGetEnabled(J)Z
.end method

.method private static native nativeGetId(J)Ljava/lang/String;
.end method

.method private static native nativeGetKind(J)Ljava/lang/String;
.end method

.method private static native nativeGetState(J)Lcom/momo/rtcbase/MediaStreamTrack$State;
.end method

.method private static native nativeSetEnabled(JZ)Z
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->checkMediaStreamTrackExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/JniCommon;->nativeReleaseRef(J)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 12
    .line 13
    return-void
.end method

.method public enabled()Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->checkMediaStreamTrackExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/MediaStreamTrack;->nativeGetEnabled(J)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public getNativeMediaStreamTrack()J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->checkMediaStreamTrackExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 5
    .line 6
    return-wide v0
.end method

.method public id()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->checkMediaStreamTrackExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/MediaStreamTrack;->nativeGetId(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public kind()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->checkMediaStreamTrackExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/MediaStreamTrack;->nativeGetKind(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public setEnabled(Z)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->checkMediaStreamTrackExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 5
    .line 6
    invoke-static {v0, v1, p1}, Lcom/momo/rtcbase/MediaStreamTrack;->nativeSetEnabled(JZ)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public state()Lcom/momo/rtcbase/MediaStreamTrack$State;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaStreamTrack;->checkMediaStreamTrackExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaStreamTrack;->nativeTrack:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/MediaStreamTrack;->nativeGetState(J)Lcom/momo/rtcbase/MediaStreamTrack$State;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
