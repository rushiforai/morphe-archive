.class public interface abstract Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContentOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "PushContentOrBuilder"
.end annotation


# virtual methods
.method public abstract containsMessageCustom(Ljava/lang/String;)Z
.end method

.method public abstract getContent()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$IdType;
.end method

.method public abstract getCounter()I
.end method

.method public abstract getCreateTime()J
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getImageURLWithoutFormat()Ljava/lang/String;
.end method

.method public abstract getImageURLWithoutFormatBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getIntent()Ljava/lang/String;
.end method

.method public abstract getIntentBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getLink()Ljava/lang/String;
.end method

.method public abstract getLinkBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getMessage()Ljava/lang/String;
.end method

.method public abstract getMessageBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getMessageCustom()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getMessageCustomCount()I
.end method

.method public abstract getMessageCustomMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getMessageCustomOrDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getMessageCustomOrThrow(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getPrimaryPicture()Ljava/lang/String;
.end method

.method public abstract getPrimaryPictureBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getPriority()I
.end method

.method public abstract getReqId()Ljava/lang/String;
.end method

.method public abstract getReqIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getSilent()Z
.end method

.method public abstract getSilentAggregation()Z
.end method

.method public abstract getStackId()I
.end method

.method public abstract getTicker()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;
.end method

.method public abstract getTitle()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;
.end method

.method public abstract getValue()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$I18n;
.end method

.method public abstract hasContent()Z
.end method

.method public abstract hasTicker()Z
.end method

.method public abstract hasTitle()Z
.end method

.method public abstract hasValue()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
