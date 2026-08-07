.class public Lcom/tantan/live/search/eventbus/LiveSearchEventBus;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;,
        Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;,
        Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;
    }
.end annotation


# instance fields
.field public final LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

.field public final LiveSearchHistoryEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;

.field public final LiveSearchRootEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;

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
    iput-object v0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->mEventBusImpl:Ll/v3f;

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
    new-instance v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;

    .line 20
    .line 21
    invoke-direct {v0, p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;-><init>(Lcom/tantan/live/search/eventbus/LiveSearchEventBus;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchHistoryEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchHistoryEvent;

    .line 25
    .line 26
    new-instance v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;-><init>(Lcom/tantan/live/search/eventbus/LiveSearchEventBus;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchRootEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchRootEvent;

    .line 32
    .line 33
    new-instance v0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;-><init>(Lcom/tantan/live/search/eventbus/LiveSearchEventBus;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->LiveSearchEvent:Lcom/tantan/live/search/eventbus/LiveSearchEventBus$LiveSearchEvent;

    .line 39
    .line 40
    return-void
.end method

.method public static bridge synthetic a(Lcom/tantan/live/search/eventbus/LiveSearchEventBus;)Ll/v3f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantan/live/search/eventbus/LiveSearchEventBus;->mEventBusImpl:Ll/v3f;

    return-object p0
.end method
