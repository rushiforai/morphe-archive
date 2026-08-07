.class public Lcom/cosmos/photon/baseim/im/TaskSender;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private nativePtr:J


# direct methods
.method private constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    const-string v1, "TaskSender init : "

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "TaskSender"

    .line 19
    .line 20
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-wide p1, p0, Lcom/cosmos/photon/baseim/im/TaskSender;->nativePtr:J

    .line 24
    .line 25
    return-void
.end method

.method private native nativeSendPacketAsync(J[B)V
.end method

.method private native nativeSendPacketSync(J[B)Lcom/cosmos/photon/baseim/im/IMJPacket;
.end method


# virtual methods
.method public sendPacketAsync(Lcom/cosmos/photon/baseim/im/IPacket;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/TaskSender;->nativePtr:J

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/cosmos/photon/baseim/im/IPacket;->getBody()[B

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/TaskSender;->nativeSendPacketAsync(J[B)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public sendPacketSync(Lcom/cosmos/photon/baseim/im/IPacket;)Lcom/cosmos/photon/baseim/im/IMJPacket;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/cosmos/photon/baseim/im/TaskSender;->nativePtr:J

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/cosmos/photon/baseim/im/IPacket;->getBody()[B

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, v0, v1, p1}, Lcom/cosmos/photon/baseim/im/TaskSender;->nativeSendPacketSync(J[B)Lcom/cosmos/photon/baseim/im/IMJPacket;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
