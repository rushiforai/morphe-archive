.class public Ll/qyp;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile c:Ll/qyp;


# instance fields
.field public a:Landroid/os/CountDownTimer;

.field public b:Ll/kcg0;


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

.method public static synthetic a(Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_intl_ban_alert_ok_btn"

    .line 2
    .line 3
    const-string v0, "p_intl_ban_chatorswipe_alert"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Ll/qyp;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qyp;->l(Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic c(Ll/jl80;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p1, "e_intl_ban_alert_cancel_btn"

    .line 2
    .line 3
    const-string v0, "p_intl_ban_chatorswipe_alert"

    .line 4
    .line 5
    invoke-static {p1, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic d(Ll/qyp;Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qyp;->k(Ll/l4g0;Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic e(Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Ll/jl80;Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p2, "dialog"

    .line 2
    .line 3
    invoke-static {p0, p2}, Ll/hxf;->h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "e_intl_ban_alert_verify_btn"

    .line 7
    .line 8
    const-string p2, "p_intl_ban_chatorswipe_alert"

    .line 9
    .line 10
    invoke-static {p0, p2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic g(Ll/qyp;Lcom/p1/mobile/putong/data/JailedGroupChat;Lv/VText;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/qyp;->j(Lcom/p1/mobile/putong/data/JailedGroupChat;Lv/VText;Ljava/lang/Long;)V

    return-void
.end method

.method public static i()Ll/qyp;
    .locals 2

    .line 1
    sget-object v0, Ll/qyp;->c:Ll/qyp;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/qyp;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/qyp;->c:Ll/qyp;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/qyp;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/qyp;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/qyp;->c:Ll/qyp;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/qyp;->c:Ll/qyp;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final h(J)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sub-long/2addr p1, v0

    .line 6
    const-wide/32 v0, 0x5265c00

    .line 7
    .line 8
    .line 9
    div-long v2, p1, v0

    .line 10
    .line 11
    long-to-int p0, v2

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long v2, p1, v2

    .line 15
    .line 16
    if-gtz v2, :cond_0

    .line 17
    .line 18
    const-string p0, ""

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    sget-object v3, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    if-le p0, v4, :cond_1

    .line 33
    .line 34
    sget v4, Lcom/p1/mobile/putong/core/R$string;->N3:I

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    sget v4, Lcom/p1/mobile/putong/core/R$string;->M3:I

    .line 38
    .line 39
    :goto_0
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    if-lez p0, :cond_2

    .line 51
    .line 52
    int-to-long v3, p0

    .line 53
    mul-long/2addr v3, v0

    .line 54
    sub-long/2addr p1, v3

    .line 55
    :cond_2
    invoke-static {p1, p2}, Ll/tzi0;->b(J)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance p2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v0, " "

    .line 62
    .line 63
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    if-lez p0, :cond_3

    .line 67
    .line 68
    new-instance p0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    :cond_3
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    return-object p0
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/data/JailedGroupChat;Lv/VText;Ljava/lang/Long;)V
    .locals 2

    .line 1
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 2
    .line 3
    double-to-long v0, v0

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/qyp;->h(J)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-nez p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic k(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/qyp;->b:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    iput-object p2, p0, Ll/qyp;->b:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/qyp;->a:Landroid/os/CountDownTimer;

    .line 2
    .line 3
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/qyp;->a:Landroid/os/CountDownTimer;

    .line 10
    .line 11
    invoke-virtual {p2}, Landroid/os/CountDownTimer;->cancel()V

    .line 12
    .line 13
    .line 14
    const/4 p2, 0x0

    .line 15
    iput-object p2, p0, Ll/qyp;->a:Landroid/os/CountDownTimer;

    .line 16
    .line 17
    :cond_0
    invoke-static {p1}, Ll/w1e;->e(Ll/l4g0;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final m(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 11
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_7

    .line 12
    .line 13
    :cond_0
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 33
    .line 34
    if-eqz p2, :cond_1

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 37
    .line 38
    iget-object v1, v1, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    iget-object v1, v1, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    move-object v1, v2

    .line 47
    :goto_0
    if-nez v1, :cond_3

    .line 48
    .line 49
    goto/16 :goto_7

    .line 50
    .line 51
    :cond_3
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {v3}, Ll/kyb;->a(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/4 v4, 0x0

    .line 58
    if-nez v3, :cond_4

    .line 59
    .line 60
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 61
    .line 62
    const-string v3, "RISK_TAG_INTL_ALLOW_VERIFICATION_APPEAL"

    .line 63
    .line 64
    invoke-static {v3}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-interface {v0, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    const/4 v0, 0x1

    .line 75
    goto :goto_1

    .line 76
    :cond_4
    move v0, v4

    .line 77
    :goto_1
    const-class v3, Lcom/p1/mobile/android/app/Dialog;

    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    const-string v5, "p_intl_ban_chatorswipe_alert"

    .line 84
    .line 85
    invoke-static {v5, v3}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    new-instance v5, Lorg/json/JSONObject;

    .line 90
    .line 91
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 92
    .line 93
    .line 94
    :try_start_0
    const-string v6, "ban_alert_verify_or_appeal"

    .line 95
    .line 96
    if-eqz v0, :cond_5

    .line 97
    .line 98
    const-string v7, "verify"

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_5
    const-string v7, "appeal"

    .line 102
    .line 103
    :goto_2
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v5}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 107
    .line 108
    .line 109
    :catch_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    sget v6, Ll/kec0;->e6:I

    .line 114
    .line 115
    invoke-virtual {v5, v6, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    new-instance v5, Ll/jl80$a;

    .line 120
    .line 121
    invoke-direct {v5, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v5, v2}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 125
    .line 126
    .line 127
    move-result-object v5

    .line 128
    invoke-virtual {v5, v4}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-virtual {v5}, Ll/jl80$a;->O()Ll/jl80;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-virtual {v5, v4}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 137
    .line 138
    .line 139
    sget v6, Ll/adc0;->je:I

    .line 140
    .line 141
    invoke-virtual {v2, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    check-cast v6, Lv/VText;

    .line 146
    .line 147
    sget v7, Ll/adc0;->bd:I

    .line 148
    .line 149
    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v7

    .line 153
    check-cast v7, Lv/VText;

    .line 154
    .line 155
    sget v8, Ll/adc0;->H0:I

    .line 156
    .line 157
    invoke-virtual {v2, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 158
    .line 159
    .line 160
    move-result-object v8

    .line 161
    check-cast v8, Lv/VText;

    .line 162
    .line 163
    sget v9, Ll/adc0;->G0:I

    .line 164
    .line 165
    invoke-virtual {v2, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 166
    .line 167
    .line 168
    move-result-object v9

    .line 169
    check-cast v9, Lv/VText;

    .line 170
    .line 171
    sget v10, Ll/adc0;->be:I

    .line 172
    .line 173
    invoke-virtual {v2, v10}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    check-cast v2, Lv/VText;

    .line 178
    .line 179
    if-eqz p2, :cond_7

    .line 180
    .line 181
    sget p2, Lcom/p1/mobile/putong/core/R$string;->q0:I

    .line 182
    .line 183
    invoke-virtual {v6, p2}, Landroid/widget/TextView;->setText(I)V

    .line 184
    .line 185
    .line 186
    if-eqz v0, :cond_6

    .line 187
    .line 188
    sget p2, Lcom/p1/mobile/putong/core/R$string;->o0:I

    .line 189
    .line 190
    goto :goto_3

    .line 191
    :cond_6
    sget p2, Lcom/p1/mobile/putong/core/R$string;->p0:I

    .line 192
    .line 193
    :goto_3
    invoke-virtual {v7, p2}, Landroid/widget/TextView;->setText(I)V

    .line 194
    .line 195
    .line 196
    goto :goto_5

    .line 197
    :cond_7
    sget p2, Lcom/p1/mobile/putong/core/R$string;->l0:I

    .line 198
    .line 199
    invoke-virtual {v6, p2}, Landroid/widget/TextView;->setText(I)V

    .line 200
    .line 201
    .line 202
    if-eqz v0, :cond_8

    .line 203
    .line 204
    sget p2, Lcom/p1/mobile/putong/core/R$string;->j0:I

    .line 205
    .line 206
    goto :goto_4

    .line 207
    :cond_8
    sget p2, Lcom/p1/mobile/putong/core/R$string;->k0:I

    .line 208
    .line 209
    :goto_4
    invoke-virtual {v7, p2}, Landroid/widget/TextView;->setText(I)V

    .line 210
    .line 211
    .line 212
    :goto_5
    if-eqz v0, :cond_9

    .line 213
    .line 214
    new-instance p2, Ll/jyp;

    .line 215
    .line 216
    invoke-direct {p2, p1, v5}, Ll/jyp;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;)V

    .line 217
    .line 218
    .line 219
    invoke-static {v8, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 220
    .line 221
    .line 222
    new-instance p2, Ll/kyp;

    .line 223
    .line 224
    invoke-direct {p2, v5}, Ll/kyp;-><init>(Ll/jl80;)V

    .line 225
    .line 226
    .line 227
    invoke-static {v9, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 228
    .line 229
    .line 230
    goto :goto_6

    .line 231
    :cond_9
    sget-object p2, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 232
    .line 233
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Tr:I

    .line 234
    .line 235
    invoke-virtual {p2, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p2

    .line 239
    invoke-virtual {v8, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 240
    .line 241
    .line 242
    invoke-static {v9, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 243
    .line 244
    .line 245
    new-instance p2, Ll/lyp;

    .line 246
    .line 247
    invoke-direct {p2, v5}, Ll/lyp;-><init>(Ll/jl80;)V

    .line 248
    .line 249
    .line 250
    invoke-static {v8, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 251
    .line 252
    .line 253
    :goto_6
    iget-wide v6, v1, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 254
    .line 255
    double-to-long v6, v6

    .line 256
    invoke-virtual {p0, v6, v7}, Ll/qyp;->h(J)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object p2

    .line 260
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-nez v0, :cond_a

    .line 265
    .line 266
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 267
    .line 268
    .line 269
    :cond_a
    iget-object p2, p0, Ll/qyp;->b:Ll/kcg0;

    .line 270
    .line 271
    invoke-static {p2}, Ll/psd0;->z(Ll/kcg0;)V

    .line 272
    .line 273
    .line 274
    const-wide/16 v6, 0x1

    .line 275
    .line 276
    sget-object p2, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 277
    .line 278
    invoke-static {v6, v7, p2}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 279
    .line 280
    .line 281
    move-result-object p2

    .line 282
    invoke-virtual {p2}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 283
    .line 284
    .line 285
    move-result-object p2

    .line 286
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 287
    .line 288
    .line 289
    move-result-object v0

    .line 290
    invoke-virtual {p2, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 291
    .line 292
    .line 293
    move-result-object p2

    .line 294
    new-instance v0, Ll/myp;

    .line 295
    .line 296
    invoke-direct {v0, p0, v1, v2}, Ll/myp;-><init>(Ll/qyp;Lcom/p1/mobile/putong/data/JailedGroupChat;Lv/VText;)V

    .line 297
    .line 298
    .line 299
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    invoke-virtual {p2, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 304
    .line 305
    .line 306
    move-result-object p2

    .line 307
    iput-object p2, p0, Ll/qyp;->b:Ll/kcg0;

    .line 308
    .line 309
    new-instance p2, Ll/nyp;

    .line 310
    .line 311
    invoke-direct {p2, p0, v3}, Ll/nyp;-><init>(Ll/qyp;Ll/l4g0;)V

    .line 312
    .line 313
    .line 314
    invoke-virtual {v5, p2}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 315
    .line 316
    .line 317
    invoke-static {p1}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 318
    .line 319
    .line 320
    move-result p0

    .line 321
    if-eqz p0, :cond_b

    .line 322
    .line 323
    invoke-virtual {v5}, Ll/jl80;->show()V

    .line 324
    .line 325
    .line 326
    invoke-static {v3}, Ll/w1e;->f(Ll/l4g0;)V

    .line 327
    .line 328
    .line 329
    :cond_b
    :goto_7
    return-void
.end method

.method public n(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 2
    .param p1    # Lcom/p1/mobile/android/app/Act;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 18
    .line 19
    const-string v1, "pending"

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/pk50;->f()Ll/rj50;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    sget-object p2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_avatar_verification_review_verification_center:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    invoke-virtual {p0, p1, p2}, Ll/rj50;->s0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/qyp;->m(Lcom/p1/mobile/android/app/Act;Z)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public o(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V
    .locals 11

    .line 1
    const-class v0, Lcom/p1/mobile/android/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_risk_user_warn_alert"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lorg/json/JSONObject;

    .line 14
    .line 15
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 16
    .line 17
    .line 18
    :try_start_0
    const-string v2, "user_risk_type"

    .line 19
    .line 20
    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    .line 26
    :catch_0
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    sget v1, Ll/kec0;->d6:I

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    invoke-virtual {p2, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    new-instance v1, Ll/jl80$a;

    .line 38
    .line 39
    invoke-direct {v1, p1}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p2}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    const/4 v2, 0x0

    .line 47
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-virtual {v1}, Ll/jl80$a;->O()Ll/jl80;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v1, v2}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 56
    .line 57
    .line 58
    sget v3, Ll/adc0;->P1:I

    .line 59
    .line 60
    invoke-virtual {p2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 65
    .line 66
    invoke-static {p3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 67
    .line 68
    .line 69
    move-result-object p3

    .line 70
    invoke-virtual {v3, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .line 72
    .line 73
    sget p3, Ll/adc0;->L0:I

    .line 74
    .line 75
    invoke-virtual {p2, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    move-object v9, p2

    .line 80
    check-cast v9, Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 81
    .line 82
    new-instance p2, Ll/oyp;

    .line 83
    .line 84
    invoke-direct {p2, v1}, Ll/oyp;-><init>(Ll/jl80;)V

    .line 85
    .line 86
    .line 87
    invoke-static {v9, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v9, v2}, Landroid/view/View;->setClickable(Z)V

    .line 91
    .line 92
    .line 93
    iget-object p2, p0, Ll/qyp;->a:Landroid/os/CountDownTimer;

    .line 94
    .line 95
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    if-eqz p2, :cond_0

    .line 100
    .line 101
    iget-object p2, p0, Ll/qyp;->a:Landroid/os/CountDownTimer;

    .line 102
    .line 103
    invoke-virtual {p2}, Landroid/os/CountDownTimer;->cancel()V

    .line 104
    .line 105
    .line 106
    :cond_0
    new-instance v3, Ll/qyp$a;

    .line 107
    .line 108
    const-wide/16 v5, 0xbb8

    .line 109
    .line 110
    const-wide/16 v7, 0x3e8

    .line 111
    .line 112
    move-object v4, p0

    .line 113
    move-object v10, p1

    .line 114
    invoke-direct/range {v3 .. v10}, Ll/qyp$a;-><init>(Ll/qyp;JJLcom/p1/mobile/putong/core/ui/VText_Bold;Lcom/p1/mobile/android/app/Act;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3}, Landroid/os/CountDownTimer;->start()Landroid/os/CountDownTimer;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    iput-object p0, v4, Ll/qyp;->a:Landroid/os/CountDownTimer;

    .line 122
    .line 123
    new-instance p0, Ll/pyp;

    .line 124
    .line 125
    invoke-direct {p0, v4, v0}, Ll/pyp;-><init>(Ll/qyp;Ll/l4g0;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v1, p0}, Ll/g1e;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v10}, Ll/w20;->f(Lcom/p1/mobile/android/app/Act;)Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-eqz p0, :cond_1

    .line 136
    .line 137
    invoke-virtual {v1}, Ll/jl80;->show()V

    .line 138
    .line 139
    .line 140
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 141
    .line 142
    .line 143
    :cond_1
    return-void
.end method
