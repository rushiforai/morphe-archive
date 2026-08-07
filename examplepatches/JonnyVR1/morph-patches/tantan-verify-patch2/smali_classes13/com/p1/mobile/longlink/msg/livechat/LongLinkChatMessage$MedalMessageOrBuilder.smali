.class public interface abstract Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessageOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MedalMessageOrBuilder"
.end annotation


# virtual methods
.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getIds(I)Ljava/lang/String;
.end method

.method public abstract getIdsBytes(I)Lcom/google/protobuf/ByteString;
.end method

.method public abstract getIdsCount()I
.end method

.method public abstract getIdsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getMultiRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;
.end method

.method public abstract getMultiRoomMedalsCount()I
.end method

.method public abstract getMultiRoomMedalsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSingleRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;
.end method

.method public abstract getSingleRoomMedalsCount()I
.end method

.method public abstract getSingleRoomMedalsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getVersion()Ljava/lang/String;
.end method

.method public abstract getVersionBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract synthetic isInitialized()Z
.end method
