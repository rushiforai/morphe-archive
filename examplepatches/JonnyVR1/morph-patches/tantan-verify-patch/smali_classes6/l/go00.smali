.class public Ll/go00;
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


# virtual methods
.method public bridge synthetic c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/go00;->h(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Lv/VLinear;Landroid/content/Context;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/fo00;->c(Lv/VLinear;Landroid/content/Context;Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    sget p2, Ll/tec0;->d1:I

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;

    .line 22
    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    move-object v0, p0

    .line 26
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;

    .line 27
    .line 28
    iget-object p0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->e:Landroid/widget/LinearLayout;

    .line 29
    .line 30
    sget p2, Ll/fo00;->e:I

    .line 31
    .line 32
    const/high16 v1, 0x41600000    # 14.0f

    .line 33
    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    const/4 v2, 0x0

    .line 39
    invoke-virtual {p0, p2, v2, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 40
    .line 41
    .line 42
    new-instance v4, Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v5, "p_user_moment_interactions_details_view"

    .line 48
    .line 49
    const-string v2, ""

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    move-object v1, p3

    .line 53
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->k(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 57
    .line 58
    .line 59
    const/high16 p0, 0x41800000    # 16.0f

    .line 60
    .line 61
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-static {p1, p0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 66
    .line 67
    .line 68
    :cond_0
    return-void
.end method
