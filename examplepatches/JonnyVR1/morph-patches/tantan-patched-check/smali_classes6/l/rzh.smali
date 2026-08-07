.class public Ll/rzh;
.super Ll/r8h;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/r8h<",
        "Ll/uzh;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/android/app/Act;

.field public d:Ljava/lang/String;

.field public e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/uzh;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Emotion;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ll/h80;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ll/h80;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/r8h;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/rzh;->e:Ljava/util/List;

    .line 10
    .line 11
    iput-object p2, p0, Ll/rzh;->d:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p1, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    iput-object p3, p0, Ll/rzh;->g:Ll/h80;

    .line 16
    .line 17
    return-void
.end method

.method public static synthetic H(Ll/rzh;Ll/uzh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rzh;->K(Ll/uzh;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ll/uzh;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rzh;->I(Landroid/view/View;Ll/uzh;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rzh;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    .line 1
    new-instance p1, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/adapter/FeedSelectStatusItem;

    .line 2
    .line 3
    iget-object p0, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {p1, p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/adapter/FeedSelectStatusItem;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    return-object p1
.end method

.method public E()Landroid/view/View;
    .locals 2

    .line 1
    invoke-static {}, Ll/cmg;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Ll/cmg;->u0()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance v0, Landroid/widget/TextView;

    .line 15
    .line 16
    iget-object p0, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 19
    .line 20
    .line 21
    const/high16 p0, -0x1000000

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 24
    .line 25
    .line 26
    const/high16 p0, 0x41500000    # 13.0f

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 v1, 0x1

    .line 36
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 37
    .line 38
    .line 39
    return-object v0

    .line 40
    :cond_1
    :goto_0
    new-instance v0, Landroid/widget/TextView;

    .line 41
    .line 42
    iget-object v1, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 43
    .line 44
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 48
    .line 49
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget v1, Ll/k9c0;->C:I

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 60
    .line 61
    .line 62
    const/high16 p0, 0x41400000    # 12.0f

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 65
    .line 66
    .line 67
    return-object v0
.end method

.method public F(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rzh;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/uzh;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/uzh;->e()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public G(Landroid/view/View;I)V
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/widget/TextView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Landroid/widget/TextView;

    .line 6
    .line 7
    iget-object p0, p0, Ll/rzh;->e:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ll/uzh;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/uzh;->a()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public I(Landroid/view/View;Ll/uzh;II)V
    .locals 1

    .line 1
    instance-of p3, p1, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/adapter/FeedSelectStatusItem;

    .line 2
    .line 3
    if-eqz p3, :cond_2

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/adapter/FeedSelectStatusItem;

    .line 6
    .line 7
    new-instance p3, Ll/qzh;

    .line 8
    .line 9
    invoke-direct {p3, p0, p2}, Ll/qzh;-><init>(Ll/rzh;Ll/uzh;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1, p3}, Lv/VLinear;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/adapter/FeedSelectStatusItem;->S(Ll/uzh;)V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/cmg;->A()Z

    .line 19
    .line 20
    .line 21
    move-result p3

    .line 22
    const/4 p4, 0x1

    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    iget-object p3, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 26
    .line 27
    instance-of v0, p3, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    check-cast p3, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;

    .line 32
    .line 33
    iget-object v0, p3, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectAndPostStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 42
    .line 43
    iget-object p3, p3, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p2}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    if-eqz p3, :cond_0

    .line 56
    .line 57
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/adapter/FeedSelectStatusItem;->V(Z)V

    .line 58
    .line 59
    .line 60
    :cond_0
    invoke-static {}, Ll/cmg;->u0()Z

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    if-eqz p3, :cond_1

    .line 65
    .line 66
    iget-object p0, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 67
    .line 68
    instance-of p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 69
    .line 70
    if-eqz p3, :cond_1

    .line 71
    .line 72
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 73
    .line 74
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 75
    .line 76
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p3

    .line 80
    if-eqz p3, :cond_1

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;->h:Lcom/p1/mobile/putong/data/Emotion;

    .line 83
    .line 84
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p2}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p0, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 93
    .line 94
    .line 95
    move-result p0

    .line 96
    if-eqz p0, :cond_1

    .line 97
    .line 98
    invoke-virtual {p1, p4}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/adapter/FeedSelectStatusItem;->V(Z)V

    .line 99
    .line 100
    .line 101
    :cond_1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    const/high16 p2, 0x41a00000    # 20.0f

    .line 106
    .line 107
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 108
    .line 109
    .line 110
    move-result p2

    .line 111
    mul-int/lit8 p2, p2, 0x2

    .line 112
    .line 113
    sub-int/2addr p0, p2

    .line 114
    const/high16 p2, 0x41000000    # 8.0f

    .line 115
    .line 116
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 117
    .line 118
    .line 119
    move-result p2

    .line 120
    mul-int/lit8 p2, p2, 0x3

    .line 121
    .line 122
    sub-int/2addr p0, p2

    .line 123
    div-int/lit8 p0, p0, 0x4

    .line 124
    .line 125
    int-to-float p0, p0

    .line 126
    const/high16 p2, 0x42a80000    # 84.0f

    .line 127
    .line 128
    mul-float/2addr p0, p2

    .line 129
    const/high16 p2, 0x42880000    # 68.0f

    .line 130
    .line 131
    div-float/2addr p0, p2

    .line 132
    const/high16 p2, 0x42500000    # 52.0f

    .line 133
    .line 134
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    int-to-float p2, p2

    .line 139
    sub-float/2addr p0, p2

    .line 140
    const/high16 p2, 0x41880000    # 17.0f

    .line 141
    .line 142
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    int-to-float p2, p2

    .line 147
    sub-float/2addr p0, p2

    .line 148
    const/high16 p2, 0x40400000    # 3.0f

    .line 149
    .line 150
    div-float p2, p0, p2

    .line 151
    .line 152
    float-to-int p3, p2

    .line 153
    sub-float/2addr p0, p2

    .line 154
    float-to-int p0, p0

    .line 155
    invoke-virtual {p1, p3, p0}, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/adapter/FeedSelectStatusItem;->T(II)V

    .line 156
    .line 157
    .line 158
    :cond_2
    return-void
.end method

.method public J(I)Ll/uzh;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rzh;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/uzh;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic K(Ll/uzh;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzh;->L(Ll/uzh;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public L(Ll/uzh;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/cmg;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, "state_type_id"

    .line 6
    .line 7
    const-string v2, "e_set_my_state_type"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ll/cmg;->u0()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/rzh;->f:Ll/y20;

    .line 18
    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    iget-object v0, p0, Ll/rzh;->f:Ll/y20;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-interface {v0, v3}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    const-string v0, "p_moment_fast_state_post"

    .line 35
    .line 36
    iget-object v3, p0, Ll/rzh;->d:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_1

    .line 43
    .line 44
    iget-object v0, p0, Ll/rzh;->d:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    filled-new-array {p1}, [Ll/pf60;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {v2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_2
    invoke-static {}, Ll/cmg;->u0()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    instance-of v0, v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/post/state/FeedMomentPostSelectStatusAct;

    .line 76
    .line 77
    if-eqz v0, :cond_3

    .line 78
    .line 79
    return-void

    .line 80
    :cond_3
    iget-object v0, p0, Ll/rzh;->c:Lcom/p1/mobile/android/app/Act;

    .line 81
    .line 82
    move-object v3, v0

    .line 83
    check-cast v3, Lcom/p1/mobile/putong/feed/newui/status/selectstatus/FeedSelectStatusAct;

    .line 84
    .line 85
    invoke-virtual {p1}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    iget-object p0, p0, Ll/rzh;->d:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v0, v4, p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->u2(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Emotion;Ljava/lang/String;)Landroid/content/Intent;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {v0, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 96
    .line 97
    .line 98
    const/4 p0, 0x0

    .line 99
    invoke-virtual {v3, p0, p0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->l2()V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1}, Ll/uzh;->b()Lcom/p1/mobile/putong/data/Emotion;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 110
    .line 111
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    filled-new-array {p0}, [Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object p0

    .line 119
    const-string p1, "p_set_my_state"

    .line 120
    .line 121
    invoke-static {v2, p1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public M(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/uzh;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rzh;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/rzh;->e:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public N(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/data/Emotion;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/rzh;->f:Ll/y20;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/rzh;->J(I)Ll/uzh;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Ll/r8h;->onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$e0;I)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rzh;->e:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Ll/uzh;

    .line 11
    .line 12
    iget-object p0, p0, Ll/rzh;->g:Ll/h80;

    .line 13
    .line 14
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 15
    .line 16
    invoke-virtual {p0, p1, v0, p2}, Ll/h80;->h(Landroid/view/View;Ljava/lang/Object;I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/rzh;->g:Ll/h80;

    .line 5
    .line 6
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/h80;->g(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$e0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/RecyclerView$e0;)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/rzh;->g:Ll/h80;

    .line 5
    .line 6
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$e0;->itemView:Landroid/view/View;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ll/h80;->i(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
