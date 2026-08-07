.class public final Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0010\u0003\n\u0002\u0008\n\n\u0002\u0010\u000b\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\u0011\u001a\u00020\u0000J\u0006\u0010\u0012\u001a\u00020\u0000J\u000e\u0010\u0012\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0005J\u000e\u0010\u0013\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u000cJ\u000e\u0010\u0014\u001a\u00020\u00002\u0006\u0010\u0006\u001a\u00020\u0005J\u0006\u0010\u0015\u001a\u00020\u0000J\u0006\u0010\u0016\u001a\u00020\u0017J\u0006\u0010\u0018\u001a\u00020\u0017J\u0006\u0010\u0019\u001a\u00020\u0017J\u0006\u0010\u001a\u001a\u00020\u0017R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u001c\u0010\u000b\u001a\u0004\u0018\u00010\u000cX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010\u00a8\u0006\u001b"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;",
        "",
        "<init>",
        "()V",
        "state",
        "",
        "message",
        "getMessage",
        "()Ljava/lang/String;",
        "setMessage",
        "(Ljava/lang/String;)V",
        "throwable",
        "",
        "getThrowable",
        "()Ljava/lang/Throwable;",
        "setThrowable",
        "(Ljava/lang/Throwable;)V",
        "loading",
        "success",
        "error",
        "getDataError",
        "complete",
        "isLoading",
        "",
        "isComplete",
        "isError",
        "isSuccess",
        "external_intlGmsRelease"
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
.field private message:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private state:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private throwable:Ljava/lang/Throwable;
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
    const-string v0, "LOADING"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final complete()Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "COMPLETE"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public final error(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;
    .locals 1
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "ERROR"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->throwable:Ljava/lang/Throwable;

    .line 9
    .line 10
    return-object p0
.end method

.method public final getDataError(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "GET_DATA_ERROR"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->message:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method

.method public final getMessage()Ljava/lang/String;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getThrowable()Ljava/lang/Throwable;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-object p0
.end method

.method public final isComplete()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "COMPLETE"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final isError()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "ERROR"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final isLoading()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "LOADING"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final isSuccess()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "SUCCESS"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final loading()Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "LOADING"

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public final setMessage(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->message:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public final setThrowable(Ljava/lang/Throwable;)V
    .locals 0
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->throwable:Ljava/lang/Throwable;

    .line 2
    .line 3
    return-void
.end method

.method public final success()Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 11
    const-string v0, "SUCCESS"

    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    return-object p0
.end method

.method public final success(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const-string v0, "SUCCESS"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->state:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->message:Ljava/lang/String;

    .line 9
    .line 10
    return-object p0
.end method
