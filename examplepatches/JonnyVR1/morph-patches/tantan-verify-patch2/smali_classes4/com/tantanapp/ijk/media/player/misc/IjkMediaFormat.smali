.class public Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantanapp/ijk/media/player/misc/IMediaFormat;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;
    }
.end annotation


# static fields
.field public static final CODEC_NAME_H264:Ljava/lang/String; = "h264"

.field public static final KEY_IJK_BIT_RATE_UI:Ljava/lang/String; = "ijk-bit-rate-ui"

.field public static final KEY_IJK_CHANNEL_UI:Ljava/lang/String; = "ijk-channel-ui"

.field public static final KEY_IJK_CODEC_LONG_NAME_UI:Ljava/lang/String; = "ijk-codec-long-name-ui"

.field public static final KEY_IJK_CODEC_NAME_UI:Ljava/lang/String; = "ijk-codec-name-ui"

.field public static final KEY_IJK_CODEC_PIXEL_FORMAT_UI:Ljava/lang/String; = "ijk-pixel-format-ui"

.field public static final KEY_IJK_CODEC_PROFILE_LEVEL_UI:Ljava/lang/String; = "ijk-profile-level-ui"

.field public static final KEY_IJK_FRAME_RATE_UI:Ljava/lang/String; = "ijk-frame-rate-ui"

.field public static final KEY_IJK_RESOLUTION_UI:Ljava/lang/String; = "ijk-resolution-ui"

.field public static final KEY_IJK_SAMPLE_RATE_UI:Ljava/lang/String; = "ijk-sample-rate-ui"

.field private static final sFormatterMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final mMediaFormat:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->sFormatterMap:Ljava/util/Map;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->sFormatterMap:Ljava/util/Map;

    .line 5
    .line 6
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$1;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$1;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 9
    .line 10
    .line 11
    const-string v2, "ijk-codec-long-name-ui"

    .line 12
    .line 13
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$2;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$2;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 19
    .line 20
    .line 21
    const-string v2, "ijk-codec-name-ui"

    .line 22
    .line 23
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$3;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$3;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 29
    .line 30
    .line 31
    const-string v2, "ijk-bit-rate-ui"

    .line 32
    .line 33
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$4;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$4;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 39
    .line 40
    .line 41
    const-string v2, "ijk-profile-level-ui"

    .line 42
    .line 43
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$5;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$5;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 49
    .line 50
    .line 51
    const-string v2, "ijk-pixel-format-ui"

    .line 52
    .line 53
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$6;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$6;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 59
    .line 60
    .line 61
    const-string v2, "ijk-resolution-ui"

    .line 62
    .line 63
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$7;

    .line 67
    .line 68
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$7;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 69
    .line 70
    .line 71
    const-string v2, "ijk-frame-rate-ui"

    .line 72
    .line 73
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$8;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$8;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 79
    .line 80
    .line 81
    const-string v2, "ijk-sample-rate-ui"

    .line 82
    .line 83
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    new-instance v1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$9;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$9;-><init>(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)V

    .line 89
    .line 90
    .line 91
    const-string v2, "ijk-channel-ui"

    .line 92
    .line 93
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->mMediaFormat:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 97
    .line 98
    return-void
.end method


# virtual methods
.method public getInteger(Ljava/lang/String;)I
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->mMediaFormat:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getInt(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->mMediaFormat:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    sget-object v0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->sFormatterMap:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat$Formatter;->format(Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    iget-object p0, p0, Lcom/tantanapp/ijk/media/player/misc/IjkMediaFormat;->mMediaFormat:Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/tantanapp/ijk/media/player/IjkMediaMeta$IjkStreamMeta;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
