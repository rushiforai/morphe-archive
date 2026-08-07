.class public abstract Lcom/ss/bytertc/engine/RTSRoom;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract destroy()V
.end method

.method public abstract joinRTSRoom(Ljava/lang/String;Lcom/ss/bytertc/engine/UserInfo;)I
.end method

.method public abstract leaveRoom()I
.end method

.method public abstract sendRoomBinaryMessage([B)J
.end method

.method public abstract sendRoomMessage(Ljava/lang/String;)J
.end method

.method public abstract sendUserBinaryMessage(Ljava/lang/String;[BLcom/ss/bytertc/engine/type/MessageConfig;)J
.end method

.method public abstract sendUserMessage(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/MessageConfig;)J
.end method

.method public abstract setRTSRoomEventHandler(Lcom/ss/bytertc/engine/handler/IRTSRoomEventHandler;)I
.end method

.method public abstract updateToken(Ljava/lang/String;)I
.end method
