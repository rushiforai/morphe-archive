.class public Ll/n7e0;
.super Ll/o5e0;
.source "SourceFile"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o5e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(IILandroid/content/Intent;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->fl()V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return p0
.end method


# virtual methods
.method public a(Ll/abe0;Ll/z20;)V
    .locals 11
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
    const-string v1, "entry"

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
    invoke-static {}, Ll/gra;->z()Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x2

    .line 18
    const-string v4, "signature"

    .line 19
    .line 20
    const-string v5, "picture"

    .line 21
    .line 22
    const/4 v6, 0x0

    .line 23
    const-string v7, "verification"

    .line 24
    .line 25
    const/4 v8, -0x1

    .line 26
    const/4 v9, 0x1

    .line 27
    const/4 v10, 0x0

    .line 28
    if-eqz v2, :cond_3

    .line 29
    .line 30
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-nez v0, :cond_8

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    sparse-switch v0, :sswitch_data_0

    .line 44
    .line 45
    .line 46
    :goto_0
    move v3, v8

    .line 47
    goto :goto_1

    .line 48
    :sswitch_0
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :sswitch_1
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_0

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move v3, v9

    .line 63
    goto :goto_1

    .line 64
    :sswitch_2
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_1

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_1
    move v3, v6

    .line 72
    :cond_2
    :goto_1
    packed-switch v3, :pswitch_data_0

    .line 73
    .line 74
    .line 75
    goto :goto_2

    .line 76
    :pswitch_0
    new-instance v10, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;

    .line 77
    .line 78
    invoke-direct {v10}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputSignature;-><init>()V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :pswitch_1
    new-instance v10, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyLife;

    .line 83
    .line 84
    invoke-direct {v10}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputMyLife;-><init>()V

    .line 85
    .line 86
    .line 87
    goto :goto_2

    .line 88
    :pswitch_2
    new-instance v10, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputVerification;

    .line 89
    .line 90
    invoke-direct {v10}, Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputVerification;-><init>()V

    .line 91
    .line 92
    .line 93
    :goto_2
    if-eqz v10, :cond_8

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    sget-object p1, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 100
    .line 101
    invoke-static {p0, p1, v10}, Ll/ljf;->a(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/exploop/item/ExpLoopInputType;)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    if-nez v2, :cond_8

    .line 110
    .line 111
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    sparse-switch v2, :sswitch_data_1

    .line 119
    .line 120
    .line 121
    :goto_3
    move v3, v8

    .line 122
    goto :goto_4

    .line 123
    :sswitch_3
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    if-nez v1, :cond_6

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :sswitch_4
    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-nez v1, :cond_4

    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_4
    move v3, v9

    .line 138
    goto :goto_4

    .line 139
    :sswitch_5
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    if-nez v1, :cond_5

    .line 144
    .line 145
    goto :goto_3

    .line 146
    :cond_5
    move v3, v6

    .line 147
    :cond_6
    :goto_4
    packed-switch v3, :pswitch_data_1

    .line 148
    .line 149
    .line 150
    goto :goto_5

    .line 151
    :pswitch_3
    sget-object v10, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->SIGNATURE:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 152
    .line 153
    goto :goto_5

    .line 154
    :pswitch_4
    sget-object v10, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->MY_LIFE_SEE_MYSELF:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 155
    .line 156
    goto :goto_5

    .line 157
    :pswitch_5
    sget-object v10, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;->VERIFICATION:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;

    .line 158
    .line 159
    :goto_5
    const-string v1, "from"

    .line 160
    .line 161
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Ljava/lang/String;

    .line 166
    .line 167
    if-eqz v10, :cond_8

    .line 168
    .line 169
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    iget-object p0, p0, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 174
    .line 175
    if-nez p0, :cond_7

    .line 176
    .line 177
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 186
    .line 187
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 188
    .line 189
    invoke-virtual {p2}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 190
    .line 191
    .line 192
    move-result-object p2

    .line 193
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 194
    .line 195
    .line 196
    move-result-object p2

    .line 197
    invoke-interface {p0, p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->xc(Lcom/p1/mobile/putong/data/User;)V

    .line 198
    .line 199
    .line 200
    :cond_7
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 201
    .line 202
    .line 203
    move-result-object p0

    .line 204
    sget-object p2, Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;->ENTRY_FROM_MY_TAB_OPT:Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;

    .line 205
    .line 206
    invoke-static {}, Ll/aw90;->F()Ll/aw90;

    .line 207
    .line 208
    .line 209
    move-result-object v1

    .line 210
    iget-object v1, v1, Ll/aw90;->a:Lcom/p1/mobile/putong/data/User;

    .line 211
    .line 212
    invoke-static {p0, p2, v10, v1}, Lcom/p1/mobile/putong/core/ui/profile/loop/ProfileInfoLoopEditAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopFragmentFactory$LoopCreateEntryType;Lcom/p1/mobile/putong/core/ui/profile/loop/LoopInputType;Lcom/p1/mobile/putong/data/User;)Landroid/content/Intent;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    const-string p2, "loop_create_from_page"

    .line 217
    .line 218
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 219
    .line 220
    .line 221
    const-string p2, "loop_edit_patch_flag"

    .line 222
    .line 223
    invoke-virtual {p0, p2, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 224
    .line 225
    .line 226
    invoke-virtual {p1}, Ll/abe0;->b()Landroid/content/Context;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    invoke-static {p1}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 231
    .line 232
    .line 233
    move-result-object p1

    .line 234
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 235
    .line 236
    new-instance p2, Ll/m7e0;

    .line 237
    .line 238
    invoke-direct {p2}, Ll/m7e0;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {p1, p0, p2}, Lcom/p1/mobile/android/app/Act;->startActivityForResult(Landroid/content/Intent;Lcom/p1/mobile/android/app/a$a;)V

    .line 242
    .line 243
    .line 244
    return-void

    .line 245
    :cond_8
    invoke-super {p0, p1, p2}, Ll/o5e0;->a(Ll/abe0;Ll/z20;)V

    .line 246
    .line 247
    .line 248
    return-void

    .line 249
    :sswitch_data_0
    .sparse-switch
        -0x587a29e5 -> :sswitch_2
        -0x226fa302 -> :sswitch_1
        0x3ffd98b8 -> :sswitch_0
    .end sparse-switch

    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_1
    .sparse-switch
        -0x587a29e5 -> :sswitch_5
        -0x226fa302 -> :sswitch_4
        0x3ffd98b8 -> :sswitch_3
    .end sparse-switch

    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch
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
