.class public Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/ImageView;

.field public c:Lcom/google/android/material/tabs/TabLayout;

.field public d:Lv/VPager;

.field public e:Ll/li;

.field public f:I

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/account/data/CameraCategory;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ll/x20;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

.method public static synthetic a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->g(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->h(Landroid/view/View;)V

    return-void
.end method

.method private e()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->a:Landroid/view/View;

    .line 2
    .line 3
    new-instance v1, Ll/ps;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/ps;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->b:Landroid/widget/ImageView;

    .line 12
    .line 13
    new-instance v1, Ll/qs;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/qs;-><init>(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;)V

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
            "Lcom/p1/mobile/putong/account/data/CameraCategory;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/li;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->d()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p1}, Ll/li;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    invoke-virtual {v0, p1}, Ll/li;->y(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView$a;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorHeight(I)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 23
    .line 24
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->d:Lv/VPager;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->d:Lv/VPager;

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/TabLayout;->setupWithViewPager(Landroidx/viewpager/widget/ViewPager;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout;->getTabCount()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-ge v0, p1, :cond_1

    .line 48
    .line 49
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_0

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 68
    .line 69
    invoke-virtual {v1, v0}, Ll/li;->r(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {p1, v1}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 74
    .line 75
    .line 76
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_1
    return-void
.end method

.method private synthetic g(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->h:Ll/x20;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->h:Ll/x20;

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
    const/4 p1, 0x0

    .line 2
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 17
    .line 18
    const/4 p1, -0x1

    .line 19
    invoke-virtual {p0, p1}, Ll/li;->m(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void

    .line 23
    :cond_1
    throw p1
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/rs;->a(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;Landroid/view/View;)V

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

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e()V

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
    iput p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->f:I

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

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
    invoke-virtual {v0, p1, v1}, Ll/li;->x(II)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->g:Ljava/util/List;

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
    iget p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->f:I

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->g:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->g:Ljava/util/List;

    .line 40
    .line 41
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->f:I

    .line 42
    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/account/data/CameraCategory;

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
    invoke-static {}, Ll/uh;->d()Ll/uh;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iget-object v1, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->id:Ljava/lang/String;

    .line 60
    .line 61
    iget-wide v2, p1, Lcom/p1/mobile/putong/account/data/CameraCategory;->cameraUpdateTime:D

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2, v3}, Ll/uh;->e(Ljava/lang/String;D)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 67
    .line 68
    iget v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->f:I

    .line 69
    .line 70
    const/4 v1, 0x0

    .line 71
    invoke-virtual {p1, v0, v1}, Ll/li;->w(IZ)V

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 75
    .line 76
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->f:I

    .line 77
    .line 78
    invoke-virtual {p1, p0}, Ll/li;->u(I)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->f:I

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
    invoke-virtual {p1, p0, v0}, Ll/li;->x(II)V

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
            "Lcom/p1/mobile/putong/account/data/CameraCategory;",
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
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->g:Ljava/util/List;

    .line 14
    .line 15
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->f(Ljava/util/List;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setMenuDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->h:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public setOnFaceResourceSelectListener(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView;->e:Ll/li;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/li;->y(Lcom/p1/mobile/putong/account/ui/camera/view/AccountMaskMenuView$a;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
