.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;
.super Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;
.source "SourceFile"


# instance fields
.field public n:Landroid/widget/FrameLayout;

.field public o:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

.field public p:Lv/VImage;

.field public q:Lv/VText;

.field public r:Lv/VText;

.field public s:Landroid/widget/RelativeLayout;

.field public t:Lv/VDraweeView;

.field public u:Lv/VText;

.field public v:Lv/VText;

.field public w:Lv/VRelative;

.field public x:Lv/VImage;

.field public y:Lv/VText;

.field public z:Lv/VDraweeView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public D()Lcom/p1/mobile/android/app/Act;
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

.method public L(Z)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->a:Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 9
    .line 10
    if-nez p0, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 15
    .line 16
    return-object p0
.end method

.method public N(Ljava/lang/String;Ljava/lang/String;Z)F
    .locals 3

    .line 1
    const/high16 v0, 0x433c0000    # 188.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->P(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    const/4 v1, 0x0

    .line 12
    const/high16 v2, 0x41000000    # 8.0f

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    move p1, v2

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move p1, v1

    .line 19
    :goto_0
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    add-int/2addr v0, p1

    .line 24
    if-eqz p3, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->P(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    move v1, v2

    .line 33
    :cond_1
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    add-int/2addr v0, p0

    .line 38
    int-to-float p0, v0

    .line 39
    return p0
.end method

.method public getCommentName()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->q:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCommentSticker()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->t:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCommentStickerContent()Landroid/widget/RelativeLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->s:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCommentText()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->r:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLikeCount()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->y:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLikeCountContainer()Lv/VRelative;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->w:Lv/VRelative;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLikeIndicator()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->x:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPic()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->z:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPicFrame()Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->o:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPicVerification()Lv/VImage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->p:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public getReply()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->v:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTime()Lv/VText;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->u:Lv/VText;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->z0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->o:Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/ui/headframe/HeaderFrameWrapper;->get_pic()Lv/VDraweeView;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;->z:Lv/VDraweeView;

    .line 11
    .line 12
    invoke-super {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentExpandDetailsView;->onFinishInflate()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final z0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/i970;->a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumCommentChildDetailsView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
