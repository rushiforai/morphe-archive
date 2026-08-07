.class public Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$IYTReflectListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->loadStateWith(Ljava/lang/String;Lorg/json/JSONObject;Lcom/tencent/youtu/sdkkitframework/common/YtSdkConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$h;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onGetAppBrightness()F
    .locals 2

    .line 1
    :try_start_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->reflectListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;->onGetAppBrightness()F

    .line 12
    .line 13
    .line 14
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    return p0

    .line 16
    :catch_0
    move-exception p0

    .line 17
    const-string v0, "ReflectLivenessState"

    .line 18
    .line 19
    const-string v1, "onGetAppBrightness error"

    .line 20
    .line 21
    invoke-static {v0, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 22
    .line 23
    .line 24
    const/high16 p0, -0x40800000    # -1.0f

    .line 25
    .line 26
    return p0
.end method

.method public onReflectEvent(Landroid/graphics/ColorMatrixColorFilter;F)V
    .locals 5

    .line 1
    const-string v0, "refcontrol_begin"

    .line 2
    .line 3
    :try_start_0
    iget-object v1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$h;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 14
    .line 15
    .line 16
    move-result-wide v1

    .line 17
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState$h;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtFSMBaseState;->stateData:Ljava/util/HashMap;

    .line 20
    .line 21
    const-wide/16 v3, 0x3e8

    .line 22
    .line 23
    mul-long/2addr v1, v3

    .line 24
    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->reflectListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;

    .line 40
    .line 41
    invoke-interface {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;->onReflectEvent(Landroid/graphics/ColorMatrixColorFilter;F)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :catch_0
    move-exception p0

    .line 46
    const-string p1, "ReflectLivenessState"

    .line 47
    .line 48
    const-string p2, "onReflectEvent error"

    .line 49
    .line 50
    invoke-static {p1, p2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public onReflectStart(J)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getInstance()Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/tencent/youtu/sdkkitframework/framework/YtFSM;->getContext()Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$YtSDKPlatformContext;->reflectListener:Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYTReflectListener;->onReflectStart(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catch_0
    move-exception p0

    .line 16
    const-string p1, "ReflectLivenessState"

    .line 17
    .line 18
    const-string p2, "onReflectStart error"

    .line 19
    .line 20
    invoke-static {p1, p2, p0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
