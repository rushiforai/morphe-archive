.class public Ll/hf70;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;
.implements Ll/s2m;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Ll/je70;",
        ">",
        "Ljava/lang/Object;",
        "Ll/iam<",
        "TP;>;",
        "Ll/s2m;"
    }
.end annotation


# static fields
.field public static M:J = 0x1388L

.field public static N:I = 0x3


# instance fields
.field public A:Z

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:Ljava/lang/Runnable;

.field public F:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

.field public G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

.field public H:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public I:Landroidx/recyclerview/widget/RecyclerView$t;

.field public J:Ljava/lang/String;

.field public K:Z

.field public L:Ll/jl80;

.field public a:Lv/VLinear;

.field public b:Landroid/widget/RelativeLayout;

.field public c:Lv/VImage;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;

.field public e:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;

.field public f:Landroid/widget/FrameLayout;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/widget/FrameLayout;

.field public final i:I

.field public j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

.field public k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Ll/je70;

.field public n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

.field public o:Ll/s8h;

.field public p:Landroid/widget/LinearLayout;

.field public q:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:I

.field public v:I

.field public w:Z

.field public x:Z

.field public y:Lcom/p1/mobile/putong/feed/data/Moment;

.field public z:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    iput v0, p0, Ll/hf70;->i:I

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Ll/hf70;->s:Z

    .line 10
    .line 11
    const/4 v0, -0x1

    .line 12
    iput v0, p0, Ll/hf70;->v:I

    .line 13
    .line 14
    new-instance v0, Ll/ke70;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/ke70;-><init>(Ll/hf70;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/hf70;->H:Ll/y20;

    .line 20
    .line 21
    new-instance v0, Ll/hf70$a;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/hf70$a;-><init>(Ll/hf70;)V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/hf70;->I:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 27
    .line 28
    iput-object p1, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 29
    .line 30
    return-void
.end method

.method public static synthetic A(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 1

    .line 1
    const-string v0, "moment_stay"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->a2(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic B(Ll/hf70;Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;Lcom/p1/mobile/putong/data/OMSData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hf70;->x0(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;Lcom/p1/mobile/putong/data/OMSData;)V

    return-void
.end method

.method public static synthetic C(Ll/hf70;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->t0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static bridge synthetic E(Ll/hf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hf70;->M()V

    return-void
.end method

.method public static bridge synthetic F(Ll/hf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hf70;->S()V

    return-void
.end method

.method public static bridge synthetic G(Ll/hf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hf70;->f1()V

    return-void
.end method

.method public static bridge synthetic H(Ll/hf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hf70;->g1()V

    return-void
.end method

.method private W()Lv/VRecyclerView;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hf70;->Y()Ll/ld70;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/ld70;->p:Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/feedlist/FeedMaxHeightRecyclerView;

    .line 6
    .line 7
    return-object p0
.end method

.method private X()Ll/v670;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->A:Ll/v670;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic a(Ll/hf70;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->p0(Landroid/view/View;)V

    return-void
.end method

.method private a0(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    new-instance v0, Ll/af70;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/af70;-><init>(Ll/hf70;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic b(Ll/hf70;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->z0(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Ll/hf70;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->q0(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic d(Ll/hf70;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hf70;->m0(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method private d0()V
    .locals 7

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/gj70;->a()Ll/gj70;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Ll/gj70;->b()Ljava/util/Map;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v1, p0, Ll/hf70;->m:Ll/je70;

    .line 23
    .line 24
    iget-object v1, v1, Ll/je70;->d:Ljava/lang/String;

    .line 25
    .line 26
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ll/gj70$a;

    .line 31
    .line 32
    iget-object v1, p0, Ll/hf70;->m:Ll/je70;

    .line 33
    .line 34
    invoke-virtual {v1}, Ll/je70;->H0()Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    iget-object v2, p0, Ll/hf70;->m:Ll/je70;

    .line 39
    .line 40
    invoke-virtual {v2}, Ll/je70;->E0()Z

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    iget-object v3, p0, Ll/hf70;->m:Ll/je70;

    .line 45
    .line 46
    invoke-virtual {v3}, Ll/je70;->D0()Z

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    iget-object v4, p0, Ll/hf70;->m:Ll/je70;

    .line 51
    .line 52
    invoke-virtual {v4}, Ll/je70;->C0()Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-eqz v4, :cond_0

    .line 57
    .line 58
    iget-object v4, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 59
    .line 60
    new-instance v5, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;

    .line 61
    .line 62
    iget-object v6, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    invoke-direct {v5, v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/ai/FeedAiStoryHeadView;-><init>(Landroid/content/Context;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    :cond_0
    invoke-static {}, Ll/cmg;->l0()Z

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    if-eqz v4, :cond_3

    .line 75
    .line 76
    iget-object v4, p0, Ll/hf70;->m:Ll/je70;

    .line 77
    .line 78
    invoke-virtual {v4}, Ll/je70;->F0()Z

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    if-eqz v4, :cond_2

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/hf70;->k0()Z

    .line 85
    .line 86
    .line 87
    move-result v4

    .line 88
    if-eqz v4, :cond_1

    .line 89
    .line 90
    iget-object v4, p0, Ll/hf70;->f:Landroid/widget/FrameLayout;

    .line 91
    .line 92
    iget-object v5, p0, Ll/hf70;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

    .line 93
    .line 94
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    iget-object v4, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 99
    .line 100
    iget-object v5, p0, Ll/hf70;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

    .line 101
    .line 102
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 103
    .line 104
    .line 105
    :goto_0
    iget-object v4, p0, Ll/hf70;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

    .line 106
    .line 107
    sget-object v5, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 108
    .line 109
    iget-object v5, v5, Ll/jka;->H1:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 110
    .line 111
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->O(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V

    .line 112
    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_2
    iget-object v4, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 116
    .line 117
    sget-object v5, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 118
    .line 119
    invoke-virtual {v5}, Ll/jka;->Mc()Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-virtual {v4, v5}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v4

    .line 127
    new-instance v5, Ll/ef70;

    .line 128
    .line 129
    invoke-direct {v5, p0}, Ll/ef70;-><init>(Ll/hf70;)V

    .line 130
    .line 131
    .line 132
    new-instance v6, Ll/ff70;

    .line 133
    .line 134
    invoke-direct {v6, p0}, Ll/ff70;-><init>(Ll/hf70;)V

    .line 135
    .line 136
    .line 137
    invoke-static {v5, v6}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 138
    .line 139
    .line 140
    move-result-object v5

    .line 141
    invoke-virtual {v4, v5}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_3
    invoke-virtual {p0}, Ll/hf70;->W0()V

    .line 146
    .line 147
    .line 148
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v4

    .line 152
    if-eqz v4, :cond_4

    .line 153
    .line 154
    iget-boolean v0, v0, Ll/gj70$a;->b:Z

    .line 155
    .line 156
    if-nez v0, :cond_5

    .line 157
    .line 158
    :cond_4
    if-nez v2, :cond_5

    .line 159
    .line 160
    if-nez v1, :cond_5

    .line 161
    .line 162
    if-eqz v3, :cond_8

    .line 163
    .line 164
    :cond_5
    if-eqz v1, :cond_6

    .line 165
    .line 166
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;

    .line 167
    .line 168
    iget-object v1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 169
    .line 170
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;-><init>(Landroid/content/Context;)V

    .line 171
    .line 172
    .line 173
    iget-object v1, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 174
    .line 175
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 176
    .line 177
    .line 178
    iget-object p0, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 179
    .line 180
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->Q(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 181
    .line 182
    .line 183
    return-void

    .line 184
    :cond_6
    if-eqz v2, :cond_7

    .line 185
    .line 186
    iget-object v0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 187
    .line 188
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;

    .line 189
    .line 190
    iget-object p0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 191
    .line 192
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_7
    if-eqz v3, :cond_8

    .line 200
    .line 201
    iget-object v0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 202
    .line 203
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;

    .line 204
    .line 205
    iget-object v2, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 206
    .line 207
    iget-object p0, p0, Ll/hf70;->m:Ll/je70;

    .line 208
    .line 209
    iget-object p0, p0, Ll/je70;->d:Ljava/lang/String;

    .line 210
    .line 211
    invoke-direct {v1, v2, p0}, Lcom/p1/mobile/putong/feed/newui/status/entrance/followheader/FeedStateFollowFeedHeaderView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 215
    .line 216
    .line 217
    :cond_8
    return-void
.end method

.method public static synthetic e(Ll/hf70;Lcom/p1/mobile/putong/feed/data/TopicOperations;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->n0(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V

    return-void
.end method

.method public static synthetic f(Ll/hf70;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->v0(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic i(Ll/hf70;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->r0(Lcom/p1/mobile/putong/feed/data/Moment;)V

    return-void
.end method

.method public static synthetic j(Ll/hf70;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->o0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic k(Ll/hf70;Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->y0(Lcom/p1/mobile/putong/feed/data/Group;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic m(Landroid/view/View;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic n(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic q(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 2

    .line 1
    invoke-static {p0}, Ll/w1e;->f(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    new-array p1, p0, [Ll/tfj0$a;

    .line 6
    .line 7
    const-string v0, "e_newuser_checkin_record_pop_get"

    .line 8
    .line 9
    const-string v1, "p_newuser_checkin_record_pop"

    .line 10
    .line 11
    invoke-static {v0, v1, p1}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 12
    .line 13
    .line 14
    const-string p1, "e_newuser_checkin_record_pop_giveup"

    .line 15
    .line 16
    new-array p0, p0, [Ll/tfj0$a;

    .line 17
    .line 18
    invoke-static {p1, v1, p0}, Ll/tfj0;->d(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public static synthetic s(Ll/hf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hf70;->A0()V

    return-void
.end method

.method public static synthetic u(Ll/hf70;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hf70;->w0()V

    return-void
.end method

.method public static synthetic v(Ll/hf70;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->u0(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic w(Ll/l4g0;Landroid/content/DialogInterface;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/w1e;->e(Ll/l4g0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x()V
    .locals 2

    .line 1
    sget-object v0, Ll/pu20;->b:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic y(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic z(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final synthetic A0()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/hf70;->L:Ll/jl80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    new-array p0, p0, [Ll/tfj0$a;

    .line 8
    .line 9
    const-string v0, "e_newuser_checkin_record_pop_giveup"

    .line 10
    .line 11
    const-string v1, "p_newuser_checkin_record_pop"

    .line 12
    .line 13
    invoke-static {v0, v1, p0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public B0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemChanged(I)V

    .line 4
    .line 5
    .line 6
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

.method public D0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

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
    invoke-virtual {p0}, Ll/hf70;->Y()Ll/ld70;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/ld70;->z()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/hf70;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->y(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public G0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hf70;->K:Z

    .line 3
    .line 4
    return-void
.end method

.method public H0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70;->E:Ljava/lang/Runnable;

    .line 2
    .line 3
    invoke-static {p0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/if70;->b(Ll/hf70;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final I0()V
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->s()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Ll/hf70;->m:Ll/je70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget v0, v1, Ll/je70;->g:I

    .line 10
    .line 11
    const/16 v1, 0xe

    .line 12
    .line 13
    if-ne v0, v1, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Ll/hf70;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;

    .line 16
    .line 17
    iget-object p0, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->b0(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget v0, v1, Ll/je70;->g:I

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    const/16 v1, 0xc

    .line 28
    .line 29
    if-ne v0, v1, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-void

    .line 33
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/hf70;->e:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;

    .line 34
    .line 35
    iget-object p0, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 36
    .line 37
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedDraftView;->b0(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public J()V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/if70;->c(Ll/hf70;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public J0(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/TopicMoment;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 3
    .line 4
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_1

    .line 9
    .line 10
    iget-object v1, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    instance-of v2, v1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;

    .line 17
    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;

    .line 21
    .line 22
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/feed/newui/topic/topiclist/TopicNearByHeaderView;->f(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
.end method

.method public K()V
    .locals 3

    .line 1
    invoke-static {}, Ll/pu20;->o()Ljava/util/HashSet;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/HashSet;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/pu20;->o()Ljava/util/HashSet;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/hf70;->m:Ll/je70;

    .line 16
    .line 17
    iget-object v1, v1, Ll/je70;->d:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-static {v1, v2}, Ll/ksg;->K(Ljava/lang/String;Z)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/hf70;->T0()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-boolean v0, p0, Ll/hf70;->x:Z

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/hf70;->T0()V

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public K0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70;->b:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public L(Ll/je70;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    return-void
.end method

.method public L0()Ll/n570;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/je70;->y0()Ll/n570;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final M()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    add-int/lit8 v1, v1, -0x1

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v2}, Landroid/view/View;->getBottom()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    .line 51
    .line 52
    .line 53
    move-result v3

    .line 54
    sub-int/2addr v2, v3

    .line 55
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-virtual {v3, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->getPosition(Landroid/view/View;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-ne v1, v2, :cond_1

    .line 68
    .line 69
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$o;->getItemCount()I

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    add-int/lit8 v1, v1, -0x1

    .line 82
    .line 83
    if-ne v0, v1, :cond_1

    .line 84
    .line 85
    invoke-virtual {p0}, Ll/hf70;->Y0()V

    .line 86
    .line 87
    .line 88
    :cond_1
    :goto_0
    return-void
.end method

.method public final M0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hf70;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;->F:Lrx/subjects/a;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ll/me70;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/me70;-><init>(Ll/hf70;)V

    .line 14
    .line 15
    .line 16
    new-instance p0, Ll/ne70;

    .line 17
    .line 18
    invoke-direct {p0}, Ll/ne70;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final N(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    new-instance p0, Ll/qe70;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Ll/qe70;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public N0(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-void
.end method

.method public O()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/hf70;->Y()Ll/ld70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/y670;->m()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/hf70;->q:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    iget-object v1, p0, Ll/hf70;->a:Lv/VLinear;

    .line 19
    .line 20
    iget-object v2, p0, Ll/hf70;->q:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 21
    .line 22
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->removeKeyboardListener(Landroid/view/View;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Ll/hf70;->I:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->removeOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public O0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    new-instance v1, Ll/bf70;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/bf70;-><init>(Ll/hf70;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->g5(Ll/x20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public P()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hf70;->J:Ljava/lang/String;

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
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/hf70;->J:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Ll/hf70;->J:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public P0()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->h5(Ll/s2m;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public Q(Ll/pf60;Ljava/util/List;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)Z"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/List;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz p0, :cond_2

    .line 7
    .line 8
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 23
    .line 24
    new-instance v1, Ll/re70;

    .line 25
    .line 26
    invoke-direct {v1, v0}, Ll/re70;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 27
    .line 28
    .line 29
    invoke-static {p0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    invoke-interface {p0, p1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    invoke-interface {p0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    invoke-interface {p0, p1, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    const/4 p0, 0x1

    .line 51
    return p0

    .line 52
    :cond_2
    return p1
.end method

.method public Q0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/hf70;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method public R(Ll/pf60;Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ")Z"
        }
    .end annotation

    .line 1
    iget-object p0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/List;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    if-eqz p0, :cond_1

    .line 7
    .line 8
    new-instance v0, Ll/se70;

    .line 9
    .line 10
    invoke-direct {v0, p2}, Ll/se70;-><init>(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    invoke-interface {p0, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    invoke-interface {p0, p1, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    :goto_0
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    return p1
.end method

.method public R0(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/hf70;->s:Z

    .line 2
    .line 3
    iget-object p1, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hf70;->Y()Ll/ld70;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-boolean p0, p0, Ll/hf70;->s:Z

    .line 16
    .line 17
    invoke-virtual {p1, p0}, Ll/y670;->K(Z)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final S()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    iget v0, v0, Ll/je70;->g:I

    .line 4
    .line 5
    invoke-static {v0}, Ll/ksg;->k0(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_5

    .line 10
    .line 11
    iget-object v0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    invoke-static {v0}, Ll/bnl0;->z0(Landroid/content/Context;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x2

    .line 18
    div-int/2addr v0, v1

    .line 19
    iget-object v2, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    invoke-static {v2}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    div-int/2addr v2, v1

    .line 26
    new-array v1, v1, [I

    .line 27
    .line 28
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-virtual {v3, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 33
    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    aget v3, v1, v3

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    aget v1, v1, v4

    .line 40
    .line 41
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 42
    .line 43
    .line 44
    move-result-object v4

    .line 45
    sub-int/2addr v0, v3

    .line 46
    int-to-float v0, v0

    .line 47
    sub-int/2addr v2, v1

    .line 48
    int-to-float v1, v2

    .line 49
    invoke-virtual {v4, v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    if-nez v0, :cond_0

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 57
    .line 58
    if-eqz v1, :cond_1

    .line 59
    .line 60
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->c:Ll/dj70;

    .line 63
    .line 64
    iget-object v0, v0, Ll/dj70;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ll/hf70;->U(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

    .line 71
    .line 72
    if-eqz v1, :cond_2

    .line 73
    .line 74
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedcenter/FeedCenterView;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Ll/hf70;->U(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    :cond_2
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;

    .line 83
    .line 84
    if-eqz v1, :cond_3

    .line 85
    .line 86
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;

    .line 87
    .line 88
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListImageLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 89
    .line 90
    invoke-virtual {p0, v0}, Ll/hf70;->U(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_3
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;

    .line 95
    .line 96
    if-eqz v1, :cond_4

    .line 97
    .line 98
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;

    .line 99
    .line 100
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ll/hf70;->U(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :cond_4
    instance-of v1, v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 107
    .line 108
    if-eqz v1, :cond_5

    .line 109
    .line 110
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 111
    .line 112
    invoke-virtual {p0, v0}, Ll/hf70;->T(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 113
    .line 114
    .line 115
    :cond_5
    :goto_0
    return-void
.end method

.method public S0(Ll/y20;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

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
    invoke-virtual {p0}, Ll/hf70;->Y()Ll/ld70;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ll/ld70;->P(Ll/y20;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/hf70;->N(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)Ljava/lang/Runnable;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Ll/hf70;->E:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->z()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    const-wide/16 v0, 0x7d0

    .line 14
    .line 15
    sput-wide v0, Ll/hf70;->M:J

    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    iget-object p0, p0, Ll/hf70;->E:Ljava/lang/Runnable;

    .line 20
    .line 21
    sget-wide v0, Ll/hf70;->M:J

    .line 22
    .line 23
    invoke-static {p1, p0, v0, v1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final T0()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;

    .line 2
    .line 3
    iget-object v1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    iget-object v2, p0, Ll/hf70;->m:Ll/je70;

    .line 6
    .line 7
    iget-object v2, v2, Ll/je70;->d:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/bnl0;->y0()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/high16 v2, 0x41c00000    # 24.0f

    .line 17
    .line 18
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    sub-int/2addr v1, v2

    .line 23
    int-to-float v1, v1

    .line 24
    const/high16 v2, 0x42c80000    # 100.0f

    .line 25
    .line 26
    mul-float/2addr v1, v2

    .line 27
    const v2, 0x43af8000    # 351.0f

    .line 28
    .line 29
    .line 30
    div-float/2addr v1, v2

    .line 31
    new-instance v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 32
    .line 33
    const/4 v3, -0x1

    .line 34
    float-to-int v1, v1

    .line 35
    invoke-direct {v2, v3, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 36
    .line 37
    .line 38
    const/high16 v1, 0x41400000    # 12.0f

    .line 39
    .line 40
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 45
    .line 46
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 51
    .line 52
    const/high16 v1, 0x40000000    # 2.0f

    .line 53
    .line 54
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 61
    .line 62
    .line 63
    const/16 v1, 0x8

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 69
    .line 70
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 71
    .line 72
    .line 73
    invoke-static {}, Ll/pk50;->j()Ll/pk50;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Ll/pk50;->s()Lrx/subjects/a;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    new-instance v2, Ll/oe70;

    .line 82
    .line 83
    invoke-direct {v2, p0, v0}, Ll/oe70;-><init>(Ll/hf70;Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;)V

    .line 84
    .line 85
    .line 86
    new-instance p0, Ll/pe70;

    .line 87
    .line 88
    invoke-direct {p0}, Ll/pe70;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {v2, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public final U(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_2

    .line 14
    .line 15
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;

    .line 34
    .line 35
    iget-object v3, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 36
    .line 37
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-eqz v3, :cond_1

    .line 42
    .line 43
    iget-object v3, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v4, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;->K:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-eqz v3, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0, v2}, Ll/hf70;->T(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumBottomView;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    :goto_1
    return-void
.end method

.method public U0(Lcom/p1/mobile/putong/feed/data/Group;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/Group;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    const-string v1, "\u6b22\u8fce\u52a0\u5165\uff0c\u6210\u4e3a\u7b2c "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 13
    .line 14
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 19
    .line 20
    .line 21
    iget v2, p1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 22
    .line 23
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    .line 32
    .line 33
    iget-object v4, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 34
    .line 35
    invoke-virtual {v4}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    sget v5, Ll/k9c0;->n:I

    .line 40
    .line 41
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 46
    .line 47
    .line 48
    add-int/2addr v2, v1

    .line 49
    const/16 v4, 0x21

    .line 50
    .line 51
    invoke-virtual {v0, v3, v1, v2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 52
    .line 53
    .line 54
    new-instance v1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v2, " \u4f4d"

    .line 57
    .line 58
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-eqz v2, :cond_0

    .line 66
    .line 67
    const-string v2, "\u5708\u53cb"

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 71
    .line 72
    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 80
    .line 81
    .line 82
    new-instance v1, Ll/yah;

    .line 83
    .line 84
    iget-object v2, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    sget v3, Ll/fgc0;->e:I

    .line 87
    .line 88
    invoke-direct {v1, v2, v3}, Ll/yah;-><init>(Lcom/p1/mobile/android/app/Act;I)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {v1, v0}, Ll/yah;->u(Ljava/lang/CharSequence;)Ll/yah;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/data/Group;->isGroupAnonymousType()Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    invoke-virtual {v0, v1}, Ll/yah;->G(Z)Ll/yah;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0, v1}, Ll/yah;->F(Ljava/lang/String;)Ll/yah;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v1, Ll/ye70;

    .line 110
    .line 111
    invoke-direct {v1, p0, p1}, Ll/ye70;-><init>(Ll/hf70;Lcom/p1/mobile/putong/feed/data/Group;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v0, v1}, Ll/yah;->I(Ljava/lang/Runnable;)Ll/yah;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p0, p2}, Ll/yah;->E(Ljava/util/List;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ll/yah;->show()V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public V()Landroidx/recyclerview/widget/RecyclerView$o;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public V0(Ljava/lang/String;)V
    .locals 3

    .line 1
    const-class v0, Landroid/app/Dialog;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "p_newuser_checkin_record_pop"

    .line 8
    .line 9
    invoke-static {v1, v0}, Ll/w1e;->c(Ljava/lang/String;Ljava/lang/String;)Ll/l4g0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/jl80$a;

    .line 14
    .line 15
    iget-object v2, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-direct {v1, v2}, Ll/jl80$a;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    sget v2, Ll/lbc0;->q3:I

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ll/jl80$a;->S(I)Ll/jl80$a;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "\u606d\u559c\uff01\u83b7\u5f977\u65e5\u65b0\u4eba\u6302\u4ef6"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Ll/jl80$a;->y0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const-string v2, "100\u6d41\u91cf\u66dd\u5149\u5df2\u751f\u6548\uff0c\u7279\u6743\u671f\u95f4\u53d1\u52a8\u6001\u53ef\u83b7\u5f97\u66f4\u591a\u4e92\u52a8"

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Ll/jl80$a;->t0(Ljava/lang/CharSequence;)Ll/jl80$a;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Ll/te70;

    .line 39
    .line 40
    invoke-direct {v2, p0, p1}, Ll/te70;-><init>(Ll/hf70;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string p1, "\u9886\u53d6"

    .line 44
    .line 45
    invoke-virtual {v1, p1, v2}, Ll/jl80$a;->c0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance v1, Ll/ue70;

    .line 50
    .line 51
    invoke-direct {v1, p0}, Ll/ue70;-><init>(Ll/hf70;)V

    .line 52
    .line 53
    .line 54
    const-string v2, "\u653e\u5f03"

    .line 55
    .line 56
    invoke-virtual {p1, v2, v1}, Ll/jl80$a;->X(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Ll/jl80$a;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    const/4 v1, 0x0

    .line 61
    invoke-virtual {p1, v1}, Ll/jl80$a;->P(Z)Ll/jl80$a;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance v1, Ll/we70;

    .line 66
    .line 67
    invoke-direct {v1, v0}, Ll/we70;-><init>(Ll/l4g0;)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v1}, Ll/jl80$a;->o0(Landroid/content/DialogInterface$OnShowListener;)Ll/jl80$a;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance v1, Ll/xe70;

    .line 75
    .line 76
    invoke-direct {v1, v0}, Ll/xe70;-><init>(Ll/l4g0;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, v1}, Ll/jl80$a;->n0(Landroid/content/DialogInterface$OnDismissListener;)Ll/jl80$a;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Ll/jl80$a;->r0()Ll/jl80;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iput-object p1, p0, Ll/hf70;->L:Ll/jl80;

    .line 88
    .line 89
    return-void
.end method

.method public final W0()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/je70;->G0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget v1, Ll/tec0;->V1:I

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sget v1, Ll/hdc0;->k1:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;

    .line 29
    .line 30
    iget-object v2, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;->i(Lcom/p1/mobile/android/app/Act;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public X0()Ll/s8h;
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/hf70;->d0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hf70;->K()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lez v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Ll/s8h;

    .line 24
    .line 25
    iget-object v1, p0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Ll/s8h;-><init>(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/hf70;->o:Ll/s8h;

    .line 31
    .line 32
    iget-object v1, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/zzk;->H(Landroid/view/View;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 38
    .line 39
    const/4 v1, 0x1

    .line 40
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->s0(I)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Ll/hf70;->o:Ll/s8h;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_0
    const/4 p0, 0x0

    .line 47
    return-object p0
.end method

.method public final Y()Ll/ld70;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->z:Ll/y670;

    .line 4
    .line 5
    check-cast p0, Ll/ld70;

    .line 6
    .line 7
    return-object p0
.end method

.method public final Y0()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    :goto_0
    if-lt v1, v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;

    .line 26
    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;

    .line 30
    .line 31
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedSvipLimitedMomentItemView;->f()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    add-int/lit8 v1, v1, -0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-void
.end method

.method public Z()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hf70;->F:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;->I()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/hf70;->F:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 10
    .line 11
    return-void
.end method

.method public final Z0()V
    .locals 8

    .line 1
    invoke-static {}, Ll/x3e;->b()Ll/x3e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/x3e;->c()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/tec0;->K3:I

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget v1, Ll/hdc0;->g2:I

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Landroid/widget/TextView;

    .line 32
    .line 33
    new-instance v2, Ljava/util/Random;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 36
    .line 37
    .line 38
    const/16 v3, 0x1a

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/lit8 v2, v2, 0x5

    .line 45
    .line 46
    new-instance v3, Landroid/text/SpannableStringBuilder;

    .line 47
    .line 48
    const-string v4, "\u5df2\u4e3a\u4f60\u66f4\u65b0\u4e86 "

    .line 49
    .line 50
    invoke-direct {v3, v4}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    invoke-virtual {v3, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 69
    .line 70
    .line 71
    move-result v2

    .line 72
    new-instance v5, Landroid/text/style/ForegroundColorSpan;

    .line 73
    .line 74
    iget-object v6, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 75
    .line 76
    invoke-virtual {v6}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    sget v7, Ll/k9c0;->n:I

    .line 81
    .line 82
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getColor(I)I

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    invoke-direct {v5, v6}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 87
    .line 88
    .line 89
    add-int/2addr v2, v4

    .line 90
    const/16 v6, 0x21

    .line 91
    .line 92
    invoke-virtual {v3, v5, v4, v2, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 93
    .line 94
    .line 95
    const-string v2, " \u6761\u52a8\u6001"

    .line 96
    .line 97
    invoke-virtual {v3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    new-instance v1, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 104
    .line 105
    iget-object v2, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 106
    .line 107
    invoke-direct {v1, v2, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    const/4 v0, 0x1

    .line 111
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    const/16 v1, 0x7d0

    .line 116
    .line 117
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    new-instance v1, Ll/b3m;

    .line 122
    .line 123
    const-string v2, "feed_showUpdateSuccessTips"

    .line 124
    .line 125
    invoke-direct {v1, v2}, Ll/b3m;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Ll/hf70;->F:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 137
    .line 138
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget-object p0, p0, Ll/hf70;->F:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 143
    .line 144
    invoke-virtual {v0, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public a1(Ll/pf60;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/data/Links;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;>;)Z"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/hf70;->B:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_6

    .line 6
    .line 7
    iget-object v0, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Ljava/util/Collection;

    .line 10
    .line 11
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v3, p0, Ll/hf70;->m:Ll/je70;

    .line 16
    .line 17
    const/16 v4, 0xe

    .line 18
    .line 19
    if-nez v0, :cond_2

    .line 20
    .line 21
    iget v0, v3, Ll/je70;->g:I

    .line 22
    .line 23
    const/16 v3, 0xc

    .line 24
    .line 25
    if-ne v0, v3, :cond_0

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 28
    .line 29
    iget-object v0, v0, Ll/jka;->K:Ll/vxd0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    check-cast v0, Ljava/lang/Integer;

    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    sget v3, Ll/hf70;->N:I

    .line 42
    .line 43
    if-ge v0, v3, :cond_1

    .line 44
    .line 45
    invoke-static {}, Ll/x3e;->b()Ll/x3e;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-virtual {v3}, Ll/x3e;->c()Z

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-nez v3, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/hf70;->d1()V

    .line 56
    .line 57
    .line 58
    add-int/2addr v0, v2

    .line 59
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 60
    .line 61
    iget-object v3, v3, Ll/jka;->K:Ll/vxd0;

    .line 62
    .line 63
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v3, v0}, Ll/vxd0;->put(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_0
    invoke-virtual {p0}, Ll/hf70;->Z0()V

    .line 72
    .line 73
    .line 74
    :cond_1
    :goto_0
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 75
    .line 76
    iget v0, v0, Ll/je70;->g:I

    .line 77
    .line 78
    if-ne v0, v4, :cond_3

    .line 79
    .line 80
    invoke-static {}, Ll/cmg;->t()Z

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    if-nez v0, :cond_3

    .line 85
    .line 86
    iget-object v0, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 87
    .line 88
    new-instance v3, Ll/cf70;

    .line 89
    .line 90
    invoke-direct {v3}, Ll/cf70;-><init>()V

    .line 91
    .line 92
    .line 93
    const-wide/16 v4, 0xbb8

    .line 94
    .line 95
    invoke-static {v0, v3, v4, v5}, Ll/l51;->I(Lcom/p1/mobile/android/app/Frag;Ljava/lang/Runnable;J)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    iget v0, v3, Ll/je70;->g:I

    .line 100
    .line 101
    if-ne v0, v4, :cond_3

    .line 102
    .line 103
    invoke-static {}, Ll/cmg;->t()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_3

    .line 108
    .line 109
    sget-object v0, Ll/pu20;->b:Lrx/subjects/b;

    .line 110
    .line 111
    sget-object v3, Ll/uxj0;->a:Ll/uxj0;

    .line 112
    .line 113
    invoke-virtual {v0, v3}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    :goto_1
    iput-boolean v1, p0, Ll/hf70;->B:Z

    .line 117
    .line 118
    iget-boolean v0, p0, Ll/hf70;->C:Z

    .line 119
    .line 120
    if-eqz v0, :cond_4

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iget-object v3, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 127
    .line 128
    invoke-interface {v0, v3, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Pq(Lcom/p1/mobile/android/app/Act;Z)V

    .line 129
    .line 130
    .line 131
    iput-boolean v1, p0, Ll/hf70;->C:Z

    .line 132
    .line 133
    :cond_4
    iget-object v0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 134
    .line 135
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-eqz v0, :cond_6

    .line 140
    .line 141
    move v0, v1

    .line 142
    :goto_2
    iget-object v3, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 143
    .line 144
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    if-ge v0, v3, :cond_6

    .line 149
    .line 150
    iget-object v3, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 151
    .line 152
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    instance-of v4, v3, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedPersonalizeSuggestGuideView;

    .line 157
    .line 158
    if-eqz v4, :cond_5

    .line 159
    .line 160
    iget-object v0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 161
    .line 162
    new-instance v4, Ll/df70;

    .line 163
    .line 164
    invoke-direct {v4, v3}, Ll/df70;-><init>(Landroid/view/View;)V

    .line 165
    .line 166
    .line 167
    const-wide/16 v5, 0x1f4

    .line 168
    .line 169
    invoke-virtual {v0, v4, v5, v6}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_5
    add-int/lit8 v0, v0, 0x1

    .line 174
    .line 175
    goto :goto_2

    .line 176
    :cond_6
    :goto_3
    iput-boolean v2, p0, Ll/hf70;->A:Z

    .line 177
    .line 178
    iget-object v0, p0, Ll/hf70;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 179
    .line 180
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    const/4 v2, 0x0

    .line 185
    if-eqz v0, :cond_7

    .line 186
    .line 187
    iget-object v0, p0, Ll/hf70;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 188
    .line 189
    invoke-virtual {p0, p1, v0}, Ll/hf70;->R(Ll/pf60;Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 190
    .line 191
    .line 192
    iput-object v2, p0, Ll/hf70;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 193
    .line 194
    :cond_7
    iget-object v0, p0, Ll/hf70;->z:Ljava/util/List;

    .line 195
    .line 196
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-nez v0, :cond_8

    .line 201
    .line 202
    iget-object v0, p0, Ll/hf70;->z:Ljava/util/List;

    .line 203
    .line 204
    invoke-virtual {p0, p1, v0}, Ll/hf70;->Q(Ll/pf60;Ljava/util/List;)Z

    .line 205
    .line 206
    .line 207
    iput-object v2, p0, Ll/hf70;->z:Ljava/util/List;

    .line 208
    .line 209
    :cond_8
    return v1
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public b0(Z)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-direct {p0, p1}, Ll/hf70;->a0(Z)V

    .line 3
    .line 4
    .line 5
    iget-object p1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    invoke-static {p1}, Ll/orb0;->t(Landroid/app/Activity;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-static {p0, p1}, Ll/orb0;->z(Lcom/p1/mobile/android/app/Act;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public c0(Z)V
    .locals 2

    .line 1
    iget-boolean p1, p0, Ll/hf70;->r:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-boolean p1, p0, Ll/hf70;->s:Z

    .line 7
    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    iget-object p1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/app/Activity;->hasWindowFocus()Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-eqz p1, :cond_2

    .line 17
    .line 18
    iget-object p1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 19
    .line 20
    invoke-static {p1}, Ll/orb0;->t(Landroid/app/Activity;)Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/4 v0, 0x1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    invoke-static {p1}, Ll/orb0;->q(Lcom/p1/mobile/android/app/Act;)Z

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    if-eqz p1, :cond_2

    .line 34
    .line 35
    iget-object p1, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 36
    .line 37
    const/4 v1, 0x0

    .line 38
    invoke-static {p1, v1}, Ll/orb0;->z(Lcom/p1/mobile/android/app/Act;Z)V

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, v0}, Ll/hf70;->a0(Z)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    invoke-direct {p0, v0}, Ll/hf70;->a0(Z)V

    .line 46
    .line 47
    .line 48
    :cond_2
    :goto_0
    return-void
.end method

.method public final d1()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget v1, Ll/tec0;->K3:I

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
    sget v1, Ll/hdc0;->g2:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/widget/TextView;

    .line 21
    .line 22
    const-string v2, "\u53f3\u6ed1\u559c\u6b22\u7684\u4eba\u7684\u52a8\u6001\u4f1a\u51fa\u73b0\u5728\u8fd9\u91cc"

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 25
    .line 26
    .line 27
    new-instance v1, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 28
    .line 29
    iget-object v2, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 30
    .line 31
    invoke-direct {v1, v2, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;-><init>(Landroid/app/Activity;Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->B(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/16 v1, 0x7d0

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->w(I)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/b3m;

    .line 46
    .line 47
    const-string v2, "feed_update_success_small"

    .line 48
    .line 49
    invoke-direct {v1, v2}, Ll/b3m;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->z(Ll/c3m;)Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble$a;->s()Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Ll/hf70;->F:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 61
    .line 62
    invoke-static {}, Ll/llb0;->c()Ll/llb0;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object p0, p0, Ll/hf70;->F:Lcom/p1/mobile/android/ui/pushbubble/SimplePushBubble;

    .line 67
    .line 68
    invoke-virtual {v0, p0}, Ll/llb0;->i(Ll/fqe0;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public final e0()V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "PhotoAlbumFeedBaseFrag"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->i0(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 14
    .line 15
    iput-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/hf70;->P0()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ll/hf70;->O0()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 31
    .line 32
    iget-object v2, v0, Ll/je70;->c:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v3, v0, Ll/je70;->d:Ljava/lang/String;

    .line 35
    .line 36
    iget v4, v0, Ll/je70;->e:I

    .line 37
    .line 38
    iget-object v5, v0, Ll/je70;->f:Ljava/lang/String;

    .line 39
    .line 40
    iget v6, v0, Ll/je70;->g:I

    .line 41
    .line 42
    iget-boolean v7, v0, Ll/je70;->h:Z

    .line 43
    .line 44
    invoke-static/range {v2 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;->p5(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IZ)Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/hf70;->P0()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ll/hf70;->O0()V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 57
    .line 58
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/FragmentManager;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()Landroidx/fragment/app/k;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    sget v2, Ll/hdc0;->g:I

    .line 67
    .line 68
    iget-object p0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 69
    .line 70
    invoke-virtual {v0, v2, p0, v1}, Landroidx/fragment/app/k;->c(ILandroidx/fragment/app/Fragment;Ljava/lang/String;)Landroidx/fragment/app/k;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Landroidx/fragment/app/k;->j()I

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public e1()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hf70;->D:Z

    .line 3
    .line 4
    return-void
.end method

.method public f0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hf70;->c:Lv/VImage;

    .line 2
    .line 3
    new-instance v1, Ll/gf70;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/gf70;-><init>(Ll/hf70;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/hf70;->c:Lv/VImage;

    .line 12
    .line 13
    new-instance v1, Ll/le70;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/le70;-><init>(Ll/hf70;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final f1()V
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 2
    .line 3
    iget-object v0, v0, Ll/jka;->e0:Ll/jxd0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_1

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 20
    .line 21
    iget v0, v0, Ll/je70;->g:I

    .line 22
    .line 23
    const/4 v1, 0x1

    .line 24
    if-eq v0, v1, :cond_1

    .line 25
    .line 26
    const/16 v1, 0xe

    .line 27
    .line 28
    if-eq v0, v1, :cond_1

    .line 29
    .line 30
    const/16 v1, 0xf

    .line 31
    .line 32
    if-eq v0, v1, :cond_1

    .line 33
    .line 34
    const/16 v1, 0x11

    .line 35
    .line 36
    if-eq v0, v1, :cond_1

    .line 37
    .line 38
    const/16 v1, 0x12

    .line 39
    .line 40
    if-eq v0, v1, :cond_1

    .line 41
    .line 42
    const/16 v1, 0xc

    .line 43
    .line 44
    if-eq v0, v1, :cond_1

    .line 45
    .line 46
    if-nez v0, :cond_3

    .line 47
    .line 48
    :cond_1
    invoke-virtual {p0}, Ll/hf70;->V()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    instance-of v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 53
    .line 54
    if-eqz v0, :cond_3

    .line 55
    .line 56
    invoke-virtual {p0}, Ll/hf70;->V()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 61
    .line 62
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    invoke-virtual {p0}, Ll/hf70;->V()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 71
    .line 72
    invoke-virtual {v1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    const/4 v2, 0x0

    .line 77
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    :goto_0
    iget-object v2, p0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 82
    .line 83
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 84
    .line 85
    iget-object v2, v2, Ll/vg60;->a:Ljava/util/List;

    .line 86
    .line 87
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-ge v0, v2, :cond_3

    .line 96
    .line 97
    invoke-virtual {p0}, Ll/hf70;->V()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    check-cast v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 102
    .line 103
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findViewByPosition(I)Landroid/view/View;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v3

    .line 111
    if-eqz v3, :cond_2

    .line 112
    .line 113
    instance-of v3, v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 114
    .line 115
    if-eqz v3, :cond_2

    .line 116
    .line 117
    iget-object v3, p0, Ll/hf70;->J:Ljava/lang/String;

    .line 118
    .line 119
    if-nez v3, :cond_2

    .line 120
    .line 121
    check-cast v2, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;

    .line 122
    .line 123
    invoke-virtual {v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/feedtop/PhotoAlbumTopView;->K()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    iput-object v2, p0, Ll/hf70;->J:Ljava/lang/String;

    .line 128
    .line 129
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_3
    :goto_1
    return-void
.end method

.method public g0(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/hf70;->e0()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/hf70;->I0()V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->l0()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

    .line 14
    .line 15
    iget-object v0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 16
    .line 17
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;-><init>(Landroid/content/Context;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/hf70;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

    .line 21
    .line 22
    iget-object v0, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 23
    .line 24
    iget-object v1, p0, Ll/hf70;->m:Ll/je70;

    .line 25
    .line 26
    iget v1, v1, Ll/je70;->g:I

    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->M(Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;I)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p1, p0, Ll/hf70;->m:Ll/je70;

    .line 32
    .line 33
    invoke-virtual {p1}, Ll/je70;->U0()Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    iget-object p1, p0, Ll/hf70;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;

    .line 40
    .line 41
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 42
    .line 43
    iget v0, v0, Ll/je70;->g:I

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->o(I)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Ll/hf70;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;

    .line 49
    .line 50
    new-instance v0, Ll/ve70;

    .line 51
    .line 52
    invoke-direct {v0, p0}, Ll/ve70;-><init>(Ll/hf70;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ll/ze70;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/ze70;-><init>(Ll/hf70;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->E(Ll/y20;Ll/y20;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public final g1()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    iget v0, v0, Ll/je70;->g:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const/16 v2, 0xe

    .line 9
    .line 10
    if-eq v0, v2, :cond_0

    .line 11
    .line 12
    const/16 v2, 0xf

    .line 13
    .line 14
    if-eq v0, v2, :cond_0

    .line 15
    .line 16
    const/16 v2, 0x11

    .line 17
    .line 18
    if-eq v0, v2, :cond_0

    .line 19
    .line 20
    const/16 v2, 0x12

    .line 21
    .line 22
    if-eq v0, v2, :cond_0

    .line 23
    .line 24
    const/16 v2, 0xc

    .line 25
    .line 26
    if-ne v0, v2, :cond_3

    .line 27
    .line 28
    :cond_0
    iget-boolean v0, p0, Ll/hf70;->C:Z

    .line 29
    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    iget-boolean v0, p0, Ll/hf70;->D:Z

    .line 33
    .line 34
    if-nez v0, :cond_3

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/hf70;->V()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    instance-of v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/hf70;->V()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 49
    .line 50
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    const/4 v2, 0x0

    .line 55
    move v3, v2

    .line 56
    :goto_0
    iget-object v4, p0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 57
    .line 58
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 59
    .line 60
    iget-object v4, v4, Ll/vg60;->a:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-ge v2, v4, :cond_2

    .line 71
    .line 72
    iget-object v4, p0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 73
    .line 74
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->m:Ll/vg60;

    .line 75
    .line 76
    iget-object v4, v4, Ll/vg60;->a:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v4, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v4

    .line 82
    check-cast v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 83
    .line 84
    iget v4, v4, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->b:I

    .line 85
    .line 86
    if-ne v4, v1, :cond_1

    .line 87
    .line 88
    add-int/lit8 v3, v3, 0x1

    .line 89
    .line 90
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_2
    const/16 v0, 0xa

    .line 94
    .line 95
    if-le v3, v0, :cond_3

    .line 96
    .line 97
    iput-boolean v1, p0, Ll/hf70;->C:Z

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-object p0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    invoke-interface {v0, p0, v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->jg(Lcom/p1/mobile/android/app/Act;Z)V

    .line 106
    .line 107
    .line 108
    :cond_3
    return-void
.end method

.method public h0(Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)Z"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/hf70;->z:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-object p1, p0, Ll/hf70;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    iget-boolean p1, p0, Ll/hf70;->A:Z

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/hf70;->D0()V

    .line 19
    .line 20
    .line 21
    :cond_0
    const/4 p0, 0x1

    .line 22
    return p0
.end method

.method public i0(Lcom/p1/mobile/putong/feed/data/Moment;)Z
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hf70;->y:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Ll/hf70;->z:Ljava/util/List;

    .line 5
    .line 6
    iget-boolean p1, p0, Ll/hf70;->A:Z

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/hf70;->D0()V

    .line 11
    .line 12
    .line 13
    :cond_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/je70;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hf70;->L(Ll/je70;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hf70;->I(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p2, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    iget-object v0, p0, Ll/hf70;->H:Ll/y20;

    .line 8
    .line 9
    invoke-virtual {p2, p1, v0}, Lcom/p1/mobile/android/app/Act;->setKeyboardListener(Landroid/view/View;Ll/y20;)Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p2, p0, Ll/hf70;->q:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 14
    .line 15
    iget-object p2, p0, Ll/hf70;->m:Ll/je70;

    .line 16
    .line 17
    iget-object p2, p2, Ll/je70;->d:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "from_nearby_online"

    .line 20
    .line 21
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-nez p2, :cond_1

    .line 26
    .line 27
    iget-object p2, p0, Ll/hf70;->a:Lv/VLinear;

    .line 28
    .line 29
    invoke-static {}, Ll/cmg;->t()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    const/high16 v1, 0x42300000    # 44.0f

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 38
    .line 39
    iget-object v0, v0, Ll/je70;->d:Ljava/lang/String;

    .line 40
    .line 41
    const-string v2, "from_discover_discussion"

    .line 42
    .line 43
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-static {}, Ll/bnl0;->F0()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    add-int/2addr v0, v1

    .line 63
    :goto_0
    invoke-static {p2, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    :cond_1
    iget-object p0, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    sget p2, Ll/k9c0;->p0:I

    .line 73
    .line 74
    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getColor(I)I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 79
    .line 80
    .line 81
    return-object p1
.end method

.method public j0()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/hf70;->x:Z

    .line 3
    .line 4
    return-void
.end method

.method public final k0()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "newuser_checkin"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string p0, "fixed"

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    .line 19
    .line 20
    .line 21
    move-result p0
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    return p0

    .line 23
    :catch_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public l0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

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
    invoke-virtual {p0}, Ll/hf70;->Y()Ll/ld70;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/ld70;->w()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public final synthetic m0(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Ll/hf70;->b0(Z)V

    .line 3
    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public final synthetic n0(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V
    .locals 1

    .line 1
    iget-object p1, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/je70;->F0()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/hf70;->k0()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ll/hf70;->f:Landroid/widget/FrameLayout;

    .line 16
    .line 17
    iget-object v0, p0, Ll/hf70;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    iget-object v0, p0, Ll/hf70;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-object p0, p0, Ll/hf70;->G:Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;

    .line 31
    .line 32
    sget-object p1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 33
    .line 34
    iget-object p1, p1, Ll/jka;->H1:Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/view/FeedNewUserBubbleView;->O(Lcom/p1/mobile/putong/feed/data/TopicOperations;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-virtual {p0}, Ll/hf70;->W0()V

    .line 41
    .line 42
    .line 43
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

.method public final synthetic o0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/hf70;->W0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public p()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    iget v0, v0, Ll/je70;->g:I

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    const/16 v2, 0xe

    .line 9
    .line 10
    if-eq v0, v2, :cond_0

    .line 11
    .line 12
    const/16 v2, 0xf

    .line 13
    .line 14
    if-eq v0, v2, :cond_0

    .line 15
    .line 16
    const/16 v2, 0x11

    .line 17
    .line 18
    if-eq v0, v2, :cond_0

    .line 19
    .line 20
    const/16 v2, 0x12

    .line 21
    .line 22
    if-eq v0, v2, :cond_0

    .line 23
    .line 24
    const/16 v2, 0xc

    .line 25
    .line 26
    if-ne v0, v2, :cond_1

    .line 27
    .line 28
    :cond_0
    iput-boolean v1, p0, Ll/hf70;->B:Z

    .line 29
    .line 30
    :cond_1
    iget-object v0, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_4

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    :goto_0
    iget-object v1, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 40
    .line 41
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-ge v0, v1, :cond_4

    .line 46
    .line 47
    iget-object v1, p0, Ll/hf70;->p:Landroid/widget/LinearLayout;

    .line 48
    .line 49
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    instance-of v2, v1, Ll/qxh;

    .line 54
    .line 55
    if-eqz v2, :cond_2

    .line 56
    .line 57
    move-object v2, v1

    .line 58
    check-cast v2, Ll/qxh;

    .line 59
    .line 60
    invoke-interface {v2}, Ll/qxh;->b()V

    .line 61
    .line 62
    .line 63
    :cond_2
    instance-of v2, v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;

    .line 64
    .line 65
    if-eqz v2, :cond_3

    .line 66
    .line 67
    check-cast v1, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;

    .line 68
    .line 69
    iget-object v2, p0, Ll/hf70;->j:Lcom/p1/mobile/putong/feed/newui/photoalbum/feed/PhotoAlbumFeedFrag;

    .line 70
    .line 71
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentSeeEntryAndTopicHeaderView;->R(Lcom/p1/mobile/putong/app/PutongFrag;)V

    .line 72
    .line 73
    .line 74
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 75
    .line 76
    goto :goto_0

    .line 77
    :cond_4
    return-void
.end method

.method public final synthetic p0(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/je70;->P0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic q0(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/je70;->R0()V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0
.end method

.method public final synthetic r0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-static {p1, v0, v0, v1}, Ll/cn40;->V(Lcom/p1/mobile/putong/feed/data/Moment;ZZLjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "p_moment_post"

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Ll/hf70;->E0(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public s0()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/hf70;->Y()Ll/ld70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/y670;->s()Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/hf70;->n:Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;

    .line 10
    .line 11
    return-object v0
.end method

.method public final synthetic t0(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/hf70;->X()Ll/v670;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Ll/v670;->b:Ll/n570;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/n570;->k(Lcom/p1/mobile/putong/feed/data/Moment;)Lrx/c;

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic u0(Ljava/lang/Boolean;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p0, v0}, Ll/hf70;->b0(Z)V

    .line 10
    .line 11
    .line 12
    iget p1, p0, Ll/hf70;->u:I

    .line 13
    .line 14
    if-eqz p1, :cond_4

    .line 15
    .line 16
    iget p1, p0, Ll/hf70;->v:I

    .line 17
    .line 18
    const/4 v1, -0x1

    .line 19
    if-eq p1, v1, :cond_1

    .line 20
    .line 21
    iget-boolean p1, p0, Ll/hf70;->t:Z

    .line 22
    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    :cond_1
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    iput p1, p0, Ll/hf70;->v:I

    .line 34
    .line 35
    :cond_2
    iget-boolean p1, p0, Ll/hf70;->t:Z

    .line 36
    .line 37
    if-eqz p1, :cond_3

    .line 38
    .line 39
    iput-boolean v0, p0, Ll/hf70;->t:Z

    .line 40
    .line 41
    :cond_3
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 50
    .line 51
    iget v1, p0, Ll/hf70;->u:I

    .line 52
    .line 53
    iget v2, p0, Ll/hf70;->v:I

    .line 54
    .line 55
    const/high16 v3, 0x42400000    # 48.0f

    .line 56
    .line 57
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    sub-int/2addr v2, v3

    .line 62
    invoke-virtual {p1, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 63
    .line 64
    .line 65
    :cond_4
    invoke-virtual {p0, v0}, Ll/hf70;->c0(Z)V

    .line 66
    .line 67
    .line 68
    :goto_0
    iput v0, p0, Ll/hf70;->u:I

    .line 69
    .line 70
    return-void
.end method

.method public final synthetic v0(Ljava/lang/Integer;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    iget v0, v0, Ll/je70;->g:I

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-ne v0, p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/hf70;->H0()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final synthetic w0()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/je70;->A0()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->clearOnScrollListeners()V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0}, Ll/hf70;->W()Lv/VRecyclerView;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v1, p0, Ll/hf70;->I:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addOnScrollListener(Landroidx/recyclerview/widget/RecyclerView$t;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/hf70;->Y()Ll/ld70;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-boolean v1, p0, Ll/hf70;->s:Z

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/y670;->K(Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 32
    .line 33
    iget-boolean v1, p0, Ll/hf70;->w:Z

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->j5(Z)V

    .line 36
    .line 37
    .line 38
    iget-boolean v0, p0, Ll/hf70;->K:Z

    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    iget-object v0, p0, Ll/hf70;->k:Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;->b5()V

    .line 45
    .line 46
    .line 47
    :cond_0
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 48
    .line 49
    invoke-virtual {v0}, Ll/je70;->U0()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    iget-object v0, p0, Ll/hf70;->m:Ll/je70;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/je70;->x0()V

    .line 58
    .line 59
    .line 60
    :cond_1
    invoke-virtual {p0}, Ll/hf70;->M0()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final synthetic x0(Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;Lcom/p1/mobile/putong/data/OMSData;)V
    .locals 7

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p2, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/OMSSlotsInfo;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/OMSSlotsInfo;->nearbyBanners:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-lez v0, :cond_1

    .line 25
    .line 26
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSData;->slots:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Lcom/p1/mobile/putong/data/OMSSlotsInfo;

    .line 33
    .line 34
    iget-object p2, p2, Lcom/p1/mobile/putong/data/OMSSlotsInfo;->nearbyBanners:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    :cond_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_1

    .line 45
    .line 46
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lcom/p1/mobile/putong/data/NearbyBanner;

    .line 51
    .line 52
    iget-object v2, v0, Lcom/p1/mobile/putong/data/NearbyBanner;->timeRange:Ljava/util/List;

    .line 53
    .line 54
    sget-object v3, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 55
    .line 56
    invoke-virtual {v3}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    const-wide/16 v5, 0x3e8

    .line 61
    .line 62
    div-long/2addr v3, v5

    .line 63
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    check-cast v5, Ljava/lang/Long;

    .line 68
    .line 69
    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    .line 70
    .line 71
    .line 72
    move-result-wide v5

    .line 73
    cmp-long v5, v5, v3

    .line 74
    .line 75
    if-gtz v5, :cond_0

    .line 76
    .line 77
    const/4 v5, 0x1

    .line 78
    invoke-interface {v2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Ljava/lang/Long;

    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 85
    .line 86
    .line 87
    move-result-wide v5

    .line 88
    cmp-long v2, v5, v3

    .line 89
    .line 90
    if-ltz v2, :cond_0

    .line 91
    .line 92
    iget-object v2, v0, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 93
    .line 94
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    if-lez v2, :cond_0

    .line 99
    .line 100
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Ll/hf70;->act()Lcom/p1/mobile/android/app/Act;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    iget-object p2, v0, Lcom/p1/mobile/putong/data/NearbyBanner;->materials:Ljava/util/List;

    .line 108
    .line 109
    iget-wide v0, v0, Lcom/p1/mobile/putong/data/NearbyBanner;->slideshowSec:J

    .line 110
    .line 111
    invoke-virtual {p1, p0, p2, v0, v1}, Lcom/p1/mobile/putong/feed/newui/specialevents/christmas/FeedBannersView;->h(Lcom/p1/mobile/android/app/Act;Ljava/util/List;J)V

    .line 112
    .line 113
    .line 114
    :cond_1
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/feed/data/Group;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hf70;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->b()Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/group/groupdetail/FeedGroupDetailAct$a;->a()Landroid/content/Intent;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic z0(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/hf70;->L:Ll/jl80;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/g1e;->dismiss()V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    new-array p0, p0, [Ll/tfj0$a;

    .line 8
    .line 9
    const-string v0, "e_newuser_checkin_record_pop_get"

    .line 10
    .line 11
    const-string v1, "p_newuser_checkin_record_pop"

    .line 12
    .line 13
    invoke-static {v0, v1, p0}, Ll/tfj0;->b(Ljava/lang/String;Ljava/lang/String;[Ll/tfj0$a;)V

    .line 14
    .line 15
    .line 16
    sget-object p0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/jka;->kc(Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method
