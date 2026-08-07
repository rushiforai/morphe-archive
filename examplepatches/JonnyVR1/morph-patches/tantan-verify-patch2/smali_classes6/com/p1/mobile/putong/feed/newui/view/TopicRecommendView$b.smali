.class public Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;
.super Ll/lb2;
.source "SourceFile"

# interfaces
.implements Landroidx/viewpager/widget/ViewPager$j;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->e:Ljava/util/List;

    .line 12
    .line 13
    new-instance p1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->H(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 p0, -0x2

    return p0
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

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
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

.method public onPageScrollStateChanged(I)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 4
    .line 5
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->B(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Ll/h80;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/h80;->o()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->M(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 7
    .line 8
    add-int/lit8 v1, p1, 0x1

    .line 9
    .line 10
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->L(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;I)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->P(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->b0(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 23
    .line 24
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->Q(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;I)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->O(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Lcom/p1/mobile/android/app/Act;

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
    sget v1, Ll/tec0;->B3:I

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
    move-object v1, v0

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;

    .line 20
    .line 21
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->q(I)Lcom/p1/mobile/putong/feed/data/CategoryTopic;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->r(I)Lcom/p1/mobile/putong/feed/data/CategoryTopic;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->e:Ljava/util/List;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 32
    .line 33
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->I(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    add-int/lit8 v6, p2, 0x1

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->B(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)Ll/h80;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    invoke-virtual/range {v1 .. v7}, Lcom/p1/mobile/putong/feed/newui/view/TopicBannerItemView;->S(Lcom/p1/mobile/putong/feed/data/CategoryTopic;Lcom/p1/mobile/putong/feed/data/CategoryTopic;Ljava/util/List;IILl/h80;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    return-object v1
.end method

.method public final q(I)Lcom/p1/mobile/putong/feed/data/CategoryTopic;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->q(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    mul-int/2addr v0, p1

    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v0, v2, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->q(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    mul-int/2addr p0, p1

    .line 35
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    check-cast p0, Lcom/p1/mobile/putong/feed/data/CategoryTopic;

    .line 40
    .line 41
    return-object p0

    .line 42
    :cond_1
    return-object v1
.end method

.method public final r(I)Lcom/p1/mobile/putong/feed/data/CategoryTopic;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->q(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    mul-int/2addr v0, p1

    .line 18
    add-int/lit8 v0, v0, 0x1

    .line 19
    .line 20
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    if-ge v0, v2, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->g:Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;->q(Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView;)I

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    mul-int/2addr p0, p1

    .line 37
    add-int/lit8 p0, p0, 0x1

    .line 38
    .line 39
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    check-cast p0, Lcom/p1/mobile/putong/feed/data/CategoryTopic;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    return-object v1
.end method

.method public s(Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/CategoryTopic;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->e:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/TopicRecommendView$b;->e:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/cf60;->notifyDataSetChanged()V

    .line 22
    .line 23
    .line 24
    return-void
.end method
