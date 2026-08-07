.class public Ll/x8i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/n8i;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

.field public B:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

.field public C:Ll/n8i;

.field public D:I

.field public E:I

.field public F:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public G:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

.field public H:Lcom/p1/mobile/putong/feed/data/TopicMoment;

.field public a:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public b:Lcom/google/android/material/appbar/AppBarLayout;

.field public c:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

.field public d:Landroidx/appcompat/widget/Toolbar;

.field public e:Lv/VImage;

.field public f:Landroid/widget/TextView;

.field public g:Lv/VLinear;

.field public h:Lv/VRelative;

.field public i:Lv/VLine;

.field public j:Lv/VDraweeView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/widget/TextView;

.field public m:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

.field public n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

.field public o:Lv/VFrame;

.field public p:Landroid/widget/RelativeLayout;

.field public q:Landroid/widget/FrameLayout;

.field public r:Lv/VImage;

.field public s:Landroid/widget/LinearLayout;

.field public t:Lv/VText;

.field public u:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public v:Lv/VText;

.field public w:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public x:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

.field public y:Lv/VText;

.field public z:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/x8i$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/x8i$a;-><init>(Ll/x8i;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/x8i;->F:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 10
    .line 11
    new-instance v0, Ll/o8i;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Ll/o8i;-><init>(Ll/x8i;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/x8i;->G:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

    .line 17
    .line 18
    iput-object p1, p0, Ll/x8i;->z:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 19
    .line 20
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x8i;->F()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x8i;->R()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ll/x8i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x8i;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/x8i;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x8i;->O(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/x8i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x8i;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/x8i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x8i;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e(Ll/x8i;Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x8i;->M(Lcom/google/android/material/appbar/AppBarLayout;I)V

    return-void
.end method

.method public static synthetic f(Ll/x8i;Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x8i;->N(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic i(Ll/x8i;Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x8i;->L(Ljava/util/Map;)V

    return-void
.end method

.method public static synthetic j(Ll/x8i;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x8i;->K(Ll/pf60;)V

    return-void
.end method

.method public static synthetic k(Ll/x8i;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x8i;->I(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic l(Ll/x8i;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/x8i;->E:I

    return p0
.end method

.method public static bridge synthetic m(Ll/x8i;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/x8i;->E:I

    return-void
.end method


# virtual methods
.method public A()V
    .locals 0

    .line 1
    return-void
.end method

.method public final C()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/x8i;->n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/x8i;->C:Ll/n8i;

    .line 4
    .line 5
    move-object v2, v1

    .line 6
    iget-object v1, v2, Ll/n8i;->a:Ljava/lang/String;

    .line 7
    .line 8
    move-object v3, v2

    .line 9
    iget-object v2, v3, Ll/n8i;->f:Ljava/lang/String;

    .line 10
    .line 11
    move-object v4, v3

    .line 12
    iget-object v3, v4, Ll/n8i;->d:Ljava/lang/String;

    .line 13
    .line 14
    move-object v5, v4

    .line 15
    iget-object v4, p0, Ll/x8i;->z:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 16
    .line 17
    iget-object v5, v5, Ll/n8i;->g:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->c0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/app/PutongFrag;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/x8i;->A:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    iget-object v0, p0, Ll/x8i;->n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->getFeedRecommendTopicMomentFragment()Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/x8i;->A:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 37
    .line 38
    :cond_0
    iget-object v0, p0, Ll/x8i;->B:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    iget-object v0, p0, Ll/x8i;->n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->getFeedNewTopicMomentFragment()Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Ll/x8i;->B:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 53
    .line 54
    :cond_1
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public E(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/x8i;->e:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/p8i;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ll/p8i;-><init>(Ll/x8i;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ll/x8i;->d:Landroidx/appcompat/widget/Toolbar;

    .line 12
    .line 13
    const-string v0, ""

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/Toolbar;->setTitle(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v0, p0, Ll/x8i;->d:Landroidx/appcompat/widget/Toolbar;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroidx/appcompat/app/AppCompatActivity;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    .line 25
    .line 26
    .line 27
    const/high16 p1, 0x431b0000    # 155.0f

    .line 28
    .line 29
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-static {v0}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p1, v0

    .line 42
    iput p1, p0, Ll/x8i;->D:I

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/x8i;->Z()V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/x8i;->h:Lv/VRelative;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 58
    .line 59
    .line 60
    iget-object p1, p0, Ll/x8i;->b:Lcom/google/android/material/appbar/AppBarLayout;

    .line 61
    .line 62
    iget-object v0, p0, Ll/x8i;->G:Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;

    .line 63
    .line 64
    invoke-virtual {p1, v0}, Lcom/google/android/material/appbar/AppBarLayout;->addOnOffsetChangedListener(Lcom/google/android/material/appbar/AppBarLayout$OnOffsetChangedListener;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Ll/x8i;->s:Landroid/widget/LinearLayout;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-static {v0}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    div-int/lit8 v0, v0, 0x2

    .line 78
    .line 79
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 80
    .line 81
    .line 82
    iget-object p1, p0, Ll/x8i;->h:Lv/VRelative;

    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    iget-object v0, p0, Ll/x8i;->F:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p0}, Ll/x8i;->z()V

    .line 94
    .line 95
    .line 96
    iget-object p1, p0, Ll/x8i;->g:Lv/VLinear;

    .line 97
    .line 98
    new-instance v0, Ll/q8i;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/q8i;-><init>(Ll/x8i;)V

    .line 101
    .line 102
    .line 103
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 104
    .line 105
    .line 106
    iget-object p1, p0, Ll/x8i;->q:Landroid/widget/FrameLayout;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-static {v0}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-static {p1, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 117
    .line 118
    .line 119
    iget-object p1, p0, Ll/x8i;->t:Lv/VText;

    .line 120
    .line 121
    new-instance v0, Ll/r8i;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Ll/r8i;-><init>(Ll/x8i;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Ll/x8i;->r:Lv/VImage;

    .line 130
    .line 131
    new-instance v0, Ll/s8i;

    .line 132
    .line 133
    invoke-direct {v0, p0}, Ll/s8i;-><init>(Ll/x8i;)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    .line 138
    .line 139
    iget-object p1, p0, Ll/x8i;->m:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 140
    .line 141
    new-instance v0, Ll/t8i;

    .line 142
    .line 143
    invoke-direct {v0, p0}, Ll/t8i;-><init>(Ll/x8i;)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->setOnSizeChangeEndListener(Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer$f;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Ll/x8i;->C()V

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0}, Ll/x8i;->n()V

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ll/cmg;->n0()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_0

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 169
    .line 170
    invoke-virtual {v0}, Ll/jka;->P7()Lrx/subjects/b;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    new-instance v0, Ll/u8i;

    .line 179
    .line 180
    invoke-direct {v0, p0}, Ll/u8i;-><init>(Ll/x8i;)V

    .line 181
    .line 182
    .line 183
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 188
    .line 189
    .line 190
    :cond_0
    return-void
.end method

.method public final F()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Ll/ksg;->J0(Lcom/p1/mobile/android/app/Act;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0}, Ll/x8i;->Y(Z)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/jka;->vd()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic K(Ll/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/x8i;->F:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

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
    iget-object v0, p0, Ll/x8i;->h:Lv/VRelative;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/x8i;->F:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Ll/x8i;->F:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v0, Ljava/lang/Integer;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iget-object v1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 32
    .line 33
    check-cast v1, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    iget v2, p0, Ll/x8i;->D:I

    .line 40
    .line 41
    if-le v0, v1, :cond_1

    .line 42
    .line 43
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 44
    .line 45
    check-cast v0, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast p1, Ljava/lang/Integer;

    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    sub-int/2addr v0, p1

    .line 60
    add-int/2addr v2, v0

    .line 61
    iput v2, p0, Ll/x8i;->D:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v0, Ljava/lang/Integer;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    iget-object p1, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 73
    .line 74
    check-cast p1, Ljava/lang/Integer;

    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    sub-int/2addr v0, p1

    .line 81
    sub-int/2addr v2, v0

    .line 82
    iput v2, p0, Ll/x8i;->D:I

    .line 83
    .line 84
    :goto_0
    invoke-virtual {p0}, Ll/x8i;->Z()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final synthetic L(Ljava/util/Map;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/x8i;->C()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/x8i;->n()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final synthetic M(Lcom/google/android/material/appbar/AppBarLayout;I)V
    .locals 2

    .line 1
    const/high16 p1, 0x3f800000    # 1.0f

    .line 2
    .line 3
    if-ltz p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iget v1, p0, Ll/x8i;->E:I

    .line 11
    .line 12
    if-lt v0, v1, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    invoke-static {p2}, Ljava/lang/Math;->abs(I)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    int-to-float v0, v0

    .line 21
    mul-float/2addr v0, p1

    .line 22
    iget v1, p0, Ll/x8i;->E:I

    .line 23
    .line 24
    int-to-float v1, v1

    .line 25
    div-float/2addr v0, v1

    .line 26
    sub-float/2addr p1, v0

    .line 27
    :goto_0
    iget-object v0, p0, Ll/x8i;->h:Lv/VRelative;

    .line 28
    .line 29
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_3

    .line 34
    .line 35
    iget-object v0, p0, Ll/x8i;->h:Lv/VRelative;

    .line 36
    .line 37
    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 38
    .line 39
    .line 40
    iget-object p1, p0, Ll/x8i;->f:Landroid/widget/TextView;

    .line 41
    .line 42
    iget v0, p0, Ll/x8i;->D:I

    .line 43
    .line 44
    add-int/2addr v0, p2

    .line 45
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-static {p0}, Ll/bnl0;->C(Landroid/content/Context;)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-ne v0, p0, :cond_2

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    goto :goto_1

    .line 57
    :cond_2
    const/4 p0, 0x0

    .line 58
    :goto_1
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    :cond_3
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/x8i;->q(Lcom/p1/mobile/putong/feed/data/GroupIdBox;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 20
    .line 21
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 22
    .line 23
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a()Landroid/content/Intent;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p2, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/feed/data/TopicMoment;Landroid/view/View;)V
    .locals 1

    .line 1
    const-string p2, "e_vote_user_entrance"

    .line 2
    .line 3
    const-string v0, "p_topic_detail"

    .line 4
    .line 5
    invoke-static {p2, v0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    new-instance p2, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    const-string v0, "m"

    .line 21
    .line 22
    invoke-static {v0}, Ll/qv5;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    const-string v0, "/fep/tantan/frontend/tantan-frontend-app-pages-v2/src/pages/core/topic-conversation/index.html?speed=true&_bid=1003366&hideNavigationBar=1&hideNotch=1&topicId="

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->id:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, "&description="

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1}, Ll/x8i;->w(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, ""

    .line 56
    .line 57
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    invoke-static {p0, p1, p2}, Ll/ryh;->a(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    return-void
.end method

.method public P()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8i;->n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->j0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8i;->n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->k0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public R()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8i;->n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->o0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public S()Ll/l4g0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8i;->n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->l0()Ll/l4g0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public T()V
    .locals 0

    .line 1
    return-void
.end method

.method public U(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/x8i;->l:Landroid/widget/TextView;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->k2:I

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->momentCounter:I

    .line 23
    .line 24
    invoke-static {v3}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v2, " "

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0}, Ll/x8i;->act()Lcom/p1/mobile/android/app/Act;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->m2:I

    .line 53
    .line 54
    invoke-virtual {p0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    iget p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->viewCounter:I

    .line 59
    .line 60
    invoke-static {p1}, Ll/q8g0;->u(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V
    .locals 5
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/x8i;->H:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 2
    .line 3
    iget-object v0, p0, Ll/x8i;->k:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->getTopicNameWithPrefix()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/x8i;->f:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/TopicMoment;->getTopicNameWithPrefix()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/x8i;->m:Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->description:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;->M(Ljava/lang/CharSequence;)Lcom/p1/mobile/putong/newui/view/VExpandableTextContainer;

    .line 26
    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->headIcon:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/x8i;->a0(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/x8i;->U(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/cmg;->O()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    const/high16 v1, 0x41980000    # 19.0f

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_0

    .line 54
    .line 55
    iget-object v0, p0, Ll/x8i;->u:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 56
    .line 57
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/x8i;->v:Lv/VText;

    .line 61
    .line 62
    new-instance v2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v3, "\u6765\u81ea"

    .line 65
    .line 66
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 70
    .line 71
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->name:Ljava/lang/String;

    .line 72
    .line 73
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v3, "\u5708\u5b50"

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    .line 87
    .line 88
    iget-object v0, p0, Ll/x8i;->i:Lv/VLine;

    .line 89
    .line 90
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    iget-object v0, p0, Ll/x8i;->i:Lv/VLine;

    .line 97
    .line 98
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 103
    .line 104
    .line 105
    goto/16 :goto_1

    .line 106
    .line 107
    :cond_0
    invoke-static {}, Ll/cmg;->n0()Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    const/4 v3, 0x0

    .line 112
    if-eqz v0, :cond_2

    .line 113
    .line 114
    invoke-virtual {p0, p1}, Ll/x8i;->y(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_2

    .line 119
    .line 120
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 121
    .line 122
    if-lez v0, :cond_2

    .line 123
    .line 124
    iget-object v0, p0, Ll/x8i;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 125
    .line 126
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/x8i;->x:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 130
    .line 131
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 132
    .line 133
    .line 134
    iget-object v0, p0, Ll/x8i;->x:Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;

    .line 135
    .line 136
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusUserIds:Ljava/util/List;

    .line 137
    .line 138
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/feed/newui/view/FeedUserHeaderView;->n0(Ljava/util/List;Z)V

    .line 139
    .line 140
    .line 141
    iget-object v0, p0, Ll/x8i;->y:Lv/VText;

    .line 142
    .line 143
    new-instance v2, Ljava/lang/StringBuilder;

    .line 144
    .line 145
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 146
    .line 147
    .line 148
    iget v3, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->consensusCounter:I

    .line 149
    .line 150
    const/16 v4, 0x63

    .line 151
    .line 152
    if-le v3, v4, :cond_1

    .line 153
    .line 154
    const-string v3, "99+"

    .line 155
    .line 156
    goto :goto_0

    .line 157
    :cond_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    :goto_0
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string v3, "\u4eba\u548c\u4f60\u89c2\u70b9\u4e00\u81f4,\u770b\u770b\u4ed6\u4eec\u90fd\u662f\u8c01"

    .line 165
    .line 166
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 174
    .line 175
    .line 176
    iget-object v0, p0, Ll/x8i;->i:Lv/VLine;

    .line 177
    .line 178
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_4

    .line 183
    .line 184
    iget-object v0, p0, Ll/x8i;->i:Lv/VLine;

    .line 185
    .line 186
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 191
    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_2
    iget-object v0, p0, Ll/x8i;->i:Lv/VLine;

    .line 195
    .line 196
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-eqz v0, :cond_3

    .line 201
    .line 202
    iget-object v0, p0, Ll/x8i;->i:Lv/VLine;

    .line 203
    .line 204
    const/high16 v1, 0x41c80000    # 25.0f

    .line 205
    .line 206
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 211
    .line 212
    .line 213
    :cond_3
    iget-object v0, p0, Ll/x8i;->u:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 214
    .line 215
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 216
    .line 217
    .line 218
    iget-object v0, p0, Ll/x8i;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 219
    .line 220
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 221
    .line 222
    .line 223
    :cond_4
    :goto_1
    iget-object v0, p0, Ll/x8i;->u:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 224
    .line 225
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-eqz v0, :cond_5

    .line 230
    .line 231
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Ll/x8i;->X(Lcom/p1/mobile/putong/feed/data/GroupIdBox;)V

    .line 234
    .line 235
    .line 236
    :cond_5
    iget-object v0, p0, Ll/x8i;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 237
    .line 238
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-eqz v0, :cond_6

    .line 243
    .line 244
    const-string v0, "e_vote_user_entrance"

    .line 245
    .line 246
    const-string v1, "p_topic_detail"

    .line 247
    .line 248
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    :cond_6
    iget-object v0, p0, Ll/x8i;->u:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 252
    .line 253
    new-instance v1, Ll/v8i;

    .line 254
    .line 255
    invoke-direct {v1, p0, p1}, Ll/v8i;-><init>(Ll/x8i;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 256
    .line 257
    .line 258
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 259
    .line 260
    .line 261
    iget-object v0, p0, Ll/x8i;->w:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 262
    .line 263
    new-instance v1, Ll/w8i;

    .line 264
    .line 265
    invoke-direct {v1, p0, p1}, Ll/w8i;-><init>(Ll/x8i;Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 266
    .line 267
    .line 268
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 269
    .line 270
    .line 271
    return-void
.end method

.method public W(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8i;->p:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/feed/data/GroupIdBox;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/x8i;->v(Lcom/p1/mobile/putong/feed/data/GroupIdBox;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/x8i;->x()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ll/pf60;

    .line 11
    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, [Ll/pf60;

    .line 17
    .line 18
    const-string v0, "e_circle_tag"

    .line 19
    .line 20
    invoke-static {v0, p0, p1}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public Y(Z)V
    .locals 1

    .line 1
    const-string v0, "e_tantan_topic"

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x8i;->x()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ll/x8i;->x()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x8i;->b:Lcom/google/android/material/appbar/AppBarLayout;

    .line 2
    .line 3
    iget v1, p0, Ll/x8i;->D:I

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/x8i;->c:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

    .line 9
    .line 10
    iget p0, p0, Ll/x8i;->D:I

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public a0(Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/x8i;->j:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8i;->z:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/n8i;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/x8i;->p(Ll/n8i;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/x8i;->u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/x8i;->A()V

    .line 6
    .line 7
    .line 8
    const/4 p0, -0x1

    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 10
    .line 11
    .line 12
    return-object p1
.end method

.method public final n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x8i;->C:Ll/n8i;

    .line 2
    .line 3
    iget-object v1, p0, Ll/x8i;->A:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->R4()Ll/d9i;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v1, v1, Ll/d9i;->j:Lrx/subjects/a;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/n8i;->m0(Lrx/c;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Ll/x8i;->C:Ll/n8i;

    .line 15
    .line 16
    iget-object p0, p0, Ll/x8i;->A:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicMomentFragment;->R4()Ll/d9i;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/d9i;->q0()Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {v0, p0}, Ll/n8i;->l0(Lrx/c;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    sget v0, Ll/hdc0;->t:I

    .line 6
    .line 7
    if-ne v0, p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/x8i;->z:Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/FeedTopicAggregationBaseFrag;->o()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public p(Ll/n8i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/x8i;->C:Ll/n8i;

    .line 2
    .line 3
    return-void
.end method

.method public q(Lcom/p1/mobile/putong/feed/data/GroupIdBox;)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/x8i;->v(Lcom/p1/mobile/putong/feed/data/GroupIdBox;)Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Ll/x8i;->x()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [Ll/pf60;

    .line 11
    .line 12
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, [Ll/pf60;

    .line 17
    .line 18
    const-string v0, "e_circle_tag"

    .line 19
    .line 20
    invoke-static {v0, p0, p1}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public s()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/x8i;->F:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

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
    iget-object v0, p0, Ll/x8i;->h:Lv/VRelative;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object p0, p0, Ll/x8i;->F:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 16
    .line 17
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public u(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final v(Lcom/p1/mobile/putong/feed/data/GroupIdBox;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/GroupIdBox;",
            ")",
            "Ljava/util/List<",
            "Ll/pf60<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "circle_id"

    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->id:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    const-string p1, "moment_id"

    .line 18
    .line 19
    const-string v0, ""

    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    return-object p0
.end method

.method public w(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-ge p0, v0, :cond_1

    .line 23
    .line 24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 31
    .line 32
    iget-boolean v0, v0, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/VoteOptions;->values:Ljava/lang/String;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const-string p0, ""

    .line 51
    .line 52
    return-object p0
.end method

.method public x()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/x8i;->n:Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/topic/topicplugin/FeedTopicContentWithPluginView;->getCurrentPosition()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const-string p0, "p_topic_recommend"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "p_topic_latest"

    .line 13
    .line 14
    return-object p0
.end method

.method public y(Lcom/p1/mobile/putong/feed/data/TopicMoment;)Z
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 9
    .line 10
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    move p0, v0

    .line 17
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-ge p0, v1, :cond_1

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->options:Ljava/util/List;

    .line 26
    .line 27
    invoke-interface {v1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;

    .line 32
    .line 33
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/VoteOptions;->haveliked:Z

    .line 34
    .line 35
    if-eqz v1, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    return v0
.end method

.method public final z()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/x8i;->o:Lv/VFrame;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/x8i;->o:Lv/VFrame;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
