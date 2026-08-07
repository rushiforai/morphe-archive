.class Lcom/cosmos/photon/push/PushImManager$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/baseim/push/PacketReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PushImManager;->handleMessage(Landroid/os/Message;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/PushImManager;

.field final synthetic val$returned:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PushImManager;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cosmos/photon/push/PushImManager$2;->val$returned:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onReceivePacket([B)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/cosmos/photon/push/PushImManager;->access$400(Lcom/cosmos/photon/push/PushImManager;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const-string v0, "onReceivePacket"

    .line 11
    .line 12
    const-string v1, "MoPush-IM"

    .line 13
    .line 14
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :try_start_0
    invoke-static {p1}, Lcom/immomo/push/pb/PbPacketBody;->parseFrom([B)Lcom/immomo/push/pb/PbPacketBody;

    .line 18
    .line 19
    .line 20
    move-result-object p1
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_1

    .line 21
    sget-object v0, Lcom/immomo/push/pb/BodyType;->SAUTH_RET:Lcom/immomo/push/pb/BodyType;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/immomo/push/pb/PbPacketBody;->getType()Lcom/immomo/push/pb/BodyType;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v0, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager$2;->val$returned:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Lcom/immomo/push/pb/PbPacketBody;->getSauthRet()Lcom/immomo/push/pb/SAuthRet;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p0, p1}, Lcom/cosmos/photon/push/PushImManager$2;->processAuthResult(Lcom/immomo/push/pb/SAuthRet;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$500(Lcom/cosmos/photon/push/PushImManager;)Ljava/util/concurrent/locks/Lock;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 53
    .line 54
    .line 55
    :try_start_1
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 56
    .line 57
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$600(Lcom/cosmos/photon/push/PushImManager;)Ljava/util/concurrent/locks/Condition;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-interface {p1}, Ljava/util/concurrent/locks/Condition;->signal()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/cosmos/photon/push/PushImManager;->access$500(Lcom/cosmos/photon/push/PushImManager;)Ljava/util/concurrent/locks/Lock;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :catchall_0
    move-exception p1

    .line 75
    goto :goto_0

    .line 76
    :catch_0
    move-exception p1

    .line 77
    :try_start_2
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 78
    .line 79
    .line 80
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 81
    .line 82
    invoke-static {p0}, Lcom/cosmos/photon/push/PushImManager;->access$500(Lcom/cosmos/photon/push/PushImManager;)Ljava/util/concurrent/locks/Lock;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :goto_0
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 91
    .line 92
    invoke-static {p0}, Lcom/cosmos/photon/push/PushImManager;->access$500(Lcom/cosmos/photon/push/PushImManager;)Ljava/util/concurrent/locks/Lock;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 97
    .line 98
    .line 99
    throw p1

    .line 100
    :cond_1
    :goto_1
    return-void

    .line 101
    :catch_1
    move-exception p0

    .line 102
    const-string p1, "MoPush-"

    .line 103
    .line 104
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public processAuthResult(Lcom/immomo/push/pb/SAuthRet;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/immomo/push/pb/SAuthRet;->getEc()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Lcom/immomo/push/pb/SAuthRet;->getAp()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 16
    .line 17
    invoke-static {v1, p1}, Lcom/cosmos/photon/push/PushImManager;->access$300(Lcom/cosmos/photon/push/PushImManager;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 21
    .line 22
    invoke-static {p1, v0}, Lcom/cosmos/photon/push/PushImManager;->access$702(Lcom/cosmos/photon/push/PushImManager;I)I

    .line 23
    .line 24
    .line 25
    const-string p1, "MoPush-IM"

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    const/16 v1, 0x190

    .line 30
    .line 31
    if-eq v0, v1, :cond_2

    .line 32
    .line 33
    const/16 v1, 0x193

    .line 34
    .line 35
    if-eq v0, v1, :cond_1

    .line 36
    .line 37
    const/16 v1, 0x19a

    .line 38
    .line 39
    if-eq v0, v1, :cond_2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    const-string v1, "auth failed"

    .line 43
    .line 44
    invoke-static {p1, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    invoke-static {p1, v1}, Lcom/cosmos/photon/push/PushImManager;->access$002(Lcom/cosmos/photon/push/PushImManager;Z)Z

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 54
    .line 55
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$800(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/baseim/push/PushClient;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/push/PushClient;->stopSync()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 63
    .line 64
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$800(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/baseim/push/PushClient;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/push/PushClient;->stopKeepAlive()V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 72
    .line 73
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$200(Lcom/cosmos/photon/push/PushImManager;)Landroid/os/Handler;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    new-instance v1, Lcom/cosmos/photon/push/PushImManager$2$1;

    .line 78
    .line 79
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/PushImManager$2$1;-><init>(Lcom/cosmos/photon/push/PushImManager$2;)V

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 83
    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    const-string v1, "auth redirect"

    .line 87
    .line 88
    invoke-static {p1, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 92
    .line 93
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$800(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/baseim/push/PushClient;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/push/PushClient;->stopSync()V

    .line 98
    .line 99
    .line 100
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 101
    .line 102
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$800(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/baseim/push/PushClient;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/push/PushClient;->stopKeepAlive()V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 110
    .line 111
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$200(Lcom/cosmos/photon/push/PushImManager;)Landroid/os/Handler;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    new-instance v1, Lcom/cosmos/photon/push/PushImManager$2$2;

    .line 116
    .line 117
    invoke-direct {v1, p0}, Lcom/cosmos/photon/push/PushImManager$2$2;-><init>(Lcom/cosmos/photon/push/PushImManager$2;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p1, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_3
    const-string v1, "auth success"

    .line 125
    .line 126
    invoke-static {p1, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 130
    .line 131
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$800(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/baseim/push/PushClient;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/push/PushClient;->startSync()V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 139
    .line 140
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$800(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/baseim/push/PushClient;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p1}, Lcom/cosmos/photon/baseim/push/PushClient;->startKeepAlive()V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 148
    .line 149
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$900(Lcom/cosmos/photon/push/PushImManager;)V

    .line 150
    .line 151
    .line 152
    :goto_0
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 153
    .line 154
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$100(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/push/PushImManager$AuthListener;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    if-eqz p1, :cond_4

    .line 159
    .line 160
    iget-object p0, p0, Lcom/cosmos/photon/push/PushImManager$2;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 161
    .line 162
    invoke-static {p0}, Lcom/cosmos/photon/push/PushImManager;->access$100(Lcom/cosmos/photon/push/PushImManager;)Lcom/cosmos/photon/push/PushImManager$AuthListener;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-interface {p0, v0}, Lcom/cosmos/photon/push/PushImManager$AuthListener;->onAuthEvent(I)V

    .line 167
    .line 168
    .line 169
    :cond_4
    return-void
.end method
