.class public Lcom/core/glcore/util/ErrorCode;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final AUDIOPLAYER_PREAPARE_FAILED:I = 0x1771

.field public static final AUDIOPLAYER_RELEASE_FAILED:I = 0x1773

.field public static final AUDIOPLAYER_RESUME_FAILED:I = 0x1772

.field public static final AUDIOPLAYER_RUNNING_FAILED:I = 0x1774

.field public static final AUDIO_RECODER_OPEN_FAILED:I = 0x7d1

.field public static final AUDIO_RECODING_FAILED:I = 0x7d4

.field public static final AUDIO_STARTRECODE_FAILED:I = 0x7d2

.field public static final AUDIO_STOPRECODE_FAILED:I = 0x7d3

.field public static final BGMIX_INIT_AUDIOSOURCE_FAILED:I = 0x1f44

.field public static final BGMIX_INIT_FAILED:I = 0x1f41

.field public static final BGMIX_INIT_VIDEOSOURCE_FAILED:I = 0x1f43

.field public static final BGMIX_RUNNING_FAILED:I = 0x1f45

.field public static final BGMIX_SETOUTPATH_FAILED:I = 0x1f42

.field public static final CAMEAR_GET_STATUS_FAILED:I = 0xfa7

.field public static final CAMERA_CONFIG_FAILED:I = 0xfa5

.field public static final CAMERA_OPEN_FAILED:I = 0xfa4

.field public static final CAMERA_PREPARE_FAILED:I = 0xfa1

.field public static final CAMERA_SELECT_COLORFORMAT_FAILED:I = 0xfa6

.field public static final CAMERA_STARTPREVIEW_FAILED:I = 0xfa2

.field public static final CAMERA_STOPPREVIEW_FAILED:I = 0xfa3

.field public static final CAMERA_SWITCH_FAILED:I = 0xfa8

.field public static final CAMERA_TAKE_PHOTO_FAILED:I = 0xfa9

.field public static final DECODE_AUDIO_CODEC_FAILED:I = 0x232b

.field public static final DECODE_AUDIO_DECODE_FAILED:I = 0x232e

.field public static final DECODE_AUDIO_INIT_MUXER_FAILED:I = 0x2329

.field public static final DECODE_DEMUXER_FORMAT_FAILED:I = 0x232f

.field public static final DECODE_DEMUXER_SELECT_AUDIO_FAILED:I = 0x2330

.field public static final DECODE_DEMUXER_SELECT_VIDEO_FAILED:I = 0x2331

.field public static final DECODE_VIDEO_CODEC_FAILED:I = 0x232c

.field public static final DECODE_VIDEO_DECODE_FAILED:I = 0x232d

.field public static final DECODE_VIDEO_INIT_MUXER_FAILED:I = 0x232a

.field public static final EDIT_AUDIOMIX_FAILED:I = 0x138c

.field public static final EDIT_MAKEVIDEO_FAILED:I = 0x138a

.field public static final EDIT_PREPARE_FAILED:I = 0x1389

.field public static final EDIT_PREVIEW_FAILED:I = 0x138b

.field public static final EDIT_RESUME_FAILED:I = 0x1391

.field public static final EDIT_STARTPREVIEW_FAILED:I = 0x1390

.field public static final EDIT_UPDATEEFFECT_FAILED:I = 0x138f

.field public static final EDIT_VOICECHANGE_FAILED:I = 0x138e

.field public static final EDIT_VOICECHANGE_INIT_FAILED:I = 0x138d

.field public static final ENCODER_AUDIO_PARAMETER_FAILED:I = 0xbb8

.field public static final ENCODER_VIDEO_PARAMETER_FAILED:I = 0xbb9

.field public static final ENCODE_AUDIO_CODEC_CREATE_FAILED:I = 0xbbc

.field public static final ENCODE_AUDIO_CODEC_STATUS_ERROR:I = 0xbbe

.field public static final ENCODE_MUXER_CREATE_FAILED:I = 0xbba

.field public static final ENCODE_RUNNING_ERROR:I = 0xbc0

.field public static final ENCODE_SETPARAMES_EXCEPTION:I = 0xbc1

.field public static final ENCODE_STOP_ENCODE_FAILED:I = 0xbbf

.field public static final ENCODE_VIDEO_CODEC_CREATE_FAILED:I = 0xbbb

.field public static final ENCODE_VIDEO_CODEC_STATUS_ERROR:I = 0xbbd

.field public static final PLAYAUDIO_FILE_NOTFOUND:I = 0x1772

.field public static final PLAYAUDIO_INIT_FAILED:I = 0x1771

.field public static final RECIODE_RESET_CAMERA_FAILED:I = 0x3fb

.field public static final RECODER_CANCEL_FAILED:I = 0x3e9

.field public static final RECODER_ENCODER_INIT_FAILED:I = 0x3f9

.field public static final RECODER_GET_AUDIO_STATUS:I = 0x3fa

.field public static final RECODER_LOAD_BARENESS_MODE_FAILED:I = 0x3f7

.field public static final RECODER_LOAD_BODYLAND_MODE_FAILED:I = 0x3f6

.field public static final RECODER_LOAD_DATARECYLE_MODE_FAILED:I = 0x3f8

.field public static final RECODER_LOAD_FACE_MODE_ALWAYS_FAILED:I = 0x3f2

.field public static final RECODER_LOAD_FACE_MODE_FAILED:I = 0x3f1

.field public static final RECODER_LOAD_GESTURE_MODE_FAILED:I = 0x3f3

.field public static final RECODER_LOAD_HANDGESTURE_MODE_FAILED:I = 0x3f4

.field public static final RECODER_LOAD_SEGMENT_MODE_FAILED:I = 0x3f5

.field public static final RECODER_SAVE_FRAGMENT_FAILED:I = 0x3ef

.field public static final RECODER_SELECT_RES_FAILED:I = 0x3f0

.field public static final RECODER_SPLICE_FAILED:I = 0x3ea

.field public static final RECODER_SPLICE_FILE_PATH_EMPTY:I = 0x3eb

.field public static final RECODER_SPLICE_INIT:I = 0x3ec

.field public static final RECODER_SPLICE_RELEASE_FAILED:I = 0x3ee

.field public static final RECODER_SPLICE_RUNNING_FAILED:I = 0x3ed

.field public static final RENDER_ADDTARGET_FAILED:I = 0x1b59

.field public static final RENDER_TARGET_FAILED:I = 0x1b5a

.field private static final TAG:Ljava/lang/String; = "errorCode"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static getAutoJumpLogInfos()Ljava/lang/String;
    .locals 7

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [Ljava/lang/String;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    const-string v2, ""

    .line 6
    .line 7
    aput-object v2, v0, v1

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    aput-object v2, v0, v3

    .line 11
    .line 12
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-virtual {v2}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    array-length v4, v2

    .line 21
    const/4 v5, 0x5

    .line 22
    if-ge v4, v5, :cond_0

    .line 23
    .line 24
    const-string v0, "errorCode"

    .line 25
    .line 26
    const-string v1, "Stack is too shallow!!!"

    .line 27
    .line 28
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    return-object v0

    .line 33
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    const/4 v5, 0x4

    .line 39
    aget-object v6, v2, v5

    .line 40
    .line 41
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v6, "()"

    .line 49
    .line 50
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    aput-object v4, v0, v1

    .line 58
    .line 59
    new-instance v4, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v6, "("

    .line 62
    .line 63
    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    aget-object v6, v2, v5

    .line 67
    .line 68
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v6, ".java:"

    .line 76
    .line 77
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    aget-object v2, v2, v5

    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getLineNumber()I

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v2, " --- "

    .line 90
    .line 91
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    aget-object v1, v0, v1

    .line 95
    .line 96
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string v1, ")"

    .line 100
    .line 101
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    aput-object v1, v0, v3

    .line 109
    .line 110
    return-object v1
.end method
