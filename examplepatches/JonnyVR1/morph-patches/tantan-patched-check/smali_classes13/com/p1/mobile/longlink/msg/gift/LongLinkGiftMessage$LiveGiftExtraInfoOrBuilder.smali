.class public interface abstract Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftExtraInfoOrBuilder;
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
    name = "LiveGiftExtraInfoOrBuilder"
.end annotation


# virtual methods
.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getDrawInfo()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveGiftDrawInfo;
.end method

.method public abstract getEffectExt()Ljava/lang/String;
.end method

.method public abstract getEffectExtBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getMask()Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$Mask;
.end method

.method public abstract getMaskMode()Z
.end method

.method public abstract getPreviewMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
.end method

.method public abstract getReceiverShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
.end method

.method public abstract getSenderShowMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
.end method

.method public abstract getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
.end method

.method public abstract getVideoEffectExtras(I)Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;
.end method

.method public abstract getVideoEffectExtrasCount()I
.end method

.method public abstract getVideoEffectExtrasList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$VideoEffectExtra;",
            ">;"
        }
    .end annotation
.end method

.method public abstract hasDrawInfo()Z
.end method

.method public abstract hasMask()Z
.end method

.method public abstract hasPreviewMask()Z
.end method

.method public abstract hasReceiverShowMask()Z
.end method

.method public abstract hasSenderShowMask()Z
.end method

.method public abstract hasUserMask()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
