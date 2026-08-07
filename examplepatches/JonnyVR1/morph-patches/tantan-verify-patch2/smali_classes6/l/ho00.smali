.class public Ll/ho00;
.super Ll/fo00;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/fo00<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/fo00;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-nez p0, :cond_1

    .line 13
    .line 14
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 17
    .line 18
    const-string v0, "activity_id"

    .line 19
    .line 20
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 27
    .line 28
    const-string v1, "activity_name"

    .line 29
    .line 30
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v1, "moment_show_type"

    .line 35
    .line 36
    const-string v2, "card"

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "moments_user_id"

    .line 43
    .line 44
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    filled-new-array {p0, v0, v1, p1}, [Ll/pf60;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "e_activity_moment"

    .line 55
    .line 56
    const-string v0, "p_user_moment_interactions_details_view"

    .line 57
    .line 58
    invoke-static {p1, v0, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public bridge synthetic c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/ho00;->i(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fo00;->c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    sget v0, Ll/tec0;->b1:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {p2, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    instance-of v0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    move-object v1, p2

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;

    .line 27
    .line 28
    iget-object p2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->e:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    sget v0, Ll/fo00;->e:I

    .line 31
    .line 32
    const/high16 v2, 0x42000000    # 32.0f

    .line 33
    .line 34
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    const/4 v4, 0x0

    .line 39
    invoke-virtual {p2, v0, v4, v3, v4}, Landroid/view/View;->setPadding(IIII)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Ll/bnl0;->y0()I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    sub-int/2addr p2, v0

    .line 47
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    sub-int/2addr p2, v0

    .line 52
    invoke-virtual {v1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->n(I)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1, v4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->setNeedInnerClick(Z)V

    .line 56
    .line 57
    .line 58
    const/4 v5, 0x0

    .line 59
    const-string v6, "p_user_moment_interactions_details_view"

    .line 60
    .line 61
    const/4 v2, 0x0

    .line 62
    const-string v4, ""

    .line 63
    .line 64
    move-object v3, p3

    .line 65
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->l(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    invoke-direct {p0, v3}, Ll/ho00;->h(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    return-void
.end method
