.class public abstract Lcom/tantanapp/sharelib/workmanager/Worker;
.super Ljava/util/Observable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantanapp/sharelib/workmanager/Worker$Companion;,
        Lcom/tantanapp/sharelib/workmanager/Worker$Builder;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000Z\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008&\u0018\u0000 *2\u00020\u0001:\u0002)*B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0002\u0010\u0006J\u0008\u0010\u0011\u001a\u00020\u0012H&J\u0006\u0010\u0013\u001a\u00020\u0014J\u0006\u0010\u0015\u001a\u00020\u0016J\u0006\u0010\u0017\u001a\u00020\u0018J\u0006\u0010\u0019\u001a\u00020\u0018J\u0006\u0010\u001a\u001a\u00020\u001bJ\u000e\u0010\u001c\u001a\u00020\u00002\u0006\u0010\u001d\u001a\u00020\u001eJ\u0006\u0010\u001f\u001a\u00020\u000cJ\u0010\u0010 \u001a\u00020\u001b2\u0006\u0010!\u001a\u00020\"H\u0002J\u000e\u0010#\u001a\u00020\u001b2\u0006\u0010$\u001a\u00020\u0016J\u0010\u0010%\u001a\u00020\u001b2\u0006\u0010&\u001a\u00020\'H\u0002J\u0010\u0010(\u001a\u00020\u001b2\u0006\u0010!\u001a\u00020\u0012H\u0002R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\nR\u001a\u0010\u000b\u001a\u00020\u000cX\u0086.\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\r\u0010\u000e\"\u0004\u0008\u000f\u0010\u0010\u00a8\u0006+"
    }
    d2 = {
        "Lcom/tantanapp/sharelib/workmanager/Worker;",
        "Ljava/util/Observable;",
        "appContext",
        "Landroid/content/Context;",
        "info",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V",
        "getAppContext",
        "()Landroid/content/Context;",
        "getInfo",
        "()Lcom/tantanapp/sharelib/workmanager/WorkInfo;",
        "settableResult",
        "Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;",
        "getSettableResult",
        "()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;",
        "setSettableResult",
        "(Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;)V",
        "doWork",
        "Lcom/tantanapp/sharelib/workmanager/Result;",
        "getConstraints",
        "Lcom/tantanapp/sharelib/workmanager/Constraints;",
        "getInput",
        "Lcom/tantanapp/sharelib/workmanager/Data;",
        "getTryAttemptCount",
        "",
        "getTryLimit",
        "markEnqueue",
        "",
        "observe",
        "o",
        "Ljava/util/Observer;",
        "startWork",
        "updateFailed",
        "result",
        "Lcom/tantanapp/sharelib/workmanager/Result$Failure;",
        "updateProgress",
        "data",
        "updateState",
        "state",
        "Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;",
        "updateSuccess",
        "Builder",
        "Companion",
        "workmanager_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/tantanapp/sharelib/workmanager/Worker$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final TAG:Ljava/lang/String; = "Worker"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final appContext:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public settableResult:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/tantanapp/sharelib/workmanager/Worker$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/tantanapp/sharelib/workmanager/Worker$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/tantanapp/sharelib/workmanager/Worker;->Companion:Lcom/tantanapp/sharelib/workmanager/Worker$Companion;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/tantanapp/sharelib/workmanager/WorkInfo;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantanapp/sharelib/workmanager/WorkInfo;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/util/Observable;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->appContext:Landroid/content/Context;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 13
    .line 14
    return-void
.end method

.method private final updateFailed(Lcom/tantanapp/sharelib/workmanager/Result$Failure;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getSettableResult()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->d(Lcom/tantanapp/sharelib/workmanager/Result;)Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getSettableResult()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Result$Failure;->b()Ljava/lang/Throwable;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->c(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Result$Failure;->b()Ljava/lang/Throwable;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {v0, p1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->e(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    sget-object p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->FAILED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Worker;->updateState(Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method private final updateState(Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->j(Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final updateSuccess(Lcom/tantanapp/sharelib/workmanager/Result;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getSettableResult()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->d(Lcom/tantanapp/sharelib/workmanager/Result;)Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/tantanapp/sharelib/workmanager/Result;->a()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {v0, p1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->h(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->SUCCEEDED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/tantanapp/sharelib/workmanager/Worker;->updateState(Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public abstract doWork()Lcom/tantanapp/sharelib/workmanager/Result;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end method

.method public final getAppContext()Landroid/content/Context;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->appContext:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getConstraints()Lcom/tantanapp/sharelib/workmanager/Constraints;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a()Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final getInfo()Lcom/tantanapp/sharelib/workmanager/WorkInfo;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getInput()Lcom/tantanapp/sharelib/workmanager/Data;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->c()Lcom/tantanapp/sharelib/workmanager/Data;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final getSettableResult()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->settableResult:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    const-string p0, "settableResult"

    .line 7
    .line 8
    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0
.end method

.method public final getTryAttemptCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a()Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Constraints;->c()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final getTryLimit()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->a()Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Constraints;->d()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final markEnqueue()V
    .locals 1

    .line 1
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->ENQUEUED:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Worker;->updateState(Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final observe(Ljava/util/Observer;)Lcom/tantanapp/sharelib/workmanager/Worker;
    .locals 1
    .param p1    # Ljava/util/Observer;
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
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/util/Observable;->addObserver(Ljava/util/Observer;)V

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public final setSettableResult(Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->settableResult:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 5
    .line 6
    return-void
.end method

.method public final startWork()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;->Companion:Lcom/tantanapp/sharelib/workmanager/utils/SettableResult$Companion;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/utils/SettableResult$Companion;->a()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Worker;->setSettableResult(Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;)V

    .line 8
    .line 9
    .line 10
    :try_start_0
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getConstraints()Lcom/tantanapp/sharelib/workmanager/Constraints;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/tantanapp/sharelib/workmanager/Constraints;->e()I

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;->RUNNING:Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;

    .line 18
    .line 19
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Worker;->updateState(Lcom/tantanapp/sharelib/workmanager/WorkInfo$State;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->doWork()Lcom/tantanapp/sharelib/workmanager/Result;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    instance-of v1, v0, Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 27
    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    check-cast v0, Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 31
    .line 32
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Worker;->updateFailed(Lcom/tantanapp/sharelib/workmanager/Result$Failure;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getSettableResult()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 36
    .line 37
    .line 38
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/Observable;->deleteObservers()V

    .line 42
    .line 43
    .line 44
    return-object v0

    .line 45
    :catchall_0
    move-exception v0

    .line 46
    goto :goto_3

    .line 47
    :catch_0
    move-exception v0

    .line 48
    goto :goto_1

    .line 49
    :cond_0
    :try_start_1
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Worker;->updateSuccess(Lcom/tantanapp/sharelib/workmanager/Result;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    :goto_0
    iget-object v0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 53
    .line 54
    invoke-virtual {v0}, Ljava/util/Observable;->deleteObservers()V

    .line 55
    .line 56
    .line 57
    goto :goto_2

    .line 58
    :goto_1
    :try_start_2
    sget-object v1, Lcom/tantanapp/sharelib/workmanager/Result;->Companion:Lcom/tantanapp/sharelib/workmanager/Result$Companion;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Lcom/tantanapp/sharelib/workmanager/Result$Companion;->b(Ljava/lang/Throwable;)Lcom/tantanapp/sharelib/workmanager/Result$Failure;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {p0, v0}, Lcom/tantanapp/sharelib/workmanager/Worker;->updateFailed(Lcom/tantanapp/sharelib/workmanager/Result$Failure;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :goto_2
    invoke-virtual {p0}, Lcom/tantanapp/sharelib/workmanager/Worker;->getSettableResult()Lcom/tantanapp/sharelib/workmanager/utils/SettableResult;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0

    .line 73
    :goto_3
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/util/Observable;->deleteObservers()V

    .line 76
    .line 77
    .line 78
    throw v0
.end method

.method public final updateProgress(Lcom/tantanapp/sharelib/workmanager/Data;)V
    .locals 0
    .param p1    # Lcom/tantanapp/sharelib/workmanager/Data;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/sharelib/workmanager/Worker;->info:Lcom/tantanapp/sharelib/workmanager/WorkInfo;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/tantanapp/sharelib/workmanager/WorkInfo;->i(Lcom/tantanapp/sharelib/workmanager/Data;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
