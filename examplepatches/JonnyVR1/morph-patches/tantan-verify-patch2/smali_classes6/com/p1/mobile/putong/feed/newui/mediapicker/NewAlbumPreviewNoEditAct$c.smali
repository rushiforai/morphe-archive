.class public Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;
.super Ll/lb2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field public final synthetic e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/lb2;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->Z1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getItemPosition(Ljava/lang/Object;)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->Z1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public o(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    instance-of p2, p0, Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    move-object p2, p0

    .line 10
    check-cast p2, Lcom/p1/mobile/putong/feed/ui/PictureView;

    .line 11
    .line 12
    const/4 p3, 0x1

    .line 13
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/feed/ui/PictureView;->r(Z)V

    .line 14
    .line 15
    .line 16
    :cond_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-virtual {p0, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public p(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;->Z1(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;)Ljava/util/ArrayList;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    check-cast p2, Lcom/p1/mobile/putong/data/Media;

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;->q(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 14
    .line 15
    .line 16
    return-object p2
.end method

.method public final q(Landroid/view/ViewGroup;Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;
    .locals 4

    .line 1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    .line 8
    .line 9
    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 14
    .line 15
    invoke-static {v0, v1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    iget v0, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 19
    .line 20
    iget v1, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 21
    .line 22
    filled-new-array {v0, v1}, [I

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;

    .line 27
    .line 28
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;->e:Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 31
    .line 32
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;-><init>(Landroid/content/Context;)V

    .line 33
    .line 34
    .line 35
    move-object v2, p2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 37
    .line 38
    new-instance v3, Lcom/p1/mobile/putong/data/Dimension;

    .line 39
    .line 40
    invoke-direct {v3, v0}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 41
    .line 42
    .line 43
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 44
    .line 45
    const/4 v0, 0x0

    .line 46
    invoke-virtual {v1, v2, v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->V(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 47
    .line 48
    .line 49
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c$a;

    .line 50
    .line 51
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c$a;-><init>(Lcom/p1/mobile/putong/feed/newui/mediapicker/NewAlbumPreviewNoEditAct$c;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView;->setOnTapListener(Lcom/p1/mobile/putong/feed/newui/preview/pageritem/PhotoAlbumPhotoPreviewView$c;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    return-object v1
.end method
