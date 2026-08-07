.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/FeedPostPageMediaItemRenderDecoration;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/decoration/MediaItemRenderDecoration;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public afterItemRender(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;Ll/rn20;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)V
    .locals 0

    .line 1
    instance-of p4, p2, Lcom/p1/mobile/putong/data/Video;

    .line 2
    .line 3
    if-eqz p4, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1, p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->b(Lcom/p1/mobile/putong/data/Media;Ll/rn20;)Z

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/4 p3, 0x0

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    iget-object p2, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->g:Landroid/widget/TextView;

    .line 13
    .line 14
    invoke-virtual {p2, p3}, Landroid/view/View;->setVisibility(I)V

    .line 15
    .line 16
    .line 17
    iget-object p2, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->f:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    const/4 p3, 0x1

    .line 20
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/FeedPostPageMediaItemRenderDecoration;->clickable(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->setChecked(Z)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->f:Landroid/widget/FrameLayout;

    .line 28
    .line 29
    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/putong/feed/newui/mediapicker/FeedPostPageMediaItemRenderDecoration;->clickable(Landroid/view/View;Z)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p1, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;->g:Landroid/widget/TextView;

    .line 33
    .line 34
    const/16 p1, 0x8

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public beforeItemRender(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/item/NewAlbumMediaItemView;Lcom/p1/mobile/putong/data/Media;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/util/MediaWrapper;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public clickable(Landroid/view/View;Z)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p2}, Landroid/view/View;->setLongClickable(Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
