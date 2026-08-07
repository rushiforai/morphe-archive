.class public final Ll/hsm;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c0\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003JM\u0010\u0012\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u00102\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u00082\u0008\u0008\u0002\u0010\u000b\u001a\u00020\n2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u0012\u0010\u0013JA\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00140\u00102\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0008\u0002\u0010\u000b\u001a\u00020\n2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000c2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u000e\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Ll/hsm;",
        "",
        "<init>",
        "()V",
        "",
        "accountId",
        "Ll/axl;",
        "logger",
        "Ll/nud;",
        "delayedLegacyInAppStore",
        "Ll/oa5;",
        "clock",
        "Ll/ker;",
        "lifecycleOwner",
        "Ll/drb;",
        "scope",
        "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;",
        "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
        "a",
        "(Ljava/lang/String;Ll/axl;Ll/nud;Ll/oa5;Ll/ker;Ll/drb;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;",
        "Ll/zpm;",
        "c",
        "(Ljava/lang/String;Ll/axl;Ll/oa5;Ll/ker;Ll/drb;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/hsm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/hsm;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/hsm;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/hsm;->INSTANCE:Ll/hsm;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ll/hsm;Ljava/lang/String;Ll/axl;Ll/nud;Ll/oa5;Ll/ker;Ll/drb;ILjava/lang/Object;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
    .locals 7

    .line 1
    and-int/lit8 p8, p7, 0x4

    .line 2
    .line 3
    if-eqz p8, :cond_0

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    :cond_0
    move-object v3, p3

    .line 7
    and-int/lit8 p3, p7, 0x8

    .line 8
    .line 9
    if-eqz p3, :cond_1

    .line 10
    .line 11
    sget-object p4, Ll/oa5;->a:Ll/oa5;

    .line 12
    .line 13
    :cond_1
    move-object v4, p4

    .line 14
    and-int/lit8 p3, p7, 0x10

    .line 15
    .line 16
    if-eqz p3, :cond_2

    .line 17
    .line 18
    sget-object p3, Landroidx/lifecycle/o;->Companion:Landroidx/lifecycle/o$b;

    .line 19
    .line 20
    invoke-virtual {p3}, Landroidx/lifecycle/o$b;->a()Ll/ker;

    .line 21
    .line 22
    .line 23
    move-result-object p5

    .line 24
    :cond_2
    move-object v5, p5

    .line 25
    and-int/lit8 p3, p7, 0x20

    .line 26
    .line 27
    if-eqz p3, :cond_3

    .line 28
    .line 29
    invoke-static {v5}, Ll/ler;->a(Ll/ker;)Landroidx/lifecycle/LifecycleCoroutineScope;

    .line 30
    .line 31
    .line 32
    move-result-object p3

    .line 33
    invoke-static {}, Ll/r5e;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    const/16 p5, 0x14

    .line 38
    .line 39
    invoke-virtual {p4, p5}, Lkotlinx/coroutines/CoroutineDispatcher;->limitedParallelism(I)Lkotlinx/coroutines/CoroutineDispatcher;

    .line 40
    .line 41
    .line 42
    move-result-object p4

    .line 43
    invoke-static {p3, p4}, Lkotlinx/coroutines/f;->h(Ll/drb;Lkotlin/coroutines/CoroutineContext;)Ll/drb;

    .line 44
    .line 45
    .line 46
    move-result-object p6

    .line 47
    :cond_3
    move-object v0, p0

    .line 48
    move-object v1, p1

    .line 49
    move-object v2, p2

    .line 50
    move-object v6, p6

    .line 51
    invoke-virtual/range {v0 .. v6}, Ll/hsm;->a(Ljava/lang/String;Ll/axl;Ll/nud;Ll/oa5;Ll/ker;Ll/drb;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public static synthetic d(Ll/hsm;Ljava/lang/String;Ll/axl;Ll/oa5;Ll/ker;Ll/drb;ILjava/lang/Object;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
    .locals 6

    .line 1
    and-int/lit8 p7, p6, 0x4

    .line 2
    .line 3
    if-eqz p7, :cond_0

    .line 4
    .line 5
    sget-object p3, Ll/oa5;->a:Ll/oa5;

    .line 6
    .line 7
    :cond_0
    move-object v3, p3

    .line 8
    and-int/lit8 p3, p6, 0x8

    .line 9
    .line 10
    if-eqz p3, :cond_1

    .line 11
    .line 12
    sget-object p3, Landroidx/lifecycle/o;->Companion:Landroidx/lifecycle/o$b;

    .line 13
    .line 14
    invoke-virtual {p3}, Landroidx/lifecycle/o$b;->a()Ll/ker;

    .line 15
    .line 16
    .line 17
    move-result-object p4

    .line 18
    :cond_1
    move-object v4, p4

    .line 19
    and-int/lit8 p3, p6, 0x10

    .line 20
    .line 21
    if-eqz p3, :cond_2

    .line 22
    .line 23
    invoke-static {v4}, Ll/ler;->a(Ll/ker;)Landroidx/lifecycle/LifecycleCoroutineScope;

    .line 24
    .line 25
    .line 26
    move-result-object p3

    .line 27
    invoke-static {}, Ll/r5e;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 28
    .line 29
    .line 30
    move-result-object p4

    .line 31
    const/16 p5, 0x14

    .line 32
    .line 33
    invoke-virtual {p4, p5}, Lkotlinx/coroutines/CoroutineDispatcher;->limitedParallelism(I)Lkotlinx/coroutines/CoroutineDispatcher;

    .line 34
    .line 35
    .line 36
    move-result-object p4

    .line 37
    invoke-static {p3, p4}, Lkotlinx/coroutines/f;->h(Ll/drb;Lkotlin/coroutines/CoroutineContext;)Ll/drb;

    .line 38
    .line 39
    .line 40
    move-result-object p5

    .line 41
    :cond_2
    move-object v0, p0

    .line 42
    move-object v1, p1

    .line 43
    move-object v2, p2

    .line 44
    move-object v5, p5

    .line 45
    invoke-virtual/range {v0 .. v5}, Ll/hsm;->c(Ljava/lang/String;Ll/axl;Ll/oa5;Ll/ker;Ll/drb;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ll/axl;Ll/nud;Ll/oa5;Ll/ker;Ll/drb;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/nud;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p4    # Ll/oa5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ll/drb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/axl;",
            "Ll/nud;",
            "Ll/oa5;",
            "Ll/ker;",
            "Ll/drb;",
            ")",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler<",
            "Lcom/clevertap/android/sdk/inapp/delay/DelayedInAppResult;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 17
    .line 18
    const-string v6, "Delayed"

    .line 19
    .line 20
    move-object v1, p1

    .line 21
    move-object v2, p2

    .line 22
    move-object v3, p4

    .line 23
    move-object v5, p5

    .line 24
    move-object v4, p6

    .line 25
    invoke-direct/range {v0 .. v6}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;-><init>(Ljava/lang/String;Ll/axl;Ll/oa5;Ll/drb;Ll/ker;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object p1, v0

    .line 29
    move-object p5, v1

    .line 30
    move-object p4, v2

    .line 31
    new-instance p2, Ll/jud;

    .line 32
    .line 33
    invoke-direct {p2, p5, p4, p3}, Ll/jud;-><init>(Ljava/lang/String;Ll/axl;Ll/nud;)V

    .line 34
    .line 35
    .line 36
    new-instance p3, Lcom/clevertap/android/sdk/inapp/delay/a;

    .line 37
    .line 38
    invoke-direct {p3}, Lcom/clevertap/android/sdk/inapp/delay/a;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 42
    .line 43
    invoke-direct/range {p0 .. p5}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;-><init>(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Ll/ism;Ll/pqm;Ll/axl;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method

.method public final c(Ljava/lang/String;Ll/axl;Ll/oa5;Ll/ker;Ll/drb;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/oa5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/ker;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ll/drb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/axl;",
            "Ll/oa5;",
            "Ll/ker;",
            "Ll/drb;",
            ")",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler<",
            "Ll/zpm;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 17
    .line 18
    const-string v6, "InAction"

    .line 19
    .line 20
    move-object v1, p1

    .line 21
    move-object v2, p2

    .line 22
    move-object v3, p3

    .line 23
    move-object v5, p4

    .line 24
    move-object v4, p5

    .line 25
    invoke-direct/range {v0 .. v6}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;-><init>(Ljava/lang/String;Ll/axl;Ll/oa5;Ll/drb;Ll/ker;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    move-object p1, v0

    .line 29
    move-object p5, v1

    .line 30
    move-object p4, v2

    .line 31
    new-instance p2, Ll/aqm;

    .line 32
    .line 33
    invoke-direct {p2, p4, p5}, Ll/aqm;-><init>(Ll/axl;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance p3, Ll/ypm;

    .line 37
    .line 38
    invoke-direct {p3}, Ll/ypm;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 42
    .line 43
    invoke-direct/range {p0 .. p5}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;-><init>(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Ll/ism;Ll/pqm;Ll/axl;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-object p0
.end method
