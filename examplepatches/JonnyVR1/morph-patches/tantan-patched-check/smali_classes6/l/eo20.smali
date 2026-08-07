.class public Ll/eo20;
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

.method public static a(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/view/View;)V
    .locals 5

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lv/VProgressBar;

    .line 18
    .line 19
    iput-object v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->d:Lv/VProgressBar;

    .line 20
    .line 21
    const/4 v2, 0x2

    .line 22
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    check-cast v3, Landroid/widget/ImageView;

    .line 27
    .line 28
    iput-object v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->e:Landroid/widget/ImageView;

    .line 29
    .line 30
    const/4 v3, 0x3

    .line 31
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    check-cast v3, Lv/VLinear;

    .line 36
    .line 37
    iput-object v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->f:Lv/VLinear;

    .line 38
    .line 39
    const/4 v3, 0x4

    .line 40
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Landroid/widget/ImageView;

    .line 51
    .line 52
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->g:Landroid/widget/ImageView;

    .line 53
    .line 54
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Landroid/view/ViewGroup;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lv/VText;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->h:Lv/VText;

    .line 67
    .line 68
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    check-cast p1, Landroid/view/ViewGroup;

    .line 73
    .line 74
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    check-cast p1, Landroid/widget/ImageView;

    .line 79
    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->i:Landroid/widget/ImageView;

    .line 81
    .line 82
    return-void
.end method

.method public static b(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/jec0;->F:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p0, p1}, Ll/eo20;->a(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method
