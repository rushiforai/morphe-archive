.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;
.super Landroidx/fragment/app/FragmentPagerAdapter;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;
.implements Ll/w0m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
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

.field public final synthetic d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Landroidx/fragment/app/FragmentManager;)V
    .locals 3

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->b:Ljava/lang/reflect/Method;

    .line 15
    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->c:Landroidx/fragment/app/FragmentManager;

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
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->b:Ljava/lang/reflect/Method;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->b:Ljava/lang/reflect/Method;

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_1
    invoke-static {p2}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->b:Ljava/lang/reflect/Method;

    .line 55
    .line 56
    :goto_2
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;ILandroid/widget/TextView;Lv/VImage;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->p(ILandroid/widget/TextView;Lv/VImage;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->o()V

    return-void
.end method

.method private synthetic p(ILandroid/widget/TextView;Lv/VImage;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->F5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ne v0, p1, :cond_2

    .line 8
    .line 9
    invoke-static {}, Ll/pu20;->q()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    invoke-static {v0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_2

    .line 44
    .line 45
    :cond_0
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 54
    .line 55
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->H5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result p2

    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 64
    .line 65
    if-eqz p2, :cond_1

    .line 66
    .line 67
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->I5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p2

    .line 71
    invoke-virtual {p3, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 75
    .line 76
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    sget v0, Ll/lbc0;->I0:I

    .line 81
    .line 82
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-virtual {p3, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->H5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    invoke-virtual {p3, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 98
    .line 99
    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    sget v0, Ll/lbc0;->J0:I

    .line 104
    .line 105
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p3, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 110
    .line 111
    .line 112
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 113
    .line 114
    invoke-static {p2, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->g6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 118
    .line 119
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->F5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)I

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    if-eq p2, p1, :cond_3

    .line 124
    .line 125
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 126
    .line 127
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 128
    .line 129
    invoke-virtual {p2, p1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p2, p1}, Lv/navigationbar/VNavigationTabLayout;->D(Lv/navigationbar/VNavigationTabLayout$f;)V

    .line 134
    .line 135
    .line 136
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->u6()V

    .line 139
    .line 140
    .line 141
    return-void
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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-ge p1, v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->U5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/util/List;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->c:Landroidx/fragment/app/FragmentManager;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->c:Landroidx/fragment/app/FragmentManager;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

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

.method public m(I)Landroidx/fragment/app/Fragment;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->b:Ljava/lang/reflect/Method;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 11
    .line 12
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->A:Lcom/p1/mobile/putong/feed/newui/photoalbum/DiscoveryPager;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getItem(I)Landroidx/fragment/app/Fragment;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :cond_1
    return-object v0
.end method

.method public n(I)Landroid/view/View;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    sget v3, Ll/lbc0;->J0:I

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
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 42
    .line 43
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->H5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    invoke-static {}, Ll/cmg;->t()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_0

    .line 55
    .line 56
    if-nez p1, :cond_0

    .line 57
    .line 58
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 59
    .line 60
    invoke-static {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->N5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)[Lv/VImage;

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
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 84
    .line 85
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->S5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    aput-object v2, v4, p1

    .line 90
    .line 91
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 92
    .line 93
    invoke-static {v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->T5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    aput-object v3, v4, p1

    .line 98
    .line 99
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 100
    .line 101
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->R5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)[Landroid/widget/ImageView;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 116
    .line 117
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->U5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/util/List;

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
    invoke-static {}, Ll/cmg;->t()Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-eqz v3, :cond_1

    .line 135
    .line 136
    return-object v0

    .line 137
    :cond_1
    new-instance v3, Ll/v940;

    .line 138
    .line 139
    invoke-direct {v3, p0, p1, v2, v1}, Ll/v940;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;ILandroid/widget/TextView;Lv/VImage;)V

    .line 140
    .line 141
    .line 142
    invoke-static {v2, v3}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 143
    .line 144
    .line 145
    return-object v0
.end method

.method public final o()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->G:Lv/navigationbar/VNavigationTabLayout;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationTabLayout;->w(I)Lv/navigationbar/VNavigationTabLayout$f;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v0, v0, Lv/navigationbar/VNavigationTabLayout$f;->i:Lv/navigationbar/VNavigationTabLayout$TabView;

    .line 11
    .line 12
    invoke-static {}, Ll/cmg;->t()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-nez v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    invoke-virtual {v0}, Landroid/view/View;->getPaddingTop()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    const/high16 v4, 0x41700000    # 15.0f

    .line 27
    .line 28
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getPaddingBottom()I

    .line 33
    .line 34
    .line 35
    move-result v5

    .line 36
    invoke-virtual {v0, v2, v3, v4, v5}, Landroid/view/View;->setPadding(IIII)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 40
    .line 41
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->N5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)[Lv/VImage;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    aget-object v0, v0, v1

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 48
    .line 49
    .line 50
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/jka;->Pb()Ll/jfh;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 63
    .line 64
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->S5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    aget-object v1, v3, v1

    .line 69
    .line 70
    invoke-interface {v0, v2, v1}, Ll/jfh;->c(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;)V

    .line 71
    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/jka;->Pb()Ll/jfh;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 86
    .line 87
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->S5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)[Landroid/widget/TextView;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const/4 v2, 0x1

    .line 92
    aget-object p0, p0, v2

    .line 93
    .line 94
    invoke-interface {v0, v1, p0}, Ll/jfh;->m(Lcom/p1/mobile/android/app/Act;Landroid/widget/TextView;)V

    .line 95
    .line 96
    .line 97
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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->m(I)Landroidx/fragment/app/Fragment;

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
    move-object v1, v0

    .line 35
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Q4()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_1

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 48
    .line 49
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-interface {v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->jg(Lcom/p1/mobile/android/app/Act;Z)V

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
    move-result-object v1

    .line 61
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 62
    .line 63
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    invoke-interface {v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_2
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;

    .line 72
    .line 73
    if-eqz v1, :cond_4

    .line 74
    .line 75
    move-object v1, v0

    .line 76
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->R4()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 89
    .line 90
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-interface {v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->jg(Lcom/p1/mobile/android/app/Act;Z)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 103
    .line 104
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    invoke-interface {v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_4
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 113
    .line 114
    if-eqz v1, :cond_6

    .line 115
    .line 116
    move-object v1, v0

    .line 117
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 118
    .line 119
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->B5()Z

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    if-eqz v1, :cond_5

    .line 124
    .line 125
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 130
    .line 131
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-interface {v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->jg(Lcom/p1/mobile/android/app/Act;Z)V

    .line 136
    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_5
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 144
    .line 145
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-interface {v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 150
    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 158
    .line 159
    invoke-virtual {v3}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    invoke-interface {v1, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 164
    .line 165
    .line 166
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 167
    .line 168
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->f6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 172
    .line 173
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->h6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)V

    .line 174
    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 177
    .line 178
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->d6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)V

    .line 179
    .line 180
    .line 181
    invoke-static {}, Ll/pu20;->r()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 186
    .line 187
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 188
    .line 189
    .line 190
    move-result-object v3

    .line 191
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result v1

    .line 199
    if-eqz v1, :cond_7

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 202
    .line 203
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->L5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->Y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Ll/l4g0;)V

    .line 208
    .line 209
    .line 210
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 211
    .line 212
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->e6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Landroidx/fragment/app/Fragment;)V

    .line 213
    .line 214
    .line 215
    goto/16 :goto_1

    .line 216
    .line 217
    :cond_7
    invoke-static {}, Ll/cmg;->t()Z

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    if-eqz v1, :cond_a

    .line 222
    .line 223
    invoke-static {}, Ll/pu20;->p()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 228
    .line 229
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->b6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    if-eqz v1, :cond_8

    .line 238
    .line 239
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 240
    .line 241
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->J5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 242
    .line 243
    .line 244
    move-result-object v3

    .line 245
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->Y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Ll/l4g0;)V

    .line 246
    .line 247
    .line 248
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 249
    .line 250
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->e6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Landroidx/fragment/app/Fragment;)V

    .line 251
    .line 252
    .line 253
    goto/16 :goto_1

    .line 254
    .line 255
    :cond_8
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 260
    .line 261
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->b6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    if-eqz v0, :cond_9

    .line 270
    .line 271
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 272
    .line 273
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->M5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 274
    .line 275
    .line 276
    move-result-object v1

    .line 277
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->Y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Ll/l4g0;)V

    .line 278
    .line 279
    .line 280
    goto/16 :goto_1

    .line 281
    .line 282
    :cond_9
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 287
    .line 288
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->b6(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    if-eqz v0, :cond_d

    .line 297
    .line 298
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 299
    .line 300
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->O5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->Y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Ll/l4g0;)V

    .line 305
    .line 306
    .line 307
    goto :goto_1

    .line 308
    :cond_a
    invoke-static {}, Ll/pu20;->q()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 313
    .line 314
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 315
    .line 316
    .line 317
    move-result-object v1

    .line 318
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 319
    .line 320
    .line 321
    move-result-object v1

    .line 322
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    move-result v0

    .line 326
    if-eqz v0, :cond_b

    .line 327
    .line 328
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 329
    .line 330
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->J5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->Y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Ll/l4g0;)V

    .line 335
    .line 336
    .line 337
    goto :goto_1

    .line 338
    :cond_b
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 343
    .line 344
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 345
    .line 346
    .line 347
    move-result-object v1

    .line 348
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    if-eqz v0, :cond_c

    .line 357
    .line 358
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 359
    .line 360
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->M5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->Y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Ll/l4g0;)V

    .line 365
    .line 366
    .line 367
    goto :goto_1

    .line 368
    :cond_c
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 369
    .line 370
    .line 371
    move-result-object v0

    .line 372
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 373
    .line 374
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 375
    .line 376
    .line 377
    move-result-object v1

    .line 378
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 379
    .line 380
    .line 381
    move-result-object v1

    .line 382
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    if-eqz v0, :cond_d

    .line 387
    .line 388
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 389
    .line 390
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->O5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 391
    .line 392
    .line 393
    move-result-object v1

    .line 394
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->Y5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Ll/l4g0;)V

    .line 395
    .line 396
    .line 397
    :cond_d
    :goto_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 398
    .line 399
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->K5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Z

    .line 400
    .line 401
    .line 402
    move-result v0

    .line 403
    if-nez v0, :cond_12

    .line 404
    .line 405
    invoke-static {}, Ll/pu20;->q()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 410
    .line 411
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 412
    .line 413
    .line 414
    move-result-object v1

    .line 415
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 416
    .line 417
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->F5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)I

    .line 418
    .line 419
    .line 420
    move-result v3

    .line 421
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 422
    .line 423
    .line 424
    move-result-object v1

    .line 425
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-eqz v0, :cond_e

    .line 430
    .line 431
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 432
    .line 433
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->J5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 434
    .line 435
    .line 436
    move-result-object v0

    .line 437
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 438
    .line 439
    .line 440
    goto :goto_2

    .line 441
    :cond_e
    invoke-static {}, Ll/pu20;->h()Ljava/lang/String;

    .line 442
    .line 443
    .line 444
    move-result-object v0

    .line 445
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 446
    .line 447
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 448
    .line 449
    .line 450
    move-result-object v1

    .line 451
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 452
    .line 453
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->F5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)I

    .line 454
    .line 455
    .line 456
    move-result v3

    .line 457
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 458
    .line 459
    .line 460
    move-result-object v1

    .line 461
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 462
    .line 463
    .line 464
    move-result v0

    .line 465
    if-eqz v0, :cond_f

    .line 466
    .line 467
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 468
    .line 469
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->M5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 470
    .line 471
    .line 472
    move-result-object v0

    .line 473
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 474
    .line 475
    .line 476
    goto :goto_2

    .line 477
    :cond_f
    invoke-static {}, Ll/pu20;->i()Ljava/lang/String;

    .line 478
    .line 479
    .line 480
    move-result-object v0

    .line 481
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 482
    .line 483
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 484
    .line 485
    .line 486
    move-result-object v1

    .line 487
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 488
    .line 489
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->F5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)I

    .line 490
    .line 491
    .line 492
    move-result v3

    .line 493
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 494
    .line 495
    .line 496
    move-result-object v1

    .line 497
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 498
    .line 499
    .line 500
    move-result v0

    .line 501
    if-eqz v0, :cond_10

    .line 502
    .line 503
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 504
    .line 505
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->O5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 506
    .line 507
    .line 508
    move-result-object v0

    .line 509
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 510
    .line 511
    .line 512
    goto :goto_2

    .line 513
    :cond_10
    invoke-static {}, Ll/pu20;->r()Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object v0

    .line 517
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 518
    .line 519
    invoke-static {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->E5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;

    .line 520
    .line 521
    .line 522
    move-result-object v1

    .line 523
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 524
    .line 525
    invoke-static {v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->F5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)I

    .line 526
    .line 527
    .line 528
    move-result v3

    .line 529
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->getPageTitle(I)Ljava/lang/CharSequence;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 534
    .line 535
    .line 536
    move-result v0

    .line 537
    if-eqz v0, :cond_11

    .line 538
    .line 539
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 540
    .line 541
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->L5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 542
    .line 543
    .line 544
    move-result-object v0

    .line 545
    invoke-virtual {v0}, Ll/l4g0;->g()V

    .line 546
    .line 547
    .line 548
    :cond_11
    :goto_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 549
    .line 550
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->G5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;)Ll/l4g0;

    .line 551
    .line 552
    .line 553
    move-result-object v0

    .line 554
    invoke-virtual {v0}, Ll/l4g0;->r()V

    .line 555
    .line 556
    .line 557
    goto :goto_3

    .line 558
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 559
    .line 560
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->W5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Z)V

    .line 561
    .line 562
    .line 563
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 564
    .line 565
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->V5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;I)V

    .line 566
    .line 567
    .line 568
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 569
    .line 570
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->L:Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;

    .line 571
    .line 572
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->B6()Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object v0

    .line 576
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/redpointview/FeedRedDotView;->setPageId(Ljava/lang/String;)V

    .line 577
    .line 578
    .line 579
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 580
    .line 581
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 582
    .line 583
    .line 584
    move-result-object v0

    .line 585
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 586
    .line 587
    .line 588
    move-result-object v0

    .line 589
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 590
    .line 591
    .line 592
    move-result-object v0

    .line 593
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->u(Landroid/view/View;Z)V

    .line 594
    .line 595
    .line 596
    move v0, v2

    .line 597
    :goto_4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

    .line 598
    .line 599
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 600
    .line 601
    .line 602
    move-result v1

    .line 603
    const/4 v3, 0x1

    .line 604
    if-ge v0, v1, :cond_1c

    .line 605
    .line 606
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->m(I)Landroidx/fragment/app/Fragment;

    .line 607
    .line 608
    .line 609
    move-result-object v1

    .line 610
    instance-of v4, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 611
    .line 612
    if-eqz v4, :cond_15

    .line 613
    .line 614
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 615
    .line 616
    if-ne v0, p1, :cond_13

    .line 617
    .line 618
    move v4, v3

    .line 619
    goto :goto_5

    .line 620
    :cond_13
    move v4, v2

    .line 621
    :goto_5
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->h5(Z)V

    .line 622
    .line 623
    .line 624
    if-ne v0, p1, :cond_14

    .line 625
    .line 626
    goto :goto_6

    .line 627
    :cond_14
    move v3, v2

    .line 628
    :goto_6
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->g5(Z)V

    .line 629
    .line 630
    .line 631
    if-ne v0, p1, :cond_1b

    .line 632
    .line 633
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->Z4()V

    .line 634
    .line 635
    .line 636
    goto :goto_b

    .line 637
    :cond_15
    instance-of v4, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;

    .line 638
    .line 639
    if-eqz v4, :cond_18

    .line 640
    .line 641
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;

    .line 642
    .line 643
    if-ne v0, p1, :cond_16

    .line 644
    .line 645
    move v4, v3

    .line 646
    goto :goto_7

    .line 647
    :cond_16
    move v4, v2

    .line 648
    :goto_7
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->a5(Z)V

    .line 649
    .line 650
    .line 651
    if-ne v0, p1, :cond_17

    .line 652
    .line 653
    goto :goto_8

    .line 654
    :cond_17
    move v3, v2

    .line 655
    :goto_8
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->Z4(Z)V

    .line 656
    .line 657
    .line 658
    if-ne v0, p1, :cond_1b

    .line 659
    .line 660
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedContainerFrag;->W4()V

    .line 661
    .line 662
    .line 663
    goto :goto_b

    .line 664
    :cond_18
    instance-of v4, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 665
    .line 666
    if-eqz v4, :cond_1b

    .line 667
    .line 668
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;

    .line 669
    .line 670
    if-ne v0, p1, :cond_19

    .line 671
    .line 672
    move v4, v3

    .line 673
    goto :goto_9

    .line 674
    :cond_19
    move v4, v2

    .line 675
    :goto_9
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->d6(Z)V

    .line 676
    .line 677
    .line 678
    if-ne v0, p1, :cond_1a

    .line 679
    .line 680
    goto :goto_a

    .line 681
    :cond_1a
    move v3, v2

    .line 682
    :goto_a
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->c6(Z)V

    .line 683
    .line 684
    .line 685
    if-ne v0, p1, :cond_1b

    .line 686
    .line 687
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/FriendsFeedViewPagerFrag;->W5()V

    .line 688
    .line 689
    .line 690
    :cond_1b
    :goto_b
    add-int/lit8 v0, v0, 0x1

    .line 691
    .line 692
    goto :goto_4

    .line 693
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 694
    .line 695
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 696
    .line 697
    .line 698
    move-result-object v0

    .line 699
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->hideInput()V

    .line 700
    .line 701
    .line 702
    if-ne p1, v3, :cond_1d

    .line 703
    .line 704
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 705
    .line 706
    iget-object p1, p1, Ll/jka;->Y0:Lrx/subjects/a;

    .line 707
    .line 708
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 709
    .line 710
    invoke-virtual {p1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 711
    .line 712
    .line 713
    :cond_1d
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 714
    .line 715
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->u6()V

    .line 716
    .line 717
    .line 718
    return-void
.end method

.method public q()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->c:Landroidx/fragment/app/FragmentManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->c:Landroidx/fragment/app/FragmentManager;

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

.method public r(Ljava/util/List;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;->X5(Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/discovery/NewPhotoAlbumFrag$b;->a:Ljava/util/List;

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
