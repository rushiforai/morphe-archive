.class public Ll/yat;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/dw40;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Z

.field public j:Z


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic J3(Ll/yat;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yat;->N3(Z)V

    return-void
.end method

.method public static synthetic K3(Ll/yat;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yat;->O3(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final L3()V
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/dw40;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->Y0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ll/wrv;->P(Landroid/content/Context;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 28
    .line 29
    invoke-virtual {v0}, Ll/wrv;->C()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :cond_1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_2

    .line 48
    .line 49
    goto/16 :goto_1

    .line 50
    .line 51
    :cond_2
    new-instance v0, Ll/v24;

    .line 52
    .line 53
    const/16 v1, 0xd48

    .line 54
    .line 55
    const/4 v2, 0x2

    .line 56
    invoke-direct {v0, v1, v2}, Ll/v24;-><init>(II)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Ljava/lang/Boolean;

    .line 64
    .line 65
    new-instance v3, Ll/jc10;

    .line 66
    .line 67
    invoke-direct {v3, v1, v2}, Ll/jc10;-><init>(II)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v3}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Ljava/lang/Boolean;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-nez v0, :cond_6

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_3

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_3
    new-instance v0, Ll/tyb;

    .line 90
    .line 91
    const/16 v1, 0x7d0

    .line 92
    .line 93
    invoke-direct {v0, v1}, Ll/tyb;-><init>(I)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    check-cast v0, Ll/qwl;

    .line 101
    .line 102
    new-instance v2, Ll/gyb;

    .line 103
    .line 104
    invoke-direct {v2, v1}, Ll/gyb;-><init>(I)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0, v2}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Ll/fyb;

    .line 112
    .line 113
    new-instance v3, Ll/npc0;

    .line 114
    .line 115
    invoke-direct {v3, v1}, Ll/npc0;-><init>(I)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v3}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    check-cast v1, Ljava/lang/String;

    .line 123
    .line 124
    new-instance v3, Ll/hti;

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    check-cast v4, Ll/dw40;

    .line 131
    .line 132
    invoke-virtual {p0}, Ll/i6t;->n3()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v6

    .line 140
    if-eqz v6, :cond_4

    .line 141
    .line 142
    iget v2, v2, Ll/fyb;->c:F

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_4
    const/4 v2, 0x0

    .line 146
    :goto_0
    invoke-direct {v3, v4, v5, v1, v2}, Ll/hti;-><init>(Ll/oo2;Ljava/lang/String;Ljava/lang/String;F)V

    .line 147
    .line 148
    .line 149
    if-nez v0, :cond_5

    .line 150
    .line 151
    goto :goto_1

    .line 152
    :cond_5
    invoke-virtual {v3, v0}, Ll/hti;->i(Ll/qwl;)V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ll/pzm;->c()Ll/pzm;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    const/4 v1, 0x0

    .line 160
    invoke-virtual {v0, v3, v1}, Ll/pzm;->f(Ll/hti;Z)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    iput-boolean v0, p0, Ll/yat;->j:Z

    .line 165
    .line 166
    :cond_6
    :goto_1
    return-void
.end method

.method public final M3()V
    .locals 4

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/nti;->b(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Ll/jxd0;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "live_out_app_float_permission_dialog_shown"

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object v2, Ll/zrv;->a:Ll/wrv;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/wrv;->D0()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    :goto_0
    return-void

    .line 54
    :cond_1
    new-instance v1, Ll/th0$a;

    .line 55
    .line 56
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 59
    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    invoke-virtual {v1, v2}, Ll/th0$a;->h(Z)Ll/th0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    const-string v3, "\u60ac\u6d6e\u7a97\u64ad\u653e,\u7cbe\u5f69\u4e0d\u65ad"

    .line 67
    .line 68
    invoke-virtual {v1, v3}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const-string v3, "\u5f00\u542f\u60ac\u6d6e\u7a97\u64ad\u653e\u529f\u80fd\uff0c\u9000\u5230\u540e\u53f0\u8fd8\u80fd\u7ee7\u7eed\u89c2\u770b\u7cbe\u5f69\u76f4\u64ad"

    .line 73
    .line 74
    invoke-virtual {v1, v3}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const-string v3, "\u6682\u4e0d\u4f7f\u7528"

    .line 79
    .line 80
    invoke-virtual {v1, v3}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const-string v3, "\u7acb\u5373\u5f00\u542f"

    .line 85
    .line 86
    invoke-virtual {v1, v3}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    new-instance v3, Ll/xat;

    .line 91
    .line 92
    invoke-direct {v3, p0}, Ll/xat;-><init>(Ll/yat;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v1, v3}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {p0, v2}, Ll/th0$a;->b(Z)Ll/th0$a;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 108
    .line 109
    .line 110
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 111
    .line 112
    invoke-virtual {v0, p0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public final N3(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-boolean p1, p0, Ll/yat;->i:Z

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/yat;->M3()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-boolean p1, p0, Ll/yat;->j:Z

    .line 11
    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/yat;->P3()V

    .line 15
    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    iput-boolean p1, p0, Ll/yat;->j:Z

    .line 19
    .line 20
    :cond_1
    return-void

    .line 21
    :cond_2
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Ll/yat;->i:Z

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/yat;->L3()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic O3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/nti;->d()Ll/nti;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/nti;->a(Landroid/content/Context;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final P3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->switchMute()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->updatePlayerContainer()Ll/v3f$c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/yat;->i:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/yat;->j:Z

    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->front()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/wat;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/wat;-><init>(Ll/yat;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 22
    .line 23
    .line 24
    return-void
.end method
