.class public Ll/g9h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/b9h;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public b:Lv/navigationbar/VNavigationBar;

.field public c:Landroid/widget/FrameLayout;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public e:Ll/b9h;

.field public f:Lv/VFrame;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Ll/keh;

.field public j:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/leh;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/leh;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/g9h;->i:Ll/keh;

    .line 10
    .line 11
    new-instance v0, Ll/c9h;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/c9h;-><init>(Ll/g9h;)V

    .line 14
    .line 15
    .line 16
    const/16 v1, 0x190

    .line 17
    .line 18
    invoke-static {v1, v0}, Ll/dmk0;->a(ILl/y20;)Ll/y20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Ll/g9h;->j:Ll/y20;

    .line 23
    .line 24
    iput-object p1, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/android/app/c;->e:Lcom/p1/mobile/android/app/c;

    .line 2
    .line 3
    return-void
.end method

.method public static synthetic b(Ll/g9h;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9h;->n(Landroid/content/Intent;)V

    return-void
.end method

.method public static synthetic c(Ll/g9h;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9h;->m(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Ll/g9h;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/g9h;->l(Landroid/view/View;)V

    return-void
.end method

.method private i()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "PhotoAlbumFeedBaseFrag"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 14
    .line 15
    iput-object v0, p0, Ll/g9h;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const-string v2, "-1"

    .line 33
    .line 34
    const/16 v3, 0xb

    .line 35
    .line 36
    const-string v4, "from_nearby_online"

    .line 37
    .line 38
    const/4 v5, -0x1

    .line 39
    invoke-static {v0, v4, v5, v2, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->M4(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;I)Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object p0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 44
    .line 45
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget v2, Ll/hdc0;->g:I

    .line 54
    .line 55
    invoke-virtual {p0, v2, v0, v1}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroidx/fragment/app/k;->j()I

    .line 59
    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/h9h;->b(Ll/g9h;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f(Ll/b9h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/g9h;->e:Ll/b9h;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/b9h;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/g9h;->f(Ll/b9h;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/g9h;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/g9h;->b:Lv/navigationbar/VNavigationBar;

    .line 6
    .line 7
    iget-object v0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->R0:I

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/g9h;->b:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    iget-object v0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    invoke-virtual {p2, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 23
    .line 24
    .line 25
    new-instance p2, Lv/VFrame;

    .line 26
    .line 27
    iget-object v0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    invoke-direct {p2, v0}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 30
    .line 31
    .line 32
    iput-object p2, p0, Ll/g9h;->f:Lv/VFrame;

    .line 33
    .line 34
    new-instance p2, Lv/VText;

    .line 35
    .line 36
    iget-object v0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    invoke-direct {p2, v0}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    iput-object p2, p0, Ll/g9h;->g:Lv/VText;

    .line 42
    .line 43
    iget-object v0, p0, Ll/g9h;->f:Lv/VFrame;

    .line 44
    .line 45
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 46
    .line 47
    const/4 v2, -0x2

    .line 48
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0, p2, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 52
    .line 53
    .line 54
    iget-object p2, p0, Ll/g9h;->g:Lv/VText;

    .line 55
    .line 56
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->G1:I

    .line 57
    .line 58
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(I)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Ll/g9h;->g:Lv/VText;

    .line 62
    .line 63
    const/high16 v0, 0x41400000    # 12.0f

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 66
    .line 67
    .line 68
    iget-object p2, p0, Ll/g9h;->g:Lv/VText;

    .line 69
    .line 70
    const/4 v0, -0x1

    .line 71
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 72
    .line 73
    .line 74
    iget-object p2, p0, Ll/g9h;->g:Lv/VText;

    .line 75
    .line 76
    const/4 v0, 0x3

    .line 77
    invoke-static {v0}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x1

    .line 82
    invoke-virtual {p2, v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 83
    .line 84
    .line 85
    iget-object p2, p0, Ll/g9h;->g:Lv/VText;

    .line 86
    .line 87
    const/high16 v0, 0x41200000    # 10.0f

    .line 88
    .line 89
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    invoke-virtual {p2, v2, v3, v4, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 106
    .line 107
    .line 108
    iget-object p2, p0, Ll/g9h;->g:Lv/VText;

    .line 109
    .line 110
    sget v0, Ll/lbc0;->q5:I

    .line 111
    .line 112
    invoke-virtual {p2, v0}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 113
    .line 114
    .line 115
    iget-object p2, p0, Ll/g9h;->b:Lv/navigationbar/VNavigationBar;

    .line 116
    .line 117
    iget-object v0, p0, Ll/g9h;->f:Lv/VFrame;

    .line 118
    .line 119
    new-array v1, v1, [Landroid/view/View;

    .line 120
    .line 121
    const/4 v2, 0x0

    .line 122
    aput-object v0, v1, v2

    .line 123
    .line 124
    invoke-virtual {p2, v1}, Lv/navigationbar/VNavigationBar;->setRightIconViews([Landroid/view/View;)V

    .line 125
    .line 126
    .line 127
    iget-object p2, p0, Ll/g9h;->f:Lv/VFrame;

    .line 128
    .line 129
    invoke-virtual {p0, p2}, Ll/g9h;->j(Landroid/view/View;)V

    .line 130
    .line 131
    .line 132
    invoke-direct {p0}, Ll/g9h;->i()V

    .line 133
    .line 134
    .line 135
    return-object p1
.end method

.method public final j(Landroid/view/View;)V
    .locals 2

    .line 1
    const-string v0, "e_moment_post"

    .line 2
    .line 3
    const-string v1, "p_nearby_online"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance v0, Ll/d9h;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Ll/d9h;-><init>(Ll/g9h;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ll/e9h;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/e9h;-><init>(Ll/g9h;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public k()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/f9h;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/f9h;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic l(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/orb0;->I()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object p1, p0, Ll/g9h;->i:Ll/keh;

    .line 16
    .line 17
    iget-object v0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    iget-object p0, p0, Ll/g9h;->j:Ll/y20;

    .line 21
    .line 22
    const-string v2, "p_nearby_online"

    .line 23
    .line 24
    invoke-interface {p1, v0, v2, v1, p0}, Ll/keh;->a(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/newui/camera/momosdk/MusicContent;Ll/y20;)V

    .line 25
    .line 26
    .line 27
    const-string p0, "e_moment_post"

    .line 28
    .line 29
    invoke-static {p0, v2}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/l94;->e()Ll/l94;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Ll/l94;->j()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/mrb0;->C()Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailedOrRestrict()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/orb0;->I()V

    .line 13
    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    const-string p1, "e_moment_post"

    .line 17
    .line 18
    const-string v1, "p_nearby_online"

    .line 19
    .line 20
    invoke-static {p1, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/l94;->e()Ll/l94;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p1}, Ll/l94;->j()V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    new-array p1, p1, [Lcom/p1/mobile/putong/data/Media;

    .line 34
    .line 35
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const-string v1, "camera"

    .line 40
    .line 41
    invoke-static {p0, p1, v0, v1}, Ll/cn40;->k0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;ZLjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return v0
.end method

.method public final synthetic n(Landroid/content/Intent;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/g9h;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/16 v0, 0x312

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
