.class public Lcom/momo/rtcbase/RtpParameters$Encoding;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/RtpParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Encoding"
.end annotation


# instance fields
.field public active:Z

.field public maxBitrateBps:Ljava/lang/Integer;

.field public maxFramerate:Ljava/lang/Integer;

.field public minBitrateBps:Ljava/lang/Integer;

.field public numTemporalLayers:Ljava/lang/Integer;

.field public ssrc:Ljava/lang/Long;


# direct methods
.method public constructor <init>(ZLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Long;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Encoding"
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->active:Z

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->maxBitrateBps:Ljava/lang/Integer;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->minBitrateBps:Ljava/lang/Integer;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->maxFramerate:Ljava/lang/Integer;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->numTemporalLayers:Ljava/lang/Integer;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->ssrc:Ljava/lang/Long;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getActive()Z
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Encoding"
    .end annotation

    .line 1
    iget-boolean p0, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->active:Z

    .line 2
    .line 3
    return p0
.end method

.method public getMaxBitrateBps()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Encoding"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->maxBitrateBps:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMaxFramerate()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Encoding"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->maxFramerate:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMinBitrateBps()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Encoding"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->minBitrateBps:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumTemporalLayers()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Encoding"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->numTemporalLayers:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSsrc()Ljava/lang/Long;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Encoding"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Encoding;->ssrc:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method
