.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;
.source "SourceFile"

# interfaces
.implements Ll/arl;


# instance fields
.field public h:Ll/ft5;

.field public i:Landroid/animation/AnimatorSet;

.field public j:Landroid/animation/Animator;

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ll/leo0;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/leo0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->k:Ll/y20;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->k:Ll/y20;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->k:Ll/y20;

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->n(Ll/y20;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/leo0;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->j(Ll/leo0;Ll/y20;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->l()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/x20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->m(Ll/x20;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/y20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->k(Ll/y20;Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public M()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Ll/y20;)V
    .locals 1
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/leo0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->j:Landroid/animation/Animator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->h:Ll/ft5;

    .line 20
    .line 21
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->w(Ll/y20;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final synthetic j(Ll/leo0;Ll/y20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ll/leo0;->d()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    if-nez p3, :cond_0

    .line 10
    .line 11
    invoke-interface {p2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->h:Ll/ft5;

    .line 15
    .line 16
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->i(Ll/y20;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic k(Ll/y20;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->w(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->k:Ll/y20;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->l:Ll/leo0;

    .line 10
    .line 11
    invoke-interface {v0, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic m(Ll/x20;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    invoke-interface {p1}, Ll/x20;->call()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic n(Ll/y20;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->v(Ll/y20;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->h:Ll/ft5;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->h:Ll/ft5;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->i:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->q(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->j:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->q(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->k:Ll/y20;

    .line 18
    .line 19
    return-void
.end method

.method public final q(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/animation/Animator;->end()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public s(Ll/leo0;Ll/y20;Ll/x20;Ll/y20;)V
    .locals 4
    .param p4    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/leo0;",
            "Ll/y20<",
            "Ll/leo0;",
            ">;",
            "Ll/x20;",
            "Ll/y20<",
            "Ll/leo0;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->l:Ll/leo0;

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->h:Ll/ft5;

    .line 11
    .line 12
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->e:Lv/VImage;

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->f:Lv/VDraweeView;

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->g:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->u(Landroid/view/View;Ll/leo0;Ll/y20;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1}, Ll/leo0;->g()Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-eqz p2, :cond_1

    .line 39
    .line 40
    invoke-virtual {p1}, Ll/leo0;->a()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->getStartColor()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-nez p2, :cond_1

    .line 53
    .line 54
    invoke-virtual {p1}, Ll/leo0;->a()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->getEndColor()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p2

    .line 62
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-nez p2, :cond_1

    .line 67
    .line 68
    invoke-virtual {p1}, Ll/leo0;->a()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-virtual {p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->getStartColor()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p2

    .line 76
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    invoke-virtual {p1}, Ll/leo0;->a()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->getEndColor()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    filled-new-array {p2, v0}, [I

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    sget-object v0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 97
    .line 98
    sget v2, Ll/qa00;->i:I

    .line 99
    .line 100
    int-to-float v2, v2

    .line 101
    invoke-static {p2, v0, v2, v1}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 102
    .line 103
    .line 104
    move-result-object p2

    .line 105
    :try_start_0
    invoke-virtual {p1}, Ll/leo0;->a()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkVirtualVoice$BgStyle;->getAlpha()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 114
    .line 115
    .line 116
    move-result v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    const/high16 v2, 0x437f0000    # 255.0f

    .line 118
    .line 119
    mul-float/2addr v0, v2

    .line 120
    float-to-int v0, v0

    .line 121
    goto :goto_0

    .line 122
    :catch_0
    const/16 v0, 0xff

    .line 123
    .line 124
    :goto_0
    invoke-virtual {p2, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->getRoot()Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    invoke-virtual {v0, p2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 132
    .line 133
    .line 134
    :cond_1
    invoke-virtual {p1}, Ll/leo0;->c()Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-nez v0, :cond_2

    .line 143
    .line 144
    sget v2, Ll/qa00;->g:I

    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_2
    const/high16 v2, 0x41400000    # 12.0f

    .line 148
    .line 149
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->d:Lv/VText;

    .line 154
    .line 155
    invoke-static {v3, v2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->d:Lv/VText;

    .line 159
    .line 160
    invoke-static {v2, v1}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 161
    .line 162
    .line 163
    if-nez v0, :cond_3

    .line 164
    .line 165
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->c:Lv/VDraweeView;

    .line 166
    .line 167
    sget v1, Ll/qa00;->s:I

    .line 168
    .line 169
    const-string v2, "context_livingAct"

    .line 170
    .line 171
    invoke-static {v2, v0, p2, v1}, Ll/izs;->t(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 172
    .line 173
    .line 174
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->d:Lv/VText;

    .line 175
    .line 176
    invoke-virtual {p1}, Ll/leo0;->b()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceChatUserNotificationItemViewBindings;->d:Lv/VText;

    .line 184
    .line 185
    const/4 p2, 0x2

    .line 186
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, p3, p4}, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->x(Ll/x20;Ll/y20;)V

    .line 190
    .line 191
    .line 192
    return-void
.end method

.method public final u(Landroid/view/View;Ll/leo0;Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ll/leo0;",
            "Ll/y20<",
            "Ll/leo0;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/n8p0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p3}, Ll/n8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/leo0;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final v(Ll/y20;)V
    .locals 4
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/leo0;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/ft5;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->h:Ll/ft5;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->l:Ll/leo0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/leo0;->e()J

    .line 11
    .line 12
    .line 13
    move-result-wide v1

    .line 14
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-static {v1, v2, v3}, Lrx/c;->timer(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v1, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/o8p0;

    .line 33
    .line 34
    invoke-direct {v2, p0, p1}, Ll/o8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/y20;)V

    .line 35
    .line 36
    .line 37
    invoke-static {v2}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Ll/ft5;->a(Ll/kcg0;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public final w(Ll/y20;)V
    .locals 2
    .param p1    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/leo0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->k:Ll/y20;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->j:Landroid/animation/Animator;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    new-array p1, p1, [F

    .line 9
    .line 10
    fill-array-data p1, :array_0

    .line 11
    .line 12
    .line 13
    sget-object v0, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 14
    .line 15
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->j:Landroid/animation/Animator;

    .line 20
    .line 21
    const-wide/16 v0, 0xc8

    .line 22
    .line 23
    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->j:Landroid/animation/Animator;

    .line 27
    .line 28
    new-instance v0, Ll/p8p0;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/p8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->j:Landroid/animation/Animator;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    nop

    .line 43
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final x(Ll/x20;Ll/y20;)V
    .locals 7
    .param p2    # Ll/y20;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/x20;",
            "Ll/y20<",
            "Ll/leo0;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->i:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->i:Landroid/animation/AnimatorSet;

    .line 11
    .line 12
    const/high16 v0, 0x43680000    # 232.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    neg-int v0, v0

    .line 19
    int-to-float v0, v0

    .line 20
    const/4 v1, 0x2

    .line 21
    new-array v2, v1, [F

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    aput v0, v2, v3

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    const/4 v4, 0x0

    .line 28
    aput v4, v2, v0

    .line 29
    .line 30
    const-string v4, "translationX"

    .line 31
    .line 32
    invoke-static {p0, v4, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v4, Landroid/view/animation/DecelerateInterpolator;

    .line 37
    .line 38
    invoke-direct {v4}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, v4}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    .line 43
    .line 44
    const-wide/16 v4, 0x12c

    .line 45
    .line 46
    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 47
    .line 48
    .line 49
    new-array v4, v1, [F

    .line 50
    .line 51
    fill-array-data v4, :array_0

    .line 52
    .line 53
    .line 54
    const-string v5, "alpha"

    .line 55
    .line 56
    invoke-static {p0, v5, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    const-wide/16 v5, 0x190

    .line 61
    .line 62
    invoke-virtual {v4, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 63
    .line 64
    .line 65
    iget-object v5, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->i:Landroid/animation/AnimatorSet;

    .line 66
    .line 67
    new-array v1, v1, [Landroid/animation/Animator;

    .line 68
    .line 69
    aput-object v2, v1, v3

    .line 70
    .line 71
    aput-object v4, v1, v0

    .line 72
    .line 73
    invoke-virtual {v5, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->i:Landroid/animation/AnimatorSet;

    .line 77
    .line 78
    new-instance v1, Ll/l8p0;

    .line 79
    .line 80
    invoke-direct {v1, p0, p1}, Ll/l8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/x20;)V

    .line 81
    .line 82
    .line 83
    new-instance p1, Ll/m8p0;

    .line 84
    .line 85
    invoke-direct {p1, p0, p2}, Ll/m8p0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;Ll/y20;)V

    .line 86
    .line 87
    .line 88
    invoke-static {v0, v1, p1}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 89
    .line 90
    .line 91
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/notification/voice/VoiceUserNotificationItemView;->i:Landroid/animation/AnimatorSet;

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->start()V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
