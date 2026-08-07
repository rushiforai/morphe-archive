.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->sendCustomCmdMsg(I[BZZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$cmdID:I

.field final synthetic val$finalMsg:Ljava/lang/String;

.field final synthetic val$ordered:Z

.field final synthetic val$reliable:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;ZZ)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->val$cmdID:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->val$finalMsg:Ljava/lang/String;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->val$reliable:Z

    .line 8
    .line 9
    iput-boolean p5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->val$ordered:Z

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iget-wide v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mNativeRtcContext:J

    .line 4
    .line 5
    iget v3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->val$cmdID:I

    .line 6
    .line 7
    iget-object v4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->val$finalMsg:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v5, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->val$reliable:Z

    .line 10
    .line 11
    iget-boolean v6, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$117;->val$ordered:Z

    .line 12
    .line 13
    invoke-static/range {v0 .. v6}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$7200(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;JILjava/lang/String;ZZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
