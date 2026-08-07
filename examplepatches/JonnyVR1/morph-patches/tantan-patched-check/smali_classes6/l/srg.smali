.class public Ll/srg;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/srg$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;Ll/y20;ZLjava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Landroid/view/View;",
            ">;Z",
            "Ljava/lang/String;",
            ")",
            "Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->setOnViewRender(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    const/high16 p3, 0x40000000    # 2.0f

    .line 10
    .line 11
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    move-object v1, p0

    .line 16
    move-object v2, p1

    .line 17
    move-object v3, p2

    .line 18
    move v5, p4

    .line 19
    move-object v6, p5

    .line 20
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;->B(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;IZLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    new-instance p0, Landroid/widget/LinearLayout$LayoutParams;

    .line 24
    .line 25
    const/4 p1, -0x2

    .line 26
    invoke-direct {p0, p1, p1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 27
    .line 28
    .line 29
    const/high16 p1, 0x41400000    # 12.0f

    .line 30
    .line 31
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    const/4 p2, 0x0

    .line 36
    if-eqz v5, :cond_0

    .line 37
    .line 38
    move p3, p2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/high16 p3, 0x41000000    # 8.0f

    .line 41
    .line 42
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    :goto_0
    const/high16 p4, 0x41800000    # 16.0f

    .line 47
    .line 48
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result p4

    .line 52
    invoke-virtual {p0, p1, p3, p4, p2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    return-object v0
.end method

.method public static b(Ll/srg$a;)Landroid/view/View;
    .locals 7

    .line 1
    invoke-static {p0}, Ll/srg$a;->g(Ll/srg$a;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/srg$a;->a(Ll/srg$a;)Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicAggregationActivity;

    .line 16
    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    invoke-static {p0}, Ll/srg$a;->a(Ll/srg$a;)Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-static {p0}, Ll/srg$a;->g(Ll/srg$a;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {p0}, Ll/srg$a;->f(Ll/srg$a;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {p0}, Ll/srg$a;->e(Ll/srg$a;)Ll/y20;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-static {p0}, Ll/srg$a;->d(Ll/srg$a;)Z

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    invoke-static {p0}, Ll/srg$a;->c(Ll/srg$a;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-static/range {v1 .. v6}, Ll/srg;->a(Lcom/p1/mobile/android/app/Act;Ljava/util/List;Ljava/lang/String;Ll/y20;ZLjava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/feedbottom/insert/FeedTopicFlowView;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-static {p0}, Ll/srg$a;->b(Ll/srg$a;)Landroid/view/ViewGroup;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 52
    .line 53
    .line 54
    return-object v0

    .line 55
    :cond_0
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method
