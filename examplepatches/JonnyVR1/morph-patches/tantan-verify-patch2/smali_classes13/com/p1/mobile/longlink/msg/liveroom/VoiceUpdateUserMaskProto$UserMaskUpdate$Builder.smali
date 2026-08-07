.class public final Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdateOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdateOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->k()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/i5p0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearAvatarId()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMask()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserId()Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAvatarId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->getAvatarId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAvatarIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->getAvatarIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->getUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->hasMask()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->d(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAvatarId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAvatarIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->f(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->g(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public setMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->h(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->i(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->j(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
