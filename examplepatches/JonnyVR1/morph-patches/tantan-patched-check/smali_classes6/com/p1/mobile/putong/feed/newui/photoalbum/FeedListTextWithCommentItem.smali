.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;

.field public b:Lv/VLinear;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VText;

.field public e:Landroid/widget/LinearLayout;

.field public f:Lv/VText_Expandable;

.field public g:Lv/VText;

.field public h:Lcom/p1/mobile/putong/feed/data/Moment;

.field public i:Lcom/p1/mobile/putong/feed/data/RawFeed;

.field public j:Ljava/lang/String;

.field public k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->i(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/tch;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;Landroid/view/View;)V

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->g:Lv/VText;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->g:Lv/VText;

    .line 8
    .line 9
    const-string v0, "\u8be5\u52a8\u6001\u5df2\u88ab\u7528\u6237\u5220\u9664"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->f:Lv/VText_Expandable;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lv/VText_Expandable;->setText(Ljava/lang/CharSequence;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->f:Lv/VText_Expandable;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->k:Ljava/util/HashMap;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 15
    .line 16
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Lv/VText_Expandable;->n(Ljava/util/HashMap;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->f:Lv/VText_Expandable;

    .line 22
    .line 23
    new-instance v1, Ll/sch;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/sch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final g()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 4
    .line 5
    if-eqz v0, :cond_5

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->g:Lv/VText;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 25
    .line 26
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 27
    .line 28
    iget-object v1, v1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->sourceId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ll/jka;->w7(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_4

    .line 35
    .line 36
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 46
    .line 47
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ll/jka;->e8(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    iget-object v2, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-nez v2, :cond_3

    .line 62
    .line 63
    iget-object v2, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 64
    .line 65
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_2

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string v3, "@"

    .line 75
    .line 76
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, v0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->g:Lv/VText;

    .line 94
    .line 95
    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 96
    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->g:Lv/VText;

    .line 99
    .line 100
    new-instance v2, Ll/rch;

    .line 101
    .line 102
    invoke-direct {v2, p0, v0}, Ll/rch;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :cond_3
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->e()V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_4
    :goto_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->e()V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_5
    :goto_2
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->g:Lv/VText;

    .line 118
    .line 119
    const/4 v0, 0x0

    .line 120
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final synthetic h(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->j:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    const/4 v0, 0x1

    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->i:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->s(Lcom/p1/mobile/putong/feed/data/RawFeed;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    if-nez p1, :cond_0

    .line 55
    .line 56
    return-void

    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public final synthetic i(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->c(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->j:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->j(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    const/4 v1, -0x1

    .line 37
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->g(I)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 38
    .line 39
    .line 40
    move-result-object p2

    .line 41
    const/4 v1, 0x1

    .line 42
    invoke-virtual {p2, v1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->h(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    if-nez p1, :cond_0

    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public final j(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->b:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->b:Lv/VLinear;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 16
    .line 17
    sget-object v3, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 18
    .line 19
    sget v4, Lcom/p1/mobile/putong/feed/R$string;->i2:I

    .line 20
    .line 21
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->d:Lv/VText;

    .line 30
    .line 31
    const/high16 v4, 0x41880000    # 17.0f

    .line 32
    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    invoke-static {v3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->c:Landroid/widget/TextView;

    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 41
    .line 42
    iget-object v3, v3, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->c:Landroid/widget/TextView;

    .line 48
    .line 49
    const/high16 v3, 0x425c0000    # 55.0f

    .line 50
    .line 51
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v3

    .line 55
    iget-object v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 56
    .line 57
    iget-object v5, v5, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0, v3, v5, v4}, Ll/cai;->f(Landroid/widget/TextView;ILjava/lang/String;F)F

    .line 60
    .line 61
    .line 62
    move-result v3

    .line 63
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextSize(F)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_0
    invoke-static {v3, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 71
    .line 72
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 73
    .line 74
    const-string v3, "/"

    .line 75
    .line 76
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->c:Landroid/widget/TextView;

    .line 81
    .line 82
    aget-object v5, v0, v1

    .line 83
    .line 84
    invoke-virtual {v3, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 85
    .line 86
    .line 87
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->d:Lv/VText;

    .line 88
    .line 89
    aget-object v0, v0, v2

    .line 90
    .line 91
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    .line 93
    .line 94
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->c:Landroid/widget/TextView;

    .line 95
    .line 96
    if-nez p1, :cond_1

    .line 97
    .line 98
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    invoke-static {v0, p1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_1
    invoke-static {v0, v1}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 107
    .line 108
    .line 109
    :goto_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->b:Lv/VLinear;

    .line 110
    .line 111
    const/high16 v0, -0x40000000    # -2.0f

    .line 112
    .line 113
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    invoke-static {p1, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->d:Lv/VText;

    .line 121
    .line 122
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 123
    .line 124
    .line 125
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->c:Landroid/widget/TextView;

    .line 126
    .line 127
    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->d:Lv/VText;

    .line 131
    .line 132
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->c:Landroid/widget/TextView;

    .line 136
    .line 137
    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setIncludeFontPadding(Z)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public k(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-virtual/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->l(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public l(Lcom/p1/mobile/putong/feed/data/Moment;Ljava/lang/String;ILjava/util/HashMap;Ljava/lang/String;Lcom/p1/mobile/putong/feed/data/RawFeed;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    iput-object p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->j:Ljava/lang/String;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->h:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 4
    .line 5
    iput-object p6, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->i:Lcom/p1/mobile/putong/feed/data/RawFeed;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->k:Ljava/util/HashMap;

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const/4 p4, 0x1

    .line 17
    invoke-static {p0, p4}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->f()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->g()V

    .line 24
    .line 25
    .line 26
    iget-object p4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->e:Landroid/widget/LinearLayout;

    .line 27
    .line 28
    if-nez p3, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    .line 33
    move-result-object p5

    .line 34
    instance-of p5, p5, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 35
    .line 36
    if-eqz p5, :cond_1

    .line 37
    .line 38
    const/4 p5, 0x0

    .line 39
    :goto_0
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result p5

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    const/high16 p5, 0x41800000    # 16.0f

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :goto_1
    invoke-static {p4, p5}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    goto :goto_2

    .line 51
    :cond_2
    invoke-static {p4, p2}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 52
    .line 53
    .line 54
    :goto_2
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->feedTime:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-nez p1, :cond_3

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->d()Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    instance-of p1, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct;

    .line 67
    .line 68
    if-nez p1, :cond_3

    .line 69
    .line 70
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->j(I)V

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->b:Lv/VLinear;

    .line 75
    .line 76
    invoke-static {p0, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/FeedListTextWithCommentItem;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
