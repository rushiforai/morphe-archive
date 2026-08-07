.class public interface abstract Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimationOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "VoiceSweetCpAnimationOrBuilder"
.end annotation


# virtual methods
.method public abstract getAnimationUrl()Ljava/lang/String;
.end method

.method public abstract getAnimationUrlBytes()Lcom/google/protobuf/ByteString;
.end method

.method public abstract getCpUsers(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
.end method

.method public abstract getCpUsersCount()I
.end method

.method public abstract getCpUsersList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;"
        }
    .end annotation
.end method

.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getHouseInfo()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;
.end method

.method public abstract getType()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;
.end method

.method public abstract getTypeValue()I
.end method

.method public abstract hasHouseInfo()Z
.end method

.method public abstract synthetic isInitialized()Z
.end method
