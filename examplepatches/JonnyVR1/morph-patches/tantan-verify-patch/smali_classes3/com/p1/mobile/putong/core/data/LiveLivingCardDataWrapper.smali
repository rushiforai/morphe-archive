.class public final Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B#\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\rR\u0013\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0012"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;",
        "",
        "originUserId",
        "",
        "currentLive",
        "Lcom/p1/mobile/putong/data/Live;",
        "currentVoice",
        "Lcom/p1/mobile/putong/core/data/Voice;",
        "<init>",
        "(Ljava/lang/String;Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/putong/core/data/Voice;)V",
        "getOriginUserId",
        "()Ljava/lang/String;",
        "getCurrentLive",
        "()Lcom/p1/mobile/putong/data/Live;",
        "getCurrentVoice",
        "()Lcom/p1/mobile/putong/core/data/Voice;",
        "getUser",
        "Lcom/p1/mobile/putong/data/User;",
        "b_core_base"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final currentLive:Lcom/p1/mobile/putong/data/Live;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final currentVoice:Lcom/p1/mobile/putong/core/data/Voice;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final originUserId:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Live;Lcom/p1/mobile/putong/core/data/Voice;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/data/Live;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/core/data/Voice;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->originUserId:Ljava/lang/String;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->currentLive:Lcom/p1/mobile/putong/data/Live;

    .line 10
    .line 11
    iput-object p3, p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->currentVoice:Lcom/p1/mobile/putong/core/data/Voice;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final getCurrentLive()Lcom/p1/mobile/putong/data/Live;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->currentLive:Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getCurrentVoice()Lcom/p1/mobile/putong/core/data/Voice;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->currentVoice:Lcom/p1/mobile/putong/core/data/Voice;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getOriginUserId()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->originUserId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getUser()Lcom/p1/mobile/putong/data/User;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;->originUserId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
