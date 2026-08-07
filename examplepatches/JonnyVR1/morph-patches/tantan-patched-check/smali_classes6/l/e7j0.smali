.class public Ll/e7j0;
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
    iput-object p2, v0, Ll/e7j0;->E:Ll/d9i;

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
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/e7j0;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V

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
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->K0:I

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
    iget-object v1, p0, Ll/e7j0;->E:Ll/d9i;

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    iget-object v1, p0, Ll/e7j0;->E:Ll/d9i;

    .line 27
    .line 28
    invoke-virtual {v1}, Ll/d9i;->n0()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->e:Lcom/p1/mobile/android/app/Act;

    .line 35
    .line 36
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->j2:I

    .line 37
    .line 38
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0

    .line 43
    :cond_1
    return-object v0
.end method

.method public O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/a;->O(Landroid/view/View;Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;II)V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    iget-object p0, p2, Lcom/p1/mobile/putong/feed/newui/photoalbum/adapter/MomentItem;->d:Lcom/p1/mobile/putong/feed/data/Moment;

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    :cond_0
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
    invoke-virtual {p0}, Ll/e7j0;->A0()Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/newui/photoalbum/CommonEmptyView;->a:Landroid/widget/ImageView;

    .line 29
    .line 30
    const/high16 v0, 0x41a80000    # 21.0f

    .line 31
    .line 32
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    invoke-static {p0, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 37
    .line 38
    .line 39
    const/4 p0, -0x1

    .line 40
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 41
    .line 42
    .line 43
    return-void
.end method
