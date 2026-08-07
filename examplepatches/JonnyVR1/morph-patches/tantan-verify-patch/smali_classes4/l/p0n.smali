.class public Ll/p0n;
.super Ll/a0n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a0n<",
        "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;",
        ">;"
    }
.end annotation


# instance fields
.field public b:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/zzm;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a0n;-><init>(Ll/zzm;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic m(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, "message"

    .line 2
    .line 3
    const-string v1, "msg"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic o(Ll/p0n;Landroid/view/View;Ll/zzm;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/p0n;->q(Landroid/view/View;Ll/zzm;Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    return-void
.end method

.method private synthetic q(Landroid/view/View;Ll/zzm;Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/p0n;->t(Landroid/view/View;Ll/zzm;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static r(Ll/zzm;)V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_4

    .line 10
    .line 11
    iget-object v0, p0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    if-eqz v0, :cond_4

    .line 14
    .line 15
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    const-string v1, "source="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 30
    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    iget-object v2, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 37
    .line 38
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, "&source=start-push"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 53
    .line 54
    :cond_0
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 55
    .line 56
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_1

    .line 59
    .line 60
    const-string v1, "from="

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 69
    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    iget-object v2, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 76
    .line 77
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    const-string v2, "&from=from_in_app_push"

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 92
    .line 93
    :cond_1
    iget-object v0, p0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 94
    .line 95
    iget-object v1, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 96
    .line 97
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-static {v0, v1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 107
    .line 108
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 109
    .line 110
    const-string v1, "liveId"

    .line 111
    .line 112
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iget-object v0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 117
    .line 118
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 119
    .line 120
    const-string v1, "NA"

    .line 121
    .line 122
    if-nez v0, :cond_2

    .line 123
    .line 124
    move-object v0, v1

    .line 125
    :cond_2
    const-string v3, "anchorId"

    .line 126
    .line 127
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    const-string v0, "index"

    .line 132
    .line 133
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 134
    .line 135
    .line 136
    move-result-object v4

    .line 137
    const-string v0, "show_label"

    .line 138
    .line 139
    const-string v5, ""

    .line 140
    .line 141
    invoke-static {v0, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    const-string v6, "module"

    .line 146
    .line 147
    const-string v7, "page"

    .line 148
    .line 149
    invoke-static {v6, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    const-string v7, "right_recommend_type"

    .line 154
    .line 155
    invoke-static {v7, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    const-string v8, "live_status"

    .line 160
    .line 161
    const-string v9, "on"

    .line 162
    .line 163
    invoke-static {v8, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object v8

    .line 167
    const-string v9, "trace_id"

    .line 168
    .line 169
    invoke-static {v9, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    const-string v5, "broadcast_page_id"

    .line 174
    .line 175
    invoke-virtual {p0}, Ll/zzm;->K()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v10

    .line 179
    invoke-static {v5, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 180
    .line 181
    .line 182
    move-result-object v10

    .line 183
    iget-object v5, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 184
    .line 185
    iget-object v5, v5, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 186
    .line 187
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 188
    .line 189
    .line 190
    move-result v5

    .line 191
    if-eqz v5, :cond_3

    .line 192
    .line 193
    goto :goto_0

    .line 194
    :cond_3
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 195
    .line 196
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 197
    .line 198
    :goto_0
    const-string p0, "liveRecommendCategory"

    .line 199
    .line 200
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 201
    .line 202
    .line 203
    move-result-object v11

    .line 204
    move-object v5, v0

    .line 205
    filled-new-array/range {v2 .. v11}, [Ll/pf60;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    const-string v0, "e_live_room_enter"

    .line 210
    .line 211
    const-string v1, "p_live_inner_broadcast"

    .line 212
    .line 213
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 214
    .line 215
    .line 216
    :cond_4
    return-void
.end method

.method private t(Landroid/view/View;Ll/zzm;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Ll/p0n;->u(Ll/zzm;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x4

    .line 10
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p2, Ll/zzm;->n:Ll/v0t;

    .line 14
    .line 15
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p2, Ll/zzm;->n:Ll/v0t;

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/widget/PopupWindow;->setTouchable(Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p2, Ll/zzm;->n:Ll/v0t;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/widget/PopupWindow;->update()V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    const/16 p0, 0x7530

    .line 2
    .line 3
    return p0
.end method

.method public c(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
    .locals 3

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/kec0;->p6:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->l(Ll/p0n;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p0n;->r(Ll/zzm;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/a0n;->g(Ll/v0t;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/p0n;->b:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 6
    .line 7
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 10
    .line 11
    const-string v1, "exposure"

    .line 12
    .line 13
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Ir(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public i(Ll/v0t;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/v0t;->dismiss()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p0n;->s(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/p0n;->u(Ll/zzm;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public l()V
    .locals 12

    .line 1
    invoke-virtual {p0}, Ll/p0n;->p()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 13
    .line 14
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "liveId"

    .line 19
    .line 20
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 25
    .line 26
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 29
    .line 30
    const-string v1, "NA"

    .line 31
    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    move-object v0, v1

    .line 35
    :cond_1
    const-string v3, "anchorId"

    .line 36
    .line 37
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const-string v0, "index"

    .line 42
    .line 43
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    const-string v0, "show_label"

    .line 48
    .line 49
    const-string v5, ""

    .line 50
    .line 51
    invoke-static {v0, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    const-string v6, "module"

    .line 56
    .line 57
    const-string v7, "page"

    .line 58
    .line 59
    invoke-static {v6, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    const-string v7, "right_recommend_type"

    .line 64
    .line 65
    invoke-static {v7, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    const-string v8, "live_status"

    .line 70
    .line 71
    const-string v9, "on"

    .line 72
    .line 73
    invoke-static {v8, v9}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v8

    .line 77
    const-string v9, "trace_id"

    .line 78
    .line 79
    invoke-static {v9, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object v9

    .line 83
    iget-object v5, p0, Ll/a0n;->a:Ll/zzm;

    .line 84
    .line 85
    invoke-virtual {v5}, Ll/zzm;->K()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v5

    .line 89
    const-string v10, "broadcast_page_id"

    .line 90
    .line 91
    invoke-static {v10, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 92
    .line 93
    .line 94
    move-result-object v10

    .line 95
    iget-object v5, p0, Ll/a0n;->a:Ll/zzm;

    .line 96
    .line 97
    iget-object v5, v5, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 98
    .line 99
    iget-object v5, v5, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 100
    .line 101
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    if-eqz v5, :cond_2

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 109
    .line 110
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 111
    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 113
    .line 114
    :goto_0
    const-string p0, "liveRecommendCategory"

    .line 115
    .line 116
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    move-object v5, v0

    .line 121
    filled-new-array/range {v2 .. v11}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    const-string v0, "e_live_room_enter"

    .line 126
    .line 127
    const-string v1, "p_live_inner_broadcast"

    .line 128
    .line 129
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public p()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object p0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public s(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v1, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object v0, v0, Ll/zzm;->i:Ll/iam;

    .line 6
    .line 7
    invoke-interface {v0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalCardStylePushView;->b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/p0n;->u(Ll/zzm;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 24
    .line 25
    invoke-virtual {p0, p1, v0}, Ll/p0n;->v(Landroid/view/View;Ll/zzm;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Ll/p0n;->b:Ll/kcg0;

    .line 30
    .line 31
    return-void
.end method

.method public u(Ll/zzm;)Z
    .locals 0

    .line 1
    iget-object p0, p1, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 6
    .line 7
    new-instance p1, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    const-string p1, ","

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance p1, Ll/m0n;

    .line 21
    .line 22
    invoke-direct {p1}, Ll/m0n;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/jyb;->R([Ljava/lang/Object;Ll/qcj;)Ljava/util/ArrayList;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    :cond_0
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public v(Landroid/view/View;Ll/zzm;)Ll/kcg0;
    .locals 2

    .line 1
    invoke-static {}, Ll/ji30;->k()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/n0n;

    .line 15
    .line 16
    invoke-direct {v1, p0, p1, p2}, Ll/n0n;-><init>(Ll/p0n;Landroid/view/View;Ll/zzm;)V

    .line 17
    .line 18
    .line 19
    new-instance p0, Ll/o0n;

    .line 20
    .line 21
    invoke-direct {p0}, Ll/o0n;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
