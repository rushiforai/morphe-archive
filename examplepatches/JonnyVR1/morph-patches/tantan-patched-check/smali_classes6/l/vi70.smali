.class public Ll/vi70;
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

.method public static a(Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;Landroid/view/View;)V
    .locals 1

    .line 1
    sget v0, Ll/hdc0;->m0:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lv/VDraweeView;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->a:Lv/VDraweeView;

    .line 10
    .line 11
    sget v0, Ll/hdc0;->n:I

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lv/VFrame_ColorFilter;

    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->b:Lv/VFrame_ColorFilter;

    .line 20
    .line 21
    sget v0, Ll/hdc0;->q1:I

    .line 22
    .line 23
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Landroid/widget/ImageView;

    .line 28
    .line 29
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->c:Landroid/widget/ImageView;

    .line 30
    .line 31
    sget v0, Ll/hdc0;->H0:I

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lv/VProgressBar;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->d:Lv/VProgressBar;

    .line 40
    .line 41
    sget v0, Ll/hdc0;->i1:I

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Landroid/widget/ImageView;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/PhotoAlbumPictureView;->e:Landroid/widget/ImageView;

    .line 50
    .line 51
    return-void
.end method
