.class final Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->q(Ljava/lang/String;JLkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/o;
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
    c = "com.clevertap.android.sdk.inapp.delay.InAppTimerManager$scheduleTimer$1$3"
    f = "InAppTimerManager.kt"
    l = {
        0x5d
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $callback:Lkotlin/jvm/functions/Function1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function1<",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d;",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic $delayInMs:J

.field final synthetic $id:Ljava/lang/String;

.field J$0:J

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;JLkotlin/jvm/functions/Function1;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;",
            "J",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d;",
            "Lkotlin/Unit;",
            ">;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    iput-wide p2, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$delayInMs:J

    iput-object p4, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$callback:Lkotlin/jvm/functions/Function1;

    iput-object p5, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p6}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 7
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

    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;

    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    iget-wide v2, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$delayInMs:J

    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$callback:Lkotlin/jvm/functions/Function1;

    iget-object v5, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    move-object v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;-><init>(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;JLkotlin/jvm/functions/Function1;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->label:I

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
    iget-wide v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->J$0:J

    .line 13
    .line 14
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->L$0:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v2, Ll/drb;

    .line 17
    .line 18
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    move-object p1, v0

    .line 24
    goto/16 :goto_5

    .line 25
    .line 26
    :catch_0
    move-exception v0

    .line 27
    move-object p1, v0

    .line 28
    goto :goto_2

    .line 29
    :catch_1
    move-wide v3, v0

    .line 30
    move-object p1, v2

    .line 31
    goto/16 :goto_3

    .line 32
    .line 33
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 34
    .line 35
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x0

    .line 39
    return-object p0

    .line 40
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->L$0:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast p1, Ll/drb;

    .line 46
    .line 47
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->e(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ll/oa5;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-interface {v1}, Ll/oa5;->currentTimeMillis()J

    .line 54
    .line 55
    .line 56
    move-result-wide v3

    .line 57
    :try_start_1
    iget-wide v5, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$delayInMs:J

    .line 58
    .line 59
    iput-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->L$0:Ljava/lang/Object;

    .line 60
    .line 61
    iput-wide v3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->J$0:J

    .line 62
    .line 63
    iput v2, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->label:I

    .line 64
    .line 65
    invoke-static {v5, v6, p0}, Lkotlinx/coroutines/DelayKt;->b(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v1
    :try_end_1
    .catch Ljava/util/concurrent/CancellationException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    if-ne v1, v0, :cond_2

    .line 70
    .line 71
    return-object v0

    .line 72
    :cond_2
    move-object v2, p1

    .line 73
    move-wide v0, v3

    .line 74
    :goto_0
    :try_start_2
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$callback:Lkotlin/jvm/functions/Function1;

    .line 75
    .line 76
    new-instance v3, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$a;

    .line 77
    .line 78
    iget-object v4, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 79
    .line 80
    invoke-direct {v3, v4, v0, v1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$a;-><init>(Ljava/lang/String;J)V

    .line 81
    .line 82
    .line 83
    invoke-interface {p1, v3}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 87
    .line 88
    invoke-static {p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->d(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 93
    .line 94
    invoke-virtual {p1, v3}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/util/concurrent/CancellationException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    .line 96
    .line 97
    :goto_1
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 98
    .line 99
    invoke-static {p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->c(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {p1, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    goto/16 :goto_4

    .line 109
    .line 110
    :goto_2
    :try_start_3
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 111
    .line 112
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->g(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ll/axl;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 117
    .line 118
    invoke-static {v1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->b(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    new-instance v2, Ljava/lang/StringBuilder;

    .line 123
    .line 124
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 125
    .line 126
    .line 127
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 128
    .line 129
    invoke-static {v3}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->h(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    const-string v3, " Error in timer with id: "

    .line 137
    .line 138
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    iget-object v3, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-interface {v0, v1, v2, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 151
    .line 152
    .line 153
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$callback:Lkotlin/jvm/functions/Function1;

    .line 154
    .line 155
    new-instance v1, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$c;

    .line 156
    .line 157
    iget-object v2, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 158
    .line 159
    invoke-direct {v1, v2, p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$d$c;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 160
    .line 161
    .line 162
    invoke-interface {v0, v1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    iget-object p1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 166
    .line 167
    invoke-static {p1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->d(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 172
    .line 173
    invoke-virtual {p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    goto :goto_1

    .line 177
    :catch_2
    :goto_3
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 178
    .line 179
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->g(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ll/axl;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iget-object v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 184
    .line 185
    invoke-static {v1}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->b(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    new-instance v2, Ljava/lang/StringBuilder;

    .line 190
    .line 191
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 192
    .line 193
    .line 194
    iget-object v5, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 195
    .line 196
    invoke-static {v5}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->h(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v5

    .line 200
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    const-string v5, " Cancelled timer with id: "

    .line 204
    .line 205
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    iget-object v5, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    invoke-interface {v0, v1, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 221
    .line 222
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->d(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 223
    .line 224
    .line 225
    move-result-object v6

    .line 226
    iget-object v7, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 227
    .line 228
    new-instance v0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$a;

    .line 229
    .line 230
    iget-wide v1, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$delayInMs:J

    .line 231
    .line 232
    iget-object v5, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$callback:Lkotlin/jvm/functions/Function1;

    .line 233
    .line 234
    invoke-direct/range {v0 .. v5}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$a;-><init>(JJLkotlin/jvm/functions/Function1;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v6, v7, v0}, Ljava/util/concurrent/ConcurrentHashMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    invoke-static {p1}, Lkotlinx/coroutines/f;->f(Ll/drb;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 241
    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :goto_4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 246
    .line 247
    return-object p0

    .line 248
    :goto_5
    iget-object v0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->this$0:Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;

    .line 249
    .line 250
    invoke-static {v0}, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;->c(Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager;)Ljava/util/concurrent/ConcurrentHashMap;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    iget-object p0, p0, Lcom/clevertap/android/sdk/inapp/delay/InAppTimerManager$scheduleTimer$1$3;->$id:Ljava/lang/String;

    .line 255
    .line 256
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 257
    .line 258
    .line 259
    throw p1
.end method
