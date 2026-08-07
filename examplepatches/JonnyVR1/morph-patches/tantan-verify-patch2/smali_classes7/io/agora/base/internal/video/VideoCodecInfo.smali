.class public Lio/agora/base/internal/video/VideoCodecInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final EVENT_H264_CONSTRAINED_BASELINE_3_1:I = 0x1

.field public static final EVENT_H264_CONSTRAINED_HIGH_3_1:I = 0x3

.field public static final EVENT_H264_CONSTRAINED_MAIN_3_1:I = 0x2

.field public static final H264_CONSTRAINED_BASELINE_3_1:Ljava/lang/String; = "42e01f"

.field public static final H264_CONSTRAINED_HIGH_3_1:Ljava/lang/String; = "640c1f"

.field public static final H264_CONSTRAINED_MAIN_3_1:Ljava/lang/String; = "4d001f"

.field public static final H264_FMTP_LEVEL_ASYMMETRY_ALLOWED:Ljava/lang/String; = "level-asymmetry-allowed"

.field public static final H264_FMTP_PACKETIZATION_MODE:Ljava/lang/String; = "packetization-mode"

.field public static final H264_FMTP_PROFILE_LEVEL_ID:Ljava/lang/String; = "profile-level-id"

.field public static final H264_IS_HIGH_PROFILE_SUPPORTED:Ljava/lang/String; = "is-highprofile-supported"

.field public static final H264_LEVEL_3_1:Ljava/lang/String; = "1f"

.field public static final H264_PROFILE_CONSTRAINED_BASELINE:Ljava/lang/String; = "42e0"

.field public static final H264_PROFILE_CONSTRAINED_HIGH:Ljava/lang/String; = "640c"

.field public static final H264_PROFILE_CONSTRAINED_MAIN:Ljava/lang/String; = "4d00"

.field public static final KEY_AV_DEC_VIDEO_BITRATE_ADJUSTMENT_TYPE:Ljava/lang/String; = "av_enc_bitrate_adjustment_type"

.field public static final KEY_AV_DEC_VIDEO_HWDEC_CONFIG:Ljava/lang/String; = "av_dec_video_hwdec_config"

.field public static final KEY_AV_DEC_VIDEO_TEXTURE_COPY_ENABLE:Ljava/lang/String; = "av_dec_texture_copy_enable"

.field public static final KEY_AV_ENC_VIDEO_HWENC_CONFIG:Ljava/lang/String; = "av_enc_video_hwenc_config"


# instance fields
.field public final name:Ljava/lang/String;

.field public final params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final payload:I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILjava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    iput p1, p0, Lio/agora/base/internal/video/VideoCodecInfo;->payload:I

    .line 14
    iput-object p2, p0, Lio/agora/base/internal/video/VideoCodecInfo;->name:Ljava/lang/String;

    .line 15
    iput-object p3, p0, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lio/agora/base/internal/video/VideoCodecInfo;->payload:I

    .line 6
    .line 7
    iput-object p1, p0, Lio/agora/base/internal/video/VideoCodecInfo;->name:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x1

    .line 6
    if-ne p1, p0, :cond_1

    .line 7
    .line 8
    return v1

    .line 9
    :cond_1
    instance-of v2, p1, Lio/agora/base/internal/video/VideoCodecInfo;

    .line 10
    .line 11
    if-nez v2, :cond_2

    .line 12
    .line 13
    return v0

    .line 14
    :cond_2
    check-cast p1, Lio/agora/base/internal/video/VideoCodecInfo;

    .line 15
    .line 16
    iget-object v2, p0, Lio/agora/base/internal/video/VideoCodecInfo;->name:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v3, p1, Lio/agora/base/internal/video/VideoCodecInfo;->name:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_3

    .line 25
    .line 26
    iget-object p0, p0, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 27
    .line 28
    iget-object p1, p1, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 29
    .line 30
    invoke-interface {p0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_3

    .line 35
    .line 36
    return v1

    .line 37
    :cond_3
    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoCodecInfo;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getParams()Ljava/util/Map;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/VideoCodecInfo;->name:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Lio/agora/base/internal/video/VideoCodecInfo;->params:Ljava/util/Map;

    .line 10
    .line 11
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method
