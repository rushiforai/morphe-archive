.class final Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
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
    c = "com.clevertap.android.sdk.inapp.delay.InAppTimerManager$1$1"
    f = "InAppTimerManager.kt"
    l = {
        0x39,
        0x3c
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 1
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

    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;

    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    invoke-direct {v0, p0, p2}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;-><init>(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->label:I

    .line 6
    .line 7
    const/16 v2, 0x7d

    .line 8
    .line 9
    const-string v3, ", "

    .line 10
    .line 11
    const/4 v4, 0x2

    .line 12
    const/4 v5, 0x1

    .line 13
    const/4 v6, 0x0

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    if-eq v1, v5, :cond_1

    .line 17
    .line 18
    if-ne v1, v4, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->L$0:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Ll/drb;

    .line 23
    .line 24
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    goto/16 :goto_4

    .line 28
    .line 29
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object v6

    .line 35
    :cond_1
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->L$0:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v1, Ll/drb;

    .line 38
    .line 39
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 40
    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->L$0:Ljava/lang/Object;

    .line 47
    .line 48
    move-object v1, p1

    .line 49
    check-cast v1, Ll/drb;

    .line 50
    .line 51
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 52
    .line 53
    new-instance v7, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    const-string v8, "process lifeCycleOwner: started, "

    .line 56
    .line 57
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-interface {v1}, Ll/drb;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-interface {v1}, Ll/drb;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    .line 71
    .line 72
    .line 73
    move-result-object v8

    .line 74
    sget-object v9, Lkotlinx/coroutines/o;->e0:Lkotlinx/coroutines/o$b;

    .line 75
    .line 76
    invoke-interface {v8, v9}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    check-cast v8, Lkotlinx/coroutines/o;

    .line 81
    .line 82
    if-eqz v8, :cond_3

    .line 83
    .line 84
    invoke-interface {v8}, Lkotlinx/coroutines/o;->getParent()Lkotlinx/coroutines/o;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    goto :goto_0

    .line 89
    :cond_3
    move-object v8, v6

    .line 90
    :goto_0
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v7

    .line 100
    invoke-static {p1, v7}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->i(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :try_start_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->p()V

    .line 106
    .line 107
    .line 108
    iput-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->L$0:Ljava/lang/Object;

    .line 109
    .line 110
    iput v5, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->label:I

    .line 111
    .line 112
    invoke-static {p0}, Lkotlinx/coroutines/DelayKt;->a(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    if-ne p1, v0, :cond_4

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_4
    :goto_1
    new-instance p1, Lkotlin/KotlinNothingValueException;

    .line 120
    .line 121
    invoke-direct {p1}, Lkotlin/KotlinNothingValueException;-><init>()V

    .line 122
    .line 123
    .line 124
    throw p1
    :try_end_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1 .. :try_end_1} :catch_0

    .line 125
    :catch_0
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 126
    .line 127
    new-instance v5, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    const-string v7, "process lifeCycleOwner: Stopped, "

    .line 130
    .line 131
    invoke-direct {v5, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    invoke-interface {v1}, Ll/drb;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    .line 135
    .line 136
    .line 137
    move-result-object v7

    .line 138
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-interface {v1}, Ll/drb;->getCoroutineContext()Lkotlin/coroutines/CoroutineContext;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    sget-object v7, Lkotlinx/coroutines/o;->e0:Lkotlinx/coroutines/o$b;

    .line 149
    .line 150
    invoke-interface {v3, v7}, Lkotlin/coroutines/CoroutineContext;->get(Lkotlin/coroutines/CoroutineContext$Key;)Lkotlin/coroutines/CoroutineContext$Element;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    check-cast v3, Lkotlinx/coroutines/o;

    .line 155
    .line 156
    if-eqz v3, :cond_5

    .line 157
    .line 158
    invoke-interface {v3}, Lkotlinx/coroutines/o;->getParent()Lkotlinx/coroutines/o;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    goto :goto_2

    .line 163
    :cond_5
    move-object v3, v6

    .line 164
    :goto_2
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    invoke-static {p1, v2}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->i(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    sget-object p1, Lkotlinx/coroutines/p;->INSTANCE:Lkotlinx/coroutines/p;

    .line 178
    .line 179
    new-instance v2, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1$1;

    .line 180
    .line 181
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 182
    .line 183
    invoke-direct {v2, v3, v6}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1$1;-><init>(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;Lkotlin/coroutines/Continuation;)V

    .line 184
    .line 185
    .line 186
    iput-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->L$0:Ljava/lang/Object;

    .line 187
    .line 188
    iput v4, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$1$1;->label:I

    .line 189
    .line 190
    invoke-static {p1, v2, p0}, Ll/vh3;->g(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    if-ne p0, v0, :cond_6

    .line 195
    .line 196
    :goto_3
    return-object v0

    .line 197
    :cond_6
    move-object p0, v1

    .line 198
    :goto_4
    invoke-static {p0}, Lkotlinx/coroutines/f;->f(Ll/drb;)V

    .line 199
    .line 200
    .line 201
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 202
    .line 203
    return-object p0
.end method
