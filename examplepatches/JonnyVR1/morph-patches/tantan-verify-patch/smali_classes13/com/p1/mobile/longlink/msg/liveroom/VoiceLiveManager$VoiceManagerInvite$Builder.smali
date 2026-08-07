.class public final Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInviteOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInviteOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->j()Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

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

.method public synthetic constructor <init>(Ll/w1o0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearInviteId()Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserId()Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getInviteId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->getInviteId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getInviteIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->getInviteIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->getLiveId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLiveIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->getUserId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->getUserIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setInviteId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->d(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setInviteIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->f(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->g(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->h(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->i(Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
