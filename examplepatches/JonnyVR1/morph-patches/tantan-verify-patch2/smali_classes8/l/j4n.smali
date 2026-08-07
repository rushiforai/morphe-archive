.class public abstract Ll/j4n;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ll/k4n<",
        "*>;>",
        "Ll/ar2<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/pzi0;->o()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/Converter;->dateToApiTimeString(J)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-static {p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/j4n;->a:Ljava/lang/String;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic e0(Ll/j4n;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j4n;->o0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic f0(Ll/j4n;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j4n;->p0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic g0(Ll/j4n;Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/j4n;->q0(Lcom/p1/mobile/putong/core/data/Greeting;)V

    return-void
.end method

.method public static synthetic h0(Ll/j4n;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/j4n;->n0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->i5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic j0(Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/j;->i5()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic n0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/k4n;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/k4n;->r()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic o0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    if-ne p1, v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/j4n;->r0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public a0()V
    .locals 3

    .line 1
    new-instance v0, Ll/d4n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/d4n;-><init>(Ll/j4n;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/e4n;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/e4n;-><init>(Ll/j4n;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 23
    .line 24
    .line 25
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->q0:Lrx/subjects/b;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/f4n;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/f4n;-><init>(Ll/j4n;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/j;->C6()Lrx/c;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    new-instance v1, Ll/g4n;

    .line 60
    .line 61
    invoke-direct {v1}, Ll/g4n;-><init>()V

    .line 62
    .line 63
    .line 64
    new-instance v2, Ll/h4n;

    .line 65
    .line 66
    invoke-direct {v2}, Ll/h4n;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 74
    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->r0:Lcom/p1/mobile/putong/core/api/j;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/j;->n0:Lrx/subjects/b;

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    new-instance v1, Ll/i4n;

    .line 87
    .line 88
    invoke-direct {v1, p0}, Ll/i4n;-><init>(Ll/j4n;)V

    .line 89
    .line 90
    .line 91
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    const/4 v0, 0x1

    .line 99
    invoke-virtual {p0, v0}, Ll/j4n;->s0(Z)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public k0()V
    .locals 0

    .line 1
    return-void
.end method

.method public l0(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    goto/16 :goto_5

    .line 13
    .line 14
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_a

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Lcom/p1/mobile/putong/core/data/Greeting;

    .line 29
    .line 30
    new-instance v1, Ll/fzq;

    .line 31
    .line 32
    invoke-direct {v1}, Ll/fzq;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/fzq;->x(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ll/fzq;->O(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 46
    .line 47
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 48
    .line 49
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/Greeting;->otherUser:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v2, v3}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_4

    .line 60
    .line 61
    invoke-static {v2}, Ll/ux6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {v1, v3}, Ll/fzq;->I(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/Greeting;->latestTime:D

    .line 77
    .line 78
    invoke-virtual {v1, v3, v4}, Ll/fzq;->L(D)V

    .line 79
    .line 80
    .line 81
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v1, v3}, Ll/fzq;->P(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 87
    .line 88
    invoke-virtual {v1, v3}, Ll/fzq;->Q(Lcom/p1/mobile/putong/data/Gender;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    invoke-virtual {v1, v3}, Ll/fzq;->y(Z)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-virtual {v1, v3}, Ll/fzq;->F(Z)V

    .line 103
    .line 104
    .line 105
    iget-object v3, v2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 106
    .line 107
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    invoke-virtual {v1, v3}, Ll/fzq;->N(I)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    const/4 v4, 0x0

    .line 119
    const/4 v5, 0x1

    .line 120
    if-nez v3, :cond_1

    .line 121
    .line 122
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isODiamond()Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    if-eqz v3, :cond_1

    .line 127
    .line 128
    move v3, v5

    .line 129
    goto :goto_1

    .line 130
    :cond_1
    move v3, v4

    .line 131
    :goto_1
    invoke-virtual {v1, v3}, Ll/fzq;->C(Z)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-nez v3, :cond_2

    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isPlatinum()Z

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-eqz v3, :cond_2

    .line 145
    .line 146
    move v3, v5

    .line 147
    goto :goto_2

    .line 148
    :cond_2
    move v3, v4

    .line 149
    :goto_2
    invoke-virtual {v1, v3}, Ll/fzq;->H(Z)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVipWithMe()Z

    .line 153
    .line 154
    .line 155
    move-result v3

    .line 156
    if-nez v3, :cond_3

    .line 157
    .line 158
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isSupremePartner()Z

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    if-eqz v2, :cond_3

    .line 163
    .line 164
    move v4, v5

    .line 165
    :cond_3
    invoke-virtual {v1, v4}, Ll/fzq;->K(Z)V

    .line 166
    .line 167
    .line 168
    :cond_4
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->status:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v1, v2}, Ll/fzq;->J(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {v1, v0}, Ll/fzq;->w(Lcom/p1/mobile/putong/core/data/Greeting;)V

    .line 174
    .line 175
    .line 176
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 177
    .line 178
    iget v2, v2, Lcom/p1/mobile/putong/core/data/GreetingMessages;->unread:I

    .line 179
    .line 180
    invoke-virtual {v1, v2}, Ll/fzq;->M(I)V

    .line 181
    .line 182
    .line 183
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 184
    .line 185
    .line 186
    move-result-object v2

    .line 187
    :cond_5
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    if-eqz v3, :cond_8

    .line 192
    .line 193
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    check-cast v3, Lcom/p1/mobile/putong/core/data/Message;

    .line 198
    .line 199
    iget-object v4, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v5, v0, Lcom/p1/mobile/putong/core/data/Greeting;->messages:Lcom/p1/mobile/putong/core/data/GreetingMessages;

    .line 202
    .line 203
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/GreetingMessages;->latestId:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    if-eqz v4, :cond_5

    .line 210
    .line 211
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 212
    .line 213
    if-eqz v2, :cond_7

    .line 214
    .line 215
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 216
    .line 217
    .line 218
    move-result v2

    .line 219
    if-nez v2, :cond_6

    .line 220
    .line 221
    goto :goto_3

    .line 222
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 223
    .line 224
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    sget v3, Lcom/p1/mobile/putong/core/message/R$string;->K4:I

    .line 229
    .line 230
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v2

    .line 234
    invoke-virtual {v1, v2}, Ll/fzq;->B(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    goto :goto_4

    .line 238
    :cond_7
    :goto_3
    iget-object v2, v3, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v1, v2}, Ll/fzq;->B(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    :cond_8
    :goto_4
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 244
    .line 245
    iget-object v2, v2, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 246
    .line 247
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 248
    .line 249
    .line 250
    move-result v2

    .line 251
    if-nez v2, :cond_9

    .line 252
    .line 253
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Greeting;->moment:Lcom/p1/mobile/putong/data/IdBoxed;

    .line 258
    .line 259
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IdBoxed;->id:Ljava/lang/String;

    .line 260
    .line 261
    sget-object v3, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 262
    .line 263
    invoke-interface {v2, v0, v3}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Mh(Ljava/lang/String;Lcom/tantanapp/common/data/JsonAdapter;)Lcom/tantanapp/common/data/ValueObject;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 268
    .line 269
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    if-eqz v2, :cond_9

    .line 274
    .line 275
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 276
    .line 277
    invoke-virtual {v1, v2}, Ll/fzq;->z(Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 281
    .line 282
    invoke-virtual {v1, v0}, Ll/fzq;->A(Ljava/util/List;)V

    .line 283
    .line 284
    .line 285
    :cond_9
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :cond_a
    :goto_5
    return-object p0
.end method

.method public m0(Ll/vg60;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/Greeting;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;)",
            "Ljava/util/List<",
            "Ll/fzq;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/j4n;->l0(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic p0(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/j4n;->k0()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/j4n;->r0()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final synthetic q0(Lcom/p1/mobile/putong/core/data/Greeting;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/k4n;

    .line 4
    .line 5
    iget-object v0, v0, Ll/k4n;->c:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Ll/k4n;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/k4n;->b()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    const/4 v1, 0x0

    .line 29
    move v2, v1

    .line 30
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-ge v2, v3, :cond_2

    .line 35
    .line 36
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Ll/fzq;

    .line 41
    .line 42
    invoke-virtual {v3}, Ll/fzq;->f()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    iget-object v5, p1, Lcom/p1/mobile/putong/core/data/Greeting;->id:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    if-eqz v4, :cond_1

    .line 53
    .line 54
    invoke-virtual {v3, v1}, Ll/fzq;->M(I)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 58
    .line 59
    check-cast p0, Ll/k4n;

    .line 60
    .line 61
    invoke-virtual {p0}, Ll/k4n;->e()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_2
    :goto_1
    return-void
.end method

.method public abstract r0()V
.end method

.method public abstract s0(Z)V
.end method

.method public abstract t0()V
.end method
