.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkInfoOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PkInfoOrBuilder"
.end annotation


# virtual methods
.method public abstract getAppId()Ljava/lang/String;
.end method

.method public abstract getAppIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getBountyId()Ljava/lang/String;
.end method

.method public abstract getBountyIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getCategory()Ljava/lang/String;
.end method

.method public abstract getCategoryBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getCategoryV2()Ljava/lang/String;
.end method

.method public abstract getCategoryV2Bytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getCreatedTs()J
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getId()Ljava/lang/String;
.end method

.method public abstract getIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getIsOnceMore()Z
.end method

.method public abstract getIsTied()Z
.end method

.method public abstract getPlayers(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PlayerInfo;
.end method

.method public abstract getPlayersCount()I
.end method

.method public abstract getPlayersList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PlayerInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getPlayingBuffInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPlayingBuffInfo;
.end method

.method public abstract getPlayingStageDuration()I
.end method

.method public abstract getPlayingStageStartTs()J
.end method

.method public abstract getPunishmentStageDuration()I
.end method

.method public abstract getPunishmentStageStartTs()J
.end method

.method public abstract getStage()Ljava/lang/String;
.end method

.method public abstract getStageBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getWinnerId()Ljava/lang/String;
.end method

.method public abstract getWinnerIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract hasPlayingBuffInfo()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
