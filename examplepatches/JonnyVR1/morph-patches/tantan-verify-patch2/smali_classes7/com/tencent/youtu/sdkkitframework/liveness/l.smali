.class public Lcom/tencent/youtu/sdkkitframework/liveness/l;
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
    iput-object p1, p0, Lcom/tencent/youtu/sdkkitframework/liveness/l;->a:Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;

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
    .locals 1
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
    const-string p2, "NetLivenessReqResultState"

    .line 2
    .line 3
    const-string v0, "handle actreflect response"

    .line 4
    .line 5
    invoke-static {p2, v0}, Lcom/tencent/youtu/sdkkitframework/common/YtLogger;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Lcom/tencent/youtu/sdkkitframework/liveness/l;->a:Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-static {p2, p1, v0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;Ljava/util/HashMap;Ljava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/tencent/youtu/sdkkitframework/liveness/l;->a:Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;

    .line 15
    .line 16
    invoke-static {p0}, Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;->a(Lcom/tencent/youtu/sdkkitframework/liveness/NetLivenessReqResultState;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method
