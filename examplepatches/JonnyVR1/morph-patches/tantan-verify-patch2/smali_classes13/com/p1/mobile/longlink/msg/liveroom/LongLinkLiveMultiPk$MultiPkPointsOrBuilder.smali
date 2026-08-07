.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPointsOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MultiPkPointsOrBuilder"
.end annotation


# virtual methods
.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getPkId()Ljava/lang/String;
.end method

.method public abstract getPkIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getPlayer(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;
.end method

.method public abstract getPlayerCount()I
.end method

.method public abstract getPlayerList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMultiPk$MultiPkPlayer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getServerTimeTs()J
.end method

.method public abstract synthetic isInitialized()Z
.end method
