.class public Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public e:Lv/VText;

.field public f:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public g:Lcom/facebook/drawee/view/SimpleDraweeView;

.field public h:Landroid/widget/TextView;

.field public i:Landroid/widget/ImageView;

.field public j:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic i0(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jcn0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;ILl/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;",
            "I",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->d:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->e:Lv/VText;

    .line 8
    .line 9
    invoke-static {v0, v1, v2, p2}, Ll/okc0;->e(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VText;I)V

    .line 10
    .line 11
    .line 12
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->f:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 17
    .line 18
    const-string v1, "context_single_room"

    .line 19
    .line 20
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->g:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 24
    .line 25
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->avatar:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->f:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 33
    .line 34
    new-instance v0, Ll/hcn0;

    .line 35
    .line 36
    invoke-direct {v0, p3, p1}, Ll/hcn0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->g:Lcom/facebook/drawee/view/SimpleDraweeView;

    .line 43
    .line 44
    new-instance v0, Ll/icn0;

    .line 45
    .line 46
    invoke-direct {v0, p3, p1}, Ll/icn0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;)V

    .line 47
    .line 48
    .line 49
    invoke-static {p2, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->j:Landroid/widget/TextView;

    .line 53
    .line 54
    sget p3, Lcom/p1/mobile/putong/live/livingroom/R$string;->e7:I

    .line 55
    .line 56
    invoke-static {p3}, Ll/xau;->t(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p3

    .line 60
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->lovePoint:J

    .line 61
    .line 62
    long-to-double v0, v0

    .line 63
    invoke-static {v0, v1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    filled-new-array {p3, v0}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p3

    .line 71
    const-string v0, "%s%s"

    .line 72
    .line 73
    invoke-static {v0, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    .line 79
    .line 80
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 81
    .line 82
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 83
    .line 84
    const-string p3, "..."

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    const/4 v1, 0x4

    .line 88
    if-eqz p2, :cond_0

    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-le p2, v1, :cond_0

    .line 95
    .line 96
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 97
    .line 98
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v2, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    iput-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 109
    .line 110
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 111
    .line 112
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz p2, :cond_1

    .line 115
    .line 116
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    if-le p2, v1, :cond_1

    .line 121
    .line 122
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 123
    .line 124
    iget-object v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object p3

    .line 134
    iput-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 135
    .line 136
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->h:Landroid/widget/TextView;

    .line 137
    .line 138
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 139
    .line 140
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 141
    .line 142
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceGrabHatCP;->otherUserMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 143
    .line 144
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->name:Ljava/lang/String;

    .line 145
    .line 146
    const-string p3, "&"

    .line 147
    .line 148
    filled-new-array {p2, p3, p1}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string p2, "%s%s%s"

    .line 153
    .line 154
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/grabhat/view/VoiceCpItemView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
