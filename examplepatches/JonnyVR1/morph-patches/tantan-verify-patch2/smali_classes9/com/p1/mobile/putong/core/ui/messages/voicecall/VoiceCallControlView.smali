.class public Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;
    }
.end annotation


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/tantan/library/svga/SVGAnimationView;

.field public d:Landroid/widget/TextView;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;

.field public g:Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;

.field public h:Lv/VImage;

.field public i:[Landroid/view/View;

.field public j:[F

.field public k:[I

.field public l:Landroid/view/animation/Interpolator;

.field public final m:F

.field public n:Landroid/animation/ValueAnimator;

.field public o:Landroid/view/animation/PathInterpolator;

.field public p:Landroid/view/View;

.field public q:I

.field public r:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

.field public s:I

.field public t:Ll/kcg0;

.field public u:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/xjg;

    .line 5
    .line 6
    invoke-direct {p1}, Ll/xjg;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->l:Landroid/view/animation/Interpolator;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->m:F

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->q:I

    .line 16
    .line 17
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->u:Z

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 20
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 21
    new-instance p1, Ll/xjg;

    invoke-direct {p1}, Ll/xjg;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->l:Landroid/view/animation/Interpolator;

    const/4 p1, 0x0

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->m:F

    const/4 p1, 0x1

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->q:I

    .line 24
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->u:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 25
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 26
    new-instance p1, Ll/xjg;

    invoke-direct {p1}, Ll/xjg;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->l:Landroid/view/animation/Interpolator;

    const/4 p1, 0x0

    .line 27
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->m:F

    const/4 p1, 0x1

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->q:I

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->u:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Long;)Ljava/lang/Boolean;
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Lv/VImage;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->u(Lv/VImage;Z)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->r(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Lv/VImage;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->v(Lv/VImage;Z)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->t(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method private getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_chat_view"

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->w(Landroid/view/View;FF)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;)Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->r:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

    return-object p0
.end method

.method private setPercent(F)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    const/4 v1, 0x4

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->i:[Landroid/view/View;

    .line 6
    .line 7
    aget-object v1, v1, v0

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->m(IF)I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    int-to-float v2, v2

    .line 14
    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->l(IF)F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    invoke-virtual {v1, v2}, Landroid/view/View;->setAlpha(F)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v0, 0x0

    .line 28
    sub-float v1, p1, v0

    .line 29
    .line 30
    const/high16 v2, 0x44160000    # 600.0f

    .line 31
    .line 32
    cmpl-float v3, v1, v2

    .line 33
    .line 34
    if-lez v3, :cond_1

    .line 35
    .line 36
    move v1, v2

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    cmpg-float v3, v1, v0

    .line 39
    .line 40
    if-gez v3, :cond_2

    .line 41
    .line 42
    move v1, v0

    .line 43
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->o:Landroid/view/animation/PathInterpolator;

    .line 44
    .line 45
    div-float/2addr v1, v2

    .line 46
    invoke-virtual {v3, v1}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    cmpg-float v2, v1, v0

    .line 51
    .line 52
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->p:Landroid/view/View;

    .line 53
    .line 54
    if-gez v2, :cond_3

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Landroid/view/View;->setAlpha(F)V

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_3
    invoke-virtual {v3, v1}, Landroid/view/View;->setAlpha(F)V

    .line 61
    .line 62
    .line 63
    const v0, 0x3e4ccccc    # 0.19999999f

    .line 64
    .line 65
    .line 66
    mul-float/2addr v0, v1

    .line 67
    const v2, 0x3f4ccccd    # 0.8f

    .line 68
    .line 69
    .line 70
    add-float/2addr v0, v2

    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->p:Landroid/view/View;

    .line 72
    .line 73
    invoke-virtual {v2, v0}, Landroid/view/View;->setScaleY(F)V

    .line 74
    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->p:Landroid/view/View;

    .line 77
    .line 78
    invoke-virtual {v2, v0}, Landroid/view/View;->setScaleX(F)V

    .line 79
    .line 80
    .line 81
    :goto_2
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->u:Z

    .line 82
    .line 83
    const/high16 v2, 0x3f800000    # 1.0f

    .line 84
    .line 85
    if-nez v0, :cond_5

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->q()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->r:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

    .line 94
    .line 95
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    if-eqz v0, :cond_6

    .line 100
    .line 101
    const/high16 v0, 0x44250000    # 660.0f

    .line 102
    .line 103
    sub-float/2addr v0, p1

    .line 104
    const/high16 p1, 0x43c30000    # 390.0f

    .line 105
    .line 106
    cmpl-float v1, v0, p1

    .line 107
    .line 108
    if-ltz v1, :cond_4

    .line 109
    .line 110
    move v0, p1

    .line 111
    :cond_4
    div-float/2addr v0, p1

    .line 112
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->l:Landroid/view/animation/Interpolator;

    .line 113
    .line 114
    invoke-interface {p1, v0}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    sub-float/2addr v2, p1

    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->r:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

    .line 120
    .line 121
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->s:I

    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->u:Z

    .line 128
    .line 129
    invoke-interface {p1, v2, v0, v1, p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;->b(FIIZ)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->r:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

    .line 134
    .line 135
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_6

    .line 140
    .line 141
    cmpg-float p1, v1, v2

    .line 142
    .line 143
    if-gtz p1, :cond_6

    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->r:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

    .line 146
    .line 147
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->s:I

    .line 148
    .line 149
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->u:Z

    .line 154
    .line 155
    invoke-interface {p1, v1, v0, v2, p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;->b(FIIZ)V

    .line 156
    .line 157
    .line 158
    :cond_6
    return-void
.end method

.method private setViewStateForAnim(Z)V
    .locals 3

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    :goto_0
    const/4 v0, 0x4

    .line 5
    const/4 v1, 0x0

    .line 6
    if-ge p1, v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->i:[Landroid/view/View;

    .line 9
    .line 10
    aget-object v0, v0, p1

    .line 11
    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->k:[I

    .line 13
    .line 14
    aget v2, v2, p1

    .line 15
    .line 16
    int-to-float v2, v2

    .line 17
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 p1, p1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {p1, v1}, Landroid/view/View;->setAlpha(F)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->b:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Landroid/view/View;->setAlpha(F)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method private setVoiceCallTime(J)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->d:Landroid/widget/TextView;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->O6:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p1, p2}, Ll/w1n0;->b(J)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public final A(FFZ)V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    aput p1, v0, v1

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    aput p2, v0, p1

    .line 9
    .line 10
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->n:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    new-instance p2, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;

    .line 17
    .line 18
    invoke-direct {p2, p0, p3}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$a;-><init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, p2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->n:Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    const-wide/16 p2, 0x294

    .line 27
    .line 28
    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->n:Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->n:Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final j(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/zym0;->a(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final k()V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getAlpha()F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v9, 0x2

    .line 10
    new-array v8, v9, [F

    .line 11
    .line 12
    const/4 v10, 0x0

    .line 13
    aput v2, v8, v10

    .line 14
    .line 15
    const/4 v11, 0x1

    .line 16
    const/4 v2, 0x0

    .line 17
    aput v2, v8, v11

    .line 18
    .line 19
    const-string v2, "alpha"

    .line 20
    .line 21
    const-wide/16 v3, 0x0

    .line 22
    .line 23
    const-wide/16 v5, 0x258

    .line 24
    .line 25
    const/4 v7, 0x0

    .line 26
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v12, v0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->b:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    invoke-virtual {v12}, Landroid/view/View;->getAlpha()F

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    new-array v3, v9, [F

    .line 37
    .line 38
    aput v2, v3, v10

    .line 39
    .line 40
    const/high16 v2, 0x3f800000    # 1.0f

    .line 41
    .line 42
    aput v2, v3, v11

    .line 43
    .line 44
    const-string v13, "alpha"

    .line 45
    .line 46
    const-wide/16 v14, 0x0

    .line 47
    .line 48
    const-wide/16 v16, 0x258

    .line 49
    .line 50
    const/16 v18, 0x0

    .line 51
    .line 52
    move-object/from16 v19, v3

    .line 53
    .line 54
    invoke-static/range {v12 .. v19}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    filled-new-array {v1, v3}, [Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    .line 67
    .line 68
    .line 69
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->b:Landroid/widget/FrameLayout;

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleX(F)V

    .line 72
    .line 73
    .line 74
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->b:Landroid/widget/FrameLayout;

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Landroid/view/View;->setScaleY(F)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    instance-of v1, v1, Lcom/p1/mobile/android/app/Act;

    .line 84
    .line 85
    if-eqz v1, :cond_0

    .line 86
    .line 87
    const-wide/16 v1, 0x0

    .line 88
    .line 89
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->setVoiceCallTime(J)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 97
    .line 98
    invoke-static {}, Ll/uqx;->C()Ll/uqx;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iget-object v2, v2, Ll/uqx;->l:Lrx/subjects/a;

    .line 103
    .line 104
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    new-instance v2, Ll/xym0;

    .line 109
    .line 110
    invoke-direct {v2}, Ll/xym0;-><init>()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v1, v2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    new-instance v2, Ll/yym0;

    .line 118
    .line 119
    invoke-direct {v2, v0}, Ll/yym0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;)V

    .line 120
    .line 121
    .line 122
    invoke-static {v2}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->t:Ll/kcg0;

    .line 131
    .line 132
    :cond_0
    return-void
.end method

.method public final l(IF)F
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p2, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p2, v0

    .line 7
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->j:[F

    .line 8
    .line 9
    aget p1, v1, p1

    .line 10
    .line 11
    sub-float/2addr p2, p1

    .line 12
    const/high16 p1, 0x44160000    # 600.0f

    .line 13
    .line 14
    cmpl-float v1, p2, p1

    .line 15
    .line 16
    if-lez v1, :cond_1

    .line 17
    .line 18
    move v0, p1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    cmpg-float v1, p2, v0

    .line 21
    .line 22
    if-gez v1, :cond_2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    move v0, p2

    .line 26
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->o:Landroid/view/animation/PathInterpolator;

    .line 27
    .line 28
    div-float/2addr v0, p1

    .line 29
    invoke-virtual {p0, v0}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public final m(IF)I
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v1, p2, v0

    .line 3
    .line 4
    if-gez v1, :cond_0

    .line 5
    .line 6
    move p2, v0

    .line 7
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->j:[F

    .line 8
    .line 9
    aget v1, v1, p1

    .line 10
    .line 11
    sub-float/2addr p2, v1

    .line 12
    const/high16 v1, 0x44160000    # 600.0f

    .line 13
    .line 14
    cmpl-float v2, p2, v1

    .line 15
    .line 16
    if-lez v2, :cond_1

    .line 17
    .line 18
    move v0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    cmpg-float v2, p2, v0

    .line 21
    .line 22
    if-gez v2, :cond_2

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_2
    move v0, p2

    .line 26
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->o:Landroid/view/animation/PathInterpolator;

    .line 27
    .line 28
    div-float/2addr v0, v1

    .line 29
    invoke-virtual {p2, v0}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->k:[I

    .line 34
    .line 35
    aget p0, p0, p1

    .line 36
    .line 37
    const/high16 p1, 0x3f800000    # 1.0f

    .line 38
    .line 39
    sub-float/2addr p1, p2

    .line 40
    int-to-float p0, p0

    .line 41
    mul-float/2addr p1, p0

    .line 42
    float-to-int p0, p1

    .line 43
    return p0
.end method

.method public final n()V
    .locals 0

    .line 1
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xzm0;->n()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final o()V
    .locals 7

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->j(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->p:Landroid/view/View;

    .line 7
    .line 8
    new-instance v0, Ll/rym0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/rym0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->e:Lv/VImage;

    .line 17
    .line 18
    new-instance v1, Ll/sym0;

    .line 19
    .line 20
    invoke-direct {v1, p0}, Ll/sym0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;)V

    .line 21
    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->h:Lv/VImage;

    .line 27
    .line 28
    new-instance v1, Ll/tym0;

    .line 29
    .line 30
    invoke-direct {v1, p0}, Ll/tym0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->f:Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;

    .line 37
    .line 38
    new-instance v1, Ll/uym0;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ll/uym0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;->setCheckChangeListener(Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage$a;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->g:Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;

    .line 47
    .line 48
    new-instance v1, Ll/vym0;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/vym0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;->setCheckChangeListener(Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage$a;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->e:Lv/VImage;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->f:Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;

    .line 59
    .line 60
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->g:Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;

    .line 61
    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->h:Lv/VImage;

    .line 63
    .line 64
    const/4 v4, 0x4

    .line 65
    new-array v5, v4, [Landroid/view/View;

    .line 66
    .line 67
    const/4 v6, 0x0

    .line 68
    aput-object v0, v5, v6

    .line 69
    .line 70
    const/4 v0, 0x1

    .line 71
    aput-object v1, v5, v0

    .line 72
    .line 73
    const/4 v0, 0x2

    .line 74
    aput-object v2, v5, v0

    .line 75
    .line 76
    const/4 v0, 0x3

    .line 77
    aput-object v3, v5, v0

    .line 78
    .line 79
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->i:[Landroid/view/View;

    .line 80
    .line 81
    new-array v0, v4, [F

    .line 82
    .line 83
    fill-array-data v0, :array_0

    .line 84
    .line 85
    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->j:[F

    .line 87
    .line 88
    const/high16 v0, 0x42880000    # 68.0f

    .line 89
    .line 90
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    filled-new-array {v1, v2, v3, v0}, [I

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->k:[I

    .line 111
    .line 112
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 113
    .line 114
    const v1, 0x3f19999a    # 0.6f

    .line 115
    .line 116
    .line 117
    const/high16 v2, 0x3f800000    # 1.0f

    .line 118
    .line 119
    const v3, 0x3e99999a    # 0.3f

    .line 120
    .line 121
    .line 122
    const/4 v4, 0x0

    .line 123
    invoke-direct {v0, v3, v1, v4, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 124
    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->o:Landroid/view/animation/PathInterpolator;

    .line 127
    .line 128
    return-void

    .line 129
    :array_0
    .array-data 4
        0x0
        0x41a00000    # 20.0f
        0x42200000    # 40.0f
        0x42700000    # 60.0f
    .end array-data
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->setPercent(F)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->t:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->o()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    if-ne p1, p0, :cond_0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final q()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->d0()Ll/vez;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/vez;->E0()Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public final synthetic r(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->setVoiceCallTime(J)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->getPageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ll/sfj0$a;

    .line 7
    .line 8
    const-string v1, "e_voice_talking_hangup"

    .line 9
    .line 10
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/xzm0;->k()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "Hangup"

    .line 26
    .line 27
    invoke-virtual {p1, v1, v0}, Ll/qzm0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->n()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->q:I

    .line 5
    .line 6
    const/16 v0, 0x8

    .line 7
    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public setVoiceCallAnimListener(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->r:Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView$b;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic t(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->getPageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x0

    .line 6
    new-array v0, v0, [Ll/sfj0$a;

    .line 7
    .line 8
    const-string v1, "e_voice_small"

    .line 9
    .line 10
    invoke-static {v1, p1, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/xzm0;->k()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "ZoomClick"

    .line 26
    .line 27
    invoke-virtual {p1, v1, v0}, Ll/qzm0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p1, p0}, Ll/xzm0;->y(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final synthetic u(Lv/VImage;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->getPageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p1, "on"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "off"

    .line 11
    .line 12
    :goto_0
    const-string v0, "mute_handsfree"

    .line 13
    .line 14
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "e_voice_talking_mute"

    .line 23
    .line 24
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "status:"

    .line 34
    .line 35
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, ",Detail:"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/xzm0;->k()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "MutExchange"

    .line 62
    .line 63
    invoke-virtual {p0, v0, p1}, Ll/qzm0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p2}, Ll/w1n0;->h(Z)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public final synthetic v(Lv/VImage;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->getPageId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p1, "on"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p1, "off"

    .line 11
    .line 12
    :goto_0
    const-string v0, "mute_handsfree"

    .line 13
    .line 14
    invoke-static {v0, p1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    filled-new-array {p1}, [Ll/sfj0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "e_voice_talking_open"

    .line 23
    .line 24
    invoke-static {v0, p0, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v0, "status:"

    .line 34
    .line 35
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string v0, ",Detail:"

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Ll/xzm0;->k()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    const-string v0, "TalkingOpen"

    .line 62
    .line 63
    invoke-virtual {p0, v0, p1}, Ll/qzm0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p2}, Ll/w1n0;->g(Z)V

    .line 67
    .line 68
    .line 69
    if-eqz p2, :cond_1

    .line 70
    .line 71
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->g7:I

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_1
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->f7:I

    .line 75
    .line 76
    :goto_1
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic w(Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->s:I

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p2, p3, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->A(FFZ)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public x(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->f:Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;

    .line 2
    .line 3
    invoke-static {}, Ll/w1n0;->f()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;->setCheckWithoutCallback(Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->g:Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;

    .line 11
    .line 12
    invoke-static {}, Ll/w1n0;->c()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/view/VoiceCallCheckeableImage;->setCheckWithoutCallback(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->t:Ll/kcg0;

    .line 20
    .line 21
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    if-ne p1, v0, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 28
    .line 29
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->I6:I

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 40
    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->p:Landroid/view/View;

    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const/4 v1, 0x2

    .line 45
    if-ne p1, v1, :cond_1

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 48
    .line 49
    sget v1, Lcom/p1/mobile/putong/core/message/R$string;->e7:I

    .line 50
    .line 51
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 55
    .line 56
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->a:Landroid/widget/TextView;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->p:Landroid/view/View;

    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    const/4 v1, 0x3

    .line 65
    if-ne p1, v1, :cond_2

    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->b:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->b:Landroid/widget/FrameLayout;

    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->p:Landroid/view/View;

    .line 75
    .line 76
    const/4 v0, 0x0

    .line 77
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->k()V

    .line 81
    .line 82
    .line 83
    :cond_2
    return-void
.end method

.method public y(II)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->setViewStateForAnim(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->x(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->z(Z)V

    .line 14
    .line 15
    .line 16
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->getPageId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->p(I)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    xor-int/2addr p0, v0

    .line 25
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "if_accepted"

    .line 30
    .line 31
    invoke-static {p1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p0}, [Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string p1, "e_voice_call_panel"

    .line 40
    .line 41
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    const/4 p1, 0x0

    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->z(Z)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final z(Z)V
    .locals 6

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "https://auto.tancdn.com/v1/raw/067d4299-324f-4cc5-8322-db0c9f14d0b111.so"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->c:Lcom/tantan/library/svga/SVGAnimationView;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    const/high16 v0, 0x44250000    # 660.0f

    .line 40
    .line 41
    const/4 v1, 0x0

    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    move v2, v1

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    move v2, v0

    .line 47
    :goto_0
    if-eqz p1, :cond_3

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    move v0, v1

    .line 51
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->n:Landroid/animation/ValueAnimator;

    .line 52
    .line 53
    if-eqz v1, :cond_4

    .line 54
    .line 55
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    if-eqz v1, :cond_4

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->n:Landroid/animation/ValueAnimator;

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    check-cast v1, Ljava/lang/Float;

    .line 68
    .line 69
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->n:Landroid/animation/ValueAnimator;

    .line 74
    .line 75
    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->cancel()V

    .line 76
    .line 77
    .line 78
    :cond_4
    if-eqz p1, :cond_6

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 85
    .line 86
    if-eqz v1, :cond_8

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 93
    .line 94
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Ll/j3z;->g0()Ll/iam;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    check-cast v1, Ll/d3z;

    .line 103
    .line 104
    invoke-virtual {v1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getMessageBarRoot()Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->s:I

    .line 117
    .line 118
    if-lez v3, :cond_5

    .line 119
    .line 120
    const/4 v1, 0x1

    .line 121
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->A(FFZ)V

    .line 122
    .line 123
    .line 124
    goto :goto_2

    .line 125
    :cond_5
    new-instance v3, Ll/wym0;

    .line 126
    .line 127
    invoke-direct {v3, p0, v1, v2, v0}, Ll/wym0;-><init>(Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;Landroid/view/View;FF)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 131
    .line 132
    .line 133
    goto :goto_2

    .line 134
    :cond_6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    instance-of v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 139
    .line 140
    if-eqz v1, :cond_7

    .line 141
    .line 142
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 147
    .line 148
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-virtual {v1}, Ll/j3z;->g0()Ll/iam;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    check-cast v1, Ll/d3z;

    .line 157
    .line 158
    invoke-virtual {v1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getMessageBarRoot()Landroid/view/View;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 167
    .line 168
    .line 169
    move-result v3

    .line 170
    const/high16 v4, 0x40000000    # 2.0f

    .line 171
    .line 172
    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    const/high16 v4, 0x447a0000    # 1000.0f

    .line 177
    .line 178
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 179
    .line 180
    .line 181
    move-result v4

    .line 182
    const/high16 v5, -0x80000000

    .line 183
    .line 184
    invoke-static {v4, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 185
    .line 186
    .line 187
    move-result v4

    .line 188
    invoke-virtual {v1, v3, v4}, Landroid/view/View;->measure(II)V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->s:I

    .line 196
    .line 197
    :cond_7
    const/4 v1, 0x0

    .line 198
    invoke-virtual {p0, v2, v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->A(FFZ)V

    .line 199
    .line 200
    .line 201
    :cond_8
    :goto_2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/messages/voicecall/VoiceCallControlView;->u:Z

    .line 202
    .line 203
    return-void
.end method
