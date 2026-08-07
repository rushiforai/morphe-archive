.class public Ll/f2n0;
.super Ll/h2n0;
.source "SourceFile"


# instance fields
.field public final f:Ll/dzm0;


# direct methods
.method public constructor <init>(Ll/xzm0;Ll/u1n0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/h2n0;-><init>(Ll/xzm0;Ll/u1n0;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/dzm0;

    .line 5
    .line 6
    invoke-direct {p1, p0}, Ll/dzm0;-><init>(Ll/f2n0;)V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/f2n0;->f:Ll/dzm0;

    .line 10
    .line 11
    invoke-virtual {p0, p2}, Ll/h2n0;->d(Ll/u1n0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic j(Ll/f2n0;Landroid/app/Activity;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f2n0;->n(Landroid/app/Activity;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k(Ll/f2n0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/f2n0;->o()V

    return-void
.end method


# virtual methods
.method public c(I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->foreground_()Lcom/p1/mobile/android/app/Act$r;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Landroid/app/Activity;

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0, p1}, Ll/h2n0;->b(I)V

    .line 22
    .line 23
    .line 24
    if-eqz p1, :cond_4

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    if-eq p1, v1, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    invoke-virtual {p0}, Ll/h2n0;->a()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p0, v0, v1}, Ll/h2n0;->h(Landroid/content/Context;I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 46
    .line 47
    .line 48
    :cond_3
    :goto_1
    return-void

    .line 49
    :cond_4
    const/4 p1, 0x0

    .line 50
    invoke-virtual {p0, v0, p1}, Ll/h2n0;->h(Landroid/content/Context;I)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public e(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u1n0;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, p1, v0}, Ll/h2n0;->h(Landroid/content/Context;I)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-virtual {p0, p1}, Ll/f2n0;->m(Landroid/app/Activity;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public f(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    instance-of v0, p1, Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/f2n0;->f:Ll/dzm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/h2n0;->a()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    check-cast p1, Landroid/app/Activity;

    .line 12
    .line 13
    iget-object p0, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/u1n0;->l()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, v1, p1, p0}, Ll/dzm0;->c(ILandroid/app/Activity;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public g(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/h2n0;->h(Landroid/content/Context;I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final l(Landroid/app/Activity;Ljava/lang/String;)Z
    .locals 1

    .line 1
    instance-of p0, p1, Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz p0, :cond_3

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1}, Landroid/app/Activity;->getTaskId()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Ljava/util/ArrayList;

    .line 24
    .line 25
    new-instance p1, Ljava/util/ArrayList;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    if-nez p2, :cond_3

    .line 35
    .line 36
    invoke-static {p0}, Lcom/google/common/collect/Lists;->q(Ljava/util/List;)Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-eqz p2, :cond_3

    .line 49
    .line 50
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p2

    .line 54
    check-cast p2, Lcom/p1/mobile/android/app/Act$r;

    .line 55
    .line 56
    iget-object v0, p2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_0

    .line 63
    .line 64
    iget-object v0, p2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 65
    .line 66
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_0

    .line 75
    .line 76
    iget-object v0, p2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    instance-of v0, v0, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallAct;

    .line 83
    .line 84
    if-eqz v0, :cond_2

    .line 85
    .line 86
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    if-nez p0, :cond_3

    .line 91
    .line 92
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-eqz p1, :cond_1

    .line 101
    .line 102
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Landroid/app/Activity;

    .line 107
    .line 108
    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    .line 109
    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_1
    const/4 p0, 0x1

    .line 113
    return p0

    .line 114
    :cond_2
    iget-object p2, p2, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 115
    .line 116
    invoke-virtual {p2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    check-cast p2, Landroid/app/Activity;

    .line 121
    .line 122
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_3
    const/4 p0, 0x0

    .line 127
    return p0
.end method

.method public final m(Landroid/app/Activity;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallAct;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0, p1, v1}, Ll/h2n0;->h(Landroid/content/Context;I)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/h2n0;->a()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    const/4 v0, 0x2

    .line 17
    invoke-virtual {p0, p1, v0}, Ll/h2n0;->h(Landroid/content/Context;I)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_1
    iget-object v0, p0, Ll/f2n0;->f:Ll/dzm0;

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/h2n0;->a()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    iget-object p0, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/u1n0;->l()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, v1, p1, p0}, Ll/dzm0;->c(ILandroid/app/Activity;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic n(Landroid/app/Activity;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/h2n0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u1n0;->l()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, p1, v0}, Ll/f2n0;->l(Landroid/app/Activity;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/core/newui/voicecall/VoiceCallAct;->a2(Landroid/content/Context;)Landroid/content/Intent;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 21
    .line 22
    .line 23
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 24
    .line 25
    return-object p0
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/h2n0;->b:Ll/xzm0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Ll/xzm0;->o(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p(Landroid/app/Activity;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "voice_entry_floating"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/qzm0;->o(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-interface {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ll/nam;->b()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    const-string p0, "\u5f53\u524d\u6b63\u5728\u8bed\u804a\u4e2d\uff0c\u65e0\u6cd5\u8bed\u97f3\u7535\u8bdd"

    .line 25
    .line 26
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    new-instance v0, Ll/d2n0;

    .line 31
    .line 32
    invoke-direct {v0, p0, p1}, Ll/d2n0;-><init>(Ll/f2n0;Landroid/app/Activity;)V

    .line 33
    .line 34
    .line 35
    new-instance p1, Ll/e2n0;

    .line 36
    .line 37
    invoke-direct {p1, p0}, Ll/e2n0;-><init>(Ll/f2n0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, p1}, Ll/w1n0;->a(Ll/pcj;Ll/x20;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
