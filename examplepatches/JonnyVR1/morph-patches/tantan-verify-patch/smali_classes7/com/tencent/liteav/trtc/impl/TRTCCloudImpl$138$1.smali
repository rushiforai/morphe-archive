.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

.field final synthetic val$listener:Lcom/tencent/trtc/TRTCCloudListener;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;Lcom/tencent/trtc/TRTCCloudListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$1;->val$listener:Lcom/tencent/trtc/TRTCCloudListener;

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
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$1;->val$listener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/tencent/trtc/TRTCCloudListener;->onUserEnter(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
