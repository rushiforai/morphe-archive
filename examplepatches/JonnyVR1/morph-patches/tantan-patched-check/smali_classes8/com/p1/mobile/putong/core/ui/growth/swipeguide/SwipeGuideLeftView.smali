.class public Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView$a;
    }
.end annotation


# instance fields
.field public d:Lv/VText;

.field public e:Lv/VText;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;->k0(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/yih0;->a(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic k0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;->g:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView$a;

    .line 8
    .line 9
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;->g:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView$a;

    .line 16
    .line 17
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView$a;->a()V

    .line 18
    .line 19
    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public onFinishInflate()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->N3()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;->f:Lv/VText;

    .line 14
    .line 15
    const/high16 v1, 0x42c40000    # 98.0f

    .line 16
    .line 17
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 22
    .line 23
    .line 24
    :cond_0
    new-instance v0, Ll/wih0;

    .line 25
    .line 26
    invoke-direct {v0, p0}, Ll/wih0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/xih0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/xih0;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Eq:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;->d:Lv/VText;

    .line 55
    .line 56
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 57
    .line 58
    .line 59
    return-void
.end method

.method public setViewTouchListener(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView;->g:Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideLeftView$a;

    .line 2
    .line 3
    return-void
.end method
