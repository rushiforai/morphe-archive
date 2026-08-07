.class public Ll/ix4;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/mw4<",
        "Ll/dw40;",
        ">;>;"
    }
.end annotation


# static fields
.field public static E:I = 0x28

.field public static F:I = 0x16

.field public static G:I = 0x28


# instance fields
.field public A:Landroid/animation/ValueAnimator;

.field public B:I

.field public final C:Landroid/text/InputFilter;

.field public final D:Landroid/text/InputFilter;

.field public k:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatKeyboardRoot;

.field public l:Landroid/widget/FrameLayout;

.field public m:Landroid/widget/LinearLayout;

.field public n:Landroid/widget/LinearLayout;

.field public o:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/tag/DanmakuTagViewContainer;

.field public p:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/normal/NormalDanmakuImgViewGroup;

.field public q:Lcom/p1/mobile/putong/live/livingroom/common/chat/input/ChatInputViewGroup;

.field public r:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;

.field public s:Lv/VEditText;

.field public t:Landroid/widget/ImageView;

.field public u:Lv/VText;

.field public v:Landroid/widget/FrameLayout;

.field public w:Lv/VPager;

.field public x:Landroid/animation/ValueAnimator;

.field public y:Landroid/animation/ValueAnimator;

.field public z:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/mw4;)V
    .locals 3
    .param p1    # Ll/mw4;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget v0, Ll/yec0;->S:I

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
    const/16 v0, 0x1ea

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    filled-new-array {v1, v0}, [I

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Ll/ix4;->x:Landroid/animation/ValueAnimator;

    .line 24
    .line 25
    const/16 v0, 0xb4

    .line 26
    .line 27
    filled-new-array {v1, v0}, [I

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/ix4;->y:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->NONE:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 38
    .line 39
    iput-object v0, p0, Ll/ix4;->z:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput-object v0, p0, Ll/ix4;->A:Landroid/animation/ValueAnimator;

    .line 43
    .line 44
    new-instance v0, Ll/qcr;

    .line 45
    .line 46
    sget v1, Ll/ix4;->E:I

    .line 47
    .line 48
    mul-int/lit8 v1, v1, 0x2

    .line 49
    .line 50
    new-instance v2, Ll/cx4;

    .line 51
    .line 52
    invoke-direct {v2}, Ll/cx4;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-direct {v0, v1, v2}, Ll/qcr;-><init>(ILl/x20;)V

    .line 56
    .line 57
    .line 58
    iput-object v0, p0, Ll/ix4;->C:Landroid/text/InputFilter;

    .line 59
    .line 60
    new-instance v0, Ll/qcr;

    .line 61
    .line 62
    sget v1, Ll/ix4;->F:I

    .line 63
    .line 64
    mul-int/lit8 v1, v1, 0x2

    .line 65
    .line 66
    new-instance v2, Ll/dx4;

    .line 67
    .line 68
    invoke-direct {v2}, Ll/dx4;-><init>()V

    .line 69
    .line 70
    .line 71
    invoke-direct {v0, v1, v2}, Ll/qcr;-><init>(ILl/x20;)V

    .line 72
    .line 73
    .line 74
    iput-object v0, p0, Ll/ix4;->D:Landroid/text/InputFilter;

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;->CHAT_INPUT:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->z(Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/LiveDialogEnum;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Ll/ix4;->x:Landroid/animation/ValueAnimator;

    .line 82
    .line 83
    const-wide/16 v1, 0x1ea

    .line 84
    .line 85
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/ix4;->x:Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 91
    .line 92
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/ix4;->x:Landroid/animation/ValueAnimator;

    .line 99
    .line 100
    new-instance v1, Ll/ex4;

    .line 101
    .line 102
    invoke-direct {v1, p1}, Ll/ex4;-><init>(Ll/mw4;)V

    .line 103
    .line 104
    .line 105
    new-instance v2, Ll/fx4;

    .line 106
    .line 107
    invoke-direct {v2, p1}, Ll/fx4;-><init>(Ll/mw4;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 111
    .line 112
    .line 113
    iget-object v0, p0, Ll/ix4;->x:Landroid/animation/ValueAnimator;

    .line 114
    .line 115
    new-instance v1, Ll/gx4;

    .line 116
    .line 117
    invoke-direct {v1, p1}, Ll/gx4;-><init>(Ll/mw4;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/ix4;->y:Landroid/animation/ValueAnimator;

    .line 124
    .line 125
    const-wide/16 v1, 0xb4

    .line 126
    .line 127
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 128
    .line 129
    .line 130
    iget-object v0, p0, Ll/ix4;->y:Landroid/animation/ValueAnimator;

    .line 131
    .line 132
    new-instance v1, Landroid/view/animation/LinearInterpolator;

    .line 133
    .line 134
    invoke-direct {v1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Ll/ix4;->y:Landroid/animation/ValueAnimator;

    .line 141
    .line 142
    new-instance v1, Ll/hx4;

    .line 143
    .line 144
    invoke-direct {v1, p1}, Ll/hx4;-><init>(Ll/mw4;)V

    .line 145
    .line 146
    .line 147
    new-instance v2, Ll/uw4;

    .line 148
    .line 149
    invoke-direct {v2, p1}, Ll/uw4;-><init>(Ll/mw4;)V

    .line 150
    .line 151
    .line 152
    invoke-static {v0, v1, v2}, Ll/gt0;->w(Landroid/animation/Animator;Ljava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 153
    .line 154
    .line 155
    iget-object p0, p0, Ll/ix4;->y:Landroid/animation/ValueAnimator;

    .line 156
    .line 157
    new-instance v0, Ll/vw4;

    .line 158
    .line 159
    invoke-direct {v0, p1}, Ll/vw4;-><init>(Ll/mw4;)V

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 163
    .line 164
    .line 165
    return-void
.end method

.method public static synthetic F(Ll/ix4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ix4;->a0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/mw4;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/nn2;->Y3(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I(Ll/ix4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ix4;->b0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/mw4;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0, p1}, Ll/nn2;->Z3(ZI)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic K()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 4
    .line 5
    sget v2, Ll/ix4;->F:I

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

.method public static synthetic L()V
    .locals 3

    .line 1
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 4
    .line 5
    sget v2, Ll/ix4;->E:I

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

.method public static synthetic M(Ll/mw4;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/nn2;->a4(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic N(Ll/ix4;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ix4;->e0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic O()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic P(Ll/ix4;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ix4;->c0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Q(Ll/mw4;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Ll/nn2;->Y3(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic R(Ll/mw4;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0, v0, p1}, Ll/nn2;->Z3(ZI)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic S(Ll/ix4;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ix4;->d0(Z)V

    return-void
.end method

.method public static synthetic T(Ll/mw4;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/nn2;->a4(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic U(Ll/ix4;Ljava/lang/Boolean;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ix4;->h0(Ljava/lang/Boolean;I)V

    return-void
.end method

.method private X()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ix4;->y:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ix4;->y:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/ix4;->x:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    iget-object p0, p0, Ll/ix4;->x:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 25
    .line 26
    .line 27
    :cond_1
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
    check-cast p0, Ll/mw4;

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

.method public final V(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jx4;->a(Ll/ix4;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public W(Ll/mw4;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/mw4<",
            "Ll/dw40;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public Y(Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ix4;->s:Lv/VEditText;

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
    iget-object v0, p0, Ll/ix4;->s:Lv/VEditText;

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
    iget-object p0, p0, Ll/ix4;->s:Lv/VEditText;

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

.method public Z()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ix4;->r:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->d()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic a0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/mw4;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/mw4;->n4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic b0(Landroid/view/View;)V
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
    check-cast p0, Ll/mw4;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/nn2;->b4()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Ll/ix4;->s:Lv/VEditText;

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
    check-cast p0, Ll/mw4;

    .line 28
    .line 29
    invoke-static {p1}, Ll/j35;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0, p1}, Ll/mw4;->G4(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final synthetic c0(Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object p1, p0, Ll/ix4;->z:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

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
    invoke-virtual {p0, p1}, Ll/ix4;->j0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

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
    invoke-virtual {p0, p1}, Ll/ix4;->j0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iget-object v0, p0, Ll/ix4;->s:Lv/VEditText;

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p0, Ll/ix4;->s:Lv/VEditText;

    .line 37
    .line 38
    const/4 v1, 0x0

    .line 39
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/ix4;->s:Lv/VEditText;

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/view/View;->requestFocus()Z

    .line 45
    .line 46
    .line 47
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 48
    .line 49
    check-cast p1, Ll/mw4;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_2

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 62
    .line 63
    check-cast p1, Ll/mw4;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    instance-of p1, p1, Ll/dw40;

    .line 70
    .line 71
    if-eqz p1, :cond_2

    .line 72
    .line 73
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 74
    .line 75
    check-cast p1, Ll/mw4;

    .line 76
    .line 77
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 82
    .line 83
    check-cast v0, Ll/mw4;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    check-cast v0, Ll/dw40;

    .line 90
    .line 91
    invoke-virtual {v0}, Ll/oo2;->j0()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v1, "anchorId"

    .line 96
    .line 97
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 102
    .line 103
    check-cast v1, Ll/mw4;

    .line 104
    .line 105
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    check-cast v1, Ll/dw40;

    .line 110
    .line 111
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    const-string v2, "liveId"

    .line 116
    .line 117
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 122
    .line 123
    check-cast p0, Ll/mw4;

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    check-cast p0, Ll/dw40;

    .line 130
    .line 131
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    const-string v2, "roomId"

    .line 136
    .line 137
    invoke-static {v2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    filled-new-array {v0, v1, p0}, [Ll/pf60;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    const-string v0, "e_audio_chat_sticker_button"

    .line 146
    .line 147
    invoke-static {v0, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 148
    .line 149
    .line 150
    :cond_2
    return-void
.end method

.method public final synthetic d0(Z)V
    .locals 1

    .line 1
    sput-boolean p1, Ll/mw4;->u:Z

    .line 2
    .line 3
    invoke-direct {p0}, Ll/ix4;->X()V

    .line 4
    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Ll/ix4;->x:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/ix4;->y:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 17
    .line 18
    .line 19
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/wv4;->a(Ll/y8s;Z)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/ix4;->l0()V

    .line 25
    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 30
    .line 31
    check-cast p1, Ll/mw4;

    .line 32
    .line 33
    iget-object p1, p1, Ll/mw4;->p:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ll/ix4;->f0(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    :cond_1
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

.method public final synthetic e0(Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/ix4;->s:Lv/VEditText;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Ll/q8g0;->J(Ljava/lang/CharSequence;)I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    sget v1, Ll/ix4;->G:I

    .line 31
    .line 32
    mul-int/lit8 v1, v1, 0x2

    .line 33
    .line 34
    if-le v0, v1, :cond_0

    .line 35
    .line 36
    sget-object p0, Ll/zrv;->e:Landroid/app/Application;

    .line 37
    .line 38
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->G6:I

    .line 39
    .line 40
    sget v0, Ll/ix4;->G:I

    .line 41
    .line 42
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Ll/ix4;->s:Lv/VEditText;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionStart()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget-object p0, p0, Ll/ix4;->s:Lv/VEditText;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-interface {p0, v0, p1}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public f0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ix4;->s:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g0(ZLjava/lang/CharSequence;)V
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
    sget v0, Ll/ix4;->E:I

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
    iget-object p1, p0, Ll/ix4;->s:Lv/VEditText;

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/ix4;->s:Lv/VEditText;

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

.method public final h0(Ljava/lang/Boolean;I)V
    .locals 1

    .line 1
    if-lez p2, :cond_0

    .line 2
    .line 3
    iget v0, p0, Ll/ix4;->B:I

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput p2, p0, Ll/ix4;->B:I

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
    check-cast p1, Ll/mw4;

    .line 18
    .line 19
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p1, v0, p2}, Ll/mw4;->C4(Ljava/lang/Boolean;I)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;->INPUT:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/ix4;->j0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object p1, p0, Ll/ix4;->z:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

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
    invoke-virtual {p0, p1}, Ll/ix4;->j0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 42
    .line 43
    check-cast p0, Ll/mw4;

    .line 44
    .line 45
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 46
    .line 47
    invoke-virtual {p0, p1, p2}, Ll/mw4;->C4(Ljava/lang/Boolean;I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {p0, v0}, Ll/ix4;->j0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public i0(Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ix4;->r:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/ix4;->r:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    new-instance p1, Ll/ww4;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/ww4;-><init>(Ll/ix4;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->setOnCheckedChangeListener(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;)V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const/4 p1, 0x0

    .line 20
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton;->setOnCheckedChangeListener(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/DanmakuToggleButton$a;)V

    .line 21
    .line 22
    .line 23
    :goto_0
    iget-object p1, p0, Ll/ix4;->l:Landroid/widget/FrameLayout;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/ix4;->k0(Landroid/view/ViewGroup;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x2

    .line 29
    invoke-static {p1}, Ll/wft;->b(I)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 36
    .line 37
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    new-instance v2, Ll/xw4;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Ll/xw4;-><init>(Ll/ix4;)V

    .line 44
    .line 45
    .line 46
    iget-object v3, p0, Ll/ix4;->s:Lv/VEditText;

    .line 47
    .line 48
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/wrv;->V()Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    sget-object p1, Ll/oze;->e:Ljava/util/ArrayList;

    .line 61
    .line 62
    :goto_1
    move-object v4, p1

    .line 63
    goto :goto_2

    .line 64
    :cond_1
    sget-object p1, Ll/oze;->f:Ljava/util/ArrayList;

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :goto_2
    new-instance v5, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    new-instance v6, Ll/yw4;

    .line 73
    .line 74
    invoke-direct {v6}, Ll/yw4;-><init>()V

    .line 75
    .line 76
    .line 77
    invoke-virtual/range {v0 .. v6}, Ll/wrv;->m(Lcom/p1/mobile/android/app/Act;Ll/y20;Landroid/widget/EditText;Ljava/util/ArrayList;Ljava/util/List;Ll/x20;)Ll/lb2;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iget-object p0, p0, Ll/ix4;->w:Lv/VPager;

    .line 82
    .line 83
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 84
    .line 85
    .line 86
    :cond_2
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mw4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ix4;->W(Ll/mw4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final j0(Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ix4;->t:Landroid/widget/ImageView;

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
    iget-object v0, p0, Ll/ix4;->w:Lv/VPager;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eq p1, v1, :cond_2

    .line 20
    .line 21
    iget-object v4, p0, Ll/ix4;->z:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

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
    iget-object v0, p0, Ll/ix4;->z:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 33
    .line 34
    if-ne v0, p1, :cond_3

    .line 35
    .line 36
    goto :goto_4

    .line 37
    :cond_3
    iput-object p1, p0, Ll/ix4;->z:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView$KeyboardModel;

    .line 38
    .line 39
    iget-object v0, p0, Ll/ix4;->v:Landroid/widget/FrameLayout;

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
    iget v1, p0, Ll/ix4;->B:I

    .line 54
    .line 55
    if-nez v1, :cond_5

    .line 56
    .line 57
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

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
    iget-object v4, p0, Ll/ix4;->v:Landroid/widget/FrameLayout;

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
    iget-object v4, p0, Ll/ix4;->v:Landroid/widget/FrameLayout;

    .line 81
    .line 82
    invoke-static {v4, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object v4, p0, Ll/ix4;->m:Landroid/widget/LinearLayout;

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
    iget-object v5, p0, Ll/ix4;->m:Landroid/widget/LinearLayout;

    .line 96
    .line 97
    invoke-virtual {v5, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 98
    .line 99
    .line 100
    sget-object v5, Ll/ix4$d;->a:[I

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
    iget-object p1, p0, Ll/ix4;->A:Landroid/animation/ValueAnimator;

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
    iget-object p1, p0, Ll/ix4;->A:Landroid/animation/ValueAnimator;

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
    iput-object p1, p0, Ll/ix4;->A:Landroid/animation/ValueAnimator;

    .line 148
    .line 149
    const-wide/16 v0, 0x64

    .line 150
    .line 151
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Ll/ix4;->A:Landroid/animation/ValueAnimator;

    .line 155
    .line 156
    new-instance v0, Ll/ix4$c;

    .line 157
    .line 158
    invoke-direct {v0, p0}, Ll/ix4$c;-><init>(Ll/ix4;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 162
    .line 163
    .line 164
    iget-object p0, p0, Ll/ix4;->A:Landroid/animation/ValueAnimator;

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public final k0(Landroid/view/ViewGroup;)V
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
    invoke-virtual {p0, p1}, Ll/ix4;->k0(Landroid/view/ViewGroup;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
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
    iget-object v2, p0, Ll/ix4;->k:Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatKeyboardRoot;

    .line 11
    .line 12
    new-instance v3, Ll/ix4$b;

    .line 13
    .line 14
    invoke-direct {v3, p0}, Ll/ix4$b;-><init>(Ll/ix4;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/android/app/Act;->setUpKeyboardDetectorLayout(Landroid/view/View;Landroid/view/View;Ll/z20;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public l0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ix4;->s:Lv/VEditText;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ix4;->Z()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iget-object v1, p0, Ll/ix4;->D:Landroid/text/InputFilter;

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v1, p0, Ll/ix4;->C:Landroid/text/InputFilter;

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
    invoke-virtual {p0}, Ll/ix4;->Z()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    sget p0, Ll/ix4;->F:I

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    sget p0, Ll/ix4;->E:I

    .line 33
    .line 34
    :goto_1
    sput p0, Ll/ix4;->G:I

    .line 35
    .line 36
    return-void
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/ix4;->V(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/ix4;->l:Landroid/widget/FrameLayout;

    .line 5
    .line 6
    new-instance v0, Ll/tw4;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/tw4;-><init>(Ll/ix4;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/ix4;->q:Lcom/p1/mobile/putong/live/livingroom/common/chat/input/ChatInputViewGroup;

    .line 15
    .line 16
    new-instance v0, Ll/zw4;

    .line 17
    .line 18
    invoke-direct {v0}, Ll/zw4;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ll/ix4;->u:Lv/VText;

    .line 25
    .line 26
    new-instance v0, Ll/ax4;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/ax4;-><init>(Ll/ix4;)V

    .line 29
    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/ix4;->s:Lv/VEditText;

    .line 35
    .line 36
    new-instance v0, Ll/ix4$a;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/ix4$a;-><init>(Ll/ix4;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/ix4;->t:Landroid/widget/ImageView;

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/ix4;->t:Landroid/widget/ImageView;

    .line 51
    .line 52
    new-instance v0, Ll/bx4;

    .line 53
    .line 54
    invoke-direct {v0, p0}, Ll/bx4;-><init>(Ll/ix4;)V

    .line 55
    .line 56
    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mw4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ix4;->W(Ll/mw4;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
