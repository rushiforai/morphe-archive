.class public Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public app_id:Ljava/lang/String;

.field public client_version:Ljava/lang/String;

.field public color_data:Ljava/lang/String;

.field public compare_image:Ljava/lang/String;

.field public encode_reflect_data:Ljava/lang/String;

.field public live_image:Ljava/lang/String;

.field public platform:I

.field public reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

.field public reserve:Ljava/lang/String;

.field public select_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

.field public session_id:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->app_id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->color_data:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    iput v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->platform:I

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->live_image:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->compare_image:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->session_id:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->encode_reflect_data:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->reserve:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->client_version:Ljava/lang/String;

    .line 27
    .line 28
    return-void
.end method
