.class public Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;
    }
.end annotation


# static fields
.field public static final ANCHOR_TAG:Ljava/lang/String; = "jump_to_tag"

.field public static final ENTER_VOICE_KEY_CHAT_ASSISTANT:Ljava/lang/String; = "chatAssistant"

.field public static final ENTER_VOICE_KEY_CHAT_ASSISTANT_FIX_ANCHOR:Ljava/lang/String; = "chatAssistantFixAnchor"

.field public static final ENTER_VOICE_KEY_CHAT_ASSISTANT_FIX_ANCHOR_SHOW_PACKAGE:Ljava/lang/String; = "chatAssistantFixAnchorShowPackage"

.field public static final LIVE_AUDIENCE_START_DATA:Ljava/lang/String; = "LIVE_AUDIENCE_START_DATA"


# instance fields
.field public autoJoinGame:Z

.field public backgroundType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public backgroundUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public category:Ljava/lang/String;

.field public focusUserId:Ljava/lang/String;

.field public focusUserLeftToast:Ljava/lang/String;

.field public fromFW:Z

.field public fromLiveSquare:Z

.field public gameType:Ljava/lang/String;

.field public handleEnterRoomResult:Z

.field public isOfficialShowAnchor:Z

.field public isTeenMode:Z

.field public live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

.field public liveSchema:Ljava/lang/String;

.field public liveType:Ljava/lang/String;

.field public needAutoApplySettle:Z

.field public needShowRoomInfoDialog:Z

.field public open:Ljava/lang/String;

.field private roomId:Ljava/lang/String;

.field public showSignInDialog:Z

.field public simpleChat:Z

.field public source:Ljava/lang/String;

.field public template:Ljava/lang/String;

.field public traceId:Ljava/lang/String;

.field private voiceBusinessProvider:Ljava/lang/String;

.field private voiceBusinessType:Ljava/lang/String;

.field public voiceEnterType:Ljava/lang/String;

.field private voicePushUrl:Ljava/lang/String;

.field public withMute:Z


# direct methods
.method private constructor <init>(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->g(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->d(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->fromFW:Z

    .line 15
    .line 16
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->p(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->source:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->b(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->category:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->c(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->focusUserId:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->e(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->fromLiveSquare:Z

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 41
    .line 42
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->m(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->requestExtra:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->o(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->showSignInDialog:Z

    .line 53
    .line 54
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->f(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->isTeenMode:Z

    .line 59
    .line 60
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->l(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->open:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->p:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceEnterType:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->q:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->liveSchema:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->r:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->focusUserLeftToast:Ljava/lang/String;

    .line 77
    .line 78
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->traceId:Ljava/lang/String;

    .line 87
    .line 88
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->t(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->withMute:Z

    .line 93
    .line 94
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->i(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->liveType:Ljava/lang/String;

    .line 99
    .line 100
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->s:Z

    .line 101
    .line 102
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->simpleChat:Z

    .line 103
    .line 104
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->t:Z

    .line 105
    .line 106
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->handleEnterRoomResult:Z

    .line 107
    .line 108
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u:Ljava/lang/String;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->backgroundType:Ljava/lang/String;

    .line 111
    .line 112
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->v:Ljava/lang/String;

    .line 113
    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->backgroundUrl:Ljava/lang/String;

    .line 115
    .line 116
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->j(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->needAutoApplySettle:Z

    .line 121
    .line 122
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->k(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->needShowRoomInfoDialog:Z

    .line 127
    .line 128
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->a:Z

    .line 129
    .line 130
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->isOfficialShowAnchor:Z

    .line 131
    .line 132
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->n(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->roomId:Ljava/lang/String;

    .line 137
    .line 138
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->q(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceBusinessProvider:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->s(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voicePushUrl:Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->r(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceBusinessType:Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->a(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->autoJoinGame:Z

    .line 161
    .line 162
    const/4 v0, 0x1

    .line 163
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_0

    .line 168
    .line 169
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 170
    .line 171
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_0

    .line 178
    .line 179
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 180
    .line 181
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->h(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 186
    .line 187
    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;Ll/y91;)V
    .locals 0

    .line 188
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;-><init>(Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;)V

    return-void
.end method

.method public static getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public clearQuickInfo()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->roomId:Ljava/lang/String;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceBusinessType:Ljava/lang/String;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voicePushUrl:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceBusinessProvider:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public consumeFocusUserLeftToast()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->focusUserLeftToast:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->focusUserLeftToast:Ljava/lang/String;

    .line 6
    .line 7
    return-object v0
.end method

.method public getFocusUser()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->focusUserId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRoomId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoiceBusinessProvider()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceBusinessProvider:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoiceBusinessType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceBusinessType:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoicePushUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voicePushUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isQuickEnterRtc()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceBusinessProvider:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voicePushUrl:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceBusinessType:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "voice"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "live"

    .line 13
    .line 14
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_1
    const-string v1, ""

    .line 24
    .line 25
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    const-string v3, "AudienceStartData{liveId="

    .line 28
    .line 29
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v3, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->live:Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 33
    .line 34
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v3, ",liveType="

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, ",anchorId="

    .line 48
    .line 49
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v0, ", isTeenMode="

    .line 56
    .line 57
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->isTeenMode:Z

    .line 61
    .line 62
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string v0, ", fromFW="

    .line 66
    .line 67
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->fromFW:Z

    .line 71
    .line 72
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v0, ", source=\'"

    .line 76
    .line 77
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->source:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v0, ", category=\'"

    .line 86
    .line 87
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->category:Ljava/lang/String;

    .line 91
    .line 92
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    const-string v0, ", focusUserId=\'"

    .line 96
    .line 97
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->focusUserId:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v0, ", fromLiveSquare="

    .line 106
    .line 107
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->fromLiveSquare:Z

    .line 111
    .line 112
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    const-string v0, ", showSignInDialog="

    .line 116
    .line 117
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->showSignInDialog:Z

    .line 121
    .line 122
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v0, ", open=\'"

    .line 126
    .line 127
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->open:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    const-string v0, ", voiceEnterType=\'"

    .line 136
    .line 137
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceEnterType:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string v0, ", liveSchema=\'"

    .line 146
    .line 147
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    iget-object v0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->liveSchema:Ljava/lang/String;

    .line 151
    .line 152
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string v0, ", simpleChat=\'"

    .line 156
    .line 157
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->simpleChat:Z

    .line 161
    .line 162
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    const/16 p0, 0x7d

    .line 166
    .line 167
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    return-object p0
.end method
