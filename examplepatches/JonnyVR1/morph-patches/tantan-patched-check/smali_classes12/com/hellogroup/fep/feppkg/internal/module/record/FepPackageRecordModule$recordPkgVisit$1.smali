.class final Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;
.super Lkotlin/coroutines/jvm/internal/SuspendLambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->A(Ll/zgi;)V
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
    c = "com.hellogroup.fep.feppkg.internal.module.record.FepPackageRecordModule$recordPkgVisit$1"
    f = "FepPackageRecordModule.kt"
    l = {}
    m = "invokeSuspend"
.end annotation


# instance fields
.field final synthetic $info:Ll/zgi;

.field label:I

.field private p$:Ll/drb;

.field final synthetic this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;


# direct methods
.method public constructor <init>(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ll/zgi;Lkotlin/coroutines/Continuation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->$info:Ll/zgi;

    .line 4
    .line 5
    const/4 p1, 0x2

    .line 6
    invoke-direct {p0, p1, p3}, Lkotlin/coroutines/jvm/internal/SuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .locals 2
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

    new-instance v0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;

    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->$info:Ll/zgi;

    invoke-direct {v0, v1, p0, p2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;-><init>(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ll/zgi;Lkotlin/coroutines/Continuation;)V

    check-cast p1, Ll/drb;

    iput-object p1, v0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->p$:Ll/drb;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
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
    iget v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->label:I

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-nez v0, :cond_4

    .line 8
    .line 9
    invoke-static {p1}, Lkotlin/ResultKt;->b(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    :try_start_0
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 13
    .line 14
    iget-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->$info:Ll/zgi;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/zgi;->g()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    const-wide/16 v4, 0x0

    .line 21
    .line 22
    cmp-long p1, v2, v4

    .line 23
    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->$info:Ll/zgi;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/zgi;->e()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {p1, v0}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->h(Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;Ljava/lang/String;)Ll/lhi;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p1}, Ll/lhi;->c()Ljava/util/Map;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->$info:Ll/zgi;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/zgi;->d()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Ll/khi;

    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    invoke-virtual {p1}, Ll/khi;->a()Ljava/util/Map;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    if-eqz p1, :cond_1

    .line 64
    .line 65
    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    move-object v1, p1

    .line 74
    check-cast v1, Ll/mhi;

    .line 75
    .line 76
    :cond_1
    if-eqz v1, :cond_2

    .line 77
    .line 78
    invoke-virtual {v1}, Ll/mhi;->d()J

    .line 79
    .line 80
    .line 81
    move-result-wide v0

    .line 82
    invoke-static {v0, v1}, Lkotlin/coroutines/jvm/internal/Boxing;->c(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    if-eqz p1, :cond_2

    .line 87
    .line 88
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 89
    .line 90
    .line 91
    move-result-wide v4

    .line 92
    :cond_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 93
    .line 94
    .line 95
    move-result-wide v0

    .line 96
    sub-long/2addr v0, v4

    .line 97
    const-wide/32 v2, 0x6ddd00

    .line 98
    .line 99
    .line 100
    cmp-long p1, v0, v2

    .line 101
    .line 102
    if-lez p1, :cond_3

    .line 103
    .line 104
    iget-object p1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->this$0:Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;

    .line 105
    .line 106
    iget-object v0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->$info:Ll/zgi;

    .line 107
    .line 108
    invoke-virtual {v0}, Ll/zgi;->e()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    iget-object v1, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->$info:Ll/zgi;

    .line 113
    .line 114
    invoke-virtual {v1}, Ll/zgi;->d()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    iget-object p0, p0, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule$recordPkgVisit$1;->$info:Ll/zgi;

    .line 119
    .line 120
    invoke-virtual {p0}, Ll/zgi;->g()J

    .line 121
    .line 122
    .line 123
    move-result-wide v2

    .line 124
    invoke-virtual {p1, v0, v1, v2, v3}, Lcom/hellogroup/fep/feppkg/internal/module/record/FepPackageRecordModule;->B(Ljava/lang/String;Ljava/lang/String;J)V

    .line 125
    .line 126
    .line 127
    :cond_3
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 128
    .line 129
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :catchall_0
    move-exception p0

    .line 134
    sget-object p1, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    .line 135
    .line 136
    invoke-static {p0}, Lkotlin/ResultKt;->a(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-static {p0}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    :goto_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 144
    .line 145
    return-object p0

    .line 146
    :cond_4
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 147
    .line 148
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-object v1
.end method
