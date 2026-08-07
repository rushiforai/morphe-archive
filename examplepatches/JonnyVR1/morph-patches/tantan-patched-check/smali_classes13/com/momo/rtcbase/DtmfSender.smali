.class public Lcom/momo/rtcbase/DtmfSender;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private nativeDtmfSender:J


# direct methods
.method public constructor <init>(J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

    .line 5
    .line 6
    return-void
.end method

.method private checkDtmfSenderExists()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

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
    const-string p0, "DtmfSender has been disposed."

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private static native nativeCanInsertDtmf(J)Z
.end method

.method private static native nativeDuration(J)I
.end method

.method private static native nativeInsertDtmf(JLjava/lang/String;II)Z
.end method

.method private static native nativeInterToneGap(J)I
.end method

.method private static native nativeTones(J)Ljava/lang/String;
.end method


# virtual methods
.method public canInsertDtmf()Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DtmfSender;->checkDtmfSenderExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/DtmfSender;->nativeCanInsertDtmf(J)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public dispose()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DtmfSender;->checkDtmfSenderExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/JniCommon;->nativeReleaseRef(J)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

    .line 12
    .line 13
    return-void
.end method

.method public duration()I
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DtmfSender;->checkDtmfSenderExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/DtmfSender;->nativeDuration(J)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public insertDtmf(Ljava/lang/String;II)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DtmfSender;->checkDtmfSenderExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

    .line 5
    .line 6
    invoke-static {v0, v1, p1, p2, p3}, Lcom/momo/rtcbase/DtmfSender;->nativeInsertDtmf(JLjava/lang/String;II)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public interToneGap()I
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DtmfSender;->checkDtmfSenderExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/DtmfSender;->nativeInterToneGap(J)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public tones()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/DtmfSender;->checkDtmfSenderExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/DtmfSender;->nativeDtmfSender:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/DtmfSender;->nativeTones(J)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
