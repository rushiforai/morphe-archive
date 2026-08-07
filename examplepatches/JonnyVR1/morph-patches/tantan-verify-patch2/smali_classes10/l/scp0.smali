.class public Ll/scp0;
.super Ll/m1m0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/m1m0<",
        "TD;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/m1m0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d4(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e4(Ll/scp0;Ll/nfn0;)Lkotlin/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/scp0;->f4(Ll/nfn0;)Lkotlin/Pair;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->N1(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public R3(Ll/hrk0$a;)V
    .locals 3

    .line 1
    iget v0, p1, Ll/hrk0$a;->b:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->setData(Ll/hrk0;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {p1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/scp0;->l4(Ll/hrk0;)V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const/4 v2, 0x3

    .line 38
    if-ne v0, v2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/hrk0$a;->a()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 47
    .line 48
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/scp0;->k4(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 54
    .line 55
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/rwn0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->setData(Ll/hrk0;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    iget v0, p1, Ll/hrk0$a;->b:I

    .line 72
    .line 73
    const/4 v2, 0x2

    .line 74
    if-ne v0, v2, :cond_2

    .line 75
    .line 76
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 79
    .line 80
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ll/rwn0;

    .line 85
    .line 86
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 91
    .line 92
    invoke-virtual {v0, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_2
    const/4 v2, 0x4

    .line 97
    if-ne v0, v2, :cond_3

    .line 98
    .line 99
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 100
    .line 101
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ll/rwn0;

    .line 108
    .line 109
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->setData(Ll/hrk0;)V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_3
    const/4 v2, 0x5

    .line 118
    if-ne v0, v2, :cond_4

    .line 119
    .line 120
    iget-object v0, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 121
    .line 122
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 123
    .line 124
    invoke-virtual {p0, v0}, Ll/scp0;->k4(I)V

    .line 125
    .line 126
    .line 127
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 128
    .line 129
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    check-cast v2, Ll/rwn0;

    .line 136
    .line 137
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 138
    .line 139
    .line 140
    move-result-object v2

    .line 141
    iget-object p1, p1, Ll/hrk0$a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 142
    .line 143
    invoke-virtual {v0, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 144
    .line 145
    .line 146
    :cond_4
    :goto_0
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 147
    .line 148
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Ll/rwn0;

    .line 155
    .line 156
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_6

    .line 161
    .line 162
    invoke-static {p0}, Ll/i9o0;->h(Ll/i6t;)Z

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    if-eqz p0, :cond_5

    .line 167
    .line 168
    goto :goto_1

    .line 169
    :cond_5
    const/4 v1, 0x0

    .line 170
    :cond_6
    :goto_1
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->w0(Z)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/ydn0;->m(Ll/i6t;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/tkp0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Ll/tkp0;-><init>(Ll/dum;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public U3(Ll/nsv;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object p1, p1, Ll/nsv;->a:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p1, Ll/h64;

    .line 14
    .line 15
    iget-object p1, p1, Ll/h64;->a:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ll/rwn0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->t2(Ll/hrk0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public V1(Ll/nsv;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->z0(Ll/nsv;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public V3(Ll/nsv;Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;ZLjava/lang/String;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Ll/nsv<",
            "Ll/h64;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Z",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    if-eqz p3, :cond_3

    .line 2
    .line 3
    if-eqz p4, :cond_3

    .line 4
    .line 5
    iget p1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 6
    .line 7
    iget p2, p4, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 8
    .line 9
    sub-int p6, p1, p2

    .line 10
    .line 11
    const-string v0, ""

    .line 12
    .line 13
    const/4 v1, 0x5

    .line 14
    const/4 v2, 0x1

    .line 15
    if-ne p6, v2, :cond_1

    .line 16
    .line 17
    if-eq p2, v2, :cond_1

    .line 18
    .line 19
    if-eq p2, v1, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 24
    .line 25
    if-eqz p5, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move-object p7, v0

    .line 29
    :goto_0
    invoke-virtual {p0, p3, p7}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    sub-int/2addr p2, p1

    .line 34
    if-ne p2, v2, :cond_3

    .line 35
    .line 36
    if-eq p1, v2, :cond_3

    .line 37
    .line 38
    if-eq p1, v1, :cond_3

    .line 39
    .line 40
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 41
    .line 42
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 43
    .line 44
    if-eqz p5, :cond_2

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move-object p7, v0

    .line 48
    :goto_1
    invoke-virtual {p0, p4, p7}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->p0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_3
    return-void
.end method

.method public final f4(Ll/nfn0;)Lkotlin/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nfn0;",
            ")",
            "Lkotlin/Pair<",
            "[I",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->getDeputyViewList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p1, p1, Ll/nfn0;->c:I

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;

    .line 16
    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    new-instance p0, Lkotlin/Pair;

    .line 20
    .line 21
    const/4 p1, 0x2

    .line 22
    new-array p1, p1, [I

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-direct {p0, p1, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_0
    new-instance p1, Lkotlin/Pair;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-static {v0}, Ll/i0k;->b(Landroid/view/View;)[I

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyItemView;->e:Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/avatar/CommonMaskAvatarView;->getRealAvatarView()Lcom/p1/mobile/putong/live/livingroom/common/avatar/MysteryAvatarView;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-direct {p1, v0, p0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 60
    .line 61
    .line 62
    return-object p1
.end method

.method public g4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->clearPopularity(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/rcp0;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/rcp0;-><init>()V

    .line 22
    .line 23
    .line 24
    new-instance v1, Ll/wnt;

    .line 25
    .line 26
    invoke-direct {v1}, Ll/wnt;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public h4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/rwn0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p0, v0, p1}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    :goto_0
    return-void
.end method

.method public i4(Ljava/lang/Integer;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    check-cast v1, Ll/rwn0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const-string v2, "\u6682\u65e0\u6cd5\u7533\u8bf7\u4e0a\u623f\u4e3b\u9ea6\u4f4d"

    .line 21
    .line 22
    if-eqz v1, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Ll/rwn0;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/hrk0;->r()Ll/ado0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 39
    .line 40
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v1, v3}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    check-cast v3, Ll/rwn0;

    .line 53
    .line 54
    invoke-virtual {v3}, Ll/rwn0;->p()Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    if-nez v3, :cond_2

    .line 59
    .line 60
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMember;->isManager:Z

    .line 61
    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    if-nez p0, :cond_1

    .line 70
    .line 71
    invoke-static {v2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    const-string p0, "\u5df2\u5728\u9ea6\u4e0a"

    .line 76
    .line 77
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->showMemberManagerDialog()Ll/v3f$d;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 92
    .line 93
    .line 94
    return-void

    .line 95
    :cond_3
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_4

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    check-cast v1, Ll/rwn0;

    .line 106
    .line 107
    invoke-virtual {v1}, Ll/rwn0;->p()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_4

    .line 112
    .line 113
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MemberManagerEvent:Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MemberManagerEvent;->showMemberManagerDialog()Ll/v3f$d;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-nez v0, :cond_5

    .line 132
    .line 133
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Ll/rwn0;

    .line 138
    .line 139
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_5

    .line 144
    .line 145
    invoke-static {v2}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_5
    new-instance v0, Ll/bzm0;

    .line 150
    .line 151
    invoke-direct {v0}, Ll/bzm0;-><init>()V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    invoke-virtual {v0, p1}, Ll/bzm0;->g(I)Ll/bzm0;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 166
    .line 167
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public j4(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->openUserLeaderBoard()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    :goto_0
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 26
    .line 27
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;->y0(Ll/nsv;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public k4(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->Q3(IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l4(Ll/hrk0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/m1m0;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/VoiceVirtualNineDeputyWidgetView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/call/view/BaseVoiceVirtualDeputyWidgetView;->t()V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/qcp0;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/qcp0;-><init>(Ll/scp0;)V

    .line 14
    .line 15
    .line 16
    const-class v1, Ll/nfn0;

    .line 17
    .line 18
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
