.class public Ll/ffz;
.super Ll/n2;
.source "SourceFile"


# static fields
.field public static final n:I


# instance fields
.field public a:Landroid/graphics/Rect;

.field public b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public c:Ll/vez;

.field public d:Ll/etx;

.field public e:Z

.field public f:Z

.field public g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

.field public h:Z

.field public i:Ll/nr10;

.field public j:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

.field public k:Landroid/view/View;

.field public l:I

.field public m:Ll/b30;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/b30<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/high16 v0, 0x43a00000    # 320.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput v0, Ll/ffz;->n:I

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/n2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Rect;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ffz;->a:Landroid/graphics/Rect;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-boolean v0, p0, Ll/ffz;->e:Z

    .line 13
    .line 14
    iput-boolean v0, p0, Ll/ffz;->f:Z

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Ll/ffz;->h:Z

    .line 18
    .line 19
    iput v0, p0, Ll/ffz;->l:I

    .line 20
    .line 21
    new-instance v0, Ll/bfz;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/bfz;-><init>(Ll/ffz;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/ffz;->m:Ll/b30;

    .line 27
    .line 28
    iput-object p1, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 29
    .line 30
    return-void
.end method

.method public static bridge synthetic A(Ll/ffz;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ffz;->e:Z

    return p0
.end method

.method public static bridge synthetic B(Ll/ffz;)Ll/vez;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ffz;->c:Ll/vez;

    return-object p0
.end method

.method public static bridge synthetic C(Ll/ffz;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ffz;->f:Z

    return-void
.end method

.method public static bridge synthetic E(Ll/ffz;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ffz;->e:Z

    return-void
.end method

.method public static synthetic p(Ll/ffz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ffz;->M()V

    return-void
.end method

.method public static synthetic q(Landroid/widget/FrameLayout$LayoutParams;Ll/qzz;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0, p2, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic s(Ll/ffz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ffz;->P()V

    return-void
.end method

.method public static synthetic u(Ll/ffz;Lcom/p1/mobile/putong/core/ui/messages/MessageBar;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ffz;->O(Lcom/p1/mobile/putong/core/ui/messages/MessageBar;)V

    return-void
.end method

.method public static synthetic v(Ll/ffz;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ffz;->Q(Z)V

    return-void
.end method

.method public static synthetic w(Ll/ffz;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ffz;->L()V

    return-void
.end method

.method public static synthetic x(Ll/ffz;Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/ffz;->N(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic y(Landroid/widget/FrameLayout$LayoutParams;Ll/qzz;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0, p2, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic z(Landroid/widget/FrameLayout$LayoutParams;Ll/qzz;Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Ljava/lang/Integer;

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0, p2, v0, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p1, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public F()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public final G(Ll/qzz;F)V
    .locals 1

    .line 1
    iget-object p0, p1, Ll/qzz;->p0:Lv/VLinear;

    .line 2
    .line 3
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Ll/qzz;->p0:Lv/VLinear;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-float/2addr v0, p2

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p1, Ll/qzz;->r1:Ll/hxy;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    iget-object p0, p1, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getTranslationY()F

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    add-float/2addr p1, p2

    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method

.method public H(Ll/vez;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    return-void
.end method

.method public final I()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ffz;->J()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ffz;->d:Ll/etx;

    .line 5
    .line 6
    iget-object v1, p0, Ll/ffz;->c:Ll/vez;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ll/etx;->d(Ll/vez;)Ll/g0r;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Ll/ffz;->j:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;->e(Ll/g0r;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final J()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ffz;->j:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/ffz;->d:Ll/etx;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ll/etx;

    .line 10
    .line 11
    iget-object v1, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Ll/etx;-><init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/ffz;->d:Ll/etx;

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/d3z;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0}, Ll/ffz;->F()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-static {v1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    sget v2, Ll/qec0;->m3:I

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const/4 v4, 0x0

    .line 53
    invoke-virtual {v1, v2, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 58
    .line 59
    iput-object v1, p0, Ll/ffz;->j:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v1, p0, Ll/ffz;->j:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Ll/ffz;->j:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 71
    .line 72
    iput-object v0, p0, Ll/ffz;->k:Landroid/view/View;

    .line 73
    .line 74
    :cond_1
    return-void
.end method

.method public K()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/d3z;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getAiChatview()Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x1

    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;->d(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    const/4 v1, -0x1

    .line 8
    invoke-virtual {p0, v0, v1}, Ll/ffz;->k(II)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic M()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->alwaysHideInput()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic N(Ljava/lang/Boolean;Ljava/lang/Integer;Ljava/lang/Boolean;Ljava/lang/Integer;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->d0:Lrx/subjects/b;

    .line 22
    .line 23
    sget-object v2, Ll/uxj0;->a:Ll/uxj0;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Ll/d3z;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/d3z;->p0()V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 39
    .line 40
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/g;->e0:Lrx/subjects/b;

    .line 43
    .line 44
    sget-object v2, Ll/uxj0;->a:Ll/uxj0;

    .line 45
    .line 46
    invoke-virtual {v1, v2}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    :goto_0
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    check-cast v1, Ll/d3z;

    .line 54
    .line 55
    invoke-virtual {v1}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-interface {v2}, Ll/r97;->E()Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_1

    .line 72
    .line 73
    if-eqz v1, :cond_1

    .line 74
    .line 75
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-virtual {v2}, Landroid/view/View;->hasFocus()Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_1

    .line 84
    .line 85
    invoke-static {}, Ll/kqk;->r()Z

    .line 86
    .line 87
    .line 88
    move-result v2

    .line 89
    if-eqz v2, :cond_1

    .line 90
    .line 91
    goto/16 :goto_1

    .line 92
    .line 93
    :cond_1
    iget-object v2, p0, Ll/ffz;->c:Ll/vez;

    .line 94
    .line 95
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-virtual {v2, v3}, Ll/vez;->P0(Z)V

    .line 100
    .line 101
    .line 102
    sget-object v2, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 103
    .line 104
    invoke-virtual {v2}, Ll/azd0;->get()Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    check-cast v2, Ljava/lang/Integer;

    .line 109
    .line 110
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result v2

    .line 114
    sget-object v3, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    .line 115
    .line 116
    invoke-virtual {v3}, Ll/vxd0;->defaultValue()Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    check-cast v3, Ljava/lang/Integer;

    .line 121
    .line 122
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-eqz v3, :cond_2

    .line 135
    .line 136
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 137
    .line 138
    .line 139
    move-result-object v3

    .line 140
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 141
    .line 142
    .line 143
    move-result v3

    .line 144
    if-eqz v3, :cond_2

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    iget v3, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 155
    .line 156
    if-eq v3, v2, :cond_2

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 163
    .line 164
    .line 165
    move-result-object v3

    .line 166
    iput v2, v3, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 167
    .line 168
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    check-cast v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 180
    .line 181
    neg-int v2, v2

    .line 182
    iput v2, v3, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 183
    .line 184
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 185
    .line 186
    .line 187
    :cond_2
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    check-cast v2, Ll/d3z;

    .line 192
    .line 193
    invoke-virtual {v2}, Ll/d3z;->u0()Ll/azy;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 198
    .line 199
    .line 200
    move-result v3

    .line 201
    if-nez v3, :cond_4

    .line 202
    .line 203
    iget-object v3, p0, Ll/ffz;->c:Ll/vez;

    .line 204
    .line 205
    invoke-virtual {v3}, Ll/vez;->y0()I

    .line 206
    .line 207
    .line 208
    move-result v3

    .line 209
    const/4 v4, 0x4

    .line 210
    if-ne v3, v4, :cond_4

    .line 211
    .line 212
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    if-eqz v3, :cond_3

    .line 217
    .line 218
    invoke-virtual {v2}, Ll/azy;->d0()Z

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    if-nez v3, :cond_4

    .line 223
    .line 224
    :cond_3
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    sget v4, Ll/ffz;->n:I

    .line 229
    .line 230
    invoke-static {v3, v4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 231
    .line 232
    .line 233
    neg-int v3, v4

    .line 234
    invoke-static {v1, v3}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 235
    .line 236
    .line 237
    :cond_4
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 238
    .line 239
    .line 240
    move-result-object v0

    .line 241
    check-cast v0, Ll/d3z;

    .line 242
    .line 243
    invoke-virtual {v0}, Ll/d3z;->x0()V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    const/4 v0, 0x2

    .line 251
    if-eqz p1, :cond_5

    .line 252
    .line 253
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 258
    .line 259
    .line 260
    move-result p2

    .line 261
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 262
    .line 263
    .line 264
    move-result p3

    .line 265
    invoke-virtual {p0, v0, p1, p2, p3}, Ll/ffz;->T(IIZI)V

    .line 266
    .line 267
    .line 268
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result p0

    .line 272
    if-eqz p0, :cond_7

    .line 273
    .line 274
    invoke-virtual {v2}, Ll/azy;->d0()Z

    .line 275
    .line 276
    .line 277
    move-result p0

    .line 278
    if-eqz p0, :cond_7

    .line 279
    .line 280
    invoke-virtual {v2}, Ll/azy;->D0()V

    .line 281
    .line 282
    .line 283
    return-void

    .line 284
    :cond_5
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    if-eqz p1, :cond_6

    .line 289
    .line 290
    invoke-virtual {v2}, Ll/azy;->d0()Z

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    if-eqz p1, :cond_6

    .line 295
    .line 296
    iget-object p1, p0, Ll/ffz;->c:Ll/vez;

    .line 297
    .line 298
    invoke-virtual {p1}, Ll/vez;->y0()I

    .line 299
    .line 300
    .line 301
    move-result p1

    .line 302
    const/4 v1, 0x1

    .line 303
    if-eq p1, v1, :cond_6

    .line 304
    .line 305
    iget-object p1, p0, Ll/ffz;->c:Ll/vez;

    .line 306
    .line 307
    invoke-virtual {p1}, Ll/vez;->y0()I

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    const/4 v1, 0x3

    .line 312
    if-eq p1, v1, :cond_6

    .line 313
    .line 314
    invoke-virtual {v2}, Ll/azy;->G0()V

    .line 315
    .line 316
    .line 317
    :cond_6
    iget-object p1, p0, Ll/ffz;->c:Ll/vez;

    .line 318
    .line 319
    invoke-virtual {p1}, Ll/vez;->y0()I

    .line 320
    .line 321
    .line 322
    move-result p1

    .line 323
    if-ne p1, v0, :cond_7

    .line 324
    .line 325
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 326
    .line 327
    .line 328
    move-result p1

    .line 329
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 330
    .line 331
    .line 332
    move-result p2

    .line 333
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 334
    .line 335
    .line 336
    move-result p3

    .line 337
    const/4 p4, 0x0

    .line 338
    invoke-virtual {p0, p4, p1, p2, p3}, Ll/ffz;->T(IIZI)V

    .line 339
    .line 340
    .line 341
    :cond_7
    :goto_1
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/core/ui/messages/MessageBar;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vez;->y0()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne v0, v1, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v1, 0x0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 20
    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object v0, p0, Ll/ffz;->i:Ll/nr10;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Ll/ffz;->i:Ll/nr10;

    .line 33
    .line 34
    invoke-interface {p0}, Ll/nr10;->a()Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    :cond_2
    return-void
.end method

.method public final synthetic P()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Ll/clz;->s:Lrx/subjects/a;

    .line 12
    .line 13
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic Q(Z)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    const/4 v0, -0x1

    .line 5
    invoke-virtual {p0, p1, v0}, Ll/ffz;->k(II)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final R(I)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->M()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/ffz;->c:Ll/vez;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    if-eq p1, p0, :cond_1

    .line 27
    .line 28
    :goto_0
    return-void

    .line 29
    :cond_1
    const/4 p0, 0x0

    .line 30
    new-array p0, p0, [Ll/sfj0$a;

    .line 31
    .line 32
    const-string p1, "e_expression_button"

    .line 33
    .line 34
    const-string v0, "p_chat_view"

    .line 35
    .line 36
    invoke-static {p1, v0, p0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public S()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ll/mzl;->B0()Ll/u1z;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/d3z;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getAiChatview()Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 v0, 0x1

    .line 26
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    const/4 v0, 0x0

    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/messages/aichat/AIChatView;->d(Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public T(IIZI)V
    .locals 29

    move-object/from16 v0, p0

    move/from16 v1, p1

    .line 1
    invoke-virtual/range {p0 .. p1}, Ll/ffz;->R(I)V

    if-lez v1, :cond_0

    .line 2
    iget-object v2, v0, Ll/ffz;->c:Ll/vez;

    .line 3
    invoke-virtual {v2}, Ll/j3z;->e0()Ll/mzl;

    move-result-object v2

    .line 4
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    move-result-object v2

    iget-object v2, v2, Ll/clz;->s:Lrx/subjects/a;

    .line 5
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    :cond_0
    const/4 v2, 0x2

    if-nez v1, :cond_1

    .line 6
    iget-object v3, v0, Ll/ffz;->c:Ll/vez;

    .line 7
    invoke-virtual {v3}, Ll/vez;->y0()I

    move-result v3

    if-ne v3, v2, :cond_1

    iget-object v3, v0, Ll/ffz;->c:Ll/vez;

    .line 8
    invoke-virtual {v3}, Ll/vez;->D0()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 9
    invoke-virtual {v0}, Ll/ffz;->e()V

    return-void

    .line 10
    :cond_1
    iget-object v3, v0, Ll/ffz;->c:Ll/vez;

    .line 11
    invoke-virtual {v3}, Ll/j3z;->e0()Ll/mzl;

    move-result-object v3

    invoke-interface {v3}, Ll/mzl;->B0()Ll/u1z;

    move-result-object v3

    .line 12
    invoke-virtual {v3}, Ll/j3z;->g0()Ll/iam;

    move-result-object v4

    check-cast v4, Ll/d3z;

    invoke-virtual {v4}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    move-result-object v4

    .line 13
    invoke-virtual {v3}, Ll/j3z;->g0()Ll/iam;

    move-result-object v5

    check-cast v5, Ll/d3z;

    invoke-virtual {v5}, Ll/d3z;->u0()Ll/azy;

    move-result-object v5

    .line 14
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {v5}, Ll/azy;->d0()Z

    move-result v6

    if-eqz v6, :cond_2

    if-nez v1, :cond_2

    .line 15
    invoke-virtual {v3}, Ll/j3z;->g0()Ll/iam;

    move-result-object v6

    check-cast v6, Ll/d3z;

    invoke-virtual {v6}, Ll/d3z;->u0()Ll/azy;

    move-result-object v6

    invoke-virtual {v6}, Ll/azy;->G0()V

    .line 16
    :cond_2
    iget-object v6, v0, Ll/ffz;->c:Ll/vez;

    .line 17
    invoke-virtual {v6}, Ll/j3z;->e0()Ll/mzl;

    move-result-object v6

    invoke-interface {v6}, Ll/mzl;->l()Ll/clz;

    move-result-object v6

    invoke-virtual {v6}, Ll/clz;->t7()Ll/qzz;

    move-result-object v6

    .line 18
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getActionLayout()Landroid/view/View;

    move-result-object v7

    invoke-static {v7}, Ll/bnl0;->O0(Landroid/view/View;)Z

    move-result v7

    const/high16 v8, 0x42400000    # 48.0f

    const/4 v9, 0x0

    if-eqz v7, :cond_3

    .line 19
    invoke-static {v8}, Ll/qa00;->d(F)I

    move-result v7

    goto :goto_0

    :cond_3
    move v7, v9

    :goto_0
    const/4 v10, 0x1

    if-ne v1, v10, :cond_4

    .line 20
    invoke-virtual {v5}, Ll/azy;->d0()Z

    move-result v11

    invoke-virtual {v4, v10, v11}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->j(ZZ)V

    goto :goto_1

    .line 21
    :cond_4
    invoke-virtual {v5}, Ll/azy;->d0()Z

    move-result v11

    invoke-virtual {v4, v9, v11}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->j(ZZ)V

    .line 22
    :goto_1
    iget-object v11, v0, Ll/ffz;->c:Ll/vez;

    invoke-virtual {v11}, Ll/vez;->y0()I

    move-result v11

    const/4 v12, 0x4

    if-ne v11, v12, :cond_5

    if-nez v1, :cond_5

    .line 23
    invoke-virtual {v0}, Ll/ffz;->K()V

    :cond_5
    if-ne v1, v12, :cond_6

    .line 24
    invoke-virtual {v5}, Ll/azy;->d0()Z

    move-result v5

    invoke-virtual {v4, v10, v5}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->i(ZZ)V

    .line 25
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    move-result-object v5

    invoke-static {v5, v10}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 26
    sget v5, Ll/ffz;->n:I

    .line 27
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    move-result-object v11

    invoke-static {v11, v5}, Ll/bnl0;->C0(Landroid/view/View;I)V

    neg-int v11, v5

    .line 28
    invoke-static {v4, v11}, Ll/bnl0;->U(Landroid/view/View;I)V

    goto :goto_3

    .line 29
    :cond_6
    sget-object v5, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sget-object v11, Lcom/p1/mobile/android/app/Act;->savedKeyboardHeight:Ll/vxd0;

    invoke-virtual {v11}, Ll/vxd0;->defaultValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Integer;

    invoke-virtual {v11}, Ljava/lang/Integer;->intValue()I

    move-result v11

    invoke-static {v5, v11}, Ljava/lang/Math;->max(II)I

    move-result v5

    .line 30
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    move-result v11

    if-eq v5, v11, :cond_7

    move v11, v5

    goto :goto_2

    :cond_7
    move v11, v9

    .line 31
    :goto_2
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    move-result-object v13

    invoke-static {v13, v5}, Ll/bnl0;->C0(Landroid/view/View;I)V

    neg-int v5, v5

    .line 32
    invoke-static {v4, v5}, Ll/bnl0;->U(Landroid/view/View;I)V

    move v5, v11

    :goto_3
    if-ne v1, v2, :cond_8

    move/from16 v5, p2

    goto :goto_4

    :cond_8
    if-lez v5, :cond_9

    goto :goto_4

    .line 33
    :cond_9
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    move-result v5

    :goto_4
    const/4 v11, 0x3

    if-ne v1, v2, :cond_a

    .line 34
    iget-object v13, v0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    new-instance v14, Ll/wez;

    invoke-direct {v14, v0, v4}, Ll/wez;-><init>(Ll/ffz;Lcom/p1/mobile/putong/core/ui/messages/MessageBar;)V

    move-object/from16 v16, v3

    const-wide/16 v2, 0x12c

    invoke-virtual {v13, v14, v2, v3}, Lcom/p1/mobile/android/app/Act;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_5

    :cond_a
    move-object/from16 v16, v3

    if-eq v1, v10, :cond_b

    if-eq v1, v12, :cond_b

    if-ne v1, v11, :cond_c

    .line 35
    :cond_b
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    move-result-object v2

    invoke-virtual {v2, v9}, Landroid/view/View;->setVisibility(I)V

    :cond_c
    :goto_5
    if-nez v1, :cond_e

    .line 36
    iget-object v2, v0, Ll/ffz;->c:Ll/vez;

    invoke-virtual {v2}, Ll/vez;->y0()I

    move-result v2

    const/4 v15, 0x2

    if-ne v2, v15, :cond_e

    .line 37
    iget-object v2, v0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 38
    iget-object v2, v0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-static {v2, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 39
    :cond_d
    iget-object v2, v0, Ll/ffz;->k:Landroid/view/View;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 40
    iget-object v2, v0, Ll/ffz;->k:Landroid/view/View;

    invoke-static {v2, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    goto/16 :goto_6

    :cond_e
    if-ne v1, v10, :cond_f

    .line 41
    iget-object v2, v0, Ll/ffz;->c:Ll/vez;

    invoke-virtual {v2}, Ll/vez;->u0()V

    .line 42
    iget-object v2, v0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-static {v2, v10}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 43
    iget-object v2, v0, Ll/ffz;->k:Landroid/view/View;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 44
    iget-object v2, v0, Ll/ffz;->k:Landroid/view/View;

    invoke-static {v2, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    goto/16 :goto_6

    :cond_f
    if-ne v1, v12, :cond_11

    .line 45
    invoke-virtual {v0}, Ll/ffz;->S()V

    .line 46
    iget-object v2, v0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_10

    .line 47
    iget-object v2, v0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-static {v2, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    :cond_10
    iget-object v2, v0, Ll/ffz;->k:Landroid/view/View;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_14

    .line 49
    iget-object v2, v0, Ll/ffz;->k:Landroid/view/View;

    invoke-static {v2, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    goto :goto_6

    :cond_11
    if-ne v1, v11, :cond_14

    .line 50
    invoke-virtual {v0}, Ll/ffz;->I()V

    .line 51
    iget-object v2, v0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_12

    .line 52
    iget-object v2, v0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-static {v2, v9}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 53
    :cond_12
    iget-object v2, v0, Ll/ffz;->k:Landroid/view/View;

    invoke-static {v2, v10}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 54
    invoke-static {}, Ll/rum0;->c()Z

    move-result v2

    if-eqz v2, :cond_13

    iget-object v2, v0, Ll/ffz;->i:Ll/nr10;

    instance-of v3, v2, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    if-eqz v3, :cond_13

    check-cast v2, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;

    iget-object v2, v2, Lcom/p1/mobile/putong/core/ui/messages/MultiContentVoiceCall;->b:Landroidx/viewpager/widget/ViewPager;

    .line 55
    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result v2

    if-nez v2, :cond_13

    .line 56
    const-string v2, "p_chat_view"

    new-array v3, v9, [Ll/sfj0$a;

    const-string v13, "e_chat_more_voice_call"

    invoke-static {v13, v2, v3}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 57
    :cond_13
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v2

    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v2

    invoke-interface {v2}, Ll/r97;->E()Z

    move-result v2

    if-eqz v2, :cond_14

    iget-object v2, v6, Ll/qzz;->p1:Ll/clz;

    .line 58
    invoke-virtual {v2}, Ll/clz;->e4()Z

    move-result v2

    if-eqz v2, :cond_14

    .line 59
    iget-object v2, v6, Ll/qzz;->p1:Ll/clz;

    iget-object v2, v2, Ll/clz;->b:Ljava/lang/String;

    .line 60
    const-string v3, "groupchat_id"

    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    move-result-object v2

    filled-new-array {v2}, [Ll/pf60;

    move-result-object v2

    .line 61
    const-string v3, "e_send_red_packet"

    const-string v13, "p_group_chat_view"

    invoke-static {v3, v13, v2}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    :cond_14
    :goto_6
    if-ne v1, v10, :cond_15

    .line 62
    iget-object v2, v0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->r()Z

    move-result v2

    if-eqz v2, :cond_16

    :cond_15
    const/4 v15, 0x2

    if-ne v1, v15, :cond_17

    .line 63
    :cond_16
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    move-result-object v2

    invoke-static {v2}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 64
    :cond_17
    new-instance v2, Ll/xjg;

    invoke-direct {v2}, Ll/xjg;-><init>()V

    .line 65
    iget-object v3, v6, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    .line 66
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 67
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getActionLayout()Landroid/view/View;

    move-result-object v13

    invoke-static {v13}, Ll/bnl0;->O0(Landroid/view/View;)Z

    move-result v13

    if-eqz v13, :cond_18

    .line 68
    invoke-static {v8}, Ll/qa00;->d(F)I

    move-result v8

    goto :goto_7

    :cond_18
    move v8, v9

    .line 69
    :goto_7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v13

    invoke-virtual {v13}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v13

    invoke-interface {v13}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->hm()Z

    move-result v13

    if-eqz v13, :cond_19

    sub-int/2addr v8, v7

    goto :goto_8

    :cond_19
    move v8, v9

    :goto_8
    if-eqz v8, :cond_1a

    .line 70
    iget-object v7, v6, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 71
    invoke-virtual {v7}, Landroid/view/View;->getTranslationY()F

    move-result v13

    int-to-float v14, v8

    add-float/2addr v13, v14

    .line 72
    invoke-virtual {v7, v13}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;->setTranslationY(F)V

    .line 73
    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v7

    add-float/2addr v7, v14

    invoke-virtual {v4, v7}, Landroid/view/View;->setTranslationY(F)V

    :cond_1a
    const/16 v17, 0x7

    const/16 v18, 0x6

    const/16 v19, 0x5

    const/16 p2, 0xa

    move/from16 v21, v11

    move/from16 v20, v12

    const/16 v22, 0x186

    const/16 v23, 0x0

    const/16 v24, 0x9

    .line 74
    const-string v13, "translationY"

    if-eqz v1, :cond_25

    const/16 v25, 0x8

    if-eqz p3, :cond_1b

    .line 75
    iget-object v14, v6, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 76
    invoke-virtual {v14}, Landroid/view/View;->getTranslationY()F

    move-result v26

    move/from16 v15, p4

    int-to-float v15, v15

    add-float v11, v26, v15

    .line 77
    invoke-virtual {v14, v11}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;->setTranslationY(F)V

    .line 78
    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v11

    add-float/2addr v11, v15

    invoke-virtual {v4, v11}, Landroid/view/View;->setTranslationY(F)V

    .line 79
    iget-object v11, v0, Ll/ffz;->c:Ll/vez;

    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v12

    invoke-virtual {v11, v12}, Ll/vez;->Q0(F)V

    :cond_1b
    add-int/2addr v8, v5

    .line 80
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v11

    invoke-virtual {v11}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v11

    invoke-interface {v11}, Ll/r97;->G1()Z

    move-result v11

    if-eqz v11, :cond_21

    const/4 v15, 0x2

    .line 81
    new-array v8, v15, [I

    .line 82
    invoke-virtual {v4, v8}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 83
    iget-object v11, v6, Ll/qzz;->N0:Lv/VFrame;

    invoke-static {v11}, Ll/bnl0;->O0(Landroid/view/View;)Z

    move-result v11

    if-eqz v11, :cond_1c

    .line 84
    iget-object v11, v6, Ll/qzz;->N0:Lv/VFrame;

    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    move-result v11

    goto :goto_9

    :cond_1c
    move v11, v9

    .line 85
    :goto_9
    new-array v12, v15, [I

    .line 86
    iget-object v14, v6, Ll/qzz;->n1:Ll/iwl;

    invoke-interface {v14}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    move-result-object v14

    invoke-virtual {v14, v12}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 87
    iget-object v14, v0, Ll/ffz;->c:Ll/vez;

    invoke-virtual {v14}, Ll/vez;->y0()I

    move-result v14

    .line 88
    iget-object v15, v6, Ll/qzz;->n1:Ll/iwl;

    const/high16 v26, 0x43700000    # 240.0f

    if-eqz v14, :cond_1d

    .line 89
    aget v8, v8, v10

    aget v12, v12, v10

    sub-int/2addr v8, v12

    .line 90
    invoke-interface {v15}, Ll/iwl;->getListRenderHeight()I

    move-result v12

    sub-int/2addr v8, v12

    .line 91
    invoke-static/range {v26 .. v26}, Ll/qa00;->d(F)I

    move-result v12

    add-int/2addr v8, v12

    .line 92
    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v12

    float-to-int v12, v12

    sub-int/2addr v8, v12

    iget-object v12, v6, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 93
    invoke-virtual {v12}, Landroid/view/View;->getTranslationY()F

    move-result v12

    float-to-int v12, v12

    :goto_a
    add-int/2addr v8, v12

    goto :goto_b

    .line 94
    :cond_1d
    aget v8, v8, v10

    aget v12, v12, v10

    sub-int/2addr v8, v12

    .line 95
    invoke-interface {v15}, Ll/iwl;->getListRenderHeight()I

    move-result v12

    sub-int/2addr v8, v12

    .line 96
    invoke-static/range {v26 .. v26}, Ll/qa00;->d(F)I

    move-result v12

    goto :goto_a

    .line 97
    :goto_b
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v12

    invoke-virtual {v12}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v12

    invoke-interface {v12}, Ll/r97;->p4()Z

    move-result v12

    if-eqz v12, :cond_1e

    .line 98
    iget-object v8, v6, Ll/qzz;->n1:Ll/iwl;

    .line 99
    invoke-interface {v8}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getHeight()I

    move-result v8

    iget-object v12, v6, Ll/qzz;->n1:Ll/iwl;

    .line 100
    invoke-interface {v12}, Ll/iwl;->getListRenderHeight()I

    move-result v12

    sub-int/2addr v8, v12

    add-int v12, v5, v11

    .line 101
    invoke-static {v12, v8}, Ljava/lang/Math;->min(II)I

    move-result v12

    goto :goto_c

    :cond_1e
    move v12, v9

    .line 102
    :goto_c
    iget-object v14, v6, Ll/qzz;->P:Lv/VFrame;

    if-eqz v14, :cond_20

    iget-object v14, v6, Ll/qzz;->n1:Ll/iwl;

    .line 103
    invoke-interface {v14}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    move-result-object v14

    invoke-virtual {v14, v10}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v14

    if-nez v14, :cond_20

    iget-object v14, v6, Ll/qzz;->n1:Ll/iwl;

    .line 104
    invoke-interface {v14}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    move-result-object v14

    const/4 v15, -0x1

    invoke-virtual {v14, v15}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v14

    if-eqz v14, :cond_1f

    goto :goto_d

    .line 105
    :cond_1f
    iget-object v14, v6, Ll/qzz;->P:Lv/VFrame;

    invoke-virtual {v14}, Landroid/view/View;->getHeight()I

    move-result v14

    goto :goto_e

    :cond_20
    :goto_d
    move v14, v9

    :goto_e
    sub-int v8, v5, v8

    add-int/2addr v8, v11

    sub-int/2addr v8, v14

    .line 106
    invoke-static {v8, v9}, Ljava/lang/Math;->max(II)I

    move-result v8

    sub-int v11, v5, v8

    .line 107
    iget-object v14, v6, Ll/qzz;->n1:Ll/iwl;

    invoke-interface {v14}, Ll/iwl;->getListRenderHeight()I

    move-result v14

    iput v14, v0, Ll/ffz;->l:I

    goto :goto_f

    :cond_21
    move v11, v9

    move v12, v11

    .line 108
    :goto_f
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v14

    invoke-virtual {v14}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v14

    invoke-interface {v14}, Ll/r97;->p4()Z

    move-result v14

    if-eqz v14, :cond_22

    .line 109
    iget-object v14, v6, Ll/qzz;->n1:Ll/iwl;

    .line 110
    invoke-interface {v14}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    move-result-object v14

    sget-object v15, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->v:Landroid/util/Property;

    filled-new-array {v12}, [I

    move-result-object v12

    .line 111
    invoke-static {v14, v15, v12}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    move-result-object v12

    goto :goto_10

    .line 112
    :cond_22
    invoke-static/range {v22 .. v22}, Ll/gt0;->j(I)Landroid/animation/Animator;

    move-result-object v12

    .line 113
    :goto_10
    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v14

    neg-int v5, v5

    int-to-float v5, v5

    move/from16 v26, v9

    const/4 v15, 0x2

    new-array v9, v15, [F

    aput v14, v9, v26

    aput v5, v9, v10

    invoke-static {v9}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v9

    .line 114
    new-instance v14, Ll/ffz$a;

    invoke-direct {v14, v0}, Ll/ffz$a;-><init>(Ll/ffz;)V

    invoke-virtual {v9, v14}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 115
    invoke-virtual/range {v16 .. v16}, Ll/j3z;->g0()Ll/iam;

    move-result-object v14

    check-cast v14, Ll/d3z;

    invoke-virtual {v14}, Ll/d3z;->r0()Landroid/view/View;

    move-result-object v14

    new-array v15, v10, [F

    aput v23, v15, v26

    invoke-static {v14, v13, v15}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v14

    iget-object v15, v6, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    neg-int v7, v8

    int-to-float v7, v7

    move/from16 p3, v5

    new-array v5, v10, [F

    aput v7, v5, v26

    .line 116
    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    iget-object v15, v6, Ll/qzz;->Q0:Lcom/p1/mobile/putong/core/ui/messages/MessageCommunityHintFooterView;

    move-object/from16 p4, v5

    new-array v5, v10, [F

    aput v7, v5, v26

    .line 117
    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    iget-object v7, v6, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    neg-int v11, v11

    int-to-float v11, v11

    new-array v15, v10, [F

    aput v11, v15, v26

    .line 118
    invoke-static {v7, v13, v15}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v7

    iget-object v15, v6, Ll/qzz;->p0:Lv/VLinear;

    move-object/from16 v16, v5

    new-array v5, v10, [F

    aput v11, v5, v26

    .line 119
    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    iget-object v15, v6, Ll/qzz;->k0:Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;

    move-object/from16 v23, v5

    new-array v5, v10, [F

    aput v11, v5, v26

    .line 120
    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    iget-object v15, v6, Ll/qzz;->H0:Lv/VFrame;

    move-object/from16 v27, v5

    new-array v5, v10, [F

    aput v11, v5, v26

    .line 121
    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    .line 122
    iget-object v15, v6, Ll/qzz;->N0:Lv/VFrame;

    invoke-static {v15}, Ll/bnl0;->O0(Landroid/view/View;)Z

    move-result v15

    if-eqz v15, :cond_23

    .line 123
    iget-object v15, v6, Ll/qzz;->N0:Lv/VFrame;

    move-object/from16 v28, v5

    new-array v5, v10, [F

    aput v11, v5, v26

    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    goto :goto_11

    :cond_23
    move-object/from16 v28, v5

    .line 124
    invoke-static/range {v22 .. v22}, Ll/gt0;->j(I)Landroid/animation/Animator;

    move-result-object v5

    :goto_11
    new-array v11, v10, [F

    aput p3, v11, v26

    .line 125
    invoke-static {v4, v13, v11}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v4

    const/16 v11, 0xb

    new-array v11, v11, [Landroid/animation/Animator;

    aput-object v12, v11, v26

    aput-object v14, v11, v10

    const/4 v15, 0x2

    aput-object p4, v11, v15

    aput-object v16, v11, v21

    aput-object v7, v11, v20

    aput-object v23, v11, v19

    aput-object v27, v11, v18

    aput-object v28, v11, v17

    aput-object v5, v11, v25

    aput-object v9, v11, v24

    aput-object v4, v11, p2

    const-wide/16 v4, 0x186

    .line 126
    invoke-static {v10, v2, v4, v5, v11}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v7

    .line 127
    invoke-virtual {v7}, Landroid/animation/Animator;->start()V

    .line 128
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_24

    .line 129
    iget-object v7, v6, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    .line 130
    invoke-virtual {v7}, Landroid/view/View;->getTop()I

    move-result v7

    filled-new-array {v7, v8}, [I

    move-result-object v7

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v7

    .line 131
    invoke-virtual {v7, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 132
    invoke-virtual {v7, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 133
    new-instance v2, Ll/xez;

    invoke-direct {v2, v3, v6}, Ll/xez;-><init>(Landroid/widget/FrameLayout$LayoutParams;Ll/qzz;)V

    invoke-virtual {v7, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 134
    invoke-virtual {v7}, Landroid/animation/ValueAnimator;->start()V

    :cond_24
    :goto_12
    const/4 v15, 0x2

    goto/16 :goto_15

    :cond_25
    move/from16 v26, v9

    const/16 v25, 0x8

    .line 135
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v5

    invoke-virtual {v5}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v5

    invoke-interface {v5}, Ll/r97;->p4()Z

    move-result v5

    if-eqz v5, :cond_26

    .line 136
    iget-object v5, v6, Ll/qzz;->n1:Ll/iwl;

    .line 137
    invoke-interface {v5}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    move-result-object v5

    sget-object v7, Lcom/p1/mobile/putong/core/ui/messages/recycler/opt/TantanListView;->v:Landroid/util/Property;

    filled-new-array/range {v26 .. v26}, [I

    move-result-object v8

    .line 138
    invoke-static {v5, v7, v8}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    move-result-object v5

    goto :goto_13

    .line 139
    :cond_26
    invoke-static/range {v22 .. v22}, Ll/gt0;->j(I)Landroid/animation/Animator;

    move-result-object v5

    .line 140
    :goto_13
    invoke-virtual {v4}, Landroid/view/View;->getTranslationY()F

    move-result v7

    const/4 v15, 0x2

    new-array v8, v15, [F

    aput v7, v8, v26

    aput v23, v8, v10

    invoke-static {v8}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v7

    .line 141
    new-instance v8, Ll/ffz$b;

    invoke-direct {v8, v0}, Ll/ffz$b;-><init>(Ll/ffz;)V

    invoke-virtual {v7, v8}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 142
    invoke-virtual/range {v16 .. v16}, Ll/j3z;->g0()Ll/iam;

    move-result-object v8

    check-cast v8, Ll/d3z;

    invoke-virtual {v8}, Ll/d3z;->r0()Landroid/view/View;

    move-result-object v8

    new-array v9, v10, [F

    aput v23, v9, v26

    invoke-static {v8, v13, v9}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v8

    iget-object v9, v6, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    new-array v11, v10, [F

    aput v23, v11, v26

    .line 143
    invoke-static {v9, v13, v11}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v9

    iget-object v11, v6, Ll/qzz;->Q0:Lcom/p1/mobile/putong/core/ui/messages/MessageCommunityHintFooterView;

    new-array v12, v10, [F

    aput v23, v12, v26

    .line 144
    invoke-static {v11, v13, v12}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v11

    iget-object v12, v6, Ll/qzz;->G0:Landroid/widget/LinearLayout;

    new-array v14, v10, [F

    aput v23, v14, v26

    .line 145
    invoke-static {v12, v13, v14}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v12

    iget-object v14, v6, Ll/qzz;->p0:Lv/VLinear;

    new-array v15, v10, [F

    aput v23, v15, v26

    .line 146
    invoke-static {v14, v13, v15}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v14

    iget-object v15, v6, Ll/qzz;->k0:Lcom/p1/mobile/putong/core/ui/messages/model/view/ConvNextView;

    move-object/from16 p3, v5

    new-array v5, v10, [F

    aput v23, v5, v26

    .line 147
    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    iget-object v15, v6, Ll/qzz;->H0:Lv/VFrame;

    move-object/from16 p4, v5

    new-array v5, v10, [F

    aput v23, v5, v26

    .line 148
    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    .line 149
    iget-object v15, v6, Ll/qzz;->N0:Lv/VFrame;

    invoke-static {v15}, Ll/bnl0;->O0(Landroid/view/View;)Z

    move-result v15

    if-eqz v15, :cond_27

    .line 150
    iget-object v15, v6, Ll/qzz;->N0:Lv/VFrame;

    move-object/from16 v16, v5

    new-array v5, v10, [F

    aput v23, v5, v26

    invoke-static {v15, v13, v5}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v5

    goto :goto_14

    :cond_27
    move-object/from16 v16, v5

    .line 151
    invoke-static/range {v22 .. v22}, Ll/gt0;->j(I)Landroid/animation/Animator;

    move-result-object v5

    :goto_14
    new-array v15, v10, [F

    aput v23, v15, v26

    .line 152
    invoke-static {v4, v13, v15}, Ll/gt0;->q(Landroid/view/View;Ljava/lang/String;[F)Landroid/animation/Animator;

    move-result-object v4

    const/16 v13, 0xb

    new-array v13, v13, [Landroid/animation/Animator;

    aput-object p3, v13, v26

    aput-object v8, v13, v10

    const/4 v15, 0x2

    aput-object v9, v13, v15

    aput-object v11, v13, v21

    aput-object v12, v13, v20

    aput-object v14, v13, v19

    aput-object p4, v13, v18

    aput-object v16, v13, v17

    aput-object v5, v13, v25

    aput-object v7, v13, v24

    aput-object v4, v13, p2

    const-wide/16 v4, 0x186

    .line 153
    invoke-static {v10, v2, v4, v5, v13}, Ll/gt0;->u(ZLandroid/view/animation/Interpolator;J[Landroid/animation/Animator;)Landroid/animation/Animator;

    move-result-object v7

    .line 154
    new-instance v4, Ll/yez;

    invoke-direct {v4, v0}, Ll/yez;-><init>(Ll/ffz;)V

    invoke-static {v7, v4}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 155
    invoke-virtual {v7}, Landroid/animation/Animator;->start()V

    .line 156
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_24

    .line 157
    iget-object v4, v6, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    move/from16 v5, v26

    filled-new-array {v4, v5}, [I

    move-result-object v4

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v4

    .line 158
    invoke-virtual {v4, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v7, 0x186

    .line 159
    invoke-virtual {v4, v7, v8}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 160
    new-instance v2, Ll/zez;

    invoke-direct {v2, v3, v6}, Ll/zez;-><init>(Landroid/widget/FrameLayout$LayoutParams;Ll/qzz;)V

    invoke-virtual {v4, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 161
    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->start()V

    goto/16 :goto_12

    :goto_15
    if-eq v1, v15, :cond_28

    .line 162
    invoke-virtual {v0}, Ll/ffz;->e()V

    if-eqz v1, :cond_29

    .line 163
    iget-object v2, v0, Ll/ffz;->c:Ll/vez;

    .line 164
    invoke-virtual {v2}, Ll/j3z;->e0()Ll/mzl;

    move-result-object v2

    .line 165
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    move-result-object v2

    .line 166
    invoke-virtual {v2}, Ll/clz;->X2()V

    goto :goto_16

    .line 167
    :cond_28
    invoke-virtual {v0}, Ll/ffz;->f()V

    :cond_29
    :goto_16
    if-eqz v1, :cond_2b

    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    move-result-object v2

    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    move-result-object v2

    invoke-interface {v2}, Ll/r97;->D()Z

    move-result v2

    .line 169
    iget-object v3, v6, Ll/qzz;->S:Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;

    if-eqz v2, :cond_2a

    .line 170
    new-instance v2, Ll/ffz$c;

    invoke-direct {v2, v0}, Ll/ffz$c;-><init>(Ll/ffz;)V

    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;->setOnDispatchTouchEventListener(Ll/bm50;)V

    .line 171
    iget-object v2, v6, Ll/qzz;->S:Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;

    new-instance v3, Ll/afz;

    invoke-direct {v3, v0}, Ll/afz;-><init>(Ll/ffz;)V

    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;->setOnTouchEventHandleListener(Ll/zo50;)V

    goto :goto_17

    .line 172
    :cond_2a
    new-instance v2, Ll/ffz$d;

    invoke-direct {v2, v0, v6}, Ll/ffz$d;-><init>(Ll/ffz;Ll/qzz;)V

    invoke-virtual {v3, v2}, Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;->setOnDispatchTouchEventListener(Ll/bm50;)V

    goto :goto_17

    :cond_2b
    const/4 v5, 0x0

    .line 173
    iput-boolean v5, v0, Ll/ffz;->f:Z

    .line 174
    iget-object v2, v6, Ll/qzz;->S:Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;->setOnDispatchTouchEventListener(Ll/bm50;)V

    .line 175
    iget-object v2, v6, Ll/qzz;->S:Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;

    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/core/ui/messages/recycler/MessageRecyclerDispatchLinear;->setOnTouchEventHandleListener(Ll/zo50;)V

    .line 176
    :goto_17
    iget-object v0, v0, Ll/ffz;->c:Ll/vez;

    invoke-virtual {v0, v1}, Ll/vez;->R0(I)V

    .line 177
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    move-result-object v0

    .line 178
    invoke-virtual {v0}, Ll/xzm0;->s()Z

    return-void
.end method

.method public a()Lcom/p1/mobile/putong/core/ui/messages/Keyboard;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ffz;->F()Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b()Ll/etx;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ffz;->d:Ll/etx;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Ll/b30;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/b30<",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ffz;->m:Ll/b30;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vez;->y0()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eq v0, v2, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/vez;->y0()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v3, 0x3

    .line 18
    if-eq v0, v3, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/vez;->y0()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    const/4 v3, 0x2

    .line 27
    if-eq v0, v3, :cond_1

    .line 28
    .line 29
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/vez;->y0()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/4 v3, 0x4

    .line 36
    if-ne v0, v3, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return v1

    .line 40
    :cond_1
    :goto_0
    const/4 v0, -0x1

    .line 41
    invoke-virtual {p0, v1, v0}, Ll/ffz;->k(II)V

    .line 42
    .line 43
    .line 44
    return v2
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/vez;->D0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/d3z;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-static {v1, v2}, Ll/bnl0;->B(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/app/Act;->hideInput(Landroid/view/View;)Z

    .line 44
    .line 45
    .line 46
    :cond_0
    const/4 v0, 0x1

    .line 47
    iput-boolean v0, p0, Ll/ffz;->h:Z

    .line 48
    .line 49
    iget-object p0, p0, Ll/ffz;->c:Ll/vez;

    .line 50
    .line 51
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/clz;->a3()V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public f()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/d3z;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-static {v1}, Ll/bnl0;->A(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Ll/ffz;->c:Ll/vez;

    .line 29
    .line 30
    invoke-virtual {v1}, Ll/vez;->D0()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    const/4 v2, 0x0

    .line 35
    const-string v3, "keyboard"

    .line 36
    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    iget-object v1, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 40
    .line 41
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v4, p0, Ll/ffz;->c:Ll/vez;

    .line 46
    .line 47
    invoke-virtual {v4}, Ll/j3z;->e0()Ll/mzl;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-interface {v4}, Ll/mzl;->l()Ll/clz;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, Ll/clz;->r3()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-static {v1, v4, v3}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object v1, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 63
    .line 64
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getBar_center_text()Lcom/p1/mobile/putong/core/ui/messages/view/MessageInputBaseEditView;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v1, v0, v2}, Lcom/p1/mobile/android/app/Act;->showInput(Landroid/view/View;I)Z

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_0
    iget-boolean v0, p0, Ll/ffz;->h:Z

    .line 73
    .line 74
    if-eqz v0, :cond_1

    .line 75
    .line 76
    iget-object v0, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iget-object v1, p0, Ll/ffz;->c:Ll/vez;

    .line 83
    .line 84
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-static {v0, v1, v3}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    :goto_0
    iput-boolean v2, p0, Ll/ffz;->h:Z

    .line 100
    .line 101
    iget-object p0, p0, Ll/ffz;->c:Ll/vez;

    .line 102
    .line 103
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-virtual {p0}, Ll/clz;->X2()V

    .line 112
    .line 113
    .line 114
    return-void
.end method

.method public i()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 2
    .line 3
    new-instance v1, Ll/cfz;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/cfz;-><init>(Ll/ffz;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->setUnlockSuccessListener(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 12
    .line 13
    new-instance v1, Ll/dfz;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/dfz;-><init>(Ll/ffz;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->setShareCancelCallbackListener(Ll/x20;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/vez;->C0()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;->E()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vez;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ffz;->H(Ll/vez;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    iget-object p1, p0, Ll/ffz;->b:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    invoke-interface {p2}, Ll/r97;->G1()Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    sget p2, Ll/qec0;->l5:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sget p2, Ll/qec0;->j5:I

    .line 25
    .line 26
    :goto_0
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/d3z;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-virtual {p1, p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 56
    .line 57
    iput-object p1, p0, Ll/ffz;->g:Lcom/p1/mobile/putong/core/ui/messages/Keyboard;

    .line 58
    .line 59
    return-object p1
.end method

.method public j(I)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/d3z;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/ffz;->c:Ll/vez;

    .line 22
    .line 23
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v1}, Ll/clz;->t7()Ll/qzz;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    new-instance v2, Ll/xjg;

    .line 36
    .line 37
    invoke-direct {v2}, Ll/xjg;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v3, v1, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    .line 41
    .line 42
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    check-cast v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 47
    .line 48
    iget-object v4, p0, Ll/ffz;->c:Ll/vez;

    .line 49
    .line 50
    invoke-virtual {v4}, Ll/vez;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    const/4 v5, 0x2

    .line 55
    if-ne v4, v5, :cond_0

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    :goto_0
    new-array v4, v5, [I

    .line 67
    .line 68
    invoke-virtual {v0, v4}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 69
    .line 70
    .line 71
    new-array v5, v5, [I

    .line 72
    .line 73
    iget-object v6, v1, Ll/qzz;->n1:Ll/iwl;

    .line 74
    .line 75
    invoke-interface {v6}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    invoke-virtual {v6, v5}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 80
    .line 81
    .line 82
    iget-object v6, v1, Ll/qzz;->N0:Lv/VFrame;

    .line 83
    .line 84
    invoke-static {v6}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 85
    .line 86
    .line 87
    move-result v6

    .line 88
    const/4 v7, 0x0

    .line 89
    if-eqz v6, :cond_1

    .line 90
    .line 91
    iget-object v6, v1, Ll/qzz;->N0:Lv/VFrame;

    .line 92
    .line 93
    invoke-virtual {v6}, Landroid/view/View;->getHeight()I

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    goto :goto_1

    .line 98
    :cond_1
    move v6, v7

    .line 99
    :goto_1
    const/4 v8, 0x1

    .line 100
    aget v4, v4, v8

    .line 101
    .line 102
    aget v5, v5, v8

    .line 103
    .line 104
    sub-int/2addr v4, v5

    .line 105
    iget-object v5, v1, Ll/qzz;->n1:Ll/iwl;

    .line 106
    .line 107
    invoke-interface {v5}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    sub-int/2addr v4, v5

    .line 116
    const/high16 v5, 0x43700000    # 240.0f

    .line 117
    .line 118
    invoke-static {v5}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result v5

    .line 122
    add-int/2addr v4, v5

    .line 123
    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    .line 124
    .line 125
    .line 126
    move-result v5

    .line 127
    float-to-int v5, v5

    .line 128
    sub-int/2addr v4, v5

    .line 129
    iget-object v5, v1, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 130
    .line 131
    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    .line 132
    .line 133
    .line 134
    move-result v5

    .line 135
    float-to-int v5, v5

    .line 136
    add-int/2addr v4, v5

    .line 137
    iget-object v5, v1, Ll/qzz;->P:Lv/VFrame;

    .line 138
    .line 139
    if-eqz v5, :cond_3

    .line 140
    .line 141
    iget-object v5, v1, Ll/qzz;->n1:Ll/iwl;

    .line 142
    .line 143
    invoke-interface {v5}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 144
    .line 145
    .line 146
    move-result-object v5

    .line 147
    invoke-virtual {v5, v8}, Landroid/view/View;->canScrollVertically(I)Z

    .line 148
    .line 149
    .line 150
    move-result v5

    .line 151
    if-nez v5, :cond_3

    .line 152
    .line 153
    iget-object v5, v1, Ll/qzz;->n1:Ll/iwl;

    .line 154
    .line 155
    invoke-interface {v5}, Ll/iwl;->getRealView()Landroid/view/ViewGroup;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    const/4 v8, -0x1

    .line 160
    invoke-virtual {v5, v8}, Landroid/view/View;->canScrollVertically(I)Z

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    if-eqz v5, :cond_2

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_2
    iget-object v5, v1, Ll/qzz;->P:Lv/VFrame;

    .line 168
    .line 169
    invoke-virtual {v5}, Landroid/view/View;->getHeight()I

    .line 170
    .line 171
    .line 172
    move-result v5

    .line 173
    goto :goto_3

    .line 174
    :cond_3
    :goto_2
    move v5, v7

    .line 175
    :goto_3
    sub-int v4, p1, v4

    .line 176
    .line 177
    add-int/2addr v4, v6

    .line 178
    sub-int/2addr v4, v5

    .line 179
    invoke-static {v4, v7}, Ljava/lang/Math;->max(II)I

    .line 180
    .line 181
    .line 182
    move-result v4

    .line 183
    iget-object v5, v1, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 184
    .line 185
    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    neg-int v6, v4

    .line 190
    int-to-float v6, v6

    .line 191
    sub-float v5, v6, v5

    .line 192
    .line 193
    neg-float v5, v5

    .line 194
    invoke-virtual {p0, v1, v5}, Ll/ffz;->G(Ll/qzz;F)V

    .line 195
    .line 196
    .line 197
    iget-object p0, v1, Ll/qzz;->T:Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;

    .line 198
    .line 199
    invoke-virtual {p0, v6}, Lcom/p1/mobile/putong/core/ui/messages/view/MessageLayout;->setTranslationY(F)V

    .line 200
    .line 201
    .line 202
    neg-int p0, p1

    .line 203
    int-to-float p0, p0

    .line 204
    invoke-virtual {v0, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 205
    .line 206
    .line 207
    iget-object p0, v1, Ll/qzz;->N0:Lv/VFrame;

    .line 208
    .line 209
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 210
    .line 211
    .line 212
    move-result p0

    .line 213
    if-eqz p0, :cond_4

    .line 214
    .line 215
    iget-object p0, v1, Ll/qzz;->N0:Lv/VFrame;

    .line 216
    .line 217
    sub-int p1, v4, p1

    .line 218
    .line 219
    int-to-float p1, p1

    .line 220
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 221
    .line 222
    .line 223
    :cond_4
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result p0

    .line 227
    if-eqz p0, :cond_5

    .line 228
    .line 229
    iget-object p0, v1, Ll/qzz;->X0:Lcom/sunshine/engine/particle/SceneView;

    .line 230
    .line 231
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 232
    .line 233
    .line 234
    move-result p0

    .line 235
    filled-new-array {p0, v4}, [I

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    .line 240
    .line 241
    .line 242
    move-result-object p0

    .line 243
    invoke-virtual {p0, v2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 244
    .line 245
    .line 246
    const-wide/16 v4, 0x186

    .line 247
    .line 248
    invoke-virtual {p0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 249
    .line 250
    .line 251
    new-instance p1, Ll/efz;

    .line 252
    .line 253
    invoke-direct {p1, v3, v1}, Ll/efz;-><init>(Landroid/widget/FrameLayout$LayoutParams;Ll/qzz;)V

    .line 254
    .line 255
    .line 256
    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 260
    .line 261
    .line 262
    :cond_5
    return-void
.end method

.method public k(II)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, v0, v0}, Ll/ffz;->T(IIZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/r97;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/ffz;->k:Landroid/view/View;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/d3z;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iget-object v2, p0, Ll/ffz;->k:Landroid/view/View;

    .line 49
    .line 50
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Ll/ffz;->k:Landroid/view/View;

    .line 54
    .line 55
    iput-object v1, p0, Ll/ffz;->j:Lcom/p1/mobile/putong/core/ui/messages/view/KeyboardMediaLayout;

    .line 56
    .line 57
    invoke-virtual {p0}, Ll/ffz;->I()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    iget-object v0, p0, Ll/ffz;->i:Ll/nr10;

    .line 62
    .line 63
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_1

    .line 68
    .line 69
    iget-object v0, p0, Ll/ffz;->c:Ll/vez;

    .line 70
    .line 71
    invoke-virtual {v0}, Ll/j3z;->e0()Ll/mzl;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-interface {v0}, Ll/mzl;->B0()Ll/u1z;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v0}, Ll/j3z;->g0()Ll/iam;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Ll/d3z;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/d3z;->t0()Lcom/p1/mobile/putong/core/ui/messages/MessageBar;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/MessageBar;->getHidden_slide_out()Lcom/p1/mobile/putong/core/ui/messages/KeyboardFrameWithShadowOutside;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iget-object v2, p0, Ll/ffz;->i:Ll/nr10;

    .line 94
    .line 95
    invoke-interface {v2}, Ll/nr10;->a()Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    iput-object v1, p0, Ll/ffz;->i:Ll/nr10;

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/ffz;->I()V

    .line 105
    .line 106
    .line 107
    :cond_1
    return-void
.end method

.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/ffz;->f:Z

    .line 2
    .line 3
    return p0
.end method

.method public n(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/ffz;->e:Z

    .line 2
    .line 3
    return-void
.end method
