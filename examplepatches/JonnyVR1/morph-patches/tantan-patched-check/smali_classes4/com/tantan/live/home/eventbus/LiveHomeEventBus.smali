.class public Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/live/home/eventbus/LiveHomeEventBus$IntlGameOperationEvent;,
        Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;,
        Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;,
        Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;,
        Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;,
        Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;,
        Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;,
        Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;
    }
.end annotation


# instance fields
.field public final IntlGameOperationEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$IntlGameOperationEvent;

.field public final LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

.field public final LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

.field public final LiveHomeStartLiveEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;

.field public final LiveHomeSummaryEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;

.field public final LiveHomeVoiceSelectTopic:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;

.field public final LiveVideoChatEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;

.field public final LiveVoiceInternalWidgetEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;

.field private final mEventBusImpl:Ll/v3f;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/v3f;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/v3f;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->mEventBusImpl:Ll/v3f;

    .line 10
    .line 11
    new-instance v1, Ll/c7s;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/c7s;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/v3f;->j(Ll/cu6;)V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$IntlGameOperationEvent;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$IntlGameOperationEvent;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->IntlGameOperationEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$IntlGameOperationEvent;

    .line 25
    .line 26
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeVoiceSelectTopic:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeVoiceSelectTopic;

    .line 32
    .line 33
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeStartLiveEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;

    .line 39
    .line 40
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomePageEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomePageEvent;

    .line 46
    .line 47
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 48
    .line 49
    invoke-direct {v0, p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 50
    .line 51
    .line 52
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 53
    .line 54
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;

    .line 55
    .line 56
    invoke-direct {v0, p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeSummaryEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeSummaryEvent;

    .line 60
    .line 61
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;

    .line 62
    .line 63
    invoke-direct {v0, p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 64
    .line 65
    .line 66
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVideoChatEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVideoChatEvent;

    .line 67
    .line 68
    new-instance v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;

    .line 69
    .line 70
    invoke-direct {v0, p0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;-><init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)V

    .line 71
    .line 72
    .line 73
    iput-object v0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveVoiceInternalWidgetEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveVoiceInternalWidgetEvent;

    .line 74
    .line 75
    return-void
.end method

.method public static bridge synthetic a(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;)Ll/v3f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->mEventBusImpl:Ll/v3f;

    return-object p0
.end method
