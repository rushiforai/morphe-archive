.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;
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

.field final synthetic val$mainVideoAvailable:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;ZLcom/tencent/trtc/TRTCCloudListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->val$mainVideoAvailable:Z

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->val$listener:Lcom/tencent/trtc/TRTCCloudListener;

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
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "notify onUserVideoAvailable:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 9
    .line 10
    iget-wide v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$tinyID:J

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, " ["

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->val$mainVideoAvailable:Z

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, "] by bit state. self:"

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const-string v1, "TRTCCloudImpl"

    .line 46
    .line 47
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->val$listener:Lcom/tencent/trtc/TRTCCloudListener;

    .line 51
    .line 52
    if-eqz v0, :cond_0

    .line 53
    .line 54
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 57
    .line 58
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->val$mainVideoAvailable:Z

    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Lcom/tencent/trtc/TRTCCloudListener;->onUserVideoAvailable(Ljava/lang/String;Z)V

    .line 61
    .line 62
    .line 63
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->val$userID:Ljava/lang/String;

    .line 71
    .line 72
    iget-boolean v2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->val$mainVideoAvailable:Z

    .line 73
    .line 74
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    const-string v2, "onUserVideoAvailable userID:%s, bAvailable:%b"

    .line 83
    .line 84
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v1, " self:"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138$3;->this$1:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;

    .line 97
    .line 98
    iget-object p0, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$138;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 99
    .line 100
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 101
    .line 102
    .line 103
    move-result p0

    .line 104
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string v0, ""

    .line 112
    .line 113
    const/4 v1, 0x0

    .line 114
    const/4 v2, 0x2

    .line 115
    invoke-static {v2, p0, v0, v1}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 116
    .line 117
    .line 118
    return-void
.end method
