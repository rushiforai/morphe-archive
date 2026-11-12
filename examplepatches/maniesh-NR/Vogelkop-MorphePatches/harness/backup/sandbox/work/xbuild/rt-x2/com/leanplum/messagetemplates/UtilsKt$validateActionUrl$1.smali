.class final Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;
.super Lkuk;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/UtilsKt;->validateActionUrl(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lcom/opera/api/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkuk;",
        "Lkotlin/jvm/functions/Function2<",
        "Lnx5;",
        "Lmt5<",
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
        "Lnx5;",
        "",
        "<anonymous>",
        "(Lnx5;)V"
    }
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
.end annotation

.annotation runtime Lri6;
    c = "com.leanplum.messagetemplates.UtilsKt$validateActionUrl$1"
    f = "Utils.kt"
    l = {
        0x81
    }
    m = "invokeSuspend"
    v = 0x2
.end annotation


# instance fields
.field final synthetic $actionContext:Lcom/leanplum/ActionContext;

.field final synthetic $callback:Lcom/opera/api/Callback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/opera/api/Callback;"
        }
    .end annotation
.end field

.field final synthetic $context:Landroid/content/Context;

.field final synthetic $name:Ljava/lang/String;

.field L$0:Ljava/lang/Object;

.field label:I


# direct methods
.method public constructor <init>(Lcom/opera/api/Callback;Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/opera/api/Callback;",
            "Landroid/content/Context;",
            "Lcom/leanplum/ActionContext;",
            "Ljava/lang/String;",
            "Lmt5<",
            "-",
            "Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$callback:Lcom/opera/api/Callback;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$actionContext:Lcom/leanplum/ActionContext;

    iput-object p4, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$name:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p5}, Lkuk;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lmt5<",
            "*>;)",
            "Lmt5<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$callback:Lcom/opera/api/Callback;

    iget-object v2, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$actionContext:Lcom/leanplum/ActionContext;

    iget-object v4, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$name:Ljava/lang/String;

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;-><init>(Lcom/opera/api/Callback;Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)V

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 13
    check-cast p1, Lnx5;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->invoke(Lnx5;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lnx5;Lmt5;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnx5;",
            "Lmt5<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    sget-object v0, Lpx5;->a:Lpx5;

    iget v1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->label:I

    const/4 v2, 0x1

    if-eqz v1, :cond_18

    if-ne v1, v2, :cond_11

    iget-object p0, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->L$0:Ljava/lang/Object;

    check-cast p0, Lcom/opera/api/Callback;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_31

    :cond_11
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_18
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$callback:Lcom/opera/api/Callback;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$context:Landroid/content/Context;

    iget-object v3, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$actionContext:Lcom/leanplum/ActionContext;

    iget-object v4, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->$name:Ljava/lang/String;

    iput-object p1, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->L$0:Ljava/lang/Object;

    iput v2, p0, Lcom/leanplum/messagetemplates/UtilsKt$validateActionUrl$1;->label:I

    # invokes: Lcom/leanplum/messagetemplates/UtilsKt;->validateActionUrlInternal(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;
    invoke-static {v1, v3, v4, p0}, Lcom/leanplum/messagetemplates/UtilsKt;->access$validateActionUrlInternal(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v0, :cond_2e

    return-object v0

    :cond_2e
    move-object v5, p1

    move-object p1, p0

    move-object p0, v5

    :goto_31
    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
