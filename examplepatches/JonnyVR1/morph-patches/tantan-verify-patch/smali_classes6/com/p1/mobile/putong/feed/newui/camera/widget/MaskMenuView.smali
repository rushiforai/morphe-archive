.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;

.field public c:Lcom/google/android/material/tabs/TabLayout;

.field public d:Lv/VPager;

.field public e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

.field public f:Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;

.field public g:I

.field public h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;"
        }
    .end annotation
.end field

.field public i:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->g(Landroid/view/View;)V

    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/d6x;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/d6x;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->b:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/e6x;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/e6x;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private f(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->d()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->y(Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorHeight(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->d:Lv/VPager;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->d:Lv/VPager;

    .line 38
    .line 39
    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 40
    .line 41
    .line 42
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 43
    .line 44
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-ge v0, p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 51
    .line 52
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_0

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->r(I)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 75
    .line 76
    .line 77
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    return-void
.end method

.method private synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->i:Ll/x20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->i:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private synthetic h(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-interface {p1, v0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;->a(IZ)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/xc4;->c()Ll/xc4;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-virtual {p1, v0}, Ll/xc4;->m(Lcom/p1/mobile/putong/feed/data/CameraSticker;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 32
    .line 33
    const/4 p1, -0x1

    .line 34
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->m(I)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/f6x;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()Lcom/p1/mobile/android/app/Act;
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

.method public i(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->m(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getPosition()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->g:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string v1, "#ffffff"

    .line 13
    .line 14
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->x(II)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->h:Ljava/util/List;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->g:I

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->h:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    if-ge p1, v0, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->h:Ljava/util/List;

    .line 40
    .line 41
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->g:I

    .line 42
    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;

    .line 48
    .line 49
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-static {}, Ll/l94;->e()Ll/l94;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->id:Ljava/lang/String;

    .line 60
    .line 61
    iget-wide v2, p1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->cameraUpdateTime:D

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2, v3}, Ll/l94;->i(Ljava/lang/String;D)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 67
    .line 68
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->g:I

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->w(IZ)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 75
    .line 76
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->g:I

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->u(I)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->g:I

    .line 12
    .line 13
    const-string v0, "#80ffffff"

    .line 14
    .line 15
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->x(II)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public setCameraCategoryData(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_0

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->h:Ljava/util/List;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->f(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setMenuDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->i:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnFaceResourceSelectListener(Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->f:Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView;->e:Lcom/p1/mobile/putong/feed/newui/camera/widget/d;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/d;->y(Lcom/p1/mobile/putong/feed/newui/camera/widget/MaskMenuView$a;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method
