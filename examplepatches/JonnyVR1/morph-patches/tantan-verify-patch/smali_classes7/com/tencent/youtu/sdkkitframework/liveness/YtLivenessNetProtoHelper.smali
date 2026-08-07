.class public Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveDetectReq;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReq;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetFourLiveTypeReq;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetFourLiveTypeReqData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReqData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveReqData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$SensorData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;,
        Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "YtLivenessNetProtoHelper"

.field public static sAndroid_apilevel:Ljava/lang/String;

.field public static sAndroid_version:Ljava/lang/String;

.field public static sBuild_brand:Ljava/lang/String;

.field public static sBuild_device:Ljava/lang/String;

.field public static sBuild_display:Ljava/lang/String;

.field public static sBuild_hardware:Ljava/lang/String;

.field public static sBuild_model:Ljava/lang/String;

.field public static sBuild_product:Ljava/lang/String;


# direct methods
.method public static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 2
    .line 3
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_brand:Ljava/lang/String;

    .line 4
    .line 5
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 6
    .line 7
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_model:Ljava/lang/String;

    .line 8
    .line 9
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 10
    .line 11
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_hardware:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v0, Landroid/os/Build;->DISPLAY:Ljava/lang/String;

    .line 14
    .line 15
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_display:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v0, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    .line 18
    .line 19
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_product:Ljava/lang/String;

    .line 20
    .line 21
    sget-object v0, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    .line 22
    .line 23
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_device:Ljava/lang/String;

    .line 24
    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v1, ""

    .line 28
    .line 29
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sAndroid_apilevel:Ljava/lang/String;

    .line 42
    .line 43
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 44
    .line 45
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sAndroid_version:Ljava/lang/String;

    .line 46
    .line 47
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$000()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->TAG:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$100()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_brand:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$200()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_model:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$300()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_hardware:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$400()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_display:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$500()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_product:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$600()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sBuild_device:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$700()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sAndroid_apilevel:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic access$800()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->sAndroid_version:Ljava/lang/String;

    .line 2
    .line 3
    return-object v0
.end method

.method public static makeActionLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;)Ljava/lang/String;
    .locals 9

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 7
    .line 8
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->app_id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->session_id:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->business_id:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->sdk_version:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->ftrack_sdk_version:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getVersion()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->faction_sdk_version:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->makeVersion()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 54
    .line 55
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 56
    .line 57
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->colorNum:I

    .line 58
    .line 59
    iget-object v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->reflectConfig:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v8, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->controlConfig:Ljava/lang/String;

    .line 62
    .line 63
    invoke-direct/range {v3 .. v8}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;-><init>(FILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->select_data:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->actionStr:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->action_str:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->actionVideo:Ljava/lang/String;

    .line 73
    .line 74
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->action_video:Ljava/lang/String;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->bestImage:Ljava/lang/String;

    .line 77
    .line 78
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->best_image:Ljava/lang/String;

    .line 79
    .line 80
    iget-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->needEyeDetect:Z

    .line 81
    .line 82
    iput-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->do_eye_detect:Z

    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->needMouthDetect:Z

    .line 85
    .line 86
    iput-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->do_mouth_detect:Z

    .line 87
    .line 88
    const/4 v1, 0x1

    .line 89
    iput-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->do_live:Z

    .line 90
    .line 91
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->config:Ljava/lang/String;

    .line 92
    .line 93
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->config:Ljava/lang/String;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReqData;->reservedfield:Ljava/lang/String;

    .line 96
    .line 97
    iput-object p0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->reservedfield:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToCompare:Landroid/graphics/Bitmap;

    .line 108
    .line 109
    if-eqz p0, :cond_0

    .line 110
    .line 111
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 112
    .line 113
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 114
    .line 115
    .line 116
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 117
    .line 118
    const/16 v3, 0x5f

    .line 119
    .line 120
    invoke-virtual {p0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 121
    .line 122
    .line 123
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const/4 v1, 0x2

    .line 128
    invoke-static {p0, v1}, Landroid/util/Base64;->encode([BI)[B

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    new-instance v1, Ljava/lang/String;

    .line 133
    .line 134
    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([B)V

    .line 135
    .line 136
    .line 137
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->compare_image:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToComapreType:I

    .line 148
    .line 149
    iput p0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionLiveReq;->compare_image_type:I

    .line 150
    .line 151
    :cond_0
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 152
    .line 153
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    return-object p0
.end method

.method public static makeActionReflectLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 10

    .line 1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->ACTION_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 12
    .line 13
    .line 14
    const-string v1, ""

    .line 15
    .line 16
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;-><init>()V

    .line 19
    .line 20
    .line 21
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 22
    .line 23
    iget-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->app_id:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->session_id:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->business_id:Ljava/lang/String;

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->platform:I

    .line 37
    .line 38
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;

    .line 39
    .line 40
    invoke-direct {v2}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-virtual {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->sdk_version:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->ftrack_sdk_version:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getVersion()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->faction_sdk_version:Ljava/lang/String;

    .line 64
    .line 65
    const-string v3, "3.6.9.2"

    .line 66
    .line 67
    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->freflect_sdk_version:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->makeVersion()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v8

    .line 73
    new-instance v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 74
    .line 75
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 76
    .line 77
    iget v5, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 78
    .line 79
    iget v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->colorNum:I

    .line 80
    .line 81
    iget-object v7, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectConfig:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v9, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->controlConfig:Ljava/lang/String;

    .line 84
    .line 85
    invoke-direct/range {v4 .. v9}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;-><init>(FILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    iput-object v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->select_data:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 89
    .line 90
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->actionVideo:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->action_video:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->controlConfig:Ljava/lang/String;

    .line 95
    .line 96
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    const-string v4, "sdcs"

    .line 101
    .line 102
    if-nez v3, :cond_0

    .line 103
    .line 104
    invoke-static {v2, v4}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->removeKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    new-instance v3, Ljava/lang/StringBuilder;

    .line 109
    .line 110
    const-string v4, "&sdcs="

    .line 111
    .line 112
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object p2

    .line 122
    invoke-virtual {v2, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p2

    .line 126
    new-instance v2, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    const-string v3, "&avcs="

    .line 129
    .line 130
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    goto :goto_0

    .line 145
    :cond_0
    invoke-static {v2, v4}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->removeKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    :goto_0
    iget-object p2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->select_data:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 150
    .line 151
    invoke-virtual {p2, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;->setConfig(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->colorData:Ljava/lang/String;

    .line 155
    .line 156
    iput-object p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->color_data:Ljava/lang/String;

    .line 157
    .line 158
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->actionStr:Ljava/lang/String;

    .line 159
    .line 160
    iput-object p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->action_str:Ljava/lang/String;

    .line 161
    .line 162
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iget-object p1, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToCompare:Landroid/graphics/Bitmap;

    .line 171
    .line 172
    if-eqz p1, :cond_1

    .line 173
    .line 174
    new-instance p2, Ljava/io/ByteArrayOutputStream;

    .line 175
    .line 176
    invoke-direct {p2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 177
    .line 178
    .line 179
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 180
    .line 181
    const/16 v3, 0x5f

    .line 182
    .line 183
    invoke-virtual {p1, v2, v3, p2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 184
    .line 185
    .line 186
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    new-instance p2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 191
    .line 192
    const/4 v2, 0x0

    .line 193
    invoke-direct {p2, p1, v2, v2}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;-><init>([B[FLjava/lang/String;)V

    .line 194
    .line 195
    .line 196
    iput-object p2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->compare_image:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 197
    .line 198
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    iget p1, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToComapreType:I

    .line 207
    .line 208
    iput p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->compare_image_type:I

    .line 209
    .line 210
    :cond_1
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->liveImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 211
    .line 212
    iput-object p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->live_image:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 213
    .line 214
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->mouthImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 215
    .line 216
    iput-object p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->mouth_image:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 217
    .line 218
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->eyeImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 219
    .line 220
    iput-object p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->eye_image:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 221
    .line 222
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->mode:I

    .line 223
    .line 224
    iput p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->mode:I

    .line 225
    .line 226
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->config:Ljava/lang/String;

    .line 227
    .line 228
    iput-object p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->config:Ljava/lang/String;

    .line 229
    .line 230
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 231
    .line 232
    if-eqz p1, :cond_4

    .line 233
    .line 234
    :try_start_0
    new-instance p1, Lorg/json/JSONObject;

    .line 235
    .line 236
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 237
    .line 238
    .line 239
    const-string p2, "begin_time"

    .line 240
    .line 241
    :try_start_1
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 242
    .line 243
    iget-wide v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->begin_time:J

    .line 244
    .line 245
    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 246
    .line 247
    .line 248
    const-string p2, "changepoint_time"

    .line 249
    .line 250
    :try_start_2
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 251
    .line 252
    iget-wide v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->changepoint_time:J

    .line 253
    .line 254
    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 255
    .line 256
    .line 257
    const-string p2, "offset_sys"

    .line 258
    .line 259
    :try_start_3
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 260
    .line 261
    iget v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->offset_sys:F

    .line 262
    .line 263
    float-to-double v2, v2

    .line 264
    invoke-virtual {p1, p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    .line 265
    .line 266
    .line 267
    const-string p2, "frame_num"

    .line 268
    .line 269
    :try_start_4
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 270
    .line 271
    iget v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->frame_num:I

    .line 272
    .line 273
    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    .line 274
    .line 275
    .line 276
    const-string p2, "landmark_num"

    .line 277
    .line 278
    :try_start_5
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 279
    .line 280
    iget v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->landmark_num:I

    .line 281
    .line 282
    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0

    .line 283
    .line 284
    .line 285
    const-string p2, "width"

    .line 286
    .line 287
    :try_start_6
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 288
    .line 289
    iget v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->width:I

    .line 290
    .line 291
    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0

    .line 292
    .line 293
    .line 294
    const-string p2, "height"

    .line 295
    .line 296
    :try_start_7
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 297
    .line 298
    iget v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->height:I

    .line 299
    .line 300
    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0

    .line 301
    .line 302
    .line 303
    const-string p2, "log"

    .line 304
    .line 305
    :try_start_8
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 306
    .line 307
    iget-object v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->log:Ljava/lang/String;

    .line 308
    .line 309
    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_0

    .line 310
    .line 311
    .line 312
    const-string p2, "config_begin"

    .line 313
    .line 314
    :try_start_9
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 315
    .line 316
    iget v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->config_begin:I

    .line 317
    .line 318
    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_0

    .line 319
    .line 320
    .line 321
    const-string p2, "version"

    .line 322
    .line 323
    :try_start_a
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 324
    .line 325
    iget-object v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->version:Ljava/lang/String;

    .line 326
    .line 327
    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_0

    .line 328
    .line 329
    .line 330
    const-string p2, "reflect_video"

    .line 331
    .line 332
    :try_start_b
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 333
    .line 334
    iget-object v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->reflect_video:Ljava/lang/String;

    .line 335
    .line 336
    invoke-virtual {p1, p2, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 337
    .line 338
    .line 339
    new-instance p2, Lorg/json/JSONArray;

    .line 340
    .line 341
    invoke-direct {p2}, Lorg/json/JSONArray;-><init>()V

    .line 342
    .line 343
    .line 344
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 345
    .line 346
    iget-object v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->changepoint_time_list:Ljava/util/ArrayList;

    .line 347
    .line 348
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 349
    .line 350
    .line 351
    move-result-object v2

    .line 352
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 353
    .line 354
    .line 355
    move-result v3

    .line 356
    if-eqz v3, :cond_2

    .line 357
    .line 358
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v3

    .line 362
    check-cast v3, Ljava/lang/Long;

    .line 363
    .line 364
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 365
    .line 366
    .line 367
    goto :goto_1

    .line 368
    :catch_0
    move-exception v0

    .line 369
    move-object p0, v0

    .line 370
    goto :goto_3

    .line 371
    :cond_2
    const-string v2, "changepoint_time_list"

    .line 372
    .line 373
    invoke-virtual {p1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 374
    .line 375
    .line 376
    new-instance p2, Lorg/json/JSONArray;

    .line 377
    .line 378
    invoke-direct {p2}, Lorg/json/JSONArray;-><init>()V

    .line 379
    .line 380
    .line 381
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 382
    .line 383
    iget-object p0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->images_data:Ljava/util/ArrayList;

    .line 384
    .line 385
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 386
    .line 387
    .line 388
    move-result-object p0

    .line 389
    :goto_2
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 390
    .line 391
    .line 392
    move-result v2

    .line 393
    if-eqz v2, :cond_3

    .line 394
    .line 395
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object v2

    .line 399
    check-cast v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;

    .line 400
    .line 401
    new-instance v3, Lorg/json/JSONObject;

    .line 402
    .line 403
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_0

    .line 404
    .line 405
    .line 406
    const-string v4, "image"

    .line 407
    .line 408
    :try_start_c
    iget-object v5, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->image:Ljava/lang/String;

    .line 409
    .line 410
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_0

    .line 411
    .line 412
    .line 413
    const-string v4, "capture_time"

    .line 414
    .line 415
    :try_start_d
    iget-wide v5, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->capture_time:J

    .line 416
    .line 417
    invoke-virtual {v3, v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_0

    .line 418
    .line 419
    .line 420
    const-string v4, "checksum"

    .line 421
    .line 422
    :try_start_e
    iget-object v5, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->checksum:Ljava/lang/String;

    .line 423
    .line 424
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_e
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_e} :catch_0

    .line 425
    .line 426
    .line 427
    const-string v4, "x"

    .line 428
    .line 429
    :try_start_f
    iget v5, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->x:I

    .line 430
    .line 431
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_f
    .catch Lorg/json/JSONException; {:try_start_f .. :try_end_f} :catch_0

    .line 432
    .line 433
    .line 434
    const-string v4, "y"

    .line 435
    .line 436
    :try_start_10
    iget v2, v2, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->y:I

    .line 437
    .line 438
    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 439
    .line 440
    .line 441
    invoke-virtual {p2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 442
    .line 443
    .line 444
    goto :goto_2

    .line 445
    :cond_3
    const-string p0, "images_data"

    .line 446
    .line 447
    invoke-virtual {p1, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 448
    .line 449
    .line 450
    iput-object p1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ActionReflectLiveReq;->reflect_data:Lorg/json/JSONObject;

    .line 451
    .line 452
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 453
    .line 454
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 455
    .line 456
    .line 457
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object v1

    .line 461
    new-instance p0, Lorg/json/JSONObject;

    .line 462
    .line 463
    invoke-direct {p0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 464
    .line 465
    .line 466
    const-string p2, "reflect_data"

    .line 467
    .line 468
    invoke-virtual {p0, p2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 469
    .line 470
    .line 471
    invoke-virtual {p0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 472
    .line 473
    .line 474
    move-result-object p0
    :try_end_10
    .catch Lorg/json/JSONException; {:try_start_10 .. :try_end_10} :catch_0

    .line 475
    return-object p0

    .line 476
    :goto_3
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->TAG:Ljava/lang/String;

    .line 477
    .line 478
    const-string p2, "make ref json error"

    .line 479
    .line 480
    invoke-static {p1, p2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 481
    .line 482
    .line 483
    return-object v1

    .line 484
    :cond_4
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 485
    .line 486
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 487
    .line 488
    .line 489
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object p0

    .line 493
    return-object p0
.end method

.method public static makeFourLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReqData;)Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReq;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReqData;->baseInfoData:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReq;->app_id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReqData;->validateData:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReq;->validate_data:Ljava/lang/String;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReqData;->video:Ljava/lang/String;

    .line 17
    .line 18
    iput-object p0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReq;->video:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToCompare:Landroid/graphics/Bitmap;

    .line 29
    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 33
    .line 34
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 35
    .line 36
    .line 37
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 38
    .line 39
    const/16 v3, 0x5f

    .line 40
    .line 41
    invoke-virtual {p0, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    const/4 v1, 0x2

    .line 49
    invoke-static {p0, v1}, Landroid/util/Base64;->encode([BI)[B

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    new-instance v1, Ljava/lang/String;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([B)V

    .line 56
    .line 57
    .line 58
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FourLiveReq;->compare_image:Ljava/lang/String;

    .line 59
    .line 60
    :cond_0
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 61
    .line 62
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method public static makeGetFourLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetFourLiveTypeReqData;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetFourLiveTypeReq;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetFourLiveTypeReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetFourLiveTypeReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetFourLiveTypeReq;->app_id:Ljava/lang/String;

    .line 11
    .line 12
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 13
    .line 14
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public static makeGetLiveTypeReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;)Ljava/lang/String;
    .locals 9

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 7
    .line 8
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;->app_id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;->business_name:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->personId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;->person_id:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v2, 0x2

    .line 21
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;->platform:I

    .line 22
    .line 23
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;->session_id:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;

    .line 28
    .line 29
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->sdk_version:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->ftrack_sdk_version:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_ACTREFLECT_TYPE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 57
    .line 58
    if-ne v2, v3, :cond_0

    .line 59
    .line 60
    invoke-static {}, Lcom/tencent/youtu/ytposedetect/jni/YTPoseDetectJNIInterface;->getVersion()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->faction_sdk_version:Ljava/lang/String;

    .line 65
    .line 66
    :cond_0
    const-string v2, "3.6.9.2"

    .line 67
    .line 68
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->freflect_sdk_version:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->makeVersion()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v7

    .line 74
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 75
    .line 76
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 77
    .line 78
    iget v4, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 79
    .line 80
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->colorNum:I

    .line 81
    .line 82
    iget-object v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->reflectConfig:Ljava/lang/String;

    .line 83
    .line 84
    iget-object v8, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->controlConfig:Ljava/lang/String;

    .line 85
    .line 86
    invoke-direct/range {v3 .. v8}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;-><init>(FILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReq;->select_data:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 90
    .line 91
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$GetLiveTypeReqData;->controlConfig:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v3, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;->setConfig(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 97
    .line 98
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    return-object p0
.end method

.method public static makeLipReadReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;)Ljava/lang/String;
    .locals 11

    .line 1
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;

    .line 2
    .line 3
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 7
    .line 8
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->app_id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->business_name:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->personId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->person_id:Ljava/lang/String;

    .line 19
    .line 20
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 21
    .line 22
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 26
    .line 27
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;

    .line 28
    .line 29
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->sdk_version:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->ftrack_sdk_version:Ljava/lang/String;

    .line 47
    .line 48
    const-string v2, "3.6.9.2"

    .line 49
    .line 50
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->freflect_sdk_version:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->makeVersion()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 57
    .line 58
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 59
    .line 60
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 61
    .line 62
    iget v4, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 63
    .line 64
    const-string v6, ""

    .line 65
    .line 66
    const-string v8, ""

    .line 67
    .line 68
    const/4 v5, 0x0

    .line 69
    invoke-direct/range {v3 .. v8}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;-><init>(FILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->select_data:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 73
    .line 74
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 75
    .line 76
    new-instance v2, Ljava/util/ArrayList;

    .line 77
    .line 78
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 79
    .line 80
    .line 81
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->frames:Ljava/util/ArrayList;

    .line 82
    .line 83
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;

    .line 84
    .line 85
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;-><init>()V

    .line 86
    .line 87
    .line 88
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->liveImage:Ljava/lang/String;

    .line 89
    .line 90
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->image:Ljava/lang/String;

    .line 91
    .line 92
    new-instance v2, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->x_coordinates:Ljava/util/ArrayList;

    .line 98
    .line 99
    new-instance v2, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->y_coordinates:Ljava/util/ArrayList;

    .line 105
    .line 106
    const/4 v2, 0x0

    .line 107
    move v3, v2

    .line 108
    :goto_0
    const/4 v4, 0x5

    .line 109
    if-ge v3, v4, :cond_0

    .line 110
    .line 111
    iget-object v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->x_coordinates:Ljava/util/ArrayList;

    .line 112
    .line 113
    iget-object v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->liveFivePoint:[F

    .line 114
    .line 115
    mul-int/lit8 v6, v3, 0x2

    .line 116
    .line 117
    aget v5, v5, v6

    .line 118
    .line 119
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    iget-object v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->y_coordinates:Ljava/util/ArrayList;

    .line 127
    .line 128
    iget-object v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->liveFivePoint:[F

    .line 129
    .line 130
    add-int/lit8 v6, v6, 0x1

    .line 131
    .line 132
    aget v5, v5, v6

    .line 133
    .line 134
    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    add-int/lit8 v3, v3, 0x1

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_0
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 145
    .line 146
    iget-object v3, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->frames:Ljava/util/ArrayList;

    .line 147
    .line 148
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 152
    .line 153
    iget-object v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->faceExtraInfo:Ljava/lang/String;

    .line 154
    .line 155
    invoke-direct {v0, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 156
    .line 157
    .line 158
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;

    .line 159
    .line 160
    invoke-direct {v3}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;-><init>()V

    .line 161
    .line 162
    .line 163
    const-string v5, "openmouth_img"

    .line 164
    .line 165
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    iput-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->image:Ljava/lang/String;

    .line 170
    .line 171
    new-instance v5, Ljava/util/ArrayList;

    .line 172
    .line 173
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 174
    .line 175
    .line 176
    iput-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->x_coordinates:Ljava/util/ArrayList;

    .line 177
    .line 178
    new-instance v5, Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .line 182
    .line 183
    iput-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->y_coordinates:Ljava/util/ArrayList;

    .line 184
    .line 185
    const-string v5, "openmouth_5pts"

    .line 186
    .line 187
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 188
    .line 189
    .line 190
    move-result-object v5

    .line 191
    move v6, v2

    .line 192
    :goto_1
    if-ge v6, v4, :cond_1

    .line 193
    .line 194
    iget-object v7, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->x_coordinates:Ljava/util/ArrayList;

    .line 195
    .line 196
    mul-int/lit8 v8, v6, 0x2

    .line 197
    .line 198
    invoke-virtual {v5, v8}, Lorg/json/JSONArray;->optDouble(I)D

    .line 199
    .line 200
    .line 201
    move-result-wide v9

    .line 202
    double-to-float v9, v9

    .line 203
    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 204
    .line 205
    .line 206
    move-result-object v9

    .line 207
    invoke-virtual {v7, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    iget-object v7, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->y_coordinates:Ljava/util/ArrayList;

    .line 211
    .line 212
    add-int/lit8 v8, v8, 0x1

    .line 213
    .line 214
    invoke-virtual {v5, v8}, Lorg/json/JSONArray;->optDouble(I)D

    .line 215
    .line 216
    .line 217
    move-result-wide v8

    .line 218
    double-to-float v8, v8

    .line 219
    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 220
    .line 221
    .line 222
    move-result-object v8

    .line 223
    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    add-int/lit8 v6, v6, 0x1

    .line 227
    .line 228
    goto :goto_1

    .line 229
    :catch_0
    move-exception v0

    .line 230
    goto :goto_3

    .line 231
    :cond_1
    iget-object v5, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 232
    .line 233
    iget-object v5, v5, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->frames:Ljava/util/ArrayList;

    .line 234
    .line 235
    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;

    .line 239
    .line 240
    invoke-direct {v3}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;-><init>()V

    .line 241
    .line 242
    .line 243
    const-string v5, "closeeye_img"

    .line 244
    .line 245
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v5

    .line 249
    iput-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->image:Ljava/lang/String;

    .line 250
    .line 251
    new-instance v5, Ljava/util/ArrayList;

    .line 252
    .line 253
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 254
    .line 255
    .line 256
    iput-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->x_coordinates:Ljava/util/ArrayList;

    .line 257
    .line 258
    new-instance v5, Ljava/util/ArrayList;

    .line 259
    .line 260
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .line 262
    .line 263
    iput-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->y_coordinates:Ljava/util/ArrayList;

    .line 264
    .line 265
    const-string v5, "closeeye_5pts"

    .line 266
    .line 267
    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    :goto_2
    if-ge v2, v4, :cond_2

    .line 272
    .line 273
    iget-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->x_coordinates:Ljava/util/ArrayList;

    .line 274
    .line 275
    mul-int/lit8 v6, v2, 0x2

    .line 276
    .line 277
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->optDouble(I)D

    .line 278
    .line 279
    .line 280
    move-result-wide v7

    .line 281
    double-to-float v7, v7

    .line 282
    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 283
    .line 284
    .line 285
    move-result-object v7

    .line 286
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    iget-object v5, v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->y_coordinates:Ljava/util/ArrayList;

    .line 290
    .line 291
    add-int/lit8 v6, v6, 0x1

    .line 292
    .line 293
    invoke-virtual {v0, v6}, Lorg/json/JSONArray;->optDouble(I)D

    .line 294
    .line 295
    .line 296
    move-result-wide v6

    .line 297
    double-to-float v6, v6

    .line 298
    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 299
    .line 300
    .line 301
    move-result-object v6

    .line 302
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 303
    .line 304
    .line 305
    add-int/lit8 v2, v2, 0x1

    .line 306
    .line 307
    goto :goto_2

    .line 308
    :cond_2
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 309
    .line 310
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->frames:Ljava/util/ArrayList;

    .line 311
    .line 312
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 313
    .line 314
    .line 315
    goto :goto_4

    .line 316
    :goto_3
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->TAG:Ljava/lang/String;

    .line 317
    .line 318
    const-string v3, "Failed parse extra face list "

    .line 319
    .line 320
    invoke-static {v2, v3, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 321
    .line 322
    .line 323
    :goto_4
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 324
    .line 325
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->validate_data:Ljava/lang/String;

    .line 326
    .line 327
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->validate_data:Ljava/lang/String;

    .line 328
    .line 329
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->voice:Ljava/lang/String;

    .line 330
    .line 331
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->voice:Ljava/lang/String;

    .line 332
    .line 333
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->mouth_move:Ljava/lang/String;

    .line 334
    .line 335
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->mouth_move:Ljava/lang/String;

    .line 336
    .line 337
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->mouth_lip_reading:Ljava/lang/String;

    .line 338
    .line 339
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->mouth_lip_reading:Ljava/lang/String;

    .line 340
    .line 341
    const/4 v2, 0x2

    .line 342
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->platform:I

    .line 343
    .line 344
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LipReadReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 345
    .line 346
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->personType:Ljava/lang/String;

    .line 347
    .line 348
    iput-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->person_type:Ljava/lang/String;

    .line 349
    .line 350
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->liveType:I

    .line 351
    .line 352
    iput v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->live_type:I

    .line 353
    .line 354
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->reqType:Ljava/lang/String;

    .line 355
    .line 356
    iput-object p0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->req_type:Ljava/lang/String;

    .line 357
    .line 358
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 359
    .line 360
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 361
    .line 362
    .line 363
    invoke-virtual {p0, v1}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p0

    .line 367
    return-object p0
.end method

.method public static makePersonLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;)Ljava/lang/String;
    .locals 9

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 7
    .line 8
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->app_id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->business_name:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->personId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->person_id:Ljava/lang/String;

    .line 19
    .line 20
    iget v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->liveType:I

    .line 21
    .line 22
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->live_type:I

    .line 23
    .line 24
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->reqType:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->req_type:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->request_id:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->personType:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->person_type:Ljava/lang/String;

    .line 35
    .line 36
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 37
    .line 38
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 42
    .line 43
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;

    .line 44
    .line 45
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->sdk_version:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->ftrack_sdk_version:Ljava/lang/String;

    .line 63
    .line 64
    const-string v2, "3.6.9.2"

    .line 65
    .line 66
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->freflect_sdk_version:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->makeVersion()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v7

    .line 72
    iget-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 73
    .line 74
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 75
    .line 76
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 77
    .line 78
    iget v4, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 79
    .line 80
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->colorNum:I

    .line 81
    .line 82
    iget-object v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->config:Ljava/lang/String;

    .line 83
    .line 84
    const-string v8, ""

    .line 85
    .line 86
    invoke-direct/range {v3 .. v8}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;-><init>(FILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iput-object v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->select_data:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 90
    .line 91
    iget-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 92
    .line 93
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 94
    .line 95
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 96
    .line 97
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->colorData:Ljava/lang/String;

    .line 98
    .line 99
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->color_data:Ljava/lang/String;

    .line 100
    .line 101
    const/4 v2, 0x2

    .line 102
    iput v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->platform:I

    .line 103
    .line 104
    new-instance v2, Ljava/util/ArrayList;

    .line 105
    .line 106
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .line 108
    .line 109
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->frames:Ljava/util/ArrayList;

    .line 110
    .line 111
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;

    .line 112
    .line 113
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;-><init>()V

    .line 114
    .line 115
    .line 116
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->bestImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 117
    .line 118
    iget-object v2, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;->image:Ljava/lang/String;

    .line 119
    .line 120
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->image:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 123
    .line 124
    iget-object v2, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->frames:Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;

    .line 130
    .line 131
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;-><init>()V

    .line 132
    .line 133
    .line 134
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->openMouthImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 135
    .line 136
    iget-object v2, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;->image:Ljava/lang/String;

    .line 137
    .line 138
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->image:Ljava/lang/String;

    .line 139
    .line 140
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 141
    .line 142
    iget-object v2, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->frames:Ljava/util/ArrayList;

    .line 143
    .line 144
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;

    .line 148
    .line 149
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;-><init>()V

    .line 150
    .line 151
    .line 152
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->openMouthImage:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 153
    .line 154
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;->image:Ljava/lang/String;

    .line 155
    .line 156
    iput-object p0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$FaceFrame;->image:Ljava/lang/String;

    .line 157
    .line 158
    iget-object p0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLiveReq;->livedata:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;

    .line 159
    .line 160
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PersonLive;->frames:Ljava/util/ArrayList;

    .line 161
    .line 162
    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 166
    .line 167
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0
.end method

.method public static makePictureLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveReqData;)Ljava/lang/String;
    .locals 9

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveDetectReq;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveDetectReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 7
    .line 8
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveDetectReq;->app_id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveDetectReq;->session_id:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveReqData;->imageInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;

    .line 17
    .line 18
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;->five_points:Ljava/util/ArrayList;

    .line 19
    .line 20
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveDetectReq;->five_point:Ljava/util/ArrayList;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ImageInfo;->image:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveDetectReq;->image:Ljava/lang/String;

    .line 25
    .line 26
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;

    .line 27
    .line 28
    invoke-direct {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->sdk_version:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->ftrack_sdk_version:Ljava/lang/String;

    .line 46
    .line 47
    const-string v2, "3.6.9.2"

    .line 48
    .line 49
    iput-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->freflect_sdk_version:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v1}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->makeVersion()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 56
    .line 57
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 58
    .line 59
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 60
    .line 61
    const-string v6, ""

    .line 62
    .line 63
    const-string v8, ""

    .line 64
    .line 65
    const/4 v5, 0x0

    .line 66
    invoke-direct/range {v3 .. v8}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;-><init>(FILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iput-object v3, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$PictureLiveDetectReq;->select_data:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 70
    .line 71
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 72
    .line 73
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method

.method public static makeReflectLiveReq(Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;)Ljava/lang/String;
    .locals 10

    .line 1
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 7
    .line 8
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->appId:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->app_id:Ljava/lang/String;

    .line 11
    .line 12
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->sessionId:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->session_id:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->businessId:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->business_id:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    iput v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->platform:I

    .line 22
    .line 23
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->colorData:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->color_data:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->liveImage:Ljava/lang/String;

    .line 28
    .line 29
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->live_image:Ljava/lang/String;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->reflectData:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 32
    .line 33
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 34
    .line 35
    new-instance v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;

    .line 36
    .line 37
    invoke-direct {v2}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->sdk_version:Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getVersion()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v3

    .line 54
    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->ftrack_sdk_version:Ljava/lang/String;

    .line 55
    .line 56
    const-string v3, "3.6.9.2"

    .line 57
    .line 58
    iput-object v3, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->freflect_sdk_version:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$Version;->makeVersion()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    new-instance v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 65
    .line 66
    iget-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->baseInfo:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;

    .line 67
    .line 68
    iget v5, v2, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$NetBaseInfoData;->lux:F

    .line 69
    .line 70
    iget v6, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->colorNum:I

    .line 71
    .line 72
    iget-object v7, p0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReqData;->config:Ljava/lang/String;

    .line 73
    .line 74
    const-string v9, ""

    .line 75
    .line 76
    invoke-direct/range {v4 .. v9}, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;-><init>(FILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iput-object v4, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->select_data:Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$LiveStyleRequester$SeleceData;

    .line 80
    .line 81
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToCompare:Landroid/graphics/Bitmap;

    .line 90
    .line 91
    if-eqz p0, :cond_0

    .line 92
    .line 93
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    .line 94
    .line 95
    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 96
    .line 97
    .line 98
    sget-object v3, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 99
    .line 100
    const/16 v4, 0x5f

    .line 101
    .line 102
    invoke-virtual {p0, v3, v4, v2}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-static {p0, v1}, Landroid/util/Base64;->encode([BI)[B

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    new-instance v1, Ljava/lang/String;

    .line 114
    .line 115
    invoke-direct {v1, p0}, Ljava/lang/String;-><init>([B)V

    .line 116
    .line 117
    .line 118
    iput-object v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->compare_image:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToComapreType:I

    .line 129
    .line 130
    iput p0, v0, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper$ReflectLiveReq;->compare_image_type:I

    .line 131
    .line 132
    :cond_0
    new-instance p0, Lcom/tencent/youtu/sdkkitframework/common/WeJson;

    .line 133
    .line 134
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/common/WeJson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    return-object p0
.end method

.method public static removeKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6

    .line 1
    const-string v0, "&"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    move v3, v2

    .line 11
    :goto_0
    array-length v4, p0

    .line 12
    if-ge v3, v4, :cond_2

    .line 13
    .line 14
    aget-object v4, p0, v3

    .line 15
    .line 16
    const-string v5, "="

    .line 17
    .line 18
    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    aget-object v4, v4, v2

    .line 23
    .line 24
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_0

    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    if-nez v4, :cond_1

    .line 36
    .line 37
    aget-object v4, p0, v3

    .line 38
    .line 39
    invoke-virtual {v1, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    aget-object v4, p0, v3

    .line 49
    .line 50
    invoke-virtual {v1, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    :goto_1
    sget-object v4, Lcom/tencent/youtu/sdkkitframework/liveness/YtLivenessNetProtoHelper;->TAG:Ljava/lang/String;

    .line 55
    .line 56
    const-string v5, "result: "

    .line 57
    .line 58
    invoke-virtual {v5, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    invoke-static {v4, v5}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    :goto_2
    add-int/lit8 v3, v3, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    return-object v1
.end method
