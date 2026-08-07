.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercoverOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "VoiceUndercoverOrBuilder"
.end annotation


# virtual methods
.method public abstract getCountDownSeconds()I
.end method

.method public abstract getCurrentPlayers(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;
.end method

.method public abstract getCurrentPlayersCount()I
.end method

.method public abstract getCurrentPlayersList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Player;",
            ">;"
        }
    .end annotation
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getGameResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$GameResult;
.end method

.method public abstract getId()Ljava/lang/String;
.end method

.method public abstract getIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getLiveId()Ljava/lang/String;
.end method

.method public abstract getLiveIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getRemainSeconds()I
.end method

.method public abstract getStatus()Ljava/lang/String;
.end method

.method public abstract getStatusBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getToast()Ljava/lang/String;
.end method

.method public abstract getToastBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getVoteResult()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$VoteResult;
.end method

.method public abstract getVotes(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;
.end method

.method public abstract getVotesCount()I
.end method

.method public abstract getVotesList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUndercoverBean$VoiceUndercover$Vote;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getWord()Ljava/lang/String;
.end method

.method public abstract getWordBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract hasGameResult()Z
.end method

.method public abstract hasVoteResult()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
