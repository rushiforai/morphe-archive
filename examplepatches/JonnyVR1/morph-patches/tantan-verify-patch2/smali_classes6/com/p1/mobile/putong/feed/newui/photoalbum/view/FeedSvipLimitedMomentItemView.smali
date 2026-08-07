.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;

.field public b:Lv/VLinear;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/Button;

.field public e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public f:Lcom/p1/mobile/android/app/Act;

.field public g:Lcom/p1/mobile/putong/feed/data/Moment;

.field public h:J


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->h:J

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 9
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-wide/16 p1, 0x0

    .line 10
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->h:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-wide/16 p1, 0x0

    .line 12
    iput-wide p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->h:J

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->d(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/k6i;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->U(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->b:Lv/VLinear;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->D(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->b:Lv/VLinear;

    .line 16
    .line 17
    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    .line 18
    .line 19
    const/4 v4, -0x1

    .line 20
    const/4 v5, -0x2

    .line 21
    invoke-direct {v3, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 28
    .line 29
    invoke-virtual {p0, v1, p1, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->g:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->g:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    iget-object v1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

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
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->f:Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 27
    .line 28
    iget-object p1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->g:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->b:Lv/VLinear;

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 35
    .line 36
    .line 37
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 38
    .line 39
    iget-object v1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    const/4 v4, 0x0

    .line 42
    iget v5, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    const/4 v3, 0x0

    .line 46
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V

    .line 47
    .line 48
    .line 49
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 50
    .line 51
    iget-object v2, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 52
    .line 53
    const/4 v5, 0x1

    .line 54
    iget v6, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    .line 55
    .line 56
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V

    .line 57
    .line 58
    .line 59
    new-instance v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 60
    .line 61
    iget-object v3, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 62
    .line 63
    const/4 v6, 0x2

    .line 64
    iget v7, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    .line 65
    .line 66
    const/4 v5, 0x0

    .line 67
    invoke-direct/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p0, v0, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->c(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v1, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->c(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, v2, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->c(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->d:Landroid/widget/Button;

    .line 80
    .line 81
    new-instance p2, Ll/j6i;

    .line 82
    .line 83
    invoke-direct {p2, p0}, Ll/j6i;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;)V

    .line 84
    .line 85
    .line 86
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public f()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->f:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 7
    .line 8
    .line 9
    move-result-wide v0

    .line 10
    iget-wide v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->h:J

    .line 11
    .line 12
    sub-long/2addr v0, v2

    .line 13
    const-wide/16 v2, 0x3e8

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-gez v0, :cond_1

    .line 18
    .line 19
    :goto_0
    return-void

    .line 20
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->h:J

    .line 25
    .line 26
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->f:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    const-string v1, "p_like,e_moment_unlock,click"

    .line 33
    .line 34
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Rb(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
