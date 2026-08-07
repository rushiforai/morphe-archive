.class Lcom/cosmos/photon/push/PushImManager$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/cosmos/photon/baseim/push/PacketReceiver;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cosmos/photon/push/PushImManager;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/cosmos/photon/push/PushImManager;


# direct methods
.method public constructor <init>(Lcom/cosmos/photon/push/PushImManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cosmos/photon/push/PushImManager$1;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onReceivePacket([B)V
    .locals 2

    .line 1
    :try_start_0
    invoke-static {p1}, Lcom/immomo/push/pb/PbPacketBody;->parseFrom([B)Lcom/immomo/push/pb/PbPacketBody;

    .line 2
    .line 3
    .line 4
    move-result-object p1
    :try_end_0
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    invoke-virtual {p1}, Lcom/immomo/push/pb/PbPacketBody;->getDisconn()Lcom/immomo/push/pb/Disconnect;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Lcom/immomo/push/pb/Disconnect;->getEc()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/16 v1, 0x199

    .line 14
    .line 15
    if-ne v0, v1, :cond_0

    .line 16
    .line 17
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$1;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    invoke-static {p1, v0}, Lcom/cosmos/photon/push/PushImManager;->access$002(Lcom/cosmos/photon/push/PushImManager;Z)Z

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$1;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$200(Lcom/cosmos/photon/push/PushImManager;)Landroid/os/Handler;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Lcom/cosmos/photon/push/PushImManager$1$1;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/PushImManager$1$1;-><init>(Lcom/cosmos/photon/push/PushImManager$1;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const/16 v1, 0x19a

    .line 39
    .line 40
    if-ne v0, v1, :cond_1

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/immomo/push/pb/Disconnect;->getAp()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/cosmos/photon/push/PushImManager$1;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 53
    .line 54
    invoke-static {v0, p1}, Lcom/cosmos/photon/push/PushImManager;->access$300(Lcom/cosmos/photon/push/PushImManager;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/cosmos/photon/push/PushImManager$1;->this$0:Lcom/cosmos/photon/push/PushImManager;

    .line 58
    .line 59
    invoke-static {p1}, Lcom/cosmos/photon/push/PushImManager;->access$200(Lcom/cosmos/photon/push/PushImManager;)Landroid/os/Handler;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v0, Lcom/cosmos/photon/push/PushImManager$1$2;

    .line 64
    .line 65
    invoke-direct {v0, p0}, Lcom/cosmos/photon/push/PushImManager$1$2;-><init>(Lcom/cosmos/photon/push/PushImManager$1;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void

    .line 72
    :catch_0
    move-exception p0

    .line 73
    const-string p1, "MoPush-"

    .line 74
    .line 75
    invoke-static {p1, p0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method
