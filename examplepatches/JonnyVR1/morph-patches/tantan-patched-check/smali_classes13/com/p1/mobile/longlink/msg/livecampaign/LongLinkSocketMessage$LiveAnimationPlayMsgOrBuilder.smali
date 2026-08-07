.class public interface abstract Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$LiveAnimationPlayMsgOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "LiveAnimationPlayMsgOrBuilder"
.end annotation


# virtual methods
.method public abstract getAnimationType()Ljava/lang/String;
.end method

.method public abstract getAnimationTypeBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getDuration()J
.end method

.method public abstract getLiveResourceId()Ljava/lang/String;
.end method

.method public abstract getLiveResourceIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getPriority()J
.end method

.method public abstract getRoomId()Ljava/lang/String;
.end method

.method public abstract getRoomIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getSvgaEffectExtras(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;
.end method

.method public abstract getSvgaEffectExtrasCount()I
.end method

.method public abstract getSvgaEffectExtrasList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$SvgaEffectExtra;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getToMyQueue()Z
.end method

.method public abstract getVideoEffectExtras(I)Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;
.end method

.method public abstract getVideoEffectExtrasCount()I
.end method

.method public abstract getVideoEffectExtrasList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livecampaign/LongLinkSocketMessage$VideoEffectExtra;",
            ">;"
        }
    .end annotation
.end method

.method public abstract synthetic isInitialized()Z
.end method
