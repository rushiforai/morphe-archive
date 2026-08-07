.class public Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public action_video:Ljava/lang/String;

.field public app_id:Ljava/lang/String;

.field public client_version:Ljava/lang/String;

.field public color_data:Ljava/lang/String;

.field public compare_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

.field public encode_reflect_data:Ljava/lang/String;

.field public eye_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

.field public live_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

.field public mode:I

.field public mouth_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

.field public platform:I

.field public reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

.field public reserve:Ljava/lang/String;

.field public select_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

.field public session_id:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->app_id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->color_data:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    iput v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->platform:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->live_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->eye_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->mouth_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->compare_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->session_id:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 25
    .line 26
    const/4 v1, 0x0

    .line 27
    iput v1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->mode:I

    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->encode_reflect_data:Ljava/lang/String;

    .line 30
    .line 31
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->reserve:Ljava/lang/String;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->action_video:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->client_version:Ljava/lang/String;

    .line 36
    .line 37
    return-void
.end method
