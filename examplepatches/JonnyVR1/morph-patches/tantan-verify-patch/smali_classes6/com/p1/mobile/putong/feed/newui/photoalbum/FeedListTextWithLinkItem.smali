.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText_Expandable;

.field public g:Lv/VText;

.field public h:I

.field public i:Lcom/p1/mobile/putong/feed/data/Moment;

.field public j:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public n:I

.field public o:Z

.field public p:I


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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->o:Z

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->o:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->o:Z

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wch;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()Lcom/p1/mobile/android/app/Act;
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

.method public final e()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->f:Lv/VText_Expandable;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lv/VText_Expandable;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->f:Lv/VText_Expandable;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->m:Ljava/util/HashMap;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Lv/VText_Expandable;->n(Ljava/util/HashMap;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->g:Lv/VText;

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_0

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const/4 v1, 0x0

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 47
    :goto_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->a:Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;

    .line 51
    .line 52
    new-instance v1, Ll/uch;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/uch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->g:Lv/VText;

    .line 61
    .line 62
    new-instance v1, Ll/vch;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/vch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final f()V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->l:Ljava/lang/String;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-boolean v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    const-string v1, "1"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v1, "0"

    .line 13
    .line 14
    :goto_0
    const-string v2, "qa_optional"

    .line 15
    .line 16
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 36
    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 43
    .line 44
    iget-object v1, v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->id:Ljava/lang/String;

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_2
    :goto_1
    const-string v1, ""

    .line 48
    .line 49
    :goto_2
    const-string v2, "topic_id"

    .line 50
    .line 51
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    const-string v2, "moment_id"

    .line 60
    .line 61
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v5

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 66
    .line 67
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 68
    .line 69
    const-string v2, "owner_id"

    .line 70
    .line 71
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->n:I

    .line 76
    .line 77
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    const-string v2, "order"

    .line 82
    .line 83
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object v7

    .line 87
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 92
    .line 93
    invoke-virtual {v1, v2}, Ll/er60;->y(Lcom/p1/mobile/putong/feed/data/Moment;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const-string v2, "moment_type"

    .line 98
    .line 99
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 100
    .line 101
    .line 102
    move-result-object v8

    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 104
    .line 105
    invoke-static {v1}, Ll/ksg;->G(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 106
    .line 107
    .line 108
    move-result-wide v1

    .line 109
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const-string v2, "moment_distance"

    .line 114
    .line 115
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 116
    .line 117
    .line 118
    move-result-object v9

    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 120
    .line 121
    invoke-static {v1}, Ll/ksg;->F(Lcom/p1/mobile/putong/feed/data/Moment;)J

    .line 122
    .line 123
    .line 124
    move-result-wide v1

    .line 125
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    const-string v2, "moment_create_time"

    .line 130
    .line 131
    invoke-static {v2, v1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 132
    .line 133
    .line 134
    move-result-object v10

    .line 135
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 136
    .line 137
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 138
    .line 139
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v1, p0}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {p0}, Ll/ksg;->S(Lcom/p1/mobile/putong/data/User;)J

    .line 146
    .line 147
    .line 148
    move-result-wide v1

    .line 149
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    const-string v1, "owner_active_time"

    .line 154
    .line 155
    invoke-static {v1, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 156
    .line 157
    .line 158
    move-result-object v11

    .line 159
    filled-new-array/range {v3 .. v11}, [Ll/pf60;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    const-string v1, "e_moment"

    .line 164
    .line 165
    invoke-static {v1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 166
    .line 167
    .line 168
    return-void
.end method

.method public final g()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->l:Ljava/lang/String;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->id:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "activity_id"

    .line 22
    .line 23
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 30
    .line 31
    iget-object v2, v2, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->name:Ljava/lang/String;

    .line 32
    .line 33
    const-string v3, "activity_name"

    .line 34
    .line 35
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const-string v3, "moment_show_type"

    .line 40
    .line 41
    const-string v4, "card"

    .line 42
    .line 43
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 50
    .line 51
    const-string v4, "moments_user_id"

    .line 52
    .line 53
    invoke-static {v4, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    filled-new-array {v1, v2, v3, p0}, [Ll/pf60;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string v1, "e_activity_moment"

    .line 62
    .line 63
    invoke-static {v1, v0, p0}, Ll/tfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->o:Z

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->f()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->k:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    const/4 v0, 0x1

    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->s(Lcom/p1/mobile/putong/feed/data/RawFeed;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    if-nez p1, :cond_1

    .line 63
    .line 64
    :goto_0
    return-void

    .line 65
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic i(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->g()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->f()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p1, p0}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 34
    .line 35
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 46
    .line 47
    const-string v0, "tantan"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 60
    .line 61
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {p1, p0}, Ll/ryh;->b(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 80
    .line 81
    .line 82
    move-result-object v1

    .line 83
    invoke-virtual {v1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    sget v2, Lcom/p1/mobile/putong/feed/R$string;->k4:I

    .line 88
    .line 89
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 94
    .line 95
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 96
    .line 97
    invoke-static {v0, v1, p0}, Ll/orb0;->j(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    invoke-virtual {p1, p0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method

.method public j(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move v4, p4

    .line 7
    move-object v5, p5

    .line 8
    move-object v6, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->k(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public k(ILcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/feed/data/RawFeed;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->k:Ljava/lang/String;

    .line 2
    .line 3
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->h:I

    .line 4
    .line 5
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 6
    .line 7
    iput-object p7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->j:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 8
    .line 9
    iput p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->n:I

    .line 10
    .line 11
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->l:Ljava/lang/String;

    .line 12
    .line 13
    iput-object p5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->m:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->e()V

    .line 16
    .line 17
    .line 18
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p3

    .line 24
    const/4 p5, 0x2

    .line 25
    const/4 p6, 0x0

    .line 26
    if-nez p3, :cond_2

    .line 27
    .line 28
    if-ne p1, p5, :cond_2

    .line 29
    .line 30
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->b:Lv/VLinear;

    .line 31
    .line 32
    const/4 p7, 0x1

    .line 33
    invoke-static {p3, p7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p3, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 37
    .line 38
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 39
    .line 40
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->i2:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d:Lv/VText;

    .line 51
    .line 52
    if-eqz p3, :cond_0

    .line 53
    .line 54
    invoke-static {v0, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 58
    .line 59
    iget-object p7, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p3, p7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    .line 63
    .line 64
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 65
    .line 66
    const/high16 p7, 0x425c0000    # 55.0f

    .line 67
    .line 68
    invoke-static {p7}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result p7

    .line 72
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 73
    .line 74
    const/high16 v0, 0x41880000    # 17.0f

    .line 75
    .line 76
    invoke-static {p3, p7, p2, v0}, Ll/cai;->f(Landroid/widget/TextView;ILjava/lang/String;F)F

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    invoke-static {v0, p7}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 88
    .line 89
    const-string p3, "/"

    .line 90
    .line 91
    invoke-virtual {p2, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 96
    .line 97
    const/high16 v0, 0x41a00000    # 20.0f

    .line 98
    .line 99
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 100
    .line 101
    .line 102
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 103
    .line 104
    aget-object v0, p2, p6

    .line 105
    .line 106
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 107
    .line 108
    .line 109
    iget-object p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d:Lv/VText;

    .line 110
    .line 111
    aget-object p2, p2, p7

    .line 112
    .line 113
    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    :goto_0
    if-nez p4, :cond_1

    .line 117
    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 119
    .line 120
    const/high16 p3, 0x41c00000    # 24.0f

    .line 121
    .line 122
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 123
    .line 124
    .line 125
    move-result p4

    .line 126
    invoke-static {p2, p4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 127
    .line 128
    .line 129
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d:Lv/VText;

    .line 130
    .line 131
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 132
    .line 133
    .line 134
    move-result p3

    .line 135
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 136
    .line 137
    .line 138
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->e:Landroid/widget/LinearLayout;

    .line 139
    .line 140
    const/high16 p3, 0x41e00000    # 28.0f

    .line 141
    .line 142
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 147
    .line 148
    .line 149
    goto :goto_1

    .line 150
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->e:Landroid/widget/LinearLayout;

    .line 151
    .line 152
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->p:I

    .line 153
    .line 154
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 155
    .line 156
    .line 157
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->c:Landroid/widget/TextView;

    .line 158
    .line 159
    const/high16 p3, 0x40800000    # 4.0f

    .line 160
    .line 161
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 162
    .line 163
    .line 164
    move-result p4

    .line 165
    neg-int p4, p4

    .line 166
    invoke-static {p2, p4}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 167
    .line 168
    .line 169
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d:Lv/VText;

    .line 170
    .line 171
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 172
    .line 173
    .line 174
    move-result p3

    .line 175
    neg-int p3, p3

    .line 176
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->b:Lv/VLinear;

    .line 181
    .line 182
    invoke-static {p2, p6}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 183
    .line 184
    .line 185
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->e:Landroid/widget/LinearLayout;

    .line 186
    .line 187
    iget p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->p:I

    .line 188
    .line 189
    invoke-static {p2, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 190
    .line 191
    .line 192
    :goto_1
    if-ne p1, p5, :cond_3

    .line 193
    .line 194
    const/high16 p1, 0x41800000    # 16.0f

    .line 195
    .line 196
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 197
    .line 198
    .line 199
    move-result p6

    .line 200
    goto :goto_2

    .line 201
    :cond_3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 206
    .line 207
    if-eqz p1, :cond_4

    .line 208
    .line 209
    const/high16 p1, 0x41000000    # 8.0f

    .line 210
    .line 211
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 212
    .line 213
    .line 214
    move-result p6

    .line 215
    :cond_4
    :goto_2
    invoke-static {p0, p6}, Ll/bnl0;->f0(Landroid/view/View;I)V

    .line 216
    .line 217
    .line 218
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->e:Landroid/widget/LinearLayout;

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
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->p:I

    .line 18
    .line 19
    return-void
.end method

.method public setNeedInnerClick(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithLinkItem;->o:Z

    .line 2
    .line 3
    return-void
.end method
