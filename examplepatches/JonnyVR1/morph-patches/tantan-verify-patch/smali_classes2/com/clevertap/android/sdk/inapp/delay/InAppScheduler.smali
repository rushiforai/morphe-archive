.class public final Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u000e\u0008\u0000\u0018\u0000 )*\u0004\u0008\u0000\u0010\u00012\u00020\u0002:\u0001!B5\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u000c\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000c\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\r\u0010\u000eJ3\u0010\u0015\u001a\u00020\u00132\u0006\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u00102\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00130\u0012H\u0003\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J1\u0010\u001a\u001a\u00020\u00132\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00180\u00172\u0012\u0010\u0014\u001a\u000e\u0012\u0004\u0012\u00028\u0000\u0012\u0004\u0012\u00020\u00130\u0012H\u0007\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\r\u0010\u001d\u001a\u00020\u001c\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u0010\u0010\u001f\u001a\u00020\u0013H\u0086@\u00a2\u0006\u0004\u0008\u001f\u0010 R\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"R\u001a\u0010\u0006\u001a\u00020\u00058\u0000X\u0080\u0004\u00a2\u0006\u000c\n\u0004\u0008\u001f\u0010#\u001a\u0004\u0008$\u0010%R\u001a\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u00078\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010&R\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008$\u0010\'R\u0014\u0010\u000c\u001a\u00020\u000b8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010(\u00a8\u0006*"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;",
        "T",
        "",
        "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;",
        "timerManager",
        "Ll/ism;",
        "storageStrategy",
        "Ll/pqm;",
        "dataExtractor",
        "Ll/axl;",
        "logger",
        "",
        "accountId",
        "<init>",
        "(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Ll/ism;Ll/pqm;Ll/axl;Ljava/lang/String;)V",
        "id",
        "",
        "delayInMs",
        "Lkotlin/Function1;",
        "",
        "onComplete",
        "f",
        "(Ljava/lang/String;JLkotlin/jvm/functions/Function1;)V",
        "",
        "Lorg/json/JSONObject;",
        "inApps",
        "e",
        "(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V",
        "",
        "c",
        "()I",
        "b",
        "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "a",
        "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;",
        "Ll/ism;",
        "d",
        "()Ll/ism;",
        "Ll/pqm;",
        "Ll/axl;",
        "Ljava/lang/String;",
        "Companion",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final Companion:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final a:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/ism;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Ll/pqm;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pqm<",
            "TT;>;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Ll/axl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->Companion:Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$a;

    return-void
.end method

.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Ll/ism;Ll/pqm;Ll/axl;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/ism;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/pqm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;",
            "Ll/ism;",
            "Ll/pqm<",
            "TT;>;",
            "Ll/axl;",
            "Ljava/lang/String;",
            ")V"
        }
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 20
    .line 21
    iput-object p2, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b:Ll/ism;

    .line 22
    .line 23
    iput-object p3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->c:Ll/pqm;

    .line 24
    .line 25
    iput-object p4, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->d:Ll/axl;

    .line 26
    .line 27
    iput-object p5, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->e:Ljava/lang/String;

    .line 28
    .line 29
    return-void
.end method

.method public static a(Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Ljava/lang/String;Lkotlin/jvm/functions/Function1;Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    instance-of v0, p3, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$a;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object p3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b:Ll/ism;

    .line 18
    .line 19
    invoke-interface {p3, p1}, Ll/ism;->c(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 20
    .line 21
    .line 22
    move-result-object p3

    .line 23
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->c:Ll/pqm;

    .line 24
    .line 25
    if-eqz p3, :cond_0

    .line 26
    .line 27
    invoke-interface {v0, p1, p3}, Ll/pqm;->a(Ljava/lang/String;Lorg/json/JSONObject;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p3

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string p3, "Data not found"

    .line 33
    .line 34
    invoke-interface {v0, p1, p3}, Ll/pqm;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    :goto_0
    invoke-interface {p2, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b:Ll/ism;

    .line 42
    .line 43
    invoke-interface {p0, p1}, Ll/ism;->a(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_1
    instance-of v0, p3, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$c;

    .line 48
    .line 49
    if-eqz v0, :cond_3

    .line 50
    .line 51
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->c:Ll/pqm;

    .line 52
    .line 53
    check-cast p3, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$c;

    .line 54
    .line 55
    invoke-virtual {p3}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$c;->a()Ljava/lang/Exception;

    .line 56
    .line 57
    .line 58
    move-result-object p3

    .line 59
    invoke-virtual {p3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    if-nez p3, :cond_2

    .line 64
    .line 65
    const-string p3, "Unknown error"

    .line 66
    .line 67
    :cond_2
    invoke-interface {v0, p1, p3}, Ll/pqm;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    invoke-interface {p2, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b:Ll/ism;

    .line 75
    .line 76
    invoke-interface {p0, p1}, Ll/ism;->a(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_3
    instance-of p3, p3, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$b;

    .line 81
    .line 82
    if-eqz p3, :cond_4

    .line 83
    .line 84
    iget-object p3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->c:Ll/pqm;

    .line 85
    .line 86
    invoke-interface {p3, p1}, Ll/pqm;->c(Ljava/lang/String;)Ljava/lang/Object;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-interface {p2, p3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b:Ll/ism;

    .line 94
    .line 95
    invoke-interface {p2, p1}, Ll/ism;->a(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object p2, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->d:Ll/axl;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->e:Ljava/lang/String;

    .line 101
    .line 102
    const-string p3, "[InAppScheduler]: Timer discarded, cleaned up: "

    .line 103
    .line 104
    invoke-virtual {p3, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-interface {p2, p0, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 112
    .line 113
    return-object p0

    .line 114
    :cond_4
    invoke-static {}, Ll/nbr;->a()V

    .line 115
    .line 116
    .line 117
    const/4 p0, 0x0

    .line 118
    return-object p0
.end method

.method private final f(Ljava/lang/String;JLkotlin/jvm/functions/Function1;)V
    .locals 2
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "J",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 2
    .line 3
    new-instance v1, Ll/gsm;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p4}, Ll/gsm;-><init>(Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1, p2, p3, v1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->q(Ljava/lang/String;JLkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/o;

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final b(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 4
    .param p1    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    instance-of v0, p1, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;

    .line 7
    .line 8
    iget v1, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;->label:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;->label:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;-><init>(Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;Lkotlin/coroutines/Continuation;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;->result:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;->label:I

    .line 32
    .line 33
    const/4 v3, 0x1

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    if-ne v2, v3, :cond_1

    .line 37
    .line 38
    iget-object p0, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;->L$0:Ljava/lang/Object;

    .line 39
    .line 40
    check-cast p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 41
    .line 42
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 47
    .line 48
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    return-object p0

    .line 53
    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 57
    .line 58
    iput-object p0, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;->L$0:Ljava/lang/Object;

    .line 59
    .line 60
    iput v3, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler$cancelAllScheduling$1;->label:I

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->k(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    if-ne p1, v1, :cond_3

    .line 67
    .line 68
    return-object v1

    .line 69
    :cond_3
    :goto_1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b:Ll/ism;

    .line 70
    .line 71
    invoke-interface {p0}, Ll/ism;->b()V

    .line 72
    .line 73
    .line 74
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 75
    .line 76
    return-object p0
.end method

.method public final c()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->l()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final d()Ll/ism;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b:Ll/ism;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ljava/util/List;Lkotlin/jvm/functions/Function1;)V
    .locals 7
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/jvm/functions/Function1;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/WorkerThread;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lorg/json/JSONObject;",
            ">;",
            "Lkotlin/jvm/functions/Function1<",
            "-TT;",
            "Lkotlin/Unit;",
            ">;)V"
        }
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
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->d:Ll/axl;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->e:Ljava/lang/String;

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v3, "[InAppScheduler]: Scheduling "

    .line 14
    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, " in-apps"

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-interface {v0, v1, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    check-cast p1, Ljava/lang/Iterable;

    .line 38
    .line 39
    new-instance v0, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const-string v2, "ti"

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    move-object v3, v1

    .line 61
    check-cast v3, Lorg/json/JSONObject;

    .line 62
    .line 63
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->a:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v3, v2}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->m(Ljava/lang/String;)Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-nez v2, :cond_0

    .line 77
    .line 78
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b:Ll/ism;

    .line 83
    .line 84
    invoke-interface {p1, v0}, Ll/ism;->d(Ljava/util/List;)Z

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    if-nez p1, :cond_2

    .line 89
    .line 90
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->d:Ll/axl;

    .line 91
    .line 92
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->e:Ljava/lang/String;

    .line 93
    .line 94
    const-string v3, "[InAppScheduler]: Failed to prepare in-apps for scheduling"

    .line 95
    .line 96
    invoke-interface {p1, v1, v3}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-eqz v0, :cond_4

    .line 108
    .line 109
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Lorg/json/JSONObject;

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->c:Ll/pqm;

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 122
    .line 123
    .line 124
    const-string v3, "Preparation failed"

    .line 125
    .line 126
    invoke-interface {v1, v0, v3}, Ll/pqm;->d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {p2, v0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_2
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    :cond_3
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_4

    .line 143
    .line 144
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Lorg/json/JSONObject;

    .line 149
    .line 150
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->c:Ll/pqm;

    .line 155
    .line 156
    invoke-interface {v3, v0}, Ll/pqm;->b(Lorg/json/JSONObject;)J

    .line 157
    .line 158
    .line 159
    move-result-wide v3

    .line 160
    const-wide/16 v5, 0x0

    .line 161
    .line 162
    cmp-long v0, v3, v5

    .line 163
    .line 164
    if-lez v0, :cond_3

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 167
    .line 168
    .line 169
    invoke-direct {p0, v1, v3, v4, p2}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->f(Ljava/lang/String;JLkotlin/jvm/functions/Function1;)V

    .line 170
    .line 171
    .line 172
    goto :goto_2

    .line 173
    :cond_4
    return-void
.end method
