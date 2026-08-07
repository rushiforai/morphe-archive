.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/mhu;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

.field public b:Lv/VImage;

.field public c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public d:Lv/VDraweeView;

.field public e:Lv/VImage;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VLinear;

.field public i:Lv/VText;

.field public j:Landroid/widget/TextView;

.field public k:Lv/VFrame;

.field public l:Lv/VImage;

.field public m:Lv/VRelative;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Ll/mhu;

.field public q:Landroid/animation/ObjectAnimator;

.field public r:Landroid/animation/ValueAnimator;

.field public s:Ljava/lang/String;

.field public t:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-string p1, ".."

    .line 5
    .line 6
    const-string v0, "..."

    .line 7
    .line 8
    const-string v1, "."

    .line 9
    .line 10
    filled-new-array {v1, p1, v0}, [Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->t:[Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 17
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 18
    const-string p1, ".."

    const-string p2, "..."

    const-string v0, "."

    filled-new-array {v0, p1, p2}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->t:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 19
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 20
    const-string p1, ".."

    const-string p2, "..."

    const-string p3, "."

    filled-new-array {p3, p1, p2}, [Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->t:[Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->i(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->f(Landroid/view/View;)V

    return-void
.end method

.method private synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->p:Ll/mhu;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->q:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    invoke-static {p1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->p:Ll/mhu;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/mhu;->U2()V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method private k(Ljava/lang/String;ZLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->h:Lv/VLinear;

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->j:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->i:Lv/VText;

    .line 20
    .line 21
    if-eqz p2, :cond_1

    .line 22
    .line 23
    const-string p2, "#dddddd"

    .line 24
    .line 25
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->i:Lv/VText;

    .line 33
    .line 34
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaintFlags()I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    or-int/lit8 v0, v0, 0x10

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 41
    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_1
    const/4 p2, -0x1

    .line 45
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->i:Lv/VText;

    .line 49
    .line 50
    invoke-virtual {p2}, Landroid/widget/TextView;->getPaintFlags()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    and-int/lit8 v0, v0, -0x11

    .line 55
    .line 56
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setPaintFlags(I)V

    .line 57
    .line 58
    .line 59
    :goto_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    if-nez p2, :cond_2

    .line 64
    .line 65
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->j:Landroid/widget/TextView;

    .line 66
    .line 67
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->i:Lv/VText;

    .line 71
    .line 72
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->h:Lv/VLinear;

    .line 76
    .line 77
    const/4 p2, 0x1

    .line 78
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->j:Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/phu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d(Ll/mhu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->p:Ll/mhu;

    .line 2
    .line 3
    return-void
.end method

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->q:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->r:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-static {p0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->p:Ll/mhu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/mhu;->V2()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->r:Landroid/animation/ValueAnimator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->q:Landroid/animation/ObjectAnimator;

    .line 12
    .line 13
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 21
    .line 22
    const/4 v1, 0x1

    .line 23
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_0

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public final synthetic i(Landroid/animation/ValueAnimator;)V
    .locals 3

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->o:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->t:[Ljava/lang/String;

    .line 19
    .line 20
    array-length v2, p0

    .line 21
    rem-int/2addr p1, v2

    .line 22
    aget-object p0, p0, p1

    .line 23
    .line 24
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string p0, ""

    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/mhu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->d(Ll/mhu;)V

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

.method public j()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->s:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->s:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->setAvatarUrl(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->g:Lv/VText;

    .line 2
    .line 3
    const-string v1, "\u63a5\u901a\u4e2d\uff0c\u8bf7\u7a0d\u5019"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e:Lv/VImage;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->m:Lv/VRelative;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->o:Lv/VText;

    .line 20
    .line 21
    const-string v1, "."

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->r:Landroid/animation/ValueAnimator;

    .line 27
    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    const/4 v1, 0x3

    .line 32
    filled-new-array {v0, v1}, [I

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->r:Landroid/animation/ValueAnimator;

    .line 41
    .line 42
    const-wide/16 v1, 0x258

    .line 43
    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->r:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    const/4 v1, -0x1

    .line 50
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->r:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    new-instance v1, Ll/ohu;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/ohu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->r:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public m()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->m:Lv/VRelative;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e:Lv/VImage;

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->q:Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    invoke-static {v1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->k:Lv/VFrame;

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->g:Lv/VText;

    .line 27
    .line 28
    const-string v0, "\u547c\u53eb\u4e2d\uff0c\u7b49\u5f85\u5bf9\u65b9\u63a5\u901a"

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->m:Lv/VRelative;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e:Lv/VImage;

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->q:Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    invoke-static {v1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->k:Lv/VFrame;

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAnchorCall;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->avatar:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->setAvatarUrl(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    const-string p1, ""

    .line 34
    .line 35
    invoke-direct {p0, p1, v2, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->k(Ljava/lang/String;ZLjava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->g:Lv/VText;

    .line 39
    .line 40
    const-string p1, "\u547c\u53eb\u4e2d\uff0c\u7b49\u5f85\u5bf9\u65b9\u63a5\u901a"

    .line 41
    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->l:Lv/VImage;

    .line 8
    .line 9
    new-instance v1, Ll/nhu;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/nhu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->m:Lv/VRelative;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e:Lv/VImage;

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->q:Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    invoke-static {v1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->k:Lv/VFrame;

    .line 22
    .line 23
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->avatar:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->setAvatarUrl(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->price:Ljava/lang/String;

    .line 36
    .line 37
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->hasDiscountPrice:Z

    .line 38
    .line 39
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->callDesc:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->k(Ljava/lang/String;ZLjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->g:Lv/VText;

    .line 45
    .line 46
    const-string p1, "\u547c\u53eb\u4e2d\uff0c\u7b49\u5f85\u5bf9\u65b9\u63a5\u901a"

    .line 47
    .line 48
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatRandomMatch;)V
    .locals 4

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->m:Lv/VRelative;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->e:Lv/VImage;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->q:Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->k:Lv/VFrame;

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->d:Lv/VDraweeView;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 32
    .line 33
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->c:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 37
    .line 38
    const-string v2, "https://fe-static.tancdn.com/v1/raw/34f96929-433e-44b2-a864-edea60926b0a14.svga"

    .line 39
    .line 40
    const/4 v3, -0x1

    .line 41
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 42
    .line 43
    .line 44
    const-string v0, ""

    .line 45
    .line 46
    invoke-direct {p0, v0, v1, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->k(Ljava/lang/String;ZLjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->g:Lv/VText;

    .line 50
    .line 51
    const-string v1, "\u547c\u53eb\u4e2d\uff0c\u7b49\u5f85\u5bf9\u65b9\u63a5\u901a"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->j:Landroid/widget/TextView;

    .line 57
    .line 58
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->j:Landroid/widget/TextView;

    .line 62
    .line 63
    const-string p1, "\u968f\u673a\u5339\u914d\u65f6\u957f\u8017\u5c3d\u540e\u7ee7\u7eed\u901a\u8bdd\u5219\u6309\u7167\u539f\u4ef7\u8fdb\u884c\u6263\u51cf\u901a\u8bdd\u8d39\u7528"

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public setAvatarUrl(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->s:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "video_chat"

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->d:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;->g:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
