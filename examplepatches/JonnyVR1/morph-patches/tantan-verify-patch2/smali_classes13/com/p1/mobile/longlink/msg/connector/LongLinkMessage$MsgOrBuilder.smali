.class public interface abstract Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgOrBuilder;
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
    name = "MsgOrBuilder"
.end annotation


# virtual methods
.method public abstract getData()Lcom/google/protobuf/Any;
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getIsAck()Z
.end method

.method public abstract getIsReliable()Z
.end method

.method public abstract getMsgId()Ljava/lang/String;
.end method

.method public abstract getMsgIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getMsgTypeName()Ljava/lang/String;
.end method

.method public abstract getMsgTypeNameBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getPush()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$PushContent;
.end method

.method public abstract getType()Lcom/p1/mobile/longlink/msg/connector/LongLinkMessage$MsgTypeEnum;
.end method

.method public abstract getTypeValue()I
.end method

.method public abstract getVersion()Ljava/lang/String;
.end method

.method public abstract getVersionBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract hasData()Z
.end method

.method public abstract hasPush()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
