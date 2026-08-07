.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setWatermark(Landroid/graphics/Bitmap;IFFF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$image:Landroid/graphics/Bitmap;

.field final synthetic val$streamType:I

.field final synthetic val$width:F

.field final synthetic val$x:F

.field final synthetic val$y:F


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILandroid/graphics/Bitmap;FFF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$streamType:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$image:Landroid/graphics/Bitmap;

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$x:F

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$y:F

    .line 10
    .line 11
    iput p6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$width:F

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "addWatermark stream:"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$streamType:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$streamType:I

    .line 23
    .line 24
    const/4 v1, 0x2

    .line 25
    if-eq v0, v1, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 28
    .line 29
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 30
    .line 31
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$image:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    iput-object v2, v1, Lcom/tencent/liteav/g;->E:Landroid/graphics/Bitmap;

    .line 34
    .line 35
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$x:F

    .line 36
    .line 37
    iput v3, v1, Lcom/tencent/liteav/g;->H:F

    .line 38
    .line 39
    iget v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$y:F

    .line 40
    .line 41
    iput v4, v1, Lcom/tencent/liteav/g;->I:F

    .line 42
    .line 43
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$81;->val$width:F

    .line 44
    .line 45
    iput p0, v1, Lcom/tencent/liteav/g;->J:F

    .line 46
    .line 47
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 48
    .line 49
    invoke-virtual {v0, v2, v3, v4, p0}, Lcom/tencent/liteav/d;->a(Landroid/graphics/Bitmap;FFF)V

    .line 50
    .line 51
    .line 52
    :cond_0
    return-void
.end method
