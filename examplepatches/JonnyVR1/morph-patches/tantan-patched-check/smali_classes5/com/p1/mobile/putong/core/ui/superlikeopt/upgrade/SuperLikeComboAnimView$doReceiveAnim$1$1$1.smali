.class final Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/SuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Ll/bui<",
        "-",
        "Ljava/lang/Integer;",
        ">;",
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
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0008\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0010\u0003\u001a\u00020\u0002*\u0008\u0012\u0004\u0012\u00020\u00010\u0000H\n\u00a2\u0006\u0004\u0008\u0003\u0010\u0004"
    }
    d2 = {
        "Ll/bui;",
        "",
        "",
        "<anonymous>",
        "(Ll/bui;)V"
    }
    k = 0x3
    mv = {
        0x2,
        0x2,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.p1.mobile.putong.core.ui.superlikeopt.upgrade.SuperLikeComboAnimView$doReceiveAnim$1$1$1"
    f = "SuperLikeComboAnimView.kt"
    l = {
        0xc0,
        0xc1
    }
    m = "invokeSuspend"
    v = 0x1
.end annotation


# instance fields
.field final synthetic $frameDuration:I

.field final synthetic $isFemale:Z

.field final synthetic $received:I

.field I$0:I

.field I$1:I

.field I$2:I

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field label:I


# direct methods
.method public constructor <init>(IZILkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZI",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;",
            ">;)V"
        }
    .end annotation

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$received:I

    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$isFemale:Z

    iput p3, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$frameDuration:I

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
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

    new-instance v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;

    iget v1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$received:I

    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$isFemale:Z

    iget p0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$frameDuration:I

    invoke-direct {v0, v1, v2, p0, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;-><init>(IZILkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/bui;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->invoke(Ll/bui;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Ll/bui;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bui<",
            "-",
            "Ljava/lang/Integer;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->L$0:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ll/bui;

    .line 4
    .line 5
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->label:I

    .line 10
    .line 11
    const/4 v3, 0x2

    .line 12
    const/4 v4, 0x1

    .line 13
    if-eqz v2, :cond_2

    .line 14
    .line 15
    if-eq v2, v4, :cond_1

    .line 16
    .line 17
    if-ne v2, v3, :cond_0

    .line 18
    .line 19
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$1:I

    .line 20
    .line 21
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$0:I

    .line 22
    .line 23
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->L$1:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v6, [I

    .line 26
    .line 27
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    move-object p1, v6

    .line 31
    goto/16 :goto_4

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
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$2:I

    .line 41
    .line 42
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$1:I

    .line 43
    .line 44
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$0:I

    .line 45
    .line 46
    iget-object v7, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->L$1:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v7, [I

    .line 49
    .line 50
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    move p1, v6

    .line 54
    move v6, v2

    .line 55
    move v2, v5

    .line 56
    move v5, p1

    .line 57
    move-object p1, v7

    .line 58
    goto :goto_2

    .line 59
    :cond_2
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$received:I

    .line 63
    .line 64
    const/4 v2, 0x3

    .line 65
    if-gt p1, v2, :cond_4

    .line 66
    .line 67
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$isFemale:Z

    .line 68
    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a;->Companion:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;->d()[I

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    goto :goto_0

    .line 78
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a;->Companion:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;->e()[I

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    goto :goto_0

    .line 85
    :cond_4
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$isFemale:Z

    .line 86
    .line 87
    const/4 v5, 0x6

    .line 88
    if-gt p1, v5, :cond_6

    .line 89
    .line 90
    if-eqz v2, :cond_5

    .line 91
    .line 92
    sget-object p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a;->Companion:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;->f()[I

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    goto :goto_0

    .line 99
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a;->Companion:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;->g()[I

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    goto :goto_0

    .line 106
    :cond_6
    if-eqz v2, :cond_7

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a;->Companion:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;->h()[I

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    goto :goto_0

    .line 115
    :cond_7
    sget-object p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a;->Companion:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/a$a;->i()[I

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    :goto_0
    array-length v2, p1

    .line 122
    const/4 v5, 0x0

    .line 123
    :goto_1
    if-ge v5, v2, :cond_a

    .line 124
    .line 125
    aget v6, p1, v5

    .line 126
    .line 127
    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/Boxing;->b(I)Ljava/lang/Integer;

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->L$0:Ljava/lang/Object;

    .line 132
    .line 133
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->L$1:Ljava/lang/Object;

    .line 134
    .line 135
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$0:I

    .line 136
    .line 137
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$1:I

    .line 138
    .line 139
    iput v6, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$2:I

    .line 140
    .line 141
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->label:I

    .line 142
    .line 143
    invoke-interface {v0, v7, p0}, Ll/bui;->emit(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    if-ne v7, v1, :cond_8

    .line 148
    .line 149
    goto :goto_3

    .line 150
    :cond_8
    :goto_2
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->$frameDuration:I

    .line 151
    .line 152
    int-to-long v7, v7

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->L$0:Ljava/lang/Object;

    .line 154
    .line 155
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->L$1:Ljava/lang/Object;

    .line 156
    .line 157
    iput v5, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$0:I

    .line 158
    .line 159
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$1:I

    .line 160
    .line 161
    iput v6, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->I$2:I

    .line 162
    .line 163
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;->label:I

    .line 164
    .line 165
    invoke-static {v7, v8, p0}, Lkotlinx/coroutines/DelayKt;->b(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v6

    .line 169
    if-ne v6, v1, :cond_9

    .line 170
    .line 171
    :goto_3
    return-object v1

    .line 172
    :cond_9
    :goto_4
    add-int/2addr v5, v4

    .line 173
    goto :goto_1

    .line 174
    :cond_a
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 175
    .line 176
    return-object p0
.end method
