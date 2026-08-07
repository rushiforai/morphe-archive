.class public final Ll/rfe0$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/rfe0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\t\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\t\u0010\u0008\u00a8\u0006\n"
    }
    d2 = {
        "Ll/rfe0$a;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/core/newui/home/b;",
        "viewModel",
        "",
        "g",
        "(Lcom/p1/mobile/putong/core/newui/home/b;)V",
        "i",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/rfe0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static b(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/rfe0$a;->h(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static d(Lcom/p1/mobile/putong/core/newui/home/b;Lcom/p1/mobile/putong/data/User;)Lkotlin/Unit;
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x1:Ll/axa;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/axa;->c3()Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;->data:Lcom/p1/mobile/putong/core/data/SeeBlindBoxData;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SeeBlindBoxData;->users:Ljava/util/List;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-interface {v0, v1, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    sget-object p1, Ll/rfe0;->Companion:Ll/rfe0$a;

    .line 20
    .line 21
    invoke-virtual {p1, p0}, Ll/rfe0$a;->i(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 25
    .line 26
    return-object p0
.end method

.method public static e(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Lcom/p1/mobile/putong/data/User;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    return-object p0
.end method

.method public static f(Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;)Lcom/p1/mobile/putong/data/User;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x1:Ll/axa;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ll/axa;->f3(Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;->data:Lcom/p1/mobile/putong/core/data/SeeBlindBoxData;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/SeeBlindBoxData;->users:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    check-cast p0, Lcom/p1/mobile/putong/data/User;

    .line 25
    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    invoke-static {}, Ll/l9c;->o()Ll/l9c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/qfe0;

    .line 33
    .line 34
    invoke-direct {v1, p0}, Ll/qfe0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/l9c;->B(Ll/x20;)V

    .line 38
    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return-object p0
.end method

.method public static final h(Lcom/p1/mobile/putong/data/User;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->k0:Ll/vj5;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vj5;->d:Ll/ejk0;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ll/wzh0;->upsert(Lcom/tantanapp/common/data/DbObject;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final g(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 6
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {v0, p0, v0}, Ll/rbb0;->s(Lcom/p1/mobile/putong/data/Counter;ILjava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_4

    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isSVIP()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object p0, Ll/ege0;->INSTANCE:Ll/ege0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/ege0;->f()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    const/4 v2, -0x1

    .line 34
    if-eq v1, v2, :cond_4

    .line 35
    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 39
    .line 40
    iget-object v1, v1, Ll/dkb;->P0:Ll/byd0;

    .line 41
    .line 42
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ljava/lang/Long;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/ege0;->f()I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    int-to-long v2, p0

    .line 53
    if-nez v1, :cond_1

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 57
    .line 58
    .line 59
    move-result-wide v4

    .line 60
    cmp-long p0, v4, v2

    .line 61
    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    if-eqz p0, :cond_4

    .line 70
    .line 71
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 72
    .line 73
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->x1:Ll/axa;

    .line 74
    .line 75
    invoke-virtual {v1}, Ll/axa;->d3()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    if-eqz v1, :cond_3

    .line 88
    .line 89
    new-instance v0, Ll/lfe0;

    .line 90
    .line 91
    invoke-direct {v0}, Ll/lfe0;-><init>()V

    .line 92
    .line 93
    .line 94
    new-instance v2, Ll/mfe0;

    .line 95
    .line 96
    invoke-direct {v2, v0}, Ll/mfe0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    :cond_3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    if-eqz p0, :cond_4

    .line 108
    .line 109
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    if-eqz p0, :cond_4

    .line 118
    .line 119
    new-instance v0, Ll/nfe0;

    .line 120
    .line 121
    invoke-direct {v0, p1}, Ll/nfe0;-><init>(Lcom/p1/mobile/putong/core/newui/home/b;)V

    .line 122
    .line 123
    .line 124
    new-instance p1, Ll/ofe0;

    .line 125
    .line 126
    invoke-direct {p1, v0}, Ll/ofe0;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 127
    .line 128
    .line 129
    new-instance v0, Ll/pfe0;

    .line 130
    .line 131
    invoke-direct {v0}, Ll/pfe0;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p1, v0}, Lrx/c;->subscribe(Ll/y20;Ll/y20;)Ll/kcg0;

    .line 135
    .line 136
    .line 137
    :cond_4
    :goto_0
    return-void
.end method

.method public final i(Lcom/p1/mobile/putong/core/newui/home/b;)V
    .locals 2
    .param p1    # Lcom/p1/mobile/putong/core/newui/home/b;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/home/b;->q2()Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->x1:Ll/axa;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/axa;->c3()Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;->data:Lcom/p1/mobile/putong/core/data/SeeBlindBoxData;

    .line 19
    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/SeeBlindBoxData;->users:Ljava/util/List;

    .line 23
    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 p1, 0x0

    .line 36
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-lez p1, :cond_1

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    new-instance p1, Ll/yfe0;

    .line 48
    .line 49
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->x1:Ll/axa;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/axa;->c3()Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SeeBlindBoxEnvelope;->data:Lcom/p1/mobile/putong/core/data/SeeBlindBoxData;

    .line 58
    .line 59
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/SeeBlindBoxData;->users:Ljava/util/List;

    .line 60
    .line 61
    const/4 v1, 0x0

    .line 62
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 67
    .line 68
    .line 69
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    invoke-direct {p1, p0, v0}, Ll/yfe0;-><init>(Lcom/p1/mobile/putong/core/newui/home/NewNewHomeFrag;Lcom/p1/mobile/putong/data/User;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ll/yfe0;->s()V

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void
.end method
