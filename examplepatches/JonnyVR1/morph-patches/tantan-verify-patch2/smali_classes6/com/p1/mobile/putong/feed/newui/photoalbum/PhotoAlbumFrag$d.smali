.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;
.super Landroidx/fragment/app/FragmentPagerAdapter;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;
.implements Ll/w0m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
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

.field public final synthetic d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroidx/fragment/app/FragmentManager;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->b:Ljava/lang/reflect/Method;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->c:Landroidx/fragment/app/FragmentManager;

    .line 17
    .line 18
    :try_start_0
    const-class p2, Landroidx/fragment/app/FragmentPagerAdapter;

    .line 19
    .line 20
    const-string v0, "makeFragmentName"

    .line 21
    .line 22
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 23
    .line 24
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 25
    .line 26
    filled-new-array {v1, v2}, [Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p2, v0, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->b:Ljava/lang/reflect/Method;

    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p2, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_0
    move-exception p2

    .line 42
    goto :goto_0

    .line 43
    :catch_1
    move-exception p2

    .line 44
    goto :goto_1

    .line 45
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->b:Ljava/lang/reflect/Method;

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->b:Ljava/lang/reflect/Method;

    .line 55
    .line 56
    :goto_2
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;ILandroid/widget/TextView;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->n(ILandroid/widget/TextView;Lv/VImage;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

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

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/util/List;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->c:Landroidx/fragment/app/FragmentManager;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->c:Landroidx/fragment/app/FragmentManager;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

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

.method public l(I)Landroidx/fragment/app/Fragment;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->b:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

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
    invoke-virtual {p0, p1}, Landroidx/fragment/app/FragmentPagerAdapter;->getItemId(I)J

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :cond_1
    return-object v0
.end method

.method public m(I)Landroid/view/View;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

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
    sget v1, Ll/tec0;->x5:I

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
    sget v1, Ll/hdc0;->D0:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lv/VImage;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sget v3, Ll/lbc0;->v1:I

    .line 33
    .line 34
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->z5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/cmg;->Y()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-eqz v2, :cond_0

    .line 55
    .line 56
    if-nez p1, :cond_0

    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 59
    .line 60
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->A5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Lv/VImage;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const/4 v3, 0x0

    .line 65
    aput-object v1, v2, v3

    .line 66
    .line 67
    :cond_0
    sget v2, Ll/hdc0;->d2:I

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v2

    .line 73
    check-cast v2, Landroid/widget/TextView;

    .line 74
    .line 75
    sget v3, Ll/hdc0;->e2:I

    .line 76
    .line 77
    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    check-cast v3, Landroid/widget/TextView;

    .line 82
    .line 83
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 84
    .line 85
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    aput-object v2, v4, p1

    .line 90
    .line 91
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 92
    .line 93
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->F5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    aput-object v3, v4, p1

    .line 98
    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 100
    .line 101
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->D5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/ImageView;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    sget v4, Ll/hdc0;->y0:I

    .line 106
    .line 107
    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object v4

    .line 111
    check-cast v4, Landroid/widget/ImageView;

    .line 112
    .line 113
    aput-object v4, v3, p1

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 116
    .line 117
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    invoke-interface {v3, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v3

    .line 125
    check-cast v3, Ljava/lang/CharSequence;

    .line 126
    .line 127
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 128
    .line 129
    .line 130
    new-instance v3, Ll/qh70;

    .line 131
    .line 132
    invoke-direct {v3, p0, p1, v2, v1}, Ll/qh70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;ILandroid/widget/TextView;Lv/VImage;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 139
    .line 140
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    aget-object p1, v1, p1

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 147
    .line 148
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    sget v1, Ll/k9c0;->Z:I

    .line 153
    .line 154
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 159
    .line 160
    .line 161
    return-object v0
.end method

.method public final synthetic n(ILandroid/widget/TextView;Lv/VImage;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->v5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const-string v0, "\u559c\u6b22"

    .line 18
    .line 19
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->z5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 44
    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->B5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    invoke-virtual {p3, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 55
    .line 56
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    sget v0, Ll/lbc0;->u1:I

    .line 61
    .line 62
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p3, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->z5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p3, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 78
    .line 79
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    sget v0, Ll/lbc0;->v1:I

    .line 84
    .line 85
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    invoke-virtual {p3, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 93
    .line 94
    invoke-static {p2, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->S5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 98
    .line 99
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->v5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)I

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    if-eq p2, p1, :cond_2

    .line 104
    .line 105
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 108
    .line 109
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Lv/navigationbar/VNavigationTabLayout;->D(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 114
    .line 115
    .line 116
    :cond_2
    return-void
.end method

.method public o()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->c:Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 23
    .line 24
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->c:Landroidx/fragment/app/FragmentManager;

    .line 25
    .line 26
    invoke-virtual {v2}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v2, v1}, Landroidx/fragment/app/k;->r(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/k;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Landroidx/fragment/app/k;->j()I

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    :goto_1
    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->u5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Q4()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->jg(Lcom/p1/mobile/android/app/Act;Z)V

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-interface {v0, v1, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 63
    .line 64
    .line 65
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 66
    .line 67
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->R5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 71
    .line 72
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->U5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 76
    .line 77
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->Q5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 81
    .line 82
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->H5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;I)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->u(Landroid/view/View;Z)V

    .line 100
    .line 101
    .line 102
    move v0, v2

    .line 103
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

    .line 104
    .line 105
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    const/4 v3, 0x1

    .line 110
    if-ge v0, v1, :cond_7

    .line 111
    .line 112
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->l(I)Landroidx/fragment/app/Fragment;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    instance-of v4, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 117
    .line 118
    if-eqz v4, :cond_4

    .line 119
    .line 120
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 121
    .line 122
    if-ne v0, p1, :cond_2

    .line 123
    .line 124
    move v4, v3

    .line 125
    goto :goto_2

    .line 126
    :cond_2
    move v4, v2

    .line 127
    :goto_2
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->h5(Z)V

    .line 128
    .line 129
    .line 130
    if-ne v0, p1, :cond_3

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_3
    move v3, v2

    .line 134
    :goto_3
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->g5(Z)V

    .line 135
    .line 136
    .line 137
    if-ne v0, p1, :cond_6

    .line 138
    .line 139
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Z4()V

    .line 140
    .line 141
    .line 142
    goto :goto_5

    .line 143
    :cond_4
    instance-of v4, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 144
    .line 145
    if-eqz v4, :cond_6

    .line 146
    .line 147
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;

    .line 148
    .line 149
    if-ne v0, p1, :cond_5

    .line 150
    .line 151
    goto :goto_4

    .line 152
    :cond_5
    move v3, v2

    .line 153
    :goto_4
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFallsFeedFrag;->p5(Z)V

    .line 154
    .line 155
    .line 156
    :cond_6
    :goto_5
    add-int/lit8 v0, v0, 0x1

    .line 157
    .line 158
    goto :goto_1

    .line 159
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 160
    .line 161
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->J5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Z)V

    .line 162
    .line 163
    .line 164
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 165
    .line 166
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 167
    .line 168
    .line 169
    move-result-object v0

    .line 170
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 171
    .line 172
    .line 173
    if-ne p1, v3, :cond_8

    .line 174
    .line 175
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 176
    .line 177
    iget-object p1, p1, Ll/jka;->Y0:Lrx/subjects/a;

    .line 178
    .line 179
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 180
    .line 181
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 185
    .line 186
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->r7()V

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public p(Ljava/util/List;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;->L5(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumFrag$d;->a:Ljava/util/List;

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
