.class public final Ll/tx0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile n:Ll/tx0;


# instance fields
.field public a:Ll/byd0;

.field public b:Ll/byd0;

.field public c:Ll/vxd0;

.field public d:Ll/vxd0;

.field public e:Ll/jxd0;

.field public f:Ll/jxd0;

.field public g:Ll/byd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public h:Ll/vxd0;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SV_USE_DUP_ID"
        }
    .end annotation
.end field

.field public i:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

.field public j:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

.field public k:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

.field public l:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

.field public m:Lcom/p1/mobile/putong/core/data/RateAlertSetting;


# direct methods
.method public constructor <init>()V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/byd0;

    .line 5
    .line 6
    const-wide/16 v1, 0x0

    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-string v2, "LastAPPStartTime"

    .line 13
    .line 14
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/tx0;->a:Ll/byd0;

    .line 18
    .line 19
    new-instance v0, Ll/byd0;

    .line 20
    .line 21
    const-string v2, "AppActiveTimeOneDay"

    .line 22
    .line 23
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/tx0;->b:Ll/byd0;

    .line 27
    .line 28
    new-instance v0, Ll/vxd0;

    .line 29
    .line 30
    const-string v2, "APPStartCountOneDay"

    .line 31
    .line 32
    const/4 v3, 0x0

    .line 33
    invoke-direct {v0, v2, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Ll/tx0;->c:Ll/vxd0;

    .line 37
    .line 38
    new-instance v0, Ll/vxd0;

    .line 39
    .line 40
    const-string v2, "ContinuousActiveDays"

    .line 41
    .line 42
    invoke-direct {v0, v2, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 43
    .line 44
    .line 45
    iput-object v0, p0, Ll/tx0;->d:Ll/vxd0;

    .line 46
    .line 47
    new-instance v0, Ll/jxd0;

    .line 48
    .line 49
    const-string v2, "CanShowAPPGuideDlg"

    .line 50
    .line 51
    sget-object v4, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-direct {v0, v2, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Ll/tx0;->e:Ll/jxd0;

    .line 57
    .line 58
    new-instance v0, Ll/jxd0;

    .line 59
    .line 60
    const-string v2, "hasRank"

    .line 61
    .line 62
    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 63
    .line 64
    invoke-direct {v0, v2, v4}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Ll/tx0;->f:Ll/jxd0;

    .line 68
    .line 69
    new-instance v0, Ll/byd0;

    .line 70
    .line 71
    const-string v2, "LastShowAPPStoreGuideDlgTime"

    .line 72
    .line 73
    invoke-direct {v0, v2, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Ll/tx0;->g:Ll/byd0;

    .line 77
    .line 78
    new-instance v0, Ll/vxd0;

    .line 79
    .line 80
    const-string v1, "AppStoreGuideDlgShowCount"

    .line 81
    .line 82
    invoke-direct {v0, v1, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 83
    .line 84
    .line 85
    iput-object v0, p0, Ll/tx0;->h:Ll/vxd0;

    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->d:Ll/yy6;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/jf00;->g()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 94
    .line 95
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-eqz v1, :cond_5

    .line 100
    .line 101
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 102
    .line 103
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-eqz v1, :cond_5

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    if-eqz v1, :cond_5

    .line 120
    .line 121
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    check-cast v1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 126
    .line 127
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    if-eqz v2, :cond_0

    .line 132
    .line 133
    iget v2, v1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->activeDays:I

    .line 134
    .line 135
    if-lez v2, :cond_1

    .line 136
    .line 137
    invoke-virtual {p0, v1}, Ll/tx0;->y(Lcom/p1/mobile/putong/core/data/RateAlertSetting;)Z

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    if-eqz v2, :cond_1

    .line 142
    .line 143
    iput-object v1, p0, Ll/tx0;->i:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_1
    iget v2, v1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->appOpenTimes:I

    .line 147
    .line 148
    if-lez v2, :cond_2

    .line 149
    .line 150
    invoke-virtual {p0, v1}, Ll/tx0;->y(Lcom/p1/mobile/putong/core/data/RateAlertSetting;)Z

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    if-eqz v2, :cond_2

    .line 155
    .line 156
    iput-object v1, p0, Ll/tx0;->j:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_2
    iget v2, v1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->useMinutes:I

    .line 160
    .line 161
    if-lez v2, :cond_3

    .line 162
    .line 163
    invoke-virtual {p0, v1}, Ll/tx0;->y(Lcom/p1/mobile/putong/core/data/RateAlertSetting;)Z

    .line 164
    .line 165
    .line 166
    move-result v2

    .line 167
    if-eqz v2, :cond_3

    .line 168
    .line 169
    iput-object v1, p0, Ll/tx0;->k:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_3
    invoke-virtual {p0, v1}, Ll/tx0;->y(Lcom/p1/mobile/putong/core/data/RateAlertSetting;)Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    if-eqz v2, :cond_4

    .line 177
    .line 178
    iput-object v1, p0, Ll/tx0;->l:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_4
    iget v2, v1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->profilePictures:I

    .line 182
    .line 183
    if-lez v2, :cond_0

    .line 184
    .line 185
    iput-object v1, p0, Ll/tx0;->m:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 186
    .line 187
    goto :goto_0

    .line 188
    :cond_5
    return-void
.end method

.method public static I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V
    .locals 10

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_4

    .line 14
    .line 15
    :cond_0
    const-string v0, "p_promote_appstore_review_popup"

    .line 16
    .line 17
    const-string v1, "showAPPStoreRankGuideDlg"

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    const-string v1, "thanks"

    .line 26
    .line 27
    :goto_0
    move-object v9, v1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    const-string v1, "later"

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :goto_1
    const-string v2, "passive"

    .line 33
    .line 34
    const-string v3, "alert"

    .line 35
    .line 36
    const-string v4, "alert_self_definition_basic"

    .line 37
    .line 38
    const-string v5, "appstore_rating"

    .line 39
    .line 40
    const-string v6, "swipe_page"

    .line 41
    .line 42
    const-string v7, "null"

    .line 43
    .line 44
    move-object v8, p3

    .line 45
    invoke-static/range {v2 .. v9}, Ll/tx0;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-virtual {v0, p3}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 50
    .line 51
    .line 52
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 53
    .line 54
    .line 55
    move-result-object p3

    .line 56
    sget v1, Ll/kec0;->Jb:I

    .line 57
    .line 58
    const/4 v2, 0x0

    .line 59
    invoke-virtual {p3, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    sget v1, Ll/adc0;->je:I

    .line 64
    .line 65
    invoke-virtual {p3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    check-cast v1, Lv/VText;

    .line 70
    .line 71
    sget v2, Ll/adc0;->bd:I

    .line 72
    .line 73
    invoke-virtual {p3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v2

    .line 77
    check-cast v2, Lv/VText;

    .line 78
    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Wl:I

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_2
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Yl:I

    .line 85
    .line 86
    :goto_2
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 87
    .line 88
    .line 89
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Sl:I

    .line 90
    .line 91
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(I)V

    .line 92
    .line 93
    .line 94
    new-instance v1, Ll/jl80$a;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, p3}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 100
    .line 101
    .line 102
    move-result-object p3

    .line 103
    const/4 v1, 0x1

    .line 104
    invoke-virtual {p3, v1}, Ll/jl80$a;->e0(Z)Ll/jl80$a;

    .line 105
    .line 106
    .line 107
    move-result-object p3

    .line 108
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Rl:I

    .line 109
    .line 110
    new-instance v3, Ll/jx0;

    .line 111
    .line 112
    invoke-direct {v3, p0}, Ll/jx0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p3, v2, v3}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Ts:I

    .line 120
    .line 121
    const/4 v2, 0x0

    .line 122
    new-array v3, v2, [Ljava/lang/Object;

    .line 123
    .line 124
    invoke-virtual {p0, p3, v3}, Ll/jl80$a;->V(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    invoke-virtual {p0, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    new-instance p3, Ll/kx0;

    .line 133
    .line 134
    invoke-direct {p3, v0}, Ll/kx0;-><init>(Ll/l4g0;)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {p0, p3}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 146
    .line 147
    .line 148
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 149
    .line 150
    .line 151
    move-result-object p3

    .line 152
    iget-object p3, p3, Ll/tx0;->h:Ll/vxd0;

    .line 153
    .line 154
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iget-object v0, v0, Ll/tx0;->h:Ll/vxd0;

    .line 159
    .line 160
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    check-cast v0, Ljava/lang/Integer;

    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    add-int/2addr v0, v1

    .line 171
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {p3, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 179
    .line 180
    .line 181
    move-result-object p3

    .line 182
    iget-object p3, p3, Ll/tx0;->g:Ll/byd0;

    .line 183
    .line 184
    invoke-static {}, Ll/pzi0;->o()J

    .line 185
    .line 186
    .line 187
    move-result-wide v2

    .line 188
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p3, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0}, Ll/jl80;->L()Landroid/view/View;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    sget p3, Ll/adc0;->J:I

    .line 200
    .line 201
    invoke-virtual {p0, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 202
    .line 203
    .line 204
    move-result-object p0

    .line 205
    check-cast p0, Landroid/widget/RatingBar;

    .line 206
    .line 207
    if-eqz p1, :cond_3

    .line 208
    .line 209
    goto :goto_3

    .line 210
    :cond_3
    const/high16 p2, 0x40a00000    # 5.0f

    .line 211
    .line 212
    :goto_3
    invoke-virtual {p0, p2}, Landroid/widget/RatingBar;->setRating(F)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0, v1}, Landroid/widget/RatingBar;->setIsIndicator(Z)V

    .line 216
    .line 217
    .line 218
    :cond_4
    :goto_4
    return-void
.end method

.method public static J(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->j4()Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ll/ox0;

    .line 20
    .line 21
    invoke-direct {v2, v0, p0}, Ll/ox0;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static L(Lcom/p1/mobile/android/app/Act;F)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const-string v0, "p_feedback_input_popup"

    .line 16
    .line 17
    const-string v1, "showRankFeedbackDlg"

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v6, "null"

    .line 24
    .line 25
    const/4 v7, 0x0

    .line 26
    const-string v1, "passive"

    .line 27
    .line 28
    const-string v2, "alert"

    .line 29
    .line 30
    const-string v3, "alert_self_definition_basic"

    .line 31
    .line 32
    const-string v4, "appstore_rating"

    .line 33
    .line 34
    const-string v5, "swipe_page"

    .line 35
    .line 36
    invoke-static/range {v1 .. v7}, Ll/tx0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Ll/jl80$a;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    sget v2, Ll/kec0;->Ib:I

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Ll/jl80$a;->Q(I)Ll/jl80$a;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v2, 0x0

    .line 55
    invoke-virtual {v1, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    new-instance v3, Ll/px0;

    .line 60
    .line 61
    invoke-direct {v3, v0}, Ll/px0;-><init>(Ll/l4g0;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v1, v3}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ll/jl80$a;->O()Ll/jl80;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v5}, Ll/jl80;->show()V

    .line 73
    .line 74
    .line 75
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v5}, Ll/jl80;->L()Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v1, Ll/adc0;->dc:I

    .line 83
    .line 84
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    check-cast v1, Landroid/widget/TextView;

    .line 89
    .line 90
    sget v3, Ll/adc0;->l4:I

    .line 91
    .line 92
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 93
    .line 94
    .line 95
    move-result-object v3

    .line 96
    move-object v4, v3

    .line 97
    check-cast v4, Landroid/widget/EditText;

    .line 98
    .line 99
    const-string v3, "input_method"

    .line 100
    .line 101
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    move-object v8, v3

    .line 106
    check-cast v8, Landroid/view/inputmethod/InputMethodManager;

    .line 107
    .line 108
    const/4 v3, 0x2

    .line 109
    invoke-virtual {v8, v3, v2}, Landroid/view/inputmethod/InputMethodManager;->toggleSoftInput(II)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {v4}, Landroid/view/View;->requestFocus()Z

    .line 113
    .line 114
    .line 115
    sget v2, Ll/adc0;->k4:I

    .line 116
    .line 117
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    check-cast v0, Landroid/widget/ImageView;

    .line 122
    .line 123
    new-instance v3, Ll/qx0;

    .line 124
    .line 125
    move-object v6, p0

    .line 126
    move v7, p1

    .line 127
    invoke-direct/range {v3 .. v8}, Ll/qx0;-><init>(Landroid/widget/EditText;Ll/jl80;Lcom/p1/mobile/android/app/Act;FLandroid/view/inputmethod/InputMethodManager;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 131
    .line 132
    .line 133
    new-instance p0, Ll/rx0;

    .line 134
    .line 135
    invoke-direct {p0, v5, v8}, Ll/rx0;-><init>(Ll/jl80;Landroid/view/inputmethod/InputMethodManager;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 139
    .line 140
    .line 141
    :cond_1
    :goto_0
    return-void
.end method

.method public static M(Lcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "p_feedback_acknowledge_popup"

    .line 15
    .line 16
    const-string v1, "showRankFeedbackFinishedDlg"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v6, "null"

    .line 23
    .line 24
    const/4 v7, 0x0

    .line 25
    const-string v1, "passive"

    .line 26
    .line 27
    const-string v2, "alert"

    .line 28
    .line 29
    const-string v3, "alert_self_definition_basic"

    .line 30
    .line 31
    const-string v4, "appstore_rating"

    .line 32
    .line 33
    const-string v5, "swipe_page"

    .line 34
    .line 35
    invoke-static/range {v1 .. v7}, Ll/tx0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/jl80$a;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    sget p0, Lcom/p1/mobile/putong/core/R$string;->zm:I

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    new-array v3, v2, [Ljava/lang/Object;

    .line 51
    .line 52
    invoke-virtual {v1, p0, v3}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Ql:I

    .line 57
    .line 58
    new-array v3, v2, [Ljava/lang/Object;

    .line 59
    .line 60
    invoke-virtual {p0, v1, v3}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0, v2}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    new-instance v1, Ll/ix0;

    .line 69
    .line 70
    invoke-direct {v1, v0}, Ll/ix0;-><init>(Ll/l4g0;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    sget v1, Lcom/p1/mobile/putong/core/R$string;->m:I

    .line 78
    .line 79
    invoke-virtual {p0, v1}, Ll/jl80$a;->Z(I)Ll/jl80$a;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p0}, Ll/jl80$a;->O()Ll/jl80;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p0}, Ll/jl80;->show()V

    .line 88
    .line 89
    .line 90
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 91
    .line 92
    .line 93
    :cond_1
    :goto_0
    return-void
.end method

.method public static N(Lcom/p1/mobile/android/app/Act;F)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const-string v0, "p_go_to_feedback_popup"

    .line 15
    .line 16
    const-string v1, "showRankFeedbackGuideDlg"

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const-string v6, "null"

    .line 23
    .line 24
    const/4 v7, 0x0

    .line 25
    const-string v1, "passive"

    .line 26
    .line 27
    const-string v2, "alert"

    .line 28
    .line 29
    const-string v3, "alert_self_definition_basic"

    .line 30
    .line 31
    const-string v4, "appstore_rating"

    .line 32
    .line 33
    const-string v5, "swipe_page"

    .line 34
    .line 35
    invoke-static/range {v1 .. v7}, Ll/tx0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/jl80$a;

    .line 43
    .line 44
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Ul:I

    .line 48
    .line 49
    const/4 v3, 0x0

    .line 50
    new-array v4, v3, [Ljava/lang/Object;

    .line 51
    .line 52
    invoke-virtual {v1, v2, v4}, Ll/jl80$a;->x0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Tl:I

    .line 57
    .line 58
    new-array v4, v3, [Ljava/lang/Object;

    .line 59
    .line 60
    invoke-virtual {v1, v2, v4}, Ll/jl80$a;->s0(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {v1, v3}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    sget v2, Lcom/p1/mobile/putong/core/R$string;->cm:I

    .line 69
    .line 70
    new-instance v4, Ll/mx0;

    .line 71
    .line 72
    invoke-direct {v4, p0, p1}, Ll/mx0;-><init>(Lcom/p1/mobile/android/app/Act;F)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1, v2, v4}, Ll/jl80$a;->a0(ILjava/lang/Runnable;)Ll/jl80$a;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Ts:I

    .line 80
    .line 81
    new-array v1, v3, [Ljava/lang/Object;

    .line 82
    .line 83
    invoke-virtual {p0, p1, v1}, Ll/jl80$a;->V(I[Ljava/lang/Object;)Ll/jl80$a;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    new-instance p1, Ll/nx0;

    .line 88
    .line 89
    invoke-direct {p1, v0}, Ll/nx0;-><init>(Ll/l4g0;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, p1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-virtual {p0}, Ll/jl80$a;->r0()Ll/jl80;

    .line 97
    .line 98
    .line 99
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    :goto_0
    return-void
.end method

.method public static O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const-string v0, "p_appstore_rating_filter_popup"

    .line 16
    .line 17
    const-string v1, "showRankGuideDlg"

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v5, "swipe_page"

    .line 24
    .line 25
    const-string v6, "null"

    .line 26
    .line 27
    const-string v1, "passive"

    .line 28
    .line 29
    const-string v2, "alert"

    .line 30
    .line 31
    const-string v3, "alert_self_definition_basic"

    .line 32
    .line 33
    const-string v4, "appstore_rating"

    .line 34
    .line 35
    move-object v7, p1

    .line 36
    invoke-static/range {v1 .. v7}, Ll/tx0;->m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v0, p1}, Ll/l4g0;->o(Lorg/json/JSONObject;)V

    .line 41
    .line 42
    .line 43
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget v1, Ll/kec0;->Jb:I

    .line 48
    .line 49
    const/4 v2, 0x0

    .line 50
    invoke-virtual {p1, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    sget v1, Ll/adc0;->je:I

    .line 55
    .line 56
    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Lv/VText;

    .line 61
    .line 62
    sget v2, Ll/adc0;->bd:I

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    check-cast v2, Lv/VText;

    .line 69
    .line 70
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Vl:I

    .line 71
    .line 72
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 73
    .line 74
    .line 75
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Xl:I

    .line 76
    .line 77
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(I)V

    .line 78
    .line 79
    .line 80
    new-instance v1, Ll/jl80$a;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, p1}, Ll/jl80$a;->R(Landroid/view/View;)Ll/jl80$a;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    const/4 v1, 0x1

    .line 90
    invoke-virtual {p1, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    new-instance v1, Ll/lx0;

    .line 95
    .line 96
    invoke-direct {v1, v0}, Ll/lx0;-><init>(Ll/l4g0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {v0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 108
    .line 109
    .line 110
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v0, v0, Ll/tx0;->g:Ll/byd0;

    .line 115
    .line 116
    invoke-static {}, Ll/pzi0;->o()J

    .line 117
    .line 118
    .line 119
    move-result-wide v1

    .line 120
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Ll/jl80;->L()Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    sget v1, Ll/adc0;->J:I

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Landroid/widget/RatingBar;

    .line 138
    .line 139
    new-instance v1, Ll/tx0$a;

    .line 140
    .line 141
    invoke-direct {v1, p0, p1, v7}, Ll/tx0$a;-><init>(Lcom/p1/mobile/android/app/Act;Ll/jl80;Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v0, v1}, Landroid/widget/RatingBar;->setOnRatingBarChangeListener(Landroid/widget/RatingBar$OnRatingBarChangeListener;)V

    .line 145
    .line 146
    .line 147
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic a(Ll/jl80;Landroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/jl80;->L()Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const/4 p2, 0x0

    .line 13
    invoke-virtual {p1, p0, p2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic b(Ljava/util/concurrent/atomic/AtomicBoolean;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/VerificationCenter;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 22
    .line 23
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p2, 0x0

    .line 27
    :goto_0
    const-string v0, "verified"

    .line 28
    .line 29
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_2

    .line 34
    .line 35
    const/4 p2, 0x1

    .line 36
    invoke-virtual {p0, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 37
    .line 38
    .line 39
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    invoke-virtual {p2}, Ll/tx0;->p()I

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    if-le p0, p2, :cond_2

    .line 62
    .line 63
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/tx0;->E()Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    const-string p2, "verification"

    .line 72
    .line 73
    if-eqz p0, :cond_1

    .line 74
    .line 75
    invoke-static {p1, p2}, Ll/tx0;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/tx0;->z()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_2

    .line 87
    .line 88
    const/4 p0, 0x0

    .line 89
    const/high16 v0, 0x40a00000    # 5.0f

    .line 90
    .line 91
    invoke-static {p1, p0, v0, p2}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_2
    return-void
.end method

.method public static synthetic c(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;F)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_go_to_feedback_button"

    .line 5
    .line 6
    const-string v2, "p_go_to_feedback_popup"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p0, p1}, Ll/tx0;->L(Lcom/p1/mobile/android/app/Act;F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic f(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Ll/sfj0$a;

    .line 3
    .line 4
    const-string v1, "e_promote_appstore_popup_five_star_button"

    .line 5
    .line 6
    const-string v2, "p_promote_appstore_review_popup"

    .line 7
    .line 8
    invoke-static {v1, v2, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Ll/tx0;->e:Ll/jxd0;

    .line 16
    .line 17
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :try_start_0
    invoke-static {p0}, Ll/uxw;->d(Landroid/app/Activity;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception p0

    .line 28
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    sget p0, Lcom/p1/mobile/putong/core/R$string;->fm:I

    .line 38
    .line 39
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 40
    .line 41
    .line 42
    :cond_0
    return-void
.end method

.method public static synthetic h(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic i(Landroid/widget/EditText;Ll/jl80;Lcom/p1/mobile/android/app/Act;FLandroid/view/inputmethod/InputMethodManager;Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 2
    .line 3
    .line 4
    move-result-object p5

    .line 5
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p5

    .line 9
    if-nez p5, :cond_0

    .line 10
    .line 11
    const-string p5, "p_feedback_input_popup"

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    new-array v1, v0, [Ll/sfj0$a;

    .line 15
    .line 16
    const-string v2, "e_feedback_input_popup_submit_button"

    .line 17
    .line 18
    invoke-static {v2, p5, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p1}, Ll/g1e;->dismiss()V

    .line 30
    .line 31
    .line 32
    invoke-static {p2}, Ll/tx0;->M(Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 36
    .line 37
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->X:Ll/pwa;

    .line 38
    .line 39
    invoke-virtual {p2, p0, p3}, Ll/pwa;->i3(Ljava/lang/String;F)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Ll/jl80;->L()Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p4, p0, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 51
    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public static synthetic j(Ll/tx0;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tx0;->H(Lcom/p1/mobile/android/app/Act;)V

    return-void
.end method

.method public static synthetic k(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/android/app/Act;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tx0;->N(Lcom/p1/mobile/android/app/Act;F)V

    return-void
.end method

.method public static m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "tooltips_trigger_mode"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p0, "tooltips_type"

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string p0, "tooltips_type_ui"

    .line 17
    .line 18
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string p0, "tooltips_trigger_module"

    .line 22
    .line 23
    invoke-virtual {v0, p0, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string p0, "tooltips_trigger_page"

    .line 27
    .line 28
    invoke-virtual {v0, p0, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string p0, "tooltips_trigger_reason"

    .line 32
    .line 33
    invoke-virtual {v0, p0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_0

    .line 41
    .line 42
    const-string p0, "inapp_rating_trigger_type"

    .line 43
    .line 44
    invoke-virtual {v0, p0, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :catch_0
    move-exception p0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    return-object v0

    .line 51
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    return-object v0
.end method

.method public static n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    const-string v1, "tooltips_trigger_mode"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 9
    .line 10
    .line 11
    const-string p0, "tooltips_type"

    .line 12
    .line 13
    invoke-virtual {v0, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 14
    .line 15
    .line 16
    const-string p0, "tooltips_type_ui"

    .line 17
    .line 18
    invoke-virtual {v0, p0, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 19
    .line 20
    .line 21
    const-string p0, "tooltips_trigger_module"

    .line 22
    .line 23
    invoke-virtual {v0, p0, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 24
    .line 25
    .line 26
    const-string p0, "tooltips_trigger_page"

    .line 27
    .line 28
    invoke-virtual {v0, p0, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 29
    .line 30
    .line 31
    const-string p0, "tooltips_trigger_reason"

    .line 32
    .line 33
    invoke-virtual {v0, p0, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 34
    .line 35
    .line 36
    invoke-static {p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    if-nez p0, :cond_0

    .line 41
    .line 42
    const-string p0, "inapp_rating_trigger_type"

    .line 43
    .line 44
    invoke-virtual {v0, p0, p6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception p0

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    const-string p0, "review_popup_type"

    .line 51
    .line 52
    invoke-virtual {v0, p0, p7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .line 54
    .line 55
    return-object v0

    .line 56
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 57
    .line 58
    .line 59
    return-object v0
.end method

.method public static o()Ll/tx0;
    .locals 2

    .line 1
    sget-object v0, Ll/tx0;->n:Ll/tx0;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/tx0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/tx0;->n:Ll/tx0;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/tx0;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/tx0;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/tx0;->n:Ll/tx0;

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
    sget-object v0, Ll/tx0;->n:Ll/tx0;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public B()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final C()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final D()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public E()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final F(I)Z
    .locals 0

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/tx0;->d:Ll/vxd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-lt p0, p1, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final G(I)Z
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 10
    .line 11
    double-to-long v0, v0

    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    invoke-static {v2, v3, v0, v1, p1}, Ll/tzi0;->h(JJI)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public final synthetic H(Lcom/p1/mobile/android/app/Act;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/app/Activity;->isDestroyed()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_1

    .line 14
    .line 15
    :cond_0
    invoke-static {}, Ll/spl0;->F()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    const/high16 v2, 0x40a00000    # 5.0f

    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/tx0;->A()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/tx0;->q()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p1, v3, v2, v0}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_appstore_rating_filter_popup_store:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 51
    .line 52
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v0, v2, v3, v1}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Ll/tx0;->z()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/tx0;->q()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-static {p1, v3, v2, v0}, Ll/tx0;->I(Lcom/p1/mobile/android/app/Act;ZFLjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_0
    invoke-static {}, Ll/spl0;->F()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_3

    .line 82
    .line 83
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-virtual {v0}, Ll/tx0;->D()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_3

    .line 92
    .line 93
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0}, Ll/pk50;->f()Ll/rj50;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    sget-object v2, Lcom/p1/mobile/putong/core/oms/OmsDialog;->p_appstore_rating_filter_popup:Lcom/p1/mobile/putong/core/oms/OmsDialog;

    .line 102
    .line 103
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/oms/OmsDialog;->getIdentifier()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-virtual {v0, v2, v3, v1}, Ll/rj50;->b0(Ljava/lang/String;IZ)Z

    .line 108
    .line 109
    .line 110
    invoke-virtual {p0}, Ll/tx0;->q()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-static {p1, p0}, Ll/tx0;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    :cond_3
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v0}, Ll/tx0;->C()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    if-eqz v0, :cond_4

    .line 127
    .line 128
    invoke-virtual {p0}, Ll/tx0;->q()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-static {p1, p0}, Ll/tx0;->O(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_4
    :goto_1
    return-void
.end method

.method public K(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance v0, Ll/hx0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/hx0;-><init>(Ll/tx0;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public P()V
    .locals 7

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    iget-object v1, v1, Ll/tx0;->a:Ll/byd0;

    .line 11
    .line 12
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/Long;

    .line 17
    .line 18
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    const-wide/16 v3, 0x0

    .line 23
    .line 24
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 25
    .line 26
    .line 27
    move-result-object v5

    .line 28
    cmp-long v1, v1, v3

    .line 29
    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    iget-object v1, v1, Ll/tx0;->a:Ll/byd0;

    .line 37
    .line 38
    invoke-static {}, Ll/pzi0;->o()J

    .line 39
    .line 40
    .line 41
    move-result-wide v2

    .line 42
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {v1, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    iget-object v1, v1, Ll/tx0;->d:Ll/vxd0;

    .line 54
    .line 55
    invoke-virtual {v1, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v1, v1, Ll/tx0;->a:Ll/byd0;

    .line 63
    .line 64
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    check-cast v1, Ljava/lang/Long;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 71
    .line 72
    .line 73
    move-result-wide v1

    .line 74
    invoke-static {v1, v2}, Ll/pzi0;->D(J)Z

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v0, v0, Ll/tx0;->c:Ll/vxd0;

    .line 85
    .line 86
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    iget-object v1, v1, Ll/tx0;->c:Ll/vxd0;

    .line 91
    .line 92
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Ljava/lang/Integer;

    .line 97
    .line 98
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    add-int/2addr v1, p0

    .line 103
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-virtual {v0, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 112
    .line 113
    .line 114
    move-result-wide v1

    .line 115
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 116
    .line 117
    .line 118
    move-result-object v3

    .line 119
    iget-object v3, v3, Ll/tx0;->a:Ll/byd0;

    .line 120
    .line 121
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Ljava/lang/Long;

    .line 126
    .line 127
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 128
    .line 129
    .line 130
    move-result-wide v3

    .line 131
    const/4 v6, 0x2

    .line 132
    invoke-static {v1, v2, v3, v4, v6}, Ll/tzi0;->h(JJI)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-eqz v1, :cond_2

    .line 137
    .line 138
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iget-object p0, p0, Ll/tx0;->d:Ll/vxd0;

    .line 143
    .line 144
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    iget-object p0, p0, Ll/tx0;->c:Ll/vxd0;

    .line 152
    .line 153
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    iget-object p0, p0, Ll/tx0;->b:Ll/byd0;

    .line 161
    .line 162
    invoke-virtual {p0, v5}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_2
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    iget-object v1, v1, Ll/tx0;->d:Ll/vxd0;

    .line 171
    .line 172
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iget-object v2, v2, Ll/tx0;->d:Ll/vxd0;

    .line 177
    .line 178
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    check-cast v2, Ljava/lang/Integer;

    .line 183
    .line 184
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    add-int/2addr v2, p0

    .line 189
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-virtual {v1, p0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    iget-object p0, p0, Ll/tx0;->c:Ll/vxd0;

    .line 201
    .line 202
    invoke-virtual {p0, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    iget-object p0, p0, Ll/tx0;->b:Ll/byd0;

    .line 210
    .line 211
    invoke-virtual {p0, v5}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    :goto_0
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    iget-object p0, p0, Ll/tx0;->a:Ll/byd0;

    .line 219
    .line 220
    invoke-static {}, Ll/pzi0;->o()J

    .line 221
    .line 222
    .line 223
    move-result-wide v0

    .line 224
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    return-void
.end method

.method public Q()V
    .locals 6

    .line 1
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/tx0;->a:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    const-wide/16 v2, 0x0

    .line 18
    .line 19
    cmp-long p0, v0, v2

    .line 20
    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    iget-object p0, p0, Ll/tx0;->a:Ll/byd0;

    .line 28
    .line 29
    invoke-static {}, Ll/pzi0;->o()J

    .line 30
    .line 31
    .line 32
    move-result-wide v0

    .line 33
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    iget-object p0, p0, Ll/tx0;->a:Ll/byd0;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Ljava/lang/Long;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    invoke-static {v0, v1}, Ll/pzi0;->D(J)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-eqz p0, :cond_1

    .line 62
    .line 63
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    iget-object p0, p0, Ll/tx0;->a:Ll/byd0;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    check-cast p0, Ljava/lang/Long;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 76
    .line 77
    .line 78
    move-result-wide v0

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-static {}, Ll/pzi0;->n()J

    .line 81
    .line 82
    .line 83
    move-result-wide v0

    .line 84
    :goto_0
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    iget-object p0, p0, Ll/tx0;->b:Ll/byd0;

    .line 89
    .line 90
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Ljava/lang/Long;

    .line 95
    .line 96
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 97
    .line 98
    .line 99
    move-result-wide v2

    .line 100
    invoke-static {}, Ll/pzi0;->o()J

    .line 101
    .line 102
    .line 103
    move-result-wide v4

    .line 104
    sub-long/2addr v4, v0

    .line 105
    const-wide/16 v0, 0x3e8

    .line 106
    .line 107
    div-long/2addr v4, v0

    .line 108
    add-long/2addr v2, v4

    .line 109
    invoke-static {}, Ll/tx0;->o()Ll/tx0;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    iget-object p0, p0, Ll/tx0;->b:Ll/byd0;

    .line 114
    .line 115
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {p0, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public p()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tx0;->m:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->profilePictures:I

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x4

    .line 9
    return p0
.end method

.method public final q()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/tx0;->t()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, "retention"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/tx0;->u()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const-string p0, "app_opens"

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    invoke-virtual {p0}, Ll/tx0;->v()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    const-string p0, "time_spent"

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    invoke-virtual {p0}, Ll/tx0;->w()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_3

    .line 33
    .line 34
    const-string p0, "received_message"

    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_3
    const-string p0, ""

    .line 38
    .line 39
    return-object p0
.end method

.method public final r(I)Z
    .locals 0

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/tx0;->c:Ll/vxd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-le p0, p1, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final s(I)Z
    .locals 2

    .line 1
    if-lez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/tx0;->b:Ll/byd0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Long;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    mul-int/lit8 p1, p1, 0x3c

    .line 16
    .line 17
    int-to-long p0, p1

    .line 18
    cmp-long p0, v0, p0

    .line 19
    .line 20
    if-lez p0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public final t()Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_7

    .line 11
    .line 12
    iget-object v0, p0, Ll/tx0;->i:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->activeDays:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 v0, 0x4

    .line 20
    :goto_0
    invoke-virtual {p0, v0}, Ll/tx0;->F(I)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_7

    .line 25
    .line 26
    iget-object v0, p0, Ll/tx0;->i:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 27
    .line 28
    const/4 v2, 0x1

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    move v0, v2

    .line 51
    :goto_1
    invoke-virtual {p0, v0}, Ll/tx0;->G(I)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_3

    .line 56
    .line 57
    iget-object v0, p0, Ll/tx0;->i:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 58
    .line 59
    if-eqz v0, :cond_2

    .line 60
    .line 61
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    check-cast v0, Ljava/util/List;

    .line 68
    .line 69
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ljava/lang/Integer;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    goto :goto_2

    .line 80
    :cond_2
    const/16 v0, 0xa

    .line 81
    .line 82
    :goto_2
    invoke-virtual {p0, v0}, Ll/tx0;->G(I)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    :cond_3
    invoke-virtual {p0}, Ll/tx0;->x()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_7

    .line 93
    .line 94
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v3, p0, Ll/tx0;->i:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 111
    .line 112
    const/4 v4, 0x5

    .line 113
    if-eqz v3, :cond_5

    .line 114
    .line 115
    iget v3, v3, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_5
    move v3, v4

    .line 119
    :goto_3
    if-le v0, v3, :cond_7

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ljava/lang/Integer;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iget-object p0, p0, Ll/tx0;->i:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 138
    .line 139
    if-eqz p0, :cond_6

    .line 140
    .line 141
    iget v4, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 142
    .line 143
    :cond_6
    if-le v0, v4, :cond_7

    .line 144
    .line 145
    return v2

    .line 146
    :cond_7
    return v1
.end method

.method public final u()Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_7

    .line 11
    .line 12
    iget-object v0, p0, Ll/tx0;->j:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->appOpenTimes:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/16 v0, 0x10

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0, v0}, Ll/tx0;->r(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_7

    .line 26
    .line 27
    iget-object v0, p0, Ll/tx0;->j:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    const/4 v0, 0x2

    .line 51
    :goto_1
    invoke-virtual {p0, v0}, Ll/tx0;->G(I)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/4 v2, 0x1

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-object v0, p0, Ll/tx0;->j:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    const/4 v0, 0x7

    .line 82
    :goto_2
    invoke-virtual {p0, v0}, Ll/tx0;->G(I)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    :cond_3
    invoke-virtual {p0}, Ll/tx0;->x()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_7

    .line 93
    .line 94
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v3, p0, Ll/tx0;->j:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 111
    .line 112
    const/4 v4, 0x5

    .line 113
    if-eqz v3, :cond_5

    .line 114
    .line 115
    iget v3, v3, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_5
    move v3, v4

    .line 119
    :goto_3
    if-le v0, v3, :cond_7

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ljava/lang/Integer;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iget-object p0, p0, Ll/tx0;->j:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 138
    .line 139
    if-eqz p0, :cond_6

    .line 140
    .line 141
    iget v4, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 142
    .line 143
    :cond_6
    if-le v0, v4, :cond_7

    .line 144
    .line 145
    return v2

    .line 146
    :cond_7
    return v1
.end method

.method public final v()Z
    .locals 5

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_7

    .line 11
    .line 12
    iget-object v0, p0, Ll/tx0;->k:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->useMinutes:I

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/16 v0, 0x16

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0, v0}, Ll/tx0;->s(I)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_7

    .line 26
    .line 27
    iget-object v0, p0, Ll/tx0;->k:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/util/List;

    .line 38
    .line 39
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ljava/lang/Integer;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    const/4 v0, 0x2

    .line 51
    :goto_1
    invoke-virtual {p0, v0}, Ll/tx0;->G(I)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    const/4 v2, 0x1

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-object v0, p0, Ll/tx0;->k:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 59
    .line 60
    if-eqz v0, :cond_2

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 63
    .line 64
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    goto :goto_2

    .line 81
    :cond_2
    const/4 v0, 0x7

    .line 82
    :goto_2
    invoke-virtual {p0, v0}, Ll/tx0;->G(I)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    :cond_3
    invoke-virtual {p0}, Ll/tx0;->x()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_7

    .line 93
    .line 94
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 99
    .line 100
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Ljava/lang/Integer;

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    iget-object v3, p0, Ll/tx0;->k:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 111
    .line 112
    const/4 v4, 0x5

    .line 113
    if-eqz v3, :cond_5

    .line 114
    .line 115
    iget v3, v3, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_5
    move v3, v4

    .line 119
    :goto_3
    if-le v0, v3, :cond_7

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ljava/lang/Integer;

    .line 132
    .line 133
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    iget-object p0, p0, Ll/tx0;->k:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 138
    .line 139
    if-eqz p0, :cond_6

    .line 140
    .line 141
    iget v4, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 142
    .line 143
    :cond_6
    if-le v0, v4, :cond_7

    .line 144
    .line 145
    return v2

    .line 146
    :cond_7
    return v1
.end method

.method public final w()Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_6

    .line 11
    .line 12
    iget-object v0, p0, Ll/tx0;->l:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const/4 v0, 0x2

    .line 36
    :goto_0
    invoke-virtual {p0, v0}, Ll/tx0;->G(I)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/4 v2, 0x1

    .line 41
    if-eqz v0, :cond_2

    .line 42
    .line 43
    iget-object v0, p0, Ll/tx0;->l:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    check-cast v0, Ljava/lang/Integer;

    .line 60
    .line 61
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    const/4 v0, 0x7

    .line 67
    :goto_1
    invoke-virtual {p0, v0}, Ll/tx0;->G(I)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    :cond_2
    invoke-virtual {p0}, Ll/tx0;->x()Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_6

    .line 78
    .line 79
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gp/a;->l:Ll/vxd0;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Ljava/lang/Integer;

    .line 90
    .line 91
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iget-object v3, p0, Ll/tx0;->l:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 96
    .line 97
    if-eqz v3, :cond_4

    .line 98
    .line 99
    iget v3, v3, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->sentMessages:I

    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_4
    const/4 v3, 0x5

    .line 103
    :goto_2
    if-le v0, v3, :cond_6

    .line 104
    .line 105
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/gp/a;->j()Lcom/p1/mobile/putong/core/ui/gp/a;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/gp/a;->k:Ll/vxd0;

    .line 110
    .line 111
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Ljava/lang/Integer;

    .line 116
    .line 117
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iget-object p0, p0, Ll/tx0;->l:Lcom/p1/mobile/putong/core/data/RateAlertSetting;

    .line 122
    .line 123
    if-eqz p0, :cond_5

    .line 124
    .line 125
    iget p0, p0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->receivedMessages:I

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_5
    const/16 p0, 0x16

    .line 129
    .line 130
    :goto_3
    if-le v0, p0, :cond_6

    .line 131
    .line 132
    return v2

    .line 133
    :cond_6
    return v1
.end method

.method public final x()Z
    .locals 4

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 10
    .line 11
    double-to-long v0, v0

    .line 12
    invoke-static {}, Ll/pzi0;->o()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    const/16 p0, 0x16d

    .line 17
    .line 18
    invoke-static {v2, v3, v0, v1, p0}, Ll/tzi0;->h(JJI)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public final y(Lcom/p1/mobile/putong/core/data/RateAlertSetting;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-lez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->registerDays:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v0, 0x2

    .line 35
    if-ne p1, v0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    :cond_0
    return p0
.end method

.method public z()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
