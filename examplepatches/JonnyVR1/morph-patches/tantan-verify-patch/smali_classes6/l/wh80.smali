.class public Ll/wh80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/s2m;


# instance fields
.field public a:Lcom/p1/mobile/android/app/Act;

.field public b:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public c:Ll/s8h;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

.field public e:Ll/soh;

.field public f:Ll/joh;

.field public g:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/joh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wh80;->a:Lcom/p1/mobile/android/app/Act;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wh80;->f:Ll/joh;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/wh80;->d()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private f()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public L0()Ll/n570;
    .locals 3

    .line 1
    new-instance v0, Ll/soh;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    iget-object v2, p0, Ll/wh80;->f:Ll/joh;

    .line 6
    .line 7
    invoke-virtual {v2}, Ll/joh;->j()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v0, v1, p0, v2}, Ll/soh;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Ll/wh80;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Ll/wh80;->e:Ll/soh;

    .line 15
    .line 16
    return-object v0
.end method

.method public X0()Ll/s8h;
    .locals 3

    .line 1
    new-instance v0, Ll/s8h;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wh80;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/s8h;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/wh80;->c:Ll/s8h;

    .line 9
    .line 10
    new-instance v0, Landroid/widget/LinearLayout;

    .line 11
    .line 12
    iget-object v1, p0, Ll/wh80;->a:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/wh80;->b()Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/wh80;->c()Landroid/widget/RelativeLayout;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, p0, Ll/wh80;->c:Ll/s8h;

    .line 36
    .line 37
    invoke-virtual {v2, v0}, Ll/zzk;->H(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/wh80;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s0(I)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/wh80;->c:Ll/s8h;

    .line 46
    .line 47
    return-object p0
.end method

.method public a()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wh80;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;->Q()V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/wh80;->f:Ll/joh;

    .line 10
    .line 11
    iget-object p0, p0, Ll/joh;->m:Lv/VLinear_FillerMeasure;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b()Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wh80;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/tec0;->q2:I

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;

    .line 15
    .line 16
    iput-object v0, p0, Ll/wh80;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;

    .line 17
    .line 18
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    const/4 v2, -0x2

    .line 22
    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 23
    .line 24
    .line 25
    sget v1, Ll/qa00;->j:I

    .line 26
    .line 27
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 28
    .line 29
    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 30
    .line 31
    iget-object v1, p0, Ll/wh80;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;

    .line 32
    .line 33
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Ll/wh80;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/poi/view/FeedPoiNearbyUsesEnterView;

    .line 37
    .line 38
    return-object p0
.end method

.method public c()Landroid/widget/RelativeLayout;
    .locals 4

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wh80;->a:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->G:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/wh80;->a:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    sget v2, Ll/k9c0;->A:I

    .line 20
    .line 21
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 26
    .line 27
    .line 28
    const/high16 v1, 0x41700000    # 15.0f

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 39
    .line 40
    .line 41
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 42
    .line 43
    const/4 v2, -0x2

    .line 44
    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 45
    .line 46
    .line 47
    const/16 v3, 0xf

    .line 48
    .line 49
    invoke-virtual {v1, v3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Landroid/widget/RelativeLayout;

    .line 56
    .line 57
    iget-object p0, p0, Ll/wh80;->a:Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 60
    .line 61
    .line 62
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 63
    .line 64
    const/4 v3, -0x1

    .line 65
    invoke-direct {p0, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 66
    .line 67
    .line 68
    sget v2, Ll/qa00;->j:I

    .line 69
    .line 70
    iput v2, p0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 71
    .line 72
    sget v2, Ll/qa00;->o:I

    .line 73
    .line 74
    iput v2, p0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 75
    .line 76
    sget v2, Ll/qa00;->d:I

    .line 77
    .line 78
    iput v2, p0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 79
    .line 80
    invoke-virtual {v1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 84
    .line 85
    .line 86
    return-object v1
.end method

.method public final d()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/wh80;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "PhotoAlbumBaseFrag"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 14
    .line 15
    iput-object v0, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v2, 0x1

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Ll/wh80;->f()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    const/16 v8, 0x14

    .line 47
    .line 48
    const/4 v9, 0x0

    .line 49
    const/4 v3, 0x0

    .line 50
    const-string v5, "from_poi_aggregation"

    .line 51
    .line 52
    const/4 v6, -0x1

    .line 53
    const-string v7, "-1"

    .line 54
    .line 55
    invoke-static/range {v3 .. v9}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->N4(ZLjava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    iput-object v0, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 60
    .line 61
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->k5(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v0, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 67
    .line 68
    .line 69
    invoke-direct {p0}, Ll/wh80;->f()V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Ll/wh80;->a:Lcom/p1/mobile/android/app/Act;

    .line 73
    .line 74
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->getSupportFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget v2, Ll/hdc0;->W0:I

    .line 83
    .line 84
    iget-object p0, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 85
    .line 86
    invoke-virtual {v0, v2, p0, v1}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v0}, Landroidx/fragment/app/k;->j()I

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/feed/data/PoiLocation;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wh80;->f:Ll/joh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/joh;->p(Lcom/p1/mobile/putong/feed/data/PoiLocation;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public n1(Ljava/util/List;ZLcom/p1/mobile/putong/data/User;I)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;",
            ">;Z",
            "Lcom/p1/mobile/putong/data/User;",
            "I)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public p()V
    .locals 0

    .line 1
    return-void
.end method

.method public s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
    .locals 7

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wh80;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;

    .line 4
    .line 5
    iget-object v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 6
    .line 7
    iget-object v2, v2, Ll/y670;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const/16 v5, 0x14

    .line 18
    .line 19
    const/4 v6, 0x0

    .line 20
    const-string v4, "from_poi_aggregation"

    .line 21
    .line 22
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/wh80;->b:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 26
    .line 27
    return-object v0
.end method
