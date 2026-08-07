.class final Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->e(Ljava/lang/String;)V
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
    c = "com.clevertap.android.sdk.inbox.InboxDeleteCoordinator$retryPending$1"
    f = "InboxDeleteCoordinator.kt"
    l = {
        0x47
    }
    m = "invokeSuspend"
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field final synthetic $userId:Ljava/lang/String;

.field label:I

.field final synthetic this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;",
            "Ljava/lang/String;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    iput-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->$userId:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

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

    new-instance p1, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;

    iget-object v0, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->$userId:Ljava/lang/String;

    invoke-direct {p1, v0, p0, p2}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;-><init>(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->label:I

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
    goto/16 :goto_1

    .line 16
    .line 17
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 18
    .line 19
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 p0, 0x0

    .line 23
    return-object p0

    .line 24
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->b(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)Lkotlin/jvm/functions/Function0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ll/h1c;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->$userId:Ljava/lang/String;

    .line 40
    .line 41
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 42
    .line 43
    invoke-static {v3}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->a(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)Ll/oa5;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    invoke-interface {v3}, Ll/oa5;->c()J

    .line 48
    .line 49
    .line 50
    move-result-wide v3

    .line 51
    invoke-virtual {p1, v1, v3, v4}, Ll/h1c;->K(Ljava/lang/String;J)I

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->b(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)Lkotlin/jvm/functions/Function0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Ll/h1c;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->$userId:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Ll/h1c;->A(Ljava/lang/String;)Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_2
    iget-object v1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 82
    .line 83
    invoke-static {v1}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->c(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;)Ll/axl;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    new-instance v3, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    const-string v4, "retryPending: "

    .line 90
    .line 91
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v4

    .line 98
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v4, " pending delete row(s) for user"

    .line 102
    .line 103
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v3

    .line 110
    const-string v4, "InboxV2"

    .line 111
    .line 112
    invoke-interface {v1, v4, v3}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    check-cast p1, Ljava/lang/Iterable;

    .line 116
    .line 117
    new-instance v1, Ljava/util/ArrayList;

    .line 118
    .line 119
    const/16 v3, 0xa

    .line 120
    .line 121
    invoke-static {p1, v3}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 126
    .line 127
    .line 128
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-eqz v3, :cond_4

    .line 137
    .line 138
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    check-cast v3, Ll/tq60;

    .line 143
    .line 144
    new-instance v4, Lorg/json/JSONObject;

    .line 145
    .line 146
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 147
    .line 148
    .line 149
    const-string v5, "id"

    .line 150
    .line 151
    invoke-virtual {v3}, Ll/tq60;->a()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    invoke-virtual {v4, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    invoke-virtual {v3}, Ll/tq60;->b()Lorg/json/JSONObject;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    if-eqz v3, :cond_3

    .line 164
    .line 165
    const-string v5, "wzrkParams"

    .line 166
    .line 167
    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 168
    .line 169
    .line 170
    :cond_3
    new-instance v3, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;

    .line 171
    .line 172
    invoke-direct {v3, v4}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;-><init>(Lorg/json/JSONObject;)V

    .line 173
    .line 174
    .line 175
    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    goto :goto_0

    .line 179
    :cond_4
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->this$0:Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;

    .line 180
    .line 181
    iget-object v3, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->$userId:Ljava/lang/String;

    .line 182
    .line 183
    iput v2, p0, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator$retryPending$1;->label:I

    .line 184
    .line 185
    invoke-static {p1, v1, v3, p0}, Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;->d(Lcom/clevertap/android/sdk/inbox/InboxDeleteCoordinator;Ljava/util/List;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    if-ne p0, v0, :cond_5

    .line 190
    .line 191
    return-object v0

    .line 192
    :cond_5
    :goto_1
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 193
    .line 194
    return-object p0
.end method
