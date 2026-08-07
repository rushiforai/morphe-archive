.class public Ll/q7n;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/e7n;",
        ">;"
    }
.end annotation


# static fields
.field public static B:I = 0x28

.field public static C:I = 0x1e

.field public static D:I = 0x28


# instance fields
.field public final A:Landroid/text/InputFilter;

.field public k:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatKeyboardRoot;

.field public l:Landroid/widget/FrameLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lv/VFrame;

.field public o:Lcom/p1/mobile/putong/live/livingroom/common/chat/input/ChatInputViewGroup;

.field public p:Landroid/widget/CheckBox;

.field public q:Lv/VEditText;

.field public r:Landroid/widget/ImageView;

.field public s:Lv/VText;

.field public t:Landroid/widget/FrameLayout;

.field public u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

.field public v:Landroid/animation/ValueAnimator;

.field public w:I

.field public x:Landroid/animation/Animator;

.field public y:Landroid/animation/Animator;

.field public final z:Landroid/text/InputFilter;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/e7n;)V
    .locals 3
    .param p1    # Ll/e7n;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->n2:I

    .line 2
    .line 3
    sget v1, Ll/jgc0;->g:I

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-direct {p0, v0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(IILcom/p1/mobile/android/app/Act;Ll/y8s;)V

    .line 10
    .line 11
    .line 12
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 13
    .line 14
    iput-object p1, p0, Ll/q7n;->u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Ll/q7n;->v:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    new-instance p1, Ll/qcr;

    .line 20
    .line 21
    sget v0, Ll/q7n;->B:I

    .line 22
    .line 23
    mul-int/lit8 v0, v0, 0x2

    .line 24
    .line 25
    new-instance v1, Ll/m7n;

    .line 26
    .line 27
    invoke-direct {v1}, Ll/m7n;-><init>()V

    .line 28
    .line 29
    .line 30
    invoke-direct {p1, v0, v1}, Ll/qcr;-><init>(ILl/x20;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Ll/q7n;->z:Landroid/text/InputFilter;

    .line 34
    .line 35
    new-instance p1, Ll/qcr;

    .line 36
    .line 37
    sget v0, Ll/q7n;->C:I

    .line 38
    .line 39
    mul-int/lit8 v0, v0, 0x2

    .line 40
    .line 41
    new-instance v1, Ll/n7n;

    .line 42
    .line 43
    invoke-direct {v1}, Ll/n7n;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-direct {p1, v0, v1}, Ll/qcr;-><init>(ILl/x20;)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Ll/q7n;->A:Landroid/text/InputFilter;

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CHAT_INPUT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->z(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic G()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 4
    .line 5
    sget v2, Ll/q7n;->B:I

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

.method public static synthetic H(Ll/q7n;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q7n;->X(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic I(Ll/q7n;Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/q7n;->Y(Landroid/widget/CompoundButton;Z)V

    return-void
.end method

.method public static synthetic J(Ll/q7n;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q7n;->W(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K()V
    .locals 2

    .line 1
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 2
    .line 3
    sget v1, Ll/q7n;->C:I

    .line 4
    .line 5
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v0, v1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic L(Ll/q7n;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q7n;->Z()V

    return-void
.end method

.method public static synthetic M(Ll/q7n;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/q7n;->b0(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic N(Ll/q7n;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/q7n;->V(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic O(Ll/q7n;Ljava/lang/Boolean;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/q7n;->g0(Ljava/lang/Boolean;I)V

    return-void
.end method

.method public static synthetic P(Ll/q7n;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q7n;->a0()V

    return-void
.end method

.method private synthetic V(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/e7n;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/e7n;->u4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic W(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/j35;->h()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast p0, Ll/e7n;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/nn2;->b4()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Ll/q7n;->q:Lv/VEditText;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 26
    .line 27
    check-cast p0, Ll/e7n;

    .line 28
    .line 29
    invoke-static {p1}, Ll/j35;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/e7n;->R4(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private g0(Ljava/lang/Boolean;I)V
    .locals 1

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    iget v0, p0, Ll/q7n;->w:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput p2, p0, Ll/q7n;->w:I

    .line 8
    .line 9
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 16
    .line 17
    check-cast p1, Ll/e7n;

    .line 18
    .line 19
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p1, v0, p2}, Ll/e7n;->O4(Ljava/lang/Boolean;I)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->INPUT:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ll/q7n;->k0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object p1, p0, Ll/q7n;->u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 31
    .line 32
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 33
    .line 34
    if-eq p1, v0, :cond_2

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 37
    .line 38
    invoke-direct {p0, p1}, Ll/q7n;->k0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 42
    .line 43
    check-cast p0, Ll/e7n;

    .line 44
    .line 45
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Ll/e7n;->O4(Ljava/lang/Boolean;I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-direct {p0, v0}, Ll/q7n;->k0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method private k0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/q7n;->r:Landroid/widget/ImageView;

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
    const/4 v0, 0x0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eq p1, v1, :cond_2

    .line 18
    .line 19
    iget-object v3, p0, Ll/q7n;->u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 20
    .line 21
    if-ne v3, v1, :cond_1

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_1
    move v1, v0

    .line 25
    goto :goto_2

    .line 26
    :cond_2
    :goto_1
    move v1, v2

    .line 27
    :goto_2
    iget-object v3, p0, Ll/q7n;->t:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-static {v3, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p0, Ll/q7n;->u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 33
    .line 34
    if-ne v1, p1, :cond_3

    .line 35
    .line 36
    goto :goto_4

    .line 37
    :cond_3
    iput-object p1, p0, Ll/q7n;->u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 38
    .line 39
    iget-object v1, p0, Ll/q7n;->t:Landroid/widget/FrameLayout;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-nez v1, :cond_4

    .line 46
    .line 47
    const/high16 v1, 0x435c0000    # 220.0f

    .line 48
    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    :cond_4
    iget v3, p0, Ll/q7n;->w:I

    .line 54
    .line 55
    if-nez v3, :cond_5

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/q7n;->act()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    sget-object v3, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 61
    .line 62
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    :cond_5
    iget-object v4, p0, Ll/q7n;->t:Landroid/widget/FrameLayout;

    .line 73
    .line 74
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-eq v4, v3, :cond_6

    .line 79
    .line 80
    iget-object v4, p0, Ll/q7n;->t:Landroid/widget/FrameLayout;

    .line 81
    .line 82
    invoke-static {v4, v3}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object v4, p0, Ll/q7n;->m:Landroid/widget/LinearLayout;

    .line 86
    .line 87
    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    sub-int v1, v3, v1

    .line 92
    .line 93
    int-to-float v1, v1

    .line 94
    add-float/2addr v1, v4

    .line 95
    iget-object v5, p0, Ll/q7n;->m:Landroid/widget/LinearLayout;

    .line 96
    .line 97
    invoke-virtual {v5, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 98
    .line 99
    .line 100
    sget-object v5, Ll/q7n$b;->a:[I

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
    if-eq p1, v2, :cond_7

    .line 110
    .line 111
    const/4 v3, 0x0

    .line 112
    if-eq p1, v5, :cond_8

    .line 113
    .line 114
    const/4 v6, 0x3

    .line 115
    goto :goto_3

    .line 116
    :cond_7
    int-to-float v3, v3

    .line 117
    :cond_8
    :goto_3
    cmpl-float p1, v4, v3

    .line 118
    .line 119
    if-nez p1, :cond_9

    .line 120
    .line 121
    :goto_4
    return-void

    .line 122
    :cond_9
    iget-object p1, p0, Ll/q7n;->v:Landroid/animation/ValueAnimator;

    .line 123
    .line 124
    invoke-static {p1}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 125
    .line 126
    .line 127
    new-array p1, v5, [F

    .line 128
    .line 129
    aput v1, p1, v0

    .line 130
    .line 131
    aput v3, p1, v2

    .line 132
    .line 133
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Ll/q7n;->v:Landroid/animation/ValueAnimator;

    .line 138
    .line 139
    const-wide/16 v0, 0x96

    .line 140
    .line 141
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 142
    .line 143
    .line 144
    iget-object p1, p0, Ll/q7n;->v:Landroid/animation/ValueAnimator;

    .line 145
    .line 146
    new-instance v0, Ll/o7n;

    .line 147
    .line 148
    invoke-direct {v0, p0}, Ll/o7n;-><init>(Ll/q7n;)V

    .line 149
    .line 150
    .line 151
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 152
    .line 153
    .line 154
    iget-object p0, p0, Ll/q7n;->v:Landroid/animation/ValueAnimator;

    .line 155
    .line 156
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method private l0(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->c:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

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
    invoke-direct {p0, p1}, Ll/q7n;->l0(Landroid/view/ViewGroup;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/e7n;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r7n;->a(Ll/q7n;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public R(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-static {v0}, Ll/j35;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 32
    .line 33
    const-string p1, ""

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public S(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q7n;->r:Landroid/widget/ImageView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    if-eqz p1, :cond_1

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    const/4 p1, 0x0

    .line 14
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/q7n;->u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 20
    .line 21
    if-ne p1, v0, :cond_2

    .line 22
    .line 23
    iget-object p1, p0, Ll/q7n;->r:Landroid/widget/ImageView;

    .line 24
    .line 25
    sget v0, Ll/obc0;->M1:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 31
    .line 32
    .line 33
    :cond_2
    :goto_0
    return-void
.end method

.method public final T()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/q7n;->n:Lv/VFrame;

    .line 2
    .line 3
    sget-object v1, Ll/gt0;->g:Landroid/util/Property;

    .line 4
    .line 5
    const/high16 v2, 0x42440000    # 49.0f

    .line 6
    .line 7
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v4, 0x0

    .line 12
    filled-new-array {v4, v3}, [I

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-static {v0, v1, v3}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v3, p0, Ll/q7n;->n:Lv/VFrame;

    .line 21
    .line 22
    sget-object v4, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 23
    .line 24
    const/4 v5, 0x2

    .line 25
    new-array v6, v5, [F

    .line 26
    .line 27
    fill-array-data v6, :array_0

    .line 28
    .line 29
    .line 30
    invoke-static {v3, v4, v6}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    filled-new-array {v0, v3}, [Landroid/animation/Animator;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-wide/16 v6, 0xb4

    .line 43
    .line 44
    invoke-virtual {v0, v6, v7}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Ll/q7n;->x:Landroid/animation/Animator;

    .line 49
    .line 50
    sget-object v3, Ll/gt0;->d:Landroid/view/animation/Interpolator;

    .line 51
    .line 52
    invoke-virtual {v0, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/q7n;->x:Landroid/animation/Animator;

    .line 56
    .line 57
    new-instance v6, Ll/p7n;

    .line 58
    .line 59
    invoke-direct {v6, p0}, Ll/p7n;-><init>(Ll/q7n;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v6}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/q7n;->n:Lv/VFrame;

    .line 66
    .line 67
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    const/4 v6, 0x0

    .line 72
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    filled-new-array {v2, v6}, [I

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-static {v0, v1, v2}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, p0, Ll/q7n;->n:Lv/VFrame;

    .line 85
    .line 86
    new-array v2, v5, [F

    .line 87
    .line 88
    fill-array-data v2, :array_1

    .line 89
    .line 90
    .line 91
    invoke-static {v1, v4, v2}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    filled-new-array {v0, v1}, [Landroid/animation/Animator;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-wide/16 v1, 0x78

    .line 104
    .line 105
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    iput-object v0, p0, Ll/q7n;->y:Landroid/animation/Animator;

    .line 110
    .line 111
    invoke-virtual {v0, v3}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Ll/q7n;->y:Landroid/animation/Animator;

    .line 115
    .line 116
    new-instance v1, Ll/g7n;

    .line 117
    .line 118
    invoke-direct {v1, p0}, Ll/g7n;-><init>(Ll/q7n;)V

    .line 119
    .line 120
    .line 121
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public U()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7n;->p:Landroid/widget/CheckBox;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic X(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q7n;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic Y(Landroid/widget/CompoundButton;Z)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p1, Ll/e7n;

    .line 4
    .line 5
    iput-boolean p2, p1, Ll/e7n;->t:Z

    .line 6
    .line 7
    iget-object p1, p0, Ll/q7n;->x:Landroid/animation/Animator;

    .line 8
    .line 9
    invoke-static {p1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/q7n;->y:Landroid/animation/Animator;

    .line 13
    .line 14
    invoke-static {p1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 15
    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ll/q7n;->x:Landroid/animation/Animator;

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 25
    .line 26
    check-cast p1, Ll/e7n;

    .line 27
    .line 28
    iget-object p1, p1, Ll/e7n;->u:Ll/c9n;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/c9n;->X3()V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Ll/q7n;->u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 36
    .line 37
    if-ne p1, v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/q7n;->act()Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object v0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Ll/q7n;->q:Lv/VEditText;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p1, p0, Ll/q7n;->y:Landroid/animation/Animator;

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 61
    .line 62
    check-cast p1, Ll/e7n;

    .line 63
    .line 64
    iget-object p1, p1, Ll/e7n;->u:Ll/c9n;

    .line 65
    .line 66
    const/4 v0, 0x0

    .line 67
    iput-object v0, p1, Ll/c9n;->k:Lcom/p1/mobile/putong/live/base/data/BLiveDanmakuListItem;

    .line 68
    .line 69
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 70
    .line 71
    invoke-static {p1, p2}, Ll/wv4;->a(Ll/y8s;Z)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p0}, Ll/q7n;->m0()V

    .line 75
    .line 76
    .line 77
    if-nez p2, :cond_2

    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 80
    .line 81
    check-cast p1, Ll/e7n;

    .line 82
    .line 83
    iget-object p1, p1, Ll/e7n;->s:Ljava/lang/String;

    .line 84
    .line 85
    invoke-virtual {p0, p1}, Ll/q7n;->d0(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_2
    return-void
.end method

.method public final synthetic Z()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/q7n;->f0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic a0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/q7n;->f0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-super {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic b0(Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iget-object p0, p0, Ll/q7n;->m:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final c0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/q7n;->u:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/q7n;->j0()V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->INPUT:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 12
    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/q7n;->j0()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/q7n;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object p0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 23
    .line 24
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    invoke-virtual {p0}, Ll/q7n;->act()Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Ll/q7n;->q:Lv/VEditText;

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public d0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e0(ZLjava/lang/CharSequence;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    sget v0, Ll/q7n;->B:I

    .line 10
    .line 11
    if-le p1, v0, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-interface {p2, p1, v0}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    :cond_0
    iget-object p1, p0, Ll/q7n;->q:Lv/VEditText;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 24
    .line 25
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public f0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7n;->o:Lcom/p1/mobile/putong/live/livingroom/common/chat/input/ChatInputViewGroup;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    sget p1, Ll/obc0;->v:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    const-string p1, "#19191e"

    .line 12
    .line 13
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public h0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/q7n;->p:Landroid/widget/CheckBox;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/q7n;->l:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/q7n;->l0(Landroid/view/ViewGroup;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 10
    .line 11
    check-cast p1, Ll/e7n;

    .line 12
    .line 13
    iget-boolean p1, p1, Ll/e7n;->t:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    move p1, v0

    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    :goto_0
    invoke-virtual {p0, p1}, Ll/q7n;->h0(Z)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/q7n;->p:Landroid/widget/CheckBox;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    xor-int/2addr p1, v0

    .line 30
    invoke-virtual {p0, p1}, Ll/q7n;->f0(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/q7n;->p:Landroid/widget/CheckBox;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/q7n;->p:Landroid/widget/CheckBox;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-virtual {v0, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 13
    .line 14
    .line 15
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->EMOJI:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 16
    .line 17
    invoke-direct {p0, v0}, Ll/q7n;->k0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 18
    .line 19
    .line 20
    const-string p0, "e_intl_emoticon_panel_enter_click"

    .line 21
    .line 22
    const-string v0, "p_intl_emoticon_panel_show"

    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public l()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Landroid/view/View;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->e:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    iget-object v2, p0, Ll/q7n;->k:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatKeyboardRoot;

    .line 11
    .line 12
    new-instance v3, Ll/l7n;

    .line 13
    .line 14
    invoke-direct {v3, p0}, Ll/l7n;-><init>(Ll/q7n;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/q7n;->Q(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/q7n;->T()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/q7n;->l:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    new-instance v0, Ll/f7n;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ll/f7n;-><init>(Ll/q7n;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/q7n;->o:Lcom/p1/mobile/putong/live/livingroom/common/chat/input/ChatInputViewGroup;

    .line 18
    .line 19
    new-instance v0, Ll/h7n;

    .line 20
    .line 21
    invoke-direct {v0}, Ll/h7n;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/q7n;->s:Lv/VText;

    .line 28
    .line 29
    new-instance v0, Ll/i7n;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/i7n;-><init>(Ll/q7n;)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Ll/q7n;->q:Lv/VEditText;

    .line 38
    .line 39
    new-instance v0, Ll/q7n$a;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/q7n$a;-><init>(Ll/q7n;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/q7n;->r:Landroid/widget/ImageView;

    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 50
    .line 51
    check-cast v0, Ll/e7n;

    .line 52
    .line 53
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Ll/rwn0;

    .line 58
    .line 59
    invoke-virtual {v0}, Ll/rwn0;->Y2()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-static {v0}, Ll/guk0;->h(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Ll/q7n;->r:Landroid/widget/ImageView;

    .line 71
    .line 72
    new-instance v0, Ll/j7n;

    .line 73
    .line 74
    invoke-direct {v0, p0}, Ll/j7n;-><init>(Ll/q7n;)V

    .line 75
    .line 76
    .line 77
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/q7n;->p:Landroid/widget/CheckBox;

    .line 81
    .line 82
    new-instance v0, Ll/k7n;

    .line 83
    .line 84
    invoke-direct {v0, p0}, Ll/k7n;-><init>(Ll/q7n;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public m0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/q7n;->q:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/q7n;->U()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/q7n;->A:Landroid/text/InputFilter;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p0, Ll/q7n;->z:Landroid/text/InputFilter;

    .line 13
    .line 14
    :goto_0
    const/4 v2, 0x1

    .line 15
    new-array v2, v2, [Landroid/text/InputFilter;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    aput-object v1, v2, v3

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setFilters([Landroid/text/InputFilter;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Ll/q7n;->U()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    sget p0, Ll/q7n;->C:I

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    sget p0, Ll/q7n;->B:I

    .line 33
    .line 34
    :goto_1
    sput p0, Ll/q7n;->D:I

    .line 35
    .line 36
    return-void
.end method
