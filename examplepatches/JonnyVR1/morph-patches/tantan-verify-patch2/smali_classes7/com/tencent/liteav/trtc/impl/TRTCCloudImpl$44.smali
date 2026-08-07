.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setLocalViewMirror(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$mode:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->val$mode:I

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->val$mode:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$4502(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 9
    .line 10
    new-instance v1, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v2, "setLocalViewMirror "

    .line 13
    .line 14
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->val$mode:I

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 30
    .line 31
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 32
    .line 33
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->val$mode:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/tencent/liteav/d;->b(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$44;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 39
    .line 40
    invoke-static {p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$2200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
