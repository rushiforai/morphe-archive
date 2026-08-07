.class public Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/k8n0;",
        ">;"
    }
.end annotation


# static fields
.field public static t:I = 0x3e8


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatKeyboardRoot;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/VLinear;

.field public d:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

.field public e:Landroid/widget/LinearLayout;

.field public f:Landroid/widget/LinearLayout;

.field public g:Lv/VEditText;

.field public h:Landroid/widget/ImageView;

.field public i:Lv/VText;

.field public j:Landroid/widget/FrameLayout;

.field public k:Lv/VPager;

.field public l:Ll/k8n0;

.field public m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:Landroid/animation/ValueAnimator;

.field public s:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x40000000    # 2.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->n:I

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->p:I

    .line 14
    .line 15
    sget v0, Ll/pae;->a:I

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->q:I

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->s:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 25
    .line 26
    return-void
.end method

.method private A()Z
    .locals 3

    .line 1
    sget-object p0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-eqz p0, :cond_3

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 11
    .line 12
    if-nez v1, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 28
    .line 29
    iget-object v1, v1, Lcom/p1/mobile/putong/data/PhoneNumber;->number:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_2

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 38
    .line 39
    const-string v2, "wechat"

    .line 40
    .line 41
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_1

    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 48
    .line 49
    const-string v2, "qq"

    .line 50
    .line 51
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-nez v1, :cond_1

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 58
    .line 59
    const-string v1, "network-security"

    .line 60
    .line 61
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    :cond_1
    return v0

    .line 68
    :cond_2
    const/4 p0, 0x0

    .line 69
    return p0

    .line 70
    :cond_3
    :goto_0
    return v0
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->s:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 4
    .line 5
    if-ne p1, v0, :cond_0

    .line 6
    .line 7
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->INPUT:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 14
    .line 15
    if-ne p1, v0, :cond_1

    .line 16
    .line 17
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 18
    .line 19
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 66
    .line 67
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const-string v1, "anchorId"

    .line 76
    .line 77
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 82
    .line 83
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    const-string v2, "liveId"

    .line 92
    .line 93
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 98
    .line 99
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 100
    .line 101
    .line 102
    move-result-object p0

    .line 103
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    const-string v2, "roomId"

    .line 108
    .line 109
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    filled-new-array {v0, v1, p0}, [Ll/pf60;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-string v0, "e_audio_chat_sticker_button"

    .line 118
    .line 119
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 120
    .line 121
    .line 122
    :cond_2
    return-void
.end method

.method private K(Ljava/lang/Boolean;I)V
    .locals 1

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->o:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->o:I

    .line 8
    .line 9
    :cond_0
    if-lez p2, :cond_1

    .line 10
    .line 11
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->p:I

    .line 12
    .line 13
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_2

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 20
    .line 21
    iget p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->o:I

    .line 22
    .line 23
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->n:I

    .line 24
    .line 25
    add-int/2addr p2, v0

    .line 26
    invoke-virtual {p1, p2}, Ll/k8n0;->f4(I)V

    .line 27
    .line 28
    .line 29
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->INPUT:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 30
    .line 31
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->s:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 36
    .line 37
    sget-object p2, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 38
    .line 39
    if-eq p1, p2, :cond_3

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 42
    .line 43
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_3
    invoke-direct {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 48
    .line 49
    .line 50
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 51
    .line 52
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->n:I

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Ll/k8n0;->d4(I)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->h:Landroid/widget/ImageView;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 4
    .line 5
    if-ne p1, v1, :cond_0

    .line 6
    .line 7
    sget v2, Ll/obc0;->L1:I

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget v2, Ll/obc0;->M1:I

    .line 11
    .line 12
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->k:Lv/VPager;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eq p1, v1, :cond_2

    .line 20
    .line 21
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->s:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 22
    .line 23
    if-ne v4, v1, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    move v1, v2

    .line 27
    goto :goto_2

    .line 28
    :cond_2
    :goto_1
    move v1, v3

    .line 29
    :goto_2
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->s:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 33
    .line 34
    if-ne v0, p1, :cond_3

    .line 35
    .line 36
    goto :goto_4

    .line 37
    :cond_3
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->s:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->j:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    const/high16 v0, 0x435c0000    # 220.0f

    .line 48
    .line 49
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    :cond_4
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->o:I

    .line 54
    .line 55
    if-nez v1, :cond_5

    .line 56
    .line 57
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    sget-object v1, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    :cond_5
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->j:Landroid/widget/FrameLayout;

    .line 73
    .line 74
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eq v4, v1, :cond_6

    .line 79
    .line 80
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->j:Landroid/widget/FrameLayout;

    .line 81
    .line 82
    invoke-static {v4, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->c:Lv/VLinear;

    .line 86
    .line 87
    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    sub-int v0, v1, v0

    .line 92
    .line 93
    int-to-float v0, v0

    .line 94
    add-float/2addr v0, v4

    .line 95
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->c:Lv/VLinear;

    .line 96
    .line 97
    invoke-virtual {v5, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 98
    .line 99
    .line 100
    sget-object v5, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$d;->a:[I

    .line 101
    .line 102
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    aget p1, v5, p1

    .line 107
    .line 108
    const/4 v5, 0x2

    .line 109
    if-eq p1, v3, :cond_7

    .line 110
    .line 111
    const/4 v1, 0x0

    .line 112
    if-eq p1, v5, :cond_8

    .line 113
    .line 114
    const/4 v6, 0x3

    .line 115
    goto :goto_3

    .line 116
    :cond_7
    int-to-float v1, v1

    .line 117
    :cond_8
    :goto_3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r:Landroid/animation/ValueAnimator;

    .line 118
    .line 119
    if-eqz p1, :cond_9

    .line 120
    .line 121
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_9

    .line 126
    .line 127
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r:Landroid/animation/ValueAnimator;

    .line 128
    .line 129
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 130
    .line 131
    .line 132
    :cond_9
    cmpl-float p1, v4, v1

    .line 133
    .line 134
    if-nez p1, :cond_a

    .line 135
    .line 136
    :goto_4
    return-void

    .line 137
    :cond_a
    new-array p1, v5, [F

    .line 138
    .line 139
    aput v0, p1, v2

    .line 140
    .line 141
    aput v1, p1, v3

    .line 142
    .line 143
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r:Landroid/animation/ValueAnimator;

    .line 148
    .line 149
    const-wide/16 v0, 0x64

    .line 150
    .line 151
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r:Landroid/animation/ValueAnimator;

    .line 155
    .line 156
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$c;

    .line 157
    .line 158
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$c;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 162
    .line 163
    .line 164
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r:Landroid/animation/ValueAnimator;

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method private M(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-ne p1, v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    instance-of v0, v0, Landroid/view/ViewGroup;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Landroid/view/ViewGroup;

    .line 31
    .line 32
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->M(Landroid/view/ViewGroup;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method

.method private N(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    new-instance p0, Ll/w8n0;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/w8n0;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->H0:I

    .line 11
    .line 12
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->I0:I

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->a:I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->k0(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static synthetic a()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 4
    .line 5
    sget v2, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->t:I

    .line 6
    .line 7
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public static synthetic b()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->B(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public static synthetic d()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->H(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->E(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->G(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->C(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    new-instance v1, Ll/m8n0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/m8n0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0, v1}, Ll/wrv;->n0(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Ljava/lang/Boolean;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->K(Ljava/lang/Boolean;I)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)Ll/k8n0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    return-object p0
.end method


# virtual methods
.method public final synthetic B(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Ll/k8n0;->d4(I)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic E(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->A()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->N(Lcom/p1/mobile/android/app/Act;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 12
    .line 13
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 14
    .line 15
    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p2

    .line 23
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string v0, "user"

    .line 28
    .line 29
    invoke-virtual {p1, p2, v0}, Ll/k8n0;->i4(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 33
    .line 34
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 41
    .line 42
    const/4 p2, 0x0

    .line 43
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->dismissChatTips()Ll/v3f$c;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public final synthetic G(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 2
    .line 3
    const-string v1, "user"

    .line 4
    .line 5
    invoke-virtual {v0, p1, v1}, Ll/k8n0;->i4(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->dismissChatTips()Ll/v3f$c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 24
    .line 25
    invoke-static {p0, p1}, Ll/jkp0;->h(Ll/i6t;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final synthetic H(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-interface {p0, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public I(ZLjava/lang/CharSequence;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->P(Z)V

    .line 3
    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_1

    .line 8
    .line 9
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    sget v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->t:I

    .line 14
    .line 15
    if-le p1, v0, :cond_0

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-interface {p2, p1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 28
    .line 29
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public J(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->l:Ljava/lang/String;

    .line 6
    .line 7
    new-instance v2, Ll/n8n0;

    .line 8
    .line 9
    invoke-direct {v2, p0}, Ll/n8n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->T(Ljava/util/List;Ljava/lang/String;Ll/y20;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public O(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->L(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->P(Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->v()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public P(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->show()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->b:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->M(Landroid/view/ViewGroup;)V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 27
    .line 28
    invoke-virtual {p1, v1, v0}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 37
    .line 38
    new-instance v1, Ll/qcr;

    .line 39
    .line 40
    sget v2, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->t:I

    .line 41
    .line 42
    mul-int/lit8 v2, v2, 0x2

    .line 43
    .line 44
    new-instance v3, Ll/t8n0;

    .line 45
    .line 46
    invoke-direct {v3}, Ll/t8n0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-direct {v1, v2, v3}, Ll/qcr;-><init>(ILl/x20;)V

    .line 50
    .line 51
    .line 52
    const/4 v2, 0x1

    .line 53
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 54
    .line 55
    aput-object v1, v2, v0

    .line 56
    .line 57
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 58
    .line 59
    .line 60
    const/4 p1, 0x3

    .line 61
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    new-instance v2, Ll/u8n0;

    .line 74
    .line 75
    invoke-direct {v2, p0}, Ll/u8n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 76
    .line 77
    .line 78
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 79
    .line 80
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 81
    .line 82
    invoke-virtual {p1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-eqz p1, :cond_1

    .line 91
    .line 92
    sget-object p1, Ll/oze;->e:Ljava/util/ArrayList;

    .line 93
    .line 94
    :goto_0
    move-object v4, p1

    .line 95
    goto :goto_1

    .line 96
    :cond_1
    sget-object p1, Ll/oze;->f:Ljava/util/ArrayList;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :goto_1
    new-instance v5, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    new-instance v6, Ll/v8n0;

    .line 105
    .line 106
    invoke-direct {v6}, Ll/v8n0;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual/range {v0 .. v6}, Ll/wrv;->m(Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;)Ll/lb2;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->k:Lv/VPager;

    .line 114
    .line 115
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 116
    .line 117
    .line 118
    :cond_2
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->v()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/k8n0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->s(Ll/k8n0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/x8n0;->b(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public r()V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/c0s;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 8
    .line 9
    sget v3, Ll/jgc0;->o:I

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    const/4 v5, 0x0

    .line 16
    invoke-virtual {p0, v4, v5}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->q(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-direct {v1, v2, v3, v4}, Ll/c0s;-><init>(Ll/xzs;ILandroid/view/View;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 24
    .line 25
    new-instance v2, Ll/l8n0;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ll/l8n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 34
    .line 35
    new-instance v2, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$a;

    .line 36
    .line 37
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->setOnShowListener(Landroid/content/DialogInterface$OnShowListener;)V

    .line 41
    .line 42
    .line 43
    new-instance v1, Landroid/view/View;

    .line 44
    .line 45
    invoke-direct {v1, v0}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->a:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatKeyboardRoot;

    .line 49
    .line 50
    new-instance v3, Ll/o8n0;

    .line 51
    .line 52
    invoke-direct {v3, p0}, Ll/o8n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->b:Landroid/widget/FrameLayout;

    .line 59
    .line 60
    new-instance v2, Ll/p8n0;

    .line 61
    .line 62
    invoke-direct {v2, p0}, Ll/p8n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 69
    .line 70
    sget v2, Ll/jgc0;->h:I

    .line 71
    .line 72
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->c0(I)V

    .line 73
    .line 74
    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 76
    .line 77
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CHAT_INPUT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 78
    .line 79
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->j0(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->i:Lv/VText;

    .line 83
    .line 84
    new-instance v2, Ll/q8n0;

    .line 85
    .line 86
    invoke-direct {v2, p0, v0}, Ll/q8n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;Lcom/p1/mobile/android/app/Act;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->e:Landroid/widget/LinearLayout;

    .line 93
    .line 94
    new-instance v1, Ll/r8n0;

    .line 95
    .line 96
    invoke-direct {v1}, Ll/r8n0;-><init>()V

    .line 97
    .line 98
    .line 99
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->h:Landroid/widget/ImageView;

    .line 103
    .line 104
    const/4 v1, 0x0

    .line 105
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->h:Landroid/widget/ImageView;

    .line 109
    .line 110
    new-instance v1, Ll/s8n0;

    .line 111
    .line 112
    invoke-direct {v1, p0}, Ll/s8n0;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 113
    .line 114
    .line 115
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 119
    .line 120
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$b;

    .line 121
    .line 122
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$b;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public s(Ll/k8n0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->l:Ll/k8n0;

    .line 2
    .line 3
    return-void
.end method

.method public u(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 22
    .line 23
    const-string p1, ""

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public v()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 24
    .line 25
    .line 26
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->m:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 29
    .line 30
    .line 31
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->s:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r:Landroid/animation/ValueAnimator;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->j:Landroid/widget/FrameLayout;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_3

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->j:Landroid/widget/FrameLayout;

    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->y()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 65
    .line 66
    .line 67
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->c:Lv/VLinear;

    .line 68
    .line 69
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->c:Lv/VLinear;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->y()I

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    int-to-float p0, p0

    .line 82
    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 83
    .line 84
    .line 85
    :cond_4
    return-void
.end method

.method public w(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, "\n|\r"

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public x()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->g:Lv/VEditText;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->w(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public final y()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->o:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Ljava/lang/Integer;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_0
    return v0
.end method

.method public z()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->d:Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/chat/VirtualChatInputTipsView;->O()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
