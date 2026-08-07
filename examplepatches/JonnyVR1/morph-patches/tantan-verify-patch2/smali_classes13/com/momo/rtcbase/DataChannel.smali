.class public Lcom/momo/rtcbase/DataChannel;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/rtcbase/DataChannel$State;,
        Lcom/momo/rtcbase/DataChannel$Observer;,
        Lcom/momo/rtcbase/DataChannel$Buffer;,
        Lcom/momo/rtcbase/DataChannel$Init;
    }
.end annotation


# instance fields
.field private nativeDataChannel:J

.field private nativeObserver:J


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/rtcbase/DataChannel;->nativeDataChannel:J

    .line 5
    .line 6
    return-void
.end method

.method private checkDataChannelExists()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/DataChannel;->nativeDataChannel:J

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
    const-string p0, "DataChannel has been disposed."

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private native nativeBufferedAmount()J
.end method

.method private native nativeClose()V
.end method

.method private native nativeId()I
.end method

.method private native nativeLabel()Ljava/lang/String;
.end method

.method private native nativeRegisterObserver(Lcom/momo/rtcbase/DataChannel$Observer;)J
.end method

.method private native nativeSend([BZ)Z
.end method

.method private native nativeState()Lcom/momo/rtcbase/DataChannel$State;
.end method

.method private native nativeUnregisterObserver(J)V
.end method


# virtual methods
.method public bufferedAmount()J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->nativeBufferedAmount()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    return-wide v0
.end method

.method public close()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->nativeClose()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public dispose()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DataChannel;->nativeDataChannel:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/JniCommon;->nativeReleaseRef(J)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/rtcbase/DataChannel;->nativeDataChannel:J

    .line 12
    .line 13
    return-void
.end method

.method public getNativeDataChannel()J
    .locals 2
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/DataChannel;->nativeDataChannel:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public id()I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->nativeId()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    return p0
.end method

.method public label()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->nativeLabel()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public registerObserver(Lcom/momo/rtcbase/DataChannel$Observer;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DataChannel;->nativeObserver:J

    .line 5
    .line 6
    const-wide/16 v2, 0x0

    .line 7
    .line 8
    cmp-long v2, v0, v2

    .line 9
    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, v0, v1}, Lcom/momo/rtcbase/DataChannel;->nativeUnregisterObserver(J)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-direct {p0, p1}, Lcom/momo/rtcbase/DataChannel;->nativeRegisterObserver(Lcom/momo/rtcbase/DataChannel$Observer;)J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Lcom/momo/rtcbase/DataChannel;->nativeObserver:J

    .line 20
    .line 21
    return-void
.end method

.method public send(Lcom/momo/rtcbase/DataChannel$Buffer;)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/momo/rtcbase/DataChannel$Buffer;->data:Ljava/nio/ByteBuffer;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    iget-object v1, p1, Lcom/momo/rtcbase/DataChannel$Buffer;->data:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    invoke-virtual {v1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 15
    .line 16
    .line 17
    iget-boolean p1, p1, Lcom/momo/rtcbase/DataChannel$Buffer;->binary:Z

    .line 18
    .line 19
    invoke-direct {p0, v0, p1}, Lcom/momo/rtcbase/DataChannel;->nativeSend([BZ)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public state()Lcom/momo/rtcbase/DataChannel$State;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->nativeState()Lcom/momo/rtcbase/DataChannel$State;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public unregisterObserver()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DataChannel;->checkDataChannelExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DataChannel;->nativeObserver:J

    .line 5
    .line 6
    invoke-direct {p0, v0, v1}, Lcom/momo/rtcbase/DataChannel;->nativeUnregisterObserver(J)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
