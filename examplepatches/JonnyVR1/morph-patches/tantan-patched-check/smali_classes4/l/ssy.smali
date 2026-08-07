.class public Ll/ssy;
.super Ll/c4k0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c4k0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/putong/data/OMSAction;)Z
    .locals 11

    .line 1
    iget-object v0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->k:Ljava/util/Map;

    .line 4
    .line 5
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/data/OMSDialog;

    .line 10
    .line 11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSDialog;->actions:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lcom/p1/mobile/putong/data/OMSAction;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSAction;->preCondition:Ljava/util/List;

    .line 21
    .line 22
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    const/4 v4, 0x1

    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/p1/mobile/putong/data/OMSPreCondition;

    .line 38
    .line 39
    new-instance v5, Ll/p35;

    .line 40
    .line 41
    iget-object v6, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 42
    .line 43
    iget-object v7, v0, Lcom/p1/mobile/putong/data/OMSPreCondition;->id:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v8, v0, Lcom/p1/mobile/putong/data/OMSPreCondition;->type:Lcom/p1/mobile/putong/data/OMSTemplateModeType;

    .line 46
    .line 47
    iget-object v9, v0, Lcom/p1/mobile/putong/data/OMSPreCondition;->condition:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v10, v0, Lcom/p1/mobile/putong/data/OMSPreCondition;->fail_content:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct/range {v5 .. v10}, Ll/p35;-><init>(Lcom/p1/mobile/putong/oms/OmsBaseRender;Ljava/lang/String;Lcom/p1/mobile/putong/data/OMSTemplateModeType;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v5}, Ll/o2;->a()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_0

    .line 59
    .line 60
    move v0, v1

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    move v0, v4

    .line 63
    :goto_0
    if-nez v2, :cond_3

    .line 64
    .line 65
    iget-object v2, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/p1/mobile/putong/data/OmsMerCuryData;->server:Ljava/util/Map;

    .line 68
    .line 69
    if-nez v2, :cond_1

    .line 70
    .line 71
    new-instance v2, Ljava/util/HashMap;

    .line 72
    .line 73
    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_1
    new-instance v3, Ljava/util/HashMap;

    .line 78
    .line 79
    invoke-direct {v3, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 80
    .line 81
    .line 82
    move-object v2, v3

    .line 83
    :goto_1
    if-eqz v0, :cond_2

    .line 84
    .line 85
    const-string v3, "true"

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_2
    const-string v3, "false"

    .line 89
    .line 90
    :goto_2
    const-string v5, "is_checked"

    .line 91
    .line 92
    invoke-interface {v2, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialog;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 98
    .line 99
    iget-object v3, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 100
    .line 101
    iget-object v3, v3, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 102
    .line 103
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OMSDialogInfo;->mercury:Lcom/p1/mobile/putong/data/OmsMerCuryData;

    .line 104
    .line 105
    iget-object v3, v3, Lcom/p1/mobile/putong/data/OmsMerCuryData;->id:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {p1, v3, v2}, Ll/el50;->g(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 108
    .line 109
    .line 110
    :cond_3
    if-nez v0, :cond_4

    .line 111
    .line 112
    return v4

    .line 113
    :cond_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 114
    .line 115
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast p1, Ljava/lang/Boolean;

    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_5

    .line 130
    .line 131
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 132
    .line 133
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    const-string v0, "dialog"

    .line 136
    .line 137
    invoke-static {p1, v0, v1}, Ll/hxf;->e(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 138
    .line 139
    .line 140
    goto :goto_3

    .line 141
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 142
    .line 143
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 150
    .line 151
    check-cast p1, Ljava/lang/Boolean;

    .line 152
    .line 153
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-eqz p1, :cond_7

    .line 158
    .line 159
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 160
    .line 161
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 162
    .line 163
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-eqz v0, :cond_6

    .line 172
    .line 173
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 174
    .line 175
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    if-eqz v0, :cond_6

    .line 180
    .line 181
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 182
    .line 183
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 184
    .line 185
    const-string v0, "invalid"

    .line 186
    .line 187
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 188
    .line 189
    .line 190
    move-result p1

    .line 191
    if-eqz p1, :cond_6

    .line 192
    .line 193
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 194
    .line 195
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 196
    .line 197
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/core/ui/verification/VerificationCenterAct;->Y1(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 202
    .line 203
    .line 204
    goto :goto_3

    .line 205
    :cond_6
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 208
    .line 209
    const-string v0, "tantan_verification"

    .line 210
    .line 211
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/verification/national/IntroductionAct;->X1(Landroid/content/Context;Ljava/lang/String;)Landroid/content/Intent;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    iget-object v0, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 216
    .line 217
    iget-object v0, v0, Lcom/p1/mobile/putong/oms/OmsBaseRender;->a:Lcom/p1/mobile/android/app/Act;

    .line 218
    .line 219
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 220
    .line 221
    .line 222
    :cond_7
    :goto_3
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 223
    .line 224
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 225
    .line 226
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 227
    .line 228
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_merge_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 229
    .line 230
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    if-nez p1, :cond_9

    .line 239
    .line 240
    iget-object p1, p0, Ll/c4k0;->a:Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 241
    .line 242
    iget-object p1, p1, Lcom/p1/mobile/putong/oms/OmsBaseRender;->b:Lcom/p1/mobile/putong/data/OMSDialogInfo;

    .line 243
    .line 244
    iget-object p1, p1, Lcom/p1/mobile/putong/data/OMSDialogInfo;->identifier:Ljava/lang/String;

    .line 245
    .line 246
    sget-object v0, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_verification_center_policy_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 247
    .line 248
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    if-eqz p1, :cond_8

    .line 253
    .line 254
    goto :goto_4

    .line 255
    :cond_8
    invoke-virtual {p0}, Ll/c4k0;->b()V

    .line 256
    .line 257
    .line 258
    goto :goto_5

    .line 259
    :cond_9
    :goto_4
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 260
    .line 261
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 262
    .line 263
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->l4()Ll/pf60;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 268
    .line 269
    check-cast p1, Ljava/lang/Boolean;

    .line 270
    .line 271
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-nez p1, :cond_a

    .line 276
    .line 277
    invoke-virtual {p0}, Ll/c4k0;->b()V

    .line 278
    .line 279
    .line 280
    :cond_a
    :goto_5
    return v4
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "merge_verification"

    .line 2
    .line 3
    return-object p0
.end method
