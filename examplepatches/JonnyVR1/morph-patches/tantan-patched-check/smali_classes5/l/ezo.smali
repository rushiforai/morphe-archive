.class public Ll/ezo;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Ll/ezo;->c(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    :goto_0
    move v2, v0

    .line 10
    goto :goto_1

    .line 11
    :cond_0
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {p0}, Ll/ezo;->e(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    goto :goto_0

    .line 22
    :cond_1
    invoke-static {p0}, Ll/ezo;->f(Lcom/p1/mobile/putong/core/data/Privilege;)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    goto :goto_0

    .line 27
    :goto_1
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-static {p1, p0}, Ll/d0p;->b(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v0}, Ll/a690;->d()Ljava/lang/CharSequence;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    :goto_2
    move-object v4, v0

    .line 54
    move-object v3, v1

    .line 55
    goto :goto_4

    .line 56
    :cond_2
    invoke-static {p1, p0}, Ll/j690;->m(Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/data/Privilege;)Ll/a690;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->vip_super_like:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 61
    .line 62
    if-ne p0, v1, :cond_3

    .line 63
    .line 64
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Oi()Z

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    if-nez v1, :cond_3

    .line 77
    .line 78
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 79
    .line 80
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Ns:I

    .line 81
    .line 82
    const/4 v4, 0x5

    .line 83
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    invoke-virtual {v1, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    goto :goto_3

    .line 96
    :cond_3
    invoke-virtual {v0}, Ll/a690;->t()Ljava/lang/CharSequence;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    :goto_3
    invoke-virtual {v0}, Ll/a690;->q()Ljava/lang/CharSequence;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    goto :goto_2

    .line 113
    :goto_4
    new-instance v1, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;

    .line 114
    .line 115
    move-object v5, p0

    .line 116
    move-object v6, p1

    .line 117
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegeDescListItem$a;-><init>(ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 118
    .line 119
    .line 120
    return-object v1
.end method

.method public static b(Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/VipNewUiFrag;Lcom/p1/mobile/putong/core/data/PurchaseType;Lcom/p1/mobile/putong/core/ui/purchase/d;)Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;
    .locals 7

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ks:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->k()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget v1, Lcom/p1/mobile/putong/core/R$string;->N7:I

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Yf:I

    .line 19
    .line 20
    :goto_0
    if-eqz p2, :cond_2

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    goto :goto_1

    .line 33
    :cond_1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    const/4 p2, 0x0

    .line 39
    :goto_1
    sget-object v2, Lcom/p1/mobile/putong/core/data/PurchaseType;->TYPE_GET_PRIVILEGE_PACKAGE:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 40
    .line 41
    if-eq p1, v2, :cond_3

    .line 42
    .line 43
    sget v2, Ll/c9c0;->Q0:I

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_3
    sget v2, Ll/c9c0;->O0:I

    .line 47
    .line 48
    :goto_2
    const-string v3, ""

    .line 49
    .line 50
    if-eqz p2, :cond_4

    .line 51
    .line 52
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->G2:Ll/lc9;

    .line 55
    .line 56
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->f()Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {v4, p2}, Ll/lc9;->k3(Lcom/p1/mobile/putong/core/data/ProductCategory;)Z

    .line 61
    .line 62
    .line 63
    move-result p2

    .line 64
    if-eqz p2, :cond_4

    .line 65
    .line 66
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Zf:I

    .line 67
    .line 68
    move-object v0, v3

    .line 69
    :cond_4
    invoke-static {p1}, Ll/wib0;->v(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-eqz p2, :cond_5

    .line 74
    .line 75
    new-instance p2, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 82
    .line 83
    sget v2, Lcom/p1/mobile/putong/core/R$string;->bg:I

    .line 84
    .line 85
    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    sget-object v4, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 90
    .line 91
    sget v5, Lcom/p1/mobile/putong/core/R$string;->ag:I

    .line 92
    .line 93
    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    filled-new-array {v2, v4}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    sget v1, Ll/c9c0;->a0:I

    .line 106
    .line 107
    sget-object v2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 108
    .line 109
    sget v4, Lcom/p1/mobile/putong/core/R$string;->bg:I

    .line 110
    .line 111
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    sget-object v5, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 120
    .line 121
    sget v6, Lcom/p1/mobile/putong/core/R$string;->ag:I

    .line 122
    .line 123
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v5

    .line 127
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    filled-new-array {v2, v4, v5, v6}, [Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-static {p0, v0, v1, v2}, Ll/e1b;->A0(Landroid/app/Activity;Ljava/lang/String;I[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-direct {p2, v3, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 140
    .line 141
    .line 142
    return-object p2

    .line 143
    :cond_5
    new-instance p2, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;

    .line 144
    .line 145
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 150
    .line 151
    sget v4, Lcom/p1/mobile/putong/core/R$string;->A8:I

    .line 152
    .line 153
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v4

    .line 157
    sget-object v5, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 158
    .line 159
    sget v6, Lcom/p1/mobile/putong/core/R$string;->yk:I

    .line 160
    .line 161
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    filled-new-array {v4, v5}, [Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    invoke-virtual {v3, v1, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 174
    .line 175
    sget v4, Lcom/p1/mobile/putong/core/R$string;->A8:I

    .line 176
    .line 177
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    invoke-static {}, Ll/zwk;->j()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    sget-object v5, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 186
    .line 187
    sget v6, Lcom/p1/mobile/putong/core/R$string;->yk:I

    .line 188
    .line 189
    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    invoke-static {}, Ll/zwk;->i()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v6

    .line 197
    filled-new-array {v3, v4, v5, v6}, [Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v3

    .line 201
    invoke-static {p0, v1, v2, v3}, Ll/e1b;->A0(Landroid/app/Activity;Ljava/lang/String;I[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    invoke-direct {p2, v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/content/item/IntlPrivilegePolicyItem$a;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 206
    .line 207
    .line 208
    return-object p2
.end method

.method public static c(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 2
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget v0, Ll/dbc0;->rb:I

    .line 2
    .line 3
    sget-object v1, Ll/ezo$a;->a:[I

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
    sget p0, Ll/dbc0;->Fc:I

    .line 16
    .line 17
    return p0

    .line 18
    :pswitch_1
    sget p0, Ll/dbc0;->xb:I

    .line 19
    .line 20
    return p0

    .line 21
    :pswitch_2
    sget p0, Ll/dbc0;->Na:I

    .line 22
    .line 23
    return p0

    .line 24
    :pswitch_3
    sget p0, Ll/dbc0;->Va:I

    .line 25
    .line 26
    return p0

    .line 27
    :pswitch_4
    sget p0, Ll/dbc0;->tb:I

    .line 28
    .line 29
    return p0

    .line 30
    :pswitch_5
    sget p0, Ll/dbc0;->g9:I

    .line 31
    .line 32
    return p0

    .line 33
    :pswitch_6
    sget p0, Ll/dbc0;->ib:I

    .line 34
    .line 35
    return p0

    .line 36
    :pswitch_7
    sget p0, Ll/dbc0;->Xa:I

    .line 37
    .line 38
    return p0

    .line 39
    :pswitch_8
    sget p0, Ll/dbc0;->Ba:I

    .line 40
    .line 41
    return p0

    .line 42
    :pswitch_9
    sget p0, Ll/dbc0;->eb:I

    .line 43
    .line 44
    return p0

    .line 45
    :pswitch_a
    sget p0, Ll/dbc0;->Za:I

    .line 46
    .line 47
    return p0

    .line 48
    :pswitch_b
    sget p0, Ll/dbc0;->Ta:I

    .line 49
    .line 50
    return p0

    .line 51
    :pswitch_c
    sget p0, Ll/dbc0;->Ua:I

    .line 52
    .line 53
    return p0

    .line 54
    :pswitch_d
    sget p0, Ll/dbc0;->Ya:I

    .line 55
    .line 56
    return p0

    .line 57
    :pswitch_e
    sget p0, Ll/dbc0;->za:I

    .line 58
    .line 59
    return p0

    .line 60
    :pswitch_f
    sget p0, Ll/dbc0;->Ra:I

    .line 61
    .line 62
    return p0

    .line 63
    :pswitch_10
    sget p0, Ll/dbc0;->xa:I

    .line 64
    .line 65
    return p0

    .line 66
    :pswitch_11
    sget p0, Ll/dbc0;->nb:I

    .line 67
    .line 68
    return p0

    .line 69
    :pswitch_12
    sget p0, Ll/dbc0;->gb:I

    .line 70
    .line 71
    return p0

    .line 72
    :pswitch_13
    sget p0, Ll/dbc0;->rb:I

    .line 73
    .line 74
    return p0

    .line 75
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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

.method public static d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ll/mcg0;
    .locals 4

    .line 1
    new-instance v0, Ll/mcg0;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/core/R$string;->T9:I

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 12
    .line 13
    sget v3, Lcom/p1/mobile/putong/core/R$string;->S9:I

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-direct {v0, v1, v2, p0}, Ll/mcg0;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/PurchaseType;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public static e(Lcom/p1/mobile/putong/core/data/Privilege;)I
    .locals 2
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation

    .line 1
    sget v0, Ll/dbc0;->Ma:I

    .line 2
    .line 3
    sget-object v1, Ll/ezo$a;->a:[I

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
    sget p0, Ll/dbc0;->Oa:I

    .line 16
    .line 17
    return p0

    .line 18
    :pswitch_1
    sget p0, Ll/dbc0;->Aa:I

    .line 19
    .line 20
    return p0

    .line 21
    :pswitch_2
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_0

    .line 26
    .line 27
    sget p0, Ll/dbc0;->qb:I

    .line 28
    .line 29
    return p0

    .line 30
    :cond_0
    sget p0, Ll/dbc0;->pb:I

    .line 31
    .line 32
    return p0

    .line 33
    :pswitch_3
    sget p0, Ll/dbc0;->Ma:I

    .line 34
    .line 35
    return p0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x15
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
    sget v0, Ll/dbc0;->sb:I

    .line 2
    .line 3
    sget-object v1, Ll/ezo$a;->a:[I

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
    sget p0, Ll/dbc0;->Cr:I

    .line 16
    .line 17
    return p0

    .line 18
    :pswitch_1
    sget p0, Ll/dbc0;->Dr:I

    .line 19
    .line 20
    return p0

    .line 21
    :pswitch_2
    sget p0, Ll/dbc0;->wa:I

    .line 22
    .line 23
    return p0

    .line 24
    :pswitch_3
    sget p0, Ll/dbc0;->Ar:I

    .line 25
    .line 26
    return p0

    .line 27
    :pswitch_4
    sget p0, Ll/dbc0;->Br:I

    .line 28
    .line 29
    return p0

    .line 30
    :pswitch_5
    sget p0, Ll/dbc0;->Sa:I

    .line 31
    .line 32
    return p0

    .line 33
    :pswitch_6
    sget p0, Ll/dbc0;->ya:I

    .line 34
    .line 35
    return p0

    .line 36
    :pswitch_7
    sget p0, Ll/dbc0;->ob:I

    .line 37
    .line 38
    return p0

    .line 39
    :pswitch_8
    sget p0, Ll/dbc0;->hb:I

    .line 40
    .line 41
    return p0

    .line 42
    :pswitch_9
    sget p0, Ll/dbc0;->sb:I

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
