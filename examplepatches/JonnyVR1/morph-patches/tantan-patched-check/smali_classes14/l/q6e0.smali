.class public Ll/q6e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Ll/uxj0;Ll/uxj0;)Ll/uxj0;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Ll/q6e0;Ll/abe0;Ljava/util/Map;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/q6e0;->k(Ll/abe0;Ljava/util/Map;Ll/z20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/data/User;)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {v0, v1, p0, v2}, Lcom/p1/mobile/putong/ui/DialogAct;->Q0(Landroid/content/Context;ILjava/io/Serializable;Z)Landroid/content/Intent;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic h(Ll/z20;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "done"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {p0, v0, v1}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    invoke-static {p2}, Ll/bsj0;->D(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static synthetic i(Ll/z20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    const-string p3, "done"

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, p3, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 17
    .line 18
    .line 19
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 20
    .line 21
    new-instance p1, Ll/p6e0;

    .line 22
    .line 23
    invoke-direct {p1, p2}, Ll/p6e0;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 24
    .line 25
    .line 26
    const-wide/16 p2, 0x12c

    .line 27
    .line 28
    invoke-static {p0, p1, p2, p3}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic j(Ll/z20;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    const-string p1, "cancel"

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p0, p1, v0}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/abe0;->f()Ljava/util/Map;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "uid"

    .line 6
    .line 7
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    new-instance v1, Ll/th0$a;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Oi:I

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    sget v3, Lcom/p1/mobile/putong/core/R$string;->c:I

    .line 43
    .line 44
    invoke-virtual {v2, v3}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    new-instance v3, Ll/k6e0;

    .line 49
    .line 50
    invoke-direct {v3, p2}, Ll/k6e0;-><init>(Ll/z20;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    sget v3, Lcom/p1/mobile/putong/core/R$string;->h:I

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    new-instance v3, Ll/l6e0;

    .line 64
    .line 65
    invoke-direct {v3, p0, p1, v0, p2}, Ll/l6e0;-><init>(Ll/q6e0;Ll/abe0;Ljava/util/Map;Ll/z20;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ll/th0$a;->a()Ll/th0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public c(Ll/abe0;Ll/z20;)Landroid/content/Intent;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/abe0;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/content/Intent;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic k(Ll/abe0;Ljava/util/Map;Ll/z20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p0, p1, p2, p3}, Ll/q6e0;->l(Lcom/p1/mobile/android/app/Act;Ljava/util/Map;Ll/z20;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final l(Lcom/p1/mobile/android/app/Act;Ljava/util/Map;Ll/z20;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ll/z20<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string p0, "msgId"

    .line 2
    .line 3
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "value"

    .line 10
    .line 11
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    const-string v1, "conType"

    .line 18
    .line 19
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Ljava/lang/String;

    .line 24
    .line 25
    const-string v2, "uid"

    .line 26
    .line 27
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Ljava/lang/String;

    .line 32
    .line 33
    sget v2, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 34
    .line 35
    const/4 v3, 0x1

    .line 36
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/android/app/Act;->progress(IZ)Landroid/app/Dialog;

    .line 37
    .line 38
    .line 39
    new-instance v2, Lcom/p1/mobile/putong/data/Report;

    .line 40
    .line 41
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Report;-><init>()V

    .line 42
    .line 43
    .line 44
    sget-object v3, Lcom/p1/mobile/putong/data/Report;->CATEGORY_DEFAULT:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Report;->category:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v0, v2, Lcom/p1/mobile/putong/data/Report;->value:Ljava/lang/String;

    .line 49
    .line 50
    iput-object v1, v2, Lcom/p1/mobile/putong/data/Report;->contentType:Ljava/lang/String;

    .line 51
    .line 52
    new-instance v0, Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    iput-object v0, v2, Lcom/p1/mobile/putong/data/Report;->chatMessages:Ljava/util/List;

    .line 61
    .line 62
    new-instance p0, Lcom/p1/mobile/putong/data/Relationship;

    .line 63
    .line 64
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Relationship;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v0, "blocked"

    .line 68
    .line 69
    invoke-static {v0}, Lcom/p1/mobile/putong/data/RelationshipStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 78
    .line 79
    invoke-virtual {p0, p2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 86
    .line 87
    invoke-virtual {v0, p2, v2}, Ll/dkb;->ha(Ljava/lang/String;Lcom/p1/mobile/putong/data/Report;)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 94
    .line 95
    invoke-virtual {v1, p2, p1}, Lcom/p1/mobile/putong/core/api/g;->qe(Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)Lrx/c;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    new-instance v1, Ll/m6e0;

    .line 100
    .line 101
    invoke-direct {v1}, Ll/m6e0;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-static {v0, p2, v1}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p2

    .line 108
    new-instance v0, Ll/n6e0;

    .line 109
    .line 110
    invoke-direct {v0, p3, p1, p0}, Ll/n6e0;-><init>(Ll/z20;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;)V

    .line 111
    .line 112
    .line 113
    new-instance p0, Ll/o6e0;

    .line 114
    .line 115
    invoke-direct {p0, p3, p1}, Ll/o6e0;-><init>(Ll/z20;Lcom/p1/mobile/android/app/Act;)V

    .line 116
    .line 117
    .line 118
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 123
    .line 124
    .line 125
    return-void
.end method
