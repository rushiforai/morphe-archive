.class public Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;
.super Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;
    }
.end annotation


# instance fields
.field public A:I

.field public B:Z

.field public C:F

.field public D:F

.field public E:F

.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

.field public e:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

.field public f:I

.field public g:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

.field public h:I

.field public i:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

.field public j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

.field public k:Z

.field public l:I

.field public m:Z

.field public n:I

.field public o:Ljava/lang/String;

.field public p:Lcom/tencent/youtu/liveness/YTFaceTracker$Param;

.field public q:Z

.field public r:Ljava/lang/String;

.field public s:I

.field public t:Z

.field public u:Z

.field public v:Lcom/tencent/youtu/liveness/YTFaceTracker;

.field public w:Ljava/lang/String;

.field public x:I

.field public y:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

.field public z:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "3.6.2"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a:Ljava/lang/String;

    .line 7
    .line 8
    const/4 v0, -0x1

    .line 9
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 10
    .line 11
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;->b:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->g:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->h:I

    .line 17
    .line 18
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 19
    .line 20
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    iput-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->k:Z

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->l:I

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->m:Z

    .line 29
    .line 30
    const/4 v2, 0x5

    .line 31
    iput v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->n:I

    .line 32
    .line 33
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->q:Z

    .line 34
    .line 35
    const-string v2, ""

    .line 36
    .line 37
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->r:Ljava/lang/String;

    .line 38
    .line 39
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->s:I

    .line 40
    .line 41
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->t:Z

    .line 42
    .line 43
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->u:Z

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->v:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 47
    .line 48
    iput-object v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->w:Ljava/lang/String;

    .line 49
    .line 50
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->x:I

    .line 51
    .line 52
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 53
    .line 54
    const-string v2, "reflect tips timeout counter"

    .line 55
    .line 56
    invoke-direct {v1, v2}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->y:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 60
    .line 61
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->z:Z

    .line 62
    .line 63
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->B:Z

    .line 64
    .line 65
    const/high16 v0, 0x42480000    # 50.0f

    .line 66
    .line 67
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->C:F

    .line 68
    .line 69
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->D:F

    .line 70
    .line 71
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->E:F

    .line 72
    .line 73
    return-void
.end method

.method public static a(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    .locals 7

    .line 385
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    .line 386
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float p1, p1

    int-to-float v0, v3

    div-float/2addr p1, v0

    int-to-float p2, p2

    int-to-float v0, v4

    div-float/2addr p2, v0

    .line 387
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 388
    invoke-virtual {v5, p1, p2}, Landroid/graphics/Matrix;->postScale(FF)Z

    const/4 v2, 0x0

    const/4 v6, 0x1

    const/4 v1, 0x0

    move-object v0, p0

    .line 389
    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)Ljava/lang/String;
    .locals 0

    .line 390
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a:Ljava/lang/String;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;Z)Z
    .locals 0

    .line 378
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->k:Z

    return p1
.end method


# virtual methods
.method public final a(Lcom/tencent/youtu/ytagreflectlivecheck/a;Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectData;Ljava/lang/String;)Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;
    .locals 2

    .line 406
    new-instance v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;

    invoke-direct {v0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;-><init>()V

    .line 407
    sget-object v1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAppId:Ljava/lang/String;

    iput-object v1, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->app_id:Ljava/lang/String;

    .line 408
    iput-object p3, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->color_data:Ljava/lang/String;

    const/4 p3, 0x2

    .line 409
    iput p3, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->platform:I

    .line 410
    iget-object p3, p2, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectData;->select_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    iput-object p3, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->select_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    if-eqz p1, :cond_0

    .line 411
    invoke-virtual {p0, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b(Lcom/tencent/youtu/ytagreflectlivecheck/a;)Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    move-result-object p0

    iput-object p0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 412
    :cond_0
    new-instance p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    iget-object p1, p2, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectData;->best:Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;

    invoke-direct {p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;-><init>(Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;)V

    iput-object p0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->live_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    .line 413
    new-instance p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    iget-object p1, p2, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectData;->eye:Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;

    invoke-direct {p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;-><init>(Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;)V

    iput-object p0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->eye_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    .line 414
    new-instance p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    iget-object p1, p2, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectData;->mouth:Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;

    invoke-direct {p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;-><init>(Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;)V

    iput-object p0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->mouth_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    const/4 p0, 0x0

    .line 415
    iput-object p0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->compare_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    const/4 p1, 0x0

    .line 416
    iput p1, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->mode:I

    .line 417
    iput-object p0, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->session_id:Ljava/lang/String;

    return-object v0
.end method

.method public final a()V
    .locals 1

    .line 379
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->g:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    const/4 v0, 0x0

    .line 380
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->h:I

    const/4 v0, -0x1

    .line 381
    iput v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    const/4 v0, 0x1

    .line 382
    iput-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->k:Z

    .line 383
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 384
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->cancel()V

    return-void
.end method

.method public final a(ILjava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 391
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "message:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\ntips:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "\ncode:"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    .line 392
    const-string v0, "failed :"

    invoke-virtual {v0, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    const-string v0, "ReflectLivenessState"

    const/4 v1, 0x0

    invoke-static {v0, p3, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    const/high16 p3, 0x400000

    .line 393
    invoke-static {p3, p2, p2}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->makeMessageJson(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 394
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 395
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "ui_tips"

    const-string v3, "rst_failed"

    .line 396
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ui_action"

    const-string v3, "process_finished"

    .line 397
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "process_action"

    const-string v3, "failed"

    .line 398
    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0x1f4

    const-string v3, "error_code"

    if-ne p1, v2, :cond_0

    const p3, -0xf425b

    .line 399
    invoke-static {p3, p2, p2}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->makeMessageJson(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 400
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, v3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 401
    :cond_0
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {v1, v3, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 402
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const-string p2, "error_reason_code"

    invoke-virtual {v1, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "message"

    .line 403
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 405
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;->d:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->g:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    return-void
.end method

.method public final a(Lcom/tencent/youtu/ytagreflectlivecheck/a;)V
    .locals 16

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_ACTREFLECT_TYPE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 14
    .line 15
    const-string v4, "reflect_request_object"

    .line 16
    .line 17
    const/16 v5, 0x5f

    .line 18
    .line 19
    const-string v6, " to w:"

    .line 20
    .line 21
    const-string v7, " h:"

    .line 22
    .line 23
    const-string v8, "ReflectLivenessState"

    .line 24
    .line 25
    const/16 v10, 0x280

    .line 26
    .line 27
    const-string v11, "resize image. from w:"

    .line 28
    .line 29
    if-ne v2, v3, :cond_3

    .line 30
    .line 31
    :try_start_0
    new-instance v2, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectData;

    .line 32
    .line 33
    new-instance v3, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;

    .line 34
    .line 35
    iget-object v12, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->d:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 36
    .line 37
    iget-object v12, v12, Lcom/tencent/youtu/ytposedetect/data/YTActRefData;->best:Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;

    .line 38
    .line 39
    iget-object v13, v12, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->image:[B

    .line 40
    .line 41
    iget-object v14, v12, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->xys:[F

    .line 42
    .line 43
    iget-object v12, v12, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->checksum:Ljava/lang/String;

    .line 44
    .line 45
    invoke-direct {v3, v13, v14, v12}, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;-><init>([B[FLjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v12, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;

    .line 49
    .line 50
    iget-object v13, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->d:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 51
    .line 52
    iget-object v13, v13, Lcom/tencent/youtu/ytposedetect/data/YTActRefData;->eye:Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;

    .line 53
    .line 54
    iget-object v14, v13, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->image:[B

    .line 55
    .line 56
    iget-object v15, v13, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->xys:[F

    .line 57
    .line 58
    iget-object v13, v13, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->checksum:Ljava/lang/String;

    .line 59
    .line 60
    invoke-direct {v12, v14, v15, v13}, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;-><init>([B[FLjava/lang/String;)V

    .line 61
    .line 62
    .line 63
    new-instance v13, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;

    .line 64
    .line 65
    iget-object v14, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->d:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 66
    .line 67
    iget-object v14, v14, Lcom/tencent/youtu/ytposedetect/data/YTActRefData;->mouth:Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;

    .line 68
    .line 69
    iget-object v15, v14, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->image:[B

    .line 70
    .line 71
    iget-object v9, v14, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->xys:[F

    .line 72
    .line 73
    iget-object v14, v14, Lcom/tencent/youtu/ytposedetect/data/YTActRefImage;->checksum:Ljava/lang/String;

    .line 74
    .line 75
    invoke-direct {v13, v15, v9, v14}, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;-><init>([B[FLjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget-object v9, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->e:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    .line 79
    .line 80
    invoke-direct {v2, v3, v12, v13, v9}, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectData;-><init>(Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;)V

    .line 81
    .line 82
    .line 83
    iget-object v3, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {v1, v0, v2, v3}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a(Lcom/tencent/youtu/ytagreflectlivecheck/a;Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectData;Ljava/lang/String;)Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->c:Ljava/lang/String;

    .line 90
    .line 91
    iput-object v2, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->app_id:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    iget-object v2, v2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToCompare:Landroid/graphics/Bitmap;

    .line 102
    .line 103
    if-eqz v2, :cond_2

    .line 104
    .line 105
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    .line 106
    .line 107
    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 108
    .line 109
    .line 110
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 111
    .line 112
    .line 113
    move-result v9

    .line 114
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 115
    .line 116
    .line 117
    move-result v12

    .line 118
    if-le v9, v12, :cond_0

    .line 119
    .line 120
    move v13, v9

    .line 121
    goto :goto_0

    .line 122
    :cond_0
    move v13, v12

    .line 123
    :goto_0
    if-le v13, v10, :cond_1

    .line 124
    .line 125
    mul-int/lit16 v10, v9, 0x280

    .line 126
    .line 127
    div-int/2addr v10, v13

    .line 128
    mul-int/lit16 v14, v12, 0x280

    .line 129
    .line 130
    div-int/2addr v14, v13

    .line 131
    invoke-static {v2, v10, v14}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    new-instance v10, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    .line 153
    .line 154
    .line 155
    move-result v6

    .line 156
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    .line 163
    .line 164
    .line 165
    move-result v6

    .line 166
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    invoke-static {v8, v6}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :catch_0
    move-exception v0

    .line 178
    goto :goto_2

    .line 179
    :cond_1
    :goto_1
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 180
    .line 181
    invoke-virtual {v2, v6, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    new-instance v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    .line 189
    .line 190
    new-instance v5, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;

    .line 191
    .line 192
    const/4 v6, 0x0

    .line 193
    invoke-direct {v5, v2, v6, v6}, Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;-><init>([B[FLjava/lang/String;)V

    .line 194
    .line 195
    .line 196
    invoke-direct {v3, v5}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;-><init>(Lcom/tencent/youtu/ytagreflectlivecheck/data/YTActReflectImage;)V

    .line 197
    .line 198
    .line 199
    iput-object v3, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->compare_image:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/YTImageInfo;

    .line 200
    .line 201
    :cond_2
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b:Ljava/lang/String;

    .line 202
    .line 203
    iput-object v2, v0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ActionReflectReq;->color_data:Ljava/lang/String;

    .line 204
    .line 205
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 206
    .line 207
    invoke-virtual {v2, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 208
    .line 209
    .line 210
    goto/16 :goto_5

    .line 211
    .line 212
    :goto_2
    const-string v2, "Handle actref data failed:"

    .line 213
    .line 214
    invoke-static {v8, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 215
    .line 216
    .line 217
    goto/16 :goto_5

    .line 218
    .line 219
    :cond_3
    iget-object v2, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b:Ljava/lang/String;

    .line 220
    .line 221
    new-instance v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;

    .line 222
    .line 223
    invoke-direct {v3}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;-><init>()V

    .line 224
    .line 225
    .line 226
    iput-object v2, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->color_data:Ljava/lang/String;

    .line 227
    .line 228
    const/4 v2, 0x2

    .line 229
    iput v2, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->platform:I

    .line 230
    .line 231
    if-eqz v0, :cond_4

    .line 232
    .line 233
    invoke-virtual/range {p0 .. p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b(Lcom/tencent/youtu/ytagreflectlivecheck/a;)Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    iput-object v0, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->reflect_data:Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 238
    .line 239
    const/4 v0, 0x0

    .line 240
    iput-object v0, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->live_image:Ljava/lang/String;

    .line 241
    .line 242
    goto :goto_3

    .line 243
    :cond_4
    const/4 v0, 0x0

    .line 244
    :goto_3
    iput-object v0, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->compare_image:Ljava/lang/String;

    .line 245
    .line 246
    iput-object v0, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->session_id:Ljava/lang/String;

    .line 247
    .line 248
    sget-object v0, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->mAppId:Ljava/lang/String;

    .line 249
    .line 250
    iput-object v0, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->app_id:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    invoke-virtual {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    iget-object v0, v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->imageToCompare:Landroid/graphics/Bitmap;

    .line 261
    .line 262
    if-eqz v0, :cond_7

    .line 263
    .line 264
    new-instance v9, Ljava/io/ByteArrayOutputStream;

    .line 265
    .line 266
    invoke-direct {v9}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 267
    .line 268
    .line 269
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 270
    .line 271
    .line 272
    move-result v12

    .line 273
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 274
    .line 275
    .line 276
    move-result v13

    .line 277
    if-le v12, v13, :cond_5

    .line 278
    .line 279
    move v14, v12

    .line 280
    goto :goto_4

    .line 281
    :cond_5
    move v14, v13

    .line 282
    :goto_4
    if-le v14, v10, :cond_6

    .line 283
    .line 284
    mul-int/lit16 v10, v12, 0x280

    .line 285
    .line 286
    div-int/2addr v10, v14

    .line 287
    mul-int/lit16 v15, v13, 0x280

    .line 288
    .line 289
    div-int/2addr v15, v14

    .line 290
    invoke-static {v0, v10, v15}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a(Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    new-instance v10, Ljava/lang/StringBuilder;

    .line 295
    .line 296
    invoke-direct {v10, v11}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 309
    .line 310
    .line 311
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 312
    .line 313
    .line 314
    move-result v6

    .line 315
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 322
    .line 323
    .line 324
    move-result v6

    .line 325
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v6

    .line 332
    invoke-static {v8, v6}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 333
    .line 334
    .line 335
    :cond_6
    sget-object v6, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 336
    .line 337
    invoke-virtual {v0, v6, v5, v9}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 338
    .line 339
    .line 340
    invoke-virtual {v9}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    new-instance v5, Ljava/lang/String;

    .line 345
    .line 346
    invoke-static {v0, v2}, Landroid/util/Base64;->encode([BI)[B

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    invoke-direct {v5, v0}, Ljava/lang/String;-><init>([B)V

    .line 351
    .line 352
    .line 353
    iput-object v5, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->compare_image:Ljava/lang/String;

    .line 354
    .line 355
    :cond_7
    const-string v0, "on Request..."

    .line 356
    .line 357
    invoke-static {v8, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 358
    .line 359
    .line 360
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b:Ljava/lang/String;

    .line 361
    .line 362
    iput-object v0, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->color_data:Ljava/lang/String;

    .line 363
    .line 364
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->e:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    .line 365
    .line 366
    iput-object v0, v3, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectLiveReq;->select_data:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    .line 367
    .line 368
    iget-object v0, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 369
    .line 370
    invoke-virtual {v0, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    :goto_5
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_LIVENESS_REQ_RESULT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 374
    .line 375
    iput-object v0, v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 376
    .line 377
    return-void
.end method

.method public final b(Lcom/tencent/youtu/ytagreflectlivecheck/a;)Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;
    .locals 9

    .line 1
    const-string v0, "make_pack_use_time_reflection"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v2, "translation reflectImagesShortenStrategy\uff1a"

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget v2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->A:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const-string v2, "ReflectLivenessState"

    .line 23
    .line 24
    invoke-static {v2, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->A:I

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    const/4 v2, 0x2

    .line 31
    const/4 v3, 0x0

    .line 32
    if-ne p0, v1, :cond_1

    .line 33
    .line 34
    move p0, v3

    .line 35
    :goto_0
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->a:[Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;

    .line 36
    .line 37
    array-length v4, v1

    .line 38
    if-ge p0, v4, :cond_1

    .line 39
    .line 40
    if-le p0, v2, :cond_0

    .line 41
    .line 42
    array-length v4, v1

    .line 43
    sub-int/2addr v4, v2

    .line 44
    if-ge p0, v4, :cond_0

    .line 45
    .line 46
    rem-int/lit8 v4, p0, 0x2

    .line 47
    .line 48
    if-eqz v4, :cond_0

    .line 49
    .line 50
    aget-object v1, v1, p0

    .line 51
    .line 52
    new-array v4, v3, [B

    .line 53
    .line 54
    iput-object v4, v1, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;->frameBuffer:[B

    .line 55
    .line 56
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    new-instance p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;

    .line 60
    .line 61
    invoke-direct {p0}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v1, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    move v4, v3

    .line 70
    :goto_1
    iget-object v5, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->a:[Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;

    .line 71
    .line 72
    array-length v6, v5

    .line 73
    if-ge v4, v6, :cond_2

    .line 74
    .line 75
    aget-object v5, v5, v4

    .line 76
    .line 77
    new-instance v6, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;

    .line 78
    .line 79
    invoke-direct {v6}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object v7, v5, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;->frameBuffer:[B

    .line 83
    .line 84
    invoke-static {v7, v2}, Landroid/util/Base64;->encode([BI)[B

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    new-instance v8, Ljava/lang/String;

    .line 89
    .line 90
    invoke-direct {v8, v7}, Ljava/lang/String;-><init>([B)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v6, v8}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->setImage(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object v7, v5, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;->checksum:Ljava/lang/String;

    .line 97
    .line 98
    iput-object v7, v6, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->checksum:Ljava/lang/String;

    .line 99
    .line 100
    iget-wide v7, v5, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;->captureTime:J

    .line 101
    .line 102
    invoke-virtual {v6, v7, v8}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->setCapture_time(J)V

    .line 103
    .line 104
    .line 105
    iget v7, v5, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;->x:I

    .line 106
    .line 107
    invoke-virtual {v6, v7}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->setX(I)V

    .line 108
    .line 109
    .line 110
    iget v5, v5, Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;->y:I

    .line 111
    .line 112
    invoke-virtual {v6, v5}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ColorImgData;->setY(I)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    add-int/lit8 v4, v4, 0x1

    .line 119
    .line 120
    goto :goto_1

    .line 121
    :cond_2
    invoke-virtual {p0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setImages_data(Ljava/util/ArrayList;)V

    .line 122
    .line 123
    .line 124
    iget-wide v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->b:J

    .line 125
    .line 126
    invoke-virtual {p0, v1, v2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setBegin_time(J)V

    .line 127
    .line 128
    .line 129
    iget-wide v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->c:J

    .line 130
    .line 131
    invoke-virtual {p0, v1, v2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setChangepoint_time(J)V

    .line 132
    .line 133
    .line 134
    new-instance v1, Ljava/util/ArrayList;

    .line 135
    .line 136
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .line 138
    .line 139
    iput-object v1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->changepoint_time_list:Ljava/util/ArrayList;

    .line 140
    .line 141
    :goto_2
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->d:[J

    .line 142
    .line 143
    array-length v2, v1

    .line 144
    if-ge v3, v2, :cond_3

    .line 145
    .line 146
    iget-object v2, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->changepoint_time_list:Ljava/util/ArrayList;

    .line 147
    .line 148
    aget-wide v4, v1, v3

    .line 149
    .line 150
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    add-int/lit8 v3, v3, 0x1

    .line 158
    .line 159
    goto :goto_2

    .line 160
    :cond_3
    iget v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->e:F

    .line 161
    .line 162
    invoke-virtual {p0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setOffset_sys(F)V

    .line 163
    .line 164
    .line 165
    iget v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->f:I

    .line 166
    .line 167
    invoke-virtual {p0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setFrame_num(I)V

    .line 168
    .line 169
    .line 170
    iget v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->g:I

    .line 171
    .line 172
    invoke-virtual {p0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setLandmark_num(I)V

    .line 173
    .line 174
    .line 175
    iget v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->h:I

    .line 176
    .line 177
    invoke-virtual {p0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setWidth(I)V

    .line 178
    .line 179
    .line 180
    iget v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->i:I

    .line 181
    .line 182
    invoke-virtual {p0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setHeight(I)V

    .line 183
    .line 184
    .line 185
    const-string v1, "3.6.9.2"

    .line 186
    .line 187
    iput-object v1, p0, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->version:Ljava/lang/String;

    .line 188
    .line 189
    :try_start_0
    new-instance v1, Ljava/lang/String;

    .line 190
    .line 191
    iget-object v2, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->k:[B

    .line 192
    .line 193
    const-string v3, "UTF-8"

    .line 194
    .line 195
    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {p0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 199
    .line 200
    .line 201
    :catch_0
    iget p1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->j:I

    .line 202
    .line 203
    invoke-virtual {p0, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/model/ReflectColorData;->setConfig_begin(I)V

    .line 204
    .line 205
    .line 206
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    .line 211
    .line 212
    .line 213
    move-result-wide v0

    .line 214
    invoke-virtual {p1, v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/OperateInfoManager;->setPackUseTime(J)V

    .line 215
    .line 216
    .line 217
    return-object p0
.end method

.method public enter()V
    .locals 8

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->enter()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    :try_start_0
    const-string v1, "pose_state"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 31
    .line 32
    const-string v1, "continuous_detect_count"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/Integer;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iput v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->h:I

    .line 45
    .line 46
    const-string v1, "face_status"

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, [Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 53
    .line 54
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->i:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 55
    .line 56
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->NET_FETCH_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 61
    .line 62
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    const-string v1, "select_data"

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    .line 79
    .line 80
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->e:Lcom/tencent/youtu/ytagreflectlivecheck/requester/LiveStyleRequester$SeleceData;

    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->m:Z

    .line 83
    .line 84
    if-nez v1, :cond_0

    .line 85
    .line 86
    const-string v1, "color_data"

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Ljava/lang/String;

    .line 93
    .line 94
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    iget-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->t:Z

    .line 98
    .line 99
    if-eqz v1, :cond_1

    .line 100
    .line 101
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->o:Ljava/lang/String;

    .line 102
    .line 103
    iput-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b:Ljava/lang/String;

    .line 104
    .line 105
    :cond_1
    :goto_0
    const-string v1, "control_config"

    .line 106
    .line 107
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Ljava/lang/String;

    .line 112
    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->w:Ljava/lang/String;

    .line 116
    .line 117
    :cond_2
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->w:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_8

    .line 124
    .line 125
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->w:Ljava/lang/String;

    .line 126
    .line 127
    const-string v1, "&"

    .line 128
    .line 129
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    array-length v1, v0

    .line 134
    if-lez v1, :cond_8

    .line 135
    .line 136
    array-length v1, v0

    .line 137
    const/4 v2, 0x0

    .line 138
    move v3, v2

    .line 139
    :goto_1
    if-ge v3, v1, :cond_8

    .line 140
    .line 141
    aget-object v4, v0, v3

    .line 142
    .line 143
    const-string v5, "="

    .line 144
    .line 145
    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    array-length v5, v4

    .line 150
    const/4 v6, 0x1

    .line 151
    if-le v5, v6, :cond_3

    .line 152
    .line 153
    aget-object v5, v4, v2

    .line 154
    .line 155
    const-string v7, "actref_ux_mode"

    .line 156
    .line 157
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    if-eqz v5, :cond_3

    .line 162
    .line 163
    aget-object v5, v4, v6

    .line 164
    .line 165
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    move-result v5

    .line 169
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->x:I

    .line 170
    .line 171
    :cond_3
    array-length v5, v4

    .line 172
    if-le v5, v6, :cond_4

    .line 173
    .line 174
    aget-object v5, v4, v2

    .line 175
    .line 176
    const-string v7, "reflect_images_shorten_strategy"

    .line 177
    .line 178
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v5

    .line 182
    if-eqz v5, :cond_4

    .line 183
    .line 184
    aget-object v5, v4, v6

    .line 185
    .line 186
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    move-result v5

    .line 190
    iput v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->A:I

    .line 191
    .line 192
    :cond_4
    array-length v5, v4

    .line 193
    if-le v5, v6, :cond_7

    .line 194
    .line 195
    aget-object v5, v4, v2

    .line 196
    .line 197
    const-string v7, "compress_reflection_image_score"

    .line 198
    .line 199
    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v5

    .line 203
    if-eqz v5, :cond_7

    .line 204
    .line 205
    aget-object v4, v4, v6

    .line 206
    .line 207
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 208
    .line 209
    .line 210
    move-result v4

    .line 211
    const/16 v5, 0x50

    .line 212
    .line 213
    if-ge v4, v5, :cond_5

    .line 214
    .line 215
    :goto_2
    move v4, v5

    .line 216
    goto :goto_3

    .line 217
    :cond_5
    const/16 v5, 0x63

    .line 218
    .line 219
    if-le v4, v5, :cond_6

    .line 220
    .line 221
    goto :goto_2

    .line 222
    :cond_6
    :goto_3
    sput v4, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->compressReflectionImageScore:I

    .line 223
    .line 224
    :cond_7
    add-int/lit8 v3, v3, 0x1

    .line 225
    .line 226
    goto :goto_1

    .line 227
    :cond_8
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->ACTION_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 232
    .line 233
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    if-eqz v0, :cond_9

    .line 242
    .line 243
    const-string v1, "act_reflect_data"

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    check-cast v0, Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 250
    .line 251
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->d:Lcom/tencent/youtu/ytposedetect/data/YTActRefData;

    .line 252
    .line 253
    :cond_9
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->h:I

    .line 254
    .line 255
    iget v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->n:I

    .line 256
    .line 257
    if-le v0, v1, :cond_a

    .line 258
    .line 259
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 260
    .line 261
    if-nez v0, :cond_a

    .line 262
    .line 263
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->i:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 264
    .line 265
    if-eqz v0, :cond_a

    .line 266
    .line 267
    array-length v0, v0

    .line 268
    if-lez v0, :cond_a

    .line 269
    .line 270
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 271
    .line 272
    .line 273
    move-result-object v0

    .line 274
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$k;

    .line 275
    .line 276
    invoke-direct {v1, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$k;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 277
    .line 278
    .line 279
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 280
    .line 281
    .line 282
    :cond_a
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->x:I

    .line 283
    .line 284
    const/4 v1, 0x2

    .line 285
    if-ne v0, v1, :cond_b

    .line 286
    .line 287
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;->d:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 288
    .line 289
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->g:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 290
    .line 291
    const/4 v0, 0x0

    .line 292
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a(Lcom/tencent/youtu/ytagreflectlivecheck/a;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 293
    .line 294
    .line 295
    goto :goto_4

    .line 296
    :catch_0
    move-exception p0

    .line 297
    const-string v0, "ReflectLivenessState"

    .line 298
    .line 299
    const-string v1, "reflection enter failed "

    .line 300
    .line 301
    invoke-static {v0, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 302
    .line 303
    .line 304
    invoke-static {v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->reportException(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 305
    .line 306
    .line 307
    :cond_b
    :goto_4
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;->CacheStrategy:Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;

    .line 312
    .line 313
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->updateCacheStrategy(Lcom/tencent/youtu/sdkkitframework/framework/YtFSM$YtFSMUpdateStrategy;)V

    .line 314
    .line 315
    .line 316
    return-void
.end method

.method public enterFirst()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const-string v1, "ReflectLivenessState"

    .line 3
    .line 4
    invoke-virtual {p0, v1, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->makeStateInfo(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 16
    .line 17
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getStateByName(Ljava/lang/String;)Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "reset_timeout"

    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v0, v1, v2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleStateAction(Ljava/lang/String;Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    const-string v1, "detect_instance"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->getStateDataBy(Ljava/lang/String;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->v:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 40
    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/tencent/youtu/liveness/YTFaceTracker;->getParam()Lcom/tencent/youtu/liveness/YTFaceTracker$Param;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->p:Lcom/tencent/youtu/liveness/YTFaceTracker$Param;

    .line 48
    .line 49
    if-eqz v0, :cond_1

    .line 50
    .line 51
    const/4 v1, -0x1

    .line 52
    iput v1, v0, Lcom/tencent/youtu/liveness/YTFaceTracker$Param;->detInterval:I

    .line 53
    .line 54
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->v:Lcom/tencent/youtu/liveness/YTFaceTracker;

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Lcom/tencent/youtu/liveness/YTFaceTracker;->setParam(Lcom/tencent/youtu/liveness/YTFaceTracker$Param;)V

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    const v1, 0x49445

    .line 65
    .line 66
    .line 67
    const-string v2, "\u6a21\u5f0f\u521d\u59cb\u5316\u5931\u8d25"

    .line 68
    .line 69
    invoke-virtual {v0, v1, v2}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$j;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$j;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->y:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->reset()V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->cleanUpQueue()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public exit()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->exit()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public handleEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->handleEvent(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iget-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->u:Z

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    sget-object p2, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;->YT_EVENT_TRIGGER_CANCEL_LIVENESS:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtFrameworkFireEventType;

    .line 9
    .line 10
    if-ne p1, p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
    .locals 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "Reflection version:3.6.9.2"

    .line 5
    .line 6
    const-string p2, "ReflectLivenessState"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "3.6.9.2"

    .line 12
    .line 13
    const-string p3, "\\."

    .line 14
    .line 15
    invoke-virtual {p1, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a:Ljava/lang/String;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "Wanted Reflection Version: "

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {p2, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    const/4 v0, 0x0

    .line 43
    aget-object v1, p1, v0

    .line 44
    .line 45
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    aget-object v2, p3, v0

    .line 50
    .line 51
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    const/4 v3, 0x1

    .line 56
    if-eq v1, v2, :cond_0

    .line 57
    .line 58
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance p3, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$c;

    .line 63
    .line 64
    invoke-direct {p3, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$c;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    aget-object v1, p1, v3

    .line 72
    .line 73
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    aget-object v2, p3, v3

    .line 78
    .line 79
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eq v1, v2, :cond_1

    .line 84
    .line 85
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    new-instance p3, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$d;

    .line 90
    .line 91
    invoke-direct {p3, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$d;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    const/4 v1, 0x2

    .line 99
    aget-object p1, p1, v1

    .line 100
    .line 101
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    aget-object p3, p3, v1

    .line 106
    .line 107
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result p3

    .line 111
    if-ge p1, p3, :cond_2

    .line 112
    .line 113
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    new-instance p3, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$e;

    .line 118
    .line 119
    invoke-direct {p3, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$e;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 123
    .line 124
    .line 125
    :cond_2
    :goto_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework;->version()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    const-string p3, "-"

    .line 134
    .line 135
    invoke-virtual {p1, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iget-object p3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->c:Ljava/lang/String;

    .line 140
    .line 141
    aget-object p1, p1, v0

    .line 142
    .line 143
    invoke-static {p3, p1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->initModel(Ljava/lang/String;Ljava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    const/4 p3, 0x0

    .line 148
    if-eqz p1, :cond_3

    .line 149
    .line 150
    new-instance v0, Ljava/lang/StringBuilder;

    .line 151
    .line 152
    const-string v1, "failed to init reflect sdk "

    .line 153
    .line 154
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {p2, v0, p3}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->getInstance()Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;

    .line 168
    .line 169
    .line 170
    move-result-object p2

    .line 171
    const-string v0, "failed to init reflect sdk"

    .line 172
    .line 173
    invoke-virtual {p2, p1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtSDKStats;->reportError(ILjava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$f;

    .line 181
    .line 182
    invoke-direct {v0, p0, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$f;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;I)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p2, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 186
    .line 187
    .line 188
    :cond_3
    iget-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->t:Z

    .line 189
    .line 190
    if-eqz p1, :cond_4

    .line 191
    .line 192
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->s:I

    .line 193
    .line 194
    iget-object p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->r:Ljava/lang/String;

    .line 195
    .line 196
    invoke-static {p1, p2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->FRGenConfigData(ILjava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->o:Ljava/lang/String;

    .line 201
    .line 202
    :cond_4
    new-instance p1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$g;

    .line 203
    .line 204
    invoke-direct {p1, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$g;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 205
    .line 206
    .line 207
    invoke-static {p1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->setReflectNotice(Lcom/tencent/youtu/ytagreflectlivecheck/notice/a;)V

    .line 208
    .line 209
    .line 210
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    iget-object p1, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->reflectListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;

    .line 219
    .line 220
    if-eqz p1, :cond_5

    .line 221
    .line 222
    new-instance p1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$h;

    .line 223
    .line 224
    invoke-direct {p1, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$h;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 225
    .line 226
    .line 227
    invoke-static {p1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->setReflectListener(Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;)V

    .line 228
    .line 229
    .line 230
    goto :goto_1

    .line 231
    :cond_5
    invoke-static {p3}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->setReflectListener(Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;)V

    .line 232
    .line 233
    .line 234
    :goto_1
    invoke-static {v3}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->configNativeLog(Z)V

    .line 235
    .line 236
    .line 237
    const-string p1, "log_level"

    .line 238
    .line 239
    const-string p2, "3"

    .line 240
    .line 241
    invoke-static {p1, p2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    .line 243
    .line 244
    const-string p1, "is_alone_raw_push"

    .line 245
    .line 246
    const-string p2, "0"

    .line 247
    .line 248
    invoke-static {p1, p2}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->updateParam(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    .line 250
    .line 251
    new-instance p1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$i;

    .line 252
    .line 253
    invoke-direct {p1, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$i;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 254
    .line 255
    .line 256
    invoke-static {p1}, Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface;->setLoggerListener(Lcom/tencent/youtu/ytagreflectlivecheck/jni/YTAGReflectLiveCheckJNIInterface$IYtLoggerListener;)V

    .line 257
    .line 258
    .line 259
    return-void
.end method

.method public moveToNextState()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->moveToNextState()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 5
    .line 6
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 7
    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNextRound(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, -0x1

    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->sendFSMTransitError(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper;->classNameOfState(Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v0, p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->transitNow(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->onPause()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onResume()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->onResume()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public reset()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->reset()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public unload()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->unload()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->cancel()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->releaseModel()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V
    .locals 12

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->update(Lcom/tencent/youtu/sdkkitframework/common/YTImageData;J)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->B:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    const-string v2, "ReflectLivenessState"

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->i:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    array-length v3, v0

    .line 16
    if-lez v3, :cond_0

    .line 17
    .line 18
    aget-object v0, v0, v1

    .line 19
    .line 20
    iget v3, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->C:F

    .line 21
    .line 22
    iget v4, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->D:F

    .line 23
    .line 24
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->E:F

    .line 25
    .line 26
    invoke-static {v0, v3, v4, v5}, Lcom/tencent/youtu/sdkkitframework/liveness/o;->a(Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;FFF)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_0

    .line 31
    .line 32
    const-string v0, "reflect face angle error"

    .line 33
    .line 34
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v3, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$a;

    .line 42
    .line 43
    invoke-direct {v3, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$a;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v3}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 47
    .line 48
    .line 49
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->IDLE_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 50
    .line 51
    iput-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 52
    .line 53
    :cond_0
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->g:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    const/4 v3, 0x1

    .line 60
    if-eqz v0, :cond_b

    .line 61
    .line 62
    const/16 v4, 0x9

    .line 63
    .line 64
    if-eq v0, v3, :cond_7

    .line 65
    .line 66
    const/4 v5, 0x2

    .line 67
    if-eq v0, v5, :cond_1

    .line 68
    .line 69
    goto/16 :goto_1

    .line 70
    .line 71
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 72
    .line 73
    const-string v5, "reflect continuous_detect_count "

    .line 74
    .line 75
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->h:I

    .line 79
    .line 80
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v5, "pass flag "

    .line 84
    .line 85
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 89
    .line 90
    if-eqz v5, :cond_2

    .line 91
    .line 92
    move v5, v3

    .line 93
    goto :goto_0

    .line 94
    :cond_2
    move v5, v1

    .line 95
    :goto_0
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    const-string v5, "reflect pose state "

    .line 108
    .line 109
    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget v5, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 113
    .line 114
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->d(Ljava/lang/String;Ljava/lang/Object;)V

    .line 122
    .line 123
    .line 124
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->k:Z

    .line 125
    .line 126
    if-eqz v0, :cond_6

    .line 127
    .line 128
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->q:Z

    .line 129
    .line 130
    if-eqz v0, :cond_3

    .line 131
    .line 132
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 133
    .line 134
    if-eqz v0, :cond_3

    .line 135
    .line 136
    if-ne v0, v4, :cond_5

    .line 137
    .line 138
    :cond_3
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->z:Z

    .line 139
    .line 140
    if-eqz v0, :cond_4

    .line 141
    .line 142
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 143
    .line 144
    if-eq v0, v3, :cond_5

    .line 145
    .line 146
    :cond_4
    iget v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 147
    .line 148
    if-ne v0, v3, :cond_6

    .line 149
    .line 150
    :cond_5
    const-string v0, "reflect error: no face"

    .line 151
    .line 152
    invoke-static {v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->cancel()V

    .line 156
    .line 157
    .line 158
    const-string v0, "\u68c0\u6d4b\u5f02\u5e38"

    .line 159
    .line 160
    const-string v2, "\u8bf7\u4fdd\u6301\u59ff\u6001"

    .line 161
    .line 162
    const/4 v3, -0x1

    .line 163
    invoke-virtual {p0, v3, v0, v2}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_6
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->i:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 167
    .line 168
    if-eqz v0, :cond_e

    .line 169
    .line 170
    iget-object v2, p1, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->imgData:[B

    .line 171
    .line 172
    iget v3, p1, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->width:I

    .line 173
    .line 174
    iget v4, p1, Lcom/tencent/youtu/sdkkitframework/common/YTImageData;->height:I

    .line 175
    .line 176
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iget v7, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentRotateState:I

    .line 185
    .line 186
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->i:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 187
    .line 188
    aget-object p1, p1, v1

    .line 189
    .line 190
    iget-object v8, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->faceShape:[F

    .line 191
    .line 192
    iget v9, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->pitch:F

    .line 193
    .line 194
    iget v10, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->yaw:F

    .line 195
    .line 196
    iget v11, p1, Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;->roll:F

    .line 197
    .line 198
    move-wide v5, p2

    .line 199
    invoke-static/range {v2 .. v11}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->pushImageData([BIIJI[FFFF)V

    .line 200
    .line 201
    .line 202
    goto/16 :goto_1

    .line 203
    .line 204
    :cond_7
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->h:I

    .line 205
    .line 206
    iget p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->n:I

    .line 207
    .line 208
    if-le p1, p2, :cond_a

    .line 209
    .line 210
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->f:I

    .line 211
    .line 212
    if-eqz p1, :cond_8

    .line 213
    .line 214
    if-ne p1, v4, :cond_a

    .line 215
    .line 216
    :cond_8
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->i:[Lcom/tencent/youtu/liveness/YTFaceTracker$TrackedFace;

    .line 217
    .line 218
    if-eqz p1, :cond_a

    .line 219
    .line 220
    array-length p1, p1

    .line 221
    if-lez p1, :cond_a

    .line 222
    .line 223
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    new-instance p2, Lcom/tencent/youtu/sdkkitframework/liveness/m;

    .line 228
    .line 229
    invoke-direct {p2, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/m;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 230
    .line 231
    .line 232
    invoke-virtual {p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 233
    .line 234
    .line 235
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;->c:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 236
    .line 237
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->g:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 238
    .line 239
    invoke-static {}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->getAGSettings()Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iget p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->l:I

    .line 244
    .line 245
    iput p2, p1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->safetylevel:I

    .line 246
    .line 247
    iput-boolean v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->isEncodeReflectData:Z

    .line 248
    .line 249
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 250
    .line 251
    .line 252
    move-result-object p2

    .line 253
    invoke-virtual {p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getWorkMode()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 254
    .line 255
    .line 256
    move-result-object p2

    .line 257
    sget-object p3, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;->YT_FW_ACTREFLECT_TYPE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKKitFrameworkWorkMode;

    .line 258
    .line 259
    if-ne p2, p3, :cond_9

    .line 260
    .line 261
    move v1, v3

    .line 262
    :cond_9
    iput-boolean v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->isActionReflect:Z

    .line 263
    .line 264
    invoke-static {p1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->setAGSettings(Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;)V

    .line 265
    .line 266
    .line 267
    new-instance p2, Ljava/lang/StringBuilder;

    .line 268
    .line 269
    const-string p3, "Settings: safetyLevel "

    .line 270
    .line 271
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget p3, p1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->safetylevel:I

    .line 275
    .line 276
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object p2

    .line 283
    invoke-static {v2, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    new-instance p2, Ljava/lang/StringBuilder;

    .line 287
    .line 288
    const-string p3, "Settings: isEncodeReflectData "

    .line 289
    .line 290
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 291
    .line 292
    .line 293
    iget-boolean p3, p1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->isEncodeReflectData:Z

    .line 294
    .line 295
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object p2

    .line 302
    invoke-static {v2, p2}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    new-instance p2, Ljava/lang/StringBuilder;

    .line 306
    .line 307
    const-string p3, "Settings: isActionReflect "

    .line 308
    .line 309
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    iget-boolean p1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectSettings;->isActionReflect:Z

    .line 313
    .line 314
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    invoke-static {v2, p1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 325
    .line 326
    .line 327
    move-result-object p1

    .line 328
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 329
    .line 330
    .line 331
    move-result-object p1

    .line 332
    iget-object p2, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentAppContext:Landroid/content/Context;

    .line 333
    .line 334
    iget-object p3, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentCamera:Landroid/hardware/Camera;

    .line 335
    .line 336
    iget p1, p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->currentRotateState:I

    .line 337
    .line 338
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b:Ljava/lang/String;

    .line 339
    .line 340
    new-instance v1, Lcom/tencent/youtu/sdkkitframework/liveness/n;

    .line 341
    .line 342
    invoke-direct {v1, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/n;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 343
    .line 344
    .line 345
    invoke-static {p2, p3, p1, v0, v1}, Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface;->start(Landroid/content/Context;Landroid/hardware/Camera;ILjava/lang/String;Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;)V

    .line 346
    .line 347
    .line 348
    :cond_a
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;->SILENT_STATE:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 349
    .line 350
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->j:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitCommon$StateNameHelper$StateClassName;

    .line 351
    .line 352
    goto :goto_1

    .line 353
    :cond_b
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->y:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 354
    .line 355
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->isRunning()Z

    .line 356
    .line 357
    .line 358
    move-result p1

    .line 359
    if-eqz p1, :cond_d

    .line 360
    .line 361
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->y:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 362
    .line 363
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->checkTimeout()Z

    .line 364
    .line 365
    .line 366
    move-result p1

    .line 367
    if-nez p1, :cond_d

    .line 368
    .line 369
    iget p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->h:I

    .line 370
    .line 371
    if-gt p1, v3, :cond_c

    .line 372
    .line 373
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->y:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 374
    .line 375
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->reset()V

    .line 376
    .line 377
    .line 378
    goto :goto_1

    .line 379
    :cond_c
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    new-instance p2, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$b;

    .line 384
    .line 385
    invoke-direct {p2, p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$b;-><init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V

    .line 386
    .line 387
    .line 388
    invoke-virtual {p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->sendFSMEvent(Ljava/util/HashMap;)V

    .line 389
    .line 390
    .line 391
    goto :goto_1

    .line 392
    :cond_d
    iget-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->y:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 393
    .line 394
    invoke-virtual {p1}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->cancel()V

    .line 395
    .line 396
    .line 397
    sget-object p1, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;->b:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 398
    .line 399
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->g:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$l;

    .line 400
    .line 401
    :cond_e
    :goto_1
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->moveToNextState()V

    .line 402
    .line 403
    .line 404
    return-void
.end method

.method public updateSDKSetting(Lorg/json/JSONObject;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "secondary_roll_threshold"

    .line 6
    .line 7
    const-string v3, "secondary_pitch_threshold"

    .line 8
    .line 9
    const-string v4, "secondary_yaw_threshold"

    .line 10
    .line 11
    const-string v5, "need_random_flag"

    .line 12
    .line 13
    const-string v6, "change_point_num"

    .line 14
    .line 15
    const-string v7, "extra_config"

    .line 16
    .line 17
    const-string v8, "control_config"

    .line 18
    .line 19
    const-string v9, "reflect_tips_countdown_ms"

    .line 20
    .line 21
    const-string v10, "manual_trigger"

    .line 22
    .line 23
    const-string v11, "force_pose_check"

    .line 24
    .line 25
    const-string v12, "backend_proto_type"

    .line 26
    .line 27
    const-string v13, "stable_frame_num"

    .line 28
    .line 29
    const-string v14, "color_data"

    .line 30
    .line 31
    const-string v15, "local_config_flag"

    .line 32
    .line 33
    move-object/from16 v16, v2

    .line 34
    .line 35
    const-string v2, "reflect_security_level"

    .line 36
    .line 37
    move-object/from16 v17, v3

    .line 38
    .line 39
    const-string v3, "similarity_threshold"

    .line 40
    .line 41
    :try_start_0
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v18

    .line 45
    if-eqz v18, :cond_0

    .line 46
    .line 47
    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    :cond_0
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    if-eqz v3, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->l:I

    .line 61
    .line 62
    :cond_1
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-eqz v2, :cond_2

    .line 67
    .line 68
    invoke-virtual {v1, v15}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->m:Z

    .line 73
    .line 74
    :cond_2
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->b:Ljava/lang/String;

    .line 85
    .line 86
    :cond_3
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    if-eqz v2, :cond_4

    .line 91
    .line 92
    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->n:I

    .line 97
    .line 98
    :cond_4
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_5

    .line 103
    .line 104
    invoke-virtual {v1, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    :cond_5
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    if-eqz v2, :cond_6

    .line 112
    .line 113
    invoke-virtual {v1, v11}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->q:Z

    .line 118
    .line 119
    :cond_6
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 120
    .line 121
    .line 122
    move-result v2

    .line 123
    if-eqz v2, :cond_7

    .line 124
    .line 125
    invoke-virtual {v1, v10}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v2

    .line 129
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->u:Z

    .line 130
    .line 131
    :cond_7
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result v2

    .line 135
    const/4 v3, 0x0

    .line 136
    if-eqz v2, :cond_8

    .line 137
    .line 138
    iget-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->y:Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;

    .line 139
    .line 140
    invoke-virtual {v1, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v9

    .line 144
    const/16 v10, 0x2710

    .line 145
    .line 146
    invoke-static {v10, v9}, Ljava/lang/Math;->min(II)I

    .line 147
    .line 148
    .line 149
    move-result v9

    .line 150
    invoke-static {v3, v9}, Ljava/lang/Math;->max(II)I

    .line 151
    .line 152
    .line 153
    move-result v9

    .line 154
    int-to-long v9, v9

    .line 155
    invoke-virtual {v2, v9, v10, v3}, Lcom/tencent/youtu/sdkkitframework/common/TimeoutCounter;->init(JZ)V

    .line 156
    .line 157
    .line 158
    :cond_8
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_9

    .line 163
    .line 164
    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object v2

    .line 168
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->w:Ljava/lang/String;

    .line 169
    .line 170
    :cond_9
    const-string v2, "app_id"

    .line 171
    .line 172
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->c:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-eqz v2, :cond_a

    .line 183
    .line 184
    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    iput-object v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->r:Ljava/lang/String;

    .line 189
    .line 190
    :cond_a
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    if-eqz v2, :cond_b

    .line 195
    .line 196
    invoke-virtual {v1, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->s:I

    .line 201
    .line 202
    :cond_b
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    if-eqz v2, :cond_c

    .line 207
    .line 208
    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    .line 209
    .line 210
    .line 211
    move-result v2

    .line 212
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->t:Z

    .line 213
    .line 214
    :cond_c
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    if-eqz v2, :cond_d

    .line 219
    .line 220
    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 221
    .line 222
    .line 223
    move-result-wide v4

    .line 224
    double-to-float v2, v4

    .line 225
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->C:F

    .line 226
    .line 227
    :cond_d
    move-object/from16 v2, v17

    .line 228
    .line 229
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 230
    .line 231
    .line 232
    move-result v4

    .line 233
    if-eqz v4, :cond_e

    .line 234
    .line 235
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 236
    .line 237
    .line 238
    move-result-wide v4

    .line 239
    double-to-float v2, v4

    .line 240
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->D:F

    .line 241
    .line 242
    :cond_e
    move-object/from16 v2, v16

    .line 243
    .line 244
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v4

    .line 248
    if-eqz v4, :cond_f

    .line 249
    .line 250
    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getDouble(Ljava/lang/String;)D

    .line 251
    .line 252
    .line 253
    move-result-wide v4

    .line 254
    double-to-float v2, v4

    .line 255
    iput v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->E:F

    .line 256
    .line 257
    :cond_f
    const-string v2, "need_angle_detect_reflection"

    .line 258
    .line 259
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 260
    .line 261
    .line 262
    move-result v2

    .line 263
    iput-boolean v2, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->B:Z

    .line 264
    .line 265
    const-string v2, "need_check_multiface"

    .line 266
    .line 267
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;Z)Z

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    iput-boolean v1, v0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->z:Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 272
    .line 273
    return-void

    .line 274
    :catch_0
    move-exception v0

    .line 275
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 276
    .line 277
    .line 278
    const-string v1, "ReflectLivenessState"

    .line 279
    .line 280
    const-string v2, "Failed to parse json:"

    .line 281
    .line 282
    invoke-static {v1, v2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 283
    .line 284
    .line 285
    return-void
.end method
