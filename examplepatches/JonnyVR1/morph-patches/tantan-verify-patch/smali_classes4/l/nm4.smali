.class public Ll/nm4;
.super Ll/h4;
.source "SourceFile"


# direct methods
.method public constructor <init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/h4;-><init>(Ll/rql;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "daily_picks"

    .line 2
    .line 3
    return-object p0
.end method

.method public h()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/rql;->z0()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_4

    .line 9
    .line 10
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/rql;->Z()Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    if-eqz v0, :cond_4

    .line 17
    .line 18
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/rql;->m0()Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-eqz v0, :cond_4

    .line 25
    .line 26
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 27
    .line 28
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_4

    .line 33
    .line 34
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/rql;->o0()Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    if-eqz v0, :cond_4

    .line 41
    .line 42
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 43
    .line 44
    invoke-interface {v0}, Ll/rql;->z0()Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-nez v0, :cond_0

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :cond_0
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 53
    .line 54
    invoke-interface {v0}, Ll/rql;->g()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 61
    .line 62
    invoke-interface {v0}, Ll/rql;->z0()Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->Companion:Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper$a;->b()Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/vip/picks/PicksHelper;->q()V

    .line 79
    .line 80
    .line 81
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 84
    .line 85
    iget-object v2, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Ll/ela;->p3(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_1

    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->k1:Ll/ela;

    .line 98
    .line 99
    iget-object v2, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 100
    .line 101
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Ll/ela;->J3(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/h4;->a:Lcom/p1/mobile/putong/data/User;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 109
    .line 110
    const-string v2, "other_user_id"

    .line 111
    .line 112
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    filled-new-array {v0}, [Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    const-string v2, "e_card_daily_picks"

    .line 121
    .line 122
    const-string v3, "p_suggest_users_home_view"

    .line 123
    .line 124
    invoke-static {v2, v3, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 125
    .line 126
    .line 127
    :cond_1
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 128
    .line 129
    invoke-interface {v0}, Ll/rql;->Z()Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 137
    .line 138
    invoke-interface {v0}, Ll/rql;->m0()Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 146
    .line 147
    invoke-interface {v0}, Ll/rql;->t0()Lv/VText;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 155
    .line 156
    invoke-interface {v0}, Ll/rql;->o()Landroid/widget/ImageView;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    if-eqz v0, :cond_2

    .line 165
    .line 166
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 167
    .line 168
    invoke-interface {v0}, Ll/rql;->o()Landroid/widget/ImageView;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 173
    .line 174
    .line 175
    :cond_2
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 176
    .line 177
    invoke-interface {v0}, Ll/rql;->w()Lv/VDraweeView;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    if-eqz v0, :cond_3

    .line 186
    .line 187
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 188
    .line 189
    invoke-interface {v0}, Ll/rql;->w()Lv/VDraweeView;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 194
    .line 195
    .line 196
    :cond_3
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 197
    .line 198
    invoke-interface {v0}, Ll/rql;->o0()Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 203
    .line 204
    .line 205
    iget-object v0, p0, Ll/h4;->c:Ll/rql;

    .line 206
    .line 207
    invoke-interface {v0}, Ll/rql;->z0()Landroid/view/View;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    const/4 v1, 0x1

    .line 212
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 213
    .line 214
    .line 215
    iget-object p0, p0, Ll/h4;->c:Ll/rql;

    .line 216
    .line 217
    invoke-interface {p0}, Ll/rql;->i0()V

    .line 218
    .line 219
    .line 220
    :cond_4
    :goto_0
    return v1
.end method
