.class public final Lcom/hellogroup/mk/core/log/core/MKLogReporter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0017\u0010\u000e\u001a\u00020\r2\u0006\u0010\u000c\u001a\u00020\u000bH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u0017\u0010\u0010\u001a\u00020\r2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000b\u00a2\u0006\u0004\u0008\u0010\u0010\u000fJ\u0015\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0012\u001a\u00020\u0011\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0015\u0010\u0016\u001a\u0004\u0008\u0017\u0010\u0018R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0019\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/hellogroup/mk/core/log/core/MKLogReporter;",
        "",
        "Ll/okw;",
        "configuration",
        "Ll/pkw;",
        "output",
        "<init>",
        "(Ll/okw;Ll/pkw;)V",
        "",
        "f",
        "()Z",
        "Ll/kkw;",
        "event",
        "",
        "c",
        "(Ll/kkw;)V",
        "e",
        "Lcom/hellogroup/mk/core/log/core/MKLogLevel;",
        "eventLevel",
        "b",
        "(Lcom/hellogroup/mk/core/log/core/MKLogLevel;)Z",
        "a",
        "Ll/okw;",
        "d",
        "()Ll/okw;",
        "Ll/pkw;",
        "MKCore_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private final a:Ll/okw;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/pkw;


# direct methods
.method public constructor <init>(Ll/okw;Ll/pkw;)V
    .locals 0
    .param p1    # Ll/okw;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/pkw;
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
    iput-object p1, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->a:Ll/okw;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->b:Ll/pkw;

    .line 10
    .line 11
    return-void
.end method

.method public static final synthetic a(Lcom/hellogroup/mk/core/log/core/MKLogReporter;)Ll/pkw;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->b:Ll/pkw;

    .line 2
    .line 3
    return-object p0
.end method

.method private final c(Ll/kkw;)V
    .locals 7

    .line 1
    sget-object v0, Lcom/hellogroup/fep/base/FepContext;->INSTANCE:Lcom/hellogroup/fep/base/FepContext;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/hellogroup/fep/base/FepContext;->a()Ll/drb;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v4, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-direct {v4, p0, p1, v0}, Lcom/hellogroup/mk/core/log/core/MKLogReporter$dispatchUpload$1;-><init>(Lcom/hellogroup/mk/core/log/core/MKLogReporter;Ll/kkw;Lkotlin/coroutines/Continuation;)V

    .line 11
    .line 12
    .line 13
    const/4 v5, 0x3

    .line 14
    const/4 v6, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    invoke-static/range {v1 .. v6}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method private final f()Z
    .locals 6

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->a:Ll/okw;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/okw;->c()D

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    const-wide/high16 v4, 0x3ff0000000000000L    # 1.0

    .line 10
    .line 11
    invoke-static/range {v0 .. v5}, Lkotlin/ranges/a;->g(DDD)D

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 16
    .line 17
    .line 18
    move-result-wide v2

    .line 19
    cmpl-double p0, v2, v0

    .line 20
    .line 21
    if-ltz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method


# virtual methods
.method public final b(Lcom/hellogroup/mk/core/log/core/MKLogLevel;)Z
    .locals 2
    .param p1    # Lcom/hellogroup/mk/core/log/core/MKLogLevel;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/nkw;->a:[I

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    aget p1, v0, p1

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    const/4 v1, 0x1

    .line 14
    if-eq p1, v0, :cond_3

    .line 15
    .line 16
    const/4 v0, 0x3

    .line 17
    if-eq p1, v0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    if-eq p1, p0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return v1

    .line 24
    :cond_1
    iget-object p1, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->a:Ll/okw;

    .line 25
    .line 26
    invoke-virtual {p1}, Ll/okw;->b()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_2

    .line 31
    .line 32
    invoke-direct {p0}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->f()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_4

    .line 37
    .line 38
    :cond_2
    return v1

    .line 39
    :cond_3
    iget-object p1, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->a:Ll/okw;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/okw;->d()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-nez p1, :cond_5

    .line 46
    .line 47
    invoke-direct {p0}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->f()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_4
    :goto_0
    const/4 p0, 0x0

    .line 55
    return p0

    .line 56
    :cond_5
    :goto_1
    return v1
.end method

.method public final d()Ll/okw;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->a:Ll/okw;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ll/kkw;)V
    .locals 1
    .param p1    # Ll/kkw;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->a:Ll/okw;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/okw;->a()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/core/log/core/MKLogReporter;->c(Ll/kkw;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
