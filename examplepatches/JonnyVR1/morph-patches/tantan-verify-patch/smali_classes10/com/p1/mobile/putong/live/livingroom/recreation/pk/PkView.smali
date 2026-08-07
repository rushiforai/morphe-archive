.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/s680;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

.field public B:Lv/VImage;

.field public C:Lv/VImage;

.field public D:Landroidx/recyclerview/widget/RecyclerView;

.field public E:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public F:Lv/VText;

.field public G:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesContainerView;

.field public H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

.field public I:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public J:Lv/VButton;

.field public K:Lv/VImage;

.field public L:Ll/s680;

.field public M:Landroid/animation/Animator;

.field public N:Ll/k36;

.field public O:Ll/k36;

.field public P:Landroid/animation/AnimatorSet;

.field public Q:Z

.field public a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;

.field public d:Landroid/widget/LinearLayout;

.field public e:Lv/VImage;

.field public f:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;

.field public g:Landroid/widget/TextView;

.field public h:Landroid/view/View;

.field public i:Lv/VImage;

.field public j:Lv/VImage;

.field public k:Landroidx/constraintlayout/widget/ConstraintLayout;

.field public l:Landroid/view/View;

.field public m:Landroid/widget/Space;

.field public n:Lv/VDraweeView;

.field public o:Lv/VText;

.field public p:Lv/VImage;

.field public q:Lv/VText;

.field public r:Landroid/widget/LinearLayout;

.field public s:Lv/VImage;

.field public t:Lv/VImage;

.field public u:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

.field public v:Landroidx/recyclerview/widget/RecyclerView;

.field public w:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

.field public x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

.field public y:Lv/VText;

.field public z:Landroid/widget/LinearLayout;


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

.method private synthetic F(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_FOLLOW_USER:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s680;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_PK_ONCE_MORE:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s680;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_PK_EXIT:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s680;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private synthetic J(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 8
    .line 9
    xor-int/lit8 v1, p1, 0x1

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->o:Lv/VText;

    .line 12
    .line 13
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    new-instance v3, Ll/hb80;

    .line 22
    .line 23
    invoke-direct {v3, p0}, Ll/hb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, v1, v2, v3}, Ll/s680;->p4(ZLjava/lang/String;Ll/y20;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 30
    .line 31
    xor-int/lit8 v1, p1, 0x1

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/ua80;->a(Ll/i6t;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 37
    .line 38
    invoke-static {p0, p1}, Ll/n180;->d(Ll/i6t;Z)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private synthetic K(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    sget-object p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;->ACTION_SHOW_USER_CARD:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s680;->V3(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkAction;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private O(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/s680;->n4(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->J(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->I(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;[JLjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->M([JLjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->O(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->F(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K(Landroid/view/View;)V

    return-void
.end method

.method private h0()V
    .locals 3

    .line 1
    invoke-static {}, Ll/ynp0;->p()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    mul-int/lit16 v0, v0, 0x324

    .line 6
    .line 7
    div-int/lit16 v0, v0, 0x438

    .line 8
    .line 9
    const/high16 v1, 0x42800000    # 64.0f

    .line 10
    .line 11
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    add-int/2addr v0, v1

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 21
    .line 22
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/xzs;->L2()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    const/high16 v2, 0x43200000    # 160.0f

    .line 31
    .line 32
    :goto_0
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    const/high16 v2, 0x43020000    # 130.0f

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :goto_1
    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->topMargin:I

    .line 41
    .line 42
    invoke-static {}, Ll/ynp0;->p()I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    iput v2, v1, Landroid/widget/RelativeLayout$LayoutParams;->width:I

    .line 47
    .line 48
    iput v0, v1, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/cb80;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Ll/cb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public static synthetic i(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->H(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    return-void
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->E()V

    return-void
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->N()V

    return-void
.end method

.method private r()V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->Q:Z

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->B()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/bb80;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/bb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->J:Lv/VButton;

    .line 24
    .line 25
    new-instance v1, Ll/db80;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/db80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->i:Lv/VImage;

    .line 34
    .line 35
    new-instance v1, Ll/eb80;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/eb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 44
    .line 45
    new-instance v1, Ll/fb80;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/fb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 54
    .line 55
    new-instance v1, Ll/gb80;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Ll/gb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 58
    .line 59
    .line 60
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    new-instance v0, Ll/kuf0;

    .line 64
    .line 65
    sget v1, Ll/qa00;->e:I

    .line 66
    .line 67
    const/4 v2, 0x0

    .line 68
    invoke-direct {v0, v1, v2}, Ll/kuf0;-><init>(II)V

    .line 69
    .line 70
    .line 71
    new-instance v3, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    const/4 v5, 0x1

    .line 78
    invoke-direct {v3, v4, v2, v5}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 79
    .line 80
    .line 81
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->v:Landroidx/recyclerview/widget/RecyclerView;

    .line 82
    .line 83
    invoke-virtual {v4, v3}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 84
    .line 85
    .line 86
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->v:Landroidx/recyclerview/widget/RecyclerView;

    .line 87
    .line 88
    invoke-virtual {v3, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 89
    .line 90
    .line 91
    new-instance v0, Ll/guf0;

    .line 92
    .line 93
    invoke-direct {v0, v1, v2}, Ll/guf0;-><init>(II)V

    .line 94
    .line 95
    .line 96
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object v3

    .line 102
    invoke-direct {v1, v3, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 103
    .line 104
    .line 105
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->D:Landroidx/recyclerview/widget/RecyclerView;

    .line 106
    .line 107
    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 108
    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->D:Landroidx/recyclerview/widget/RecyclerView;

    .line 111
    .line 112
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->A()V

    .line 116
    .line 117
    .line 118
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 119
    .line 120
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->y:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->F:Lv/VText;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final B()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public C()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/s680;->g4()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->getLeftScore()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    const-wide/16 v2, 0x0

    .line 16
    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-gtz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->g:Landroid/widget/TextView;

    .line 22
    .line 23
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->getRightScore()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    cmp-long p0, v0, v2

    .line 36
    .line 37
    if-gtz p0, :cond_0

    .line 38
    .line 39
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_0
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final synthetic E()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic I(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic L(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->Z(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic M([JLjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/dw40;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {p5, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    invoke-interface {p3, p5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    const/4 p0, 0x0

    .line 40
    aput-wide v0, p1, p0

    .line 41
    .line 42
    :cond_0
    invoke-static {p5, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_1

    .line 47
    .line 48
    invoke-interface {p3, p5}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 49
    .line 50
    .line 51
    move-result p0

    .line 52
    invoke-interface {p2, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {p0}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide p2

    .line 66
    const/4 p0, 0x1

    .line 67
    aput-wide p2, p1, p0

    .line 68
    .line 69
    :cond_1
    return-void
.end method

.method public final synthetic N()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sub-int/2addr v0, v1

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 23
    .line 24
    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 25
    .line 26
    add-int/2addr v0, v1

    .line 27
    sget v1, Ll/pae;->k:I

    .line 28
    .line 29
    sub-int/2addr v0, v1

    .line 30
    sget v1, Ll/pae;->a:I

    .line 31
    .line 32
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    new-instance v1, Landroid/util/Size;

    .line 49
    .line 50
    const/4 v2, 0x0

    .line 51
    invoke-direct {v1, v2, v0}, Landroid/util/Size;-><init>(II)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public P(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const/high16 p1, 0x428c0000    # 70.0f

    .line 12
    .line 13
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/high16 p1, 0x422c0000    # 43.0f

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :goto_1
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->k:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->w:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->E:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->r:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->z:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->q()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public R(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;ZZ)V
    .locals 6

    .line 1
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/dw40;

    .line 20
    .line 21
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    const-string v2, "liveId"

    .line 26
    .line 27
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    filled-new-array {v1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    const-string v3, "e_pk_adverseprofile_button"

    .line 36
    .line 37
    invoke-static {v3, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-eqz v0, :cond_0

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 55
    .line 56
    invoke-virtual {v1}, Ll/xzs;->E2()Ll/oo2;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    check-cast v1, Ll/dw40;

    .line 61
    .line 62
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 71
    .line 72
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    check-cast v2, Ll/dw40;

    .line 77
    .line 78
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    const-string v3, "anchorId"

    .line 85
    .line 86
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    filled-new-array {v1, v2}, [Ll/pf60;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const-string v2, "e_pk_close_button"

    .line 95
    .line 96
    invoke-static {v2, v0, v1}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_1

    .line 104
    .line 105
    invoke-static {p0, p3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 106
    .line 107
    .line 108
    :cond_1
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->r:Landroid/widget/LinearLayout;

    .line 109
    .line 110
    const/4 v0, 0x0

    .line 111
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 112
    .line 113
    .line 114
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->z:Landroid/widget/LinearLayout;

    .line 115
    .line 116
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 117
    .line 118
    .line 119
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->i:Lv/VImage;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 122
    .line 123
    invoke-virtual {v1}, Ll/xzs;->L2()Z

    .line 124
    .line 125
    .line 126
    move-result v1

    .line 127
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;

    .line 131
    .line 132
    const/4 v1, 0x1

    .line 133
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 137
    .line 138
    .line 139
    move-result p3

    .line 140
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->T(Z)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->A()V

    .line 144
    .line 145
    .line 146
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->h0()V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUser()Lcom/p1/mobile/putong/data/User;

    .line 150
    .line 151
    .line 152
    move-result-object p3

    .line 153
    if-nez p3, :cond_2

    .line 154
    .line 155
    return-void

    .line 156
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->J:Lv/VButton;

    .line 157
    .line 158
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 159
    .line 160
    .line 161
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->n:Lv/VDraweeView;

    .line 162
    .line 163
    invoke-virtual {p3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 164
    .line 165
    .line 166
    move-result-object v3

    .line 167
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    const-string v4, "context_single_room"

    .line 172
    .line 173
    invoke-static {v4, v2, v3}, Ll/izs;->r(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 174
    .line 175
    .line 176
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->o:Lv/VText;

    .line 177
    .line 178
    iget-object p3, p3, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {v2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPunishing()Z

    .line 184
    .line 185
    .line 186
    move-result p3

    .line 187
    if-eqz p3, :cond_6

    .line 188
    .line 189
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->e:Lv/VImage;

    .line 190
    .line 191
    sget v2, Ll/obc0;->I5:I

    .line 192
    .line 193
    invoke-virtual {p3, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 194
    .line 195
    .line 196
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 197
    .line 198
    .line 199
    move-result p3

    .line 200
    if-nez p3, :cond_3

    .line 201
    .line 202
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 203
    .line 204
    invoke-virtual {p3}, Ll/xzs;->L2()Z

    .line 205
    .line 206
    .line 207
    move-result p3

    .line 208
    if-eqz p3, :cond_3

    .line 209
    .line 210
    goto :goto_0

    .line 211
    :cond_3
    move v1, v0

    .line 212
    :goto_0
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->j0(Z)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c0()V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->q()V

    .line 219
    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->i0(Z)V

    .line 222
    .line 223
    .line 224
    if-eqz p2, :cond_5

    .line 225
    .line 226
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 227
    .line 228
    .line 229
    move-result p2

    .line 230
    if-eqz p2, :cond_4

    .line 231
    .line 232
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 233
    .line 234
    .line 235
    move-result-object p2

    .line 236
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)Z

    .line 237
    .line 238
    .line 239
    move-result p2

    .line 240
    if-eqz p2, :cond_4

    .line 241
    .line 242
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 243
    .line 244
    .line 245
    move-result-object p2

    .line 246
    new-instance p3, Ll/ib80;

    .line 247
    .line 248
    invoke-direct {p3, p0, p1}, Ll/ib80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 249
    .line 250
    .line 251
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->U(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Ll/x20;)V

    .line 252
    .line 253
    .line 254
    goto :goto_1

    .line 255
    :cond_4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->k0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 256
    .line 257
    .line 258
    goto :goto_1

    .line 259
    :cond_5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->Z(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 260
    .line 261
    .line 262
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 263
    .line 264
    invoke-virtual {p2}, Ll/s680;->b4()V

    .line 265
    .line 266
    .line 267
    goto :goto_2

    .line 268
    :cond_6
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 269
    .line 270
    .line 271
    move-result p3

    .line 272
    if-eqz p3, :cond_9

    .line 273
    .line 274
    iget-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->e:Lv/VImage;

    .line 275
    .line 276
    sget v0, Ll/obc0;->a5:I

    .line 277
    .line 278
    invoke-virtual {p3, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 279
    .line 280
    .line 281
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 282
    .line 283
    .line 284
    move-result p3

    .line 285
    if-eqz p3, :cond_7

    .line 286
    .line 287
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 288
    .line 289
    .line 290
    move-result-object p3

    .line 291
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)V

    .line 292
    .line 293
    .line 294
    :cond_7
    if-eqz p2, :cond_9

    .line 295
    .line 296
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 297
    .line 298
    .line 299
    move-result p2

    .line 300
    if-eqz p2, :cond_8

    .line 301
    .line 302
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 303
    .line 304
    .line 305
    move-result-object p2

    .line 306
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)Z

    .line 307
    .line 308
    .line 309
    move-result p2

    .line 310
    if-eqz p2, :cond_8

    .line 311
    .line 312
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getPkBountyData()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;

    .line 313
    .line 314
    .line 315
    move-result-object p2

    .line 316
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->V(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)V

    .line 317
    .line 318
    .line 319
    goto :goto_2

    .line 320
    :cond_8
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->I:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 321
    .line 322
    const-string p3, "https://auto.tancdn.com/v1/raw/93619dd5-494b-44ef-9a8c-1083f27365fa11.so"

    .line 323
    .line 324
    invoke-virtual {p2, p3, v1}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->j(Ljava/lang/String;I)V

    .line 325
    .line 326
    .line 327
    :cond_9
    :goto_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object p2

    .line 331
    iget-object p3, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 332
    .line 333
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 334
    .line 335
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->points:Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;

    .line 336
    .line 337
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;->userId:Ljava/util/List;

    .line 338
    .line 339
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLivePkPointList;->point:Ljava/util/List;

    .line 340
    .line 341
    invoke-virtual {p0, p2, v0, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->Y(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V

    .line 342
    .line 343
    .line 344
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 345
    .line 346
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 347
    .line 348
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->currentStageInfo:Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;

    .line 349
    .line 350
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkCurrentStageInfo;->stage:Lcom/p1/mobile/putong/live/base/data/BLivePkStage;

    .line 351
    .line 352
    const-string p3, "punishing"

    .line 353
    .line 354
    invoke-static {p2, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 355
    .line 356
    .line 357
    move-result v3

    .line 358
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getHostContributors()Ljava/util/List;

    .line 359
    .line 360
    .line 361
    move-result-object v1

    .line 362
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherContributors()Ljava/util/List;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 367
    .line 368
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 369
    .line 370
    iget-boolean v4, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 371
    .line 372
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->winnerId:Ljava/lang/String;

    .line 373
    .line 374
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorId()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object p3

    .line 378
    invoke-static {p2, p3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 379
    .line 380
    .line 381
    move-result v5

    .line 382
    move-object v0, p0

    .line 383
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->W(Ljava/util/List;Ljava/util/List;ZZZ)V

    .line 384
    .line 385
    .line 386
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->X(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 387
    .line 388
    .line 389
    return-void
.end method

.method public S(Lv/VText;D)V
    .locals 8

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmpl-double v0, p2, v0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v2, "\u00a5 "

    .line 15
    .line 16
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->y(Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 31
    .line 32
    .line 33
    invoke-static {v1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {p1, p0, p0}, Landroid/view/View;->measure(II)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p1}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 49
    .line 50
    int-to-float v3, p0

    .line 51
    const-string p0, "#ffc73e"

    .line 52
    .line 53
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result p3

    .line 57
    const-string v1, "#ffeab7"

    .line 58
    .line 59
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    filled-new-array {p3, v1, p0}, [I

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    const/4 p0, 0x3

    .line 72
    new-array v6, p0, [F

    .line 73
    .line 74
    fill-array-data v6, :array_0

    .line 75
    .line 76
    .line 77
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 78
    .line 79
    const/4 v1, 0x0

    .line 80
    const/4 v2, 0x0

    .line 81
    const/4 v4, 0x0

    .line 82
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    nop

    .line 93
    :array_0
    .array-data 4
        0x3e800000    # 0.25f
        0x3f000000    # 0.5f
        0x3f400000    # 0.75f
    .end array-data
.end method

.method public final T(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final U(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Ll/x20;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final V(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->H:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/bounty/PkBountyView;->j(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;Ll/x20;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public W(Ljava/util/List;Ljava/util/List;ZZZ)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;ZZZ)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "renderContributors isPunishStage:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",hostContributors:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",otherContributors: "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->N:Ll/k36;

    .line 43
    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    new-instance v0, Ll/k36;

    .line 47
    .line 48
    new-instance v1, Ll/jb80;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ll/jb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 51
    .line 52
    .line 53
    invoke-direct {v0, v1}, Ll/k36;-><init>(Ll/y20;)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->N:Ll/k36;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->v:Landroidx/recyclerview/widget/RecyclerView;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->N:Ll/k36;

    .line 64
    .line 65
    const/4 v2, 0x1

    .line 66
    move-object v1, p0

    .line 67
    move-object v3, p1

    .line 68
    move v4, p3

    .line 69
    move v5, p4

    .line 70
    move v6, p5

    .line 71
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->u(ZLjava/util/List;ZZZ)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {v0, p0}, Ll/k36;->I(Ljava/util/List;)V

    .line 76
    .line 77
    .line 78
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->O:Ll/k36;

    .line 79
    .line 80
    if-nez p0, :cond_1

    .line 81
    .line 82
    new-instance p0, Ll/k36;

    .line 83
    .line 84
    new-instance p3, Ll/jb80;

    .line 85
    .line 86
    invoke-direct {p3, v1}, Ll/jb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 87
    .line 88
    .line 89
    invoke-direct {p0, p3}, Ll/k36;-><init>(Ll/y20;)V

    .line 90
    .line 91
    .line 92
    iput-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->O:Ll/k36;

    .line 93
    .line 94
    iget-object p3, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->D:Landroidx/recyclerview/widget/RecyclerView;

    .line 95
    .line 96
    invoke-virtual {p3, p0}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 97
    .line 98
    .line 99
    :cond_1
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->O:Ll/k36;

    .line 100
    .line 101
    xor-int/lit8 v6, v6, 0x1

    .line 102
    .line 103
    const/4 v2, 0x0

    .line 104
    move-object v3, p2

    .line 105
    invoke-virtual/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->u(ZLjava/util/List;ZZZ)Ljava/util/List;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p0, p2}, Ll/k36;->I(Ljava/util/List;)V

    .line 110
    .line 111
    .line 112
    iget-object p0, v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 113
    .line 114
    if-eqz p0, :cond_2

    .line 115
    .line 116
    invoke-virtual {p0, p1, v3}, Ll/s680;->t4(Ljava/util/List;Ljava/util/List;)V

    .line 117
    .line 118
    .line 119
    :cond_2
    return-void
.end method

.method public final X(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/dw40;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/dw40;->p()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 24
    .line 25
    invoke-static {p1, v0}, Ll/ua80;->b(Landroid/view/View;Ll/i6t;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 39
    .line 40
    invoke-static {p1, v0, p0}, Ll/c680;->n(Landroid/content/Context;Landroid/view/View;Landroid/view/ViewGroup;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPking()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-static {p1}, Ll/c680;->l(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 55
    .line 56
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 62
    .line 63
    .line 64
    :cond_1
    return-void
.end method

.method public Y(Ljava/lang/String;Ljava/util/List;Ljava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v3, v0, [J

    .line 3
    .line 4
    fill-array-data v3, :array_0

    .line 5
    .line 6
    .line 7
    new-instance v1, Ll/lb80;

    .line 8
    .line 9
    move-object v2, p0

    .line 10
    move-object v6, p1

    .line 11
    move-object v5, p2

    .line 12
    move-object v4, p3

    .line 13
    invoke-direct/range {v1 .. v6}, Ll/lb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;[JLjava/util/List;Ljava/util/List;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-static {v5, v1}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    iget-object v4, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    aget-wide v5, v3, p0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    aget-wide v7, v3, p1

    .line 26
    .line 27
    const/4 v9, 0x0

    .line 28
    const/4 v10, 0x0

    .line 29
    invoke-virtual/range {v4 .. v10}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->b(JJZZ)V

    .line 30
    .line 31
    .line 32
    iget-object p2, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 33
    .line 34
    aget-wide v0, v3, p0

    .line 35
    .line 36
    aget-wide p0, v3, p1

    .line 37
    .line 38
    invoke-static {p2, v0, v1, p0, p1}, Ll/n180;->n(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;JJ)V

    .line 39
    .line 40
    .line 41
    iget-object p0, v2, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 42
    .line 43
    invoke-virtual {p0}, Ll/s680;->Y3()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :array_0
    .array-data 8
        0x0
        0x0
    .end array-data
.end method

.method public Z(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->r:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->z:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 15
    .line 16
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->s:Lv/VImage;

    .line 21
    .line 22
    sget v1, Ll/obc0;->S5:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->B:Lv/VImage;

    .line 28
    .line 29
    sget v1, Ll/obc0;->S5:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 32
    .line 33
    .line 34
    goto :goto_2

    .line 35
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 40
    .line 41
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 42
    .line 43
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->winnerId:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->s:Lv/VImage;

    .line 50
    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    sget v2, Ll/obc0;->W4:I

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_1
    sget v2, Ll/obc0;->Q5:I

    .line 57
    .line 58
    :goto_0
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->B:Lv/VImage;

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    sget v0, Ll/obc0;->Q5:I

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    sget v0, Ll/obc0;->W4:I

    .line 69
    .line 70
    :goto_1
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    const-string v1, "pkInfo anchorWinTimes:"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v1, ",otherWinTimes:"

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherWinTimes()J

    .line 93
    .line 94
    .line 95
    move-result-wide v1

    .line 96
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const-string v1, "LivePkConstant"

    .line 104
    .line 105
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :goto_2
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 109
    .line 110
    .line 111
    return-void
.end method

.method public a0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)V
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->y:Lv/VText;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->F:Lv/VText;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->y:Lv/VText;

    .line 16
    .line 17
    sget v1, Ll/obc0;->H4:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->F:Lv/VText;

    .line 23
    .line 24
    sget v1, Ll/obc0;->H4:I

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->y:Lv/VText;

    .line 30
    .line 31
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->getAnchorBounty()D

    .line 32
    .line 33
    .line 34
    move-result-wide v1

    .line 35
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->S(Lv/VText;D)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->F:Lv/VText;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->getOtherBounty()D

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    invoke-virtual {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->S(Lv/VText;D)V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public final b0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->u:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->e()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->A:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->e()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isBountyPk()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_3

    .line 16
    .line 17
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/vwt;->V4()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_3

    .line 26
    .line 27
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->showWinTimesTag:Z

    .line 28
    .line 29
    if-nez v0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 35
    .line 36
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->u:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->c(J)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->A:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 50
    .line 51
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherWinTimes()J

    .line 52
    .line 53
    .line 54
    move-result-wide v0

    .line 55
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->c(J)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->winnerId:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v0, v1}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->A:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherWinTimes()J

    .line 78
    .line 79
    .line 80
    move-result-wide v1

    .line 81
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->d(J)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->u:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 87
    .line 88
    .line 89
    move-result-wide v0

    .line 90
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->b(J)V

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->u:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getAnchorWinTimes()J

    .line 97
    .line 98
    .line 99
    move-result-wide v1

    .line 100
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->d(J)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->A:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->getOtherWinTimes()J

    .line 106
    .line 107
    .line 108
    move-result-wide v0

    .line 109
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/wintimes/PkWinTimesResultView;->b(J)V

    .line 110
    .line 111
    .line 112
    :cond_3
    :goto_0
    return-void
.end method

.method public c0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    sget v1, Ll/obc0;->w:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c:Landroid/view/View;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 15
    .line 16
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final d0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;)Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return p0

    .line 5
    :cond_0
    const-string v0, "svga"

    .line 6
    .line 7
    invoke-static {v0}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->getAnchorResource()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;->resourceId:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, p0}, Ll/ere;->h(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveEffect;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v0, p0}, Ll/l4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveEffect;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    xor-int/lit8 p0, p0, 0x1

    .line 37
    .line 38
    return p0
.end method

.method public destroy()V
    .locals 0

    return-void
.end method

.method public e0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    const/16 v1, 0x50

    .line 10
    .line 11
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 12
    .line 13
    const/high16 v1, 0x41a00000    # 20.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public f0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    const/16 v1, 0x30

    .line 10
    .line 11
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 12
    .line 13
    const/high16 v1, 0x42340000    # 45.0f

    .line 14
    .line 15
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P(Z)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public final g0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->J:Lv/VButton;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->g:Landroid/widget/TextView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->r:Landroid/widget/LinearLayout;

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->z:Landroid/widget/LinearLayout;

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->B()V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->p0()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public getFollowView()Landroid/view/View;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->Q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->q:Lv/VText;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->p:Lv/VImage;

    .line 9
    .line 10
    return-object p0
.end method

.method public getWithdrawSVGAUrl()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/xau;->B()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "https://auto.tancdn.com/v1/raw/03d44a3b-6cb4-4bc1-bf0a-36fdef9e62f610.so"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/raw/ba848057-1f40-41ee-b4ba-5f13b78c2cfe11.so"

    .line 11
    .line 12
    return-object p0
.end method

.method public i0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->g:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/s680;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->p(Ll/s680;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public j0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->J:Lv/VButton;

    .line 2
    .line 3
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public k0(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;)V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 9
    .line 10
    iget-boolean v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->isTied:Z

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->w:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getWithdrawSVGAUrl()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1, v1, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->E:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getWithdrawSVGAUrl()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p1, p0, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->otherUserId()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->pk:Lcom/p1/mobile/putong/live/base/data/BLivePk;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->situation:Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;

    .line 41
    .line 42
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkSituation;->winnerId:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v1, p1}, Ll/a9g0;->l(Ljava/lang/String;Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->w:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 49
    .line 50
    xor-int/lit8 v3, p1, 0x1

    .line 51
    .line 52
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->x(Z)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v1, v3, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 57
    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->E:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;

    .line 60
    .line 61
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->x(Z)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v1, p0, v2, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/AutoVisibleEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public l0(I)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->q()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-gtz p1, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c0()V

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 11
    .line 12
    iget-object p1, p1, Ll/s680;->i:Ll/ha80;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/ha80;->N3()Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkData;->isPlaying()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->i0(Z)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->x:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;

    .line 28
    .line 29
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/PkFirstGiftView;->p0()V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/s680;->b4()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c:Landroid/view/View;

    .line 39
    .line 40
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 41
    .line 42
    .line 43
    move-result p1

    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c:Landroid/view/View;

    .line 47
    .line 48
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;

    .line 57
    .line 58
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d:Landroid/widget/LinearLayout;

    .line 62
    .line 63
    invoke-static {}, Ll/dox;->e()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/high16 v1, 0x41d00000    # 26.0f

    .line 68
    .line 69
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-static {v1}, Ll/dox;->b(I)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-virtual {p1, v0, v1}, Landroid/view/View;->measure(II)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c:Landroid/view/View;

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 87
    .line 88
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d:Landroid/widget/LinearLayout;

    .line 89
    .line 90
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d:Landroid/widget/LinearLayout;

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 103
    .line 104
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c:Landroid/view/View;

    .line 105
    .line 106
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d:Landroid/widget/LinearLayout;

    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d:Landroid/widget/LinearLayout;

    .line 126
    .line 127
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 134
    .line 135
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 136
    .line 137
    .line 138
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c:Landroid/view/View;

    .line 139
    .line 140
    sget v0, Ll/obc0;->w0:I

    .line 141
    .line 142
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 143
    .line 144
    .line 145
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 146
    .line 147
    sget v0, Ll/obc0;->w0:I

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->d:Landroid/widget/LinearLayout;

    .line 153
    .line 154
    sget v0, Ll/obc0;->Na:I

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 157
    .line 158
    .line 159
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c:Landroid/view/View;

    .line 160
    .line 161
    sget-object v2, Ll/gt0;->i:Landroid/util/Property;

    .line 162
    .line 163
    sget-object v9, Ll/gt0;->a:Landroid/view/animation/Interpolator;

    .line 164
    .line 165
    const/4 p1, 0x3

    .line 166
    new-array v8, p1, [F

    .line 167
    .line 168
    fill-array-data v8, :array_0

    .line 169
    .line 170
    .line 171
    const-wide/16 v3, 0x0

    .line 172
    .line 173
    const-wide/16 v5, 0x3e8

    .line 174
    .line 175
    move-object v7, v9

    .line 176
    invoke-static/range {v1 .. v8}, Ll/gt0;->l(Landroid/view/View;Landroid/util/Property;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 181
    .line 182
    new-instance v7, Landroid/view/animation/LinearInterpolator;

    .line 183
    .line 184
    invoke-direct {v7}, Landroid/view/animation/LinearInterpolator;-><init>()V

    .line 185
    .line 186
    .line 187
    const/4 v2, 0x2

    .line 188
    new-array v8, v2, [F

    .line 189
    .line 190
    fill-array-data v8, :array_1

    .line 191
    .line 192
    .line 193
    const-string v2, "alpha"

    .line 194
    .line 195
    invoke-static/range {v1 .. v8}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 200
    .line 201
    new-array v10, p1, [F

    .line 202
    .line 203
    fill-array-data v10, :array_2

    .line 204
    .line 205
    .line 206
    const-string v4, "scaleX"

    .line 207
    .line 208
    const-wide/16 v5, 0x0

    .line 209
    .line 210
    const-wide/16 v7, 0x3e8

    .line 211
    .line 212
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->b:Landroid/view/View;

    .line 217
    .line 218
    new-array v10, p1, [F

    .line 219
    .line 220
    fill-array-data v10, :array_3

    .line 221
    .line 222
    .line 223
    const-string v4, "scaleY"

    .line 224
    .line 225
    invoke-static/range {v3 .. v10}, Ll/gt0;->p(Landroid/view/View;Ljava/lang/String;JJLandroid/view/animation/Interpolator;[F)Landroid/animation/Animator;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    filled-new-array {v0, v1, v2, p1}, [Landroid/animation/Animator;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    invoke-static {p1}, Ll/gt0;->z([Landroid/animation/Animator;)Landroid/animation/Animator;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->M:Landroid/animation/Animator;

    .line 238
    .line 239
    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3fa66666    # 1.3f
        0x3f800000    # 1.0f
    .end array-data

    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    :array_2
    .array-data 4
        0x3f800000    # 1.0f
        0x3fa66666    # 1.3f
        0x3fb33333    # 1.4f
    .end array-data

    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    :array_3
    .array-data 4
        0x3f800000    # 1.0f
        0x3fa66666    # 1.3f
        0x3fe00000    # 1.75f
    .end array-data
.end method

.method public m0(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->n0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hc80;->a(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public n0(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/view/View;->setSelected(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public o0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->f:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkTimeView;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->q()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 15
    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

    .line 19
    .line 20
    :cond_0
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->n(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public p(Ll/s680;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->M:Landroid/animation/Animator;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->M:Landroid/animation/Animator;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public s(ZLcom/p1/mobile/putong/data/User;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    invoke-static {}, Ll/tfs;->k()Ll/tfs$a;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 9
    .line 10
    invoke-virtual {v2}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    invoke-virtual {v1, v2, v0}, Ll/tfs$a;->b(Ll/oo2;Z)Ll/tfs$a;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const-string v2, "live_pk_main"

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ll/tfs$a;->e(Ljava/lang/String;)Ll/tfs$a;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object p2, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1, p2}, Ll/tfs$a;->h(Ljava/lang/String;)Ll/tfs$a;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 31
    .line 32
    invoke-virtual {v1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {p2}, Ll/tfs$a;->a()Ll/tfs;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-static {v1, p2}, Ll/afu;->d(Ljava/lang/String;Ll/tfs;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    if-eqz p1, :cond_2

    .line 44
    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->w()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->B()V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iget-boolean p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->Q:Z

    .line 64
    .line 65
    if-eqz p2, :cond_3

    .line 66
    .line 67
    const/high16 p2, 0x41400000    # 12.0f

    .line 68
    .line 69
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 74
    .line 75
    .line 76
    move-result-object p3

    .line 77
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->D4:I

    .line 78
    .line 79
    invoke-virtual {p3, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p3

    .line 83
    const/16 v1, 0xa

    .line 84
    .line 85
    invoke-static {v1, p3}, Ll/ynp0;->s(ILjava/lang/String;)I

    .line 86
    .line 87
    .line 88
    move-result p3

    .line 89
    add-int/2addr p2, p3

    .line 90
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    sget p3, Ll/iac0;->b:I

    .line 98
    .line 99
    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 100
    .line 101
    .line 102
    move-result p2

    .line 103
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 104
    .line 105
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-virtual {p2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    const/high16 p2, 0x3f800000    # 1.0f

    .line 117
    .line 118
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    const/4 p2, 0x1

    .line 126
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 127
    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->o:Lv/VText;

    .line 130
    .line 131
    const/high16 p2, 0x40800000    # 4.0f

    .line 132
    .line 133
    invoke-static {p2}, Ll/bnl0;->w(F)I

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    invoke-virtual {p1, v0, v0, p2, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/xzs;->R2()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 147
    .line 148
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    check-cast p0, Ll/dw40;

    .line 153
    .line 154
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    const-string p2, "liveId"

    .line 159
    .line 160
    invoke-static {p2, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object p0

    .line 164
    filled-new-array {p0}, [Ll/pf60;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const-string p2, "e_pk_adverseprofile_button"

    .line 169
    .line 170
    invoke-static {p2, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 171
    .line 172
    .line 173
    return-void
.end method

.method public final u(ZLjava/util/List;ZZZ)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;",
            ">;ZZZ)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;",
            ">;"
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
    const/4 v0, 0x0

    .line 7
    :goto_0
    const/4 v1, 0x3

    .line 8
    if-ge v0, v1, :cond_3

    .line 9
    .line 10
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-le v1, v0, :cond_1

    .line 23
    .line 24
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    move-object v2, v1

    .line 29
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;

    .line 30
    .line 31
    :cond_1
    :goto_1
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 32
    .line 33
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setHost(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setRank(I)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1, p3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setPunishStage(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-virtual {v1, p4}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setTied(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1, p5}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setSuccess(Z)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-eqz v3, :cond_2

    .line 61
    .line 62
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->image:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setAvatarUrl(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    iget-object v3, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->userId:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setUserId(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    iget-wide v2, v2, Lcom/p1/mobile/putong/live/base/data/BLivePkContributor;->point:J

    .line 75
    .line 76
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;->setScore(J)Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkContributor;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    :cond_2
    invoke-interface {p0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    add-int/lit8 v0, v0, 0x1

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    return-object p0
.end method

.method public v()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->L:Ll/s680;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Landroid/util/Size;

    .line 14
    .line 15
    sget v2, Ll/pae;->a:I

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-direct {v1, v3, v2}, Landroid/util/Size;-><init>(II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "pkView endPk"

    .line 25
    .line 26
    invoke-static {v0}, Ll/n180;->j(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->q()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->z()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->a:Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/view/LivePkScoreView;->a()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->c0()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->g0()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->K:Lv/VImage;

    .line 47
    .line 48
    invoke-virtual {p0, v3}, Landroid/view/View;->setSelected(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final w()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x2

    .line 23
    new-array v1, v1, [F

    .line 24
    .line 25
    fill-array-data v1, :array_0

    .line 26
    .line 27
    .line 28
    sget-object v2, Landroid/view/View;->ALPHA:Landroid/util/Property;

    .line 29
    .line 30
    invoke-static {v0, v2, v1}, Ll/gt0;->n(Landroid/view/View;Landroid/util/Property;[F)Landroid/animation/Animator;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-wide/16 v1, 0x12c

    .line 35
    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3}, Landroid/view/View;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->getFollowView()Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    sget-object v5, Ll/it0;->n:Landroid/util/Property;

    .line 52
    .line 53
    const/4 v6, 0x0

    .line 54
    filled-new-array {v3, v6}, [I

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v4, v5, v3}, Ll/gt0;->o(Landroid/view/View;Landroid/util/Property;[I)Landroid/animation/Animator;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v3, v1, v2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    .line 63
    .line 64
    .line 65
    const-wide/16 v1, 0xc8

    .line 66
    .line 67
    invoke-virtual {v3, v1, v2}, Landroid/animation/Animator;->setStartDelay(J)V

    .line 68
    .line 69
    .line 70
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 71
    .line 72
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 73
    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

    .line 76
    .line 77
    invoke-virtual {v1, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 82
    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

    .line 85
    .line 86
    const-wide/16 v1, 0x1f4

    .line 87
    .line 88
    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->P:Landroid/animation/AnimatorSet;

    .line 97
    .line 98
    new-instance v1, Ll/kb80;

    .line 99
    .line 100
    invoke-direct {v1, p0}, Ll/kb80;-><init>(Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;)V

    .line 101
    .line 102
    .line 103
    invoke-static {v0, v1}, Ll/gt0;->f(Landroid/animation/Animator;Ljava/lang/Runnable;)Landroid/animation/Animator;

    .line 104
    .line 105
    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/PkView;->o:Lv/VText;

    .line 107
    .line 108
    const/high16 v0, 0x41000000    # 8.0f

    .line 109
    .line 110
    invoke-static {v0}, Ll/bnl0;->w(F)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    invoke-virtual {p0, v6, v6, v0, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 115
    .line 116
    .line 117
    return-void

    .line 118
    nop

    .line 119
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public x(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {}, Ll/xau;->B()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const-string p0, "https://auto.tancdn.com/v1/raw/9eed85f0-5fe1-4b0f-95cc-62e8487779e710.so"

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "https://auto.tancdn.com/v1/raw/b4b99d72-60fe-4981-9c2f-ddea917d35ed10.so"

    .line 13
    .line 14
    return-object p0

    .line 15
    :cond_1
    invoke-static {}, Ll/xau;->B()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const-string p0, "https://auto.tancdn.com/v1/raw/bb18850a-2de2-4b87-8b20-cbf4a1e252f311.so"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_2
    const-string p0, "https://auto.tancdn.com/v1/raw/ec10154f-9a3c-4139-a345-babc7e5eaae711.so"

    .line 25
    .line 26
    return-object p0
.end method

.method public y(Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .locals 7

    .line 1
    new-instance p0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Lv/text/CustomTypefaceSpan;

    .line 7
    .line 8
    const/4 v1, 0x3

    .line 9
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const-string v3, "#ffc73e"

    .line 14
    .line 15
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v4

    .line 19
    const-string v5, "sans-serif"

    .line 20
    .line 21
    invoke-direct {v0, v5, v2, v4}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;I)V

    .line 22
    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    const/4 v4, 0x1

    .line 26
    const/16 v6, 0x21

    .line 27
    .line 28
    invoke-virtual {p0, v0, v2, v4, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Lv/text/CustomTypefaceSpan;

    .line 32
    .line 33
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-direct {v0, v5, v1, v2}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    invoke-virtual {p0, v0, v4, p1, v6}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 49
    .line 50
    .line 51
    return-object p0
.end method

.method public z()V
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
