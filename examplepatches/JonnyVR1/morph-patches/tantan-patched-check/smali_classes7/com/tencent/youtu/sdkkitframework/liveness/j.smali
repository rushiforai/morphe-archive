.class public Lcom/tencent/youtu/sdkkitframework/liveness/j;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/youtu/sdkkitframework/framework/YtSDKKitFramework$IYtSDKKitNetResponseParser;


# instance fields
.field public final synthetic a:Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;


# direct methods
.method public constructor <init>(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onNetworkResponseEvent(Ljava/util/HashMap;Ljava/lang/Exception;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Exception;",
            ")V"
        }
    .end annotation

    .line 1
    const-string p2, "reflect_request_s2"

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    .line 4
    .line 5
    .line 6
    const-string p2, "reflect_request_s3"

    .line 7
    .line 8
    invoke-static {p2}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkBegin(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "NetLivenessReqResultState"

    .line 12
    .line 13
    const-string v1, "handle reflection response"

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-static {v0, p1, v1}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 22
    .line 23
    .line 24
    invoke-static {p2}, Lcom/tencent/youtu/sdkkitframework/common/CommonUtils;->benchMarkEnd(Ljava/lang/String;)J

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/j;->a:Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
