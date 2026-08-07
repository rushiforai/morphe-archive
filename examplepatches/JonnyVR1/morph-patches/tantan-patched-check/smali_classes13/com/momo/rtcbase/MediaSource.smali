.class public Lcom/momo/rtcbase/MediaSource;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/MediaSource$State;
    }
.end annotation


# instance fields
.field private nativeSource:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/rtcbase/MediaSource;->nativeSource:J

    .line 5
    .line 6
    return-void
.end method

.method private checkMediaSourceExists()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaSource;->nativeSource:J

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
    const-string p0, "MediaSource has been disposed."

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static native nativeGetState(J)Lcom/momo/rtcbase/MediaSource$State;
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaSource;->checkMediaSourceExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaSource;->nativeSource:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/JniCommon;->nativeReleaseRef(J)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/rtcbase/MediaSource;->nativeSource:J

    .line 12
    .line 13
    return-void
.end method

.method public getNativeMediaSource()J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaSource;->checkMediaSourceExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaSource;->nativeSource:J

    .line 5
    .line 6
    return-wide v0
.end method

.method public state()Lcom/momo/rtcbase/MediaSource$State;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/MediaSource;->checkMediaSourceExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaSource;->nativeSource:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/MediaSource;->nativeGetState(J)Lcom/momo/rtcbase/MediaSource$State;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
