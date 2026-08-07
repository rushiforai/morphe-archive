.class public interface abstract Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$ContentUpdateNoticeOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ContentUpdateNoticeOrBuilder"
.end annotation


# virtual methods
.method public abstract getAction()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdateAction;
.end method

.method public abstract getActionValue()I
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getLiveCampaigns(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;
.end method

.method public abstract getLiveCampaignsCount()I
.end method

.method public abstract getLiveCampaignsList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getPosition()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LongLinkUpdatePosition;
.end method

.method public abstract getPositionValue()I
.end method

.method public abstract getRoomId()Ljava/lang/String;
.end method

.method public abstract getRoomIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract synthetic isInitialized()Z
.end method
