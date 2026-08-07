.class public Lcom/tencent/youtu/sdkkitframework/liveness/n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/youtu/ytagreflectlivecheck/YTAGReflectLiveCheckInterface$LightLiveCheckResult;


# instance fields
.field public final synthetic a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/n;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onFailed(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/n;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onReflectLiveImgData(Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;)V
    .locals 0

    return-void
.end method

.method public onSuccess(Lcom/tencent/youtu/ytagreflectlivecheck/a;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "reflect succeed,get frame count:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/tencent/youtu/ytagreflectlivecheck/a;->a:[Lcom/tencent/youtu/ytagreflectlivecheck/jni/cppDefine/RawImgData;

    .line 9
    .line 10
    array-length v1, v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "ReflectLivenessState"

    .line 19
    .line 20
    invoke-static {v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->o(Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/n;->a:Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/tencent/youtu/sdkkitframework/liveness/ReflectLivenessState;->a(Lcom/tencent/youtu/ytagreflectlivecheck/a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
