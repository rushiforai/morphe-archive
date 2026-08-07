.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNoticeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNoticeOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->P()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

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

.method public synthetic constructor <init>(Ll/c3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllAnswerOptions(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllCountdownTips(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAnswerOptions(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption$Builder;)V

    return-object p0
.end method

.method public addAnswerOptions(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;)V

    return-object p0
.end method

.method public addAnswerOptions(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption$Builder;)V

    return-object p0
.end method

.method public addAnswerOptions(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addCountdownTips(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addCountdownTipsBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearAnswerOptions()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearArtist()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCountdown()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCountdownTips()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearEnd()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGameId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSongDuration()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSongId()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSongIndex()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSongName()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->r(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSongShowAnswerLastSecond()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSongShowAnswerOptionsDuration()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->t(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSourceUrl()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->u(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getAnswerOptions(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getAnswerOptions(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getAnswerOptionsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getAnswerOptionsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getAnswerOptionsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getAnswerOptionsList()Ljava/util/List;

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

.method public getArtist()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getArtist()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getArtistBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getArtistBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCountdown()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getCountdown()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getCountdownTips(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getCountdownTips(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCountdownTipsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getCountdownTipsBytes(I)Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCountdownTipsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getCountdownTipsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getCountdownTipsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getCountdownTipsList()Ljava/util/List;

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

.method public getEnd()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getEnd()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getGameId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getGameId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGameIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getGameIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSongDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSongDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getSongId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSongId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSongIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSongIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSongIndex()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSongIndex()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getSongName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSongName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSongNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSongNameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSongShowAnswerLastSecond()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSongShowAnswerLastSecond()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getSongShowAnswerOptionsDuration()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSongShowAnswerOptionsDuration()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getSourceUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSourceUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSourceUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->getSourceUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removeAnswerOptions(I)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setAnswerOptions(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->w(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption$Builder;)V

    return-object p0
.end method

.method public setAnswerOptions(ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->x(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;ILcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceAnswerOption;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setArtist(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->y(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setArtistBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->z(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCountdown(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->A(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCountdownTips(ILjava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->B(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setEnd(Z)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->C(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGameId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->D(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGameIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->E(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSongDuration(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->F(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSongId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->G(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSongIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->H(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSongIndex(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->I(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSongName(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->J(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSongNameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->K(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSongShowAnswerLastSecond(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->L(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSongShowAnswerOptionsDuration(J)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->M(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSourceUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->N(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSourceUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;->O(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceSongGameUserNotice;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
