.class public Ll/zcf0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;",
            ">;"
        }
    .end annotation
.end field

.field public f:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

.field public g:Ljava/lang/String;

.field public h:I

.field public i:I

.field public j:Z


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zcf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 5
    .line 6
    iget-object p1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->unFinishedTasks:Ljava/util/List;

    .line 7
    .line 8
    iput-object p1, p0, Ll/zcf0;->d:Ljava/util/List;

    .line 9
    .line 10
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->unReceivedTasks:Ljava/util/List;

    .line 11
    .line 12
    iput-object v0, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 13
    .line 14
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->cyclicTasks:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 15
    .line 16
    iput-object v0, p0, Ll/zcf0;->f:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 17
    .line 18
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->signInPeriod:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Ll/zcf0;->g:Ljava/lang/String;

    .line 21
    .line 22
    iget p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;->signInCount:I

    .line 23
    .line 24
    iput p2, p0, Ll/zcf0;->h:I

    .line 25
    .line 26
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    const/4 p2, 0x0

    .line 31
    if-eqz p1, :cond_0

    .line 32
    .line 33
    move p1, p2

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p1, p0, Ll/zcf0;->d:Ljava/util/List;

    .line 36
    .line 37
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    :goto_0
    iget-object v0, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 42
    .line 43
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_1
    iget-object p2, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    :goto_1
    add-int/2addr p1, p2

    .line 57
    iput p1, p0, Ll/zcf0;->i:I

    .line 58
    .line 59
    return-void
.end method

.method public static synthetic E(Ll/zcf0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zcf0;->H(Landroid/view/View;)V

    return-void
.end method

.method private synthetic H(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-boolean p1, p0, Ll/zcf0;->j:Z

    .line 2
    .line 3
    xor-int/lit8 p1, p1, 0x1

    .line 4
    .line 5
    iput-boolean p1, p0, Ll/zcf0;->j:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/zcf0;->F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 3

    .line 1
    iget v0, p0, Ll/zcf0;->i:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x2

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 v1, 0x1

    .line 8
    const/4 v2, 0x4

    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    return v2

    .line 12
    :cond_1
    iget-boolean p0, p0, Ll/zcf0;->j:Z

    .line 13
    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    add-int/lit8 v0, v0, 0x3

    .line 17
    .line 18
    return v0

    .line 19
    :cond_2
    return v2
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    if-eq p2, v0, :cond_3

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    const/4 v2, -0x2

    .line 7
    if-eq p2, v0, :cond_2

    .line 8
    .line 9
    const/4 v0, 0x3

    .line 10
    if-eq p2, v0, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x4

    .line 13
    if-eq p2, p0, :cond_0

    .line 14
    .line 15
    return-object v1

    .line 16
    :cond_0
    new-instance p0, Lv/VText;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-direct {p0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 23
    .line 24
    .line 25
    new-instance p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 26
    .line 27
    invoke-direct {p1, v2, v2}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    sget p2, Ll/qa00;->i:I

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup$MarginLayoutParams;->setMarginStart(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    const/high16 p1, 0x41200000    # 10.0f

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 41
    .line 42
    .line 43
    const p1, -0x4c000e3b

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 47
    .line 48
    .line 49
    const/high16 p1, 0x41300000    # 11.0f

    .line 50
    .line 51
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    sget v0, Ll/qa00;->e:I

    .line 56
    .line 57
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-virtual {p0, p2, v0, p1, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 62
    .line 63
    .line 64
    const/high16 p1, 0x41280000    # 10.5f

    .line 65
    .line 66
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    int-to-float p1, p1

    .line 71
    const/4 p2, 0x0

    .line 72
    const v0, 0x33ce1357

    .line 73
    .line 74
    .line 75
    invoke-static {v0, p1, p2}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 80
    .line 81
    .line 82
    return-object p0

    .line 83
    :cond_1
    new-instance p2, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    invoke-direct {p2, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;-><init>(Landroid/content/Context;)V

    .line 90
    .line 91
    .line 92
    iget-object p0, p0, Ll/zcf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 93
    .line 94
    invoke-virtual {p2, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->K(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 95
    .line 96
    .line 97
    return-object p2

    .line 98
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    sget p2, Ll/yec0;->K5:I

    .line 103
    .line 104
    invoke-static {p1, p2, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;

    .line 109
    .line 110
    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    .line 111
    .line 112
    const/4 v0, -0x1

    .line 113
    invoke-direct {p2, v0, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    .line 118
    .line 119
    iget-object p2, p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;->a:Landroid/widget/LinearLayout;

    .line 120
    .line 121
    new-instance v0, Ll/ycf0;

    .line 122
    .line 123
    invoke-direct {v0, p0}, Ll/ycf0;-><init>(Ll/zcf0;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 127
    .line 128
    .line 129
    return-object p1

    .line 130
    :cond_3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    sget p1, Ll/yec0;->L5:I

    .line 135
    .line 136
    invoke-static {p0, p1, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0
.end method

.method public F(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;II)V
    .locals 2

    .line 1
    const/4 p2, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    if-eq p3, v0, :cond_5

    .line 4
    .line 5
    const/4 p4, 0x2

    .line 6
    if-eq p3, p4, :cond_2

    .line 7
    .line 8
    const/4 p2, 0x3

    .line 9
    if-eq p3, p2, :cond_1

    .line 10
    .line 11
    const/4 p2, 0x4

    .line 12
    if-eq p3, p2, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    check-cast p1, Lv/VText;

    .line 16
    .line 17
    iget-object p0, p0, Ll/zcf0;->g:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;

    .line 24
    .line 25
    iget-object p0, p0, Ll/zcf0;->f:Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInCycleView;->M(Lcom/p1/mobile/putong/live/base/data/BLiveSignInCycleTask;)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_2
    iget-object p3, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 34
    .line 35
    .line 36
    move-result p3

    .line 37
    if-nez p3, :cond_3

    .line 38
    .line 39
    iget-object p3, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    if-le p3, v0, :cond_3

    .line 46
    .line 47
    move p3, v0

    .line 48
    goto :goto_0

    .line 49
    :cond_3
    move p3, p2

    .line 50
    :goto_0
    iget p4, p0, Ll/zcf0;->i:I

    .line 51
    .line 52
    if-ne p4, v0, :cond_4

    .line 53
    .line 54
    move p2, v0

    .line 55
    :cond_4
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;

    .line 56
    .line 57
    iget-boolean p0, p0, Ll/zcf0;->j:Z

    .line 58
    .line 59
    invoke-virtual {p1, p0, p3, p2}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskExpandOrFoldView;->b(ZZZ)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_5
    iget-object p3, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    if-nez p3, :cond_6

    .line 70
    .line 71
    iget-object p3, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 72
    .line 73
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 74
    .line 75
    .line 76
    move-result p3

    .line 77
    if-ge p4, p3, :cond_6

    .line 78
    .line 79
    iget-object p2, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 80
    .line 81
    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p2

    .line 85
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_6
    iget-object p3, p0, Ll/zcf0;->d:Ljava/util/List;

    .line 89
    .line 90
    iget-object v0, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 91
    .line 92
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    if-eqz v0, :cond_7

    .line 97
    .line 98
    move v0, p2

    .line 99
    goto :goto_1

    .line 100
    :cond_7
    iget-object v0, p0, Ll/zcf0;->e:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    :goto_1
    sub-int/2addr p4, v0

    .line 107
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;

    .line 112
    .line 113
    iget-object p4, p0, Ll/zcf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 114
    .line 115
    iget-object v0, p3, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->rewardId:Ljava/lang/String;

    .line 116
    .line 117
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->taskId:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {p4, v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->A4(Ljava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    move v0, p2

    .line 123
    move-object p2, p3

    .line 124
    :goto_2
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;

    .line 125
    .line 126
    iget p3, p0, Ll/zcf0;->h:I

    .line 127
    .line 128
    iget-object p4, p0, Ll/zcf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 129
    .line 130
    invoke-virtual {p1, p2, p3, v0, p4}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/TaskView;->k(Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;IZLcom/p1/mobile/putong/live/livingroom/common/signin/a;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Ll/zcf0;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 134
    .line 135
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->taskType:Ljava/lang/String;

    .line 136
    .line 137
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSignInTask;->title:Ljava/lang/String;

    .line 138
    .line 139
    iget p0, p0, Ll/zcf0;->h:I

    .line 140
    .line 141
    invoke-virtual {p1, p3, p2, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->C4(Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 142
    .line 143
    .line 144
    return-void
.end method

.method public G(I)Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zcf0;->G(I)Lcom/p1/mobile/putong/live/base/data/BLiveSignInDetail;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 5

    .line 1
    iget v0, p0, Ll/zcf0;->i:I

    .line 2
    .line 3
    const/4 v1, 0x4

    .line 4
    const/4 v2, 0x3

    .line 5
    const/4 v3, 0x1

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    return v2

    .line 11
    :cond_0
    if-ne p1, v3, :cond_d

    .line 12
    .line 13
    return v1

    .line 14
    :cond_1
    const/4 v4, 0x2

    .line 15
    if-ne v0, v3, :cond_5

    .line 16
    .line 17
    if-nez p1, :cond_2

    .line 18
    .line 19
    return v3

    .line 20
    :cond_2
    if-ne p1, v3, :cond_3

    .line 21
    .line 22
    return v4

    .line 23
    :cond_3
    if-ne p1, v4, :cond_4

    .line 24
    .line 25
    return v2

    .line 26
    :cond_4
    if-ne p1, v2, :cond_d

    .line 27
    .line 28
    return v1

    .line 29
    :cond_5
    iget-boolean p0, p0, Ll/zcf0;->j:Z

    .line 30
    .line 31
    if-eqz p0, :cond_9

    .line 32
    .line 33
    if-ge p1, v0, :cond_6

    .line 34
    .line 35
    return v3

    .line 36
    :cond_6
    if-ne p1, v0, :cond_7

    .line 37
    .line 38
    return v4

    .line 39
    :cond_7
    add-int/lit8 p0, v0, 0x1

    .line 40
    .line 41
    if-ne p1, p0, :cond_8

    .line 42
    .line 43
    return v2

    .line 44
    :cond_8
    add-int/2addr v0, v4

    .line 45
    if-ne p1, v0, :cond_d

    .line 46
    .line 47
    return v1

    .line 48
    :cond_9
    if-nez p1, :cond_a

    .line 49
    .line 50
    return v3

    .line 51
    :cond_a
    if-ne p1, v3, :cond_b

    .line 52
    .line 53
    return v4

    .line 54
    :cond_b
    if-ne p1, v4, :cond_c

    .line 55
    .line 56
    return v2

    .line 57
    :cond_c
    if-ne p1, v2, :cond_d

    .line 58
    .line 59
    return v1

    .line 60
    :cond_d
    const/4 p0, -0x1

    .line 61
    return p0
.end method
