.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveStickerChangeMsgOrBuilder;
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
    name = "LiveStickerChangeMsgOrBuilder"
.end annotation


# virtual methods
.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getLiveStickers(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;
.end method

.method public abstract getLiveStickersCount()I
.end method

.method public abstract getLiveStickersList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$LiveSticker;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getRoomId()Ljava/lang/String;
.end method

.method public abstract getRoomIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getTimestamp()J
.end method

.method public abstract synthetic isInitialized()Z
.end method
