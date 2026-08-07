.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;

.field final synthetic val$userId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;->val$userId:Ljava/lang/String;

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
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mTRTCListener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 6
    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v2, "notify onUserVideoAvailable:"

    .line 10
    .line 11
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;

    .line 15
    .line 16
    iget-wide v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;->val$tinyId:J

    .line 17
    .line 18
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v2, " [true] by IDR. self:"

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;

    .line 27
    .line 28
    iget-object v2, v2, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "TRTCCloudImpl"

    .line 42
    .line 43
    invoke-static {v2, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;->val$userId:Ljava/lang/String;

    .line 49
    .line 50
    const/4 v2, 0x1

    .line 51
    invoke-virtual {v0, v1, v2}, Lcom/tencent/trtc/TRTCCloudListener;->onUserVideoAvailable(Ljava/lang/String;Z)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 57
    .line 58
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->mRoomInfo:Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;

    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/tencent/liteav/trtc/impl/TRTCRoomInfo;->getUserId()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$155$1;->val$userId:Ljava/lang/String;

    .line 65
    .line 66
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 67
    .line 68
    filled-new-array {p0, v2}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    const-string v2, "[%s]video Available[%b]"

    .line 73
    .line 74
    invoke-static {v2, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    const/4 v2, 0x0

    .line 79
    invoke-static {v0, v1, v2, p0}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->access$8000(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Ljava/lang/String;ILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_0
    return-void
.end method
