.class public Lcom/momo/rtcbase/RtpParameters$Codec;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/RtpParameters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Codec"
.end annotation


# instance fields
.field public clockRate:Ljava/lang/Integer;

.field kind:Lcom/momo/rtcbase/MediaStreamTrack$MediaType;

.field public name:Ljava/lang/String;

.field public numChannels:Ljava/lang/Integer;

.field public parameters:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public payloadType:I


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/momo/rtcbase/MediaStreamTrack$MediaType;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/Map;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Codec"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Lcom/momo/rtcbase/MediaStreamTrack$MediaType;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->payloadType:I

    .line 5
    .line 6
    iput-object p2, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->name:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->kind:Lcom/momo/rtcbase/MediaStreamTrack$MediaType;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->clockRate:Ljava/lang/Integer;

    .line 11
    .line 12
    iput-object p5, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->numChannels:Ljava/lang/Integer;

    .line 13
    .line 14
    iput-object p6, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->parameters:Ljava/util/Map;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getClockRate()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Codec"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->clockRate:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getKind()Lcom/momo/rtcbase/MediaStreamTrack$MediaType;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Codec"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->kind:Lcom/momo/rtcbase/MediaStreamTrack$MediaType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Codec"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNumChannels()Ljava/lang/Integer;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Codec"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->numChannels:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getParameters()Ljava/util/Map;
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Codec"
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->parameters:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPayloadType()I
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
        value = "Codec"
    .end annotation

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/RtpParameters$Codec;->payloadType:I

    .line 2
    .line 3
    return p0
.end method
