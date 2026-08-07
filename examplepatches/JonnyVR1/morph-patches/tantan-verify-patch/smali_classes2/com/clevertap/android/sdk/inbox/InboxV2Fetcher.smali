.class public final Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;
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
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0008\u0006\u0008\u0001\u0018\u00002\u00020\u0001B-\u0012\u000c\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u0002\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\u0008\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\u000e\u001a\u00020\rH\u0000\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u001e\u0010\u0013\u001a\u0008\u0012\u0004\u0012\u00020\r0\u00122\u0006\u0010\u0011\u001a\u00020\u0010H\u0086@\u00a2\u0006\u0004\u0008\u0013\u0010\u0014R\u001a\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00030\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0015R\u0014\u0010\u0006\u001a\u00020\u00058\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u0008\u001a\u00020\u00078\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u000e\u0010\u0018R\u0014\u0010\n\u001a\u00020\t8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0019\u0010\u001aR\u0016\u0010\u001e\u001a\u00020\u001b8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010\u001dR\u0014\u0010 \u001a\u00020\u001b8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0016\u0010\u001f\u00a8\u0006!"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;",
        "",
        "Ll/q1f;",
        "Lorg/json/JSONObject;",
        "endpoint",
        "Ll/whi;",
        "throttle",
        "Ll/ftm;",
        "inboxV2Response",
        "Ll/axl;",
        "logger",
        "<init>",
        "(Ll/q1f;Ll/whi;Ll/ftm;Ll/axl;)V",
        "",
        "c",
        "()V",
        "Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;",
        "trigger",
        "Lcom/clevertap/android/sdk/network/fetch/a;",
        "a",
        "(Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "Ll/q1f;",
        "b",
        "Ll/whi;",
        "Ll/ftm;",
        "d",
        "Ll/axl;",
        "",
        "e",
        "Z",
        "disabledForSession",
        "()Z",
        "isDisabledForSession",
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
.field private final a:Ll/q1f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/q1f<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/whi;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Ll/ftm;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final d:Ll/axl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private volatile e:Z


# direct methods
.method public constructor <init>(Ll/q1f;Ll/whi;Ll/ftm;Ll/axl;)V
    .locals 0
    .param p1    # Ll/q1f;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/whi;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/ftm;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/q1f<",
            "Lorg/json/JSONObject;",
            ">;",
            "Ll/whi;",
            "Ll/ftm;",
            "Ll/axl;",
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->a:Ll/q1f;

    .line 17
    .line 18
    iput-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->b:Ll/whi;

    .line 19
    .line 20
    iput-object p3, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->c:Ll/ftm;

    .line 21
    .line 22
    iput-object p4, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->d:Ll/axl;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a(Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 7
    .param p1    # Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/clevertap/android/sdk/network/fetch/a<",
            "Lkotlin/Unit;",
            ">;>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    instance-of v0, p2, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;

    .line 7
    .line 8
    iget v1, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->label:I

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
    iput v1, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->label:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;

    .line 21
    .line 22
    invoke-direct {v0, p0, p2}, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;-><init>(Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;Lkotlin/coroutines/Continuation;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p2, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->result:Ljava/lang/Object;

    .line 26
    .line 27
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget v2, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->label:I

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x1

    .line 35
    const-string v5, "InboxV2"

    .line 36
    .line 37
    if-eqz v2, :cond_2

    .line 38
    .line 39
    if-ne v2, v4, :cond_1

    .line 40
    .line 41
    iget-object p0, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->L$1:Ljava/lang/Object;

    .line 42
    .line 43
    move-object p1, p0

    .line 44
    check-cast p1, Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;

    .line 45
    .line 46
    iget-object p0, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->L$0:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;

    .line 49
    .line 50
    invoke-static {p2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 55
    .line 56
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    return-object v3

    .line 60
    :cond_2
    invoke-static {p2}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    iget-boolean p2, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->e:Z

    .line 64
    .line 65
    if-eqz p2, :cond_3

    .line 66
    .line 67
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->d:Ll/axl;

    .line 68
    .line 69
    const-string p1, "disabled for session \u2014 skipping"

    .line 70
    .line 71
    invoke-interface {p0, v5, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    sget-object p0, Lcom/clevertap/android/sdk/network/fetch/a$a;->INSTANCE:Lcom/clevertap/android/sdk/network/fetch/a$a;

    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_3
    sget-object p2, Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;->USER_INITIATED:Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;

    .line 78
    .line 79
    if-ne p1, p2, :cond_4

    .line 80
    .line 81
    iget-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->b:Ll/whi;

    .line 82
    .line 83
    invoke-virtual {p2}, Ll/whi;->c()Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    if-eqz p2, :cond_4

    .line 88
    .line 89
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->d:Ll/axl;

    .line 90
    .line 91
    const-string p1, "throttled"

    .line 92
    .line 93
    invoke-interface {p0, v5, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    sget-object p0, Lcom/clevertap/android/sdk/network/fetch/a$d;->INSTANCE:Lcom/clevertap/android/sdk/network/fetch/a$d;

    .line 97
    .line 98
    return-object p0

    .line 99
    :cond_4
    iget-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->d:Ll/axl;

    .line 100
    .line 101
    new-instance v2, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v6, "starting fetch (trigger="

    .line 104
    .line 105
    invoke-direct {v2, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    const/16 v6, 0x29

    .line 112
    .line 113
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    invoke-interface {p2, v5, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->a:Ll/q1f;

    .line 124
    .line 125
    iput-object p0, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->L$0:Ljava/lang/Object;

    .line 126
    .line 127
    iput-object p1, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->L$1:Ljava/lang/Object;

    .line 128
    .line 129
    iput v4, v0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher$fetch$1;->label:I

    .line 130
    .line 131
    invoke-interface {p2, v0}, Ll/q1f;->a(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object p2

    .line 135
    if-ne p2, v1, :cond_5

    .line 136
    .line 137
    return-object v1

    .line 138
    :cond_5
    :goto_1
    check-cast p2, Lcom/clevertap/android/sdk/network/fetch/a;

    .line 139
    .line 140
    sget-object v0, Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;->USER_INITIATED:Lcom/clevertap/android/sdk/network/fetch/FetchTrigger;

    .line 141
    .line 142
    if-ne p1, v0, :cond_6

    .line 143
    .line 144
    instance-of p1, p2, Lcom/clevertap/android/sdk/network/fetch/a$c;

    .line 145
    .line 146
    if-eqz p1, :cond_6

    .line 147
    .line 148
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->b:Ll/whi;

    .line 149
    .line 150
    invoke-virtual {p1}, Ll/whi;->a()V

    .line 151
    .line 152
    .line 153
    :cond_6
    instance-of p1, p2, Lcom/clevertap/android/sdk/network/fetch/a$c;

    .line 154
    .line 155
    if-eqz p1, :cond_7

    .line 156
    .line 157
    iget-object p1, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->c:Ll/ftm;

    .line 158
    .line 159
    check-cast p2, Lcom/clevertap/android/sdk/network/fetch/a$c;

    .line 160
    .line 161
    invoke-virtual {p2}, Lcom/clevertap/android/sdk/network/fetch/a$c;->a()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    check-cast p2, Lorg/json/JSONObject;

    .line 166
    .line 167
    invoke-virtual {p1, p2}, Ll/ftm;->d(Lorg/json/JSONObject;)V

    .line 168
    .line 169
    .line 170
    new-instance p2, Lcom/clevertap/android/sdk/network/fetch/a$c;

    .line 171
    .line 172
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 173
    .line 174
    invoke-direct {p2, p1}, Lcom/clevertap/android/sdk/network/fetch/a$c;-><init>(Ljava/lang/Object;)V

    .line 175
    .line 176
    .line 177
    goto :goto_3

    .line 178
    :cond_7
    sget-object p1, Lcom/clevertap/android/sdk/network/fetch/a$a;->INSTANCE:Lcom/clevertap/android/sdk/network/fetch/a$a;

    .line 179
    .line 180
    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_8

    .line 185
    .line 186
    iput-boolean v4, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->e:Z

    .line 187
    .line 188
    iget-object p2, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->d:Ll/axl;

    .line 189
    .line 190
    const-string v0, "session disabled \u2014 subsequent calls will short-circuit"

    .line 191
    .line 192
    invoke-interface {p2, v5, v0}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    :goto_2
    move-object p2, p1

    .line 196
    goto :goto_3

    .line 197
    :cond_8
    instance-of p1, p2, Lcom/clevertap/android/sdk/network/fetch/a$b;

    .line 198
    .line 199
    if-eqz p1, :cond_9

    .line 200
    .line 201
    goto :goto_3

    .line 202
    :cond_9
    sget-object p1, Lcom/clevertap/android/sdk/network/fetch/a$d;->INSTANCE:Lcom/clevertap/android/sdk/network/fetch/a$d;

    .line 203
    .line 204
    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p2

    .line 208
    if-eqz p2, :cond_a

    .line 209
    .line 210
    goto :goto_2

    .line 211
    :goto_3
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->d:Ll/axl;

    .line 212
    .line 213
    new-instance p1, Ljava/lang/StringBuilder;

    .line 214
    .line 215
    const-string v0, "fetch finished \u2014 "

    .line 216
    .line 217
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    invoke-static {v0}, Lkotlin/jvm/internal/Reflection;->b(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-interface {v0}, Lkotlin/reflect/KClass;->s()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-interface {p0, v5, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    return-object p2

    .line 243
    :cond_a
    invoke-static {}, Ll/nbr;->a()V

    .line 244
    .line 245
    .line 246
    return-object v3
.end method

.method public final b()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->e:Z

    .line 2
    .line 3
    return p0
.end method

.method public final c()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/inbox/InboxV2Fetcher;->b:Ll/whi;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/whi;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
