.class public interface abstract Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$VoiceEmojiPlayMessageOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "VoiceEmojiPlayMessageOrBuilder"
.end annotation


# virtual methods
.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getEmojiType()Ljava/lang/String;
.end method

.method public abstract getEmojiTypeBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getMid()Ljava/lang/String;
.end method

.method public abstract getMidBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getResult(I)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;
.end method

.method public abstract getResultCount()I
.end method

.method public abstract getResultList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getTempdata()Lcom/p1/mobile/longlink/msg/template/Template$TemplateData;
.end method

.method public abstract getUserId()Ljava/lang/String;
.end method

.method public abstract getUserIdBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
.end method

.method public abstract hasTempdata()Z
.end method

.method public abstract hasUserMask()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
