.class public final Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfigOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;->c()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;

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

.method public synthetic constructor <init>(Ll/c4o0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearEnable()Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;->a(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getEnable()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;->getEnable()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setEnable(Z)Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;->b(Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceLiveRankingBoard$CurrentHourSuggestConfig;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
