.class public final Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0008\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001a\u0010\n\u001a\u00020\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000c\"\u0004\u0008\r\u0010\u000eR\u001a\u0010\u000f\u001a\u00020\u0010X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R\u001c\u0010\u0015\u001a\u0004\u0018\u00010\u0010X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0012\"\u0004\u0008\u0017\u0010\u0014R\u001c\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001a\u0010\u001b\"\u0004\u0008\u001c\u0010\u001dR\u001a\u0010\u001e\u001a\u00020\u001fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008 \u0010!\"\u0004\u0008\"\u0010#R\u001a\u0010$\u001a\u00020\u000bX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008%\u0010\u000c\"\u0004\u0008&\u0010\u000e\u00a8\u0006\'"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;",
        "Ljava/io/Serializable;",
        "<init>",
        "()V",
        "greetInfo",
        "Lcom/p1/mobile/putong/core/data/Greeting;",
        "getGreetInfo",
        "()Lcom/p1/mobile/putong/core/data/Greeting;",
        "setGreetInfo",
        "(Lcom/p1/mobile/putong/core/data/Greeting;)V",
        "isStartHomeCard",
        "",
        "()Z",
        "setStartHomeCard",
        "(Z)V",
        "from",
        "",
        "getFrom",
        "()Ljava/lang/String;",
        "setFrom",
        "(Ljava/lang/String;)V",
        "preSendMsg",
        "getPreSendMsg",
        "setPreSendMsg",
        "iceBreakingContent",
        "Lcom/p1/mobile/putong/core/data/IceBreakingContent;",
        "getIceBreakingContent",
        "()Lcom/p1/mobile/putong/core/data/IceBreakingContent;",
        "setIceBreakingContent",
        "(Lcom/p1/mobile/putong/core/data/IceBreakingContent;)V",
        "hotLevel",
        "",
        "getHotLevel",
        "()I",
        "setHotLevel",
        "(I)V",
        "hasCreatedGreeting",
        "getHasCreatedGreeting",
        "setHasCreatedGreeting",
        "message_intlGmsRelease"
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
.field private from:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private hasCreatedGreeting:Z

.field private hotLevel:I

.field private iceBreakingContent:Lcom/p1/mobile/putong/core/data/IceBreakingContent;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private isStartHomeCard:Z

.field private preSendMsg:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->from:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->preSendMsg:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->hasCreatedGreeting:Z

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final getFrom()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->from:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getGreetInfo()Lcom/p1/mobile/putong/core/data/Greeting;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getHasCreatedGreeting()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->hasCreatedGreeting:Z

    .line 2
    .line 3
    return p0
.end method

.method public final getHotLevel()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->hotLevel:I

    .line 2
    .line 3
    return p0
.end method

.method public final getIceBreakingContent()Lcom/p1/mobile/putong/core/data/IceBreakingContent;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->iceBreakingContent:Lcom/p1/mobile/putong/core/data/IceBreakingContent;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getPreSendMsg()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->preSendMsg:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isStartHomeCard()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->isStartHomeCard:Z

    .line 2
    .line 3
    return p0
.end method

.method public final setFrom(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->from:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public final setGreetInfo(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/Greeting;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->greetInfo:Lcom/p1/mobile/putong/core/data/Greeting;

    .line 2
    .line 3
    return-void
.end method

.method public final setHasCreatedGreeting(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->hasCreatedGreeting:Z

    .line 2
    .line 3
    return-void
.end method

.method public final setHotLevel(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->hotLevel:I

    .line 2
    .line 3
    return-void
.end method

.method public final setIceBreakingContent(Lcom/p1/mobile/putong/core/data/IceBreakingContent;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/IceBreakingContent;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->iceBreakingContent:Lcom/p1/mobile/putong/core/data/IceBreakingContent;

    .line 2
    .line 3
    return-void
.end method

.method public final setPreSendMsg(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->preSendMsg:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final setStartHomeCard(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetingParam;->isStartHomeCard:Z

    .line 2
    .line 3
    return-void
.end method
