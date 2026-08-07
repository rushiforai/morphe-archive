.class public Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;
    }
.end annotation


# instance fields
.field public final a:Lv/bottombar/VBottomBar;

.field public final b:Landroid/content/Context;

.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lv/bottombar/VBottomBarDefaultItem;",
            ">;"
        }
    .end annotation
.end field

.field public d:Lcom/p1/mobile/putong/newui/main/base/TabName;

.field public e:Z

.field public f:Lv/bottombar/VBottomBarOldItem;

.field public g:Ll/kcg0;

.field public h:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lv/bottombar/VBottomBar;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->a:Lv/bottombar/VBottomBar;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->q()V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->x()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->v()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/newui/main/base/TabName;Lv/bottombar/VBottomBarDefaultItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getTabName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic c(ZLv/bottombar/VBottomBarDefaultItem;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Lv/bottombar/VBottomBarDefaultItem;->setDarkMode(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->w()V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->u(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic g(Lv/bottombar/VBottomBarDefaultItem;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/newui/main/base/TabName;Lv/bottombar/VBottomBarDefaultItem;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getTabName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic i(Lv/bottombar/VBottomBarDefaultItem;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroid/view/View;->setClickable(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic j(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;)Ljava/lang/Integer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->h:Ljava/lang/Integer;

    return-object p0
.end method


# virtual methods
.method public A(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->a:Lv/bottombar/VBottomBar;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->p(Lcom/p1/mobile/putong/newui/main/base/TabName;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-virtual {v0, p0, p2}, Lv/bottombar/VBottomBar;->n(IZ)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public B(Ll/pf60;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/newui/main/base/TabName;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->J(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    check-cast v0, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->d:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 28
    .line 29
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 30
    .line 31
    if-eq v1, p1, :cond_2

    .line 32
    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_2
    check-cast p1, Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 37
    .line 38
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->d:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 39
    .line 40
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->e:Z

    .line 41
    .line 42
    if-ne v0, p1, :cond_3

    .line 43
    .line 44
    :goto_1
    return-void

    .line 45
    :cond_3
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->e:Z

    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 48
    .line 49
    check-cast p1, Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->a:Lv/bottombar/VBottomBar;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    sget v2, Ll/c9c0;->b:I

    .line 56
    .line 57
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    sget v2, Ll/c9c0;->b:I

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :cond_4
    sget v2, Ll/c9c0;->N:I

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    sget v2, Ll/c9c0;->c2:I

    .line 84
    .line 85
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-virtual {p1, v1}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 90
    .line 91
    .line 92
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 93
    .line 94
    new-instance p1, Ll/bb3;

    .line 95
    .line 96
    invoke-direct {p1, v0}, Ll/bb3;-><init>(Z)V

    .line 97
    .line 98
    .line 99
    invoke-static {p0, p1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 100
    .line 101
    .line 102
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/newui/main/base/TabName;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->d:Lv/VOnlineIndicator;

    .line 12
    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p1, 0x4

    .line 18
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    :cond_1
    return-void
.end method

.method public D(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    instance-of v1, v1, Lv/bottombar/VBottomBarOldItem;

    .line 8
    .line 9
    if-eqz v1, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lv/bottombar/VBottomBarOldItem;

    .line 16
    .line 17
    iget-object v0, v0, Lv/bottombar/VBottomBarOldItem;->k:Landroid/widget/RelativeLayout;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 31
    .line 32
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 33
    .line 34
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/CoreProduct;->h0:Z

    .line 35
    .line 36
    const/4 v2, 0x1

    .line 37
    if-nez v1, :cond_0

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->m(Landroid/view/View;)V

    .line 42
    .line 43
    .line 44
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 47
    .line 48
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/api/CoreProduct;->h0:Z

    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    if-eqz p1, :cond_1

    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    const/4 p0, 0x4

    .line 58
    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    .line 59
    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public E(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 12
    .line 13
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final F(I)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->h:Ljava/lang/Integer;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 13
    .line 14
    iget-object v0, v0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 15
    .line 16
    filled-new-array {p1, p1}, [I

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const/4 v2, 0x2

    .line 21
    new-array v2, v2, [F

    .line 22
    .line 23
    fill-array-data v2, :array_0

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p1, v1, v2}, Lv/bottombar/VBottomBarRippleView;->h(I[I[F)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    new-instance p1, Ll/hb3;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Ll/hb3;-><init>(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;)V

    .line 40
    .line 41
    .line 42
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    :goto_0
    return-void

    .line 46
    nop

    .line 47
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final G()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->h:Ljava/lang/Integer;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/c9c0;->r:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    sget v2, Ll/c9c0;->s:I

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    sget v3, Ll/c9c0;->t:I

    .line 40
    .line 41
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 46
    .line 47
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    sget v4, Ll/c9c0;->u:I

    .line 52
    .line 53
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 58
    .line 59
    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    sget v5, Ll/c9c0;->v:I

    .line 64
    .line 65
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 66
    .line 67
    .line 68
    move-result v4

    .line 69
    filled-new-array {v1, v2, v3, v4}, [I

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 74
    .line 75
    iget-object v2, v2, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 76
    .line 77
    const/4 v3, 0x4

    .line 78
    new-array v3, v3, [F

    .line 79
    .line 80
    fill-array-data v3, :array_0

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v0, v1, v3}, Lv/bottombar/VBottomBarRippleView;->h(I[I[F)V

    .line 84
    .line 85
    .line 86
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 87
    .line 88
    invoke-virtual {v0}, Landroid/view/View;->isSelected()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-eqz v0, :cond_1

    .line 93
    .line 94
    new-instance v0, Ll/za3;

    .line 95
    .line 96
    invoke-direct {v0, p0}, Ll/za3;-><init>(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;)V

    .line 97
    .line 98
    .line 99
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 100
    .line 101
    .line 102
    :cond_1
    :goto_0
    return-void

    .line 103
    :array_0
    .array-data 4
        0x0
        0x3e8f5c29    # 0.28f
        0x3f1eb852    # 0.62f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public H(Lcom/p1/mobile/putong/newui/main/base/TabName;II)V
    .locals 0
    .param p3    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->c:Lv/RedPointView;

    .line 12
    .line 13
    invoke-static {p2}, Ll/a9g0;->f(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-eqz p1, :cond_0

    .line 25
    .line 26
    const/4 p1, 0x4

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 p1, 0x0

    .line 29
    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    invoke-static {p3}, Ll/a5d0;->a(I)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public I(Lcom/p1/mobile/putong/newui/main/base/TabName;I)V
    .locals 0
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {p2}, Ll/a5d0;->a(I)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->c:Lv/RedPointView;

    .line 18
    .line 19
    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public J(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public K(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Lv/bottombar/a$a;

    .line 11
    .line 12
    invoke-direct {v1}, Lv/bottombar/a$a;-><init>()V

    .line 13
    .line 14
    .line 15
    const-string v2, "\u5237\u65b0"

    .line 16
    .line 17
    iput-object v2, v1, Lv/bottombar/a$a;->a:Ljava/lang/String;

    .line 18
    .line 19
    sget v2, Ll/dbc0;->G5:I

    .line 20
    .line 21
    iput v2, v1, Lv/bottombar/a$a;->c:I

    .line 22
    .line 23
    iput v2, v1, Lv/bottombar/a$a;->d:I

    .line 24
    .line 25
    invoke-virtual {v0}, Lv/bottombar/VBottomBarDefaultItem;->getInfo()Lv/bottombar/a;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v1, v2, Lv/bottombar/a;->i:Lv/bottombar/a$a;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->z(Lv/bottombar/VBottomBarDefaultItem;Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    invoke-virtual {v0}, Lv/bottombar/VBottomBarDefaultItem;->b()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public L(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    instance-of v0, p0, Lv/bottombar/VBottomBarOldItem;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    check-cast p0, Lv/bottombar/VBottomBarOldItem;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lv/bottombar/VBottomBarOldItem;->i(Ljava/lang/String;Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final M()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-static {}, Ll/joa;->k4()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const-string v0, "#9F64D5"

    .line 13
    .line 14
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->F(I)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-static {}, Ll/joa;->f4()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    const-string v0, "#D19012"

    .line 29
    .line 30
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->F(I)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->G()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public N(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Moment:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {v0}, Lv/bottombar/VBottomBarDefaultItem;->getInfo()Lv/bottombar/a;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    iput-object v2, v1, Lv/bottombar/a;->i:Lv/bottombar/a$a;

    .line 16
    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->z(Lv/bottombar/VBottomBarDefaultItem;Z)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_1
    invoke-virtual {v0}, Lv/bottombar/VBottomBarDefaultItem;->b()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final l(Lv/bottombar/a;)Lv/bottombar/VBottomBarOldItem;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$1;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$1;-><init>(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;Landroid/content/Context;Lv/bottombar/a;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public m(Landroid/view/View;)V
    .locals 9

    .line 1
    instance-of p0, p1, Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreProduct;->z4()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    move-object v0, p1

    .line 14
    check-cast v0, Landroid/widget/TextView;

    .line 15
    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    sget p0, Lcom/p1/mobile/putong/core/R$string;->D5:I

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/core/R$string;->E5:I

    .line 22
    .line 23
    :goto_0
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 27
    .line 28
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 29
    .line 30
    .line 31
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 32
    .line 33
    const/4 p0, 0x2

    .line 34
    new-array v8, p0, [F

    .line 35
    .line 36
    fill-array-data v8, :array_0

    .line 37
    .line 38
    .line 39
    const-wide/16 v3, 0x5dc

    .line 40
    .line 41
    const-wide/16 v5, 0x12c

    .line 42
    .line 43
    move-object v1, p1

    .line 44
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance p1, Ll/jb3;

    .line 49
    .line 50
    invoke-direct {p1, v1}, Ll/jb3;-><init>(Landroid/view/View;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p0, p1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 54
    .line 55
    .line 56
    const/16 p1, 0xb

    .line 57
    .line 58
    new-array v8, p1, [F

    .line 59
    .line 60
    fill-array-data v8, :array_1

    .line 61
    .line 62
    .line 63
    const-string v2, "rotation"

    .line 64
    .line 65
    const-wide/16 v3, 0x12c

    .line 66
    .line 67
    const-wide/16 v5, 0x320

    .line 68
    .line 69
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    filled-new-array {p0, p1}, [Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    :array_1
    .array-data 4
        0x0
        -0x3e600000    # -20.0f
        0x0
        0x41a00000    # 20.0f
        0x0
        -0x3e600000    # -20.0f
        0x0
        0x41a00000    # 20.0f
        0x0
        -0x3e600000    # -20.0f
        0x0
    .end array-data
.end method

.method public n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/ab3;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/ab3;-><init>(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lv/bottombar/VBottomBarDefaultItem;

    .line 13
    .line 14
    return-object p0
.end method

.method public o(Lcom/p1/mobile/putong/newui/main/base/TabName;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p1, v0}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 18
    .line 19
    const/4 p1, 0x4

    .line 20
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public p(Lcom/p1/mobile/putong/newui/main/base/TabName;)I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/ib3;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/ib3;-><init>(Lcom/p1/mobile/putong/newui/main/base/TabName;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->G(Ljava/util/List;Ll/qcj;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final q()V
    .locals 6

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "fake_risk_audit_default_"

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v1, v2}, Ll/qhk0;->getUserById(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/User;->riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_0

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_0

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    goto :goto_0

    .line 80
    :cond_0
    const/4 v0, 0x0

    .line 81
    :goto_0
    invoke-static {}, Ll/gra;->F0()Z

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    if-nez v1, :cond_1

    .line 86
    .line 87
    invoke-static {}, Ll/gra;->d3()Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_1

    .line 92
    .line 93
    invoke-static {}, Ll/gra;->Q1()Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_1

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 100
    .line 101
    sget v2, Lcom/p1/mobile/putong/core/R$string;->yi:I

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    goto :goto_1

    .line 108
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 109
    .line 110
    sget v2, Lcom/p1/mobile/putong/core/R$string;->Uj:I

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    :goto_1
    invoke-static {}, Ll/gra;->z()Z

    .line 117
    .line 118
    .line 119
    new-instance v2, Lv/bottombar/a;

    .line 120
    .line 121
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Card:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 122
    .line 123
    invoke-virtual {v3}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    invoke-direct {v2, v3}, Lv/bottombar/a;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 131
    .line 132
    sget v4, Lcom/p1/mobile/putong/core/R$string;->Gq:I

    .line 133
    .line 134
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    invoke-virtual {v2, v3}, Lv/bottombar/a;->d(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    sget v3, Ll/dbc0;->c0:I

    .line 142
    .line 143
    sget v4, Ll/dbc0;->d0:I

    .line 144
    .line 145
    invoke-virtual {v2, v3, v4}, Lv/bottombar/a;->c(II)V

    .line 146
    .line 147
    .line 148
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 149
    .line 150
    const/4 v4, 0x1

    .line 151
    invoke-virtual {v2, v3, v4}, Lv/bottombar/a;->a(Landroid/content/Context;Z)Lv/bottombar/VBottomBarOldItem;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    invoke-static {}, Ll/gra;->X1()Z

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    invoke-virtual {v2, v3}, Lv/bottombar/VBottomBarDefaultItem;->setGrey(Z)V

    .line 160
    .line 161
    .line 162
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 163
    .line 164
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    invoke-interface {v2}, Ll/hbs;->f()Z

    .line 176
    .line 177
    .line 178
    move-result v2

    .line 179
    if-eqz v2, :cond_2

    .line 180
    .line 181
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 182
    .line 183
    iget-object v2, v2, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 184
    .line 185
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->getHomeLiveTabPosition()I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    if-gez v2, :cond_3

    .line 190
    .line 191
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a()Ll/hbs;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-interface {v2}, Ll/hbs;->e()Z

    .line 200
    .line 201
    .line 202
    move-result v2

    .line 203
    if-eqz v2, :cond_5

    .line 204
    .line 205
    :cond_3
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 206
    .line 207
    iget-object v2, v2, Ll/sre0;->c:Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 208
    .line 209
    invoke-interface {v2}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->a7()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    if-eqz v3, :cond_4

    .line 218
    .line 219
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 220
    .line 221
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Vp:I

    .line 222
    .line 223
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    :cond_4
    new-instance v3, Lv/bottombar/a;

    .line 228
    .line 229
    sget-object v5, Lcom/p1/mobile/putong/newui/main/base/TabName;->Live:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 230
    .line 231
    invoke-virtual {v5}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v5

    .line 235
    invoke-direct {v3, v5}, Lv/bottombar/a;-><init>(Ljava/lang/String;)V

    .line 236
    .line 237
    .line 238
    invoke-virtual {v3, v2}, Lv/bottombar/a;->d(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    sget v2, Ll/dbc0;->W:I

    .line 242
    .line 243
    sget v5, Ll/dbc0;->X:I

    .line 244
    .line 245
    invoke-virtual {v3, v2, v5}, Lv/bottombar/a;->c(II)V

    .line 246
    .line 247
    .line 248
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 249
    .line 250
    iget-object v5, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 251
    .line 252
    invoke-virtual {v3, v5, v4}, Lv/bottombar/a;->a(Landroid/content/Context;Z)Lv/bottombar/VBottomBarOldItem;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    :cond_5
    new-instance v2, Lv/bottombar/a;

    .line 260
    .line 261
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Meet:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 262
    .line 263
    invoke-virtual {v3}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v3

    .line 267
    invoke-direct {v2, v3}, Lv/bottombar/a;-><init>(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    sget v3, Lcom/p1/mobile/putong/core/R$string;->P9:I

    .line 271
    .line 272
    invoke-static {v3}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v3

    .line 276
    invoke-virtual {v2, v3}, Lv/bottombar/a;->d(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    sget v3, Ll/dbc0;->ka:I

    .line 280
    .line 281
    invoke-virtual {v2, v3, v3}, Lv/bottombar/a;->c(II)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->l(Lv/bottombar/a;)Lv/bottombar/VBottomBarOldItem;

    .line 285
    .line 286
    .line 287
    move-result-object v2

    .line 288
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 289
    .line 290
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 291
    .line 292
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->M()V

    .line 296
    .line 297
    .line 298
    new-instance v2, Lv/bottombar/a;

    .line 299
    .line 300
    sget-object v3, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 301
    .line 302
    invoke-virtual {v3}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v3

    .line 306
    invoke-direct {v2, v3}, Lv/bottombar/a;-><init>(Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v2, v1}, Lv/bottombar/a;->d(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    sget v1, Ll/dbc0;->a0:I

    .line 313
    .line 314
    sget v3, Ll/dbc0;->b0:I

    .line 315
    .line 316
    invoke-virtual {v2, v1, v3}, Lv/bottombar/a;->c(II)V

    .line 317
    .line 318
    .line 319
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 320
    .line 321
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 322
    .line 323
    invoke-virtual {v2, v3, v4}, Lv/bottombar/a;->a(Landroid/content/Context;Z)Lv/bottombar/VBottomBarOldItem;

    .line 324
    .line 325
    .line 326
    move-result-object v2

    .line 327
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    new-instance v1, Lv/bottombar/a;

    .line 331
    .line 332
    sget-object v2, Lcom/p1/mobile/putong/newui/main/base/TabName;->Me:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 333
    .line 334
    invoke-virtual {v2}, Lcom/p1/mobile/putong/newui/main/base/TabName;->toString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    invoke-direct {v1, v2}, Lv/bottombar/a;-><init>(Ljava/lang/String;)V

    .line 339
    .line 340
    .line 341
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 342
    .line 343
    sget v3, Lcom/p1/mobile/putong/core/R$string;->Tj:I

    .line 344
    .line 345
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v2

    .line 349
    invoke-virtual {v1, v2}, Lv/bottombar/a;->d(Ljava/lang/String;)V

    .line 350
    .line 351
    .line 352
    sget v2, Ll/dbc0;->Y:I

    .line 353
    .line 354
    sget v3, Ll/dbc0;->Z:I

    .line 355
    .line 356
    invoke-virtual {v1, v2, v3}, Lv/bottombar/a;->c(II)V

    .line 357
    .line 358
    .line 359
    invoke-virtual {v1, v0}, Lv/bottombar/a;->b(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->b:Landroid/content/Context;

    .line 363
    .line 364
    invoke-virtual {v1, v0, v4}, Lv/bottombar/a;->a(Landroid/content/Context;Z)Lv/bottombar/VBottomBarOldItem;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    sget v1, Ll/kec0;->jf:I

    .line 369
    .line 370
    invoke-virtual {v0, v1}, Lv/bottombar/VBottomBarOldItem;->f(I)V

    .line 371
    .line 372
    .line 373
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 374
    .line 375
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 376
    .line 377
    .line 378
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->a:Lv/bottombar/VBottomBar;

    .line 379
    .line 380
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 381
    .line 382
    invoke-virtual {v0, v1}, Lv/bottombar/VBottomBar;->e(Ljava/util/List;)V

    .line 383
    .line 384
    .line 385
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->a:Lv/bottombar/VBottomBar;

    .line 386
    .line 387
    const/4 v0, 0x0

    .line 388
    invoke-virtual {p0, v0, v0}, Lv/bottombar/VBottomBar;->n(IZ)V

    .line 389
    .line 390
    .line 391
    return-void
.end method

.method public r()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/newui/main/base/TabName;->Msg:Lcom/p1/mobile/putong/newui/main/base/TabName;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->p(Lcom/p1/mobile/putong/newui/main/base/TabName;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->c:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    div-int/lit8 p0, p0, 0x2

    .line 14
    .line 15
    if-lt v0, p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public s(Lcom/p1/mobile/putong/newui/main/base/TabName;Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$DotType;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return p1

    .line 9
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager$a;->a:[I

    .line 10
    .line 11
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    aget p2, v0, p2

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    if-eq p2, v0, :cond_3

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    if-eq p2, v0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    if-eq p2, v0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->e:Lv/VImage;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->c:Lv/RedPointView;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_3
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->d:Lv/VOnlineIndicator;

    .line 35
    .line 36
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_4

    .line 41
    .line 42
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0

    .line 47
    :cond_4
    return p1
.end method

.method public t(Lcom/p1/mobile/putong/newui/main/base/TabName;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->n(Lcom/p1/mobile/putong/newui/main/base/TabName;)Lv/bottombar/VBottomBarDefaultItem;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lv/bottombar/VBottomBarDefaultItem;->c:Lv/RedPointView;

    .line 12
    .line 13
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final synthetic u(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->M()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v0, v1}, Lv/bottombar/VBottomBarOldItem;->d(ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic w()V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {p0, v0, v1}, Lv/bottombar/VBottomBarOldItem;->d(ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final x()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->f:Lv/bottombar/VBottomBarOldItem;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->C0:Ll/joa;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/joa;->y3()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/cb3;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/cb3;-><init>(Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/db3;

    .line 28
    .line 29
    invoke-direct {v2}, Ll/db3;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->g:Ll/kcg0;

    .line 41
    .line 42
    return-void
.end method

.method public y()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->a:Lv/bottombar/VBottomBar;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lv/bottombar/VBottomBar;->setVisibleCallback(Ll/y20;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/main/BottomBarManager;->g:Ll/kcg0;

    .line 8
    .line 9
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final z(Lv/bottombar/VBottomBarDefaultItem;Z)V
    .locals 12

    .line 1
    new-instance v6, Landroid/view/animation/LinearInterpolator;

    .line 2
    .line 3
    invoke-direct {v6}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getIconView()Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 11
    .line 12
    const/4 p0, 0x2

    .line 13
    new-array v7, p0, [F

    .line 14
    .line 15
    fill-array-data v7, :array_0

    .line 16
    .line 17
    .line 18
    const-wide/16 v2, 0x0

    .line 19
    .line 20
    const-wide/16 v4, 0x64

    .line 21
    .line 22
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 23
    .line 24
    .line 25
    move-result-object v8

    .line 26
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getIconView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-array v7, p0, [F

    .line 31
    .line 32
    fill-array-data v7, :array_1

    .line 33
    .line 34
    .line 35
    const-string v1, "alpha"

    .line 36
    .line 37
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 38
    .line 39
    .line 40
    move-result-object v9

    .line 41
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getIconView()Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    sget-object v1, Ll/gt0;->i:Landroid/util/Property;

    .line 46
    .line 47
    new-array v7, p0, [F

    .line 48
    .line 49
    fill-array-data v7, :array_2

    .line 50
    .line 51
    .line 52
    const-wide/16 v4, 0x12c

    .line 53
    .line 54
    invoke-static/range {v0 .. v7}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 55
    .line 56
    .line 57
    move-result-object v10

    .line 58
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getIconView()Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-array v7, p0, [F

    .line 63
    .line 64
    fill-array-data v7, :array_3

    .line 65
    .line 66
    .line 67
    const-string v1, "rotation"

    .line 68
    .line 69
    const-wide/16 v2, 0x64

    .line 70
    .line 71
    const-wide/16 v4, 0xc8

    .line 72
    .line 73
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 74
    .line 75
    .line 76
    move-result-object v11

    .line 77
    invoke-virtual {p1}, Lv/bottombar/VBottomBarDefaultItem;->getIconView()Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    new-array v7, p0, [F

    .line 82
    .line 83
    fill-array-data v7, :array_4

    .line 84
    .line 85
    .line 86
    const-string v1, "alpha"

    .line 87
    .line 88
    const-wide/16 v2, 0x0

    .line 89
    .line 90
    const-wide/16 v4, 0x12c

    .line 91
    .line 92
    invoke-static/range {v0 .. v7}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    filled-new-array {v9, v8}, [Landroid/animation/Animator;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/eb3;

    .line 105
    .line 106
    invoke-direct {v1, p1}, Ll/eb3;-><init>(Lv/bottombar/VBottomBarDefaultItem;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v0, v1}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 110
    .line 111
    .line 112
    if-eqz p2, :cond_0

    .line 113
    .line 114
    filled-new-array {v11, v10, p0}, [Landroid/animation/Animator;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    goto :goto_0

    .line 123
    :cond_0
    filled-new-array {v10, p0}, [Landroid/animation/Animator;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-static {p0}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    :goto_0
    new-instance p2, Ll/fb3;

    .line 132
    .line 133
    invoke-direct {p2, p1}, Ll/fb3;-><init>(Lv/bottombar/VBottomBarDefaultItem;)V

    .line 134
    .line 135
    .line 136
    invoke-static {p0, p2}, Ll/gt0;->v(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 137
    .line 138
    .line 139
    new-instance p2, Ll/gb3;

    .line 140
    .line 141
    invoke-direct {p2, p1}, Ll/gb3;-><init>(Lv/bottombar/VBottomBarDefaultItem;)V

    .line 142
    .line 143
    .line 144
    invoke-static {p0, p2}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 145
    .line 146
    .line 147
    const/16 p1, 0xa

    .line 148
    .line 149
    invoke-static {p1}, Ll/gt0;->j(I)Landroid/animation/Animator;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    filled-new-array {p1, v0, p0}, [Landroid/animation/Animator;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    invoke-static {p0}, Ll/gt0;->s([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    invoke-virtual {p0}, Landroid/animation/Animator;->start()V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3dcccccd    # 0.1f
    .end array-data

    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x3dcccccd    # 0.1f
    .end array-data

    .line 174
    .line 175
    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    :array_2
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f800000    # 1.0f
    .end array-data

    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    .line 187
    .line 188
    .line 189
    :array_3
    .array-data 4
        0x0
        0x43b40000    # 360.0f
    .end array-data

    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    :array_4
    .array-data 4
        0x3dcccccd    # 0.1f
        0x3f800000    # 1.0f
    .end array-data
.end method
