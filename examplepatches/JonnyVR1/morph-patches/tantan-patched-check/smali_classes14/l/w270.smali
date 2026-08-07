.class public Ll/w270;
.super Ll/jbf0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jbf0<",
        "Ll/l270;",
        "Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Landroid/widget/TextView;

.field public d:Lv/VMaterialEdit_FakeSpinner;

.field public e:Lv/VMaterialEdit;

.field public f:Lv/VMaterialEdit;

.field public g:Lv/VButton_FakeShadowSmall;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lv/VButton_FakeShadow;

.field public k:Ll/l270;

.field public l:I

.field public m:Z

.field public n:Z

.field public o:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Ll/jbf0;-><init>(Lcom/p1/mobile/putong/app/PutongAct;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput p1, p0, Ll/w270;->l:I

    .line 6
    .line 7
    iput-boolean p1, p0, Ll/w270;->m:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/w270;->n:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/w270;->o:Z

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic j(Ll/w270;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w270;->I(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic k(Ll/w270;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w270;->K(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic l(Ll/w270;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w270;->E(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic m(Ll/w270;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w270;->G(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic n(Ll/w270;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w270;->C(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic p(Ll/w270;Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w270;->B(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public static synthetic q(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    const/4 p1, 0x4

    .line 16
    if-lt p0, p1, :cond_0

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public static synthetic s(Ll/w270;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w270;->H(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic u(Ll/w270;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/w270;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Ll/w270;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/w270;->J(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static z(Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "+"

    .line 4
    .line 5
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/nsb;->d:Ljava/util/ArrayList;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/nsb;

    .line 16
    .line 17
    iget v0, v0, Ll/nsb;->b:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;ZZZLjava/lang/String;)V
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "MissingPermission"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/w270;->d:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/w270;->z(Landroid/widget/TextView;Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/w270;->d:Lv/VMaterialEdit_FakeSpinner;

    .line 17
    .line 18
    sget-object v1, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->h:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->g:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    const-string v1, "change-phone"

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-static {p1, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iget-object v0, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 40
    .line 41
    sget-object v2, Lcom/p1/mobile/putong/account/ui/welcome/WelcomeAct;->g:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ll/w270;->f:Lv/VMaterialEdit;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 49
    .line 50
    .line 51
    :cond_1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 52
    .line 53
    check-cast v0, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 54
    .line 55
    invoke-virtual {v0}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {v0}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    const/4 v2, 0x0

    .line 64
    const/4 v3, 0x1

    .line 65
    if-nez v0, :cond_3

    .line 66
    .line 67
    iget-object v0, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 68
    .line 69
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-lez v0, :cond_2

    .line 78
    .line 79
    move v0, v3

    .line 80
    goto :goto_0

    .line 81
    :cond_2
    move v0, v2

    .line 82
    :goto_0
    iget-object v4, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 83
    .line 84
    invoke-static {v4, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    iget-object v0, p0, Ll/w270;->k:Ll/l270;

    .line 89
    .line 90
    invoke-virtual {v0}, Ll/l270;->d1()V

    .line 91
    .line 92
    .line 93
    :goto_1
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 94
    .line 95
    check-cast v0, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 96
    .line 97
    invoke-virtual {v0}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget-object v4, Lcom/p1/mobile/putong/account/AccountModule;->c:Lcom/p1/mobile/putong/account/api/a;

    .line 102
    .line 103
    invoke-virtual {v4}, Lcom/p1/mobile/putong/account/api/a;->M1()Ll/fu;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    iget-object v5, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 108
    .line 109
    invoke-interface {v4, v5}, Ll/fu;->a(Lcom/p1/mobile/android/app/Act;)Landroid/graphics/drawable/Drawable;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    invoke-virtual {v0, v4}, Ll/c30;->C(Landroid/graphics/drawable/Drawable;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    const-string v5, "signin"

    .line 128
    .line 129
    const/4 v6, -0x1

    .line 130
    sparse-switch v4, :sswitch_data_0

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :sswitch_0
    const-string v1, "bind_mobile"

    .line 135
    .line 136
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_4

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :cond_4
    const/4 v6, 0x4

    .line 144
    goto :goto_2

    .line 145
    :sswitch_1
    const-string v1, "signup"

    .line 146
    .line 147
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-nez v0, :cond_5

    .line 152
    .line 153
    goto :goto_2

    .line 154
    :cond_5
    const/4 v6, 0x3

    .line 155
    goto :goto_2

    .line 156
    :sswitch_2
    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_6

    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_6
    const/4 v6, 0x2

    .line 164
    goto :goto_2

    .line 165
    :sswitch_3
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_7

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_7
    move v6, v3

    .line 173
    goto :goto_2

    .line 174
    :sswitch_4
    const-string v1, "forgot-password"

    .line 175
    .line 176
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-nez v0, :cond_8

    .line 181
    .line 182
    goto :goto_2

    .line 183
    :cond_8
    move v6, v2

    .line 184
    :goto_2
    packed-switch v6, :pswitch_data_0

    .line 185
    .line 186
    .line 187
    goto/16 :goto_3

    .line 188
    .line 189
    :pswitch_0
    if-nez p3, :cond_9

    .line 190
    .line 191
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 192
    .line 193
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 194
    .line 195
    invoke-virtual {p3}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 196
    .line 197
    .line 198
    move-result-object p3

    .line 199
    invoke-virtual {p3, v2}, Ll/c30;->w(Z)V

    .line 200
    .line 201
    .line 202
    invoke-virtual {p0}, Ll/jbf0;->a()Lcom/p1/mobile/putong/app/PutongAct;

    .line 203
    .line 204
    .line 205
    move-result-object p3

    .line 206
    invoke-virtual {p3, v2}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 207
    .line 208
    .line 209
    :cond_9
    if-eqz p4, :cond_a

    .line 210
    .line 211
    if-nez p5, :cond_a

    .line 212
    .line 213
    iget-object p3, p0, Ll/w270;->k:Ll/l270;

    .line 214
    .line 215
    iget-object p4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 216
    .line 217
    invoke-virtual {p3, p4}, Ll/l270;->c1(Lcom/p1/mobile/android/app/Act;)Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p3

    .line 221
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 222
    .line 223
    .line 224
    move-result p4

    .line 225
    if-nez p4, :cond_a

    .line 226
    .line 227
    iget-object p4, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 228
    .line 229
    invoke-virtual {p4, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 230
    .line 231
    .line 232
    :cond_a
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 233
    .line 234
    move-object p4, p3

    .line 235
    check-cast p4, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 236
    .line 237
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 238
    .line 239
    sget p5, Lcom/p1/mobile/putong/account/R$string;->B:I

    .line 240
    .line 241
    invoke-virtual {p3, p5}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p3

    .line 245
    invoke-virtual {p4, p3}, Lcom/p1/mobile/android/app/Act;->setTitle(Ljava/lang/CharSequence;)V

    .line 246
    .line 247
    .line 248
    iget-object p3, p0, Ll/w270;->j:Lv/VButton_FakeShadow;

    .line 249
    .line 250
    sget p4, Lcom/p1/mobile/putong/account/R$string;->c:I

    .line 251
    .line 252
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(I)V

    .line 253
    .line 254
    .line 255
    iget-object p3, p0, Ll/w270;->c:Landroid/widget/TextView;

    .line 256
    .line 257
    iget-object p4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 258
    .line 259
    check-cast p4, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 260
    .line 261
    sget p5, Lcom/p1/mobile/putong/account/R$string;->m4:I

    .line 262
    .line 263
    invoke-virtual {p4, p5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p4

    .line 267
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 268
    .line 269
    .line 270
    iget-object p3, p0, Ll/w270;->c:Landroid/widget/TextView;

    .line 271
    .line 272
    invoke-static {p3, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 273
    .line 274
    .line 275
    iget-object p3, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 276
    .line 277
    invoke-virtual {p3}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 278
    .line 279
    .line 280
    move-result-object p3

    .line 281
    new-instance p4, Ll/m270;

    .line 282
    .line 283
    invoke-direct {p4, p0}, Ll/m270;-><init>(Ll/w270;)V

    .line 284
    .line 285
    .line 286
    invoke-static {p4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 287
    .line 288
    .line 289
    move-result-object p4

    .line 290
    invoke-virtual {p3, p4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 291
    .line 292
    .line 293
    iget-object p3, p0, Ll/w270;->f:Lv/VMaterialEdit;

    .line 294
    .line 295
    invoke-virtual {p3}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 296
    .line 297
    .line 298
    move-result-object p3

    .line 299
    new-instance p4, Ll/n270;

    .line 300
    .line 301
    invoke-direct {p4, p0}, Ll/n270;-><init>(Ll/w270;)V

    .line 302
    .line 303
    .line 304
    invoke-static {p4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 305
    .line 306
    .line 307
    move-result-object p4

    .line 308
    invoke-virtual {p3, p4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 309
    .line 310
    .line 311
    goto/16 :goto_3

    .line 312
    .line 313
    :pswitch_1
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 314
    .line 315
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 316
    .line 317
    sget p4, Lcom/p1/mobile/putong/account/R$string;->u3:I

    .line 318
    .line 319
    invoke-virtual {p3, p4}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 320
    .line 321
    .line 322
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 323
    .line 324
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 325
    .line 326
    const/16 p4, 0x7530

    .line 327
    .line 328
    invoke-virtual {p3, p4}, Lcom/p1/mobile/android/app/Act;->lmdStart(I)V

    .line 329
    .line 330
    .line 331
    sget-object p3, Lv/VLinear;->b:Lv/VLinear$a;

    .line 332
    .line 333
    invoke-virtual {p3}, Lv/VLinear$a;->c()V

    .line 334
    .line 335
    .line 336
    goto/16 :goto_3

    .line 337
    .line 338
    :pswitch_2
    iput-boolean v3, p0, Ll/w270;->o:Z

    .line 339
    .line 340
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 341
    .line 342
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 343
    .line 344
    sget p4, Lcom/p1/mobile/putong/account/R$string;->g4:I

    .line 345
    .line 346
    invoke-virtual {p3, p4}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 347
    .line 348
    .line 349
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 350
    .line 351
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 352
    .line 353
    invoke-virtual {p3}, Landroidx/appcompat/app/AppCompatActivity;->getSupportActionBar()Ll/c30;

    .line 354
    .line 355
    .line 356
    move-result-object p3

    .line 357
    sget p4, Ll/bbc0;->P1:I

    .line 358
    .line 359
    invoke-virtual {p3, p4}, Ll/c30;->B(I)V

    .line 360
    .line 361
    .line 362
    iget-object p3, p0, Ll/w270;->d:Lv/VMaterialEdit_FakeSpinner;

    .line 363
    .line 364
    const/16 p4, 0x8

    .line 365
    .line 366
    invoke-virtual {p3, p4}, Landroid/view/View;->setVisibility(I)V

    .line 367
    .line 368
    .line 369
    iget-object p3, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 370
    .line 371
    invoke-virtual {p3, p4}, Landroid/view/View;->setVisibility(I)V

    .line 372
    .line 373
    .line 374
    iget-object p3, p0, Ll/w270;->j:Lv/VButton_FakeShadow;

    .line 375
    .line 376
    sget p5, Lcom/p1/mobile/putong/account/R$string;->o2:I

    .line 377
    .line 378
    invoke-virtual {p3, p5}, Landroid/widget/TextView;->setText(I)V

    .line 379
    .line 380
    .line 381
    iget-object p3, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 382
    .line 383
    invoke-virtual {p3, p4}, Landroid/view/View;->setVisibility(I)V

    .line 384
    .line 385
    .line 386
    iget-object p3, p0, Ll/w270;->h:Lv/VText;

    .line 387
    .line 388
    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 389
    .line 390
    .line 391
    move-result-object p3

    .line 392
    check-cast p3, Landroid/view/ViewGroup;

    .line 393
    .line 394
    iget-object p4, p0, Ll/w270;->h:Lv/VText;

    .line 395
    .line 396
    invoke-static {p4}, Ll/bnl0;->P(Landroid/view/View;)I

    .line 397
    .line 398
    .line 399
    move-result p4

    .line 400
    invoke-virtual {p3, p4}, Landroid/view/ViewGroup;->removeViewAt(I)V

    .line 401
    .line 402
    .line 403
    iget-object p5, p0, Ll/w270;->h:Lv/VText;

    .line 404
    .line 405
    add-int/2addr p4, v3

    .line 406
    invoke-virtual {p3, p5, p4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    .line 407
    .line 408
    .line 409
    iget-object p3, p0, Ll/w270;->h:Lv/VText;

    .line 410
    .line 411
    invoke-virtual {p3, v3}, Landroid/widget/TextView;->setGravity(I)V

    .line 412
    .line 413
    .line 414
    iget-object p3, p0, Ll/w270;->h:Lv/VText;

    .line 415
    .line 416
    const/high16 p4, 0x41c00000    # 24.0f

    .line 417
    .line 418
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 419
    .line 420
    .line 421
    move-result p4

    .line 422
    invoke-static {p3, p4}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 423
    .line 424
    .line 425
    iget-object p3, p0, Ll/w270;->i:Lv/VText;

    .line 426
    .line 427
    iget-object p4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 428
    .line 429
    check-cast p4, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 430
    .line 431
    sget p5, Lcom/p1/mobile/putong/account/R$string;->e4:I

    .line 432
    .line 433
    iget-object v0, p2, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 434
    .line 435
    invoke-static {v0}, Ll/bsj0;->y(Ljava/lang/String;)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    invoke-virtual {p4, p5, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object p4

    .line 447
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 448
    .line 449
    .line 450
    goto :goto_3

    .line 451
    :pswitch_3
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 452
    .line 453
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 454
    .line 455
    sget p4, Lcom/p1/mobile/putong/account/R$string;->J:I

    .line 456
    .line 457
    invoke-virtual {p3, p4}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 458
    .line 459
    .line 460
    iget-object p3, p0, Ll/w270;->j:Lv/VButton_FakeShadow;

    .line 461
    .line 462
    sget p4, Lcom/p1/mobile/putong/account/R$string;->e:I

    .line 463
    .line 464
    invoke-virtual {p3, p4}, Landroid/widget/TextView;->setText(I)V

    .line 465
    .line 466
    .line 467
    goto :goto_3

    .line 468
    :pswitch_4
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 469
    .line 470
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 471
    .line 472
    sget p4, Lcom/p1/mobile/putong/account/R$string;->a3:I

    .line 473
    .line 474
    invoke-virtual {p3, p4}, Lcom/p1/mobile/android/app/Act;->setTitle(I)V

    .line 475
    .line 476
    .line 477
    :goto_3
    iget-object p3, p0, Ll/w270;->d:Lv/VMaterialEdit_FakeSpinner;

    .line 478
    .line 479
    new-instance p4, Ll/o270;

    .line 480
    .line 481
    invoke-direct {p4, p0}, Ll/o270;-><init>(Ll/w270;)V

    .line 482
    .line 483
    .line 484
    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 485
    .line 486
    .line 487
    iget-object p3, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 488
    .line 489
    invoke-virtual {p3}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 490
    .line 491
    .line 492
    move-result-object p3

    .line 493
    new-instance p4, Ll/p270;

    .line 494
    .line 495
    invoke-direct {p4, p0}, Ll/p270;-><init>(Ll/w270;)V

    .line 496
    .line 497
    .line 498
    invoke-static {p4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 499
    .line 500
    .line 501
    move-result-object p4

    .line 502
    invoke-virtual {p3, p4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 503
    .line 504
    .line 505
    iget-object p3, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 506
    .line 507
    new-instance p4, Ll/q270;

    .line 508
    .line 509
    invoke-direct {p4, p0, p1, p2}, Ll/q270;-><init>(Ll/w270;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)V

    .line 510
    .line 511
    .line 512
    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 513
    .line 514
    .line 515
    iget-object p3, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 516
    .line 517
    check-cast p3, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 518
    .line 519
    invoke-virtual {p3}, Landroid/app/Activity;->getLocalClassName()Ljava/lang/String;

    .line 520
    .line 521
    .line 522
    move-result-object p3

    .line 523
    invoke-static {p3}, Ll/l51;->B(Ljava/lang/String;)Z

    .line 524
    .line 525
    .line 526
    move-result p3

    .line 527
    if-nez p3, :cond_b

    .line 528
    .line 529
    invoke-static {p1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 530
    .line 531
    .line 532
    move-result p3

    .line 533
    if-eqz p3, :cond_b

    .line 534
    .line 535
    iget-object p3, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 536
    .line 537
    invoke-static {p3}, Ll/bnl0;->p(Landroid/view/View;)V

    .line 538
    .line 539
    .line 540
    :cond_b
    iget-object p3, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 541
    .line 542
    invoke-virtual {p3}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 543
    .line 544
    .line 545
    move-result-object p3

    .line 546
    iget-object p4, p0, Ll/w270;->f:Lv/VMaterialEdit;

    .line 547
    .line 548
    invoke-virtual {p4}, Lv/VMaterialEdit;->H()Lrx/c;

    .line 549
    .line 550
    .line 551
    move-result-object p4

    .line 552
    new-instance p5, Ll/r270;

    .line 553
    .line 554
    invoke-direct {p5}, Ll/r270;-><init>()V

    .line 555
    .line 556
    .line 557
    invoke-static {p3, p4, p5}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 558
    .line 559
    .line 560
    move-result-object p3

    .line 561
    new-instance p4, Ll/s270;

    .line 562
    .line 563
    invoke-direct {p4, p0}, Ll/s270;-><init>(Ll/w270;)V

    .line 564
    .line 565
    .line 566
    invoke-static {p4}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 567
    .line 568
    .line 569
    move-result-object p4

    .line 570
    invoke-virtual {p3, p4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 571
    .line 572
    .line 573
    iget-object p3, p0, Ll/w270;->j:Lv/VButton_FakeShadow;

    .line 574
    .line 575
    new-instance p4, Ll/t270;

    .line 576
    .line 577
    invoke-direct {p4, p0, p1, p2, p6}, Ll/t270;-><init>(Ll/w270;Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/String;)V

    .line 578
    .line 579
    .line 580
    invoke-virtual {p3, p4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 581
    .line 582
    .line 583
    return-void

    .line 584
    nop

    .line 585
    :sswitch_data_0
    .sparse-switch
        -0x5b94cdfb -> :sswitch_4
        -0x46951eef -> :sswitch_3
        -0x35ca905e -> :sswitch_2
        -0x35ca8ee8 -> :sswitch_1
        -0x233c651c -> :sswitch_0
    .end sparse-switch

    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final synthetic B(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/w270;->m:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/w270;->m:Z

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic C(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Ll/w270;->n:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Ll/w270;->n:Z

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic E(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w270;->d:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic F(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p1, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 9
    .line 10
    new-instance v0, Ll/u270;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/u270;-><init>(Ll/w270;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, v0}, Ll/sm;->b0(Lcom/p1/mobile/android/app/Act;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic G(Ljava/lang/CharSequence;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/w270;->S()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic H(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 p3, 0x1

    .line 2
    invoke-virtual {p0, p3, p1, p2}, Ll/w270;->y(ZLcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)Lcom/p1/mobile/putong/data/VerifyData;

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iget-object p2, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-static {p2, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 13
    .line 14
    invoke-virtual {p2, p3}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 18
    .line 19
    const-string p3, "..."

    .line 20
    .line 21
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Ll/w270;->k:Ll/l270;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/l270;->q1(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic I(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w270;->j:Lv/VButton_FakeShadow;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-static {p0, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic J(Lcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;Ljava/lang/String;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p4, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    check-cast p4, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 4
    .line 5
    sget v0, Lcom/p1/mobile/putong/account/R$string;->j0:I

    .line 6
    .line 7
    invoke-virtual {p4, v0}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 8
    .line 9
    .line 10
    const/4 p4, 0x0

    .line 11
    invoke-virtual {p0, p4, p1, p2}, Ll/w270;->y(ZLcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)Lcom/p1/mobile/putong/data/VerifyData;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iput-object p1, p2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 16
    .line 17
    iget-object p1, p0, Ll/w270;->d:Lv/VMaterialEdit_FakeSpinner;

    .line 18
    .line 19
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iput p1, p2, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 24
    .line 25
    iget-object p1, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 26
    .line 27
    invoke-static {p1}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p2, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 32
    .line 33
    const-string p1, "deeplink"

    .line 34
    .line 35
    invoke-static {p1, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const-string p1, "bind_mobile_force_login"

    .line 42
    .line 43
    invoke-static {p1}, Lcom/p1/mobile/putong/data/VerifyReason;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/VerifyReason;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p2, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 48
    .line 49
    :cond_0
    iget-object p0, p0, Ll/w270;->k:Ll/l270;

    .line 50
    .line 51
    invoke-virtual {p0, p2}, Ll/l270;->t1(Lcom/p1/mobile/putong/data/VerifyData;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->p(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L(Landroid/view/MenuItem;)Z
    .locals 1

    .line 1
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget v0, Ll/wcc0;->c0:I

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;->finish()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public M()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w270;->d:Lv/VMaterialEdit_FakeSpinner;

    .line 2
    .line 3
    iget-object p0, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/gsj0;->g(Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public N()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/account/R$string;->r3:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public O()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/account/R$string;->A3:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bsj0;->R(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x3c

    .line 2
    .line 3
    sub-long/2addr v0, p1

    .line 4
    long-to-int p1, v0

    .line 5
    iget-object p2, p0, Ll/w270;->h:Lv/VText;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Ll/w270;->h:Lv/VText;

    .line 12
    .line 13
    iget-object v0, p0, Ll/jbf0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 14
    .line 15
    check-cast v0, Lcom/p1/mobile/putong/account/ui/account/PhoneVerificationAct;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-gt p1, v1, :cond_0

    .line 19
    .line 20
    sget v1, Lcom/p1/mobile/putong/account/R$string;->g3:I

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget v1, Lcom/p1/mobile/putong/account/R$string;->h3:I

    .line 24
    .line 25
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {v0, v1, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    .line 39
    .line 40
    iget-object p0, p0, Ll/w270;->h:Lv/VText;

    .line 41
    .line 42
    const p1, -0x727273

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/data/VerifyReason;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/account/R$string;->r3:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 12
    .line 13
    .line 14
    const-string v0, "signin"

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object v0, p0, Ll/w270;->h:Lv/VText;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    sget p1, Lcom/p1/mobile/putong/account/R$string;->f4:I

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(I)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Ll/w270;->h:Lv/VText;

    .line 30
    .line 31
    new-instance v0, Ll/v270;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Ll/v270;-><init>(Ll/w270;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/w270;->h:Lv/VText;

    .line 40
    .line 41
    const v0, -0xbf4dbc

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p1, 0x0

    .line 49
    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Ll/w270;->h:Lv/VText;

    .line 53
    .line 54
    const-string v0, ""

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-virtual {p0}, Ll/w270;->S()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public S()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iget-object p0, p0, Ll/w270;->g:Lv/VButton_FakeShadowSmall;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    const/4 v0, 0x1

    .line 34
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public T()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w270;->f:Lv/VMaterialEdit;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic b(Ll/ibf0;)V
    .locals 0

    .line 1
    check-cast p1, Ll/l270;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w270;->x(Ll/l270;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/l270;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/w270;->x(Ll/l270;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/w270;->w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public w(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/x270;->b(Ll/w270;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public x(Ll/l270;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/w270;->k:Ll/l270;

    .line 2
    .line 3
    return-void
.end method

.method public y(ZLcom/p1/mobile/putong/data/VerifyReason;Lcom/p1/mobile/putong/data/SignInData;)Lcom/p1/mobile/putong/data/VerifyData;
    .locals 1
    .param p1    # Z
        .annotation runtime Ljava/lang/Deprecated;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-static {}, Ll/q8g0;->y()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p1, p0, Ll/w270;->f:Lv/VMaterialEdit;

    .line 16
    .line 17
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 22
    .line 23
    :goto_0
    iput-object p2, v0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 24
    .line 25
    const/4 p1, 0x6

    .line 26
    iput p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 27
    .line 28
    const-string p1, "signin"

    .line 29
    .line 30
    invoke-static {p2, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-eqz p1, :cond_1

    .line 35
    .line 36
    iget-object p0, p3, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 37
    .line 38
    const-string p1, " "

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const/4 p1, 0x0

    .line 45
    aget-object p1, p0, p1

    .line 46
    .line 47
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iput p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 52
    .line 53
    const/4 p1, 0x1

    .line 54
    aget-object p0, p0, p1

    .line 55
    .line 56
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 57
    .line 58
    return-object v0

    .line 59
    :cond_1
    iget-object p1, p0, Ll/w270;->d:Lv/VMaterialEdit_FakeSpinner;

    .line 60
    .line 61
    invoke-static {p1}, Ll/bsj0;->I(Landroid/widget/TextView;)I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    iput p1, v0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 66
    .line 67
    iget-object p0, p0, Ll/w270;->e:Lv/VMaterialEdit;

    .line 68
    .line 69
    invoke-static {p0}, Ll/bsj0;->M(Landroid/widget/TextView;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 74
    .line 75
    return-object v0
.end method
