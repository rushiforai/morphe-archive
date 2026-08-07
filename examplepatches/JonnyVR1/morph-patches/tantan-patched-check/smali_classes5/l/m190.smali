.class public Ll/m190;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;
    .locals 7

    .line 1
    invoke-static {p1}, Ll/wib0;->x(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Ll/m190;->h(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    :goto_0
    move v2, v0

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    invoke-static {p1}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {p0}, Ll/m190;->c(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-static {p0}, Ll/m190;->e(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    goto :goto_0

    .line 35
    :cond_2
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    invoke-static {p0}, Ll/m190;->b(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    goto :goto_0

    .line 46
    :cond_3
    invoke-static {p1}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    invoke-static {p0}, Ll/m190;->d(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    goto :goto_0

    .line 57
    :cond_4
    invoke-static {p1}, Ll/wib0;->u(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_5

    .line 62
    .line 63
    invoke-static {p0}, Ll/m190;->f(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    goto :goto_0

    .line 68
    :cond_5
    invoke-static {p0}, Ll/m190;->g(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    goto :goto_0

    .line 73
    :goto_1
    invoke-static {p1, p0}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 78
    .line 79
    if-ne p0, v1, :cond_6

    .line 80
    .line 81
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_6

    .line 86
    .line 87
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_6

    .line 100
    .line 101
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 102
    .line 103
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Ns:I

    .line 104
    .line 105
    const/4 v4, 0x5

    .line 106
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-virtual {v1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    :goto_2
    move-object v3, v1

    .line 119
    goto :goto_3

    .line 120
    :cond_6
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    goto :goto_2

    .line 129
    :goto_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->see_who_likes_me:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 130
    .line 131
    if-ne p0, v1, :cond_8

    .line 132
    .line 133
    invoke-static {p1}, Ll/wib0;->q(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-nez v1, :cond_7

    .line 138
    .line 139
    invoke-static {p1}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-eqz v1, :cond_8

    .line 144
    .line 145
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 146
    .line 147
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Wh:I

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    :goto_4
    move-object v4, v0

    .line 154
    goto :goto_6

    .line 155
    :cond_8
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->accelerate_pairing:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 156
    .line 157
    if-ne p0, v1, :cond_9

    .line 158
    .line 159
    invoke-static {p1}, Ll/wib0;->o(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    if-eqz v1, :cond_9

    .line 164
    .line 165
    const-string v0, "30\u5206\u949f\u65a9\u83b7\u6700\u591a10\u500d\u914d\u5bf9\uff01"

    .line 166
    .line 167
    goto :goto_4

    .line 168
    :cond_9
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->online_match_tickets:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 169
    .line 170
    if-ne p0, v1, :cond_b

    .line 171
    .line 172
    invoke-static {}, Ll/c17;->u0()Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-eqz v0, :cond_a

    .line 177
    .line 178
    const-string v0, "\u4ed6"

    .line 179
    .line 180
    goto :goto_5

    .line 181
    :cond_a
    const-string v0, "\u5979"

    .line 182
    .line 183
    :goto_5
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    const-string v1, "\u6bcf\u59293\u6b21\uff0c\u548c\u9644\u8fd1\u5728\u7ebf\u7684%s\u7acb\u5373\u5f00\u804a"

    .line 188
    .line 189
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    goto :goto_4

    .line 194
    :cond_b
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    goto :goto_4

    .line 203
    :goto_6
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;

    .line 204
    .line 205
    move-object v5, p0

    .line 206
    move-object v6, p1

    .line 207
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/vip/privilege/content/item/PrivilegeDescListItem$a;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 208
    .line 209
    .line 210
    return-object v1
.end method

.method public static b(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 3
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget v0, Ll/dbc0;->El:I

    .line 2
    .line 3
    invoke-static {}, Ll/s7a;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    sget-object v2, Ll/m190$a;->a:[I

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    aget p0, v2, p0

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    if-eq p0, v2, :cond_d

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    if-eq p0, v2, :cond_b

    .line 20
    .line 21
    const/16 v2, 0xb

    .line 22
    .line 23
    if-eq p0, v2, :cond_a

    .line 24
    .line 25
    const/16 v2, 0xe

    .line 26
    .line 27
    if-eq p0, v2, :cond_8

    .line 28
    .line 29
    const/16 v2, 0x13

    .line 30
    .line 31
    if-eq p0, v2, :cond_6

    .line 32
    .line 33
    const/16 v2, 0x1a

    .line 34
    .line 35
    if-eq p0, v2, :cond_4

    .line 36
    .line 37
    const/16 v2, 0x1b

    .line 38
    .line 39
    if-eq p0, v2, :cond_2

    .line 40
    .line 41
    packed-switch p0, :pswitch_data_0

    .line 42
    .line 43
    .line 44
    return v0

    .line 45
    :pswitch_0
    sget p0, Ll/dbc0;->el:I

    .line 46
    .line 47
    return p0

    .line 48
    :pswitch_1
    if-eqz v1, :cond_0

    .line 49
    .line 50
    sget p0, Ll/dbc0;->Vi:I

    .line 51
    .line 52
    return p0

    .line 53
    :cond_0
    sget p0, Ll/dbc0;->Jl:I

    .line 54
    .line 55
    return p0

    .line 56
    :pswitch_2
    sget p0, Ll/dbc0;->Wk:I

    .line 57
    .line 58
    return p0

    .line 59
    :pswitch_3
    if-eqz v1, :cond_1

    .line 60
    .line 61
    sget p0, Ll/dbc0;->Ti:I

    .line 62
    .line 63
    return p0

    .line 64
    :cond_1
    sget p0, Ll/dbc0;->wl:I

    .line 65
    .line 66
    return p0

    .line 67
    :cond_2
    if-eqz v1, :cond_3

    .line 68
    .line 69
    sget p0, Ll/dbc0;->Qi:I

    .line 70
    .line 71
    return p0

    .line 72
    :cond_3
    sget p0, Ll/dbc0;->Yk:I

    .line 73
    .line 74
    return p0

    .line 75
    :cond_4
    if-eqz v1, :cond_5

    .line 76
    .line 77
    sget p0, Ll/dbc0;->Pi:I

    .line 78
    .line 79
    return p0

    .line 80
    :cond_5
    sget p0, Ll/dbc0;->Sk:I

    .line 81
    .line 82
    return p0

    .line 83
    :cond_6
    if-eqz v1, :cond_7

    .line 84
    .line 85
    sget p0, Ll/dbc0;->Ri:I

    .line 86
    .line 87
    return p0

    .line 88
    :cond_7
    sget p0, Ll/dbc0;->qg:I

    .line 89
    .line 90
    return p0

    .line 91
    :cond_8
    if-eqz v1, :cond_9

    .line 92
    .line 93
    sget p0, Ll/dbc0;->Mi:I

    .line 94
    .line 95
    return p0

    .line 96
    :cond_9
    sget p0, Ll/dbc0;->Nk:I

    .line 97
    .line 98
    return p0

    .line 99
    :cond_a
    sget p0, Ll/dbc0;->ml:I

    .line 100
    .line 101
    return p0

    .line 102
    :cond_b
    if-eqz v1, :cond_c

    .line 103
    .line 104
    sget p0, Ll/dbc0;->Ui:I

    .line 105
    .line 106
    return p0

    .line 107
    :cond_c
    sget p0, Ll/dbc0;->xl:I

    .line 108
    .line 109
    return p0

    .line 110
    :cond_d
    sget p0, Ll/dbc0;->El:I

    .line 111
    .line 112
    return p0

    .line 113
    :pswitch_data_0
    .packed-switch 0x21
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static c(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 1
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget-object v0, Ll/m190$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    const/16 v0, 0x10

    .line 10
    .line 11
    if-eq p0, v0, :cond_3

    .line 12
    .line 13
    const/16 v0, 0x14

    .line 14
    .line 15
    if-eq p0, v0, :cond_2

    .line 16
    .line 17
    const/16 v0, 0x25

    .line 18
    .line 19
    if-eq p0, v0, :cond_1

    .line 20
    .line 21
    const/16 v0, 0x26

    .line 22
    .line 23
    if-eq p0, v0, :cond_0

    .line 24
    .line 25
    sget p0, Ll/dbc0;->O7:I

    .line 26
    .line 27
    return p0

    .line 28
    :cond_0
    sget p0, Ll/dbc0;->N7:I

    .line 29
    .line 30
    return p0

    .line 31
    :cond_1
    sget p0, Ll/dbc0;->M7:I

    .line 32
    .line 33
    return p0

    .line 34
    :cond_2
    sget p0, Ll/dbc0;->P7:I

    .line 35
    .line 36
    return p0

    .line 37
    :cond_3
    sget p0, Ll/dbc0;->Q7:I

    .line 38
    .line 39
    return p0
.end method

.method public static d(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 2
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget v0, Ll/dbc0;->Bl:I

    .line 2
    .line 3
    sget-object v1, Ll/m190$a;->a:[I

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    aget p0, v1, p0

    .line 10
    .line 11
    const/16 v1, 0xb

    .line 12
    .line 13
    if-eq p0, v1, :cond_2

    .line 14
    .line 15
    const/16 v1, 0x13

    .line 16
    .line 17
    if-eq p0, v1, :cond_1

    .line 18
    .line 19
    packed-switch p0, :pswitch_data_0

    .line 20
    .line 21
    .line 22
    packed-switch p0, :pswitch_data_1

    .line 23
    .line 24
    .line 25
    return v0

    .line 26
    :pswitch_0
    sget p0, Ll/dbc0;->Qk:I

    .line 27
    .line 28
    return p0

    .line 29
    :pswitch_1
    sget p0, Ll/dbc0;->rl:I

    .line 30
    .line 31
    return p0

    .line 32
    :pswitch_2
    sget p0, Ll/dbc0;->Al:I

    .line 33
    .line 34
    return p0

    .line 35
    :pswitch_3
    sget p0, Ll/dbc0;->Hk:I

    .line 36
    .line 37
    return p0

    .line 38
    :pswitch_4
    invoke-static {}, Ll/s7a;->r()Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    sget p0, Ll/dbc0;->Cl:I

    .line 45
    .line 46
    return p0

    .line 47
    :cond_0
    sget p0, Ll/dbc0;->Bl:I

    .line 48
    .line 49
    return p0

    .line 50
    :pswitch_5
    sget p0, Ll/dbc0;->Kk:I

    .line 51
    .line 52
    return p0

    .line 53
    :pswitch_6
    sget p0, Ll/dbc0;->ll:I

    .line 54
    .line 55
    return p0

    .line 56
    :pswitch_7
    sget p0, Ll/dbc0;->ul:I

    .line 57
    .line 58
    return p0

    .line 59
    :cond_1
    sget p0, Ll/dbc0;->rg:I

    .line 60
    .line 61
    return p0

    .line 62
    :cond_2
    sget p0, Ll/dbc0;->nl:I

    .line 63
    .line 64
    return p0

    .line 65
    :pswitch_data_0
    .packed-switch 0xf
        :pswitch_7
        :pswitch_6
        :pswitch_5
    .end packed-switch

    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    :pswitch_data_1
    .packed-switch 0x1c
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static e(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 2
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget v0, Ll/dbc0;->Fl:I

    .line 2
    .line 3
    sget-object v1, Ll/m190$a;->a:[I

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    aget p0, v1, p0

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eq p0, v1, :cond_4

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    if-eq p0, v1, :cond_3

    .line 16
    .line 17
    const/4 v1, 0x7

    .line 18
    if-eq p0, v1, :cond_2

    .line 19
    .line 20
    const/16 v1, 0x8

    .line 21
    .line 22
    if-eq p0, v1, :cond_1

    .line 23
    .line 24
    packed-switch p0, :pswitch_data_0

    .line 25
    .line 26
    .line 27
    return v0

    .line 28
    :pswitch_0
    sget p0, Ll/dbc0;->Xk:I

    .line 29
    .line 30
    return p0

    .line 31
    :pswitch_1
    sget p0, Ll/dbc0;->id:I

    .line 32
    .line 33
    return p0

    .line 34
    :pswitch_2
    sget p0, Ll/dbc0;->sg:I

    .line 35
    .line 36
    return p0

    .line 37
    :pswitch_3
    sget p0, Ll/dbc0;->Vk:I

    .line 38
    .line 39
    return p0

    .line 40
    :pswitch_4
    sget p0, Ll/dbc0;->Lk:I

    .line 41
    .line 42
    return p0

    .line 43
    :pswitch_5
    sget p0, Ll/dbc0;->kl:I

    .line 44
    .line 45
    return p0

    .line 46
    :pswitch_6
    sget p0, Ll/dbc0;->vl:I

    .line 47
    .line 48
    return p0

    .line 49
    :pswitch_7
    sget p0, Ll/dbc0;->Ok:I

    .line 50
    .line 51
    return p0

    .line 52
    :pswitch_8
    sget p0, Ll/dbc0;->bl:I

    .line 53
    .line 54
    return p0

    .line 55
    :pswitch_9
    sget p0, Ll/dbc0;->al:I

    .line 56
    .line 57
    return p0

    .line 58
    :pswitch_a
    invoke-static {}, Ll/gra;->L1()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    if-eqz p0, :cond_0

    .line 63
    .line 64
    sget p0, Ll/dbc0;->q8:I

    .line 65
    .line 66
    return p0

    .line 67
    :cond_0
    sget p0, Ll/dbc0;->ol:I

    .line 68
    .line 69
    return p0

    .line 70
    :cond_1
    sget p0, Ll/dbc0;->pl:I

    .line 71
    .line 72
    return p0

    .line 73
    :cond_2
    sget p0, Ll/dbc0;->x8:I

    .line 74
    .line 75
    return p0

    .line 76
    :cond_3
    sget p0, Ll/dbc0;->yl:I

    .line 77
    .line 78
    return p0

    .line 79
    :cond_4
    sget p0, Ll/dbc0;->Gl:I

    .line 80
    .line 81
    return p0

    .line 82
    nop

    .line 83
    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static f(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 2
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget v0, Ll/dbc0;->Pk:I

    .line 2
    .line 3
    sget-object v1, Ll/m190$a;->a:[I

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    aget p0, v1, p0

    .line 10
    .line 11
    const/16 v1, 0x13

    .line 12
    .line 13
    if-eq p0, v1, :cond_0

    .line 14
    .line 15
    packed-switch p0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    return v0

    .line 19
    :pswitch_0
    sget p0, Ll/dbc0;->Zk:I

    .line 20
    .line 21
    return p0

    .line 22
    :pswitch_1
    sget p0, Ll/dbc0;->Rk:I

    .line 23
    .line 24
    return p0

    .line 25
    :pswitch_2
    sget p0, Ll/dbc0;->Tk:I

    .line 26
    .line 27
    return p0

    .line 28
    :pswitch_3
    sget p0, Ll/dbc0;->fl:I

    .line 29
    .line 30
    return p0

    .line 31
    :pswitch_4
    sget p0, Ll/dbc0;->hl:I

    .line 32
    .line 33
    return p0

    .line 34
    :pswitch_5
    sget p0, Ll/dbc0;->Pk:I

    .line 35
    .line 36
    return p0

    .line 37
    :cond_0
    sget p0, Ll/dbc0;->gl:I

    .line 38
    .line 39
    return p0

    .line 40
    nop

    .line 41
    :pswitch_data_0
    .packed-switch 0x16
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static g(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 2
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget v0, Ll/dbc0;->Hl:I

    .line 2
    .line 3
    sget-object v1, Ll/m190$a;->a:[I

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    aget p0, v1, p0

    .line 10
    .line 11
    packed-switch p0, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    return v0

    .line 15
    :pswitch_0
    sget p0, Ll/dbc0;->ql:I

    .line 16
    .line 17
    return p0

    .line 18
    :pswitch_1
    sget p0, Ll/dbc0;->Uk:I

    .line 19
    .line 20
    return p0

    .line 21
    :pswitch_2
    sget p0, Ll/dbc0;->dl:I

    .line 22
    .line 23
    return p0

    .line 24
    :pswitch_3
    sget p0, Ll/dbc0;->y8:I

    .line 25
    .line 26
    return p0

    .line 27
    :pswitch_4
    sget p0, Ll/dbc0;->Vk:I

    .line 28
    .line 29
    return p0

    .line 30
    :pswitch_5
    sget p0, Ll/dbc0;->Mk:I

    .line 31
    .line 32
    return p0

    .line 33
    :pswitch_6
    sget p0, Ll/dbc0;->cl:I

    .line 34
    .line 35
    return p0

    .line 36
    :pswitch_7
    sget p0, Ll/dbc0;->Dl:I

    .line 37
    .line 38
    return p0

    .line 39
    :pswitch_8
    sget p0, Ll/dbc0;->zl:I

    .line 40
    .line 41
    return p0

    .line 42
    :pswitch_9
    sget p0, Ll/dbc0;->Il:I

    .line 43
    .line 44
    return p0

    .line 45
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static h(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 1
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget-object v0, Ll/m190$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    aget p0, v0, p0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    sget p0, Ll/dbc0;->Xr:I

    .line 13
    .line 14
    return p0

    .line 15
    :pswitch_0
    sget p0, Ll/dbc0;->as:I

    .line 16
    .line 17
    return p0

    .line 18
    :pswitch_1
    sget p0, Ll/dbc0;->Yr:I

    .line 19
    .line 20
    return p0

    .line 21
    :pswitch_2
    sget p0, Ll/dbc0;->Wr:I

    .line 22
    .line 23
    return p0

    .line 24
    :pswitch_3
    sget p0, Ll/dbc0;->Zr:I

    .line 25
    .line 26
    return p0

    .line 27
    :pswitch_data_0
    .packed-switch 0x28
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
