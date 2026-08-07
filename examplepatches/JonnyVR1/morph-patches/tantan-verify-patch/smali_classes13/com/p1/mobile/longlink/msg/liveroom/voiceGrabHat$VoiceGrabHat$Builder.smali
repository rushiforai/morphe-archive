.class public final Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHatOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->x()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

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

.method public synthetic constructor <init>(Ll/g6r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllCallHatInfos(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->a(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->b(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V

    return-object p0
.end method

.method public addCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->c(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V

    return-object p0
.end method

.method public addCallHatInfos(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->d(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V

    return-object p0
.end method

.method public addCallHatInfos(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->e(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCallHatInfos()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->f(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearId()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->g(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLiveId()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->h(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStatus()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->i(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearToast()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->j(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUpdatedTime()Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->k(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getCallHatInfos(I)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getCallHatInfos(I)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCallHatInfosCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getCallHatInfosCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCallHatInfosList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getCallHatInfosList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getIdBytes()Lcom/google/protobuf/ByteString;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getLiveId()Ljava/lang/String;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getLiveIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatus()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getStatus()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getStatusBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getStatusBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getToast()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getToast()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getToastBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getToastBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUpdatedTime()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->getUpdatedTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public removeCallHatInfos(I)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->l(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->m(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo$Builder;)V

    return-object p0
.end method

.method public setCallHatInfos(ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->n(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;ILcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$CallHatInfo;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->o(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->p(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->q(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLiveIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->r(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatus(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->s(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStatusBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->t(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setToast(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->u(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setToastBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->v(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUpdatedTime(J)Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;->w(Lcom/p1/mobile/longlink/msg/liveroom/voiceGrabHat$VoiceGrabHat;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
