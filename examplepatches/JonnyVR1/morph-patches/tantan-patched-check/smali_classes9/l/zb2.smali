.class public Ll/zb2;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/qct<",
        "Ll/oo2;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

.field public j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/e80<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/zb2;->k:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic J3(Ll/e80;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic K3(Ll/zb2;Ll/pmj;)Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zb2;->c4(Ll/pmj;)Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic L3(Ll/zb2;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zb2;->Z3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic M3(Ll/zb2;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zb2;->d4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic N3(Ll/zb2;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zb2;->b4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic O3(Ll/zb2;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zb2;->e4(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic P3(Ll/e80;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic R3(Ll/zb2;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zb2;->f4(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic S3(Ll/zb2;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zb2;->a4(Ll/vxj0;)V

    return-void
.end method

.method private synthetic Z3(Ll/vxj0;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/zb2;->W3(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private synthetic a4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zb2;->g4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->dismissSettingDialog()Ll/v3f$c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/sb2;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/sb2;-><init>(Ll/zb2;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->openSettingDialog()Ll/v3f$c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/tb2;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/tb2;-><init>(Ll/zb2;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->refreshSettingButtonRedDot()Ll/v3f$c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lrx/c;

    .line 83
    .line 84
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    new-instance v1, Ll/ub2;

    .line 89
    .line 90
    invoke-direct {v1, p0}, Ll/ub2;-><init>(Ll/zb2;)V

    .line 91
    .line 92
    .line 93
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 98
    .line 99
    .line 100
    new-instance v0, Ll/vb2;

    .line 101
    .line 102
    invoke-direct {v0, p0}, Ll/vb2;-><init>(Ll/zb2;)V

    .line 103
    .line 104
    .line 105
    const-class v1, Ll/pmj;

    .line 106
    .line 107
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->addModelToSettingAdapter()Ll/v3f$d;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    check-cast v0, Lrx/c;

    .line 125
    .line 126
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    new-instance v1, Ll/wb2;

    .line 131
    .line 132
    invoke-direct {v1}, Ll/wb2;-><init>()V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    new-instance v1, Ll/xb2;

    .line 140
    .line 141
    invoke-direct {v1, p0}, Ll/xb2;-><init>(Ll/zb2;)V

    .line 142
    .line 143
    .line 144
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->removeModelToSettingAdapter()Ll/v3f$d;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Lrx/c;

    .line 166
    .line 167
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    new-instance v1, Ll/yb2;

    .line 172
    .line 173
    invoke-direct {v1}, Ll/yb2;-><init>()V

    .line 174
    .line 175
    .line 176
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    new-instance v1, Ll/pb2;

    .line 181
    .line 182
    invoke-direct {v1, p0}, Ll/pb2;-><init>(Ll/zb2;)V

    .line 183
    .line 184
    .line 185
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public T3(Ll/e80;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/zb2;->U3(Ll/e80;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/zb2;->Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/zb2;->Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;->setModels(Ljava/util/List;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    new-instance p1, Ll/se3;

    .line 36
    .line 37
    const/16 v0, 0x320

    .line 38
    .line 39
    invoke-direct {p1, v0}, Ll/se3;-><init>(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Ljava/lang/CharSequence;

    .line 47
    .line 48
    const-string v1, "layered"

    .line 49
    .line 50
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    new-instance p1, Ll/fve0;

    .line 57
    .line 58
    invoke-direct {p1, v0}, Ll/fve0;-><init>(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Ljava/lang/Boolean;

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    if-eqz p1, :cond_1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {p0}, Ll/zb2;->V3()V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    return-void
.end method

.method public final U3(Ll/e80;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-virtual {p1}, Ll/kf2;->Y3()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_2

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ll/e80;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/kf2;->Y3()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v1}, Ll/kf2;->Y3()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    return v0

    .line 48
    :cond_2
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_3
    :goto_0
    return v0
.end method

.method public V3()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/zb2;->l1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->setSettingButtonRedDot()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final W3(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zb2;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/zb2;->i:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;->k0()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/zb2;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 17
    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->P(Ll/x20;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final X3()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zb2;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/c0s;

    .line 6
    .line 7
    sget v1, Ll/yec0;->v5:I

    .line 8
    .line 9
    invoke-direct {v0, p0, v1}, Ll/c0s;-><init>(Ll/xzs;I)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/zb2;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 13
    .line 14
    new-instance v1, Ll/ob2;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ob2;-><init>(Ll/zb2;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->h0(Ll/y20;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/zb2;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 23
    .line 24
    new-instance v1, Ll/qb2;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/qb2;-><init>(Ll/zb2;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/zb2;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 33
    .line 34
    new-instance v1, Ll/rb2;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/rb2;-><init>(Ll/zb2;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object p0, p0, Ll/zb2;->j:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 43
    .line 44
    return-object p0
.end method

.method public final Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zb2;->i:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :cond_0
    return-object p0
.end method

.method public final synthetic b4(Ll/vxj0;)V
    .locals 2

    .line 1
    new-instance p1, Ll/se3;

    .line 2
    .line 3
    const/16 v0, 0x320

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ll/se3;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Ljava/lang/CharSequence;

    .line 13
    .line 14
    const-string v1, "layered"

    .line 15
    .line 16
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    new-instance p1, Ll/fve0;

    .line 23
    .line 24
    invoke-direct {p1, v0}, Ll/fve0;-><init>(I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ljava/lang/Boolean;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    return-void

    .line 40
    :cond_0
    invoke-virtual {p0}, Ll/zb2;->V3()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final synthetic c4(Ll/pmj;)Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zb2;->i:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic d4(Landroid/view/View;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 2
    .line 3
    iput-object p1, p0, Ll/zb2;->i:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 4
    .line 5
    return-void
.end method

.method public final synthetic e4(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/zb2;->i4()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/zb2;->i:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;->l0()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onSettingDialogShow()Ll/v3f$c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final synthetic f4(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/zb2;->i:Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;->k0()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->onSettingDialogDismiss()Ll/v3f$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public g4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->dismissBubble()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "settingButtonBubble"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/zb2;->X3()Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public h4(Ll/e80;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/zb2;->Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/zb2;->Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iget-object p0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 33
    .line 34
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;->setModels(Ljava/util/List;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public final i4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/zb2;->Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/zb2;->Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object p0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;->setModels(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public l1()Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    :goto_0
    iget-object v3, p0, Ll/zb2;->k:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 7
    .line 8
    .line 9
    move-result v3

    .line 10
    if-ge v1, v3, :cond_2

    .line 11
    .line 12
    iget-object v3, p0, Ll/zb2;->k:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Ll/e80;

    .line 19
    .line 20
    invoke-virtual {v3}, Ll/kf2;->f4()Z

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    invoke-virtual {v3}, Ll/e80;->k4()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-nez v4, :cond_0

    .line 29
    .line 30
    if-eqz v3, :cond_1

    .line 31
    .line 32
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_2
    if-lez v2, :cond_3

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_3
    return v0
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/zb2;->k:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ll/i6t;->n()V

    .line 7
    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Ll/zb2;->W3(Z)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/zb2;->Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/zb2;->Y3()Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/LiveSettingNewBaseView;->j0()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
