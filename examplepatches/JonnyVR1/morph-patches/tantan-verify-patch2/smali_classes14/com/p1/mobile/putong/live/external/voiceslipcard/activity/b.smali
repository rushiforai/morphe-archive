.class public Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/x1v;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VFrame;

.field public b:Landroid/widget/LinearLayout;

.field public c:Lv/navigationbar/VNavigationBar;

.field public d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

.field public e:Lv/VRecyclerView;

.field public f:Lv/VRelative;

.field public g:Lv/VImage;

.field public h:Lv/VText;

.field public i:Lv/VRelative;

.field public j:Lv/VImage;

.field public k:Lv/VText;

.field public l:Lcom/p1/mobile/android/app/Act;

.field public m:Ll/x1v;

.field public n:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

.field public o:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->n:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    iput-boolean p2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 14
    .line 15
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->u()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;I)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0, p1}, Ll/evo0;->e(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;ZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->v(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    return-void
.end method

.method public static synthetic d(Ljava/lang/String;Ll/d3q;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->userId:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public static synthetic e()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->s(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;)Ll/x1v;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->m:Ll/x1v;

    return-object p0
.end method

.method private p(I)I
    .locals 0

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    if-eq p1, p0, :cond_1

    .line 5
    .line 6
    const/4 p0, 0x2

    .line 7
    if-eq p1, p0, :cond_2

    .line 8
    .line 9
    const/4 p0, 0x3

    .line 10
    if-eq p1, p0, :cond_0

    .line 11
    .line 12
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->v1:I

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->A1:I

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->v1:I

    .line 19
    .line 20
    return p0

    .line 21
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->w1:I

    .line 22
    .line 23
    return p0
.end method

.method private q()V
    .locals 3

    .line 1
    new-instance v0, Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->x1:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 11
    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 14
    .line 15
    invoke-static {v1}, Ll/jyn0;->g(Z)Ll/us2;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ll/us2;->j()F

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 24
    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 27
    .line 28
    invoke-static {v1}, Ll/jyn0;->g(Z)Ll/us2;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-interface {v1}, Ll/us2;->getTitleColor()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    const/4 v2, 0x1

    .line 41
    invoke-virtual {v0, v1, v2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 45
    .line 46
    .line 47
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 50
    .line 51
    .line 52
    const/4 v1, 0x0

    .line 53
    sget v2, Ll/qa00;->c:I

    .line 54
    .line 55
    invoke-virtual {v0, v1, v2, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->c:Lv/navigationbar/VNavigationBar;

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setTitleView(Landroid/view/View;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->c:Lv/navigationbar/VNavigationBar;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconAsBack(Landroid/app/Activity;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->c:Lv/navigationbar/VNavigationBar;

    .line 71
    .line 72
    sget v1, Ll/l9c0;->n:I

    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 75
    .line 76
    .line 77
    new-instance v0, Lv/VImage;

    .line 78
    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    invoke-direct {v0, v1}, Lv/VImage;-><init>(Landroid/content/Context;)V

    .line 82
    .line 83
    .line 84
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 85
    .line 86
    invoke-static {v1}, Ll/jyn0;->g(Z)Ll/us2;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-interface {v1}, Ll/us2;->g()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 95
    .line 96
    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->c:Lv/navigationbar/VNavigationBar;

    .line 98
    .line 99
    invoke-virtual {v1, v0}, Lv/navigationbar/VNavigationBar;->setLeftIconView(Landroid/view/View;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->c:Lv/navigationbar/VNavigationBar;

    .line 103
    .line 104
    new-instance v1, Ll/y1v;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/y1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v0, v1}, Lv/navigationbar/VNavigationBar;->setLeftIconOnClick(Landroid/view/View$OnClickListener;)V

    .line 110
    .line 111
    .line 112
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 113
    .line 114
    if-nez v0, :cond_0

    .line 115
    .line 116
    invoke-static {}, Ll/jyn0;->h()Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-eqz v0, :cond_0

    .line 121
    .line 122
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 123
    .line 124
    sget v1, Ll/l9c0;->c:I

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 134
    .line 135
    sget v1, Ll/l9c0;->c:I

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setNavigationBarColor(I)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 145
    .line 146
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->y(Lcom/p1/mobile/android/app/Act;)V

    .line 147
    .line 148
    .line 149
    :cond_0
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->x()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->q()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->a:Lv/VFrame;

    .line 8
    .line 9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 10
    .line 11
    invoke-static {v1}, Ll/jyn0;->g(Z)Ll/us2;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Ll/us2;->e()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->j:Lv/VImage;

    .line 23
    .line 24
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyn0;->g(Z)Ll/us2;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v1}, Ll/us2;->i()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->k:Lv/VText;

    .line 38
    .line 39
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 40
    .line 41
    invoke-static {v1}, Ll/jyn0;->g(Z)Ll/us2;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-interface {v1}, Ll/us2;->f()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->g:Lv/VImage;

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 55
    .line 56
    invoke-static {v1}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-interface {v1}, Ll/ss2;->c()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->h:Lv/VText;

    .line 68
    .line 69
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 70
    .line 71
    invoke-static {p0}, Ll/jyn0;->b(Z)Ll/ss2;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-interface {p0}, Ll/ss2;->f()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method private y(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 8
    .line 9
    .line 10
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 11
    .line 12
    sget v0, Ll/bnl0;->e:I

    .line 13
    .line 14
    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/bnl0;->F0()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->b:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->e:Lv/VRecyclerView;

    .line 8
    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->f:Lv/VRelative;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->i:Lv/VRelative;

    .line 19
    .line 20
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public B()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->m:Ll/x1v;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->m:Ll/x1v;

    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 13
    .line 14
    :cond_1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/x1v;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->k(Ll/x1v;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->r()V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/e2v;->b(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public k(Ll/x1v;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->m:Ll/x1v;

    .line 2
    .line 3
    return-void
.end method

.method public final l(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;",
            ">;)",
            "Ljava/util/List<",
            "Ll/d3q<",
            "*>;>;"
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
    const/4 v1, 0x0

    .line 7
    move v2, v1

    .line 8
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    if-ge v2, v3, :cond_0

    .line 13
    .line 14
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;

    .line 19
    .line 20
    new-instance v4, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;

    .line 21
    .line 22
    iget-boolean v5, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 23
    .line 24
    new-instance v6, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b$a;

    .line 25
    .line 26
    invoke-direct {v6, p0, v2}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b$a;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;I)V

    .line 27
    .line 28
    .line 29
    invoke-direct {v4, v3, v5, v6}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;ZLcom/p1/mobile/putong/live/external/voiceslipcard/activity/LiveVoiceActivitiesItemView$a;)V

    .line 30
    .line 31
    .line 32
    new-instance v5, Ll/a2v;

    .line 33
    .line 34
    invoke-direct {v5, v3, v2}, Ll/a2v;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v4, v5}, Ll/d3q;->z(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    add-int/lit8 v2, v2, 0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    new-instance p1, Ll/m1v;

    .line 47
    .line 48
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    const/16 v3, 0x1e

    .line 53
    .line 54
    if-ge v2, v3, :cond_1

    .line 55
    .line 56
    const/4 v1, 0x1

    .line 57
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->o:Z

    .line 58
    .line 59
    invoke-direct {p1, v1, p0}, Ll/m1v;-><init>(ZZ)V

    .line 60
    .line 61
    .line 62
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    return-object v0
.end method

.method public final m(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;->K()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->n:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->W(Ll/d3q;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->n:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->J()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Ll/d2v;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/d2v;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Ll/d3q;

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    check-cast p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/a;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->m:Ll/x1v;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/x1v;->n0()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic v(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->m:Ll/x1v;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2}, Ll/x1v;->o0(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;->userId:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->m(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public w(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setRefreshing(Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->e:Lv/VRecyclerView;

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->f:Lv/VRelative;

    .line 20
    .line 21
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->i:Lv/VRelative;

    .line 25
    .line 26
    invoke-static {p0, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->f:Lv/VRelative;

    .line 34
    .line 35
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->i:Lv/VRelative;

    .line 39
    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->n:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l(Ljava/util/List;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {v0, p0, v1}, Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;->a0(Ljava/util/List;Z)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final x()V
    .locals 5

    .line 1
    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->l:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-direct {v0, v1, v2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->e:Lv/VRecyclerView;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->e:Lv/VRecyclerView;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->n:Lcom/p1/mobile/putong/live/base/arch/LiveBaseAdapter;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 23
    .line 24
    sget v1, Ll/l9c0;->m:I

    .line 25
    .line 26
    sget v2, Ll/l9c0;->j:I

    .line 27
    .line 28
    sget v3, Ll/l9c0;->k:I

    .line 29
    .line 30
    sget v4, Ll/l9c0;->l:I

    .line 31
    .line 32
    filled-new-array {v1, v2, v3, v4}, [I

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->d:Lcom/p1/mobile/putong/live/external/view/widgets/SwipeRefreshList;

    .line 40
    .line 41
    new-instance v1, Ll/z1v;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/z1v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v1}, Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout;->setOnRefreshListener(Landroidx/swiperefreshlayout/widget/SwipeRefreshLayout$j;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public z(ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V
    .locals 3

    .line 1
    invoke-interface {p0}, Ll/iam;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;->p(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->D(I)Lcom/p1/mobile/android/app/Dialog$e;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->a:I

    .line 18
    .line 19
    new-instance v2, Ll/b2v;

    .line 20
    .line 21
    invoke-direct {v2}, Ll/b2v;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->l0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget v1, Lcom/p1/mobile/putong/live/base/R$string;->X:I

    .line 29
    .line 30
    new-instance v2, Ll/c2v;

    .line 31
    .line 32
    invoke-direct {v2, p0, p1, p2}, Ll/c2v;-><init>(Lcom/p1/mobile/putong/live/external/voiceslipcard/activity/b;ILcom/p1/mobile/putong/live/base/data/BLiveMemberActivityData;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->t0(ILjava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 p1, 0x1

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 45
    .line 46
    .line 47
    return-void
.end method
