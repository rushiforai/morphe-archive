.class public Ll/gi70;
.super Ljava/lang/Object;
.source "SourceFile"


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

.method public static a(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Landroid/view/View;)V
    .locals 4

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Landroid/view/ViewGroup;

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/view/TextureView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->a:Landroid/view/TextureView;

    .line 12
    .line 13
    sget v0, Ll/hdc0;->D:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->b:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 22
    .line 23
    check-cast p1, Landroid/view/ViewGroup;

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Lv/VLinear;

    .line 31
    .line 32
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->c:Lv/VLinear;

    .line 33
    .line 34
    const/4 v2, 0x3

    .line 35
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Lv/VProgressBar;

    .line 40
    .line 41
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->d:Lv/VProgressBar;

    .line 42
    .line 43
    const/4 v2, 0x4

    .line 44
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    check-cast v3, Lv/VLinear;

    .line 49
    .line 50
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->e:Lv/VLinear;

    .line 51
    .line 52
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    check-cast v3, Landroid/view/ViewGroup;

    .line 57
    .line 58
    invoke-virtual {v3, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    check-cast v1, Lv/VText;

    .line 63
    .line 64
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->f:Lv/VText;

    .line 65
    .line 66
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Landroid/view/ViewGroup;

    .line 71
    .line 72
    const/4 v3, 0x1

    .line 73
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lv/VProgressBar;

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->g:Lv/VProgressBar;

    .line 80
    .line 81
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Landroid/view/ViewGroup;

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lv/VText;

    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;->h:Lv/VText;

    .line 94
    .line 95
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->g2:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/gi70;->a(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumLivePhotoView;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
