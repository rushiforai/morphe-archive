.class public Ll/snf;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

.field public b:Landroid/content/Context;

.field public c:Lv/VFrame;

.field public d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

.field public final e:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public f:I

.field public g:Landroidx/recyclerview/widget/RecyclerView$t;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Landroid/content/Context;Lv/VFrame;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/snf;->e:Lrx/subjects/a;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, p0, Ll/snf;->f:I

    .line 12
    .line 13
    iput-object p1, p0, Ll/snf;->a:Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;

    .line 14
    .line 15
    iput-object p2, p0, Ll/snf;->b:Landroid/content/Context;

    .line 16
    .line 17
    iput-object p3, p0, Ll/snf;->c:Lv/VFrame;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/snf;->j()V

    .line 20
    .line 21
    .line 22
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 25
    .line 26
    invoke-virtual {p2}, Ll/dkb;->o9()Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p2}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-virtual {p0}, Ll/snf;->l()Lrx/c;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    new-instance v1, Ll/mnf;

    .line 39
    .line 40
    invoke-direct {v1}, Ll/mnf;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-static {v0, p2, p3, v1}, Ll/psd0;->s(Lrx/c;Lrx/c;Lrx/c;Ll/scj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/app/Frag;->duringCreated(Lrx/c;)Lrx/c;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    new-instance p3, Ll/nnf;

    .line 52
    .line 53
    invoke-direct {p3}, Ll/nnf;-><init>()V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p2, p3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    new-instance p3, Ll/onf;

    .line 61
    .line 62
    invoke-direct {p3, p0, p1}, Ll/onf;-><init>(Ll/snf;Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 63
    .line 64
    .line 65
    invoke-static {p3}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p2, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public static synthetic a(Ll/bkj0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Ljava/util/List;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 5
    .line 6
    .line 7
    return-object v0
.end method

.method public static synthetic c(Ll/pf60;)Ll/vg60;
    .locals 2

    .line 1
    new-instance v0, Ll/vg60;

    .line 2
    .line 3
    iget-object p0, p0, Ll/pf60;->b:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ljava/util/List;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method

.method public static synthetic d(Ll/snf;Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/bkj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/snf;->k(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/bkj0;)V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Ll/vg60;)Ll/bkj0;
    .locals 1

    .line 1
    new-instance v0, Ll/bkj0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/bkj0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static bridge synthetic f(Ll/snf;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/snf;->f:I

    return p0
.end method

.method public static bridge synthetic g(Ll/snf;I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/snf;->f:I

    return-void
.end method


# virtual methods
.method public h()Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/snf;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 2
    .line 3
    return-object p0
.end method

.method public final i(Landroid/view/View;)Landroid/widget/LinearLayout;
    .locals 1

    .line 1
    new-instance v0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    iget-object p0, p0, Ll/snf;->b:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public j()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/snf;->c:Lv/VFrame;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {}, Ll/uj4;->a()Ll/nql;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-interface {v1, v2}, Ll/nql;->a(Z)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    const/4 v3, 0x0

    .line 21
    invoke-virtual {v0, v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v1, v0

    .line 26
    check-cast v1, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 27
    .line 28
    iput-object v1, p0, Ll/snf;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 29
    .line 30
    sget v2, Ll/c9c0;->P0:I

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/snf;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 36
    .line 37
    sget v2, Ll/qa00;->h:I

    .line 38
    .line 39
    sget v3, Ll/qa00;->m:I

    .line 40
    .line 41
    const/high16 v4, 0x42e40000    # 114.0f

    .line 42
    .line 43
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    invoke-virtual {v1, v2, v3, v2, v4}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->b1(IIII)V

    .line 48
    .line 49
    .line 50
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 51
    .line 52
    sget v2, Ll/bnl0;->e:I

    .line 53
    .line 54
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 55
    .line 56
    .line 57
    iget-object v2, p0, Ll/snf;->b:Landroid/content/Context;

    .line 58
    .line 59
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-eqz v2, :cond_0

    .line 64
    .line 65
    iget-object v2, p0, Ll/snf;->c:Lv/VFrame;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/snf;->i(Landroid/view/View;)Landroid/widget/LinearLayout;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v2, v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 72
    .line 73
    .line 74
    :cond_0
    iget-object v0, p0, Ll/snf;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 75
    .line 76
    new-instance v1, Ll/snf$a;

    .line 77
    .line 78
    invoke-direct {v1, p0}, Ll/snf$a;-><init>(Ll/snf;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/base/BaseExpandedView;->X(Ll/atl;)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/snf;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 85
    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->G()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;Ll/bkj0;)V
    .locals 7

    .line 1
    iget-object v0, p2, Ll/bkj0;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v1, p2, Ll/bkj0;->b:Ljava/lang/Object;

    .line 6
    .line 7
    move-object v2, v1

    .line 8
    check-cast v2, Lcom/p1/mobile/putong/data/User;

    .line 9
    .line 10
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 11
    .line 12
    iput-object v2, v0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 13
    .line 14
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 15
    .line 16
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 19
    .line 20
    new-instance v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 23
    .line 24
    .line 25
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    iput-object v2, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 28
    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->PROFILE_PREVIEW:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 30
    .line 31
    iput-object v2, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 32
    .line 33
    new-instance v2, Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 36
    .line 37
    .line 38
    iget-object v3, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 39
    .line 40
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-eqz v3, :cond_3

    .line 45
    .line 46
    iget-object v3, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast v3, Ll/vg60;

    .line 49
    .line 50
    iget-object v3, v3, Ll/vg60;->a:Ljava/util/List;

    .line 51
    .line 52
    invoke-static {v3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_3

    .line 57
    .line 58
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    if-eqz v4, :cond_3

    .line 67
    .line 68
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    check-cast v4, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 73
    .line 74
    iget-object v5, v4, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 75
    .line 76
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 77
    .line 78
    .line 79
    move-result v5

    .line 80
    if-nez v5, :cond_0

    .line 81
    .line 82
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 83
    .line 84
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    if-eqz v5, :cond_0

    .line 93
    .line 94
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    check-cast v5, Lcom/p1/mobile/putong/data/Media;

    .line 99
    .line 100
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Picture;

    .line 101
    .line 102
    if-nez v6, :cond_2

    .line 103
    .line 104
    instance-of v6, v5, Lcom/p1/mobile/putong/data/Video;

    .line 105
    .line 106
    if-eqz v6, :cond_1

    .line 107
    .line 108
    :cond_2
    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    iput-object v2, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 113
    .line 114
    iget-object p2, p2, Ll/bkj0;->c:Ljava/lang/Object;

    .line 115
    .line 116
    check-cast p2, Ll/vg60;

    .line 117
    .line 118
    iget-object p2, p2, Ll/vg60;->a:Ljava/util/List;

    .line 119
    .line 120
    iput-object p2, v1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfoList:Ljava/util/List;

    .line 121
    .line 122
    iget-object p2, p0, Ll/snf;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 123
    .line 124
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    new-instance v2, Ll/rnf;

    .line 128
    .line 129
    invoke-direct {v2, p1}, Ll/rnf;-><init>(Lcom/p1/mobile/putong/core/ui/profile/exp/ProfileListExpandedEditFrag;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedBaseLayout;->setPageHelper(Lcom/p1/mobile/putong/core/newui/home/NewNewProfileCard$d;)V

    .line 133
    .line 134
    .line 135
    iget-object p1, p0, Ll/snf;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 136
    .line 137
    const/4 p2, 0x0

    .line 138
    invoke-virtual {p1, v0, v1, p2}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->T(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;I)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Ll/snf;->c:Lv/VFrame;

    .line 142
    .line 143
    sget v0, Ll/adc0;->Ja:I

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Ll/snf;->c:Lv/VFrame;

    .line 153
    .line 154
    invoke-static {p1}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_4

    .line 159
    .line 160
    iget-object p0, p0, Ll/snf;->d:Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;

    .line 161
    .line 162
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/UserProfileExpandedCard;->G()V

    .line 163
    .line 164
    .line 165
    :cond_4
    return-void
.end method

.method public final l()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    .line 30
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->personalMediaMomentsFeedPrevious(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 31
    .line 32
    .line 33
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 38
    .line 39
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->di(Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    new-instance v0, Ll/pnf;

    .line 44
    .line 45
    invoke-direct {v0}, Ll/pnf;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0

    .line 53
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 58
    .line 59
    invoke-interface {v0, p0, v1, v2}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->personalMediaMomentsFeedPrevious(Ljava/lang/String;ZLcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    new-instance v0, Ll/qnf;

    .line 64
    .line 65
    invoke-direct {v0}, Ll/qnf;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method public m(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    return-void
.end method

.method public n(Landroidx/recyclerview/widget/RecyclerView$t;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snf;->g:Landroidx/recyclerview/widget/RecyclerView$t;

    .line 2
    .line 3
    return-void
.end method
