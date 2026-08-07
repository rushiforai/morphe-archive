.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$VoiceLiveAuctionUpdateOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "VoiceLiveAuctionUpdateOrBuilder"
.end annotation


# virtual methods
.method public abstract getAuctionId()Ljava/lang/String;
.end method

.method public abstract getAuctionIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getCurrentTime()J
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getIsChoosingPledgeRelation()Z
.end method

.method public abstract getLeaderboardGap()J
.end method

.method public abstract getLeaderboards(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;
.end method

.method public abstract getLeaderboardsCount()I
.end method

.method public abstract getLeaderboardsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$AuctionLeaderboard;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getLevel()J
.end method

.method public abstract getPanelBgId()Ljava/lang/String;
.end method

.method public abstract getPanelBgIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getUpdateType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVoiceLiveAuctionMsg$UpdateType;
.end method

.method public abstract getUpdateTypeValue()I
.end method

.method public abstract getWorth()J
.end method

.method public abstract getWorthBubble()Ljava/lang/String;
.end method

.method public abstract getWorthBubbleBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getWorthBubbleLevel()J
.end method

.method public abstract synthetic isInitialized()Z
.end method
