.class Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory$1;
.super Lcom/momo/rtcbase/WrappedNativeVideoEncoder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory;->createEncoder(Lcom/momo/rtcbase/VideoCodecInfo;)Lcom/momo/rtcbase/VideoEncoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory;

.field final synthetic val$info:Lcom/momo/rtcbase/VideoCodecInfo;


# direct methods
.method public constructor <init>(Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory;Lcom/momo/rtcbase/VideoCodecInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory$1;->this$0:Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory$1;->val$info:Lcom/momo/rtcbase/VideoCodecInfo;

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/momo/rtcbase/WrappedNativeVideoEncoder;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public createNativeVideoEncoder()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/MediaCodecVideoEncoder$HwEncoderFactory$1;->val$info:Lcom/momo/rtcbase/VideoCodecInfo;

    .line 2
    .line 3
    invoke-static {}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->access$000()Lcom/momo/rtcbase/EglBase;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Lcom/momo/rtcbase/EglBase14;

    .line 8
    .line 9
    invoke-static {p0, v0}, Lcom/momo/rtcbase/MediaCodecVideoEncoder;->access$100(Lcom/momo/rtcbase/VideoCodecInfo;Z)J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0
.end method

.method public isHardwareEncoder()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
