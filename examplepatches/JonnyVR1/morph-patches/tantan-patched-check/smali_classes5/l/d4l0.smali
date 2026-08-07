.class public Ll/d4l0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/core/R$string;->is:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic b(Ll/d4l0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ll/kxf;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p8}, Ll/d4l0;->k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ll/kxf;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p4, Lcom/tantanapp/common/network/ApiExcep;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p4, Lcom/tantanapp/common/network/ApiExcep;

    .line 6
    .line 7
    iget-object p4, p4, Lcom/tantanapp/common/network/ApiExcep;->response:Ll/i5d0;

    .line 8
    .line 9
    invoke-virtual {p4}, Ll/i5d0;->q()I

    .line 10
    .line 11
    .line 12
    move-result p4

    .line 13
    invoke-static {p4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-static {p0, p4, p1, p2}, Ll/d3l0;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p4, Lcom/tantanapp/common/network/ApiExcep;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p4

    .line 6
    check-cast v0, Lcom/tantanapp/common/network/ApiExcep;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/tantanapp/common/network/ApiExcep;->response:Ll/i5d0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/i5d0;->q()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {p0, v0, p1, p2}, Ll/d3l0;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string p1, "post tencent facedetect failed userId:"

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0, p4}, Ll/d3l0;->z(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    sget p0, Lcom/p1/mobile/putong/core/R$string;->ks:I

    .line 47
    .line 48
    invoke-virtual {p3, p0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public static synthetic f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/d3l0;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Ll/uk50;->i()Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->Q()V

    .line 19
    .line 20
    .line 21
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-virtual {p3}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_2

    .line 32
    .line 33
    const-string p0, "fromPicVerificationDlg"

    .line 34
    .line 35
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-static {p3, p2}, Ll/hxf;->q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act;Ll/uxj0;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/fake/b;->r()Lcom/p1/mobile/putong/core/newui/fake/b;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/fake/b;->p()V

    .line 6
    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/data/IdCard;->new_()Lcom/p1/mobile/putong/data/IdCard;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0, p1}, Ll/yc2;->j(Lcom/p1/mobile/putong/data/IdCard;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 20
    .line 21
    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/appeal/AppealProgressAct;->a2(Landroid/content/Context;Z)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static l(Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isVolcProvider()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ll/kxf;->b:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/kxf;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2, p1, p0}, Ll/q5l0;->Q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const-string v1, ";token:"

    .line 20
    .line 21
    const-string v2, ";userId:"

    .line 22
    .line 23
    const-string v3, ";"

    .line 24
    .line 25
    const-string v4, "detectCallback failed:"

    .line 26
    .line 27
    const/4 v5, 0x0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const-string p1, "41000"

    .line 31
    .line 32
    iget-object v0, p0, Ll/kxf;->b:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_6

    .line 39
    .line 40
    new-instance p1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {p1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/kxf;->b:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Ll/kxf;->d:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/kxf;->a:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1, v5}, Ll/d3l0;->z(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p0, Ll/kxf;->b:Ljava/lang/String;

    .line 88
    .line 89
    invoke-static {p2, p1, p3, p4}, Ll/hxf;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)Z

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-nez p1, :cond_6

    .line 94
    .line 95
    iget-object p0, p0, Ll/kxf;->b:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {p2, p0}, Ll/q5l0;->P(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_1
    invoke-static {p2, p0, p1, p3}, Ll/q5l0;->H(Lcom/p1/mobile/android/app/Act;Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result p3

    .line 105
    if-eqz p3, :cond_2

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/VerificationToken;->isAliyunIntlProvider()Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_3

    .line 114
    .line 115
    iget-object p0, p0, Ll/kxf;->b:Ljava/lang/String;

    .line 116
    .line 117
    invoke-static {p2, p0}, Ll/q5l0;->I(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void

    .line 121
    :cond_3
    iget-object p1, p0, Ll/kxf;->b:Ljava/lang/String;

    .line 122
    .line 123
    iget-object p3, p0, Ll/kxf;->d:Ljava/lang/String;

    .line 124
    .line 125
    const-string p4, "9000"

    .line 126
    .line 127
    invoke-virtual {p4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p4

    .line 131
    if-eqz p4, :cond_4

    .line 132
    .line 133
    new-instance p0, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    const-string p1, "detect overtime:userId:"

    .line 136
    .line 137
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-interface {p1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-static {p0, v5}, Ll/d3l0;->z(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 156
    .line 157
    .line 158
    sget p0, Lcom/p1/mobile/putong/core/R$string;->js:I

    .line 159
    .line 160
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    invoke-static {p0}, Ll/o1j0;->t(Ljava/lang/String;)Landroid/widget/Toast;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    invoke-virtual {p0}, Landroid/widget/Toast;->show()V

    .line 169
    .line 170
    .line 171
    return-void

    .line 172
    :cond_4
    new-instance p4, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {p4, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {p4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 181
    .line 182
    .line 183
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-virtual {p4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 201
    .line 202
    .line 203
    iget-object p0, p0, Ll/kxf;->a:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {p4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 206
    .line 207
    .line 208
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-static {p0, v5}, Ll/d3l0;->z(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    const-string p0, "6000"

    .line 216
    .line 217
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result p0

    .line 221
    if-eqz p0, :cond_6

    .line 222
    .line 223
    const-string p0, "DEVICE_NOT_SUPPORT"

    .line 224
    .line 225
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p0

    .line 229
    if-nez p0, :cond_5

    .line 230
    .line 231
    const-string p0, "NO_CAMERA_PERMISSION"

    .line 232
    .line 233
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-eqz p0, :cond_6

    .line 238
    .line 239
    :cond_5
    new-instance p0, Ll/a4l0;

    .line 240
    .line 241
    invoke-direct {p0, p2}, Ll/a4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 242
    .line 243
    .line 244
    invoke-static {p0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 245
    .line 246
    .line 247
    :cond_6
    :goto_0
    return-void
.end method


# virtual methods
.method public final h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ll/kxf;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/FaceidLiveData;->new_()Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 6
    .line 7
    .line 8
    move-result p4

    .line 9
    if-eqz p4, :cond_0

    .line 10
    .line 11
    iget-object p4, p0, Lcom/p1/mobile/putong/data/FaceidLiveData;->aliyun:Lcom/p1/mobile/putong/data/ALiYunResult;

    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p4, Lcom/p1/mobile/putong/data/ALiYunResult;->certifyId:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 19
    .line 20
    .line 21
    move-result p4

    .line 22
    if-eqz p4, :cond_1

    .line 23
    .line 24
    iget-object p4, p0, Lcom/p1/mobile/putong/data/FaceidLiveData;->tencent:Lcom/p1/mobile/putong/data/TencentResult;

    .line 25
    .line 26
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 27
    .line 28
    iget-object v1, v0, Lcom/p1/mobile/putong/data/TencentToken;->agreementNo:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, p4, Lcom/p1/mobile/putong/data/TencentResult;->orderNo:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/TencentToken;->userId:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p4, Lcom/p1/mobile/putong/data/TencentResult;->publicUserId:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p4, Lcom/p1/mobile/putong/data/TencentResult;->providerAppId:Ljava/lang/String;

    .line 41
    .line 42
    :cond_1
    :goto_0
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    invoke-virtual {p4, p0}, Ll/yc2;->i(Lcom/p1/mobile/putong/data/FaceidLiveData;)V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ll/uk50;->i()Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result p4

    .line 61
    if-eqz p4, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->Q()V

    .line 64
    .line 65
    .line 66
    :cond_2
    invoke-static {}, Ll/hxf;->j()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    iget-object p2, p2, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {p1, p3, p0, p2}, Lcom/p1/mobile/putong/core/newui/appeal/AppealAct;->Z1(Landroid/content/Context;Ljava/lang/String;Lcom/p1/mobile/putong/data/PhoneNumber;Ljava/lang/String;)Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final i(Z)Ljava/lang/String;
    .locals 4

    .line 1
    :try_start_0
    invoke-static {}, Ljava/net/NetworkInterface;->getNetworkInterfaces()Ljava/util/Enumeration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/net/NetworkInterface;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/net/NetworkInterface;->getInetAddresses()Ljava/util/Enumeration;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-static {v0}, Ljava/util/Collections;->list(Ljava/util/Enumeration;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    check-cast v1, Ljava/net/InetAddress;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/net/InetAddress;->isLoopbackAddress()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-nez v2, :cond_1

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    const/16 v2, 0x3a

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    const/4 v3, 0x0

    .line 66
    if-gez v2, :cond_2

    .line 67
    .line 68
    const/4 v2, 0x1

    .line 69
    goto :goto_0

    .line 70
    :cond_2
    move v2, v3

    .line 71
    :goto_0
    if-eqz p1, :cond_3

    .line 72
    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    return-object v1

    .line 76
    :cond_3
    if-nez v2, :cond_1

    .line 77
    .line 78
    const/16 p0, 0x25

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Ljava/lang/String;->indexOf(I)I

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-gez p0, :cond_4

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_4
    invoke-virtual {v1, v3, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/net/SocketException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    return-object p0

    .line 100
    :catch_0
    :cond_5
    const-string p0, ""

    .line 101
    .line 102
    return-object p0
.end method

.method public final j(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 9
    .param p6    # Lcom/p1/mobile/putong/data/VerificationToken;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v6, p7

    .line 2
    .line 3
    move-object/from16 v5, p8

    .line 4
    .line 5
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-boolean v0, p5, Ll/kxf;->h:Z

    .line 12
    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "66660004"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 32
    .line 33
    const-string v1, "66660010"

    .line 34
    .line 35
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_1

    .line 40
    .line 41
    :cond_0
    iget-object p0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {p0, v5, v6, p3}, Ll/d3l0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p5, p6, p2, p3, p4}, Ll/d4l0;->l(Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    const-string v0, "appeal"

    .line 51
    .line 52
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_2

    .line 63
    .line 64
    iget-object p1, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 65
    .line 66
    const-string p4, "1000"

    .line 67
    .line 68
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    iget-object p0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {p0, v5, v6, p3}, Ll/d3l0;->g(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-static {p2, p5, p6, p3}, Ll/q5l0;->H(Lcom/p1/mobile/android/app/Act;Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    const-string p1, "0"

    .line 84
    .line 85
    invoke-static {p1, v5, v6, p3}, Ll/d3l0;->r(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    const-string p1, "idCard"

    .line 89
    .line 90
    invoke-virtual {p0, p2, p6, p1, p5}, Ll/d4l0;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ll/kxf;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/VerificationToken;->isVolcProvider()Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_4

    .line 99
    .line 100
    iget-boolean v0, p5, Ll/kxf;->h:Z

    .line 101
    .line 102
    if-nez v0, :cond_4

    .line 103
    .line 104
    iget-object p0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 105
    .line 106
    invoke-static {p0, v5, v6, p3}, Ll/d3l0;->x(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 110
    .line 111
    iget-object p1, p5, Ll/kxf;->d:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {p2, p0, p1}, Ll/q5l0;->Q(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    move-object/from16 v0, p9

    .line 118
    .line 119
    invoke-static {v5, v6, v0, p3}, Ll/d3l0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    sget v0, Lcom/p1/mobile/putong/core/R$string;->L5:I

    .line 123
    .line 124
    invoke-virtual {p2, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 125
    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->p()Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, p1, v1, p4}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->w(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ljava/lang/String;I)Lrx/c;

    .line 140
    .line 141
    .line 142
    move-result-object p4

    .line 143
    invoke-virtual {p2, p4}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 144
    .line 145
    .line 146
    move-result-object p4

    .line 147
    new-instance v0, Ll/y3l0;

    .line 148
    .line 149
    move-object v1, p0

    .line 150
    move-object v8, p1

    .line 151
    move-object v2, p2

    .line 152
    move-object v7, p3

    .line 153
    move-object v4, p5

    .line 154
    move-object v3, p6

    .line 155
    invoke-direct/range {v0 .. v8}, Ll/y3l0;-><init>(Ll/d4l0;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ll/kxf;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V

    .line 156
    .line 157
    .line 158
    new-instance p0, Ll/z3l0;

    .line 159
    .line 160
    invoke-direct {p0, v5, v6, p3, p2}, Ll/z3l0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 161
    .line 162
    .line 163
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {p4, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 168
    .line 169
    .line 170
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ll/kxf;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 5
    .line 6
    .line 7
    move-result p8

    .line 8
    if-eqz p8, :cond_1

    .line 9
    .line 10
    iget-object p8, p3, Ll/kxf;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "1000"

    .line 13
    .line 14
    invoke-static {p8, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p8

    .line 18
    if-eqz p8, :cond_0

    .line 19
    .line 20
    invoke-static {p4, p5, p6}, Ll/d3l0;->t(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p7, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 24
    .line 25
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->newProcess:Z

    .line 26
    .line 27
    invoke-virtual {p0, p1, p6, p2}, Ll/d4l0;->p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object p0, p3, Ll/kxf;->b:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {p0, p4, p5, p6}, Ll/d3l0;->u(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1, p3, p2, p6}, Ll/q5l0;->H(Lcom/p1/mobile/android/app/Act;Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-static {p4, p5, p6}, Ll/d3l0;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p2, p7, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->c:Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 44
    .line 45
    iget-boolean p2, p2, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->newProcess:Z

    .line 46
    .line 47
    invoke-virtual {p0, p1, p6, p2}, Ll/d4l0;->p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4

    .line 1
    invoke-static {p5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "2006"

    .line 11
    .line 12
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p5, Ll/kxf;->g:Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "Z5128"

    .line 21
    .line 22
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    :cond_1
    iget-object v0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 29
    .line 30
    const-string v2, "1001"

    .line 31
    .line 32
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    iget-object v0, p5, Ll/kxf;->g:Ljava/lang/String;

    .line 39
    .line 40
    const-string v2, "Z5114"

    .line 41
    .line 42
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    :cond_2
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    goto :goto_0

    .line 56
    :cond_3
    const/4 v0, 0x0

    .line 57
    :goto_0
    const-string v2, "fakeBatch"

    .line 58
    .line 59
    invoke-static {p3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    iget-boolean v3, p5, Ll/kxf;->h:Z

    .line 64
    .line 65
    if-eqz v2, :cond_8

    .line 66
    .line 67
    if-nez v3, :cond_5

    .line 68
    .line 69
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    if-eqz p1, :cond_4

    .line 74
    .line 75
    iget-object p1, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    iget-boolean p1, p5, Ll/kxf;->h:Z

    .line 84
    .line 85
    if-nez p1, :cond_4

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    iget-object p0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 89
    .line 90
    invoke-static {p0, p8, p7, p3}, Ll/d3l0;->x(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-static {p5, p6, p2, p3, p4}, Ll/d4l0;->l(Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 94
    .line 95
    .line 96
    goto :goto_2

    .line 97
    :cond_5
    :goto_1
    invoke-static {p8, p7, p3}, Ll/d3l0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0, p2, p6, p5}, Ll/d4l0;->o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ll/kxf;)V

    .line 101
    .line 102
    .line 103
    :goto_2
    invoke-virtual {p6}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 104
    .line 105
    .line 106
    move-result p0

    .line 107
    if-eqz p0, :cond_7

    .line 108
    .line 109
    iget-object p0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 110
    .line 111
    const-string p1, "1000"

    .line 112
    .line 113
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-eqz p0, :cond_6

    .line 118
    .line 119
    invoke-static {p8, p7, p3}, Ll/d3l0;->t(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    return-void

    .line 123
    :cond_6
    iget-object p0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {p0, p8, p7, p3}, Ll/d3l0;->u(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :cond_7
    invoke-static {p8, p7, p3}, Ll/d3l0;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_8
    if-nez v3, :cond_9

    .line 134
    .line 135
    if-nez v0, :cond_9

    .line 136
    .line 137
    iget-object p0, p5, Ll/kxf;->b:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {p0, p8, p7, p3}, Ll/d3l0;->x(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-static {p5, p6, p2, p3, p4}, Ll/d4l0;->l(Ll/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_9
    const-string v0, "appeal"

    .line 147
    .line 148
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-eqz v0, :cond_a

    .line 153
    .line 154
    invoke-static {p8, p7, p3}, Ll/d3l0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const-string p1, "picture"

    .line 158
    .line 159
    invoke-virtual {p0, p2, p6, p1, p5}, Ll/d4l0;->h(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ll/kxf;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :cond_a
    invoke-static {p8, p7, p9, p3}, Ll/d3l0;->h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    const/4 p0, 0x3

    .line 167
    if-ne p4, p0, :cond_b

    .line 168
    .line 169
    iget-object p0, p6, Lcom/p1/mobile/putong/data/VerificationToken;->bizSeq:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-nez p0, :cond_b

    .line 176
    .line 177
    iget-object p0, p6, Lcom/p1/mobile/putong/data/VerificationToken;->bizSeq:Ljava/lang/String;

    .line 178
    .line 179
    invoke-static {p2, p0, p1}, Lcom/p1/mobile/putong/facertification/a;->d(Landroid/app/Activity;Ljava/lang/String;Lcom/p1/mobile/putong/facertification/RxFacertification$b;)V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_b
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->p()Lcom/p1/mobile/putong/facertification/TTFacertificationClient;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 188
    .line 189
    .line 190
    move-result-object p5

    .line 191
    invoke-interface {p5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p5

    .line 195
    invoke-virtual {p0, p1, p5, p4}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->w(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Ljava/lang/String;I)Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-virtual {p2, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    invoke-virtual {p0, p1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    new-instance p1, Ll/w3l0;

    .line 212
    .line 213
    invoke-direct {p1, p8, p7, p3, p2}, Ll/w3l0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 214
    .line 215
    .line 216
    new-instance p4, Ll/x3l0;

    .line 217
    .line 218
    invoke-direct {p4, p8, p7, p3, p2}, Ll/x3l0;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/android/app/Act;)V

    .line 219
    .line 220
    .line 221
    invoke-static {p1, p4}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 226
    .line 227
    .line 228
    invoke-static {p2}, Ll/tx0;->J(Lcom/p1/mobile/android/app/Act;)V

    .line 229
    .line 230
    .line 231
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;I)V
    .locals 10

    .line 1
    iget-object v5, p1, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->a:Ll/kxf;

    .line 2
    .line 3
    iget-object v6, p1, Lcom/p1/mobile/putong/facertification/RxFacertification$b;->b:Lcom/p1/mobile/putong/data/VerificationToken;

    .line 4
    .line 5
    invoke-static {p3, p4}, Ll/x5l0;->i(Ljava/lang/String;I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v7

    .line 9
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/VerificationToken;->getProviderNameForTracker()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v8

    .line 13
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, v8}, Ll/yc2;->k(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Ll/yc2;->e()Ll/yc2;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0, v7}, Ll/yc2;->l(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p4}, Ll/x5l0;->h(I)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    iget-object v0, v5, Ll/kxf;->b:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    invoke-static {p4}, Ll/x5l0;->h(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v9

    .line 39
    iget-object v0, v5, Ll/kxf;->b:Ljava/lang/String;

    .line 40
    .line 41
    const/4 v1, 0x2

    .line 42
    if-ne p4, v1, :cond_0

    .line 43
    .line 44
    invoke-static {v0, v8, v9}, Ll/d3l0;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {v0, v8, v9}, Ll/d3l0;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :goto_0
    invoke-virtual {v6}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_1

    .line 56
    .line 57
    iget-object v0, v5, Ll/kxf;->b:Ljava/lang/String;

    .line 58
    .line 59
    const-string v2, "1003"

    .line 60
    .line 61
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    iget-object p0, v5, Ll/kxf;->b:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p0, v8, v7, p3}, Ll/d3l0;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    if-ne p4, v1, :cond_2

    .line 74
    .line 75
    move-object v0, p0

    .line 76
    move-object v1, p1

    .line 77
    move-object v2, p2

    .line 78
    move-object v3, p3

    .line 79
    move v4, p4

    .line 80
    invoke-virtual/range {v0 .. v9}, Ll/d4l0;->j(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_2
    move-object v0, p0

    .line 85
    move-object v1, p1

    .line 86
    move-object v2, p2

    .line 87
    move-object v3, p3

    .line 88
    move v4, p4

    .line 89
    invoke-virtual/range {v0 .. v9}, Ll/d4l0;->m(Lcom/p1/mobile/putong/facertification/RxFacertification$b;Lcom/p1/mobile/android/app/Act;Ljava/lang/String;ILl/kxf;Lcom/p1/mobile/putong/data/VerificationToken;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final o(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/VerificationToken;Ll/kxf;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/data/AppealPostData;->new_()Lcom/p1/mobile/putong/data/AppealPostData;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    iget-object v0, p2, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p3, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "fake"

    .line 10
    .line 11
    iput-object v0, p3, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p0, v1}, Ll/d4l0;->i(Z)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iput-object p0, p3, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 19
    .line 20
    const-string p0, "picture"

    .line 21
    .line 22
    iput-object p0, p3, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/data/FaceidLiveData;->new_()Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/VerificationToken;->isALiProvider()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FaceidLiveData;->aliyun:Lcom/p1/mobile/putong/data/ALiYunResult;

    .line 35
    .line 36
    iget-object p2, p2, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 37
    .line 38
    iput-object p2, v1, Lcom/p1/mobile/putong/data/ALiYunResult;->certifyId:Ljava/lang/String;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/VerificationToken;->isTencentProvider()Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    iget-object v1, p2, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 48
    .line 49
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/data/FaceidLiveData;->tencent:Lcom/p1/mobile/putong/data/TencentResult;

    .line 56
    .line 57
    iget-object p2, p2, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 58
    .line 59
    iget-object v2, p2, Lcom/p1/mobile/putong/data/TencentToken;->agreementNo:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v2, v1, Lcom/p1/mobile/putong/data/TencentResult;->orderNo:Ljava/lang/String;

    .line 62
    .line 63
    iget-object p2, p2, Lcom/p1/mobile/putong/data/TencentToken;->userId:Ljava/lang/String;

    .line 64
    .line 65
    iput-object p2, v1, Lcom/p1/mobile/putong/data/TencentResult;->publicUserId:Ljava/lang/String;

    .line 66
    .line 67
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/data/FaceidLiveData;->tencent:Lcom/p1/mobile/putong/data/TencentResult;

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/facertification/TTFacertificationClient;->q()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iput-object v1, p2, Lcom/p1/mobile/putong/data/TencentResult;->providerAppId:Ljava/lang/String;

    .line 74
    .line 75
    :cond_2
    :goto_0
    iput-object p0, p3, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 76
    .line 77
    invoke-static {}, Ll/hxf;->j()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    iput-object p0, p3, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 82
    .line 83
    iput-object v0, p3, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 84
    .line 85
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 86
    .line 87
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 88
    .line 89
    new-instance p2, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0, p3, p2}, Ll/dkb;->ya(Lcom/p1/mobile/putong/data/AppealPostData;Ljava/util/List;)Lrx/c;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    invoke-virtual {p1, p0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    new-instance p2, Ll/b4l0;

    .line 103
    .line 104
    invoke-direct {p2, p1}, Ll/b4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 105
    .line 106
    .line 107
    new-instance p3, Ll/c4l0;

    .line 108
    .line 109
    invoke-direct {p3, p1}, Ll/c4l0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 110
    .line 111
    .line 112
    invoke-static {p2, p3}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 117
    .line 118
    .line 119
    return-void
.end method

.method public final p(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    const-string p0, "fromNameVerificationDlg"

    .line 9
    .line 10
    invoke-static {p2, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-nez p0, :cond_0

    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/d0;->T:Ll/jxd0;

    .line 21
    .line 22
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    :cond_0
    invoke-static {}, Ll/uk50;->f()Ll/uk50;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/uk50;->i()Lcom/p1/mobile/putong/oms/OmsBaseRender;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/oms/OmsBaseRender;->Q()V

    .line 42
    .line 43
    .line 44
    :cond_1
    const/4 p0, -0x1

    .line 45
    invoke-virtual {p1, p0}, Landroid/app/Activity;->setResult(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 49
    .line 50
    .line 51
    return-void
.end method
