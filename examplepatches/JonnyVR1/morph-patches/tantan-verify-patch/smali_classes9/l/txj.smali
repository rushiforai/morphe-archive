.class public final Ll/txj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J?\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0006\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u00042\u0006\u0010\u000b\u001a\u00020\u0004H\u0007\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Ll/txj;",
        "",
        "<init>",
        "()V",
        "",
        "giftSource",
        "callId",
        "callUserId",
        "",
        "callPosition",
        "anchorId",
        "templateType",
        "Ll/sxj;",
        "a",
        "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ll/sxj;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final INSTANCE:Ll/txj;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/txj;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/txj;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/txj;->INSTANCE:Ll/txj;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)Ll/sxj;
    .locals 5
    .param p0    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p5    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    const-string v3, "vice"

    .line 29
    .line 30
    const-string v4, "audience"

    .line 31
    .line 32
    sparse-switch v2, :sswitch_data_0

    .line 33
    .line 34
    .line 35
    goto/16 :goto_1

    .line 36
    .line 37
    :sswitch_0
    const-string p3, "callVoiceVice"

    .line 38
    .line 39
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_1

    .line 44
    .line 45
    goto/16 :goto_1

    .line 46
    .line 47
    :sswitch_1
    const-string p1, "voiceLiveAudience"

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_0

    .line 54
    .line 55
    goto/16 :goto_1

    .line 56
    .line 57
    :cond_0
    iput-object p4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->mainUserId:Ljava/lang/String;

    .line 58
    .line 59
    iput-object p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->viceAnchorUserId:Ljava/lang/String;

    .line 60
    .line 61
    iput-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceAnchorType:Ljava/lang/String;

    .line 62
    .line 63
    iput-object p5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->templateType:Ljava/lang/String;

    .line 64
    .line 65
    iput p3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->position:I

    .line 66
    .line 67
    goto/16 :goto_1

    .line 68
    .line 69
    :sswitch_2
    const-string p3, "callVideoVice"

    .line 70
    .line 71
    invoke-virtual {p0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    move-result p0

    .line 75
    if-nez p0, :cond_1

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_1
    iput-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->callId:Ljava/lang/String;

    .line 79
    .line 80
    iput-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->viceAnchorUserId:Ljava/lang/String;

    .line 81
    .line 82
    iput-object p4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->mainUserId:Ljava/lang/String;

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :sswitch_3
    const-string p1, "call-main"

    .line 86
    .line 87
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p0

    .line 91
    if-nez p0, :cond_2

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    iput-object p4, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->mainUserId:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_1

    .line 97
    :sswitch_4
    const-string v2, "voice_auction"

    .line 98
    .line 99
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-nez p0, :cond_3

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_3
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->callId:Ljava/lang/String;

    .line 107
    .line 108
    iput-object p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->viceAnchorUserId:Ljava/lang/String;

    .line 109
    .line 110
    iput-object p4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->mainUserId:Ljava/lang/String;

    .line 111
    .line 112
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    if-eqz p0, :cond_4

    .line 117
    .line 118
    iput-object v4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceAnchorType:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_4
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceAnchorType:Ljava/lang/String;

    .line 122
    .line 123
    :goto_0
    iput-object p5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->templateType:Ljava/lang/String;

    .line 124
    .line 125
    iput p3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->position:I

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :sswitch_5
    const-string v2, "voiceLiveVice"

    .line 129
    .line 130
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-nez p0, :cond_5

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_5
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->callId:Ljava/lang/String;

    .line 138
    .line 139
    iput-object p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->viceAnchorUserId:Ljava/lang/String;

    .line 140
    .line 141
    iput-object p4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->mainUserId:Ljava/lang/String;

    .line 142
    .line 143
    iput-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceAnchorType:Ljava/lang/String;

    .line 144
    .line 145
    iput-object p5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->templateType:Ljava/lang/String;

    .line 146
    .line 147
    iput p3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->position:I

    .line 148
    .line 149
    goto :goto_1

    .line 150
    :sswitch_6
    const-string v2, "voiceLiveMain"

    .line 151
    .line 152
    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-nez p0, :cond_6

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_6
    iput-object p1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->callId:Ljava/lang/String;

    .line 160
    .line 161
    iput-object p2, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->viceAnchorUserId:Ljava/lang/String;

    .line 162
    .line 163
    iput-object p4, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->mainUserId:Ljava/lang/String;

    .line 164
    .line 165
    const-string p0, "main"

    .line 166
    .line 167
    iput-object p0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->voiceAnchorType:Ljava/lang/String;

    .line 168
    .line 169
    iput-object p5, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->templateType:Ljava/lang/String;

    .line 170
    .line 171
    iput p3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->position:I

    .line 172
    .line 173
    :goto_1
    new-instance p0, Ll/sxj;

    .line 174
    .line 175
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 179
    .line 180
    .line 181
    invoke-direct {p0, v0, v1}, Ll/sxj;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;)V

    .line 182
    .line 183
    .line 184
    return-object p0

    .line 185
    :sswitch_data_0
    .sparse-switch
        -0x580937e9 -> :sswitch_6
        -0x5805034d -> :sswitch_5
        -0x4b43ebca -> :sswitch_4
        -0x411d8838 -> :sswitch_3
        -0x32a7834e -> :sswitch_2
        -0x499b29e -> :sswitch_1
        0x412815e9 -> :sswitch_0
    .end sparse-switch
.end method
