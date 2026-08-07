.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;
.source "SourceFile"


# instance fields
.field public A:Ll/wyd0;

.field public u:Landroid/widget/FrameLayout;

.field public v:Landroid/widget/TextView;

.field public w:Landroid/widget/ImageView;

.field public x:Landroid/widget/ImageView;

.field public y:Landroid/widget/FrameLayout;

.field public z:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/wyd0;

    .line 5
    .line 6
    const-string v0, "current_qa_topic_post_moment_id"

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 15
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 16
    new-instance p1, Ll/wyd0;

    const-string p2, "current_qa_topic_post_moment_id"

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

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

    .line 17
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 18
    new-instance p1, Ll/wyd0;

    const-string p2, "current_qa_topic_post_moment_id"

    const/4 p3, 0x0

    invoke-direct {p1, p2, p3}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    return-void
.end method

.method public static synthetic F(Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->s(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->I(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public D()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->v:Landroid/widget/TextView;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->c:Landroid/widget/TextView;

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->w:Landroid/widget/ImageView;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->d:Landroid/widget/ImageView;

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->x:Landroid/widget/ImageView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->e:Landroid/widget/ImageView;

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->z:Landroid/widget/ProgressBar;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->f:Landroid/widget/ProgressBar;

    .line 16
    .line 17
    return-void
.end method

.method public final H(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ssb0;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic I(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->t:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public J()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 22
    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    return-void

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 31
    .line 32
    .line 33
    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    return-void
.end method

.method public j(Ll/pf60;)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x6

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    goto/16 :goto_2

    .line 13
    .line 14
    :cond_0
    const/4 v2, 0x4

    .line 15
    if-eq v0, v2, :cond_2

    .line 16
    .line 17
    invoke-static {p0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    if-eqz v3, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-nez v3, :cond_2

    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->A()V

    .line 30
    .line 31
    .line 32
    :cond_2
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 35
    .line 36
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->z:Landroid/widget/ProgressBar;

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/widget/ProgressBar;->getProgress()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->j:I

    .line 43
    .line 44
    if-eqz v0, :cond_8

    .line 45
    .line 46
    const/4 v3, 0x1

    .line 47
    if-eq v0, v3, :cond_7

    .line 48
    .line 49
    const/4 p1, 0x2

    .line 50
    const/4 v4, 0x0

    .line 51
    if-eq v0, p1, :cond_6

    .line 52
    .line 53
    const/4 p1, 0x3

    .line 54
    if-eq v0, p1, :cond_5

    .line 55
    .line 56
    if-eq v0, v2, :cond_4

    .line 57
    .line 58
    const/4 p1, 0x5

    .line 59
    const-wide/16 v1, 0x0

    .line 60
    .line 61
    const/4 v5, 0x0

    .line 62
    if-eq v0, p1, :cond_3

    .line 63
    .line 64
    :goto_0
    move-wide v7, v1

    .line 65
    move-object v11, v4

    .line 66
    move v10, v5

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    iput v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->j:I

    .line 69
    .line 70
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->z(Z)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    new-instance p1, Ll/pf60;

    .line 75
    .line 76
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-direct {p1, v0, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    invoke-static {p1}, Ll/cn40;->A0(Ll/pf60;)V

    .line 84
    .line 85
    .line 86
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 87
    .line 88
    new-instance v4, Ll/rsb0;

    .line 89
    .line 90
    invoke-direct {v4, p0}, Ll/rsb0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    .line 94
    .line 95
    invoke-virtual {p1}, Ll/wyd0;->clear()Z

    .line 96
    .line 97
    .line 98
    const-wide/16 v1, 0xa

    .line 99
    .line 100
    const/16 v5, 0x1f4

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_5
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->m:F

    .line 104
    .line 105
    float-to-long v1, p1

    .line 106
    const/16 v5, 0x1ef

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_6
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->l:F

    .line 110
    .line 111
    float-to-long v1, p1

    .line 112
    const/16 v5, 0x1db

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :goto_1
    iget v9, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->j:I

    .line 116
    .line 117
    move-object v6, p0

    .line 118
    invoke-virtual/range {v6 .. v11}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->x(JIILjava/lang/Runnable;)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :cond_7
    move-object v6, p0

    .line 123
    iget-object p0, v6, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    .line 124
    .line 125
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    :cond_8
    :goto_2
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/feed/FeedModule;->c:Lcom/p1/mobile/putong/feed/api/b;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    .line 16
    .line 17
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Ljava/lang/String;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/api/b;->X3(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/data/Moment;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 28
    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    :goto_0
    return-void

    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->A:Ll/wyd0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->q:Ll/y20;

    .line 38
    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 40
    .line 41
    invoke-interface {v0, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 42
    .line 43
    .line 44
    const/4 v0, 0x0

    .line 45
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 46
    .line 47
    return-void
.end method

.method public m()V
    .locals 0

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->H(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o(I)V
    .locals 1

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->r:Z

    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->w:Landroid/widget/ImageView;

    .line 5
    .line 6
    new-instance v0, Ll/osb0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/osb0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->x:Landroid/widget/ImageView;

    .line 15
    .line 16
    new-instance v0, Ll/psb0;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/psb0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->h()Lcom/p1/mobile/android/app/Act;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-static {}, Ll/cn40;->Y()Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/qsb0;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/qsb0;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic s(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->t:Ll/y20;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public y(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->r:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->i:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->A()V

    .line 9
    .line 10
    .line 11
    iget p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->k:F

    .line 12
    .line 13
    float-to-long v1, p1

    .line 14
    const/16 v4, 0x15e

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    const/4 v3, 0x0

    .line 18
    move-object v0, p0

    .line 19
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/photoalbum/MomentPostBar;->x(JIILjava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public z(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->u:Landroid/widget/FrameLayout;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/QAMomentPostBar;->y:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    xor-int/lit8 p1, p1, 0x1

    .line 9
    .line 10
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
