.class final Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/network/ContentFetchManager;->h(Lorg/json/JSONArray;Ljava/lang/String;)V
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
    c = "com.clevertap.android.sdk.network.ContentFetchManager$handleContentFetch$1"
    f = "ContentFetchManager.kt"
    l = {
        0x37
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $contentFetchItems:Lorg/json/JSONArray;

.field final synthetic $packageName:Ljava/lang/String;

.field label:I

.field final synthetic this$0:Lcom/clevertap/android/sdk/network/ContentFetchManager;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/network/ContentFetchManager;Lorg/json/JSONArray;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/network/ContentFetchManager;",
            "Lorg/json/JSONArray;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->this$0:Lcom/clevertap/android/sdk/network/ContentFetchManager;

    iput-object p2, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->$contentFetchItems:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->$packageName:Ljava/lang/String;

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

    new-instance p1, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;

    iget-object v0, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->this$0:Lcom/clevertap/android/sdk/network/ContentFetchManager;

    iget-object v1, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->$contentFetchItems:Lorg/json/JSONArray;

    iget-object p0, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->$packageName:Ljava/lang/String;

    invoke-direct {p1, v0, v1, p0, p2}, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;-><init>(Lcom/clevertap/android/sdk/network/ContentFetchManager;Lorg/json/JSONArray;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x1

    .line 8
    const-string v3, "ContentFetch"

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    goto :goto_1

    .line 18
    :catch_0
    move-exception p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 21
    .line 22
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0

    .line 27
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    :try_start_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->this$0:Lcom/clevertap/android/sdk/network/ContentFetchManager;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->$contentFetchItems:Lorg/json/JSONArray;

    .line 33
    .line 34
    iget-object v4, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->$packageName:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1, v1, v4}, Lcom/clevertap/android/sdk/network/ContentFetchManager;->a(Lcom/clevertap/android/sdk/network/ContentFetchManager;Lorg/json/JSONArray;Ljava/lang/String;)Lorg/json/JSONArray;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    .line 41
    .line 42
    .line 43
    move-result v1
    :try_end_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 44
    iget-object v4, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->this$0:Lcom/clevertap/android/sdk/network/ContentFetchManager;

    .line 45
    .line 46
    if-lez v1, :cond_2

    .line 47
    .line 48
    :try_start_2
    iput v2, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->label:I

    .line 49
    .line 50
    invoke-static {v4, p1, p0}, Lcom/clevertap/android/sdk/network/ContentFetchManager;->c(Lcom/clevertap/android/sdk/network/ContentFetchManager;Lorg/json/JSONArray;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    if-ne p0, v0, :cond_3

    .line 55
    .line 56
    return-object v0

    .line 57
    :cond_2
    invoke-static {v4}, Lcom/clevertap/android/sdk/network/ContentFetchManager;->b(Lcom/clevertap/android/sdk/network/ContentFetchManager;)Lcom/clevertap/android/sdk/Logger;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "No valid content fetch items to send."

    .line 62
    .line 63
    invoke-virtual {p1, v3, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_2
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :goto_0
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->this$0:Lcom/clevertap/android/sdk/network/ContentFetchManager;

    .line 70
    .line 71
    invoke-static {p0}, Lcom/clevertap/android/sdk/network/ContentFetchManager;->b(Lcom/clevertap/android/sdk/network/ContentFetchManager;)Lcom/clevertap/android/sdk/Logger;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string v0, "Unexpected error during content fetch"

    .line 76
    .line 77
    invoke-virtual {p0, v3, v0, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :catch_1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/ContentFetchManager$handleContentFetch$1;->this$0:Lcom/clevertap/android/sdk/network/ContentFetchManager;

    .line 82
    .line 83
    invoke-static {p0}, Lcom/clevertap/android/sdk/network/ContentFetchManager;->b(Lcom/clevertap/android/sdk/network/ContentFetchManager;)Lcom/clevertap/android/sdk/Logger;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    const-string p1, "Fetch job was cancelled."

    .line 88
    .line 89
    invoke-virtual {p0, v3, p1}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_3
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 93
    .line 94
    return-object p0
.end method
