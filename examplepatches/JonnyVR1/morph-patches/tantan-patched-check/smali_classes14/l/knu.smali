.class public Ll/knu;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final c:Ll/u3z;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public d:Ll/ner;

.field public e:Ll/xnu;

.field public f:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;ZLl/xnu;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/knu;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 5
    .line 6
    iput-object p2, p0, Ll/knu;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;

    .line 7
    .line 8
    iput-object p2, p0, Ll/knu;->d:Ll/ner;

    .line 9
    .line 10
    iput-boolean p3, p0, Ll/knu;->f:Z

    .line 11
    .line 12
    new-instance p1, Ll/u3z;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/u3z;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/knu;->c:Ll/u3z;

    .line 18
    .line 19
    if-nez p4, :cond_0

    .line 20
    .line 21
    new-instance p4, Ll/xnu;

    .line 22
    .line 23
    invoke-direct {p4, p3}, Ll/xnu;-><init>(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    iput-object p4, p0, Ll/knu;->e:Ll/xnu;

    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/knu;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatAct;

    .line 2
    .line 3
    return-object p0
.end method
