.class public Ll/imt;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/tantan/live/search/eventbus/LiveSearchEventBus;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ll/u3z;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/live/search/eventbus/LiveSearchEventBus;Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;)V
    .locals 0
    .param p1    # Lcom/tantan/live/search/eventbus/LiveSearchEventBus;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/imt;->a:Lcom/tantan/live/search/eventbus/LiveSearchEventBus;

    .line 5
    .line 6
    iput-object p2, p0, Ll/imt;->b:Lcom/p1/mobile/putong/live/external/square/search/LiveSearchAct;

    .line 7
    .line 8
    new-instance p1, Ll/u3z;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/u3z;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/imt;->c:Ll/u3z;

    .line 14
    .line 15
    return-void
.end method
