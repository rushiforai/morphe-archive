.class final Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/InAppController;->x()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

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
    c = "com.clevertap.android.sdk.inapp.InAppController$cancelAllScheduledInApps$1"
    f = "InAppController.kt"
    l = {
        0x459,
        0x45b
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field label:I

.field final synthetic this$0:Lcom/clevertap/android/sdk/inapp/InAppController;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inapp/InAppController;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->this$0:Lcom/clevertap/android/sdk/inapp/InAppController;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 0
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

    new-instance p1, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;

    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->this$0:Lcom/clevertap/android/sdk/inapp/InAppController;

    invoke-direct {p1, p0, p2}, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;-><init>(Lcom/clevertap/android/sdk/inapp/InAppController;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x2

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    if-eq v1, v3, :cond_1

    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    goto :goto_2

    .line 19
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 20
    .line 21
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return-object p0

    .line 26
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->this$0:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->p(Lcom/clevertap/android/sdk/inapp/InAppController;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput v3, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->label:I

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    if-ne p1, v0, :cond_3

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->this$0:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->r(Lcom/clevertap/android/sdk/inapp/InAppController;)Lcom/clevertap/android/sdk/Logger;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->this$0:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 55
    .line 56
    invoke-static {v1}, Lcom/clevertap/android/sdk/inapp/InAppController;->o(Lcom/clevertap/android/sdk/inapp/InAppController;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const-string v3, "[InAppController]: Cancelled all delayed in-apps"

    .line 61
    .line 62
    invoke-virtual {p1, v1, v3}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->this$0:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 66
    .line 67
    invoke-static {p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->q(Lcom/clevertap/android/sdk/inapp/InAppController;)Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->label:I

    .line 72
    .line 73
    invoke-virtual {p1, p0}, Lcom/clevertap/android/sdk/inapp/delay/InAppScheduler;->b(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    if-ne p1, v0, :cond_4

    .line 78
    .line 79
    :goto_1
    return-object v0

    .line 80
    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->this$0:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/clevertap/android/sdk/inapp/InAppController;->r(Lcom/clevertap/android/sdk/inapp/InAppController;)Lcom/clevertap/android/sdk/Logger;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/InAppController$cancelAllScheduledInApps$1;->this$0:Lcom/clevertap/android/sdk/inapp/InAppController;

    .line 87
    .line 88
    invoke-static {p0}, Lcom/clevertap/android/sdk/inapp/InAppController;->o(Lcom/clevertap/android/sdk/inapp/InAppController;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    const-string v0, "[InAppController]: Cancelled all in-action in-apps"

    .line 93
    .line 94
    invoke-virtual {p1, p0, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 98
    .line 99
    return-object p0
.end method
