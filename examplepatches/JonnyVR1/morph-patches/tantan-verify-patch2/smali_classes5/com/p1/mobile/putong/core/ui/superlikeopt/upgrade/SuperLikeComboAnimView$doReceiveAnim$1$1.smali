.class final Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;
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
        0x2,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.p1.mobile.putong.core.ui.superlikeopt.upgrade.SuperLikeComboAnimView$doReceiveAnim$1$1"
    f = "SuperLikeComboAnimView.kt"
    l = {
        0xc6
    }
    m = "invokeSuspend"
    v = 0x1
.end annotation


# instance fields
.field final synthetic $isFemale:Z

.field final synthetic $received:I

.field I$0:I

.field label:I

.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;


# direct methods
.method public constructor <init>(IZLcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;Lkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ",
            "Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;",
            ">;)V"
        }
    .end annotation

    iput p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->$received:I

    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->$isFemale:Z

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

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

    new-instance p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;

    iget v0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->$received:I

    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->$isFemale:Z

    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    invoke-direct {p1, v0, v1, p0, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;-><init>(IZLcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;Lkotlin/coroutines/Continuation;)V

    return-object p1
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->label:I

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
    new-instance p1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->$received:I

    .line 29
    .line 30
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->$isFemale:Z

    .line 31
    .line 32
    const/16 v4, 0x11

    .line 33
    .line 34
    const/4 v5, 0x0

    .line 35
    invoke-direct {p1, v1, v3, v4, v5}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$1;-><init>(IZILkotlin/coroutines/Continuation;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1}, Ll/fui;->w(Lkotlin/jvm/functions/Function2;)Ll/aui;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    new-instance v1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$2;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 45
    .line 46
    invoke-direct {v1, v3, v5}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$2;-><init>(Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;Lkotlin/coroutines/Continuation;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, v1}, Ll/fui;->E(Ll/aui;Lkotlin/jvm/functions/Function2;)Ll/aui;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    new-instance v1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$3;

    .line 54
    .line 55
    invoke-direct {v1, v5}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$3;-><init>(Lkotlin/coroutines/Continuation;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p1, v1}, Ll/fui;->f(Ll/aui;Lkotlin/jvm/functions/Function3;)Ll/aui;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$a;->INSTANCE:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1$a;

    .line 63
    .line 64
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->I$0:I

    .line 65
    .line 66
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$doReceiveAnim$1$1;->label:I

    .line 67
    .line 68
    invoke-interface {p1, v1, p0}, Ll/aui;->collect(Ll/bui;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    if-ne p0, v0, :cond_2

    .line 73
    .line 74
    return-object v0

    .line 75
    :cond_2
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 76
    .line 77
    return-object p0
.end method
