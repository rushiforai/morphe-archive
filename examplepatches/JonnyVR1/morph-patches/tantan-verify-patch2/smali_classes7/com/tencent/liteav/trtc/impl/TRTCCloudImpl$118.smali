.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sendSEIMsg([BI)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$data:[B

.field final synthetic val$repeatCount:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;[BI)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;->val$data:[B

    .line 4
    .line 5
    iput p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;->val$repeatCount:I

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 4
    .line 5
    iget-object v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;->val$data:[B

    .line 6
    .line 7
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$118;->val$repeatCount:I

    .line 8
    .line 9
    invoke-static {v0, v1, v2, v3, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$7300(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;J[BI)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
