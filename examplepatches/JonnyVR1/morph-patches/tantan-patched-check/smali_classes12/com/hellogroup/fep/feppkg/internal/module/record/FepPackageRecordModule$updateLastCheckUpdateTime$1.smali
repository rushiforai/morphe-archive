.class final Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->F(Ljava/lang/String;Ljava/lang/String;)V
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
    c = "com.hellogroup.fep.feppkg.internal.module.record.FepPackageRecordModule$updateLastCheckUpdateTime$1"
    f = "FepPackageRecordModule.kt"
    l = {
        0x1dc
    }
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $baseVersion:Ljava/lang/String;

.field final synthetic $bid:Ljava/lang/String;

.field L$0:Ljava/lang/Object;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    iput-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$bid:Ljava/lang/String;

    iput-object p3, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$baseVersion:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 3
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

    new-instance v0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;

    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    iget-object v2, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$bid:Ljava/lang/String;

    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$baseVersion:Ljava/lang/String;

    invoke-direct {v0, v1, v2, p0, p2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;-><init>(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ljava/lang/String;Ljava/lang/String;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-static {}, Ll/uyp;->e()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->label:I

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x1

    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    if-ne v1, v3, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->L$0:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ll/drb;

    .line 16
    .line 17
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 22
    .line 23
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    return-object v2

    .line 27
    :cond_1
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->p$:Ll/drb;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->L$0:Ljava/lang/Object;

    .line 35
    .line 36
    iput v3, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->label:I

    .line 37
    .line 38
    invoke-virtual {v1, p0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->G(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    if-ne p1, v0, :cond_2

    .line 43
    .line 44
    return-object v0

    .line 45
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 46
    .line 47
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$bid:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p1, v0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->h(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ljava/lang/String;)Ll/lhi;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Ll/lhi;->c()Ljava/util/Map;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$baseVersion:Ljava/lang/String;

    .line 58
    .line 59
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    if-nez v1, :cond_3

    .line 64
    .line 65
    new-instance v3, Ll/khi;

    .line 66
    .line 67
    const/4 v7, 0x3

    .line 68
    const/4 v8, 0x0

    .line 69
    const-wide/16 v4, 0x0

    .line 70
    .line 71
    const/4 v6, 0x0

    .line 72
    invoke-direct/range {v3 .. v8}, Ll/khi;-><init>(JLjava/util/Map;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 73
    .line 74
    .line 75
    invoke-interface {p1, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-object v1, v3

    .line 79
    :cond_3
    check-cast v1, Ll/khi;

    .line 80
    .line 81
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 82
    .line 83
    .line 84
    move-result-wide v3

    .line 85
    invoke-virtual {v1, v3, v4}, Ll/khi;->c(J)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 89
    .line 90
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$bid:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p1, v0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->i(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    sget-object p1, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->INSTANCE:Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/hellogroup/fep/feppkg/internal/core/FepPackageContext;->l()Ll/pgi;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    const-string v1, "Updated check update time for "

    .line 104
    .line 105
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$bid:Ljava/lang/String;

    .line 109
    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    const/16 v1, 0x2f

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$updateLastCheckUpdateTime$1;->$baseVersion:Ljava/lang/String;

    .line 119
    .line 120
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    const/4 v0, 0x2

    .line 128
    invoke-static {p1, p0, v2, v0, v2}, Ll/pgi;->b(Ll/pgi;Ljava/lang/String;Ljava/util/Map;ILjava/lang/Object;)V

    .line 129
    .line 130
    .line 131
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 132
    .line 133
    return-object p0
.end method
