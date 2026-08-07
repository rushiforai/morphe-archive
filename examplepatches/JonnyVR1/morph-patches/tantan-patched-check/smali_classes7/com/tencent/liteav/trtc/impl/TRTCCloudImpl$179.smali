.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->setOrientation(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$orientation:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;->val$orientation:I

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;->val$orientation:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$9300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$3300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 17
    .line 18
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$179;->val$orientation:I

    .line 19
    .line 20
    invoke-static {v0, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$9400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method
