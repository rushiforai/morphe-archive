.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfoOrBuilder;
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
    name = "LiveRewardPointInfoOrBuilder"
.end annotation


# virtual methods
.method public abstract getCallRewardPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;
.end method

.method public abstract getCallRewardPointsCount()I
.end method

.method public abstract getCallRewardPointsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveRewardPointInfo$CallRewardPoint;",
            ">;"
        }
    .end annotation
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getLiveId()Ljava/lang/String;
.end method

.method public abstract getLiveIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getRewardPoint()J
.end method

.method public abstract getRoomId()Ljava/lang/String;
.end method

.method public abstract getRoomIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract synthetic isInitialized()Z
.end method
