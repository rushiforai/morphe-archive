.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;

.field public b:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public c:Landroid/view/View;

.field public d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

.field public e:Lv/VText;

.field public f:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public g:Lv/VImage;

.field public h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

.field public i:Lv/VText;

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public k:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field

.field public m:Z

.field public n:Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

.field public o:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->o:Z

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->o:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 13
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->o:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->k(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m(Landroid/util/Pair;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->l(Ll/bkj0;)V

    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;I)F
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->g(I)F

    move-result p0

    return p0
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/os;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final f()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final g(I)F
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->s(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->I(I)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public h()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->g:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/ms;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ms;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 12
    .line 13
    new-instance v1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView$a;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView$a;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setOnSeekBarChangeListener(Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar$a;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 22
    .line 23
    new-instance v1, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView$b;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView$b;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setOnSeekBarChangeListener(Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar$a;)V

    .line 29
    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->V()Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->X()Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->h()Ll/s120;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f()Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/ns;

    .line 48
    .line 49
    invoke-direct {v2, p0}, Ll/ns;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->n:Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;->g()Ll/s120;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f()Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Ll/ls;

    .line 17
    .line 18
    invoke-direct {v2, p0}, Ll/ls;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->o:Z

    .line 26
    .line 27
    return-void
.end method

.method public final j()V
    .locals 2

    .line 1
    new-instance v0, Landroidx/lifecycle/t;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Landroidx/lifecycle/t;-><init>(Ll/tll0;)V

    .line 8
    .line 9
    .line 10
    const-class v1, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroidx/lifecycle/t;->a(Ljava/lang/Class;)Ll/nll0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->n:Lcom/p1/mobile/putong/account/ui/camera/AccountMakeupSharedViewModel;

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic k(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p2, 0x1

    .line 6
    if-eqz p1, :cond_1

    .line 7
    .line 8
    if-eq p1, p2, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x3

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->j:Ll/y20;

    .line 15
    .line 16
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->j:Ll/y20;

    .line 23
    .line 24
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->j:Ll/y20;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->j:Ll/y20;

    .line 39
    .line 40
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 41
    .line 42
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    :goto_0
    return p2
.end method

.method public final synthetic l(Ll/bkj0;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 10
    .line 11
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/lang/Float;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/high16 v1, 0x42c80000    # 100.0f

    .line 20
    .line 21
    mul-float/2addr v0, v1

    .line 22
    float-to-int v0, v0

    .line 23
    iget-object v2, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v2, Ljava/lang/Float;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Float;->floatValue()F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    mul-float/2addr v2, v1

    .line 32
    float-to-int v1, v2

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 34
    .line 35
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 43
    .line 44
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 52
    .line 53
    iget-object v1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v1, Ljava/lang/Float;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->u(ZF)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iget-boolean v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 66
    .line 67
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 68
    .line 69
    check-cast p1, Ljava/lang/Float;

    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->u(ZF)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 80
    .line 81
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setProgress(I)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setProgress(I)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic m(Landroid/util/Pair;)V
    .locals 1

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p1, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->q(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public n()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->g:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iput-boolean v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public o(Ll/ks$b;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->g:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p1, Ll/ks$b;->d:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 31
    .line 32
    iget v0, p1, Ll/ks$b;->b:F

    .line 33
    .line 34
    const/high16 v1, 0x42c80000    # 100.0f

    .line 35
    .line 36
    mul-float/2addr v0, v1

    .line 37
    float-to-int v0, v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 39
    .line 40
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-boolean v0, p1, Ll/ks$b;->d:Z

    .line 48
    .line 49
    iget p1, p1, Ll/ks$b;->b:F

    .line 50
    .line 51
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->u(ZF)I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 56
    .line 57
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setProgress(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->j()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p(Ll/ks$b;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->g:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 19
    .line 20
    iget-boolean v3, p1, Ll/ks$b;->c:Z

    .line 21
    .line 22
    xor-int/2addr v2, v3

    .line 23
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iput-boolean v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 32
    .line 33
    iget v0, p1, Ll/ks$b;->b:F

    .line 34
    .line 35
    const/high16 v1, 0x42c80000    # 100.0f

    .line 36
    .line 37
    mul-float/2addr v0, v1

    .line 38
    float-to-int v0, v0

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 40
    .line 41
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget-boolean v0, p1, Ll/ks$b;->d:Z

    .line 49
    .line 50
    iget p1, p1, Ll/ks$b;->b:F

    .line 51
    .line 52
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->u(ZF)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 57
    .line 58
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setProgress(I)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final q(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eq p1, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p1, 0x0

    .line 15
    const/4 v0, 0x1

    .line 16
    if-eqz p2, :cond_3

    .line 17
    .line 18
    if-eq p2, v0, :cond_2

    .line 19
    .line 20
    const/4 p1, 0x2

    .line 21
    if-eq p2, p1, :cond_1

    .line 22
    .line 23
    :goto_0
    return-void

    .line 24
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 30
    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 35
    .line 36
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 40
    .line 41
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 46
    .line 47
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 51
    .line 52
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 56
    .line 57
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 61
    .line 62
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 67
    .line 68
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 72
    .line 73
    invoke-static {p2, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 77
    .line 78
    invoke-static {p2, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 82
    .line 83
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    return-void
.end method

.method public r(Ll/ks$b;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->g:Lv/VImage;

    .line 14
    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 19
    .line 20
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 24
    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-boolean v0, p1, Ll/ks$b;->d:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 31
    .line 32
    iget p1, p1, Ll/ks$b;->b:F

    .line 33
    .line 34
    const/high16 v1, 0x42c80000    # 100.0f

    .line 35
    .line 36
    mul-float/2addr v1, p1

    .line 37
    float-to-int v1, v1

    .line 38
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->u(ZF)I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 43
    .line 44
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setProgress(I)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 48
    .line 49
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h()V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public s(Ll/ks$b;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->b:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    iget-boolean v1, p1, Ll/ks$b;->c:Z

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    xor-int/2addr v1, v2

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->f:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 11
    .line 12
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->g:Lv/VImage;

    .line 16
    .line 17
    invoke-static {v0, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 21
    .line 22
    iget-boolean v1, p1, Ll/ks$b;->c:Z

    .line 23
    .line 24
    xor-int/2addr v1, v2

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->i:Lv/VText;

    .line 29
    .line 30
    iget-boolean v1, p1, Ll/ks$b;->c:Z

    .line 31
    .line 32
    xor-int/2addr v1, v2

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-boolean v0, p1, Ll/ks$b;->d:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->m:Z

    .line 39
    .line 40
    iget v0, p1, Ll/ks$b;->a:F

    .line 41
    .line 42
    const/high16 v1, 0x42c80000    # 100.0f

    .line 43
    .line 44
    mul-float/2addr v0, v1

    .line 45
    float-to-int v0, v0

    .line 46
    iget v2, p1, Ll/ks$b;->b:F

    .line 47
    .line 48
    mul-float/2addr v2, v1

    .line 49
    float-to-int v1, v2

    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 51
    .line 52
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 60
    .line 61
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setText(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-boolean v0, p1, Ll/ks$b;->d:Z

    .line 69
    .line 70
    iget v1, p1, Ll/ks$b;->a:F

    .line 71
    .line 72
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->u(ZF)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    iget-boolean v1, p1, Ll/ks$b;->d:Z

    .line 77
    .line 78
    iget p1, p1, Ll/ks$b;->b:F

    .line 79
    .line 80
    invoke-static {v1, p1}, Lcom/p1/mobile/putong/account/ui/camera/AccountCameraEffectMgr;->u(ZF)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 85
    .line 86
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setProgress(I)V

    .line 87
    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->d:Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;

    .line 90
    .line 91
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountTextSeekBar;->setProgress(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->h()V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public setOnAllSeekbarChanged(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->l:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnLutSeekbarChanged(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->k:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnResetItemClick(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMakeupSeekbarPageView;->j:Ll/y20;

    .line 2
    .line 3
    return-void
.end method
