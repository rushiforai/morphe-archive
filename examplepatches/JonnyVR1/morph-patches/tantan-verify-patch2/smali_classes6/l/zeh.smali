.class public Ll/zeh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/teh;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/fresco/photodraweeview/PhotoDraweeView;

.field public b:Landroid/view/View;

.field public c:Lv/VText;

.field public d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zeh;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/zeh;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zeh;->p(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic b(Ll/zeh;Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/zeh;->l(Ljava/util/ArrayList;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Ll/zeh;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zeh;->n(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic d(Ljava/util/List;)Lrx/c;
    .locals 3

    .line 1
    const-string v0, "unknown_"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UploadSource;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UploadSource;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "unknown"

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-static {p0, v1, v2, v0}, Ll/mrb0;->L(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/UploadSource;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic e(Ll/zeh;Ljava/lang/String;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zeh;->m(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private synthetic l(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zeh;->k(Ljava/util/ArrayList;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-nez p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p2, 0x0

    .line 9
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Ll/zeh;->s(Lcom/p1/mobile/putong/data/Media;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zeh;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/afh;->b(Ll/zeh;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i(Ll/teh;)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/teh;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zeh;->i(Ll/teh;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zeh;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 8
    .line 9
    iget-object v1, p0, Ll/zeh;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ll/fsb0;->i0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/zeh;->c:Lv/VText;

    .line 24
    .line 25
    new-instance v1, Ll/ueh;

    .line 26
    .line 27
    invoke-direct {v1, p0, p1}, Ll/ueh;-><init>(Ll/zeh;Ljava/util/ArrayList;)V

    .line 28
    .line 29
    .line 30
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public final k(Ljava/util/ArrayList;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    if-eqz p1, :cond_3

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/asx;->b()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {}, Ll/asx;->h()Ll/asx;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/asx;->d()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 33
    .line 34
    instance-of v3, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 35
    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    const-string p0, "\u53ea\u80fd\u9009\u62e9\u56fe\u7247"

    .line 39
    .line 40
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    return v2

    .line 44
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 45
    .line 46
    new-instance v3, Landroid/graphics/BitmapFactory$Options;

    .line 47
    .line 48
    invoke-direct {v3}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-boolean p0, v3, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 52
    .line 53
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v4}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    invoke-static {v4, v3}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->nullCheck()V

    .line 63
    .line 64
    .line 65
    iget-object v4, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 66
    .line 67
    iget v5, v3, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    .line 68
    .line 69
    iput v5, v4, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 70
    .line 71
    iget v3, v3, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    .line 72
    .line 73
    iput v3, v4, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 74
    .line 75
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->bigAspectRate()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->isHorizontal()Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-eqz v4, :cond_2

    .line 84
    .line 85
    if-le v3, v0, :cond_2

    .line 86
    .line 87
    const-string p0, "\u56fe\u7247\u5bbd\u5ea6\u8d85\u51fa\u4e0a\u9650"

    .line 88
    .line 89
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    return v2

    .line 93
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->isHorizontal()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-nez p1, :cond_3

    .line 98
    .line 99
    if-le v3, v1, :cond_3

    .line 100
    .line 101
    const-string p0, "\u56fe\u7247\u957f\u5ea6\u8d85\u51fa\u4e0a\u9650"

    .line 102
    .line 103
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return v2

    .line 107
    :cond_3
    :goto_0
    return p0
.end method

.method public final synthetic m(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/zeh;->q(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic n(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zeh;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/content/Intent;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v1, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    const-string p1, "selectedImages"

    .line 17
    .line 18
    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/zeh;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;

    .line 22
    .line 23
    const/4 v1, -0x1

    .line 24
    invoke-virtual {p1, v1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/zeh;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic p(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zeh;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 4
    .line 5
    .line 6
    const-string p0, "\u56fe\u7247\u4e0a\u4f20\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u7f51\u7edc\u8bbe\u7f6e"

    .line 7
    .line 8
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final q(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public s(Lcom/p1/mobile/putong/data/Media;)V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUseError"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/zeh;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;

    .line 2
    .line 3
    const-string v1, "\u56fe\u7247\u4e0a\u4f20\u4e2d..."

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Act;->progress(Ljava/lang/String;Z)Landroid/app/Dialog;

    .line 7
    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 10
    .line 11
    const-string v1, "raw"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    move-object v0, p1

    .line 20
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 23
    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 27
    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    :cond_0
    new-instance v1, Ll/sim;

    .line 31
    .line 32
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v2}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-direct {v1, v2}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 42
    .line 43
    iget-object v3, v1, Ll/sim;->d:[I

    .line 44
    .line 45
    invoke-direct {v2, v3}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 46
    .line 47
    .line 48
    iput-object v2, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 49
    .line 50
    iget-object v0, v1, Ll/sim;->c:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v0, p1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    filled-new-array {p1}, [Lcom/p1/mobile/putong/data/Media;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iget-object v1, p0, Ll/zeh;->d:Lcom/p1/mobile/putong/feed/newui/photoalbum/commend/FeedMemePhotoPreviewAct;

    .line 71
    .line 72
    new-instance v2, Ll/i1y;

    .line 73
    .line 74
    const/4 v3, 0x0

    .line 75
    invoke-direct {v2, p1, v3, v0}, Ll/i1y;-><init>(Ljava/util/List;ZLjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p1, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Lrx/c;->last()Lrx/c;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {p1, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    new-instance v1, Ll/veh;

    .line 103
    .line 104
    invoke-direct {v1, p0, v0}, Ll/veh;-><init>(Ll/zeh;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p1, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    new-instance v0, Ll/weh;

    .line 112
    .line 113
    invoke-direct {v0}, Ll/weh;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {p1, v0}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    new-instance v0, Ll/xeh;

    .line 129
    .line 130
    invoke-direct {v0, p0}, Ll/xeh;-><init>(Ll/zeh;)V

    .line 131
    .line 132
    .line 133
    new-instance v1, Ll/yeh;

    .line 134
    .line 135
    invoke-direct {v1, p0}, Ll/yeh;-><init>(Ll/zeh;)V

    .line 136
    .line 137
    .line 138
    invoke-static {v0, v1}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 143
    .line 144
    .line 145
    :cond_2
    return-void
.end method
