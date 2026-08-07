.class final Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/drb;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Ll/drb;",
        "",
        "<anonymous>",
        "(Ll/drb;)V"
    }
    k = 0x3
    mv = {
        0x2,
        0x0,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.clevertap.android.sdk.inbox.InboxDeleteCoordinator$syncDelete$1"
    f = "InboxDeleteCoordinator.kt"
    l = {
        0x32
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $messages:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/clevertap/android/sdk/inbox/CTInboxMessage;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $userId:Ljava/lang/String;

.field label:I

.field final synthetic this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;",
            "Ljava/util/List<",
            "+",
            "Lcom/clevertap/android/sdk/inbox/CTInboxMessage;",
            ">;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    iput-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->$messages:Ljava/util/List;

    iput-object p3, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->$userId:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;

    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->$messages:Ljava/util/List;

    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->$userId:Ljava/lang/String;

    invoke-direct {p1, v0, v1, p0, p2}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;-><init>(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/drb;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    if-ne v1, v2, :cond_0

    .line 11
    .line 12
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 17
    .line 18
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->$messages:Ljava/util/List;

    .line 29
    .line 30
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->$userId:Ljava/lang/String;

    .line 31
    .line 32
    iput v2, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$syncDelete$1;->label:I

    .line 33
    .line 34
    invoke-static {p1, v1, v3, p0}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->d(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    if-ne p0, v0, :cond_2

    .line 39
    .line 40
    return-object v0

    .line 41
    :cond_2
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 42
    .line 43
    return-object p0
.end method
