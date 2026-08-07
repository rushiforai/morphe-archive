.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;
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

.field final synthetic val$audioAvailable:Z

.field final synthetic val$listener:Lcom/tencent/trtc/TRTCCloudListener;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;Lcom/tencent/trtc/TRTCCloudListener;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->val$listener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 4
    .line 5
    iput-boolean p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->val$audioAvailable:Z

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
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->val$listener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 8
    .line 9
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->val$audioAvailable:Z

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2}, Lcom/tencent/trtc/TRTCCloudListener;->onUserAudioAvailable(Ljava/lang/String;Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 22
    .line 23
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->val$audioAvailable:Z

    .line 24
    .line 25
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "onUserAudioAvailable userID:%s, bAvailable:%b"

    .line 34
    .line 35
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v1, " self:"

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$2;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string v0, ""

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    const/4 v2, 0x2

    .line 66
    invoke-static {v2, p0, v0, v1}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method
