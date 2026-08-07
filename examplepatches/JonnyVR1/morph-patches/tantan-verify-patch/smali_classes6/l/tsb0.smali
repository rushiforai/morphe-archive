.class public Ll/tsb0;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;
.source "SourceFile"


# instance fields
.field public E:Ll/d9i;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumFeedBaseFrag;Ll/d9i;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 7

    .line 1
    const/4 v6, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p3

    .line 5
    move-object v3, p4

    .line 6
    move-object v4, p5

    .line 7
    move v5, p6

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;-><init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/basefrag/PhotoAlbumBaseFrag;Lv/VRecyclerView;Ljava/lang/String;Ljava/lang/String;IZ)V

    .line 9
    .line 10
    .line 11
    iput-object p2, v0, Ll/tsb0;->E:Ll/d9i;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/tsb0;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public A0()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->G2:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->r:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 14
    .line 15
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->d4:I

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_0
    iget-object v1, p0, Ll/tsb0;->E:Ll/d9i;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/d9i;->n0()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->j2:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_1
    return-object v0
.end method

.method public O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;

    .line 7
    .line 8
    iget-object v1, p0, Ll/tsb0;->E:Ll/d9i;

    .line 9
    .line 10
    iget-object v1, v1, Ll/d9i;->f:Lcom/p1/mobile/putong/feed/data/TopicMoment;

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/topic/qatopic/QATopicPhotoAlbumTopView;->setTopicMoment(Lcom/p1/mobile/putong/feed/data/TopicMoment;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V

    .line 16
    .line 17
    .line 18
    if-eqz p2, :cond_1

    .line 19
    .line 20
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public o0(Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->l:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-static {p1, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    invoke-static {p1, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/tsb0;->A0()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->b:Landroid/widget/TextView;

    .line 29
    .line 30
    const-string v0, "#d0d0d0"

    .line 31
    .line 32
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 40
    .line 41
    const/high16 v0, 0x41a80000    # 21.0f

    .line 42
    .line 43
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 48
    .line 49
    .line 50
    const/4 p0, -0x1

    .line 51
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 52
    .line 53
    .line 54
    return-void
.end method
