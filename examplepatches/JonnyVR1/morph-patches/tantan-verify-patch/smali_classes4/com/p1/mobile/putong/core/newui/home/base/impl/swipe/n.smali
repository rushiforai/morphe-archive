.class public Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;
.super Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;
.source "SourceFile"


# instance fields
.field public j:Ll/jxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy;-><init>(Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    new-instance p2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v0, "has_shown_crop_picture_guide_dlg_"

    .line 9
    .line 10
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-direct {p1, p2, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;->j:Ll/jxd0;

    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public q(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;)Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;
    .locals 7

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->d:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 4
    .line 5
    if-ne v0, v1, :cond_6

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 8
    .line 9
    if-nez v0, :cond_6

    .line 10
    .line 11
    invoke-static {}, Ll/spl0;->F()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;->j:Ll/jxd0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Boolean;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_6

    .line 30
    .line 31
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-eqz v0, :cond_5

    .line 38
    .line 39
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-eqz v0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    move v1, v0

    .line 53
    :goto_0
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 54
    .line 55
    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-ge v1, v2, :cond_5

    .line 66
    .line 67
    iget-object v2, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->c:Ll/ik4;

    .line 68
    .line 69
    invoke-virtual {v2}, Ll/ik4;->d()Lcom/p1/mobile/putong/data/User;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;->t(Lcom/p1/mobile/putong/data/Picture;)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-eqz v2, :cond_4

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 86
    .line 87
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 92
    .line 93
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 94
    .line 95
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-wide v2, v2, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 100
    .line 101
    double-to-long v2, v2

    .line 102
    invoke-static {}, Ll/spl0;->F()Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-nez v4, :cond_1

    .line 107
    .line 108
    invoke-static {}, Ll/pzi0;->o()J

    .line 109
    .line 110
    .line 111
    move-result-wide v4

    .line 112
    const/4 v6, 0x7

    .line 113
    invoke-static {v4, v5, v2, v3, v6}, Ll/tzi0;->h(JJI)Z

    .line 114
    .line 115
    .line 116
    move-result v2

    .line 117
    if-nez v2, :cond_1

    .line 118
    .line 119
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 120
    .line 121
    return-object p0

    .line 122
    :cond_1
    :goto_1
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 123
    .line 124
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-ge v0, v2, :cond_3

    .line 129
    .line 130
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/data/User;->picture(I)Lcom/p1/mobile/putong/data/Picture;

    .line 131
    .line 132
    .line 133
    move-result-object v2

    .line 134
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;->t(Lcom/p1/mobile/putong/data/Picture;)Z

    .line 135
    .line 136
    .line 137
    move-result v2

    .line 138
    if-eqz v2, :cond_2

    .line 139
    .line 140
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 141
    .line 142
    return-object p0

    .line 143
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;->j:Ll/jxd0;

    .line 147
    .line 148
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    iget-object v0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->b:Lcom/p1/mobile/putong/core/newui/home/b;

    .line 154
    .line 155
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/home/b;->K1()Lcom/p1/mobile/putong/core/newui/main/NewMainAct;

    .line 156
    .line 157
    .line 158
    new-instance v0, Ll/l4g0;

    .line 159
    .line 160
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n$a;

    .line 161
    .line 162
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;)V

    .line 163
    .line 164
    .line 165
    invoke-direct {v0, v1}, Ll/l4g0;-><init>(Ll/e6m;)V

    .line 166
    .line 167
    .line 168
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 169
    .line 170
    .line 171
    move-result-object p0

    .line 172
    invoke-virtual {p0}, Ll/pk50;->f()Ll/rj50;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    sget-object v1, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_profile_picture_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 177
    .line 178
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    new-instance v2, Lorg/json/JSONObject;

    .line 183
    .line 184
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0, v1, v2}, Ll/rj50;->U(Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {v0, p0}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 195
    .line 196
    .line 197
    const/4 p0, 0x1

    .line 198
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/j$a;->g:Z

    .line 199
    .line 200
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->direct:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 201
    .line 202
    return-object p0

    .line 203
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 208
    .line 209
    return-object p0

    .line 210
    :cond_6
    sget-object p0, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;->refuse:Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/SwipeDialogOmsLimitStrategy$HandleState;

    .line 211
    .line 212
    return-object p0
.end method

.method public final t(Lcom/p1/mobile/putong/data/Picture;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/h9n;->c()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/base/impl/swipe/n;->u(Lcom/p1/mobile/putong/data/Picture;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    xor-int/2addr p0, v1

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 15
    .line 16
    iget p1, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 17
    .line 18
    int-to-float p1, p1

    .line 19
    const/high16 v0, 0x3f800000    # 1.0f

    .line 20
    .line 21
    mul-float/2addr p1, v0

    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 23
    .line 24
    int-to-float p0, p0

    .line 25
    div-float/2addr p1, p0

    .line 26
    const p0, 0x3f4ccccd    # 0.8f

    .line 27
    .line 28
    .line 29
    sub-float/2addr p1, p0

    .line 30
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    const p1, 0x3d75c28f    # 0.06f

    .line 35
    .line 36
    .line 37
    cmpg-float p0, p0, p1

    .line 38
    .line 39
    if-gez p0, :cond_1

    .line 40
    .line 41
    return v1

    .line 42
    :cond_1
    const/4 p0, 0x0

    .line 43
    return p0
.end method

.method public final u(Lcom/p1/mobile/putong/data/Picture;)Z
    .locals 1

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 2
    .line 3
    iget p1, p0, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 4
    .line 5
    int-to-float p1, p1

    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr p1, v0

    .line 9
    iget p0, p0, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 10
    .line 11
    int-to-float p0, p0

    .line 12
    div-float/2addr p1, p0

    .line 13
    sub-float/2addr p1, v0

    .line 14
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const p1, 0x3d4ccccd    # 0.05f

    .line 19
    .line 20
    .line 21
    cmpg-float p0, p0, p1

    .line 22
    .line 23
    if-gez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method
