.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->onAudioJitterBufferNotify(Ljava/lang/String;ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$ID:Ljava/lang/String;

.field final synthetic val$errInfo:Ljava/lang/String;

.field final synthetic val$notifyNo:I


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->val$notifyNo:I

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->val$errInfo:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->val$ID:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->val$notifyNo:I

    .line 7
    .line 8
    int-to-long v1, v1

    .line 9
    const-string v3, "EVT_ID"

    .line 10
    .line 11
    invoke-virtual {v0, v3, v1, v2}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    const-string v1, "EVT_TIME"

    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    invoke-virtual {v0, v1, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 21
    .line 22
    .line 23
    const-string v1, "EVT_MSG"

    .line 24
    .line 25
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->val$errInfo:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->val$ID:Ljava/lang/String;

    .line 33
    .line 34
    iget p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$123;->val$notifyNo:I

    .line 35
    .line 36
    invoke-static {v1, v2, p0, v0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$7400(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILandroid/os/Bundle;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method
