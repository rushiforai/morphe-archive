.class public Ll/acn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/acn$b;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/vbn;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/google/android/material/tabs/TabLayout;

.field public b:Lv/VRecyclerView;

.field public c:Lv/VRecyclerView;

.field public d:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public f:Ll/vbn;


# direct methods
.method public constructor <init>(Landroid/widget/FrameLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/acn;->i(Landroid/widget/FrameLayout;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ll/acn;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/acn;->k(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    return-void
.end method

.method public static synthetic b(Ll/acn;Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/acn;->m(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    return-void
.end method

.method public static synthetic c(Ll/acn;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/acn;->j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d(Ll/acn;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/acn;->l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic e(Ll/acn;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/acn;->q(I)V

    return-void
.end method

.method private n(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/acn;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->removeAllTabs()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/acn;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/android/material/tabs/TabLayout;->clearOnTabSelectedListeners()V

    .line 9
    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

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
    const/4 v0, 0x0

    .line 19
    move v1, v0

    .line 20
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-ge v1, v2, :cond_1

    .line 25
    .line 26
    iget-object v2, p0, Ll/acn;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 27
    .line 28
    invoke-virtual {v2}, Lcom/google/android/material/tabs/TabLayout;->newTab()Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    new-instance v3, Lv/VText;

    .line 33
    .line 34
    iget-object v4, p0, Ll/acn;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 35
    .line 36
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-direct {v3, v4}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    const/high16 v4, 0x41500000    # 13.0f

    .line 44
    .line 45
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    const/high16 v6, 0x40c00000    # 6.0f

    .line 50
    .line 51
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v7

    .line 55
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v4

    .line 59
    invoke-static {v6}, Ll/qa00;->d(F)I

    .line 60
    .line 61
    .line 62
    move-result v6

    .line 63
    invoke-virtual {v3, v5, v7, v4, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 64
    .line 65
    .line 66
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    check-cast v4, Ljava/lang/CharSequence;

    .line 71
    .line 72
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    sget v4, Ll/obc0;->X6:I

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 78
    .line 79
    .line 80
    const/high16 v4, 0x41600000    # 14.0f

    .line 81
    .line 82
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextSize(F)V

    .line 83
    .line 84
    .line 85
    const/4 v4, 0x1

    .line 86
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 87
    .line 88
    .line 89
    const-string v4, "#66ffffff"

    .line 90
    .line 91
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 96
    .line 97
    .line 98
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    .line 99
    .line 100
    sget v5, Ll/bnl0;->f:I

    .line 101
    .line 102
    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2, v3}, Lcom/google/android/material/tabs/TabLayout$Tab;->setCustomView(Landroid/view/View;)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 109
    .line 110
    .line 111
    iget-object v3, p0, Ll/acn;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 112
    .line 113
    invoke-virtual {v3, v2}, Lcom/google/android/material/tabs/TabLayout;->addTab(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 114
    .line 115
    .line 116
    add-int/lit8 v1, v1, 0x1

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_1
    new-instance p1, Ll/acn$a;

    .line 120
    .line 121
    invoke-direct {p1, p0}, Ll/acn$a;-><init>(Ll/acn;)V

    .line 122
    .line 123
    .line 124
    iget-object v1, p0, Ll/acn;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 125
    .line 126
    invoke-virtual {v1, p1}, Lcom/google/android/material/tabs/TabLayout;->addOnTabSelectedListener(Lcom/google/android/material/tabs/TabLayout$OnTabSelectedListener;)V

    .line 127
    .line 128
    .line 129
    iget-object p0, p0, Ll/acn;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Lcom/google/android/material/tabs/TabLayout;->getTabAt(I)Lcom/google/android/material/tabs/TabLayout$Tab;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-interface {p1, p0}, Lcom/google/android/material/tabs/TabLayout$BaseOnTabSelectedListener;->onTabSelected(Lcom/google/android/material/tabs/TabLayout$Tab;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Ll/vbn;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/acn;->f:Ll/vbn;

    .line 2
    .line 3
    return-void
.end method

.method public final i(Landroid/widget/FrameLayout;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/yec0;->r2:I

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget v1, Ll/mdc0;->v6:I

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/google/android/material/tabs/TabLayout;

    .line 23
    .line 24
    iput-object v1, p0, Ll/acn;->a:Lcom/google/android/material/tabs/TabLayout;

    .line 25
    .line 26
    sget v1, Ll/mdc0;->k1:I

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lv/VRecyclerView;

    .line 33
    .line 34
    iput-object v1, p0, Ll/acn;->b:Lv/VRecyclerView;

    .line 35
    .line 36
    sget v1, Ll/mdc0;->O4:I

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lv/VRecyclerView;

    .line 43
    .line 44
    iput-object v1, p0, Ll/acn;->c:Lv/VRecyclerView;

    .line 45
    .line 46
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 47
    .line 48
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    const/4 v3, 0x7

    .line 53
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Ll/acn;->b:Lv/VRecyclerView;

    .line 57
    .line 58
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 59
    .line 60
    .line 61
    new-instance v1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 62
    .line 63
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object v1, p0, Ll/acn;->d:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 67
    .line 68
    iget-object v2, p0, Ll/acn;->b:Lv/VRecyclerView;

    .line 69
    .line 70
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 71
    .line 72
    .line 73
    iget-object v1, p0, Ll/acn;->b:Lv/VRecyclerView;

    .line 74
    .line 75
    new-instance v2, Ll/acn$b;

    .line 76
    .line 77
    invoke-direct {v2}, Ll/acn$b;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 81
    .line 82
    .line 83
    new-instance v1, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    const/4 v3, 0x4

    .line 90
    invoke-direct {v1, v2, v3}, Landroidx/recyclerview/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    .line 91
    .line 92
    .line 93
    iget-object v2, p0, Ll/acn;->c:Lv/VRecyclerView;

    .line 94
    .line 95
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 96
    .line 97
    .line 98
    new-instance v1, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 99
    .line 100
    invoke-direct {v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object v1, p0, Ll/acn;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 104
    .line 105
    iget-object v2, p0, Ll/acn;->c:Lv/VRecyclerView;

    .line 106
    .line 107
    invoke-virtual {v2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Ll/acn;->c:Lv/VRecyclerView;

    .line 111
    .line 112
    new-instance v1, Ll/acn$b;

    .line 113
    .line 114
    invoke-direct {v1}, Ll/acn$b;-><init>()V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 118
    .line 119
    .line 120
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 121
    .line 122
    sget v1, Ll/bnl0;->e:I

    .line 123
    .line 124
    invoke-direct {p0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1, v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 128
    .line 129
    .line 130
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/vbn;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/acn;->f(Ll/vbn;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/acn;->f:Ll/vbn;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->type:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    invoke-virtual {p0, p1, p2}, Ll/vbn;->O3(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic k(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fbn;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/fbn;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/zbn;

    .line 10
    .line 11
    invoke-direct {p1, p0, p2}, Ll/zbn;-><init>(Ll/acn;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic l(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/acn;->f:Ll/vbn;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;->type:Ljava/lang/String;

    .line 4
    .line 5
    const/4 p2, 0x1

    .line 6
    invoke-virtual {p0, p1, p2}, Ll/vbn;->O3(Ljava/lang/String;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic m(Ljava/util/ArrayList;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V
    .locals 1

    .line 1
    new-instance v0, Ll/cap;

    .line 2
    .line 3
    invoke-direct {v0, p2}, Ll/cap;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    new-instance p1, Ll/ybn;

    .line 10
    .line 11
    invoke-direct {p1, p0, p2}, Ll/ybn;-><init>(Ll/acn;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ll/d3q;->A(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public p(Ljava/util/List;Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceEmojiMenuButton;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/acn;->n(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v0, Ll/wbn;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Ll/wbn;-><init>(Ll/acn;Ljava/util/ArrayList;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p0, Ll/acn;->d:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 18
    .line 19
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance p2, Ll/xbn;

    .line 28
    .line 29
    invoke-direct {p2, p0, p1}, Ll/xbn;-><init>(Ll/acn;Ljava/util/ArrayList;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p3, p2}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/acn;->e:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->Z(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final q(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/acn;->b:Lv/VRecyclerView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    move v3, v2

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    move v3, v1

    .line 10
    :goto_0
    invoke-static {v0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Ll/acn;->c:Lv/VRecyclerView;

    .line 14
    .line 15
    if-eqz p1, :cond_1

    .line 16
    .line 17
    move v1, v2

    .line 18
    :cond_1
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    return-void
.end method
