.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;
.super Landroidx/fragment/app/FragmentPagerAdapter;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;
.implements Ll/w0m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/reflect/Method;

.field public c:Landroidx/fragment/app/FragmentManager;

.field public d:Ll/fvf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fvf0<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ll/fvf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fvf0<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Landroidx/fragment/app/FragmentManager;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroidx/fragment/app/FragmentPagerAdapter;-><init>(Landroidx/fragment/app/FragmentManager;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->c:Landroidx/fragment/app/FragmentManager;

    .line 14
    .line 15
    const/4 p1, 0x0

    .line 16
    :try_start_0
    const-class p2, Landroidx/fragment/app/FragmentPagerAdapter;

    .line 17
    .line 18
    const-string v0, "makeFragmentName"

    .line 19
    .line 20
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 21
    .line 22
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 23
    .line 24
    filled-new-array {v1, v2}, [Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {p2, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->b:Ljava/lang/reflect/Method;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {p2, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    goto :goto_2

    .line 39
    :catch_0
    move-exception p2

    .line 40
    goto :goto_0

    .line 41
    :catch_1
    move-exception p2

    .line 42
    goto :goto_1

    .line 43
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->b:Ljava/lang/reflect/Method;

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :goto_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->b:Ljava/lang/reflect/Method;

    .line 53
    .line 54
    :goto_2
    new-instance p1, Ll/fvf0;

    .line 55
    .line 56
    invoke-direct {p1}, Ll/fvf0;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->d:Ll/fvf0;

    .line 60
    .line 61
    new-instance p1, Ll/fvf0;

    .line 62
    .line 63
    invoke-direct {p1}, Ll/fvf0;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->e:Ll/fvf0;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->p()V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->q()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    return-object p0
.end method


# virtual methods
.method public a(ILandroid/view/View;)Landroid/animation/Animator;
    .locals 0
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/w0m;->l0:Ll/qcj;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/animation/Animator;

    .line 8
    .line 9
    return-object p0
.end method

.method public b(ILandroid/view/View;)Landroid/animation/Animator;
    .locals 0
    .param p2    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    sget-object p0, Ll/w0m;->l0:Ll/qcj;

    .line 2
    .line 3
    invoke-interface {p0, p2}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/animation/Animator;

    .line 8
    .line 9
    return-object p0
.end method

.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/FragmentPagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    :try_start_0
    invoke-static {p0}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const-string p1, "mCurTransaction"

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/puc0;->e(Ljava/lang/String;)Ll/puc0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Landroidx/fragment/app/k;

    .line 19
    .line 20
    check-cast p3, Landroidx/fragment/app/Fragment;

    .line 21
    .line 22
    invoke-virtual {p0, p3}, Landroidx/fragment/app/k;->r(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    const/16 p1, 0xa

    .line 28
    .line 29
    invoke-static {p0, p1}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public g(I)Ljava/util/List;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItem(I)Landroidx/fragment/app/Fragment;
    .locals 1

    .line 1
    if-ltz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Landroidx/fragment/app/Fragment;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    int-to-long p0, p0

    .line 14
    return-wide p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->e:Ll/fvf0;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/fvf0;->d(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/String;

    .line 12
    .line 13
    const/4 v1, -0x2

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->d:Ll/fvf0;

    .line 18
    .line 19
    invoke-virtual {v2}, Ll/fvf0;->l()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x0

    .line 24
    :goto_0
    const/4 v4, -0x1

    .line 25
    if-ge v3, v2, :cond_3

    .line 26
    .line 27
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->d:Ll/fvf0;

    .line 28
    .line 29
    invoke-virtual {v5, v3}, Ll/fvf0;->f(I)I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-ne v5, p1, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->d:Ll/fvf0;

    .line 36
    .line 37
    invoke-virtual {p0, v5}, Ll/fvf0;->d(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    check-cast p0, Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    return v4

    .line 50
    :cond_1
    return v1

    .line 51
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_3
    return v4
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->d5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ljava/lang/CharSequence;

    .line 12
    .line 13
    return-object p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const-string v0, "lstFrag :"

    .line 2
    .line 3
    const-string v1, "pagerFragmentManager.getFragments() :"

    .line 4
    .line 5
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->c:Landroidx/fragment/app/FragmentManager;

    .line 6
    .line 7
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->c:Landroidx/fragment/app/FragmentManager;

    .line 19
    .line 20
    invoke-virtual {v3}, Landroidx/fragment/app/FragmentManager;->t0()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    new-instance v4, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, ";"

    .line 40
    .line 41
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    new-instance v1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v0, "[feed][crash]"

    .line 62
    .line 63
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :catch_0
    move-exception v0

    .line 72
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    :goto_0
    invoke-super {p0, p1, p2}, Landroidx/fragment/app/FragmentPagerAdapter;->instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0
.end method

.method public k(I)Landroidx/fragment/app/Fragment;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->b:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/view/View;->getId()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->getItemId(I)J

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ljava/lang/String;

    .line 39
    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1, v0}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 47
    .line 48
    .line 49
    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    goto :goto_3

    .line 51
    :catch_0
    move-exception v0

    .line 52
    goto :goto_0

    .line 53
    :catch_1
    move-exception v0

    .line 54
    goto :goto_1

    .line 55
    :goto_0
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    goto :goto_2

    .line 59
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    :goto_2
    const/4 v0, 0x0

    .line 63
    :goto_3
    if-nez v0, :cond_1

    .line 64
    .line 65
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :cond_1
    return-object v0
.end method

.method public l(I)Landroid/view/View;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/tec0;->y0:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/hdc0;->W1:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/like/FeedLikeTabTitleView;->getTitleView()Lv/VText;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 31
    .line 32
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    aput-object v1, v2, p1

    .line 37
    .line 38
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 39
    .line 40
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/ImageView;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    sget v3, Ll/hdc0;->y0:I

    .line 45
    .line 46
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    check-cast v3, Landroid/widget/ImageView;

    .line 51
    .line 52
    aput-object v3, v2, p1

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 55
    .line 56
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->W4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    sget v3, Ll/hdc0;->z0:I

    .line 61
    .line 62
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    check-cast v3, Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 67
    .line 68
    aput-object v3, v2, p1

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 71
    .line 72
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->d5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Ljava/util/List;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, Ljava/lang/CharSequence;

    .line 81
    .line 82
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 83
    .line 84
    .line 85
    if-nez p1, :cond_0

    .line 86
    .line 87
    const/4 p0, 0x0

    .line 88
    goto :goto_0

    .line 89
    :cond_0
    const/high16 p0, 0x40800000    # 4.0f

    .line 90
    .line 91
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    :goto_0
    invoke-static {v1, p0}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 96
    .line 97
    .line 98
    return-object v0
.end method

.method public final m()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->q()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->p()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/app/PutongFrag;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->g5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public o(ILcom/p1/mobile/putong/app/PutongFrag;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/app/PutongFrag;

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->m()V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    new-instance p1, Ljava/lang/Exception;

    .line 38
    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v2, "----FriendsFeedViewPagerFrag fragment already add Exception-----i="

    .line 42
    .line 43
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v0, ";lstFrag.size="

    .line 50
    .line 51
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string p0, ";newFragment="

    .line 64
    .line 65
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-direct {p1, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    invoke-static {}, Ll/cmg;->t0()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;->h:Lrx/subjects/b;

    .line 10
    .line 11
    const-string p1, ""

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 8

    .line 1
    invoke-static {}, Ll/cmg;->u0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/b5i;->m()Ll/b5i;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/b5i;->l()V

    .line 12
    .line 13
    .line 14
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/jka;->J6()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->V4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->k(I)Landroidx/fragment/app/Fragment;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 30
    .line 31
    const/4 v2, 0x0

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    move-object v3, v0

    .line 35
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Q4()Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 48
    .line 49
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-interface {v3, v4, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->jg(Lcom/p1/mobile/android/app/Act;Z)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 62
    .line 63
    invoke-virtual {v4}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-interface {v3, v4, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 68
    .line 69
    .line 70
    :cond_2
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 71
    .line 72
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z5()V

    .line 73
    .line 74
    .line 75
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 76
    .line 77
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->e6()V

    .line 78
    .line 79
    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 81
    .line 82
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->G5()V

    .line 83
    .line 84
    .line 85
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 86
    .line 87
    invoke-static {v3, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->e5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)V

    .line 88
    .line 89
    .line 90
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 91
    .line 92
    invoke-static {v3, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->j5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)I

    .line 93
    .line 94
    .line 95
    move-result v4

    .line 96
    invoke-static {v3, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->l5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;I)V

    .line 97
    .line 98
    .line 99
    const/4 v3, 0x1

    .line 100
    if-nez p1, :cond_4

    .line 101
    .line 102
    invoke-static {}, Ll/cmg;->B()Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-eqz v4, :cond_4

    .line 107
    .line 108
    if-eqz v1, :cond_4

    .line 109
    .line 110
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->S4()Ll/je70;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    iget-object v1, v1, Ll/je70;->j:Ll/n570;

    .line 117
    .line 118
    if-nez v1, :cond_3

    .line 119
    .line 120
    goto/16 :goto_6

    .line 121
    .line 122
    :cond_3
    iget-wide v4, v1, Ll/n570;->a:J

    .line 123
    .line 124
    const-wide/16 v6, 0x0

    .line 125
    .line 126
    cmp-long v1, v4, v6

    .line 127
    .line 128
    if-lez v1, :cond_7

    .line 129
    .line 130
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 131
    .line 132
    .line 133
    move-result-wide v6

    .line 134
    sub-long/2addr v6, v4

    .line 135
    invoke-static {}, Ll/pu20;->l()J

    .line 136
    .line 137
    .line 138
    move-result-wide v4

    .line 139
    cmp-long v1, v6, v4

    .line 140
    .line 141
    if-lez v1, :cond_7

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 144
    .line 145
    .line 146
    goto :goto_1

    .line 147
    :cond_4
    invoke-static {}, Ll/cmg;->K()Z

    .line 148
    .line 149
    .line 150
    move-result v4

    .line 151
    if-eqz v4, :cond_7

    .line 152
    .line 153
    if-ne p1, v3, :cond_7

    .line 154
    .line 155
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 156
    .line 157
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 158
    .line 159
    .line 160
    move-result-object v4

    .line 161
    aget-object v4, v4, p1

    .line 162
    .line 163
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v4

    .line 171
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 176
    .line 177
    .line 178
    move-result v4

    .line 179
    if-nez v4, :cond_5

    .line 180
    .line 181
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 182
    .line 183
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/TextView;

    .line 184
    .line 185
    .line 186
    move-result-object v4

    .line 187
    aget-object v4, v4, p1

    .line 188
    .line 189
    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v4

    .line 197
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result v4

    .line 205
    if-eqz v4, :cond_7

    .line 206
    .line 207
    :cond_5
    if-eqz v1, :cond_7

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 210
    .line 211
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/ImageView;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    aget-object v1, v1, p1

    .line 216
    .line 217
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_6

    .line 222
    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 224
    .line 225
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Y4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Z

    .line 226
    .line 227
    .line 228
    move-result v1

    .line 229
    if-eqz v1, :cond_7

    .line 230
    .line 231
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 232
    .line 233
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->f5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Z)V

    .line 234
    .line 235
    .line 236
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 237
    .line 238
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Y4()V

    .line 239
    .line 240
    .line 241
    :cond_7
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 242
    .line 243
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->u(Landroid/view/View;Z)V

    .line 256
    .line 257
    .line 258
    move v0, v2

    .line 259
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 260
    .line 261
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    if-ge v0, v1, :cond_b

    .line 266
    .line 267
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->k(I)Landroidx/fragment/app/Fragment;

    .line 268
    .line 269
    .line 270
    move-result-object v1

    .line 271
    instance-of v4, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 272
    .line 273
    if-eqz v4, :cond_a

    .line 274
    .line 275
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 276
    .line 277
    if-ne v0, p1, :cond_8

    .line 278
    .line 279
    move v4, v3

    .line 280
    goto :goto_3

    .line 281
    :cond_8
    move v4, v2

    .line 282
    :goto_3
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->h5(Z)V

    .line 283
    .line 284
    .line 285
    if-ne v0, p1, :cond_9

    .line 286
    .line 287
    move v4, v3

    .line 288
    goto :goto_4

    .line 289
    :cond_9
    move v4, v2

    .line 290
    :goto_4
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->g5(Z)V

    .line 291
    .line 292
    .line 293
    if-ne v0, p1, :cond_a

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Z4()V

    .line 296
    .line 297
    .line 298
    :cond_a
    add-int/lit8 v0, v0, 0x1

    .line 299
    .line 300
    goto :goto_2

    .line 301
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 302
    .line 303
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 308
    .line 309
    .line 310
    if-ne p1, v3, :cond_c

    .line 311
    .line 312
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 313
    .line 314
    iget-object p1, p1, Ll/jka;->Y0:Lrx/subjects/a;

    .line 315
    .line 316
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 317
    .line 318
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    :cond_c
    invoke-static {}, Ll/t8c;->e()Ll/t8c;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 326
    .line 327
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->d5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)Ljava/util/List;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 332
    .line 333
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->X4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)I

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    check-cast v0, Ljava/lang/String;

    .line 342
    .line 343
    invoke-virtual {p1, v0}, Ll/t8c;->a(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 347
    .line 348
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->q5()Z

    .line 349
    .line 350
    .line 351
    move-result p1

    .line 352
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 353
    .line 354
    if-eqz p1, :cond_d

    .line 355
    .line 356
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->h5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)I

    .line 357
    .line 358
    .line 359
    move-result p1

    .line 360
    goto :goto_5

    .line 361
    :cond_d
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->i5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)I

    .line 362
    .line 363
    .line 364
    move-result p1

    .line 365
    :goto_5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 366
    .line 367
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->Z4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Landroid/widget/ImageView;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    aget-object v0, v0, p1

    .line 372
    .line 373
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 374
    .line 375
    .line 376
    move-result v0

    .line 377
    if-nez v0, :cond_f

    .line 378
    .line 379
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 380
    .line 381
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->W4(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;)[Lcom/tantanapp/media/ttmediaeffect/anim/AnimEffectPlayer;

    .line 382
    .line 383
    .line 384
    move-result-object v0

    .line 385
    aget-object p1, v0, p1

    .line 386
    .line 387
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 388
    .line 389
    .line 390
    move-result p1

    .line 391
    if-eqz p1, :cond_e

    .line 392
    .line 393
    goto :goto_7

    .line 394
    :cond_e
    :goto_6
    return-void

    .line 395
    :cond_f
    :goto_7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->f:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 396
    .line 397
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->k5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;Z)V

    .line 398
    .line 399
    .line 400
    return-void
.end method

.method public final p()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->d:Ll/fvf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fvf0;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->d:Ll/fvf0;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->getItemId(I)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ljava/lang/Long;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v2, v3}, Ll/fvf0;->j(ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method

.method public final q()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->e:Ll/fvf0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/fvf0;->clear()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->a:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-ge v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->e:Ll/fvf0;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag$a;->getItemId(I)J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v2}, Ljava/lang/Long;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v2, v3}, Ll/fvf0;->j(ILjava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method
