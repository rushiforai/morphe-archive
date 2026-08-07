.class public Ll/tin0;
.super Ll/nin0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/nin0<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/nin0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic A6(Ll/tin0;Ll/fik0;)Ll/fik0$a;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/tin0;->F6(Ll/fik0;)Ll/fik0$a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B6(Ll/coj;Ll/l6o0;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Ll/l6o0;->c:Z

    .line 2
    .line 3
    iput-boolean v0, p0, Ll/coj;->a:Z

    .line 4
    .line 5
    iget-object p1, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 6
    .line 7
    iput-object p1, p0, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic C6(Ll/tin0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tin0;->H6(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic D6(Ll/tin0;Ll/hrk0$a;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tin0;->G6(Ll/hrk0$a;)V

    return-void
.end method

.method public static synthetic E6(Ll/coj;Ll/l6o0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/l6o0;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 2
    .line 3
    iput-object v0, p0, Ll/coj;->b:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 4
    .line 5
    iget-boolean p1, p1, Ll/l6o0;->c:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/coj;->a:Z

    .line 8
    .line 9
    return-void
.end method

.method private synthetic F6(Ll/fik0;)Ll/fik0$a;
    .locals 7

    .line 1
    new-instance v0, Ll/fik0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/rwn0;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/vp20;->k()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/vp20;->o()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v2

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
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object v4, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Ll/rwn0;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/rwn0;->A0()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Ll/rwn0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 68
    .line 69
    invoke-direct/range {v0 .. v6}, Ll/fik0$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-object v0
.end method


# virtual methods
.method public F4()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-static {p0}, Ll/cpj;->N(Ll/rwn0;)Ljava/util/ArrayList;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic G6(Ll/hrk0$a;)V
    .locals 0

    .line 1
    const/16 p1, 0x5dd

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tin0;->I6(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic H6(Ll/hrk0$a;)V
    .locals 0

    .line 1
    const/16 p1, 0x5df

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/tin0;->I6(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final I6(I)V
    .locals 6

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    const-string v2, ""

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Ll/oo2;->a2(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Ll/rwn0;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v3}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    if-eqz v1, :cond_0

    .line 39
    .line 40
    iget-object v2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 41
    .line 42
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    check-cast v1, Ll/rwn0;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1, v3}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    if-nez v1, :cond_1

    .line 59
    .line 60
    new-instance v1, Ll/h64;

    .line 61
    .line 62
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 63
    .line 64
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {v5}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v5

    .line 78
    invoke-direct {v1, v3, v4, v5}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    invoke-static {v1}, Ll/nsv;->f(Ljava/lang/Object;)Ll/nsv;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 88
    .line 89
    .line 90
    move-result-object v3

    .line 91
    check-cast v3, Ll/rwn0;

    .line 92
    .line 93
    invoke-virtual {v3}, Ll/rwn0;->W0()Z

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    const/4 v4, 0x0

    .line 98
    invoke-virtual {v1, v0, v4, v3}, Ll/nsv;->c(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)Ll/nsv;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    :cond_1
    iget-object v0, v1, Ll/nsv;->a:Ljava/lang/Object;

    .line 103
    .line 104
    check-cast v0, Ll/h64;

    .line 105
    .line 106
    new-instance v3, Ll/h64;

    .line 107
    .line 108
    iget-object v4, v0, Ll/h64;->a:Ljava/lang/String;

    .line 109
    .line 110
    iget-object v5, v0, Ll/h64;->b:Ljava/lang/String;

    .line 111
    .line 112
    iget-object v0, v0, Ll/h64;->c:Ljava/lang/String;

    .line 113
    .line 114
    invoke-direct {v3, v4, v5, v0}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    const-string v0, "gift-audience-none-voiceLiveMain"

    .line 118
    .line 119
    const/4 v4, 0x0

    .line 120
    invoke-static {v2, v0, v4}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v3, v0}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v1}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    new-instance v2, Ll/sin0;

    .line 133
    .line 134
    invoke-direct {v2, v0}, Ll/sin0;-><init>(Ll/coj;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v2}, Ll/l6o0;->a(Ll/y20;)V

    .line 138
    .line 139
    .line 140
    new-instance v1, Ll/cqj$a;

    .line 141
    .line 142
    invoke-direct {v1}, Ll/cqj$a;-><init>()V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1, v0}, Ll/cqj$a;->h(Ll/coj;)Ll/cqj$a;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-virtual {v0}, Ll/cqj$a;->d()Ll/cqj;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 158
    .line 159
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    new-instance v1, Ll/lx50;

    .line 164
    .line 165
    invoke-direct {v1}, Ll/lx50;-><init>()V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1, v0}, Ll/lx50;->h(Ll/cqj;)Ll/lx50;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0, p1}, Ll/lx50;->i(I)Ll/lx50;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    const-string v0, "voiceLiveMain"

    .line 177
    .line 178
    invoke-virtual {p1, v0}, Ll/lx50;->j(Ljava/lang/String;)Ll/lx50;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    return-void
.end method

.method public J4()Ll/cqj;
    .locals 6

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
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/rwn0;->P2()Ll/hrk0;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const-string v2, "gift-audience-none-voiceLiveMain"

    .line 28
    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const-string v1, ""

    .line 36
    .line 37
    if-eqz p0, :cond_0

    .line 38
    .line 39
    move-object v2, v1

    .line 40
    :cond_0
    const/4 p0, 0x0

    .line 41
    invoke-static {v1, v2, p0}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    new-instance v1, Ll/h64;

    .line 46
    .line 47
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 56
    .line 57
    invoke-direct {v1, v2, v3, v0}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v1, p0}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    goto :goto_0

    .line 65
    :cond_1
    iget-object v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 66
    .line 67
    iget v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 68
    .line 69
    invoke-static {v0, v2, v3}, Ll/p54;->b(Ljava/lang/String;Ljava/lang/String;I)Ll/p54;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    new-instance v2, Ll/h64;

    .line 74
    .line 75
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 76
    .line 77
    iget-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 78
    .line 79
    iget-object v5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 80
    .line 81
    invoke-direct {v2, v3, v4, v5}, Ll/h64;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v2, v0}, Ll/coj;->c(Ll/h64;Ll/p54;)Ll/coj;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    check-cast p0, Ll/rwn0;

    .line 93
    .line 94
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {p0, v1}, Ll/hrk0;->m(Ljava/lang/String;)Ll/nsv;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-static {p0}, Ll/l6o0;->c(Ll/nsv;)Ll/l6o0;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    new-instance v1, Ll/rin0;

    .line 109
    .line 110
    invoke-direct {v1, v0}, Ll/rin0;-><init>(Ll/coj;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v1}, Ll/l6o0;->a(Ll/y20;)V

    .line 114
    .line 115
    .line 116
    move-object p0, v0

    .line 117
    :goto_0
    new-instance v0, Ll/cqj$a;

    .line 118
    .line 119
    invoke-direct {v0}, Ll/cqj$a;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0, p0}, Ll/cqj$a;->h(Ll/coj;)Ll/cqj$a;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-virtual {p0}, Ll/cqj$a;->d()Ll/cqj;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0
.end method

.method public J6()V
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
    invoke-virtual {v0}, Ll/oo2;->M0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "chatAssistant"

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/rwn0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    new-instance v1, Ll/oin0;

    .line 38
    .line 39
    invoke-direct {v1, p0}, Ll/oin0;-><init>(Ll/tin0;)V

    .line 40
    .line 41
    .line 42
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/rwn0;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/oo2;->M0()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v1, "chatAssistantFixAnchorShowPackage"

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ll/rwn0;

    .line 73
    .line 74
    invoke-virtual {v0}, Ll/rwn0;->Q2()Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lrx/c;->first()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/pin0;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/pin0;-><init>(Ll/tin0;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    :cond_1
    return-void
.end method

.method public K4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLiveMain"

    .line 2
    .line 3
    return-object p0
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/nin0;->T()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qin0;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qin0;-><init>(Ll/tin0;)V

    .line 7
    .line 8
    .line 9
    const-class v1, Ll/fik0;

    .line 10
    .line 11
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public j3()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    return-object p0
.end method

.method public t()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/bjs;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/tin0;->J6()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
