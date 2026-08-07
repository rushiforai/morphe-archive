.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setVideoMuteImage(Landroid/graphics/Bitmap;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$fps:I

.field final synthetic val$image:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Landroid/graphics/Bitmap;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->val$image:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->val$fps:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "setVideoMuteImage "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->val$image:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, ", "

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->val$fps:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->val$fps:I

    .line 33
    .line 34
    const/16 v1, 0x14

    .line 35
    .line 36
    if-le v0, v1, :cond_0

    .line 37
    .line 38
    :goto_0
    move v0, v1

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    const/4 v1, 0x5

    .line 41
    if-ge v0, v1, :cond_1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 45
    .line 46
    iget-object v2, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mConfig:Lcom/tencent/liteav/g;

    .line 47
    .line 48
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$30;->val$image:Landroid/graphics/Bitmap;

    .line 49
    .line 50
    iput-object p0, v2, Lcom/tencent/liteav/g;->A:Landroid/graphics/Bitmap;

    .line 51
    .line 52
    iput v0, v2, Lcom/tencent/liteav/g;->C:I

    .line 53
    .line 54
    const/4 p0, -0x1

    .line 55
    iput p0, v2, Lcom/tencent/liteav/g;->B:I

    .line 56
    .line 57
    iget-object p0, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/g;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method
