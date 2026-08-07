.class public Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Material;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic b:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->b:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cf60;-><init>()V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->a:Ljava/util/List;

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;Lcom/p1/mobile/putong/data/Material;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->k(Lcom/p1/mobile/putong/data/Material;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->a:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->b:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->c(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)Lcom/p1/mobile/android/app/Act;

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
    sget v1, Ll/tec0;->M:I

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
    sget v1, Ll/hdc0;->m0:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lv/VDraweeView;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->a:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Lcom/p1/mobile/putong/data/Material;

    .line 33
    .line 34
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 41
    .line 42
    iget-object v3, p2, Lcom/p1/mobile/putong/data/Material;->picture:Lcom/p1/mobile/putong/data/BannerPicture;

    .line 43
    .line 44
    iget-object v3, v3, Lcom/p1/mobile/putong/data/BannerPicture;->identifier:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v2, v1, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    new-instance v2, Ll/iqg;

    .line 50
    .line 51
    invoke-direct {v2, p0, p2}, Ll/iqg;-><init>(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;Lcom/p1/mobile/putong/data/Material;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/data/Material;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->b:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->b(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p2, v0}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    const-string v0, "activity_id"

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Material;->resourceID:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    filled-new-array {v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "e_moment_activity_banner"

    .line 31
    .line 32
    invoke-static {v1, p2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Material;->deeplink:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-nez p2, :cond_0

    .line 42
    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->b:Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->c(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-static {p0, p1}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method

.method public l(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Material;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView$c;->a:Ljava/util/List;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
