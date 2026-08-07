.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNoticeOrBuilder;
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
    name = "VoiceSongGameUserNoticeOrBuilder"
.end annotation


# virtual methods
.method public abstract getAnswerOptions(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;
.end method

.method public abstract getAnswerOptionsCount()I
.end method

.method public abstract getAnswerOptionsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getArtist()Ljava/lang/String;
.end method

.method public abstract getArtistBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getCountdown()J
.end method

.method public abstract getCountdownTips(I)Ljava/lang/String;
.end method

.method public abstract getCountdownTipsBytes(I)Lcom/google/protobuf/ByteString;
.end method

.method public abstract getCountdownTipsCount()I
.end method

.method public abstract getCountdownTipsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getEnd()Z
.end method

.method public abstract getGameId()Ljava/lang/String;
.end method

.method public abstract getGameIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getSongDuration()J
.end method

.method public abstract getSongId()Ljava/lang/String;
.end method

.method public abstract getSongIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getSongIndex()J
.end method

.method public abstract getSongName()Ljava/lang/String;
.end method

.method public abstract getSongNameBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getSongShowAnswerLastSecond()J
.end method

.method public abstract getSongShowAnswerOptionsDuration()J
.end method

.method public abstract getSourceUrl()Ljava/lang/String;
.end method

.method public abstract getSourceUrlBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract synthetic isInitialized()Z
.end method
