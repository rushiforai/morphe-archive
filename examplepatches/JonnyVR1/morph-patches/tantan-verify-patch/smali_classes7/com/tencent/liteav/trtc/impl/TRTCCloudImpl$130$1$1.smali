.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;

.field final synthetic val$exitCode:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1$1;->this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1$1;->val$exitCode:I

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
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1$1;->this$2:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$130$1$1;->val$exitCode:I

    .line 12
    .line 13
    invoke-virtual {v0, p0}, Lcom/tencent/trtc/TRTCCloudListener;->onExitRoom(I)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
