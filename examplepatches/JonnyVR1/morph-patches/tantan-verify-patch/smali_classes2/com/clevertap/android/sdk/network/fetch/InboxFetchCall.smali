.class public final Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/q1f;


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/q1f<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0010\u0008\u0001\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001BC\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\u000c\u001a\u00020\u000b\u0012\u0008\u0008\u0002\u0010\u000e\u001a\u00020\r\u0012\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0016\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0013H\u0096@\u00a2\u0006\u0004\u0008\u0014\u0010\u0015R\u0014\u0010\u0004\u001a\u00020\u00038\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0014\u0010\u0016R\u0014\u0010\u0006\u001a\u00020\u00058\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018R\u0014\u0010\u0008\u001a\u00020\u00078\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001aR\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001cR\u0014\u0010\u000c\u001a\u00020\u000b8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001d\u0010\u001eR\u0014\u0010\u000e\u001a\u00020\r8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001f\u0010 R\u0014\u0010\u0010\u001a\u00020\u000f8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"\u00a8\u0006#"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;",
        "Ll/q1f;",
        "Lorg/json/JSONObject;",
        "Ll/yxb;",
        "ctApi",
        "Ll/hxb0;",
        "queueHeaderBuilder",
        "Ll/bu9;",
        "coreMetaData",
        "",
        "packageName",
        "Ll/axl;",
        "logger",
        "Ll/oa5;",
        "clock",
        "Lkotlinx/coroutines/CoroutineDispatcher;",
        "dispatcher",
        "<init>",
        "(Ll/yxb;Ll/hxb0;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;)V",
        "Lcom/clevertap/android/sdk/network/fetch/a;",
        "a",
        "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "Ll/yxb;",
        "b",
        "Ll/hxb0;",
        "c",
        "Ll/bu9;",
        "d",
        "Ljava/lang/String;",
        "e",
        "Ll/axl;",
        "f",
        "Ll/oa5;",
        "g",
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


# instance fields
.field private final a:Ll/yxb;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/hxb0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Ll/bu9;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final e:Ll/axl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Ll/oa5;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final g:Lkotlinx/coroutines/CoroutineDispatcher;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/yxb;Ll/hxb0;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;)V
    .locals 0
    .param p1    # Ll/yxb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/hxb0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/bu9;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # Ll/oa5;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p7    # Lkotlinx/coroutines/CoroutineDispatcher;
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object p1, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->a:Ll/yxb;

    .line 26
    .line 27
    iput-object p2, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->b:Ll/hxb0;

    .line 28
    .line 29
    iput-object p3, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->c:Ll/bu9;

    .line 30
    .line 31
    iput-object p4, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->d:Ljava/lang/String;

    .line 32
    .line 33
    iput-object p5, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->e:Ll/axl;

    .line 34
    .line 35
    iput-object p6, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->f:Ll/oa5;

    .line 36
    .line 37
    iput-object p7, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->g:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 38
    .line 39
    return-void
.end method

.method public synthetic constructor <init>(Ll/yxb;Ll/hxb0;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 8

    and-int/lit8 v0, p8, 0x20

    if-eqz v0, :cond_0

    .line 40
    sget-object p6, Ll/oa5;->a:Ll/oa5;

    :cond_0
    move-object v6, p6

    and-int/lit8 p6, p8, 0x40

    if-eqz p6, :cond_1

    .line 41
    invoke-static {}, Ll/r5e;->b()Lkotlinx/coroutines/CoroutineDispatcher;

    move-result-object p6

    move-object v7, p6

    :goto_0
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    goto :goto_1

    :cond_1
    move-object v7, p7

    goto :goto_0

    .line 42
    :goto_1
    invoke-direct/range {v0 .. v7}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;-><init>(Ll/yxb;Ll/hxb0;Ll/bu9;Ljava/lang/String;Ll/axl;Ll/oa5;Lkotlinx/coroutines/CoroutineDispatcher;)V

    return-void
.end method

.method public static final synthetic b(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/oa5;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->f:Ll/oa5;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/bu9;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->c:Ll/bu9;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/yxb;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->a:Ll/yxb;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic e(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/axl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->e:Ll/axl;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic f(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic g(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;)Ll/hxb0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->b:Ll/hxb0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 3
    .param p1    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/network/fetch/a<",
            "+",
            "Lorg/json/JSONObject;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;->g:Lkotlinx/coroutines/CoroutineDispatcher;

    .line 2
    .line 3
    new-instance v1, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v1, p0, v2}, Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall$execute$2;-><init>(Lcom/clevertap/android/sdk/network/fetch/InboxFetchCall;Lkotlin/coroutines/Continuation;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0, v1, p1}, Ll/vh3;->g(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
