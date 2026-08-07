.class public Ll/x0n;
.super Ll/a0n;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/a0n<",
        "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;",
        ">;"
    }
.end annotation


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


# virtual methods
.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 14
    .line 15
    iget-object v1, v0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    if-eqz v1, :cond_3

    .line 18
    .line 19
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    const-string v1, "source="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 34
    .line 35
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 36
    .line 37
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 43
    .line 44
    iget-object v2, v2, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 45
    .line 46
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string v2, "&source=start-push"

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 61
    .line 62
    :cond_0
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 63
    .line 64
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    const-string v1, "liveMode=virtualAvatar"

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-nez v0, :cond_1

    .line 77
    .line 78
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 79
    .line 80
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 81
    .line 82
    new-instance v1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 88
    .line 89
    iget-object v2, v2, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 90
    .line 91
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v2, "&liveMode=virtualAvatar"

    .line 97
    .line 98
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 106
    .line 107
    :cond_1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 108
    .line 109
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 112
    .line 113
    if-eqz v0, :cond_2

    .line 114
    .line 115
    const-string v1, "from="

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_2

    .line 122
    .line 123
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 124
    .line 125
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 126
    .line 127
    new-instance v1, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 133
    .line 134
    iget-object v2, v2, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 135
    .line 136
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v2, "&from=from_in_app_push"

    .line 142
    .line 143
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 151
    .line 152
    :cond_2
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 153
    .line 154
    iget-object v1, v0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 155
    .line 156
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 157
    .line 158
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 159
    .line 160
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    invoke-static {v1, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 165
    .line 166
    .line 167
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 168
    .line 169
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 170
    .line 171
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 172
    .line 173
    const-string v1, "anchorId"

    .line 174
    .line 175
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iget-object v1, p0, Ll/a0n;->a:Ll/zzm;

    .line 180
    .line 181
    iget-object v1, v1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 182
    .line 183
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 184
    .line 185
    const-string v2, "liveId"

    .line 186
    .line 187
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 188
    .line 189
    .line 190
    move-result-object v1

    .line 191
    const-string v2, "audio_card_type"

    .line 192
    .line 193
    const-string v3, "start-push-follow"

    .line 194
    .line 195
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 200
    .line 201
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 202
    .line 203
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 204
    .line 205
    const-string v3, "test_group_name"

    .line 206
    .line 207
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    filled-new-array {v0, v1, v2, p0}, [Ll/pf60;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    const-string v0, "e_live_audio_room_enter"

    .line 216
    .line 217
    const-string v1, "p_live_inner_push"

    .line 218
    .line 219
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 220
    .line 221
    .line 222
    :cond_3
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
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x0n;->m(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public l()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, v0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "anchorId"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/a0n;->a:Ll/zzm;

    .line 14
    .line 15
    iget-object v1, v1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 18
    .line 19
    const-string v2, "liveId"

    .line 20
    .line 21
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "audio_card_type"

    .line 26
    .line 27
    const-string v3, "start-push-follow"

    .line 28
    .line 29
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 34
    .line 35
    iget-object p0, p0, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 38
    .line 39
    const-string v3, "test_group_name"

    .line 40
    .line 41
    invoke-static {v3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    filled-new-array {v0, v1, v2, p0}, [Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string v0, "e_live_audio_room_enter"

    .line 50
    .line 51
    const-string v1, "p_live_inner_push"

    .line 52
    .line 53
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    iget-object v0, p0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 4
    .line 5
    iget-object p0, p0, Ll/zzm;->i:Ll/iam;

    .line 6
    .line 7
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->b(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
