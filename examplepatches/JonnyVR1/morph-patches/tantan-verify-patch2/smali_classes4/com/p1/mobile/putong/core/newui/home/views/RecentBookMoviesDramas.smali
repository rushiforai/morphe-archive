.class public Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/home/views/CardBottomBaseInfoView;

.field public b:Lv/VLinear;

.field public c:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

.field public d:Landroid/widget/FrameLayout;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VDraweeView;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Landroid/widget/TextView;

.field public j:Landroid/widget/TextView;

.field public k:Landroid/widget/TextView;

.field public l:Landroid/view/View;

.field public m:Ll/t7m;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;Ljava/util/List;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->d(Ljava/util/List;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "desc_click_bubble_tip"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/apc0;->a(Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic d(Ljava/util/List;Ljava/lang/String;Landroid/view/View;)V
    .locals 10

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    const-string v0, "desc_click_bubble_tip"

    .line 6
    .line 7
    invoke-virtual {p3, v0}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance v8, Ll/w53$d;

    .line 11
    .line 12
    const-string p3, "card"

    .line 13
    .line 14
    const-string v0, "both_like"

    .line 15
    .line 16
    invoke-direct {v8, p3, v0}, Ll/w53$d;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    new-instance v7, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 25
    .line 26
    .line 27
    move-result-object p3

    .line 28
    :cond_0
    :goto_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 39
    .line 40
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 47
    .line 48
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 55
    .line 56
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-nez v1, :cond_0

    .line 63
    .line 64
    new-instance v1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string v2, "\u4f60\u4eec\u90fd\u5bf9\u300a"

    .line 67
    .line 68
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 72
    .line 73
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string v0, "\u300b\u611f\u5174\u8da3"

    .line 79
    .line 80
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    new-instance v1, Ll/w53;

    .line 92
    .line 93
    invoke-direct {v1}, Ll/w53;-><init>()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object p3

    .line 100
    move-object v2, p3

    .line 101
    check-cast v2, Lcom/p1/mobile/android/app/Act;

    .line 102
    .line 103
    new-instance v9, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$a;

    .line 104
    .line 105
    invoke-direct {v9, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    const-string v4, "p_suggest_users_home_view"

    .line 109
    .line 110
    const/4 v5, 0x0

    .line 111
    move-object v6, p1

    .line 112
    move-object v3, p2

    .line 113
    invoke-virtual/range {v1 .. v9}, Ll/w53;->F(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;ZLjava/util/List;Ljava/util/List;Ll/w53$d;Ll/y20;)V

    .line 114
    .line 115
    .line 116
    const-string p1, "artwork_title"

    .line 117
    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->n:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    const-string p2, "artwork_type"

    .line 125
    .line 126
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->o:Ljava/lang/String;

    .line 127
    .line 128
    invoke-static {p2, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    const-string p3, "receiver_user_id"

    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->p:Ljava/lang/String;

    .line 135
    .line 136
    invoke-static {p3, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    filled-new-array {p1, p2, p0}, [Ll/pf60;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    const-string p1, "e_card_artwork_info"

    .line 145
    .line 146
    const-string p2, "p_suggest_users_home_view"

    .line 147
    .line 148
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 149
    .line 150
    .line 151
    return-void
.end method

.method public e(Ll/oql;)V
    .locals 4

    .line 1
    const-string v0, "artwork_title"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->n:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "artwork_type"

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->o:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "receiver_user_id"

    .line 18
    .line 19
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->p:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    filled-new-array {v0, v1, v2}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "e_card_artwork_info"

    .line 30
    .line 31
    const-string v2, "p_suggest_users_home_view"

    .line 32
    .line 33
    invoke-static {v1, v2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->m:Ll/t7m;

    .line 37
    .line 38
    invoke-interface {v0}, Ll/q7m;->getCardView()Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->k:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_0

    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->k:Landroid/widget/TextView;

    .line 58
    .line 59
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;

    .line 64
    .line 65
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;Ll/oql;)V

    .line 66
    .line 67
    .line 68
    const-wide/16 p0, 0x1

    .line 69
    .line 70
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public f(Lcom/p1/mobile/putong/data/Gender;Ljava/lang/String;Ljava/util/List;Ll/t7m;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Gender;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;",
            "Ll/t7m;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->m:Ll/t7m;

    .line 2
    .line 3
    invoke-static {p3}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result p4

    .line 18
    if-eqz p4, :cond_3

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    check-cast p4, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 25
    .line 26
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 27
    .line 28
    if-eqz p4, :cond_2

    .line 29
    .line 30
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result p4

    .line 36
    if-eqz p4, :cond_1

    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void

    .line 39
    :cond_3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->p:Ljava/lang/String;

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->e:Landroid/widget/LinearLayout;

    .line 42
    .line 43
    const/4 p4, 0x0

    .line 44
    invoke-virtual {p1, p4}, Landroid/view/View;->setVisibility(I)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p3, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 52
    .line 53
    new-instance v0, Lcom/facebook/drawee/generic/RoundingParams;

    .line 54
    .line 55
    invoke-direct {v0}, Lcom/facebook/drawee/generic/RoundingParams;-><init>()V

    .line 56
    .line 57
    .line 58
    const/high16 v1, 0x41000000    # 8.0f

    .line 59
    .line 60
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    int-to-float v2, v2

    .line 65
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    int-to-float v3, v3

    .line 70
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v4

    .line 74
    int-to-float v4, v4

    .line 75
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    int-to-float v1, v1

    .line 80
    invoke-virtual {v0, v2, v3, v4, v1}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 81
    .line 82
    .line 83
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 84
    .line 85
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_4

    .line 90
    .line 91
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 92
    .line 93
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->category:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 96
    .line 97
    .line 98
    move-result v1

    .line 99
    if-nez v1, :cond_4

    .line 100
    .line 101
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 102
    .line 103
    invoke-static {v1}, Ll/epc0;->b(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const-string v2, "book"

    .line 108
    .line 109
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-eqz v1, :cond_4

    .line 114
    .line 115
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 116
    .line 117
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 118
    .line 119
    .line 120
    move-result v2

    .line 121
    int-to-float v2, v2

    .line 122
    const/high16 v3, 0x40a00000    # 5.0f

    .line 123
    .line 124
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 125
    .line 126
    .line 127
    move-result v4

    .line 128
    int-to-float v4, v4

    .line 129
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 130
    .line 131
    .line 132
    move-result v3

    .line 133
    int-to-float v3, v3

    .line 134
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    int-to-float v1, v1

    .line 139
    invoke-virtual {v0, v2, v4, v3, v1}, Lcom/facebook/drawee/generic/RoundingParams;->r(FFFF)Lcom/facebook/drawee/generic/RoundingParams;

    .line 140
    .line 141
    .line 142
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->h:Lv/VDraweeView;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    check-cast v1, Ll/wlj;

    .line 149
    .line 150
    invoke-virtual {v1, v0}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 151
    .line 152
    .line 153
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->i:Landroid/widget/TextView;

    .line 158
    .line 159
    const-string v2, "\u300b"

    .line 160
    .line 161
    const-string v3, "\u300a"

    .line 162
    .line 163
    const/4 v4, 0x1

    .line 164
    if-ne v0, v4, :cond_6

    .line 165
    .line 166
    const-string p4, "\u4f60\u4eec\u90fd\u611f\u5174\u8da3\u7684\u4f5c\u54c1\uff1a"

    .line 167
    .line 168
    invoke-virtual {v1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 169
    .line 170
    .line 171
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p4

    .line 175
    if-eqz p4, :cond_5

    .line 176
    .line 177
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 178
    .line 179
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p4

    .line 183
    if-eqz p4, :cond_5

    .line 184
    .line 185
    iget-object p4, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 186
    .line 187
    iget-object v0, p4, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 188
    .line 189
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Literatures;->headUrl:Ljava/lang/String;

    .line 190
    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->j:Landroid/widget/TextView;

    .line 192
    .line 193
    new-instance v5, Ljava/lang/StringBuilder;

    .line 194
    .line 195
    invoke-direct {v5, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 199
    .line 200
    .line 201
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    .line 210
    .line 211
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 212
    .line 213
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->h:Lv/VDraweeView;

    .line 214
    .line 215
    invoke-virtual {v1, v2, p4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->n:Ljava/lang/String;

    .line 219
    .line 220
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 221
    .line 222
    invoke-static {p1}, Ll/epc0;->b(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->o:Ljava/lang/String;

    .line 227
    .line 228
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->f:Lv/VDraweeView;

    .line 229
    .line 230
    const/16 p4, 0x8

    .line 231
    .line 232
    invoke-virtual {p1, p4}, Landroid/view/View;->setVisibility(I)V

    .line 233
    .line 234
    .line 235
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->g:Lv/VDraweeView;

    .line 236
    .line 237
    invoke-virtual {p1, p4}, Landroid/view/View;->setVisibility(I)V

    .line 238
    .line 239
    .line 240
    goto/16 :goto_2

    .line 241
    .line 242
    :cond_6
    invoke-interface {p3}, Ljava/util/List;->size()I

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    const-string v5, "%d\u90e8\u5171\u540c\u611f\u5174\u8da3\u7684\u4f5c\u54c1\uff1a"

    .line 255
    .line 256
    invoke-static {v5, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v0

    .line 260
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    new-instance v0, Ljava/lang/StringBuilder;

    .line 264
    .line 265
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 266
    .line 267
    .line 268
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 269
    .line 270
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-eqz v1, :cond_7

    .line 275
    .line 276
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 277
    .line 278
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Literatures;->headUrl:Ljava/lang/String;

    .line 279
    .line 280
    sget-object v5, Ll/uqb0;->G:Ll/fsb0;

    .line 281
    .line 282
    iget-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->h:Lv/VDraweeView;

    .line 283
    .line 284
    invoke-virtual {v5, v6, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    :cond_7
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    :cond_8
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 292
    .line 293
    .line 294
    move-result v5

    .line 295
    if-eqz v5, :cond_b

    .line 296
    .line 297
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v5

    .line 301
    check-cast v5, Lcom/p1/mobile/putong/core/data/LiteraturesComments;

    .line 302
    .line 303
    invoke-static {v5}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result v6

    .line 307
    if-eqz v6, :cond_8

    .line 308
    .line 309
    iget-object v6, v5, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 310
    .line 311
    invoke-static {v6}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result v6

    .line 315
    if-eqz v6, :cond_8

    .line 316
    .line 317
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 318
    .line 319
    iget-object v5, v5, Lcom/p1/mobile/putong/core/data/Literatures;->title:Ljava/lang/String;

    .line 320
    .line 321
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 322
    .line 323
    .line 324
    move-result v6

    .line 325
    if-nez v6, :cond_9

    .line 326
    .line 327
    iput-object v5, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->n:Ljava/lang/String;

    .line 328
    .line 329
    iget-object v6, p1, Lcom/p1/mobile/putong/core/data/LiteraturesComments;->localLiteratures:Lcom/p1/mobile/putong/core/data/Literatures;

    .line 330
    .line 331
    invoke-static {v6}, Ll/epc0;->b(Lcom/p1/mobile/putong/core/data/Literatures;)Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v6

    .line 335
    iput-object v6, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->o:Ljava/lang/String;

    .line 336
    .line 337
    :cond_9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 338
    .line 339
    .line 340
    move-result v6

    .line 341
    if-lez v6, :cond_a

    .line 342
    .line 343
    const-string v6, "\u3001"

    .line 344
    .line 345
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 346
    .line 347
    .line 348
    :cond_a
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    goto :goto_1

    .line 358
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->j:Landroid/widget/TextView;

    .line 359
    .line 360
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object v0

    .line 364
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 365
    .line 366
    .line 367
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->f:Lv/VDraweeView;

    .line 368
    .line 369
    invoke-virtual {p1, p4}, Landroid/view/View;->setVisibility(I)V

    .line 370
    .line 371
    .line 372
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->g:Lv/VDraweeView;

    .line 373
    .line 374
    invoke-virtual {p1, p4}, Landroid/view/View;->setVisibility(I)V

    .line 375
    .line 376
    .line 377
    :goto_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->k:Landroid/widget/TextView;

    .line 378
    .line 379
    invoke-static {p1, v4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 380
    .line 381
    .line 382
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->k:Landroid/widget/TextView;

    .line 383
    .line 384
    const-string p4, "\u804a\u4e00\u804a"

    .line 385
    .line 386
    invoke-virtual {p1, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 387
    .line 388
    .line 389
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->k:Landroid/widget/TextView;

    .line 390
    .line 391
    new-instance p4, Ll/zoc0;

    .line 392
    .line 393
    invoke-direct {p4, p0, p3, p2}, Ll/zoc0;-><init>(Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;Ljava/util/List;Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    invoke-static {p1, p4}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 397
    .line 398
    .line 399
    return-void
.end method

.method public g(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/android/ui/bubble/a;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v1, Ll/c9c0;->I:I

    .line 13
    .line 14
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    filled-new-array {p1}, [I

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {v0, p1}, Lcom/p1/mobile/android/ui/bubble/a;->k([I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/high16 v0, 0x41500000    # 13.0f

    .line 27
    .line 28
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->J(F)Lcom/p1/mobile/android/ui/bubble/a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    sget v0, Ll/c9c0;->N:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->G(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 v0, 0x1

    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->t(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->E(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/bubble/a;->D(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/bubble/a;->e(Z)Lcom/p1/mobile/android/ui/bubble/a;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget p2, Ll/qa00;->y:I

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/bubble/a;->w(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    new-instance p2, Ll/yoc0;

    .line 62
    .line 63
    invoke-direct {p2}, Ll/yoc0;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/bubble/a;->d(Lcom/p1/mobile/android/ui/bubble/a$b;)Lcom/p1/mobile/android/ui/bubble/a;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    sget p2, Lcom/p1/mobile/android/ui/bubble/a;->Q:I

    .line 71
    .line 72
    sget v0, Lcom/p1/mobile/android/ui/bubble/a;->R:I

    .line 73
    .line 74
    or-int/2addr p2, v0

    .line 75
    invoke-virtual {p1, p2}, Lcom/p1/mobile/android/ui/bubble/a;->q(I)Lcom/p1/mobile/android/ui/bubble/a;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->k:Landroid/widget/TextView;

    .line 84
    .line 85
    invoke-virtual {p2, p1, p0, p3}, Lcom/p1/mobile/android/ui/bubble/d;->u(Lcom/p1/mobile/android/ui/bubble/a;Landroid/view/View;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->e:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 10
    .line 11
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->d:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->e:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    sget v0, Ll/qa00;->h:I

    .line 26
    .line 27
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->d:Landroid/widget/FrameLayout;

    .line 32
    .line 33
    const/high16 v1, 0x3fc00000    # 1.5f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v1

    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->e:Landroid/widget/LinearLayout;

    .line 43
    .line 44
    sget v0, Ll/qa00;->j:I

    .line 45
    .line 46
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iput-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->l:Landroid/view/View;

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {p0, v0, v1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 12
    .line 13
    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->v()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/views/RecentBookMoviesDramas;->c:Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/views/CardUserContentView;->g0()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method
