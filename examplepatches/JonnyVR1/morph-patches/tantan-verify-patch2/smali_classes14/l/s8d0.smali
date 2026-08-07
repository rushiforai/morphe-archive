.class public final Ll/s8d0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/s8d0$a;,
        Ll/s8d0$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0018\u0000 !2\u00020\u0001:\u0002\u001b\u001eB\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\u0017\u0010\t\u001a\u00020\u00062\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\t\u0010\u0008J\u0017\u0010\u000b\u001a\u00020\n2\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\'\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f2\u0008\u0010\u0012\u001a\u0004\u0018\u00010\u0011\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u001d\u0010\u0016\u001a\u00020\u00132\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\r\u0010\u0018\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0018\u0010\u0019R\u0016\u0010\u001d\u001a\u00020\u001a8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001cR\u0016\u0010 \u001a\u00020\u00068\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001f\u00a8\u0006\""
    }
    d2 = {
        "Ll/s8d0;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/putong/data/AdConfiguration;",
        "adConfiguration",
        "",
        "l",
        "(Lcom/p1/mobile/putong/data/AdConfiguration;)Z",
        "j",
        "",
        "h",
        "(Lcom/p1/mobile/putong/data/AdConfiguration;)I",
        "Lcom/p1/mobile/android/app/Act;",
        "act",
        "",
        "from",
        "Ll/x20;",
        "cancelClickAction",
        "",
        "n",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V",
        "m",
        "(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V",
        "o",
        "()Z",
        "Ll/wyd0;",
        "a",
        "Ll/wyd0;",
        "swipeMaxTaskNum",
        "b",
        "Z",
        "canPollingRefresh",
        "Companion",
        "member_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Ll/s8d0$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static volatile c:Ll/s8d0;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# instance fields
.field public a:Ll/wyd0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/s8d0$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/s8d0$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ll/s8d0;->Companion:Ll/s8d0$a;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/wyd0;

    .line 5
    .line 6
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 7
    .line 8
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    new-instance v2, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v3, "core_swipe_max_task_num_"

    .line 15
    .line 16
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "0,0"

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/s8d0;->a:Ll/wyd0;

    .line 32
    .line 33
    return-void
.end method

.method public static a(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const-string v0, "e_choose_incentive_ad"

    .line 2
    .line 3
    const-string v1, "p_incentive_ad_choose_page"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/rsh0;->Companion:Ll/rsh0$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rsh0$a;->a()Ll/rsh0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/rsh0;->c()Ll/ssh0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/s8d0$c;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/s8d0$c;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    const-string v2, "swipe"

    .line 24
    .line 25
    invoke-virtual {v0, p0, v2, v1}, Ll/ssh0;->b(Landroid/app/Activity;Ljava/lang/String;Ll/b5m;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static c(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const-string v0, "e_choose_incentive_ad"

    .line 2
    .line 3
    const-string v1, "p_incentive_ad_choose_page"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/rsh0;->Companion:Ll/rsh0$a;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rsh0$a;->a()Ll/rsh0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/rsh0;->c()Ll/ssh0;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/s8d0$d;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/s8d0$d;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 21
    .line 22
    .line 23
    const-string v2, "swipe"

    .line 24
    .line 25
    invoke-virtual {v0, p0, v2, v1}, Ll/ssh0;->b(Landroid/app/Activity;Ljava/lang/String;Ll/b5m;)Z

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public static d(Ll/l4g0;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static e(Ll/x20;)V
    .locals 2

    .line 1
    const-string v0, "e_choose_purchase_vas"

    .line 2
    .line 3
    const-string v1, "p_incentive_ad_choose_page"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p0}, Ll/x20;->call()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static final synthetic f()Ll/s8d0;
    .locals 1

    .line 1
    sget-object v0, Ll/s8d0;->c:Ll/s8d0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static final synthetic g(Ll/s8d0;)V
    .locals 0

    .line 1
    sput-object p0, Ll/s8d0;->c:Ll/s8d0;

    .line 2
    .line 3
    return-void
.end method

.method public static final i()Ll/s8d0;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Ll/s8d0;->Companion:Ll/s8d0$a;

    invoke-virtual {v0}, Ll/s8d0$a;->a()Ll/s8d0;

    move-result-object v0

    return-object v0
.end method

.method public static final k()V
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    sget-object v0, Ll/s8d0;->Companion:Ll/s8d0$a;

    invoke-virtual {v0}, Ll/s8d0$a;->b()V

    return-void
.end method


# virtual methods
.method public final h(Lcom/p1/mobile/putong/data/AdConfiguration;)I
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/AdConfiguration;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AdConfiguration;->adReward:Lcom/p1/mobile/putong/data/AdReward;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AdReward;->swipe:Lcom/p1/mobile/putong/data/AdScenes;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/AdScenes;->ext:Lcom/p1/mobile/putong/data/AdRewardExt;

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    iget p0, p0, Lcom/p1/mobile/putong/data/AdRewardExt;->swipeRewardCardCount:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final j(Lcom/p1/mobile/putong/data/AdConfiguration;)Z
    .locals 1
    .param p1    # Lcom/p1/mobile/putong/data/AdConfiguration;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AdConfiguration;->adReward:Lcom/p1/mobile/putong/data/AdReward;

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AdReward;->swipe:Lcom/p1/mobile/putong/data/AdScenes;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/data/AdScenes;->ext:Lcom/p1/mobile/putong/data/AdRewardExt;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget p1, p1, Lcom/p1/mobile/putong/data/AdRewardExt;->swipeGuideStyle:I

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    return p0
.end method

.method public final l(Lcom/p1/mobile/putong/data/AdConfiguration;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/AdConfiguration;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-class v0, Landroid/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "p_incentive_ad_choose_page"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "purchaseShowFrom"

    .line 20
    .line 21
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    filled-new-array {p2}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {v0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    sget-object p2, Ll/qsh0;->Companion:Ll/qsh0$a;

    .line 33
    .line 34
    invoke-virtual {p2}, Ll/qsh0$a;->a()Ll/qsh0;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2}, Ll/qsh0;->c()Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p2}, Ll/s8d0;->h(Lcom/p1/mobile/putong/data/AdConfiguration;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    new-instance p2, Ll/l8d0$a;

    .line 47
    .line 48
    invoke-direct {p2, p1}, Ll/l8d0$a;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v2, "\u89c2\u770b\u5e7f\u544a\u591a\u6ed1"

    .line 54
    .line 55
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p0, "\u5f20\u5361\u7247"

    .line 62
    .line 63
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p2, p0}, Ll/l8d0$a;->q(Ljava/lang/String;)Ll/l8d0$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p2, "\u89c2\u770b\u89c6\u9891\u5e7f\u544a\uff0c\u5373\u53ef\u83b7\u5f97\u66f4\u591a\u514d\u8d39\u6ed1\u5361\u6570\u91cf\uff01"

    .line 75
    .line 76
    invoke-virtual {p0, p2}, Ll/l8d0$a;->n(Ljava/lang/CharSequence;)Ll/l8d0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p2, "\u770b\u5e7f\u544a\u7ee7\u7eed\u6ed1\u5361"

    .line 81
    .line 82
    invoke-virtual {p0, p2}, Ll/l8d0$a;->m(Ljava/lang/String;)Ll/l8d0$a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    invoke-static {}, Ll/c17;->u0()Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    if-eqz p2, :cond_0

    .line 91
    .line 92
    sget p2, Ll/gbc0;->e:I

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_0
    sget p2, Ll/gbc0;->d:I

    .line 96
    .line 97
    :goto_0
    invoke-virtual {p0, p2}, Ll/l8d0$a;->p(I)Ll/l8d0$a;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    new-instance p2, Ll/q8d0;

    .line 102
    .line 103
    invoke-direct {p2, p1}, Ll/q8d0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p2}, Ll/l8d0$a;->l(Ll/x20;)Ll/l8d0$a;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    new-instance p1, Ll/r8d0;

    .line 111
    .line 112
    invoke-direct {p1, v0}, Ll/r8d0;-><init>(Ll/l4g0;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p1}, Ll/l8d0$a;->o(Ll/x20;)Ll/l8d0$a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    invoke-virtual {p0}, Ll/l8d0$a;->r()Ll/l8d0;

    .line 120
    .line 121
    .line 122
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 123
    .line 124
    .line 125
    return-void
.end method

.method public final n(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/x20;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/x20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-class v0, Landroid/app/Dialog;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v1, "p_incentive_ad_choose_page"

    .line 14
    .line 15
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "purchaseShowFrom"

    .line 20
    .line 21
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    filled-new-array {p2}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {v0, p2}, Ll/l4g0;->p([Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    sget-object p2, Ll/qsh0;->Companion:Ll/qsh0$a;

    .line 33
    .line 34
    invoke-virtual {p2}, Ll/qsh0$a;->a()Ll/qsh0;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    invoke-virtual {p2}, Ll/qsh0;->c()Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p0, p2}, Ll/s8d0;->h(Lcom/p1/mobile/putong/data/AdConfiguration;)I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    new-instance p2, Ll/l8d0$a;

    .line 47
    .line 48
    invoke-direct {p2, p1}, Ll/l8d0$a;-><init>(Landroid/content/Context;)V

    .line 49
    .line 50
    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v2, "\u89c2\u770b\u5e7f\u544a\u591a\u6ed1"

    .line 54
    .line 55
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p0, "\u5f20\u5361\u7247"

    .line 62
    .line 63
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p2, p0}, Ll/l8d0$a;->q(Ljava/lang/String;)Ll/l8d0$a;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    const-string p2, "\u89c2\u770b\u89c6\u9891\u5e7f\u544a\uff0c\u5373\u53ef\u83b7\u5f97\u66f4\u591a\u514d\u8d39\u6ed1\u5361\u6570\u91cf\uff01"

    .line 75
    .line 76
    invoke-virtual {p0, p2}, Ll/l8d0$a;->n(Ljava/lang/CharSequence;)Ll/l8d0$a;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string p2, "\u770b\u5e7f\u544a\u7ee7\u7eed\u6ed1\u5361"

    .line 81
    .line 82
    invoke-virtual {p0, p2}, Ll/l8d0$a;->m(Ljava/lang/String;)Ll/l8d0$a;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string p2, "\u4f1a\u5458\u89e3\u9501\u65e0\u9650\u53f3\u6ed1"

    .line 87
    .line 88
    invoke-virtual {p0, p2}, Ll/l8d0$a;->k(Ljava/lang/String;)Ll/l8d0$a;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {}, Ll/c17;->u0()Z

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    if-eqz p2, :cond_0

    .line 97
    .line 98
    sget p2, Ll/gbc0;->e:I

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_0
    sget p2, Ll/gbc0;->d:I

    .line 102
    .line 103
    :goto_0
    invoke-virtual {p0, p2}, Ll/l8d0$a;->p(I)Ll/l8d0$a;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    new-instance p2, Ll/n8d0;

    .line 108
    .line 109
    invoke-direct {p2, p1}, Ll/n8d0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0, p2}, Ll/l8d0$a;->l(Ll/x20;)Ll/l8d0$a;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    new-instance p1, Ll/o8d0;

    .line 117
    .line 118
    invoke-direct {p1, p3}, Ll/o8d0;-><init>(Ll/x20;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0, p1}, Ll/l8d0$a;->j(Ll/x20;)Ll/l8d0$a;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    new-instance p1, Ll/p8d0;

    .line 126
    .line 127
    invoke-direct {p1, v0}, Ll/p8d0;-><init>(Ll/l4g0;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {p0, p1}, Ll/l8d0$a;->o(Ll/x20;)Ll/l8d0$a;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    invoke-virtual {p0}, Ll/l8d0$a;->r()Ll/l8d0;

    .line 135
    .line 136
    .line 137
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public final o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/s8d0;->b:Z

    .line 2
    .line 3
    return p0
.end method
