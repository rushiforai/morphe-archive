.class public final Ll/non;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/non$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u00c6\u0002\u0018\u00002\u00020\u0001:\u0001\u001cB\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J+\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\n\u0008\u0002\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0007\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\'\u0010\u0011\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u0008H\u0007\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\r\u0010\u0013\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0013\u0010\u0003J\r\u0010\u0014\u001a\u00020\n\u00a2\u0006\u0004\u0008\u0014\u0010\u0003J\u001f\u0010\u0016\u001a\u00020\n2\u0006\u0010\u0015\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0016\u0010\u0017J\u001f\u0010\u0019\u001a\u00020\u00182\u0006\u0010\u0005\u001a\u00020\r2\u0006\u0010\u0007\u001a\u00020\u0006H\u0002\u00a2\u0006\u0004\u0008\u0019\u0010\u001aR\u0014\u0010\u001e\u001a\u00020\u001b8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001c\u0010\u001d\u00a8\u0006\u001f"
    }
    d2 = {
        "Ll/non;",
        "",
        "<init>",
        "()V",
        "Lcom/p1/mobile/android/app/Act;",
        "context",
        "Ll/non$a;",
        "builder",
        "",
        "source",
        "",
        "g",
        "(Lcom/p1/mobile/android/app/Act;Ll/non$a;Ljava/lang/String;)V",
        "Landroid/content/Context;",
        "Lcom/p1/mobile/putong/core/data/Greeting;",
        "greeting",
        "from",
        "l",
        "(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V",
        "n",
        "m",
        "act",
        "k",
        "(Lcom/p1/mobile/android/app/Act;Ll/non$a;)V",
        "Landroid/content/Intent;",
        "j",
        "(Landroid/content/Context;Ll/non$a;)Landroid/content/Intent;",
        "Ll/l4g0;",
        "a",
        "Ll/l4g0;",
        "pageHelper",
        "message_intlGmsRelease"
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
.field public static final INSTANCE:Ll/non;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final a:Ll/l4g0;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ll/non;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/non;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/non;->INSTANCE:Ll/non;

    .line 7
    .line 8
    const-class v0, Ll/non;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const-string v1, "p_intl_ilike_im_overheat_popup"

    .line 15
    .line 16
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    .line 22
    .line 23
    sput-object v0, Ll/non;->a:Ll/l4g0;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/non;->i(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    invoke-static {}, Ll/non;->h()V

    return-void
.end method

.method public static c(Lkotlin/jvm/functions/Function1;Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Boolean;

    .line 6
    .line 7
    return-object p0
.end method

.method public static d(Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static e(Ll/non$a;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetingPermissions:Ljava/util/List;

    .line 5
    .line 6
    check-cast v0, Ljava/util/Collection;

    .line 7
    .line 8
    invoke-static {v0}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    const/4 v2, 0x0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetingPermissions:Ljava/util/List;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 19
    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingPermission;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object v0, v2

    .line 29
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    .line 37
    .line 38
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/data/GreetingPermission;->enable:Z

    .line 39
    .line 40
    if-nez v0, :cond_1

    .line 41
    .line 42
    goto/16 :goto_1

    .line 43
    .line 44
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetings:Ljava/util/List;

    .line 45
    .line 46
    check-cast v0, Ljava/util/Collection;

    .line 47
    .line 48
    invoke-static {v0}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->greetings:Ljava/util/List;

    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    move-object v2, v0

    .line 64
    check-cast v2, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 65
    .line 66
    :cond_2
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    invoke-virtual {p0, v2}, Ll/non$a;->e(Lcom/p1/mobile/putong/core/data/Greeting;)Ll/non$a;

    .line 73
    .line 74
    .line 75
    sget-object p2, Ll/non;->INSTANCE:Ll/non;

    .line 76
    .line 77
    invoke-virtual {p2, p1, p0}, Ll/non;->k(Lcom/p1/mobile/android/app/Act;Ll/non$a;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_3
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->hotLevels:Ljava/util/List;

    .line 82
    .line 83
    check-cast v0, Ljava/util/Collection;

    .line 84
    .line 85
    invoke-static {v0}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_5

    .line 90
    .line 91
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/GreetingHotLevelInfo;->hotLevels:Ljava/util/List;

    .line 92
    .line 93
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 94
    .line 95
    .line 96
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object p2

    .line 100
    check-cast p2, Lcom/p1/mobile/putong/core/data/HotLevel;

    .line 101
    .line 102
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_5

    .line 107
    .line 108
    iget v0, p2, Lcom/p1/mobile/putong/core/data/HotLevel;->level:I

    .line 109
    .line 110
    invoke-virtual {p0, v0}, Ll/non$a;->d(I)Ll/non$a;

    .line 111
    .line 112
    .line 113
    iget p2, p2, Lcom/p1/mobile/putong/core/data/HotLevel;->level:I

    .line 114
    .line 115
    const/4 v0, 0x2

    .line 116
    if-lt p2, v0, :cond_4

    .line 117
    .line 118
    new-instance p0, Ll/jl80$a;

    .line 119
    .line 120
    invoke-direct {p0, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 121
    .line 122
    .line 123
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->Y3:I

    .line 124
    .line 125
    new-array p2, v1, [Ljava/lang/Object;

    .line 126
    .line 127
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->X3:I

    .line 132
    .line 133
    new-array p2, v1, [Ljava/lang/Object;

    .line 134
    .line 135
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    sget p1, Lcom/p1/mobile/putong/core/message/R$string;->k:I

    .line 140
    .line 141
    new-instance p2, Ll/lon;

    .line 142
    .line 143
    invoke-direct {p2}, Ll/lon;-><init>()V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0, p1, p2}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    invoke-virtual {p0, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    new-instance p1, Ll/mon;

    .line 155
    .line 156
    invoke-direct {p1}, Ll/mon;-><init>()V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 164
    .line 165
    .line 166
    sget-object p0, Ll/non;->INSTANCE:Ll/non;

    .line 167
    .line 168
    invoke-virtual {p0}, Ll/non;->n()V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_4
    invoke-virtual {p0, v1}, Ll/non$a;->f(Z)Ll/non$a;

    .line 173
    .line 174
    .line 175
    sget-object p2, Ll/non;->INSTANCE:Ll/non;

    .line 176
    .line 177
    invoke-virtual {p2, p1, p0}, Ll/non;->k(Lcom/p1/mobile/android/app/Act;Ll/non$a;)V

    .line 178
    .line 179
    .line 180
    :cond_5
    :goto_1
    return-void
.end method

.method public static f(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static final g(Lcom/p1/mobile/android/app/Act;Ll/non$a;Ljava/lang/String;)V
    .locals 3
    .param p0    # Lcom/p1/mobile/android/app/Act;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ll/non$a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/non$a;->c()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, v1, v2, p2}, Lcom/p1/mobile/putong/core/api/j;->q5(Ljava/lang/String;ZLjava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    new-instance v0, Ll/hon;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/hon;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v1, Ll/ion;

    .line 36
    .line 37
    invoke-direct {v1, v0}, Ll/ion;-><init>(Lkotlin/jvm/functions/Function1;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p2, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    new-instance v0, Ll/jon;

    .line 45
    .line 46
    invoke-direct {v0, p1, p0}, Ll/jon;-><init>(Ll/non$a;Lcom/p1/mobile/android/app/Act;)V

    .line 47
    .line 48
    .line 49
    new-instance p0, Ll/kon;

    .line 50
    .line 51
    invoke-direct {p0}, Ll/kon;-><init>()V

    .line 52
    .line 53
    .line 54
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method

.method public static final h()V
    .locals 0

    .line 1
    return-void
.end method

.method public static final i(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    sget-object p0, Ll/non;->INSTANCE:Ll/non;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/non;->m()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static final l(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V
    .locals 1
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Lcom/p1/mobile/putong/core/data/Greeting;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance v0, Ll/non$a;

    .line 11
    .line 12
    invoke-direct {v0, p1, p2}, Ll/non$a;-><init>(Lcom/p1/mobile/putong/core/data/Greeting;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    sget-object p1, Ll/non;->INSTANCE:Ll/non;

    .line 16
    .line 17
    invoke-virtual {p1, p0, v0}, Ll/non;->j(Landroid/content/Context;Ll/non$a;)Landroid/content/Intent;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final j(Landroid/content/Context;Ll/non$a;)Landroid/content/Intent;
    .locals 1

    .line 1
    new-instance p0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v0, Lcom/p1/mobile/putong/core/ui/intl/greet/IntlGreetAct;

    .line 4
    .line 5
    invoke-direct {p0, p1, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2, p0}, Ll/non$a;->a(Landroid/content/Intent;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public final k(Lcom/p1/mobile/android/app/Act;Ll/non$a;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/non;->j(Landroid/content/Context;Ll/non$a;)Landroid/content/Intent;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/16 v0, 0x11

    .line 12
    .line 13
    invoke-virtual {p1, p0, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p2}, Ll/non$a;->b()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Ui(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    sget p0, Ll/y7c0;->e:I

    .line 31
    .line 32
    const/4 p2, 0x0

    .line 33
    invoke-virtual {p1, p0, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public final m()V
    .locals 0

    .line 1
    sget-object p0, Ll/non;->a:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->j()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public final n()V
    .locals 0

    .line 1
    sget-object p0, Ll/non;->a:Ll/l4g0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/l4g0;->i()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
