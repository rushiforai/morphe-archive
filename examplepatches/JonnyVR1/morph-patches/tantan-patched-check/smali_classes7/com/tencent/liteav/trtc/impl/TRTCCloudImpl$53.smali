.class Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalAudio(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

.field final synthetic val$mute:Z


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 2
    .line 3
    iput-boolean p2, p0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->val$mute:Z

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
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 4
    .line 5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v3, "muteLocalAudio "

    .line 8
    .line 9
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-boolean v3, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->val$mute:Z

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    invoke-virtual {v1, v2}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->apiLog(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    iget-boolean v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->val$mute:Z

    .line 30
    .line 31
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "muteLocalAudio mute:%b"

    .line 40
    .line 41
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v2, " self:"

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 54
    .line 55
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v2, ""

    .line 67
    .line 68
    const/4 v3, 0x0

    .line 69
    const/4 v4, 0x1

    .line 70
    invoke-static {v4, v1, v2, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 71
    .line 72
    .line 73
    iget-object v1, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->this$0:Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;

    .line 74
    .line 75
    iget-boolean v2, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->val$mute:Z

    .line 76
    .line 77
    invoke-virtual {v1, v2, v1}, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl;->muteLocalAudio(ZLcom/tencent/liteav/trtc/impl/TRTCCloudImpl;)V

    .line 78
    .line 79
    .line 80
    iget-boolean v0, v0, Lcom/tencent/liteav/trtc/impl/TRTCCloudImpl$53;->val$mute:Z

    .line 81
    .line 82
    if-eqz v0, :cond_0

    .line 83
    .line 84
    const-string v7, ""

    .line 85
    .line 86
    const/4 v8, 0x0

    .line 87
    const-string v1, "18446744073709551615"

    .line 88
    .line 89
    const/16 v2, 0xbb9

    .line 90
    .line 91
    const-wide/16 v3, 0x1

    .line 92
    .line 93
    const-wide/16 v5, -0x1

    .line 94
    .line 95
    invoke-static/range {v1 .. v8}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_0
    const-string v15, ""

    .line 100
    .line 101
    const/16 v16, 0x0

    .line 102
    .line 103
    const-string v9, "18446744073709551615"

    .line 104
    .line 105
    const/16 v10, 0xbb9

    .line 106
    .line 107
    const-wide/16 v11, 0x3

    .line 108
    .line 109
    const-wide/16 v13, -0x1

    .line 110
    .line 111
    invoke-static/range {v9 .. v16}, Lcom/tencent/liteav/basic/module/TXCEventRecorderProxy;->a(Ljava/lang/String;IJJLjava/lang/String;I)V

    .line 112
    .line 113
    .line 114
    return-void
.end method
