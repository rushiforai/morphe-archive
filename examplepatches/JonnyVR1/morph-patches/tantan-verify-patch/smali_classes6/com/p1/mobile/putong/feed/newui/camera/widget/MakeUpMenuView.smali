.class public Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;
    }
.end annotation


# instance fields
.field public A:I

.field public B:I

.field public C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

.field public D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

.field public E:I

.field public F:I

.field public G:F

.field public H:F

.field public I:Z

.field public J:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public K:Landroidx/viewpager2/widget/ViewPager2$i;

.field public a:Landroid/view/View;

.field public b:Landroidx/viewpager2/widget/ViewPager2;

.field public c:Lcom/google/android/material/tabs/TabLayout;

.field public d:Landroid/widget/ImageView;

.field public e:Landroidx/viewpager2/widget/ViewPager2;

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Ll/b0m;

.field public j:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;

.field public k:Lcom/p1/mobile/putong/feed/newui/camera/widget/f;

.field public l:Lcom/p1/mobile/putong/feed/newui/camera/widget/i;

.field public m:Ll/x20;

.field public n:I

.field public o:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

.field public p:F

.field public q:F

.field public r:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;",
            ">;"
        }
    .end annotation
.end field

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/camera/widget/f$b;",
            ">;"
        }
    .end annotation
.end field

.field public t:Ll/vxd0;

.field public u:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ll/vxd0;",
            ">;"
        }
    .end annotation
.end field

.field public v:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public w:Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 71
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 70
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->f:Z

    .line 6
    .line 7
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->g:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->h:Z

    .line 10
    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->p:F

    .line 15
    .line 16
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->q:F

    .line 17
    .line 18
    new-instance p2, Ll/vxd0;

    .line 19
    .line 20
    const-string p3, "feed_camera_makeup_tab_index"

    .line 21
    .line 22
    const/4 v0, -0x1

    .line 23
    invoke-direct {p2, p3, v0}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->t:Ll/vxd0;

    .line 27
    .line 28
    new-instance p2, Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->u:Ljava/util/HashMap;

    .line 34
    .line 35
    new-instance p2, Ljava/util/HashMap;

    .line 36
    .line 37
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v:Ljava/util/Map;

    .line 41
    .line 42
    const/4 p2, 0x1

    .line 43
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->x:I

    .line 44
    .line 45
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->y:I

    .line 46
    .line 47
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->z:I

    .line 48
    .line 49
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->A:I

    .line 50
    .line 51
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->B:I

    .line 52
    .line 53
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->I:Z

    .line 54
    .line 55
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$a;

    .line 56
    .line 57
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 58
    .line 59
    .line 60
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->J:Ll/y20;

    .line 61
    .line 62
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$b;

    .line 63
    .line 64
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->K:Landroidx/viewpager2/widget/ViewPager2$i;

    .line 68
    .line 69
    return-void
.end method

.method private C()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->j:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;

    .line 17
    .line 18
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->k:Lcom/p1/mobile/putong/feed/newui/camera/widget/f;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->J:Ll/y20;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->C(Ll/y20;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 41
    .line 42
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->k:Lcom/p1/mobile/putong/feed/newui/camera/widget/f;

    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 48
    .line 49
    const/4 v2, 0x5

    .line 50
    invoke-virtual {v0, v2}, Landroidx/viewpager2/widget/ViewPager2;->setOffscreenPageLimit(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 59
    .line 60
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->j:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 66
    .line 67
    invoke-virtual {v0, v2}, Landroidx/viewpager2/widget/ViewPager2;->setOffscreenPageLimit(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorHeight(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 76
    .line 77
    invoke-virtual {v0, p0}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 78
    .line 79
    .line 80
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;

    .line 81
    .line 82
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 83
    .line 84
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 85
    .line 86
    new-instance v6, Ll/xsw;

    .line 87
    .line 88
    invoke-direct {v6, p0}, Ll/xsw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 89
    .line 90
    .line 91
    const/4 v4, 0x1

    .line 92
    const/4 v5, 0x0

    .line 93
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;-><init>(Lcom/google/android/material/tabs/TabLayout;Landroidx/viewpager2/widget/ViewPager2;ZZLcom/p1/mobile/putong/feed/newui/camera/widget/i$b;)V

    .line 94
    .line 95
    .line 96
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->l:Lcom/p1/mobile/putong/feed/newui/camera/widget/i;

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/i;->a()V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method private synthetic E(Ll/bkj0;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 9
    .line 10
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v0, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 19
    .line 20
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p1, Ljava/lang/Boolean;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->V(I)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->beautyParameterMap:Ljava/util/Map;

    .line 36
    .line 37
    invoke-interface {p1, v0}, Ll/b0m;->v(Ljava/util/Map;)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->beautyParameterMap:Ljava/util/Map;

    .line 47
    .line 48
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->r0(Ljava/util/Map;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i0()V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->m:Ll/x20;

    .line 5
    .line 6
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->m:Ll/x20;

    .line 13
    .line 14
    invoke-interface {p0}, Ll/x20;->call()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->a0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic H(Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 6
    .line 7
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 16
    .line 17
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p1, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 26
    .line 27
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->hasNeg:Z

    .line 28
    .line 29
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 34
    .line 35
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->y(Ljava/lang/String;)F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 42
    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 48
    .line 49
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 50
    .line 51
    invoke-interface {p1, v2, v1}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 52
    .line 53
    .line 54
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    new-instance v1, Ll/bkj0;

    .line 63
    .line 64
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->H:F

    .line 69
    .line 70
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 75
    .line 76
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    invoke-direct {v1, v0, v2, v3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->t(Ll/bkj0;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 91
    .line 92
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 93
    .line 94
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 95
    .line 96
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->q0(Ljava/lang/String;F)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method private synthetic I(Ll/bkj0;)V
    .locals 4

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 6
    .line 7
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p1, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 18
    .line 19
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->hasNeg:Z

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 26
    .line 27
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->K(Ljava/lang/String;)F

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 36
    .line 37
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 38
    .line 39
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 40
    .line 41
    invoke-interface {v1, v2, v0}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 42
    .line 43
    .line 44
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/bkj0;

    .line 53
    .line 54
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->H:F

    .line 59
    .line 60
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 65
    .line 66
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-direct {v1, p1, v2, v3}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->t(Ll/bkj0;)V

    .line 74
    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 81
    .line 82
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 83
    .line 84
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 85
    .line 86
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->q0(Ljava/lang/String;F)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method private synthetic J()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, v2, v1}, Ll/b0m;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 15
    .line 16
    iget v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->lut:F

    .line 17
    .line 18
    const-string v2, "makeup_lut"

    .line 19
    .line 20
    invoke-interface {v0, v2, v1}, Ll/b0m;->o(Ljava/lang/String;F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 24
    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 26
    .line 27
    iget v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 28
    .line 29
    const-string v3, "makeup_all"

    .line 30
    .line 31
    invoke-interface {v0, v3, v1}, Ll/b0m;->o(Ljava/lang/String;F)V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 39
    .line 40
    iget-object v4, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v4, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 52
    .line 53
    iget v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->lut:F

    .line 54
    .line 55
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->s0(Ljava/lang/String;F)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 63
    .line 64
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 65
    .line 66
    invoke-virtual {v0, v3, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->s0(Ljava/lang/String;F)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private synthetic K(Ll/bkj0;)V
    .locals 5

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 6
    .line 7
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 18
    .line 19
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 20
    .line 21
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 22
    .line 23
    iget v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->lut:F

    .line 24
    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->H:F

    .line 26
    .line 27
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p1, Ljava/lang/Boolean;

    .line 30
    .line 31
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 36
    .line 37
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->hasNeg:Z

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    new-instance v2, Ll/bkj0;

    .line 48
    .line 49
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 54
    .line 55
    iget v3, v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->lut:F

    .line 56
    .line 57
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 62
    .line 63
    iget v4, v4, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 64
    .line 65
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-direct {v2, v0, v3, v4}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->t(Ll/bkj0;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->isNone()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_0

    .line 82
    .line 83
    const/4 p1, 0x2

    .line 84
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->V(I)V

    .line 85
    .line 86
    .line 87
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->f0()V

    .line 88
    .line 89
    .line 90
    new-instance p1, Ll/vsw;

    .line 91
    .line 92
    invoke-direct {p1, p0}, Ll/vsw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 93
    .line 94
    .line 95
    invoke-static {p1}, Ll/l51;->n(Ljava/lang/Runnable;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_0
    if-eqz p1, :cond_1

    .line 100
    .line 101
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->T()V

    .line 102
    .line 103
    .line 104
    :cond_1
    const/4 p1, 0x0

    .line 105
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->V(I)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method private synthetic L(Ll/bkj0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 6
    .line 7
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 16
    .line 17
    iget-object p1, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p1, Ljava/lang/Integer;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->F:I

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->isNone()Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_0

    .line 34
    .line 35
    const/4 p1, 0x0

    .line 36
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e0(Z)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->getBeautyMakeupPage()Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->x()V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->D(Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 60
    .line 61
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->F:I

    .line 66
    .line 67
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->h0(I)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method private synthetic M(Ll/bkj0;)V
    .locals 5

    .line 1
    iget-object v0, p1, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 6
    .line 7
    iget-object v0, p1, Ll/bkj0;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/lang/Integer;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 18
    .line 19
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->lut:F

    .line 20
    .line 21
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->H:F

    .line 22
    .line 23
    iget v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 24
    .line 25
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->isNone()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->Z()V

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->V(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 43
    .line 44
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 47
    .line 48
    invoke-interface {v0, v2, v1}, Ll/b0m;->M(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 54
    .line 55
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 56
    .line 57
    iget v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 58
    .line 59
    invoke-interface {v0, v2, v1}, Ll/b0m;->o(Ljava/lang/String;F)V

    .line 60
    .line 61
    .line 62
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/bkj0;

    .line 71
    .line 72
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 73
    .line 74
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 75
    .line 76
    iget v3, v3, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->lut:F

    .line 77
    .line 78
    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 83
    .line 84
    iget v4, v4, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 85
    .line 86
    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-direct {v1, v2, v3, v4}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->t(Ll/bkj0;)V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 101
    .line 102
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 103
    .line 104
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->k0()V

    .line 110
    .line 111
    .line 112
    :cond_0
    iget-object p1, p1, Ll/bkj0;->c:Ljava/lang/Object;

    .line 113
    .line 114
    check-cast p1, Ljava/lang/Boolean;

    .line 115
    .line 116
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    if-eqz p1, :cond_2

    .line 121
    .line 122
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->isNone()Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    if-eqz p1, :cond_1

    .line 129
    .line 130
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->Y()V

    .line 131
    .line 132
    .line 133
    const/4 p1, 0x0

    .line 134
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->V(I)V

    .line 135
    .line 136
    .line 137
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 142
    .line 143
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 144
    .line 145
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 146
    .line 147
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->m0(Ljava/lang/String;I)V

    .line 148
    .line 149
    .line 150
    :cond_2
    return-void
.end method

.method private synthetic N(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Float;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->H:F

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 12
    .line 13
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->lut:F

    .line 22
    .line 23
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 34
    .line 35
    const-string v0, "makeup_lut"

    .line 36
    .line 37
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->H:F

    .line 38
    .line 39
    invoke-interface {p1, v0, v1}, Ll/b0m;->o(Ljava/lang/String;F)V

    .line 40
    .line 41
    .line 42
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->k0()V

    .line 43
    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method private synthetic O(Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Float;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Float;->floatValue()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 12
    .line 13
    iget-object v1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v1, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 22
    .line 23
    iget-object p1, p1, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p1, Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    if-ne p1, v0, :cond_0

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 41
    .line 42
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 43
    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 45
    .line 46
    invoke-interface {p1, v0, v1}, Ll/b0m;->o(Ljava/lang/String;F)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    if-ne p1, v1, :cond_1

    .line 54
    .line 55
    const-string p1, "makeup_all"

    .line 56
    .line 57
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 58
    .line 59
    invoke-interface {v0, p1, v1}, Ll/b0m;->o(Ljava/lang/String;F)V

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 66
    .line 67
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 68
    .line 69
    invoke-interface {v0, p1, v1}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 70
    .line 71
    .line 72
    :goto_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->k0()V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->u()V

    .line 76
    .line 77
    .line 78
    :cond_2
    return-void
.end method

.method private synthetic P(Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->s(I)Landroid/widget/TextView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic Q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->o:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->beautyParameterMap:Ljava/util/Map;

    .line 6
    .line 7
    invoke-interface {v0, p0}, Ll/b0m;->v(Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic R()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->m0(I)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->e0()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->h:Z

    .line 20
    .line 21
    return-void
.end method

.method private T()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/b0m;->t()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->e()V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->d()V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->j0(I)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private U()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x1

    .line 11
    if-eq v0, v1, :cond_4

    .line 12
    .line 13
    const/4 v2, 0x2

    .line 14
    if-ne v0, v2, :cond_1

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_1
    const/4 v1, 0x3

    .line 18
    if-ne v0, v1, :cond_3

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->isNone()Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_2
    move v1, v2

    .line 30
    goto :goto_1

    .line 31
    :cond_3
    :goto_0
    const/4 v1, 0x0

    .line 32
    :cond_4
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    new-instance v2, Landroid/util/Pair;

    .line 41
    .line 42
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-direct {v2, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->s(Landroid/util/Pair;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method private V(I)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Landroid/util/Pair;

    .line 10
    .line 11
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-direct {v1, p0, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->s(Landroid/util/Pair;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private W()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->c:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->getSelectedTabPosition()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->w:Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->v(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private X(Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/android/material/tabs/TabLayout$Tab;->getCustomView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroid/widget/TextView;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private Y()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->all:F

    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->p0(Ljava/lang/String;F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 28
    .line 29
    invoke-interface {v0, p0}, Ll/b0m;->p(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method private Z()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->I:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->T()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->I:Z

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Lcom/google/android/material/tabs/TabLayout$Tab;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->P(Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    return-void
.end method

.method private a0()V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->b0(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E(Ll/bkj0;)V

    return-void
.end method

.method private b0(I)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->c0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const/4 v0, 0x1

    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 25
    .line 26
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 27
    .line 28
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->d0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_1
    const/4 v1, 0x2

    .line 43
    if-ne p1, v1, :cond_2

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 46
    .line 47
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 48
    .line 49
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->g0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_2
    const/4 v1, 0x3

    .line 64
    if-ne p1, v1, :cond_3

    .line 65
    .line 66
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 67
    .line 68
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 69
    .line 70
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->h0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :cond_3
    const/4 v1, 0x4

    .line 85
    if-ne p1, v1, :cond_4

    .line 86
    .line 87
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e0(Z)V

    .line 88
    .line 89
    .line 90
    :cond_4
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->I(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->H(Ll/bkj0;)V

    return-void
.end method

.method private e0(Z)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->E()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->R()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/b0m;->t()V

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->getBeautyMakeupPage()Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->y()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->x()V

    .line 40
    .line 41
    .line 42
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->e()V

    .line 47
    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->d()V

    .line 54
    .line 55
    .line 56
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->c()V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->b()V

    .line 68
    .line 69
    .line 70
    if-eqz p1, :cond_2

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->b0()V

    .line 77
    .line 78
    .line 79
    :cond_2
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->M(Ll/bkj0;)V

    return-void
.end method

.method private f0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->I:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/b0m;->t()V

    .line 7
    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->e()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->b()V

    .line 21
    .line 22
    .line 23
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->getBeautyMakeupPage()Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->x()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->N(Landroid/util/Pair;)V

    return-void
.end method

.method private getBeautyMakeupPage()Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

    .line 13
    .line 14
    return-object p0
.end method

.method private getCurrentPageView()Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 14
    .line 15
    return-object p0
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->K(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->L(Ll/bkj0;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G(Landroid/view/View;)V

    return-void
.end method

.method private j0(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->l0(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->m0(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->O(Landroid/util/Pair;)V

    return-void
.end method

.method private k0()V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_2

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-eq v0, v1, :cond_2

    .line 8
    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/4 v1, 0x4

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;->all:F

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->getBeautyMakeupPage()Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->F:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->u(I)V

    .line 29
    .line 30
    .line 31
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->getBeautyMakeupPage()Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedBeautyMakeupPageView;->v(I)V

    .line 38
    .line 39
    .line 40
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 45
    .line 46
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 47
    .line 48
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->p0(Ljava/lang/String;F)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 60
    .line 61
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 62
    .line 63
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->m0(Ljava/lang/String;I)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C:Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->type:Ljava/lang/String;

    .line 73
    .line 74
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 75
    .line 76
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->l0(Ljava/lang/String;F)V

    .line 77
    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 84
    .line 85
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 86
    .line 87
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 88
    .line 89
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->s0(Ljava/lang/String;F)V

    .line 90
    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 99
    .line 100
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 101
    .line 102
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->n0(Ljava/lang/String;Ljava/lang/Float;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 115
    .line 116
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->modelFilePath:Ljava/lang/String;

    .line 117
    .line 118
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->H:F

    .line 119
    .line 120
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 121
    .line 122
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->t0(Ljava/lang/String;FF)V

    .line 123
    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 130
    .line 131
    iget v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->lut:F

    .line 132
    .line 133
    const-string v2, "makeup_lut"

    .line 134
    .line 135
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->s0(Ljava/lang/String;F)V

    .line 136
    .line 137
    .line 138
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 143
    .line 144
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->all:F

    .line 145
    .line 146
    const-string v1, "makeup_all"

    .line 147
    .line 148
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->s0(Ljava/lang/String;F)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->getCurrentPageView()Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->E:I

    .line 157
    .line 158
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->k(I)V

    .line 159
    .line 160
    .line 161
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 166
    .line 167
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 168
    .line 169
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 170
    .line 171
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->q0(Ljava/lang/String;F)V

    .line 172
    .line 173
    .line 174
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->D:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;

    .line 179
    .line 180
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter$MakeupItem;->type:Ljava/lang/String;

    .line 181
    .line 182
    iget p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->G:F

    .line 183
    .line 184
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->o0(Ljava/lang/String;F)V

    .line 185
    .line 186
    .line 187
    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->J()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->R()V

    return-void
.end method

.method private m0(I)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public static synthetic n(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->Q()V

    return-void
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)Ll/b0m;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    return-object p0
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->j0(I)V

    return-void
.end method

.method private u()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->n:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eq v0, v1, :cond_1

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const/4 v1, -0x1

    .line 16
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->f0(I)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->t(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private v(Ljava/lang/String;)F
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->H(Ljava/lang/String;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private x(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraBeautyMode;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->l(Ljava/util/List;)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->h()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->s:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->i(Ljava/util/List;)Ljava/util/List;

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x1

    .line 29
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->g:Z

    .line 30
    .line 31
    return-void
.end method

.method private z()V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->k:Lcom/p1/mobile/putong/feed/newui/camera/widget/f;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->s:Ljava/util/List;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/f;->y(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->j:Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r:Ljava/util/List;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageAdapter;->N(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->l()Ll/s120;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    new-instance v2, Ll/ysw;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Ll/ysw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->b()Ll/s120;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    new-instance v2, Ll/zsw;

    .line 56
    .line 57
    invoke-direct {v2, p0}, Ll/zsw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->f()Ll/s120;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    new-instance v2, Ll/atw;

    .line 80
    .line 81
    invoke-direct {v2, p0}, Ll/atw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 85
    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->i()Ll/s120;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    new-instance v2, Ll/btw;

    .line 104
    .line 105
    invoke-direct {v2, p0}, Ll/btw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 109
    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->c()Ll/s120;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    new-instance v2, Ll/ctw;

    .line 128
    .line 129
    invoke-direct {v2, p0}, Ll/ctw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 133
    .line 134
    .line 135
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->d()Ll/s120;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    new-instance v2, Ll/dtw;

    .line 152
    .line 153
    invoke-direct {v2, p0}, Ll/dtw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 154
    .line 155
    .line 156
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 157
    .line 158
    .line 159
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->e()Ll/s120;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    new-instance v2, Ll/etw;

    .line 176
    .line 177
    invoke-direct {v2, p0}, Ll/etw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 181
    .line 182
    .line 183
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;->a()Ll/s120;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    new-instance v2, Ll/ftw;

    .line 200
    .line 201
    invoke-direct {v2, p0}, Ll/ftw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v0, v1, v2}, Landroidx/lifecycle/LiveData;->i(Ll/ker;Ll/cb50;)V

    .line 205
    .line 206
    .line 207
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->K:Landroidx/viewpager2/widget/ViewPager2$i;

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->g(Landroidx/viewpager2/widget/ViewPager2$i;)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->a:Landroid/view/View;

    .line 215
    .line 216
    new-instance v1, Ll/tsw;

    .line 217
    .line 218
    invoke-direct {v1, p0}, Ll/tsw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->d:Landroid/widget/ImageView;

    .line 225
    .line 226
    new-instance v1, Ll/usw;

    .line 227
    .line 228
    invoke-direct {v1, p0}, Ll/usw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 232
    .line 233
    .line 234
    return-void
.end method


# virtual methods
.method public A(Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraCategory;",
            ">;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CameraBeautyMode;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->x(Ljava/util/List;Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->C()V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->z()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public B(Ll/b0m;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->T(Ll/b0m;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public D()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->U(Lcom/p1/mobile/android/app/Act;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->X()Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->w:Lcom/p1/mobile/putong/feed/newui/camera/widget/viewmodel/MakeupSharedViewModel;

    .line 21
    .line 22
    return-void
.end method

.method public S()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->h:Z

    .line 3
    .line 4
    iget-boolean p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->g:Z

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->W()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final c0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->o(II)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ll/wsw;

    .line 7
    .line 8
    invoke-direct {p1, p0}, Ll/wsw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ll/l51;->n(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final d0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 2
    .line 3
    const-string v1, "skin_smooth"

    .line 4
    .line 5
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 13
    .line 14
    const-string v1, "skin_whitening"

    .line 15
    .line 16
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 24
    .line 25
    const-string v1, "skin_ruddy"

    .line 26
    .line 27
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 35
    .line 36
    const-string v1, "big_eye"

    .line 37
    .line 38
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 46
    .line 47
    const-string v1, "thin_face"

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 57
    .line 58
    const-string v1, "skin_sharpen"

    .line 59
    .line 60
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->Z()V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->a0()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->l()V

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x0

    .line 85
    invoke-virtual {p1, v0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->o(II)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->w(I)Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->t(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public final g0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 2
    .line 3
    const-string v1, "face_width"

    .line 4
    .line 5
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 13
    .line 14
    const-string v1, "jaw_shape"

    .line 15
    .line 16
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 24
    .line 25
    const-string v1, "shorten_face"

    .line 26
    .line 27
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 35
    .line 36
    const-string v1, "forehead"

    .line 37
    .line 38
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 46
    .line 47
    const-string v1, "chin_length"

    .line 48
    .line 49
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 57
    .line 58
    const-string v1, "cheekbone_width"

    .line 59
    .line 60
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 68
    .line 69
    const-string v1, "jaw_width"

    .line 70
    .line 71
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 72
    .line 73
    .line 74
    move-result v2

    .line 75
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 76
    .line 77
    .line 78
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 79
    .line 80
    const-string v1, "nose_width"

    .line 81
    .line 82
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 90
    .line 91
    const-string v1, "nose_size"

    .line 92
    .line 93
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 101
    .line 102
    const-string v1, "nose_lift"

    .line 103
    .line 104
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 109
    .line 110
    .line 111
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 112
    .line 113
    const-string v1, "nose_ridge_width"

    .line 114
    .line 115
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 116
    .line 117
    .line 118
    move-result v2

    .line 119
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 123
    .line 124
    const-string v1, "nose_tip_size"

    .line 125
    .line 126
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 134
    .line 135
    const-string v1, "eye_tilt"

    .line 136
    .line 137
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 145
    .line 146
    const-string v1, "eye_distance"

    .line 147
    .line 148
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 153
    .line 154
    .line 155
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 156
    .line 157
    const-string v1, "lip_thickness"

    .line 158
    .line 159
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 167
    .line 168
    const-string v1, "mouth_size"

    .line 169
    .line 170
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 178
    .line 179
    const-string v1, "remove_pouch"

    .line 180
    .line 181
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 189
    .line 190
    const-string v1, "remove_nasolabial_floads"

    .line 191
    .line 192
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 197
    .line 198
    .line 199
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 200
    .line 201
    const-string v1, "eye_brighten"

    .line 202
    .line 203
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 211
    .line 212
    const-string v1, "teeth_whiten"

    .line 213
    .line 214
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 222
    .line 223
    const-string v1, "eye_height"

    .line 224
    .line 225
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->v(Ljava/lang/String;)F

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    invoke-interface {v0, v1, v2}, Ll/b0m;->setFaceBeautyValue(Ljava/lang/String;F)V

    .line 230
    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->c0()V

    .line 237
    .line 238
    .line 239
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 240
    .line 241
    .line 242
    move-result-object v0

    .line 243
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->a0()V

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->l()V

    .line 247
    .line 248
    .line 249
    const/4 v0, 0x0

    .line 250
    invoke-virtual {p1, v0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->o(II)V

    .line 251
    .line 252
    .line 253
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->w(I)Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->t(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V

    .line 258
    .line 259
    .line 260
    return-void
.end method

.method public final h0(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->O()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->i:Ll/b0m;

    .line 12
    .line 13
    invoke-interface {p0}, Ll/b0m;->t()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    invoke-virtual {p1, p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->o(II)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->d0()V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->g()V

    .line 32
    .line 33
    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->e()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->d()V

    .line 46
    .line 47
    .line 48
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->f()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public i0()V
    .locals 1

    .line 1
    new-instance v0, Ll/ssw;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ssw;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public l0(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->b:Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->j(IZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->q(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onTabReselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 0

    return-void
.end method

.method public onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    const-string v0, "#ffffff"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->X(Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->W()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->U()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onTabUnselected(Lcom/google/android/material/tabs/TabLayout$Tab;)V
    .locals 1

    .line 1
    const-string v0, "#80ffffff"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->X(Lcom/google/android/material/tabs/TabLayout$Tab;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/gtw;->a(Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r()Lcom/p1/mobile/android/app/Act;
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

.method public s(I)Landroid/widget/TextView;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->J()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView$MakeupCategory;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->name:Ljava/lang/String;

    .line 16
    .line 17
    new-instance v1, Landroid/widget/TextView;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->r()Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v1, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 30
    .line 31
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 35
    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    const-string p0, "#ffffff"

    .line 40
    .line 41
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const-string p0, "#80ffffff"

    .line 50
    .line 51
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 56
    .line 57
    .line 58
    :goto_0
    const/high16 p0, 0x41200000    # 10.0f

    .line 59
    .line 60
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    const/high16 v0, 0x40c00000    # 6.0f

    .line 65
    .line 66
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result p0

    .line 74
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-virtual {v1, p1, v2, p0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 79
    .line 80
    .line 81
    const/16 p0, 0x11

    .line 82
    .line 83
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 84
    .line 85
    .line 86
    const/high16 p0, 0x41600000    # 14.0f

    .line 87
    .line 88
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 89
    .line 90
    .line 91
    const/4 p0, 0x1

    .line 92
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 93
    .line 94
    .line 95
    sget-object p0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 96
    .line 97
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 98
    .line 99
    .line 100
    return-object v1
.end method

.method public setMenuDismissListener(Ll/x20;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->m:Ll/x20;

    .line 2
    .line 3
    return-void
.end method

.method public final t(Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;)V
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 v0, -0x1

    .line 3
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;->o(II)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->f0(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final w(I)Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->e:Landroidx/viewpager2/widget/ViewPager2;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/FeedMakeupPageView;

    .line 12
    .line 13
    return-object p0
.end method

.method public y()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->f:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->V()Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/camera/util/CameraEffectMgr;->S()V

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/widget/MakeUpMenuView;->f:Z

    .line 14
    .line 15
    :cond_0
    return-void
.end method
