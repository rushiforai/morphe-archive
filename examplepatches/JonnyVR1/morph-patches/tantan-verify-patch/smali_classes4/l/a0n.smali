.class public abstract Ll/a0n;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Ll/zzm;


# direct methods
.method public constructor <init>(Ll/zzm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a0n;->a:Ll/zzm;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/data/PushMessage;Ll/zzm;)Ll/a0n;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "popExperimentStyle2"

    .line 6
    .line 7
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance p0, Ll/c0n;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/c0n;-><init>(Ll/zzm;)V

    .line 16
    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 22
    .line 23
    const-string v1, "popExperimentStyle1"

    .line 24
    .line 25
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    new-instance p0, Ll/b0n;

    .line 32
    .line 33
    invoke-direct {p0, p1}, Ll/b0n;-><init>(Ll/zzm;)V

    .line 34
    .line 35
    .line 36
    return-object p0

    .line 37
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 40
    .line 41
    const-string v1, "popExperimentStyle3"

    .line 42
    .line 43
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    new-instance p0, Ll/d0n;

    .line 50
    .line 51
    invoke-direct {p0, p1}, Ll/d0n;-><init>(Ll/zzm;)V

    .line 52
    .line 53
    .line 54
    return-object p0

    .line 55
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 58
    .line 59
    const-string v1, "popExperimentStyle4"

    .line 60
    .line 61
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    if-eqz v0, :cond_3

    .line 66
    .line 67
    new-instance p0, Ll/e0n;

    .line 68
    .line 69
    invoke-direct {p0, p1}, Ll/e0n;-><init>(Ll/zzm;)V

    .line 70
    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->messageCustom:Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0}, Ll/z0n;->b(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-eqz v0, :cond_4

    .line 82
    .line 83
    new-instance p0, Ll/x0n;

    .line 84
    .line 85
    invoke-direct {p0, p1}, Ll/x0n;-><init>(Ll/zzm;)V

    .line 86
    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_4
    const-string v0, "live.schema.push.in.app"

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_5

    .line 98
    .line 99
    new-instance p0, Ll/w0n;

    .line 100
    .line 101
    invoke-direct {p0, p1}, Ll/w0n;-><init>(Ll/zzm;)V

    .line 102
    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_5
    const-string v0, "live.audience.signin.push"

    .line 106
    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-eqz v0, :cond_6

    .line 114
    .line 115
    new-instance p0, Ll/r0n;

    .line 116
    .line 117
    invoke-direct {p0, p1}, Ll/r0n;-><init>(Ll/zzm;)V

    .line 118
    .line 119
    .line 120
    return-object p0

    .line 121
    :cond_6
    const-string v0, "live.voiceLiving.partnerFinder.push"

    .line 122
    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_7

    .line 130
    .line 131
    new-instance p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/a;

    .line 132
    .line 133
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/a;-><init>(Ll/zzm;)V

    .line 134
    .line 135
    .line 136
    return-object p0

    .line 137
    :cond_7
    const-string v0, "live.card.push.in.app"

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_8

    .line 146
    .line 147
    new-instance p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/b;

    .line 148
    .line 149
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/b;-><init>(Ll/zzm;)V

    .line 150
    .line 151
    .line 152
    return-object p0

    .line 153
    :cond_8
    const-string v0, "live.schema.boutique.enter"

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_9

    .line 162
    .line 163
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 164
    .line 165
    if-eqz v0, :cond_9

    .line 166
    .line 167
    const-string v1, "enterSuggestVoiceRoom"

    .line 168
    .line 169
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-eqz v0, :cond_9

    .line 174
    .line 175
    new-instance p0, Ll/a1t;

    .line 176
    .line 177
    invoke-direct {p0, p1}, Ll/a1t;-><init>(Ll/zzm;)V

    .line 178
    .line 179
    .line 180
    return-object p0

    .line 181
    :cond_9
    const-string v0, "live.schema.push.all"

    .line 182
    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-eqz v0, :cond_a

    .line 190
    .line 191
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessage;->link:Ljava/lang/String;

    .line 192
    .line 193
    if-eqz v0, :cond_a

    .line 194
    .line 195
    const-string v1, "enterVoiceRoom"

    .line 196
    .line 197
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-eqz v0, :cond_a

    .line 202
    .line 203
    new-instance p0, Ll/y0n;

    .line 204
    .line 205
    invoke-direct {p0, p1}, Ll/y0n;-><init>(Ll/zzm;)V

    .line 206
    .line 207
    .line 208
    return-object p0

    .line 209
    :cond_a
    const-string v0, "live.ongoingLive.pinkCard"

    .line 210
    .line 211
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessage;->intent:Ljava/lang/String;

    .line 212
    .line 213
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    if-eqz p0, :cond_b

    .line 218
    .line 219
    new-instance p0, Ll/p0n;

    .line 220
    .line 221
    invoke-direct {p0, p1}, Ll/p0n;-><init>(Ll/zzm;)V

    .line 222
    .line 223
    .line 224
    return-object p0

    .line 225
    :cond_b
    new-instance p0, Ll/q0n;

    .line 226
    .line 227
    invoke-direct {p0, p1}, Ll/q0n;-><init>(Ll/zzm;)V

    .line 228
    .line 229
    .line 230
    return-object p0
.end method


# virtual methods
.method public b()I
    .locals 0

    .line 1
    const/16 p0, 0x1388

    .line 2
    .line 3
    return p0
.end method

.method public c(Lcom/p1/mobile/android/app/Act;)Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;
    .locals 2

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget p1, Ll/kec0;->o6:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;

    .line 14
    .line 15
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public abstract e()V
.end method

.method public abstract f()V
.end method

.method public g(Ll/v0t;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method

.method public abstract i(Ll/v0t;)V
.end method

.method public abstract j(Lcom/p1/mobile/putong/core/newui/home/bubble/internalpush/base/LiveInternalPushBaseView;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation
.end method

.method public abstract k()Z
.end method

.method public abstract l()V
.end method
