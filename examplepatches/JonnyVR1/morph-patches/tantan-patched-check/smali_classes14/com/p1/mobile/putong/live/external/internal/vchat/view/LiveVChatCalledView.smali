.class public Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/dhu;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

.field public b:Lv/VImage;

.field public c:Lv/VDraweeView;

.field public d:Lv/VImage;

.field public e:Lv/VLinear;

.field public f:Lv/VText;

.field public g:Lv/VLinear;

.field public h:Lv/VText;

.field public i:Landroid/widget/TextView;

.field public j:Lv/VFrame;

.field public k:Lv/VImage;

.field public l:Lv/VFrame;

.field public m:Lv/VImage;

.field public n:Lv/VImage;

.field public o:Lv/VRelative;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Ll/dhu;

.field public s:Landroid/animation/ObjectAnimator;

.field public t:Landroid/animation/ValueAnimator;

.field public u:Landroid/animation/Animator;

.field public v:Z

.field public w:Ljava/lang/String;

.field public x:[Ljava/lang/String;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->x:[Ljava/lang/String;

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

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->x:[Ljava/lang/String;

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

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->x:[Ljava/lang/String;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->n(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->p(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->k()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->l(Landroid/view/View;)V

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

.method public destroy()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->u:Landroid/animation/Animator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-static {p0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final f(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/jhu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Ll/dhu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->r:Ll/dhu;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/dhu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->i(Ll/dhu;)V

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

.method public j(Z)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->r:Ll/dhu;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dhu;->W2()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 7
    .line 8
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->q:Lv/VText;

    .line 17
    .line 18
    const-string v1, "."

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->d:Lv/VImage;

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->o:Lv/VRelative;

    .line 30
    .line 31
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iput-boolean v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->v:Z

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->u:Landroid/animation/Animator;

    .line 39
    .line 40
    invoke-static {p1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 41
    .line 42
    .line 43
    new-instance v8, Ll/xjg;

    .line 44
    .line 45
    invoke-direct {v8}, Ll/xjg;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    neg-int p1, p1

    .line 53
    int-to-float p1, p1

    .line 54
    const/4 v0, 0x2

    .line 55
    new-array v9, v0, [F

    .line 56
    .line 57
    const/4 v0, 0x0

    .line 58
    aput v0, v9, v1

    .line 59
    .line 60
    const/4 v0, 0x1

    .line 61
    aput p1, v9, v0

    .line 62
    .line 63
    const-string v3, "translationY"

    .line 64
    .line 65
    const-wide/16 v4, 0x0

    .line 66
    .line 67
    const-wide/16 v6, 0x1f4

    .line 68
    .line 69
    move-object v2, p0

    .line 70
    invoke-static/range {v2 .. v9}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iput-object p0, v2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->u:Landroid/animation/Animator;

    .line 75
    .line 76
    new-instance p1, Ll/ghu;

    .line 77
    .line 78
    invoke-direct {p1, v2}, Ll/ghu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V

    .line 79
    .line 80
    .line 81
    invoke-static {p0, p1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 82
    .line 83
    .line 84
    iget-object p0, v2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->u:Landroid/animation/Animator;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 87
    .line 88
    .line 89
    return-void

    .line 90
    :cond_0
    move-object v2, p0

    .line 91
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 92
    .line 93
    .line 94
    return-void
.end method

.method public final synthetic k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->r:Ll/dhu;

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
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->v:Z

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->v:Z

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->r:Ll/dhu;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/dhu;->T2()V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->r:Ll/dhu;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 10
    .line 11
    invoke-static {p1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    invoke-static {p1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->r:Ll/dhu;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/dhu;->V2()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final synthetic n(Landroid/animation/ValueAnimator;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->q:Lv/VText;

    .line 12
    .line 13
    new-instance v1, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->x:[Ljava/lang/String;

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

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->f(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->m:Lv/VImage;

    .line 8
    .line 9
    new-instance v1, Ll/ehu;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/ehu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->k:Lv/VImage;

    .line 18
    .line 19
    new-instance v1, Ll/fhu;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/fhu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic p(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    neg-int v0, v0

    .line 6
    int-to-float v0, v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->l:Lv/VFrame;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->j:Lv/VFrame;

    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->l:Lv/VFrame;

    .line 22
    .line 23
    sget v1, Ll/qa00;->K:I

    .line 24
    .line 25
    neg-int v2, v1

    .line 26
    int-to-float v2, v2

    .line 27
    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationX(F)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->j:Lv/VFrame;

    .line 31
    .line 32
    int-to-float v1, v1

    .line 33
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationX(F)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->getAttendee()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->avatar:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->setAvatarUrl(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;->getAttendee()Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userName:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    invoke-static {p1, v0}, Ll/xau;->p(Ljava/lang/String;I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->f:Lv/VText;

    .line 57
    .line 58
    const-string v1, "%s\n\u5411\u4f60\u53d1\u8d77\u89c6\u9891\u95ea\u804a"

    .line 59
    .line 60
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    .line 70
    .line 71
    const-string p1, ""

    .line 72
    .line 73
    const/4 v0, 0x0

    .line 74
    invoke-virtual {p0, p1, v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s(Ljava/lang/String;ZLjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->n:Lv/VImage;

    .line 78
    .line 79
    sget p1, Ll/nbc0;->b1:I

    .line 80
    .line 81
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->w:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->w:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->setAvatarUrl(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final s(Ljava/lang/String;ZLjava/lang/String;)V
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
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->g:Lv/VLinear;

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->i:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->h:Lv/VText;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->h:Lv/VText;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->h:Lv/VText;

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
    iget-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->h:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-nez p1, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->i:Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {p1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->g:Lv/VLinear;

    .line 76
    .line 77
    const/4 p2, 0x1

    .line 78
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->i:Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public setAvatarUrl(Ljava/lang/String;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->w:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "video_chat"

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->c:Lv/VDraweeView;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public u(Z)V
    .locals 11

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->n:Lv/VImage;

    .line 6
    .line 7
    sget v2, Ll/nbc0;->c1:I

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 13
    .line 14
    invoke-static {v1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 18
    .line 19
    const/4 v2, -0x1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->n:Lv/VImage;

    .line 23
    .line 24
    new-instance v9, Landroid/view/animation/LinearInterpolator;

    .line 25
    .line 26
    invoke-direct {v9}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 27
    .line 28
    .line 29
    const/4 v1, 0x2

    .line 30
    new-array v10, v1, [F

    .line 31
    .line 32
    fill-array-data v10, :array_0

    .line 33
    .line 34
    .line 35
    const-string v4, "rotation"

    .line 36
    .line 37
    const-wide/16 v5, 0x0

    .line 38
    .line 39
    const-wide/16 v7, 0x258

    .line 40
    .line 41
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Landroid/animation/ObjectAnimator;

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->f:Lv/VText;

    .line 53
    .line 54
    const-string v3, "\u63a5\u901a\u4e2d\uff0c\u8bf7\u7a0d\u540e"

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/animation/ObjectAnimator;->start()V

    .line 62
    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->o:Lv/VRelative;

    .line 67
    .line 68
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->d:Lv/VImage;

    .line 72
    .line 73
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->q:Lv/VText;

    .line 77
    .line 78
    const-string v0, "."

    .line 79
    .line 80
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 84
    .line 85
    invoke-static {p1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 89
    .line 90
    if-nez p1, :cond_1

    .line 91
    .line 92
    const/4 p1, 0x0

    .line 93
    const/4 v0, 0x3

    .line 94
    filled-new-array {p1, v0}, [I

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 103
    .line 104
    const-wide/16 v0, 0x258

    .line 105
    .line 106
    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 110
    .line 111
    invoke-virtual {p1, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 115
    .line 116
    new-instance v0, Ll/ihu;

    .line 117
    .line 118
    invoke-direct {v0, p0}, Ll/ihu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 122
    .line 123
    .line 124
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 125
    .line 126
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 127
    .line 128
    .line 129
    :cond_2
    return-void

    .line 130
    nop

    .line 131
    :array_0
    .array-data 4
        0x0
        -0x3c4c0000    # -360.0f
    .end array-data
.end method

.method public v(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v8, 0x0

    .line 4
    iput-boolean v8, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->v:Z

    .line 5
    .line 6
    const/4 v9, 0x1

    .line 7
    invoke-static {v0, v9}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->o:Lv/VRelative;

    .line 11
    .line 12
    invoke-static {v1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->d:Lv/VImage;

    .line 16
    .line 17
    invoke-static {v1, v8}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    invoke-static {v1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 26
    .line 27
    invoke-static {v1}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 28
    .line 29
    .line 30
    new-instance v16, Ll/xjg;

    .line 31
    .line 32
    invoke-direct/range {v16 .. v16}, Ll/xjg;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    neg-int v1, v1

    .line 40
    int-to-float v1, v1

    .line 41
    const/4 v10, 0x2

    .line 42
    new-array v7, v10, [F

    .line 43
    .line 44
    aput v1, v7, v8

    .line 45
    .line 46
    const/16 v18, 0x0

    .line 47
    .line 48
    aput v18, v7, v9

    .line 49
    .line 50
    const-string v1, "translationY"

    .line 51
    .line 52
    const-wide/16 v2, 0x0

    .line 53
    .line 54
    const-wide/16 v4, 0x1f4

    .line 55
    .line 56
    move-object/from16 v6, v16

    .line 57
    .line 58
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iget-object v2, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->l:Lv/VFrame;

    .line 63
    .line 64
    sget v3, Ll/qa00;->K:I

    .line 65
    .line 66
    neg-int v4, v3

    .line 67
    int-to-float v4, v4

    .line 68
    new-array v5, v10, [F

    .line 69
    .line 70
    aput v4, v5, v8

    .line 71
    .line 72
    aput v18, v5, v9

    .line 73
    .line 74
    const-string v11, "translationX"

    .line 75
    .line 76
    const-wide/16 v12, 0xc8

    .line 77
    .line 78
    const-wide/16 v14, 0x12c

    .line 79
    .line 80
    move/from16 v17, v10

    .line 81
    .line 82
    move-object v10, v2

    .line 83
    move/from16 v2, v17

    .line 84
    .line 85
    move-object/from16 v17, v5

    .line 86
    .line 87
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 88
    .line 89
    .line 90
    move-result-object v4

    .line 91
    iget-object v10, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->j:Lv/VFrame;

    .line 92
    .line 93
    int-to-float v3, v3

    .line 94
    new-array v2, v2, [F

    .line 95
    .line 96
    aput v3, v2, v8

    .line 97
    .line 98
    aput v18, v2, v9

    .line 99
    .line 100
    const-string v11, "translationX"

    .line 101
    .line 102
    move-object/from16 v17, v2

    .line 103
    .line 104
    invoke-static/range {v10 .. v17}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    filled-new-array {v1, v4, v2}, [Landroid/animation/Animator;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-static {v1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->u:Landroid/animation/Animator;

    .line 117
    .line 118
    new-instance v2, Ll/hhu;

    .line 119
    .line 120
    move-object/from16 v3, p1

    .line 121
    .line 122
    invoke-direct {v2, v0, v3}, Ll/hhu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Lcom/p1/mobile/putong/live/base/data/BLiveVideoChat;)V

    .line 123
    .line 124
    .line 125
    invoke-static {v1, v2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 126
    .line 127
    .line 128
    iget-object v0, v0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->u:Landroid/animation/Animator;

    .line 129
    .line 130
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 131
    .line 132
    .line 133
    return-void
.end method

.method public w(Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->v:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->o:Lv/VRelative;

    .line 9
    .line 10
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->d:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->t:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s:Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    invoke-static {v0}, Ll/it0;->B(Landroid/animation/Animator;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->l:Lv/VFrame;

    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->j:Lv/VFrame;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 39
    .line 40
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->avatar:Ljava/lang/String;

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->setAvatarUrl(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatUser;->userName:Ljava/lang/String;

    .line 48
    .line 49
    const/4 v1, 0x4

    .line 50
    invoke-static {v0, v1}, Ll/xau;->p(Ljava/lang/String;I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->f:Lv/VText;

    .line 55
    .line 56
    const-string v2, "%s\u5411\u4f60\u53d1\u8d77\u89c6\u9891\u95ea\u804a"

    .line 57
    .line 58
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 67
    .line 68
    .line 69
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->n:Lv/VImage;

    .line 70
    .line 71
    sget v1, Ll/nbc0;->b1:I

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->price:Ljava/lang/String;

    .line 77
    .line 78
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->hasDiscountPrice:Z

    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVideoChatAttendeeCallInfo;->callDesc:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;->s(Ljava/lang/String;ZLjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method
