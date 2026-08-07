.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onVideoConfigChanged(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$enableRPS:Z

.field final synthetic val$stream:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;IZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;->val$stream:I

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;->val$enableRPS:Z

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
    .locals 2

    .line 1
    iget v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;->val$stream:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mCaptureAndEnc:Lcom/tencent/liteav/d;

    .line 9
    .line 10
    iget-boolean p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$153;->val$enableRPS:Z

    .line 11
    .line 12
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/d;->f(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method
