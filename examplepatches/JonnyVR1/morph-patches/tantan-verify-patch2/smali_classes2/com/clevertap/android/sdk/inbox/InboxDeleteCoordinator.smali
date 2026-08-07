.class public final Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0015\u0008\u0001\u0018\u00002\u00020\u0001BY\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u000c\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u0008\u0012\u0006\u0010\u000c\u001a\u00020\u000b\u0012\u0006\u0010\u000e\u001a\u00020\r\u0012\u0006\u0010\u0010\u001a\u00020\u000f\u0012\u0008\u0008\u0002\u0010\u0012\u001a\u00020\u0011\u0012\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u0013\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J&\u0010\u001c\u001a\u00020\u001b2\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00180\u00172\u0006\u0010\u001a\u001a\u00020\rH\u0082@\u00a2\u0006\u0004\u0008\u001c\u0010\u001dJ\u0015\u0010\u001e\u001a\u00020\u001b2\u0006\u0010\u001a\u001a\u00020\r\u00a2\u0006\u0004\u0008\u001e\u0010\u001fR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008 \u0010!R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\"\u0010#R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008$\u0010%R\u001a\u0010\n\u001a\u0008\u0012\u0004\u0012\u00020\t0\u00088\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008&\u0010\'R\u0014\u0010\u000c\u001a\u00020\u000b8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010(R\u0014\u0010\u000e\u001a\u00020\r8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010)R\u0014\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008*\u0010+R\u0014\u0010\u0012\u001a\u00020\u00118\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008,\u0010-R\u0014\u0010\u0014\u001a\u00020\u00138\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008.\u0010/\u00a8\u00060"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;",
        "",
        "Ll/dl20;",
        "networkScope",
        "Ll/yxb;",
        "ctApi",
        "Ll/hxb0;",
        "queueHeaderBuilder",
        "Lkotlin/Function0;",
        "Ll/h1c;",
        "dbAdapterProvider",
        "Ll/bu9;",
        "coreMetaData",
        "",
        "packageName",
        "Ll/axl;",
        "logger",
        "Ll/oa5;",
        "clock",
        "Lkotlinx/coroutines/CoroutineDispatcher;",
        "httpDispatcher",
        "<init>",
        "(Ll/dl20;Ll/yxb;Ll/hxb0;Lkotlin/jvm/functions/Function0;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;)V",
        "",
        "Lcom/clevertap/android/sdk/inbox/CTInboxMessage;",
        "messages",
        "userId",
        "",
        "f",
        "(Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "e",
        "(Ljava/lang/String;)V",
        "a",
        "Ll/dl20;",
        "b",
        "Ll/yxb;",
        "c",
        "Ll/hxb0;",
        "d",
        "Lkotlin/jvm/functions/Function0;",
        "Ll/bu9;",
        "Ljava/lang/String;",
        "g",
        "Ll/axl;",
        "h",
        "Ll/oa5;",
        "i",
        "Lkotlinx/coroutines/CoroutineDispatcher;",
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


# instance fields
.field private final a:Ll/dl20;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/yxb;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Ll/hxb0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Lkotlin/jvm/functions/Function0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function0<",
            "Ll/h1c;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:Ll/bu9;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final g:Ll/axl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final h:Ll/oa5;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final i:Lkotlinx/coroutines/CoroutineDispatcher;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dl20;Ll/yxb;Ll/hxb0;Lkotlin/jvm/functions/Function0;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;)V
    .locals 0
    .param p1    # Ll/dl20;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/yxb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/hxb0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lkotlin/jvm/functions/Function0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ll/bu9;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p8    # Ll/oa5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p9    # Lkotlinx/coroutines/CoroutineDispatcher;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dl20;",
            "Ll/yxb;",
            "Ll/hxb0;",
            "Lkotlin/jvm/functions/Function0<",
            "Ll/h1c;",
            ">;",
            "Ll/bu9;",
            "Ljava/lang/String;",
            "Ll/axl;",
            "Ll/oa5;",
            "Lkotlinx/coroutines/CoroutineDispatcher;",
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
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->a:Ll/dl20;

    .line 32
    .line 33
    iput-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->b:Ll/yxb;

    .line 34
    .line 35
    iput-object p3, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->c:Ll/hxb0;

    .line 36
    .line 37
    iput-object p4, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->d:Lkotlin/jvm/functions/Function0;

    .line 38
    .line 39
    iput-object p5, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->e:Ll/bu9;

    .line 40
    .line 41
    iput-object p6, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->f:Ljava/lang/String;

    .line 42
    .line 43
    iput-object p7, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->g:Ll/axl;

    .line 44
    .line 45
    iput-object p8, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->h:Ll/oa5;

    .line 46
    .line 47
    iput-object p9, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->i:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 48
    .line 49
    return-void
.end method

.method public synthetic constructor <init>(Ll/dl20;Ll/yxb;Ll/hxb0;Lkotlin/jvm/functions/Function0;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 12

    move/from16 v0, p10

    and-int/lit16 v1, v0, 0x80

    if-eqz v1, :cond_0

    .line 50
    sget-object v1, Ll/oa5;->a:Ll/oa5;

    move-object v10, v1

    goto :goto_0

    :cond_0
    move-object/from16 v10, p8

    :goto_0
    and-int/lit16 v0, v0, 0x100

    if-eqz v0, :cond_1

    .line 51
    invoke-static {}, Ll/r5e;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object v0

    move-object v11, v0

    :goto_1
    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object/from16 v6, p4

    move-object/from16 v7, p5

    move-object/from16 v8, p6

    move-object/from16 v9, p7

    goto :goto_2

    :cond_1
    move-object/from16 v11, p9

    goto :goto_1

    .line 52
    :goto_2
    invoke-direct/range {v2 .. v11}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;-><init>(Ll/dl20;Ll/yxb;Ll/hxb0;Lkotlin/jvm/functions/Function0;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;)V

    return-void
.end method

.method public static final synthetic a(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)Ll/oa5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->h:Ll/oa5;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)Lkotlin/jvm/functions/Function0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->d:Lkotlin/jvm/functions/Function0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)Ll/axl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->g:Ll/axl;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->f(Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private final f(Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/clevertap/android/sdk/inbox/CTInboxMessage;",
            ">;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    instance-of v2, v1, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    move-object v2, v1

    .line 10
    check-cast v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;

    .line 11
    .line 12
    iget v3, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->label:I

    .line 13
    .line 14
    const/high16 v4, -0x80000000

    .line 15
    .line 16
    and-int v5, v3, v4

    .line 17
    .line 18
    if-eqz v5, :cond_0

    .line 19
    .line 20
    sub-int/2addr v3, v4

    .line 21
    iput v3, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->label:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;

    .line 25
    .line 26
    invoke-direct {v2, v0, v1}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;-><init>(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Lkotlin/coroutines/Continuation;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object v1, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->result:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    iget v4, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->label:I

    .line 36
    .line 37
    const/4 v5, 0x1

    .line 38
    if-eqz v4, :cond_2

    .line 39
    .line 40
    if-ne v4, v5, :cond_1

    .line 41
    .line 42
    iget-object v0, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->L$2:Ljava/lang/Object;

    .line 43
    .line 44
    check-cast v0, Ljava/lang/String;

    .line 45
    .line 46
    iget-object v3, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->L$1:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v3, Ljava/util/List;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->L$0:Ljava/lang/Object;

    .line 51
    .line 52
    check-cast v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 53
    .line 54
    invoke-static {v1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    move-object v15, v1

    .line 58
    move-object v1, v0

    .line 59
    move-object v0, v2

    .line 60
    move-object v2, v15

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    const-string v0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 63
    .line 64
    invoke-static {v0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    const/4 v0, 0x0

    .line 68
    return-object v0

    .line 69
    :cond_2
    invoke-static {v1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    new-instance v6, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;

    .line 73
    .line 74
    iget-object v7, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->b:Ll/yxb;

    .line 75
    .line 76
    iget-object v8, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->c:Ll/hxb0;

    .line 77
    .line 78
    iget-object v10, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->e:Ll/bu9;

    .line 79
    .line 80
    iget-object v11, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->f:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v12, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->g:Ll/axl;

    .line 83
    .line 84
    iget-object v13, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->h:Ll/oa5;

    .line 85
    .line 86
    iget-object v14, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->i:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 87
    .line 88
    move-object/from16 v9, p1

    .line 89
    .line 90
    invoke-direct/range {v6 .. v14}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;-><init>(Ll/yxb;Ll/hxb0;Ljava/util/List;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;)V

    .line 91
    .line 92
    .line 93
    iput-object v0, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->L$0:Ljava/lang/Object;

    .line 94
    .line 95
    iput-object v9, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->L$1:Ljava/lang/Object;

    .line 96
    .line 97
    move-object/from16 v1, p2

    .line 98
    .line 99
    iput-object v1, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->L$2:Ljava/lang/Object;

    .line 100
    .line 101
    iput v5, v2, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$runDelete$1;->label:I

    .line 102
    .line 103
    invoke-virtual {v6, v2}, Lcom/clevertap/android/sdk/network/fetch/InboxDeleteCall;->a(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    if-ne v2, v3, :cond_3

    .line 108
    .line 109
    return-object v3

    .line 110
    :cond_3
    move-object v3, v9

    .line 111
    :goto_1
    check-cast v2, Lcom/clevertap/android/sdk/network/fetch/a;

    .line 112
    .line 113
    instance-of v2, v2, Lcom/clevertap/android/sdk/network/fetch/a$c;

    .line 114
    .line 115
    const-string v4, "InboxV2"

    .line 116
    .line 117
    if-eqz v2, :cond_5

    .line 118
    .line 119
    check-cast v3, Ljava/lang/Iterable;

    .line 120
    .line 121
    new-instance v2, Ljava/util/ArrayList;

    .line 122
    .line 123
    const/16 v5, 0xa

    .line 124
    .line 125
    invoke-static {v3, v5}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 126
    .line 127
    .line 128
    move-result v5

    .line 129
    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 130
    .line 131
    .line 132
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 133
    .line 134
    .line 135
    move-result-object v3

    .line 136
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    if-eqz v5, :cond_4

    .line 141
    .line 142
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    check-cast v5, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 147
    .line 148
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->e()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-interface {v2, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    goto :goto_2

    .line 156
    :cond_4
    iget-object v3, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->d:Lkotlin/jvm/functions/Function0;

    .line 157
    .line 158
    invoke-interface {v3}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    check-cast v3, Ll/h1c;

    .line 163
    .line 164
    invoke-virtual {v3, v2, v1}, Ll/h1c;->G(Ljava/util/List;Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    iget-object v0, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->g:Ll/axl;

    .line 168
    .line 169
    new-instance v1, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v3, "syncDelete acked by server (n="

    .line 172
    .line 173
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 177
    .line 178
    .line 179
    move-result v2

    .line 180
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    const-string v2, ") \u2014 awaiting TTL"

    .line 184
    .line 185
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-interface {v0, v4, v1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    goto :goto_3

    .line 196
    :cond_5
    iget-object v0, v0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->g:Ll/axl;

    .line 197
    .line 198
    new-instance v1, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    const-string v2, "delete batch (n="

    .line 201
    .line 202
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 206
    .line 207
    .line 208
    move-result v2

    .line 209
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 210
    .line 211
    .line 212
    const-string v2, ") did not confirm; will retry"

    .line 213
    .line 214
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    invoke-interface {v0, v4, v1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    :goto_3
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 225
    .line 226
    return-object v0
.end method


# virtual methods
.method public final e(Ljava/lang/String;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->a:Ll/dl20;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/dl20;->a()Ll/drb;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v4, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-direct {v4, p0, p1, v0}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;-><init>(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    .line 14
    .line 15
    .line 16
    const/4 v5, 0x3

    .line 17
    const/4 v6, 0x0

    .line 18
    const/4 v2, 0x0

    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-static/range {v1 .. v6}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 21
    .line 22
    .line 23
    return-void
.end method
