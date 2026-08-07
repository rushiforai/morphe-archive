.class public Ll/q0n;
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


# instance fields
.field public final b:Lcom/p1/mobile/putong/data/PushMessageCustom;


# direct methods
.method public constructor <init>(Ll/zzm;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/a0n;-><init>(Ll/zzm;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p1, Ll/zzm;->j:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 5
    .line 6
    iput-object p1, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public c(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ll/a0n;->c(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->setHandler(Ll/q0n;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zzm;->K()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const-string v1, "auto"

    .line 10
    .line 11
    invoke-static {v0, v1, p0}, Ll/a1n;->a(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public f()V
    .locals 7

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
    if-nez v0, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 14
    .line 15
    iget-object v1, v0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "source="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 32
    .line 33
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 34
    .line 35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 41
    .line 42
    iget-object v2, v2, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v2, "&source=start-push"

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 59
    .line 60
    :cond_0
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 61
    .line 62
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 63
    .line 64
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 65
    .line 66
    const-string v1, "from="

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_1

    .line 73
    .line 74
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 75
    .line 76
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 77
    .line 78
    new-instance v1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 84
    .line 85
    iget-object v2, v2, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 86
    .line 87
    iget-object v2, v2, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    const-string v2, "&from=from_in_app_push"

    .line 93
    .line 94
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 102
    .line 103
    :cond_1
    iget-object v0, p0, Ll/a0n;->a:Ll/zzm;

    .line 104
    .line 105
    iget-object v1, v0, Ll/zzm;->m:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    iget-object v0, v0, Ll/zzm;->k:Lcom/p1/mobile/putong/data/PushMessage;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v1, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 119
    .line 120
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 121
    .line 122
    invoke-virtual {p0}, Ll/zzm;->K()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object p0

    .line 126
    invoke-static {v0, p0}, Ll/a1n;->b(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/data/Live;->new_()Lcom/p1/mobile/putong/data/Live;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    iget-object v1, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 135
    .line 136
    iget-object v2, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v3, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    .line 139
    .line 140
    iget-object v4, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v5, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    .line 143
    .line 144
    iget-object v6, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    .line 147
    .line 148
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 149
    .line 150
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 151
    .line 152
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 153
    .line 154
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 155
    .line 156
    iput-object v3, v2, Lcom/p1/mobile/putong/data/StreamUrl;->pullFlv:Ljava/lang/String;

    .line 157
    .line 158
    :try_start_0
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 159
    .line 160
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    const/4 v4, 0x0

    .line 165
    if-eqz v3, :cond_3

    .line 166
    .line 167
    move v3, v4

    .line 168
    goto :goto_0

    .line 169
    :cond_3
    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    :goto_0
    iput v3, v2, Lcom/p1/mobile/putong/data/StreamCdnInfo;->provider:I

    .line 174
    .line 175
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 176
    .line 177
    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    if-eqz v3, :cond_4

    .line 182
    .line 183
    goto :goto_1

    .line 184
    :cond_4
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v4

    .line 188
    :goto_1
    iput v4, v2, Lcom/p1/mobile/putong/data/StreamCdnInfo;->businessType:I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    .line 190
    goto :goto_2

    .line 191
    :catch_0
    move-exception v2

    .line 192
    invoke-static {v2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    :goto_2
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 196
    .line 197
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    iget-object v2, p0, Ll/a0n;->a:Ll/zzm;

    .line 202
    .line 203
    iget-object v2, v2, Ll/zzm;->i:Ll/iam;

    .line 204
    .line 205
    invoke-interface {v2}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    invoke-virtual {p0, v0}, Ll/q0n;->m(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    invoke-interface {v1, v2, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;)V

    .line 214
    .line 215
    .line 216
    iget-object v0, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 217
    .line 218
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 219
    .line 220
    invoke-virtual {p0}, Ll/zzm;->K()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-static {v0, p0}, Ll/a1n;->b(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->wc(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i(Ll/v0t;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 8
    .line 9
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/zzm;->K()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v1, "up"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/a1n;->a(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Ll/v0t;->dismiss()V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public bridge synthetic j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/q0n;->n(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/ji30;->h()Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Yk(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public l()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zzm;->K()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {v0, p0}, Ll/a1n;->c(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public m(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->c(Lcom/p1/mobile/putong/data/Live;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p0, p0, Ll/q0n;->b:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->b(Ljava/lang/String;)Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams$a;->a()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/IntentParams;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public n(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;)V
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
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/LiveInternalPushView;->j(Lcom/p1/mobile/putong/data/PushMessage;Lcom/p1/mobile/android/app/Act;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/a0n;->a:Ll/zzm;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/zzm;->K()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "e_live_inner_push_close"

    .line 8
    .line 9
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/android/ui/poplevel/a;->p()Lcom/p1/mobile/android/ui/poplevel/a;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->LIVE_PUSH:Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/poplevel/CorePopLevel;->getOnlyName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget-object v1, Lcom/p1/mobile/android/ui/poplevel/PopAction;->USER_CLOSE:Lcom/p1/mobile/android/ui/poplevel/PopAction;

    .line 23
    .line 24
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/ui/poplevel/a;->o(Ljava/lang/String;Lcom/p1/mobile/android/ui/poplevel/PopAction;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
