.class public Ll/fsh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/dsh;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/view/View;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

.field public e:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

.field public f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

.field public g:Ll/hi80;

.field public h:Lcom/p1/mobile/android/app/Act;

.field public i:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

.field public j:Ll/dsh;

.field public k:Ll/g6m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/g6m<",
            "Ll/frh$a;",
            "Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fsh;->i:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/fsh;->h:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ll/fsh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/fsh;->l(Landroid/view/View;)V

    return-void
.end method

.method private j()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fsh;->c:Lv/navigationbar/VNavigationBar;

    .line 2
    .line 3
    new-instance v1, Ll/esh;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/esh;-><init>(Ll/fsh;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/fsh;->c:Lv/navigationbar/VNavigationBar;

    .line 12
    .line 13
    sget v1, Ll/dbc0;->P:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/fsh;->c:Lv/navigationbar/VNavigationBar;

    .line 19
    .line 20
    const-string v0, "\u9644\u8fd1\u7684\u4eba"

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lv/navigationbar/VNavigationBar;->setTitle(Ljava/lang/CharSequence;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method private synthetic l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/fsh;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fsh;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fsh;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Ll/dsh;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fsh;->j:Ll/dsh;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fsh;->j:Ll/dsh;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/dsh;->s0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Ll/fsh;->g:Ll/hi80;

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    iget-object v1, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 14
    .line 15
    if-eqz v1, :cond_3

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/hi80;->f()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    iget-object v0, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->d()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    instance-of v1, v0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    check-cast v0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->B:Ll/ji80;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v0, 0x0

    .line 40
    :goto_0
    if-nez v0, :cond_2

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    iget-object v1, p0, Ll/fsh;->j:Ll/dsh;

    .line 44
    .line 45
    iget-object v0, v0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Ll/dsh;->x0(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    iget-object p0, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 56
    .line 57
    sget-object v0, Lcom/p1/mobile/putong/core/data/SwipeDirection;->RIGHT:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->A(Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    :goto_1
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsh;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/fsh;->h:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/fsh;->h:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public f()Ll/hi80;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsh;->g:Ll/hi80;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/dsh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fsh;->b(Ll/dsh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/kec0;->O8:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/fsh;->a:Landroid/view/View;

    .line 9
    .line 10
    sget p2, Ll/adc0;->S0:I

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroid/widget/FrameLayout;

    .line 17
    .line 18
    iput-object p1, p0, Ll/fsh;->b:Landroid/widget/FrameLayout;

    .line 19
    .line 20
    iget-object p1, p0, Ll/fsh;->a:Landroid/view/View;

    .line 21
    .line 22
    sget p2, Ll/adc0;->N8:I

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Lv/navigationbar/VNavigationBar;

    .line 29
    .line 30
    iput-object p1, p0, Ll/fsh;->c:Lv/navigationbar/VNavigationBar;

    .line 31
    .line 32
    iget-object p1, p0, Ll/fsh;->a:Landroid/view/View;

    .line 33
    .line 34
    sget p2, Ll/adc0;->O6:I

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    check-cast p1, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 41
    .line 42
    iput-object p1, p0, Ll/fsh;->d:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 43
    .line 44
    iget-object p1, p0, Ll/fsh;->a:Landroid/view/View;

    .line 45
    .line 46
    sget p2, Ll/adc0;->Cb:I

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 53
    .line 54
    iput-object p1, p0, Ll/fsh;->e:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 55
    .line 56
    iget-object p1, p0, Ll/fsh;->d:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 57
    .line 58
    const/4 p2, 0x1

    .line 59
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->d(I)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/fsh;->e:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 63
    .line 64
    const/4 p2, 0x2

    .line 65
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->d(I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Ll/fsh;->d:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 69
    .line 70
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ll/fsh;->e:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 74
    .line 75
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Ll/fsh;->a:Landroid/view/View;

    .line 79
    .line 80
    return-object p0
.end method

.method public final k()V
    .locals 5

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fsh;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;-><init>(Landroid/content/Context;Ll/fsh;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/fsh;->b:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    iget-object v2, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 24
    .line 25
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 26
    .line 27
    const/4 v4, -0x1

    .line 28
    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v2, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 32
    .line 33
    .line 34
    new-instance v0, Ll/hi80;

    .line 35
    .line 36
    iget-object v1, p0, Ll/fsh;->i:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 37
    .line 38
    iget-object v2, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 39
    .line 40
    invoke-direct {v0, v1, v2}, Ll/hi80;-><init>(Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/fsh;->g:Ll/hi80;

    .line 44
    .line 45
    iget-object p0, p0, Ll/fsh;->f:Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/poi/bifrost/PoiTraceCardStack;->setAdapter(Ll/nx2;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public m(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;Z)Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;
    .locals 9

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->B:Ll/ji80;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x0

    .line 12
    :goto_0
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->back:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object v1, p0, Ll/fsh;->j:Ll/dsh;

    .line 18
    .line 19
    iget-object v2, v0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ll/dsh;->x0(Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_2

    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;->pass:Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    iget-object v1, p0, Ll/fsh;->k:Ll/g6m;

    .line 33
    .line 34
    if-nez v1, :cond_3

    .line 35
    .line 36
    new-instance v1, Ll/frh;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/frh;-><init>()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Ll/fsh;->k:Ll/g6m;

    .line 42
    .line 43
    :cond_3
    iget-object v1, p0, Ll/fsh;->k:Ll/g6m;

    .line 44
    .line 45
    new-instance v2, Ll/frh$a;

    .line 46
    .line 47
    invoke-virtual {p0}, Ll/fsh;->act()Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v4, v0, Ll/ji80;->b:Lcom/p1/mobile/putong/data/User;

    .line 52
    .line 53
    iget-object v8, p0, Ll/fsh;->i:Lcom/p1/mobile/putong/core/newui/poi/FeedPoiTraceFrag;

    .line 54
    .line 55
    move-object v5, p1

    .line 56
    move-object v6, p2

    .line 57
    move v7, p3

    .line 58
    invoke-direct/range {v2 .. v8}, Ll/frh$a;-><init>(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/User;Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;ZLl/ttl;)V

    .line 59
    .line 60
    .line 61
    invoke-interface {v1, v2}, Ll/g6m;->a(Ll/e2m;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Lcom/p1/mobile/putong/core/card/VSwipeStack$OnCardSwipeResult;

    .line 66
    .line 67
    return-object p0
.end method

.method public n(FFF)V
    .locals 10

    .line 1
    const/4 p3, 0x0

    .line 2
    cmpl-float v0, p2, p3

    .line 3
    .line 4
    iget-object v1, p0, Ll/fsh;->d:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    const-wide v3, 0x3fd3333333333333L    # 0.3

    .line 8
    .line 9
    .line 10
    .line 11
    .line 12
    const/high16 v5, 0x3f800000    # 1.0f

    .line 13
    .line 14
    const v6, 0x3e99999a    # 0.3f

    .line 15
    .line 16
    .line 17
    const/4 v7, 0x1

    .line 18
    if-lez v0, :cond_2

    .line 19
    .line 20
    invoke-static {v1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/fsh;->d:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 27
    .line 28
    invoke-static {v0, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    cmpl-float v0, p2, v6

    .line 32
    .line 33
    iget-object v1, p0, Ll/fsh;->d:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 34
    .line 35
    if-ltz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->b(F)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    int-to-float p2, p2

    .line 42
    invoke-virtual {v1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    float-to-double v8, p2

    .line 47
    div-double/2addr v8, v3

    .line 48
    double-to-float p2, v8

    .line 49
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->b(F)I

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    int-to-float p2, p2

    .line 54
    invoke-virtual {v1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_2
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    :goto_0
    cmpl-float p2, p1, p3

    .line 62
    .line 63
    iget-object p3, p0, Ll/fsh;->e:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 64
    .line 65
    if-lez p2, :cond_5

    .line 66
    .line 67
    invoke-static {p3}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-nez p2, :cond_3

    .line 72
    .line 73
    iget-object p2, p0, Ll/fsh;->e:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 74
    .line 75
    invoke-static {p2, v7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    :cond_3
    cmpl-float p2, p1, v6

    .line 79
    .line 80
    iget-object p0, p0, Ll/fsh;->e:Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;

    .line 81
    .line 82
    if-ltz p2, :cond_4

    .line 83
    .line 84
    invoke-virtual {p0, v5}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->c(F)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    int-to-float p1, p1

    .line 89
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_4
    float-to-double p1, p1

    .line 94
    div-double/2addr p1, v3

    .line 95
    double-to-float p1, p1

    .line 96
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardBottomHintView;->c(F)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    int-to-float p1, p1

    .line 101
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_5
    invoke-static {p3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public p(Landroid/view/View;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardItemView;->B:Ll/ji80;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    :goto_0
    if-nez p1, :cond_1

    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    iget-object p0, p0, Ll/fsh;->j:Ll/dsh;

    .line 15
    .line 16
    new-instance v0, Ll/gsh;

    .line 17
    .line 18
    invoke-direct {v0, p1, p2}, Ll/gsh;-><init>(Ll/ji80;Lcom/p1/mobile/putong/core/data/SwipeDirection;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/dsh;->a:Ll/gsh;

    .line 22
    .line 23
    return-void
.end method

.method public q(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/ji80;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fsh;->g:Ll/hi80;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0, p1}, Ll/hi80;->o(Ljava/util/List;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fsh;->j()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fsh;->k()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
