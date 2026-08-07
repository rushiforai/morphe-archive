.class public abstract Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Deprecated;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0003\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\'\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000f\u0010\u0007\u001a\u00020\u0006H&\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J0\u0010\u000f\u001a\u00020\u00062!\u0010\u000e\u001a\u001d\u0012\u0013\u0012\u00110\n\u00a2\u0006\u000c\u0008\u000b\u0012\u0008\u0008\u000c\u0012\u0004\u0008\u0008(\r\u0012\u0004\u0012\u00020\u00060\t\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\r\u0010\u0011\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0011\u0010\u0008J\u0015\u0010\u0011\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u0011\u0010\u0014J\r\u0010\u0015\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0015\u0010\u0008J\r\u0010\u0017\u001a\u00020\u0016\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\r\u0010\u0019\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0019\u0010\u0008J\u0015\u0010\u001c\u001a\u00020\u00062\u0006\u0010\u001b\u001a\u00020\u001a\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0015\u0010\u001e\u001a\u00020\u00062\u0006\u0010\u0013\u001a\u00020\u0012\u00a2\u0006\u0004\u0008\u001e\u0010\u0014J%\u0010\"\u001a\u0004\u0018\u00018\u0000\"\u0004\u0008\u0000\u0010\u001f2\u000e\u0010!\u001a\n\u0012\u0006\u0012\u0004\u0018\u00018\u00000 \u00a2\u0006\u0004\u0008\"\u0010#J5\u0010)\u001a\u0008\u0012\u0004\u0012\u00028\u00000&\"\u0004\u0008\u0000\u0010$2\u0012\u0010\'\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00028\u00000&0%2\u0006\u0010(\u001a\u00020\u0016\u00a2\u0006\u0004\u0008)\u0010*J-\u0010)\u001a\u0008\u0012\u0004\u0012\u00028\u00000&\"\u0004\u0008\u0000\u0010$2\u0012\u0010\'\u001a\u000e\u0012\n\u0012\u0008\u0012\u0004\u0012\u00028\u00000&0%\u00a2\u0006\u0004\u0008)\u0010+J\'\u0010)\u001a\u0008\u0012\u0004\u0012\u00028\u00000&\"\u0004\u0008\u0000\u0010$2\u000c\u0010,\u001a\u0008\u0012\u0004\u0012\u00028\u00000&\u00a2\u0006\u0004\u0008)\u0010-R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0003\u0010.R!\u00104\u001a\u0008\u0012\u0004\u0012\u00020\n0/8BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u00080\u00101\u001a\u0004\u00082\u00103\u00a8\u00065"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;",
        "",
        "Ll/ner;",
        "lifecycleProvider",
        "<init>",
        "(Ll/ner;)V",
        "",
        "getData",
        "()V",
        "Lkotlin/Function1;",
        "Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;",
        "Lkotlin/ParameterName;",
        "name",
        "data",
        "call",
        "observe",
        "(Lkotlin/jvm/functions/Function1;)V",
        "success",
        "",
        "message",
        "(Ljava/lang/String;)V",
        "loading",
        "",
        "isLoading",
        "()Z",
        "complete",
        "",
        "throwable",
        "error",
        "(Ljava/lang/Throwable;)V",
        "getDataError",
        "P",
        "Lkotlin/Function0;",
        "func",
        "safeFunc",
        "(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;",
        "T",
        "Ll/pcj;",
        "Lrx/c;",
        "func0",
        "delayOnStop",
        "duringCreated",
        "(Ll/pcj;Z)Lrx/c;",
        "(Ll/pcj;)Lrx/c;",
        "org",
        "(Lrx/c;)Lrx/c;",
        "Ll/ner;",
        "Lrx/subjects/a;",
        "behaviorSubject$delegate",
        "Lkotlin/Lazy;",
        "getBehaviorSubject",
        "()Lrx/subjects/a;",
        "behaviorSubject",
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
.field private final behaviorSubject$delegate:Lkotlin/Lazy;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final lifecycleProvider:Ll/ner;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0
    .param p1    # Ll/ner;
        .annotation build Lorg/jetbrains/annotations/NotNull;
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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->lifecycleProvider:Ll/ner;

    .line 8
    .line 9
    new-instance p1, Ll/b4n;

    .line 10
    .line 11
    invoke-direct {p1}, Ll/b4n;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-static {p1}, Lkotlin/LazyKt__LazyJVMKt;->b(Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->behaviorSubject$delegate:Lkotlin/Lazy;

    .line 19
    .line 20
    return-void
.end method

.method public static a(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static b(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)V
    .locals 1

    .line 1
    new-instance v0, Ll/c4n;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2}, Ll/c4n;-><init>(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->safeFunc(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic c(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->observe$lambda$2$0(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static d()Lrx/subjects/a;
    .locals 1

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method private final getBehaviorSubject()Lrx/subjects/a;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->behaviorSubject$delegate:Lkotlin/Lazy;

    .line 2
    .line 3
    invoke-interface {p0}, Lkotlin/Lazy;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    check-cast p0, Lrx/subjects/a;

    .line 11
    .line 12
    return-object p0
.end method

.method private static final observe$lambda$2$0(Lkotlin/jvm/functions/Function1;Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;)Lkotlin/Unit;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    return-object p0
.end method


# virtual methods
.method public final complete()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->complete()Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final duringCreated(Ll/pcj;)Lrx/c;
    .locals 0
    .param p1    # Ll/pcj;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->lifecycleProvider:Ll/ner;

    invoke-interface {p0, p1}, Ll/ner;->duringCreated(Ll/pcj;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public final duringCreated(Ll/pcj;Z)Lrx/c;
    .locals 0
    .param p1    # Ll/pcj;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->lifecycleProvider:Ll/ner;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Ll/ner;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final duringCreated(Lrx/c;)Lrx/c;
    .locals 0
    .param p1    # Lrx/c;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->lifecycleProvider:Ll/ner;

    invoke-interface {p0, p1}, Ll/ner;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public final error(Ljava/lang/Throwable;)V
    .locals 1
    .param p1    # Ljava/lang/Throwable;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->error(Ljava/lang/Throwable;)Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public abstract getData()V
.end method

.method public final getDataError(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->getDataError(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final isLoading()Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->isLoading()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final loading()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->loading()Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final observe(Lkotlin/jvm/functions/Function1;)V
    .locals 3
    .param p1    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/y3n;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/y3n;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ll/z3n;

    .line 18
    .line 19
    invoke-direct {v2, v1}, Ll/z3n;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/a4n;

    .line 27
    .line 28
    invoke-direct {v1, p0, p1}, Ll/a4n;-><init>(Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;Lkotlin/jvm/functions/Function1;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final safeFunc(Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;
    .locals 1
    .param p1    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<P:",
            "Ljava/lang/Object;",
            ">(",
            "Lkotlin/jvm/functions/Function0<",
            "+TP;>;)TP;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    return-object p0

    .line 9
    :catch_0
    move-exception p1

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getDataError(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    const-string p0, "safeFunc"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/fhw;->b(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public final success()V
    .locals 1

    .line 21
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    move-result-object p0

    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;-><init>()V

    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->success()Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    move-result-object v0

    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public final success(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlBaseAsyncPlug;->getBehaviorSubject()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    new-instance v0, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;->success(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/intl/livesquare/api/IntlModelData;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
