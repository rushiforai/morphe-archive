.class public final Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;
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
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0010\u000b\n\u0002\u0008\u0003\u0008\u0001\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u001f\u0010\r\u001a\u00020\u000c2\u0006\u0010\t\u001a\u00020\u00082\u0008\u0010\u000b\u001a\u0004\u0018\u00010\n\u00a2\u0006\u0004\u0008\r\u0010\u000eJ\u0015\u0010\u000f\u001a\u00020\u000c2\u0006\u0010\u000b\u001a\u00020\n\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\r\u0010\u0011\u001a\u00020\u000c\u00a2\u0006\u0004\u0008\u0011\u0010\u0012R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0015\u0010\u0016R\u0011\u0010\u0019\u001a\u00020\u00178F\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0018\u00a8\u0006\u001a"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;",
        "",
        "Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;",
        "fetcher",
        "Ll/dl20;",
        "networkScope",
        "<init>",
        "(Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;Ll/dl20;)V",
        "Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;",
        "trigger",
        "Ll/uhi;",
        "callback",
        "",
        "d",
        "(Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;Ll/uhi;)V",
        "e",
        "(Ll/uhi;)V",
        "c",
        "()V",
        "a",
        "Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;",
        "b",
        "Ll/dl20;",
        "",
        "()Z",
        "isInboxFetchDisabledForSession",
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
.field private final a:Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/dl20;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;Ll/dl20;)V
    .locals 0
    .param p1    # Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/dl20;
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->a:Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->b:Ll/dl20;

    .line 13
    .line 14
    return-void
.end method

.method public static final synthetic a(Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;)Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->a:Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->a:Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->a:Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final d(Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;Ll/uhi;)V
    .locals 7
    .param p1    # Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/uhi;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->b:Ll/dl20;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/dl20;->a()Ll/drb;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    new-instance v4, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge$submit$1;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    invoke-direct {v4, p0, p1, p2, v0}, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge$submit$1;-><init>(Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;Ll/uhi;Lkotlin/coroutines/Continuation;)V

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

.method public final e(Ll/uhi;)V
    .locals 6
    .param p1    # Ll/uhi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge;->b:Ll/dl20;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/dl20;->a()Ll/drb;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v3, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge$submitFailure$1;

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    invoke-direct {v3, p1, p0}, Lcom/clevertap/android/sdk/inbox/InboxV2Bridge$submitFailure$1;-><init>(Ll/uhi;Lkotlin/coroutines/Continuation;)V

    .line 14
    .line 15
    .line 16
    const/4 v4, 0x3

    .line 17
    const/4 v5, 0x0

    .line 18
    const/4 v1, 0x0

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static/range {v0 .. v5}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 21
    .line 22
    .line 23
    return-void
.end method
