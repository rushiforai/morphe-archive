.class final Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;->k(ZZ)V
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
        0x2,
        0x0
    }
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "com.p1.mobile.putong.core.ui.superlikeopt.upgrade.SuperLikeComboAnimView$animIn$2$1"
    f = "SuperLikeComboAnimView.kt"
    l = {}
    m = "invokeSuspend"
    v = 0x1
.end annotation


# instance fields
.field final synthetic $needShadow:Z

.field private synthetic L$0:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;ZLkotlin/coroutines/Continuation;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;",
            "Z",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->$needShadow:Z

    const/4 p1, 0x2

    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

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

    new-instance v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;

    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->$needShadow:Z

    invoke-direct {v0, v1, p0, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;-><init>(Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;ZLkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->L$0:Ljava/lang/Object;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Ll/drb;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->invoke(Ll/drb;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

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
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;

    .line 6
    .line 7
    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->L$0:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/drb;

    .line 5
    .line 6
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->label:I

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance v4, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1$1;

    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 19
    .line 20
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->$needShadow:Z

    .line 21
    .line 22
    const/4 v7, 0x0

    .line 23
    invoke-direct {v4, p1, v0, v7}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1$1;-><init>(Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;ZLkotlin/coroutines/Continuation;)V

    .line 24
    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    const/4 v6, 0x0

    .line 28
    const/4 v2, 0x0

    .line 29
    const/4 v3, 0x0

    .line 30
    invoke-static/range {v1 .. v6}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 31
    .line 32
    .line 33
    new-instance v4, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1$2;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1;->this$0:Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;

    .line 36
    .line 37
    invoke-direct {v4, p0, v7}, Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView$animIn$2$1$2;-><init>(Lcom/p1/mobile/putong/core/ui/superlikeopt/upgrade/SuperLikeComboAnimView;Lkotlin/coroutines/Continuation;)V

    .line 38
    .line 39
    .line 40
    invoke-static/range {v1 .. v6}, Ll/vh3;->d(Ll/drb;Lkotlin/coroutines/CoroutineContext;Lkotlinx/coroutines/CoroutineStart;Lkotlin/jvm/functions/Function2;ILjava/lang/Object;)Lkotlinx/coroutines/o;

    .line 41
    .line 42
    .line 43
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 47
    .line 48
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x0

    .line 52
    return-object p0
.end method
