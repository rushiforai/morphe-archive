.class public Ll/u8e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/p8e;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/VDraweeView;

.field public c:Lv/VDraweeView;

.field public d:Lv/VDraweeView;

.field public e:Ll/p8e;

.field public f:Landroid/animation/Animator;

.field public g:Landroid/animation/Animator;

.field public h:Ll/osl;

.field public i:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/u8e;->i:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/u8e;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u8e;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    return-void
.end method

.method public static synthetic c(Ll/u8e;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/u8e;->j()V

    return-void
.end method

.method public static synthetic d(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u8e;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u8e;->p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/v8e;->b(Ll/u8e;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/p8e;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u8e;->e:Ll/p8e;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/p8e;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/u8e;->i(Ll/p8e;)V

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

.method public final synthetic j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/u8e;->e:Ll/p8e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/l6t;->w2()Ll/l6t;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/u8e;->e:Ll/p8e;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/l6t;->w2()Ll/l6t;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/u8e;->e:Ll/p8e;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Ll/l6t;->C2(Ll/l6t;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u8e;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/u8e;->e:Ll/p8e;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object p2, p0, Ll/u8e;->h:Ll/osl;

    .line 7
    .line 8
    invoke-interface {p2}, Ll/osl;->b()Landroid/animation/Animator;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    iput-object p2, p0, Ll/u8e;->g:Landroid/animation/Animator;

    .line 13
    .line 14
    if-eqz p2, :cond_2

    .line 15
    .line 16
    iget-object p2, p0, Ll/u8e;->f:Landroid/animation/Animator;

    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/animation/Animator;->pause()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p2, p0, Ll/u8e;->g:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/animation/Animator;->start()V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Ll/u8e;->g:Landroid/animation/Animator;

    .line 29
    .line 30
    new-instance v0, Ll/t8e;

    .line 31
    .line 32
    invoke-direct {v0, p0, p1}, Ll/t8e;-><init>(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p2, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-virtual {p0, p1}, Ll/u8e;->v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object p2, p0, Ll/u8e;->e:Ll/p8e;

    .line 43
    .line 44
    invoke-virtual {p2}, Ll/xzs;->R2()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    iget-object p0, p0, Ll/u8e;->e:Ll/p8e;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getSource()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p2, p0, p1}, Ll/z7e;->a(Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/u8e;->n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/u8e$a;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0, p1}, Ll/u8e$a;-><init>(Ll/u8e;Ljava/util/concurrent/atomic/AtomicInteger;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/u8e;->c:Lv/VDraweeView;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterIcon()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "context_livingAct"

    .line 18
    .line 19
    invoke-static {v3, v0, v2, v1}, Ll/izs;->w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Ll/u8e;->b:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getInnerIcon()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {v3, p0, p1, v1}, Ll/izs;->w(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Ll/fn2;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Ll/u8e;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    new-instance v1, Ll/l8e;

    .line 7
    .line 8
    iget-object v3, p0, Ll/u8e;->c:Lv/VDraweeView;

    .line 9
    .line 10
    iget-object v4, p0, Ll/u8e;->b:Lv/VDraweeView;

    .line 11
    .line 12
    iget-object v5, p0, Ll/u8e;->d:Lv/VDraweeView;

    .line 13
    .line 14
    iget-object v6, p0, Ll/u8e;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 15
    .line 16
    move-object v2, p1

    .line 17
    invoke-direct/range {v1 .. v6}, Ll/l8e;-><init>(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lv/VDraweeView;Lv/VDraweeView;Lv/VDraweeView;Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/u8e;->h:Ll/osl;

    .line 21
    .line 22
    invoke-interface {v1}, Ll/osl;->a()Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    iput-object p1, p0, Ll/u8e;->f:Landroid/animation/Animator;

    .line 27
    .line 28
    new-instance v0, Ll/r8e;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/r8e;-><init>(Ll/u8e;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1, v0}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 34
    .line 35
    .line 36
    iget-object p1, p0, Ll/u8e;->f:Landroid/animation/Animator;

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/u8e;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 42
    .line 43
    new-instance v0, Ll/s8e;

    .line 44
    .line 45
    invoke-direct {v0, p0, v2}, Ll/s8e;-><init>(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Ll/u8e;->e:Ll/p8e;

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p0, p0, Ll/u8e;->e:Ll/p8e;

    .line 58
    .line 59
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getSource()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-static {p1, p0, v0}, Ll/z7e;->b(Ljava/lang/String;Ll/oo2;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/u8e;->h:Ll/osl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/osl;->reset()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public s(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;Lcom/p1/mobile/android/app/Act;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getOuterIcon()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_2

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getInnerIcon()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v0, 0x0

    .line 25
    iput-boolean v0, p0, Ll/u8e;->i:Z

    .line 26
    .line 27
    iget-object v0, p0, Ll/u8e;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p0, p2, v0}, Ll/u8e;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-object p2, p0, Ll/u8e;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 40
    .line 41
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 42
    .line 43
    const/high16 v1, 0x42cc0000    # 102.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/high16 v2, 0x42c20000    # 97.0f

    .line 50
    .line 51
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Ll/u8e;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 62
    .line 63
    invoke-static {}, Ll/bnl0;->w0()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    neg-int v0, v0

    .line 68
    int-to-float v0, v0

    .line 69
    invoke-virtual {p2, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 70
    .line 71
    .line 72
    iget-object p2, p0, Ll/u8e;->e:Ll/p8e;

    .line 73
    .line 74
    iget-object v0, p0, Ll/u8e;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 75
    .line 76
    invoke-virtual {p2, v0}, Ll/ck2;->L3(Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    iget-object p2, p0, Ll/u8e;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 80
    .line 81
    new-instance v0, Ll/q8e;

    .line 82
    .line 83
    invoke-direct {v0, p0, p1}, Ll/q8e;-><init>(Ll/u8e;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 87
    .line 88
    .line 89
    :cond_2
    :goto_0
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/u8e;->i:Z

    .line 3
    .line 4
    iget-object v0, p0, Ll/u8e;->g:Landroid/animation/Animator;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/u8e;->g:Landroid/animation/Animator;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/u8e;->f:Landroid/animation/Animator;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/animation/Animator;->removeAllListeners()V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/u8e;->f:Landroid/animation/Animator;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Ll/u8e;->e:Ll/p8e;

    .line 29
    .line 30
    iget-object p0, p0, Ll/u8e;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 31
    .line 32
    invoke-virtual {v0, p0}, Ll/ck2;->R3(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final v(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/u8e;->e:Ll/p8e;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/vp20;->n()Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->isVoiceRoom()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/u8e;->e:Ll/p8e;

    .line 16
    .line 17
    const/16 v2, 0x5bcc

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/bae0$a;

    .line 32
    .line 33
    invoke-direct {v1, v2}, Ll/bae0$a;-><init>(I)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getJumpSchema()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {v1, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {v1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/bae0$a;

    .line 63
    .line 64
    invoke-direct {v1, v2}, Ll/bae0$a;-><init>(I)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveDownBox$LiveAccessChannel;->getJumpSchema()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {v1, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object p0, p0, Ll/u8e;->f:Landroid/animation/Animator;

    .line 83
    .line 84
    if-eqz p0, :cond_1

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/animation/Animator;->cancel()V

    .line 87
    .line 88
    .line 89
    :cond_1
    return-void
.end method
