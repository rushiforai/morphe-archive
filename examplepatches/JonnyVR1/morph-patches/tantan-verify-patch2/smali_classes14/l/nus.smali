.class public Ll/nus;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ll/u3z;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tantan/live/home/eventbus/LiveHomeEventBus;Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;)V
    .locals 0
    .param p1    # Lcom/tantan/live/home/eventbus/LiveHomeEventBus;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nus;->a:Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 5
    .line 6
    iput-object p2, p0, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 7
    .line 8
    new-instance p1, Ll/u3z;

    .line 9
    .line 10
    invoke-direct {p1}, Ll/u3z;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/nus;->c:Ll/u3z;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/nus;->b:Lcom/p1/mobile/putong/live/external/module/arch/LiveBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
