.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkPointsOrBuilder;
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
    name = "PkPointsOrBuilder"
.end annotation


# virtual methods
.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getExecuteInfo()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkExecuteInfo;
.end method

.method public abstract getPkId()Ljava/lang/String;
.end method

.method public abstract getPkIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getPoints(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;
.end method

.method public abstract getPointsCount()I
.end method

.method public abstract getPointsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$PkUserPoints;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getServerTimeTs()J
.end method

.method public abstract hasExecuteInfo()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
