.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PlayerInfoOrBuilder;
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
    name = "PlayerInfoOrBuilder"
.end annotation


# virtual methods
.method public abstract getBountyAmount()D
.end method

.method public abstract getChannel()Ljava/lang/String;
.end method

.method public abstract getChannelBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getChannelKey()Ljava/lang/String;
.end method

.method public abstract getChannelKeyBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getContributors(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkContributor;
.end method

.method public abstract getContributorsCount()I
.end method

.method public abstract getContributorsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkContributor;",
            ">;"
        }
    .end annotation
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getImageUrl()Ljava/lang/String;
.end method

.method public abstract getImageUrlBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getLiveId()Ljava/lang/String;
.end method

.method public abstract getLiveIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getMuted()Z
.end method

.method public abstract getPoint()J
.end method

.method public abstract getRoomId()Ljava/lang/String;
.end method

.method public abstract getRoomIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getUserId()Ljava/lang/String;
.end method

.method public abstract getUserIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getUserName()Ljava/lang/String;
.end method

.method public abstract getUserNameBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getWinTimes()J
.end method

.method public abstract synthetic isInitialized()Z
.end method
