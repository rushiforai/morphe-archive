.class public Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Ll/qo00;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Ll/qo00;",
            ">;"
        }
    .end annotation
.end field

.field public d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/vg60;->a()Ll/vg60;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 11
    .line 12
    new-instance p1, Ljava/util/HashMap;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->d:Ljava/util/HashMap;

    .line 18
    .line 19
    new-instance p1, Ljava/util/HashMap;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->e:Ljava/util/HashMap;

    .line 25
    .line 26
    new-instance p1, Ljava/util/HashSet;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->f:Ljava/util/HashSet;

    .line 32
    .line 33
    return-void
.end method

.method public static synthetic E(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;Ll/qo00;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->J(Ll/qo00;)V

    return-void
.end method

.method public static synthetic F(Ll/qo00;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/qo00;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/qo00;->i:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/qo00;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->G(Landroid/view/View;Ll/qo00;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    invoke-static {}, Ll/mrb0;->Q()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 2

    .line 1
    const/4 v0, 0x4

    .line 2
    if-ne p2, v0, :cond_0

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 5
    .line 6
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->J(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 v0, 0x7

    .line 12
    const/4 v1, 0x0

    .line 13
    if-ne p2, v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    sget p2, Ll/tec0;->P1:I

    .line 26
    .line 27
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_1
    const/16 v0, 0x8

    .line 33
    .line 34
    if-ne p2, v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    sget p2, Ll/tec0;->N1:I

    .line 47
    .line 48
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_2
    const/4 v0, 0x5

    .line 54
    if-ne p2, v0, :cond_3

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 57
    .line 58
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->L(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)Landroid/widget/RelativeLayout;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    return-object p0

    .line 63
    :cond_3
    if-nez p2, :cond_4

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 66
    .line 67
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->K(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_4
    const/4 v0, 0x1

    .line 73
    if-ne p2, v0, :cond_5

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 76
    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    sget p2, Ll/tec0;->w4:I

    .line 86
    .line 87
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    return-object p0

    .line 92
    :cond_5
    const/4 v0, 0x2

    .line 93
    if-ne p2, v0, :cond_6

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    sget p2, Ll/tec0;->x4:I

    .line 106
    .line 107
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    return-object p0

    .line 112
    :cond_6
    const/4 v0, 0x3

    .line 113
    if-ne p2, v0, :cond_7

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 116
    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    sget p2, Ll/tec0;->s4:I

    .line 126
    .line 127
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    return-object p0

    .line 132
    :cond_7
    const/16 v0, 0x9

    .line 133
    .line 134
    if-ne p2, v0, :cond_8

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    sget p2, Ll/tec0;->w4:I

    .line 147
    .line 148
    invoke-virtual {p0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    return-object p0

    .line 153
    :cond_8
    const/4 p0, 0x0

    .line 154
    return-object p0
.end method

.method public G(Landroid/view/View;Ll/qo00;II)V
    .locals 10

    .line 1
    const-string v4, "p_moments_view"

    .line 2
    .line 3
    const/16 v5, 0x9

    .line 4
    .line 5
    const/4 v6, 0x2

    .line 6
    const/4 v7, 0x1

    .line 7
    if-eq p3, v7, :cond_3

    .line 8
    .line 9
    if-eq p3, v6, :cond_3

    .line 10
    .line 11
    const/4 v8, 0x3

    .line 12
    if-eq p3, v8, :cond_3

    .line 13
    .line 14
    if-ne p3, v5, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v5, 0x7

    .line 18
    if-ne p3, v5, :cond_1

    .line 19
    .line 20
    instance-of v3, p1, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;

    .line 21
    .line 22
    if-eqz v3, :cond_2

    .line 23
    .line 24
    iget-object v3, p2, Ll/qo00;->k:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    if-nez v3, :cond_2

    .line 31
    .line 32
    move-object v0, p1

    .line 33
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 36
    .line 37
    invoke-virtual {v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    iget-object v2, p2, Ll/qo00;->k:Ljava/util/List;

    .line 42
    .line 43
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationBannerFeedView;->C(Lcom/p1/mobile/android/app/Act;Ljava/util/List;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    const/16 v5, 0x8

    .line 48
    .line 49
    if-ne p3, v5, :cond_2

    .line 50
    .line 51
    instance-of v3, p1, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationArticleFeedView;

    .line 52
    .line 53
    if-eqz v3, :cond_2

    .line 54
    .line 55
    iget-object v3, p2, Ll/qo00;->j:Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 56
    .line 57
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_2

    .line 62
    .line 63
    iget-object v3, p2, Ll/qo00;->j:Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 64
    .line 65
    iget-object v3, v3, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 66
    .line 67
    const-string v5, "intl_story_id"

    .line 68
    .line 69
    invoke-static {v5, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    filled-new-array {v3}, [Ll/pf60;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    const-string v5, "e_explore_tantan_story"

    .line 78
    .line 79
    invoke-static {v5, v4, v3}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 80
    .line 81
    .line 82
    move-object v0, p1

    .line 83
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationArticleFeedView;

    .line 84
    .line 85
    iget-object v3, p2, Ll/qo00;->j:Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 86
    .line 87
    iget-object v4, v3, Lcom/p1/mobile/putong/data/IntlOperationArticles;->title:Ljava/lang/String;

    .line 88
    .line 89
    iget-object v3, v3, Lcom/p1/mobile/putong/data/IntlOperationArticles;->cover:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 90
    .line 91
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UrlParentData;->url:Ljava/lang/String;

    .line 92
    .line 93
    new-instance v5, Ll/ix00;

    .line 94
    .line 95
    invoke-direct {v5, p0, p2}, Ll/ix00;-><init>(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;Ll/qo00;)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {v0, v4, v3, v5}, Lcom/p1/mobile/putong/feed/ui/moments/operation/OperationArticleFeedView;->R(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 99
    .line 100
    .line 101
    :cond_2
    return-void

    .line 102
    :cond_3
    :goto_0
    add-int/lit8 v8, p4, 0x1

    .line 103
    .line 104
    invoke-virtual {p0, v8}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->H(I)Ll/qo00;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    const/4 v9, 0x0

    .line 109
    if-eqz v8, :cond_5

    .line 110
    .line 111
    invoke-virtual {v8}, Ll/qo00;->c()Z

    .line 112
    .line 113
    .line 114
    move-result v8

    .line 115
    if-eqz v8, :cond_4

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    move v8, v9

    .line 119
    goto :goto_2

    .line 120
    :cond_5
    :goto_1
    move v8, v7

    .line 121
    :goto_2
    if-eq p3, v7, :cond_6

    .line 122
    .line 123
    if-ne p3, v5, :cond_7

    .line 124
    .line 125
    :cond_6
    move v5, v8

    .line 126
    goto :goto_3

    .line 127
    :cond_7
    if-ne p3, v6, :cond_8

    .line 128
    .line 129
    move-object v0, p1

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;

    .line 131
    .line 132
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->d:Ljava/util/HashMap;

    .line 133
    .line 134
    iget-object v4, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->e:Ljava/util/HashMap;

    .line 135
    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 137
    .line 138
    invoke-virtual {v0, p2, v3, v4, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->K(Ll/qo00;Ljava/util/HashMap;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v8}, Lcom/p1/mobile/putong/feed/ui/moments/MomentViewLarge;->N(Z)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :cond_8
    move-object v0, p1

    .line 146
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;

    .line 147
    .line 148
    iget-object v3, p2, Ll/qo00;->b:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 149
    .line 150
    iget-object v4, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 151
    .line 152
    move-object v5, v3

    .line 153
    iget-object v3, v4, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 154
    .line 155
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 156
    .line 157
    iget-boolean v6, p2, Ll/qo00;->d:Z

    .line 158
    .line 159
    const/4 v7, 0x1

    .line 160
    move-object v2, v5

    .line 161
    move v5, v8

    .line 162
    const/4 v8, 0x0

    .line 163
    move-object v1, p0

    .line 164
    invoke-virtual/range {v0 .. v8}, Lcom/p1/mobile/putong/feed/ui/moments/CommentView;->x(Ll/pol;Lcom/p1/mobile/putong/feed/data/MomentMessage;Ljava/lang/String;Ljava/lang/String;ZZZLcom/p1/mobile/putong/feed/ui/moments/CommentView$a;)V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :goto_3
    move-object v0, p1

    .line 169
    check-cast v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;

    .line 170
    .line 171
    iget-object v6, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->d:Ljava/util/HashMap;

    .line 172
    .line 173
    iget-object v8, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->e:Ljava/util/HashMap;

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 176
    .line 177
    invoke-virtual {v0, p2, v6, v8, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->j0(Ll/qo00;Ljava/util/HashMap;Ljava/util/HashMap;Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)V

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0, v5}, Lcom/p1/mobile/putong/feed/ui/moments/MomentView;->n0(Z)V

    .line 181
    .line 182
    .line 183
    if-ne p3, v7, :cond_b

    .line 184
    .line 185
    iget-object v0, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 186
    .line 187
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    const-string v1, ""

    .line 192
    .line 193
    if-eqz v0, :cond_9

    .line 194
    .line 195
    iget-object v0, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 196
    .line 197
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 198
    .line 199
    goto :goto_4

    .line 200
    :cond_9
    move-object v0, v1

    .line 201
    :goto_4
    const-string v3, "moment_id"

    .line 202
    .line 203
    invoke-static {v3, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iget-object v3, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 208
    .line 209
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    if-eqz v3, :cond_a

    .line 214
    .line 215
    iget-object v1, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 216
    .line 217
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 218
    .line 219
    :cond_a
    const-string v2, "moments_user_id"

    .line 220
    .line 221
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    filled-new-array {v0, v1}, [Ll/pf60;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    const-string v1, "e_moments_view_page_unit"

    .line 230
    .line 231
    invoke-static {v1, v4, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :cond_b
    new-instance v0, Ll/pf60;

    .line 236
    .line 237
    iget-object v1, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 238
    .line 239
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 240
    .line 241
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 242
    .line 243
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Owner;->id:Ljava/lang/String;

    .line 244
    .line 245
    const-string v3, "anchorId"

    .line 246
    .line 247
    invoke-direct {v0, v3, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    new-instance v1, Ll/pf60;

    .line 251
    .line 252
    iget-object v3, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 253
    .line 254
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 255
    .line 256
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 257
    .line 258
    const-string v4, "liveId"

    .line 259
    .line 260
    invoke-direct {v1, v4, v3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 261
    .line 262
    .line 263
    new-instance v3, Ll/pf60;

    .line 264
    .line 265
    iget-object v4, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 266
    .line 267
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 268
    .line 269
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 270
    .line 271
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->topics:Ljava/util/List;

    .line 272
    .line 273
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 274
    .line 275
    .line 276
    move-result v4

    .line 277
    if-nez v4, :cond_c

    .line 278
    .line 279
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 280
    .line 281
    .line 282
    move-result-object v4

    .line 283
    goto :goto_5

    .line 284
    :cond_c
    iget-object v4, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 285
    .line 286
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 287
    .line 288
    iget-object v4, v4, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 289
    .line 290
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->topics:Ljava/util/List;

    .line 291
    .line 292
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    check-cast v4, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;

    .line 297
    .line 298
    iget-object v4, v4, Lcom/p1/mobile/putong/data/VoiceRoomInfoTopic;->id:Ljava/lang/String;

    .line 299
    .line 300
    :goto_5
    const-string v5, "topic_id"

    .line 301
    .line 302
    invoke-direct {v3, v5, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 303
    .line 304
    .line 305
    new-instance v4, Ll/pf60;

    .line 306
    .line 307
    const-string v5, "index"

    .line 308
    .line 309
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 310
    .line 311
    .line 312
    move-result-object v6

    .line 313
    invoke-direct {v4, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 314
    .line 315
    .line 316
    new-instance v5, Ll/pf60;

    .line 317
    .line 318
    iget-object v2, p2, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 319
    .line 320
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 321
    .line 322
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/VoiceLive;->voiceRoomInfo:Lcom/p1/mobile/putong/data/VoiceRoomInfo;

    .line 323
    .line 324
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->maskMode:Z

    .line 325
    .line 326
    if-eqz v2, :cond_d

    .line 327
    .line 328
    const-string v2, "mask_audio"

    .line 329
    .line 330
    goto :goto_6

    .line 331
    :cond_d
    const-string v2, "normal_audio"

    .line 332
    .line 333
    :goto_6
    const-string v6, "audio_room_type"

    .line 334
    .line 335
    invoke-direct {v5, v6, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    filled-new-array {v0, v1, v3, v4, v5}, [Ll/pf60;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    const-string v1, "e_live_audio_room_enter"

    .line 343
    .line 344
    const-string v2, "p_follow"

    .line 345
    .line 346
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 347
    .line 348
    .line 349
    return-void
.end method

.method public H(I)Ll/qo00;
    .locals 1

    .line 1
    invoke-static {}, Ll/mrb0;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-lez p1, :cond_0

    .line 8
    .line 9
    add-int/lit8 p1, p1, -0x1

    .line 10
    .line 11
    :cond_0
    if-ltz p1, :cond_2

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 14
    .line 15
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-lt p1, v0, :cond_1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 25
    .line 26
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Ll/qo00;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_2
    :goto_0
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public I(I)Ljava/lang/String;
    .locals 1

    .line 1
    add-int/lit8 p1, p1, -0x1

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->H(I)Ll/qo00;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-boolean p1, p0, Ll/qo00;->i:Z

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    iget-boolean p1, p0, Ll/qo00;->h:Z

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    iget-object p1, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p1, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 32
    .line 33
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_0

    .line 38
    .line 39
    iget-object p1, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 42
    .line 43
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-lez p1, :cond_0

    .line 48
    .line 49
    iget-object p1, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 50
    .line 51
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_0

    .line 63
    .line 64
    iget-object p1, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    instance-of p1, p1, Lcom/p1/mobile/putong/data/Video;

    .line 73
    .line 74
    if-eqz p1, :cond_0

    .line 75
    .line 76
    iget-object p0, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Video;->formatAspectRatio()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_0
    const/4 p0, 0x0

    .line 92
    return-object p0
.end method

.method public final synthetic J(Ll/qo00;)V
    .locals 3

    .line 1
    iget-object v0, p1, Ll/qo00;->j:Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/IntlOperationArticles;->id:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "intl_story_id"

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    filled-new-array {v0}, [Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "e_explore_tantan_story"

    .line 16
    .line 17
    const-string v2, "p_moments_view"

    .line 18
    .line 19
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 20
    .line 21
    .line 22
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->M()Lcom/p1/mobile/putong/app/PutongAct;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 v1, 0x0

    .line 33
    iget-object p1, p1, Ll/qo00;->j:Lcom/p1/mobile/putong/data/IntlOperationArticles;

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-interface {v0, p0, v2, v1, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->pa(Landroid/content/Context;ILcom/p1/mobile/putong/data/IntlOperationBanner;Lcom/p1/mobile/putong/data/IntlOperationArticles;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public K(Ll/vg60;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/vg60<",
            "Ll/qo00;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->K(Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 10
    .line 11
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-lez v0, :cond_0

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 23
    .line 24
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->b()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    move v0, v1

    .line 33
    :goto_0
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 40
    .line 41
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 42
    .line 43
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/a;

    .line 44
    .line 45
    if-eqz v0, :cond_3

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->S4()Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_3

    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 56
    .line 57
    if-eqz p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 60
    .line 61
    if-eqz p1, :cond_1

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-gtz p1, :cond_2

    .line 68
    .line 69
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 72
    .line 73
    invoke-interface {p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->a()Lrx/c;

    .line 74
    .line 75
    .line 76
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 77
    .line 78
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->l:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;

    .line 79
    .line 80
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedFrag;->U4(Z)V

    .line 81
    .line 82
    .line 83
    :cond_3
    return-void
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->b()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 12
    .line 13
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 22
    .line 23
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sub-int/2addr v0, p1

    .line 30
    const/4 p1, 0x4

    .line 31
    if-ge v0, p1, :cond_0

    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 34
    .line 35
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 36
    .line 37
    new-instance v0, Ll/hx00;

    .line 38
    .line 39
    invoke-direct {v0}, Ll/hx00;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 55
    .line 56
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->g()V

    .line 57
    .line 58
    .line 59
    :cond_0
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->H(I)Ll/qo00;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    int-to-long p0, p1

    return-wide p0
.end method

.method public getItemViewType(I)I
    .locals 3

    .line 1
    invoke-static {}, Ll/mrb0;->Q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x5

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 12
    .line 13
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->g:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList;->e:Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;

    .line 24
    .line 25
    invoke-interface {v0}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$b;->b()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x4

    .line 32
    return p0

    .line 33
    :cond_1
    invoke-static {}, Ll/mrb0;->Q()Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->c:Ll/vg60;

    .line 38
    .line 39
    const/4 v2, 0x1

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    iget-object v0, v1, Ll/vg60;->a:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    add-int/2addr v0, v2

    .line 49
    goto :goto_0

    .line 50
    :cond_2
    iget-object v0, v1, Ll/vg60;->a:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    :goto_0
    if-ne p1, v0, :cond_3

    .line 57
    .line 58
    const/4 p0, 0x0

    .line 59
    return p0

    .line 60
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/ui/moments/MomentsFeedRecyclerList$a;->H(I)Ll/qo00;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object p1, p0, Ll/qo00;->a:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    if-eqz p1, :cond_4

    .line 67
    .line 68
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isVoiceLive:Z

    .line 69
    .line 70
    if-eqz p1, :cond_4

    .line 71
    .line 72
    const/16 p0, 0x9

    .line 73
    .line 74
    return p0

    .line 75
    :cond_4
    iget-boolean p1, p0, Ll/qo00;->i:Z

    .line 76
    .line 77
    if-eqz p1, :cond_5

    .line 78
    .line 79
    const/16 p0, 0x8

    .line 80
    .line 81
    return p0

    .line 82
    :cond_5
    iget-boolean p1, p0, Ll/qo00;->h:Z

    .line 83
    .line 84
    if-eqz p1, :cond_6

    .line 85
    .line 86
    const/4 p0, 0x7

    .line 87
    return p0

    .line 88
    :cond_6
    invoke-virtual {p0}, Ll/qo00;->c()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-eqz p0, :cond_7

    .line 93
    .line 94
    return v2

    .line 95
    :cond_7
    const/4 p0, 0x3

    .line 96
    return p0
.end method
