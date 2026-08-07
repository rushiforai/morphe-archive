.class public Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView$a;
    }
.end annotation


# instance fields
.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Landroid/view/View;

.field public h:Landroid/view/View;


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

.method public static synthetic h0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;->l0(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i0(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;->k0(Landroid/view/View;)V

    return-void
.end method

.method private init()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;->g:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/bjh0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bjh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;->h:Landroid/view/View;

    .line 12
    .line 13
    new-instance v1, Ll/cjh0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/cjh0;-><init>(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private synthetic k0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    throw p0
.end method

.method private synthetic l0(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    throw p0
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/djh0;->a(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;->j0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setStepListener(Lcom/p1/mobile/putong/core/ui/growth/swipeguide/SwipeGuideSettingView$a;)V
    .locals 0

    return-void
.end method
