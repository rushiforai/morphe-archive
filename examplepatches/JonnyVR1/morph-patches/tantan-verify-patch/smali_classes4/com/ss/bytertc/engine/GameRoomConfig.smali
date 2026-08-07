.class public Lcom/ss/bytertc/engine/GameRoomConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public gameRoomType:Lcom/ss/bytertc/engine/type/GameRoomType;

.field public gameSceneType:Lcom/ss/bytertc/engine/type/GameSceneType;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/type/GameRoomType;Lcom/ss/bytertc/engine/type/GameSceneType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/GameRoomConfig;->gameRoomType:Lcom/ss/bytertc/engine/type/GameRoomType;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/GameRoomConfig;->gameSceneType:Lcom/ss/bytertc/engine/type/GameSceneType;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getGameRoomType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/GameRoomConfig;->gameRoomType:Lcom/ss/bytertc/engine/type/GameRoomType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/type/GameRoomType;->value()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getGameSceneType()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/GameRoomConfig;->gameSceneType:Lcom/ss/bytertc/engine/type/GameSceneType;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/type/GameSceneType;->value()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "GameRoomConfig{gameRoomType="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/GameRoomConfig;->gameRoomType:Lcom/ss/bytertc/engine/type/GameRoomType;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", gameSceneType="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/ss/bytertc/engine/GameRoomConfig;->gameSceneType:Lcom/ss/bytertc/engine/type/GameSceneType;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x7d

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
