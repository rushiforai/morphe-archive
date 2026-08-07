.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCoverOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCoverOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->g()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

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

.method public synthetic constructor <init>(Ll/b4w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearCoverUrl()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRoomId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCoverUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->getCoverUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCoverUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->getCoverUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->getRoomId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRoomIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->getRoomIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public setCoverUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCoverUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRoomIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$VoiceRoomCover;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
