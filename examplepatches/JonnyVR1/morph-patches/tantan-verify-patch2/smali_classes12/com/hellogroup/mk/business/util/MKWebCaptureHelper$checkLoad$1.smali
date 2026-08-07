.class final Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->g(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
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
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0010\u0004\u001a\u00020\u0001*\u00020\u0000H\u008a@\u00a2\u0006\u0004\u0008\u0002\u0010\u0003"
    }
    d2 = {
        "Ll/drb;",
        "",
        "invoke",
        "(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;",
        "<anonymous>"
    }
    k = 0x3
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.hellogroup.mk.business.util.MKWebCaptureHelper$checkLoad$1"
    f = "MKWebCaptureHelper.kt"
    l = {
        0x11f
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $cacheWeb:Ljava/lang/ref/WeakReference;

.field final synthetic $mkWebView:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field final synthetic $url:Ljava/lang/String;

.field L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field L$4:Ljava/lang/Object;

.field L$5:Ljava/lang/Object;

.field L$6:Ljava/lang/Object;

.field L$7:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;Ljava/lang/String;Ljava/lang/ref/WeakReference;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    iput-object p2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$cacheWeb:Ljava/lang/ref/WeakReference;

    iput-object p4, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$mkWebView:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 6
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Lkotlin/coroutines/Continuation;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
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

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;

    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->this$0:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;

    iget-object v2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$url:Ljava/lang/String;

    iget-object v3, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$cacheWeb:Ljava/lang/ref/WeakReference;

    iget-object v4, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$mkWebView:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;-><init>(Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;Ljava/lang/String;Ljava/lang/ref/WeakReference;Lcom/hellogroup/mk/business/base/ui/MKWebView;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 13
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const-string v0, "\u52a0\u8f7d\u5b8c\u6210checkLoad="

    .line 2
    .line 3
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    iget v2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->label:I

    .line 8
    .line 9
    const/4 v3, 0x0

    .line 10
    const-string v4, "MKWebCaptureHelper"

    .line 11
    .line 12
    const/4 v5, 0x1

    .line 13
    if-eqz v2, :cond_1

    .line 14
    .line 15
    if-ne v2, v5, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$7:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v1, Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$6:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v1, Ll/ndj;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$5:Ljava/lang/Object;

    .line 26
    .line 27
    check-cast v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$4:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast v1, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 32
    .line 33
    iget-object v1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$3:Ljava/lang/Object;

    .line 34
    .line 35
    check-cast v1, Ljava/io/File;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$2:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast v2, Ljava/lang/String;

    .line 40
    .line 41
    iget-object v2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$1:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v2, Landroid/net/Uri;

    .line 44
    .line 45
    iget-object v2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$0:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v2, Ll/drb;

    .line 48
    .line 49
    :try_start_0
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 58
    .line 59
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object v3

    .line 63
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->p$:Ll/drb;

    .line 67
    .line 68
    :try_start_1
    iget-object v2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$url:Ljava/lang/String;

    .line 69
    .line 70
    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    const-string v6, "_capture"

    .line 75
    .line 76
    invoke-virtual {v2, v6}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    sget-object v7, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper;->Companion:Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;

    .line 81
    .line 82
    iget-object v8, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$url:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v7, v8, v6}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;->k(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    .line 85
    .line 86
    .line 87
    move-result-object v8

    .line 88
    if-eqz v8, :cond_4

    .line 89
    .line 90
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    .line 91
    .line 92
    .line 93
    move-result v9

    .line 94
    if-eqz v9, :cond_5

    .line 95
    .line 96
    invoke-static {v7, v8}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;->a(Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$Companion;Ljava/io/File;)Z

    .line 97
    .line 98
    .line 99
    move-result v7

    .line 100
    if-eqz v7, :cond_2

    .line 101
    .line 102
    invoke-virtual {v8}, Ljava/io/File;->delete()Z

    .line 103
    .line 104
    .line 105
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 109
    .line 110
    .line 111
    move-result-wide v9

    .line 112
    invoke-virtual {v8, v9, v10}, Ljava/io/File;->setLastModified(J)Z

    .line 113
    .line 114
    .line 115
    iget-object v7, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$cacheWeb:Ljava/lang/ref/WeakReference;

    .line 116
    .line 117
    invoke-virtual {v7}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    check-cast v7, Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 122
    .line 123
    if-eqz v7, :cond_5

    .line 124
    .line 125
    invoke-static {v7}, Lcom/bumptech/glide/a;->u(Landroid/view/View;)Ll/m2d0;

    .line 126
    .line 127
    .line 128
    move-result-object v9

    .line 129
    invoke-virtual {v9, v8}, Ll/m2d0;->r(Ljava/io/File;)Ll/a2d0;

    .line 130
    .line 131
    .line 132
    move-result-object v9

    .line 133
    sget-object v10, Ll/d4e;->b:Ll/d4e;

    .line 134
    .line 135
    invoke-virtual {v9, v10}, Ll/lr2;->e(Ll/d4e;)Ll/lr2;

    .line 136
    .line 137
    .line 138
    move-result-object v9

    .line 139
    check-cast v9, Ll/a2d0;

    .line 140
    .line 141
    invoke-virtual {v9}, Ll/a2d0;->G0()Ll/ndj;

    .line 142
    .line 143
    .line 144
    move-result-object v9

    .line 145
    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    .line 147
    .line 148
    new-instance v10, Lkotlin/jvm/internal/Ref$ObjectRef;

    .line 149
    .line 150
    invoke-direct {v10}, Lkotlin/jvm/internal/Ref$ObjectRef;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-interface {v9}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v11

    .line 157
    check-cast v11, Landroid/graphics/drawable/Drawable;

    .line 158
    .line 159
    iput-object v11, v10, Lkotlin/jvm/internal/Ref$ObjectRef;->element:Ljava/lang/Object;

    .line 160
    .line 161
    sget-object v11, Lcom/hellogroup/common/thread/MMDispatchers;->INSTANCE:Lcom/hellogroup/common/thread/MMDispatchers;

    .line 162
    .line 163
    invoke-virtual {v11}, Lcom/hellogroup/common/thread/MMDispatchers;->a()Lkotlinx/coroutines/CoroutineDispatcher;

    .line 164
    .line 165
    .line 166
    move-result-object v11

    .line 167
    new-instance v12, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;

    .line 168
    .line 169
    invoke-direct {v12, v10, v3, p0, v8}, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1$invokeSuspend$$inlined$also$lambda$1;-><init>(Lkotlin/jvm/internal/Ref$ObjectRef;Lkotlin/coroutines/Continuation;Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;Ljava/io/File;)V

    .line 170
    .line 171
    .line 172
    iput-object p1, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$0:Ljava/lang/Object;

    .line 173
    .line 174
    iput-object v2, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$1:Ljava/lang/Object;

    .line 175
    .line 176
    iput-object v6, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$2:Ljava/lang/Object;

    .line 177
    .line 178
    iput-object v8, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$3:Ljava/lang/Object;

    .line 179
    .line 180
    iput-object v7, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$4:Ljava/lang/Object;

    .line 181
    .line 182
    iput-object v7, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$5:Ljava/lang/Object;

    .line 183
    .line 184
    iput-object v9, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$6:Ljava/lang/Object;

    .line 185
    .line 186
    iput-object v10, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->L$7:Ljava/lang/Object;

    .line 187
    .line 188
    iput v5, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->label:I

    .line 189
    .line 190
    invoke-static {v11, v12, p0}, Ll/vh3;->g(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    if-ne p1, v1, :cond_3

    .line 195
    .line 196
    return-object v1

    .line 197
    :cond_3
    move-object v1, v8

    .line 198
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Lcom/hellogroup/mk/business/util/MKWebCaptureHelper$checkLoad$1;->$url:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    const-string p0, "   \n\u4f7f\u7528\u6587\u4ef6:"

    .line 209
    .line 210
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-static {v4, p0}, Ll/jzv;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    goto :goto_2

    .line 228
    :cond_4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 229
    .line 230
    return-object p0

    .line 231
    :goto_1
    const-string p1, ""

    .line 232
    .line 233
    invoke-static {v4, p1, p0}, Ll/jzv;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 234
    .line 235
    .line 236
    :cond_5
    :goto_2
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 237
    .line 238
    return-object p0
.end method
