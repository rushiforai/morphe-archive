.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;

.field public b:Lv/VLinear;

.field public c:Landroid/view/View;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public e:Lcom/p1/mobile/android/app/Act;

.field public f:Lcom/p1/mobile/putong/feed/data/Moment;

.field public g:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/android/app/Act;Landroid/view/View;)V
    .locals 2

    .line 1
    const/4 p1, 0x0

    .line 2
    new-array p1, p1, [Ll/pf60;

    .line 3
    .line 4
    const-string v0, "e_roam_banner"

    .line 5
    .line 6
    const-string v1, "p_discover_dating"

    .line 7
    .line 8
    invoke-static {v0, v1, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "p_discover_dating,e_roam_banner,click"

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/nyh;->c(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pyh;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->U(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 8
    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->b:Lv/VLinear;

    .line 10
    .line 11
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->D(Landroid/view/ViewGroup;I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->b:Lv/VLinear;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 28
    .line 29
    invoke-virtual {p0, v1, p1, v0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;Lcom/p1/mobile/putong/feed/data/RawFeed;I)V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

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
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;

    .line 24
    .line 25
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->d()V

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void

    .line 37
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->e:Lcom/p1/mobile/android/app/Act;

    .line 38
    .line 39
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 40
    .line 41
    iget-object p2, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->b:Lv/VLinear;

    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 48
    .line 49
    .line 50
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 51
    .line 52
    iget-object v1, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 53
    .line 54
    const/4 v4, 0x0

    .line 55
    iget v5, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    .line 56
    .line 57
    const/4 v2, 0x0

    .line 58
    const/4 v3, 0x0

    .line 59
    invoke-direct/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V

    .line 60
    .line 61
    .line 62
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 63
    .line 64
    iget-object v2, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    const/4 v5, 0x1

    .line 67
    iget v6, p3, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->a:I

    .line 68
    .line 69
    invoke-direct/range {v1 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;IIII)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0, v0, p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->c(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {p0, v1, p5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->c(Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    sget p3, Ll/tec0;->a3:I

    .line 83
    .line 84
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->b:Lv/VLinear;

    .line 85
    .line 86
    const/4 v0, 0x0

    .line 87
    invoke-virtual {p2, p3, p5, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;

    .line 92
    .line 93
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;

    .line 94
    .line 95
    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    .line 96
    .line 97
    const/4 p3, -0x1

    .line 98
    const/4 p5, -0x2

    .line 99
    invoke-direct {p2, p3, p5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 100
    .line 101
    .line 102
    sget p3, Ll/qa00;->h:I

    .line 103
    .line 104
    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 105
    .line 106
    const/high16 p3, 0x41300000    # 11.0f

    .line 107
    .line 108
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 109
    .line 110
    .line 111
    move-result p3

    .line 112
    iput p3, p2, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 113
    .line 114
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->b:Lv/VLinear;

    .line 115
    .line 116
    iget-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;

    .line 117
    .line 118
    invoke-virtual {p3, p5, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 119
    .line 120
    .line 121
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->g:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;

    .line 122
    .line 123
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->f:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 124
    .line 125
    invoke-virtual {p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamGuideView;->j(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->c:Landroid/view/View;

    .line 129
    .line 130
    new-instance p2, Ll/oyh;

    .line 131
    .line 132
    invoke-direct {p2, p1}, Ll/oyh;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 133
    .line 134
    .line 135
    invoke-static {p0, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    const-string p0, "p_discover_dating"

    .line 139
    .line 140
    new-array p1, v0, [Ll/pf60;

    .line 141
    .line 142
    const-string p2, "e_roam_banner"

    .line 143
    .line 144
    invoke-static {p2, p0, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedRoamMomentItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
