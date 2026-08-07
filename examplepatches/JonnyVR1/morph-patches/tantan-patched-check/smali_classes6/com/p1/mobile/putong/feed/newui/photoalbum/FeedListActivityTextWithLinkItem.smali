.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Lv/VRelative;

.field public i:I

.field public j:Lcom/p1/mobile/putong/feed/data/Moment;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:I

.field public n:Z

.field public o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->n:Z

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->n:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->n:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->i(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->h(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/lch;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public e()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->f:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->g:Lv/VText;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 13
    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    xor-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 26
    .line 27
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->m(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;

    .line 33
    .line 34
    new-instance v1, Ll/ich;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/ich;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->g:Lv/VText;

    .line 43
    .line 44
    new-instance v1, Ll/jch;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/jch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;)V

    .line 47
    .line 48
    .line 49
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->h:Lv/VRelative;

    .line 53
    .line 54
    new-instance v1, Ll/kch;

    .line 55
    .line 56
    invoke-direct {v1, p0}, Ll/kch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;)V

    .line 57
    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public final g()V
    .locals 3

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [Ll/pf60;

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 5
    .line 6
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    const-string v2, "moment_id"

    .line 9
    .line 10
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    const/4 v2, 0x0

    .line 15
    aput-object v1, v0, v2

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "owner_id"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x1

    .line 28
    aput-object v1, v0, v2

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->m:I

    .line 31
    .line 32
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-string v2, "order"

    .line 37
    .line 38
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const/4 v2, 0x2

    .line 43
    aput-object v1, v0, v2

    .line 44
    .line 45
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "moment_type"

    .line 56
    .line 57
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const/4 v2, 0x3

    .line 62
    aput-object v1, v0, v2

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 65
    .line 66
    invoke-static {v1}, Ll/ksg;->G(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 67
    .line 68
    .line 69
    move-result-wide v1

    .line 70
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v2, "moment_distance"

    .line 75
    .line 76
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const/4 v2, 0x4

    .line 81
    aput-object v1, v0, v2

    .line 82
    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 84
    .line 85
    invoke-static {v1}, Ll/ksg;->F(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 86
    .line 87
    .line 88
    move-result-wide v1

    .line 89
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const-string v2, "moment_create_time"

    .line 94
    .line 95
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    const/4 v2, 0x5

    .line 100
    aput-object v1, v0, v2

    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 103
    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 105
    .line 106
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-static {v1}, Ll/ksg;->S(Lcom/p1/mobile/putong/data/User;)J

    .line 113
    .line 114
    .line 115
    move-result-wide v1

    .line 116
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const-string v2, "owner_active_time"

    .line 121
    .line 122
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 123
    .line 124
    .line 125
    move-result-object v1

    .line 126
    const/4 v2, 0x6

    .line 127
    aput-object v1, v0, v2

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 130
    .line 131
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 132
    .line 133
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    if-eqz v1, :cond_0

    .line 138
    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 140
    .line 141
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 142
    .line 143
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-nez v1, :cond_0

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 152
    .line 153
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 154
    .line 155
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 156
    .line 157
    const-string v2, "activity_id"

    .line 158
    .line 159
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    invoke-static {v1, v0}, Ll/ksg;->J(Ll/pf60;[Ll/pf60;)[Ll/pf60;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    :cond_0
    const-string v1, "e_moment"

    .line 168
    .line 169
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->l:Ljava/lang/String;

    .line 170
    .line 171
    invoke-static {v1, p0, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 172
    .line 173
    .line 174
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->n:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->k:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    const/4 v0, 0x1

    .line 37
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 42
    .line 43
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    if-nez p1, :cond_1

    .line 54
    .line 55
    :goto_0
    return-void

    .line 56
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->e()Lcom/p1/mobile/android/app/Act;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->g()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 10
    .line 11
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const-class v1, Landroid/text/style/URLSpan;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    invoke-virtual {v0, v2, p1, v1}, Landroid/text/SpannableStringBuilder;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, [Landroid/text/style/URLSpan;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->e()Lcom/p1/mobile/android/app/Act;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    const-string v3, "tantan://webview?url="

    .line 34
    .line 35
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    aget-object p1, p1, v2

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-static {v0, p1}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->g()V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final synthetic j(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->l:Ljava/lang/String;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    new-array v0, v0, [Ll/pf60;

    .line 5
    .line 6
    const-string v1, "e_worldcup_moment_pic"

    .line 7
    .line 8
    invoke-static {v1, p1, v0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 12
    .line 13
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    const/4 v0, 0x0

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_0

    .line 29
    .line 30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->url:Ljava/lang/String;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    move-object p1, v0

    .line 38
    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_1

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 53
    .line 54
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_1

    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 63
    .line 64
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 65
    .line 66
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p1}, Ll/pu20;->b(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    :cond_1
    move-object p1, v0

    .line 73
    :cond_2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_3

    .line 78
    .line 79
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->k(Landroid/app/Activity;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->g()V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final k(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, ""

    .line 11
    .line 12
    invoke-static {p1, p0, p2}, Lcom/p1/mobile/putong/ui/webview/mk/MkDlgWebViewAct;->Y1(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const-string p2, "hideNavigationBar"

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    const-string p2, "skipLoading"

    .line 23
    .line 24
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 25
    .line 26
    .line 27
    const-string p2, "transparent_status_bar"

    .line 28
    .line 29
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 30
    .line 31
    .line 32
    const-string p2, "webviewColor"

    .line 33
    .line 34
    const-string v1, "transparent"

    .line 35
    .line 36
    invoke-virtual {p0, p2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    const-string p2, "hideNotch"

    .line 40
    .line 41
    invoke-virtual {p0, p2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    :goto_0
    return-void
.end method

.method public l(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/lang/String;)V
    .locals 4

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->k:Ljava/lang/String;

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->i:I

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->m:I

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->l:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->f()V

    .line 12
    .line 13
    .line 14
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    const/4 p5, 0x2

    .line 21
    const/4 v0, 0x0

    .line 22
    if-nez p3, :cond_2

    .line 23
    .line 24
    if-ne p1, p5, :cond_2

    .line 25
    .line 26
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->b:Lv/VLinear;

    .line 27
    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 33
    .line 34
    sget-object v2, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 35
    .line 36
    sget v3, Lcom/p1/mobile/putong/feed/R$string;->i2:I

    .line 37
    .line 38
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p3

    .line 46
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->d:Lv/VText;

    .line 47
    .line 48
    if-eqz p3, :cond_0

    .line 49
    .line 50
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 54
    .line 55
    iget-object v1, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    .line 59
    .line 60
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 61
    .line 62
    const/high16 v1, 0x425c0000    # 55.0f

    .line 63
    .line 64
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 69
    .line 70
    const/high16 v2, 0x41880000    # 17.0f

    .line 71
    .line 72
    invoke-static {p3, v1, p2, v2}, Ll/cai;->f(Landroid/widget/TextView;ILjava/lang/String;F)F

    .line 73
    .line 74
    .line 75
    move-result p2

    .line 76
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 81
    .line 82
    .line 83
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 84
    .line 85
    const-string p3, "/"

    .line 86
    .line 87
    invoke-virtual {p2, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p2

    .line 91
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 92
    .line 93
    const/high16 v2, 0x41a00000    # 20.0f

    .line 94
    .line 95
    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 96
    .line 97
    .line 98
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 99
    .line 100
    aget-object v2, p2, v0

    .line 101
    .line 102
    invoke-virtual {p3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 103
    .line 104
    .line 105
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->d:Lv/VText;

    .line 106
    .line 107
    aget-object p2, p2, v1

    .line 108
    .line 109
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 110
    .line 111
    .line 112
    :goto_0
    if-nez p4, :cond_1

    .line 113
    .line 114
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 115
    .line 116
    const/high16 p3, 0x41c00000    # 24.0f

    .line 117
    .line 118
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 119
    .line 120
    .line 121
    move-result p4

    .line 122
    invoke-static {p2, p4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 123
    .line 124
    .line 125
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->d:Lv/VText;

    .line 126
    .line 127
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 128
    .line 129
    .line 130
    move-result p3

    .line 131
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 132
    .line 133
    .line 134
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->e:Landroid/widget/LinearLayout;

    .line 135
    .line 136
    const/high16 p3, 0x41e00000    # 28.0f

    .line 137
    .line 138
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 139
    .line 140
    .line 141
    move-result p3

    .line 142
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 143
    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->e:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->o:I

    .line 149
    .line 150
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 154
    .line 155
    const/high16 p3, 0x40800000    # 4.0f

    .line 156
    .line 157
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 158
    .line 159
    .line 160
    move-result p4

    .line 161
    neg-int p4, p4

    .line 162
    invoke-static {p2, p4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 163
    .line 164
    .line 165
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->d:Lv/VText;

    .line 166
    .line 167
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 168
    .line 169
    .line 170
    move-result p3

    .line 171
    neg-int p3, p3

    .line 172
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 173
    .line 174
    .line 175
    goto :goto_1

    .line 176
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->b:Lv/VLinear;

    .line 177
    .line 178
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 179
    .line 180
    .line 181
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->e:Landroid/widget/LinearLayout;

    .line 182
    .line 183
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->o:I

    .line 184
    .line 185
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 186
    .line 187
    .line 188
    :goto_1
    if-ne p1, p5, :cond_3

    .line 189
    .line 190
    const/high16 p1, 0x41800000    # 16.0f

    .line 191
    .line 192
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    goto :goto_2

    .line 197
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->e()Lcom/p1/mobile/android/app/Act;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 202
    .line 203
    if-eqz p1, :cond_4

    .line 204
    .line 205
    const/high16 p1, 0x41000000    # 8.0f

    .line 206
    .line 207
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    :cond_4
    :goto_2
    invoke-static {p0, v0}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 212
    .line 213
    .line 214
    return-void
.end method

.method public final m(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 19
    .line 20
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    const/4 p1, 0x0

    .line 28
    :goto_0
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-eqz v0, :cond_3

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->h:Lv/VRelative;

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Lv/VDraweeView;

    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 43
    .line 44
    const-string v1, "raw"

    .line 45
    .line 46
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_2

    .line 59
    .line 60
    invoke-static {}, Ll/bnl0;->y0()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    const/high16 v1, 0x42a00000    # 80.0f

    .line 65
    .line 66
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    sub-int/2addr v0, v1

    .line 71
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Picture;->calculatedWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 76
    .line 77
    invoke-virtual {v1, p0, v0}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_2
    const/high16 p1, 0x41200000    # 10.0f

    .line 90
    .line 91
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    int-to-float p1, p1

    .line 96
    invoke-static {p1}, Lcom/facebook/drawee/generic/RoundingParams;->c(F)Lcom/facebook/drawee/generic/RoundingParams;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    sget-object v0, Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;->BITMAP_ONLY:Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Lcom/facebook/drawee/generic/RoundingParams;->w(Lcom/facebook/drawee/generic/RoundingParams$RoundingMethod;)Lcom/facebook/drawee/generic/RoundingParams;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p0}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    check-cast p0, Ll/wlj;

    .line 111
    .line 112
    invoke-virtual {p0, p1}, Ll/wlj;->H(Lcom/facebook/drawee/generic/RoundingParams;)V

    .line 113
    .line 114
    .line 115
    :cond_3
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    const v0, 0x3f232551

    .line 2
    .line 3
    .line 4
    int-to-float p1, p1

    .line 5
    mul-float/2addr p1, v0

    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->h:Lv/VRelative;

    .line 7
    .line 8
    float-to-int p1, p1

    .line 9
    invoke-static {p0, p1}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->e:Landroid/widget/LinearLayout;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 14
    .line 15
    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->o:I

    .line 18
    .line 19
    invoke-static {}, Ll/bnl0;->y0()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/high16 v1, 0x42a00000    # 80.0f

    .line 24
    .line 25
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    sub-int/2addr v0, v1

    .line 30
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->n(I)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public setNeedInnerClick(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListActivityTextWithLinkItem;->n:Z

    .line 2
    .line 3
    return-void
.end method
