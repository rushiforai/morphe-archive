.class public interface abstract Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage$ChatMsgGrpcOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkCoreChatMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ChatMsgGrpcOrBuilder"
.end annotation


# virtual methods
.method public abstract containsTickerI18N(Ljava/lang/String;)Z
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getMessage()Ljava/lang/String;
.end method

.method public abstract getMessageBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getSenderId()Ljava/lang/String;
.end method

.method public abstract getSenderIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getTicker()Ljava/lang/String;
.end method

.method public abstract getTickerBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getTickerI18N()Ljava/util/Map;
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

.method public abstract getTickerI18NCount()I
.end method

.method public abstract getTickerI18NMap()Ljava/util/Map;
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

.method public abstract getTickerI18NOrDefault(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getTickerI18NOrThrow(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getTitle()Ljava/lang/String;
.end method

.method public abstract getTitleBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getTs()J
.end method

.method public abstract synthetic isInitialized()Z
.end method
