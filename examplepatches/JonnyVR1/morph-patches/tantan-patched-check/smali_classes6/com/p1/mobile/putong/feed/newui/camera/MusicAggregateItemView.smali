.class public Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Landroid/widget/TextView;


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

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->d(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/aw10;->a(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final c()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic d(Lcom/p1/mobile/putong/feed/data/Moment;Landroid/view/View;)V
    .locals 8

    .line 1
    invoke-static {}, Ll/cmg;->o()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;->pageId()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    const/4 v6, 0x0

    .line 26
    const/4 v7, -0x1

    .line 27
    const/4 v2, 0x0

    .line 28
    const/4 v3, 0x1

    .line 29
    const/4 v5, 0x1

    .line 30
    invoke-static/range {v0 .. v7}, Lcom/p1/mobile/putong/feed/newui/preview/act/PhotoAlbumFeedPreviewAct;->a2(Landroid/content/Context;Ljava/lang/String;IZLjava/lang/String;ZZI)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    new-instance p1, Ll/gg70;

    .line 35
    .line 36
    invoke-direct {p1}, Ll/gg70;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2, p0, p1}, Lcom/p1/mobile/android/app/Act;->startActivityWithCustomTransition(Landroid/content/Intent;Lcom/p1/mobile/android/app/Act$w;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->a(Landroid/content/Context;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    const-string v0, "aggregate_page"

    .line 52
    .line 53
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->f(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    const/4 v0, 0x1

    .line 70
    invoke-virtual {p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->t(Z)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->k(Lcom/p1/mobile/putong/feed/data/Moment;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentValue:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->o(Ljava/lang/String;)Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/momentdetail/MomentDetailAct$a;->b()Landroid/content/Intent;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    if-nez p1, :cond_1

    .line 89
    .line 90
    return-void

    .line 91
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->c()Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateAct;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->b:Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "selected"

    .line 6
    .line 7
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->b:Landroid/widget/TextView;

    .line 15
    .line 16
    const-string v1, "\u7cbe\u9009"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 33
    .line 34
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 39
    .line 40
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Video;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    iget-object v2, v2, Lcom/p1/mobile/putong/data/GifMedia;->url:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 54
    .line 55
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->a:Lv/VDraweeView;

    .line 56
    .line 57
    iget-object v4, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 64
    .line 65
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v2, v3, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->a:Lv/VDraweeView;

    .line 77
    .line 78
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Video;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/data/GifMedia;->url:Ljava/lang/String;

    .line 81
    .line 82
    const/4 v3, 0x1

    .line 83
    invoke-virtual {v1, v2, v0, v3}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_1
    :goto_0
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->a:Lv/VDraweeView;

    .line 90
    .line 91
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 92
    .line 93
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0, v2, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_2
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 110
    .line 111
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->a:Lv/VDraweeView;

    .line 112
    .line 113
    iget-object v3, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 114
    .line 115
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 120
    .line 121
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 122
    .line 123
    .line 124
    move-result-object v1

    .line 125
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 126
    .line 127
    invoke-virtual {v0, v2, v1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :goto_1
    new-instance v0, Ll/zv10;

    .line 131
    .line 132
    invoke-direct {v0, p0, p1}, Ll/zv10;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/camera/MusicAggregateItemView;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
