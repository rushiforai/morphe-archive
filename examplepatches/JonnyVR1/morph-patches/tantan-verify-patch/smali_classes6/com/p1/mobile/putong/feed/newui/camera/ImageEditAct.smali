.class public Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;

.field public d:Lcom/p1/mobile/putong/data/MediaMeta;

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Ljava/lang/String;

.field public h:Ll/th0;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic X1(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->o2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->n2(Ljava/io/File;)V

    return-void
.end method

.method public static synthetic a2(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->p2()V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->s2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->q2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic e2(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->m2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic g2(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->r2(Landroid/view/View;)V

    return-void
.end method

.method public static h2(Landroidx/fragment/app/FragmentActivity;Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;Lcom/p1/mobile/putong/data/MediaMeta;Ljava/lang/String;ZLjava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "key_edit_media"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "EXTRA_KEY_CAMERA_META_DATA"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "extra_from"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "extra_show_only_photo"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const-string p0, "extra_selected_folder_path"

    .line 29
    .line 30
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method private i2(Ljava/io/File;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    new-instance v1, Lcom/p1/mobile/putong/data/Picture;

    .line 18
    .line 19
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 31
    .line 32
    const-string p1, "image/*"

    .line 33
    .line 34
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 35
    .line 36
    const-string p1, "raw"

    .line 37
    .line 38
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MediaLocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->d:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 45
    .line 46
    iput-object p1, v1, Lcom/p1/mobile/putong/data/Media;->meta:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 47
    .line 48
    const-string v2, "photo"

    .line 49
    .line 50
    iput-object v2, p1, Lcom/p1/mobile/putong/data/MediaMeta;->type:Ljava/lang/String;

    .line 51
    .line 52
    const-string v2, "shoot"

    .line 53
    .line 54
    iput-object v2, p1, Lcom/p1/mobile/putong/data/MediaMeta;->source:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->e:Ljava/lang/String;

    .line 60
    .line 61
    const-string v1, "my_states"

    .line 62
    .line 63
    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-eqz p1, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedPostStatusAct;->v2(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    const/4 v0, 0x0

    .line 89
    invoke-virtual {p1, v0, v0}, Landroid/app/Activity;->overridePendingTransition(II)V

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->g:Ljava/lang/String;

    .line 94
    .line 95
    iget-boolean v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->f:Z

    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->e:Ljava/lang/String;

    .line 98
    .line 99
    invoke-static {p0, v0, p1, v1, v2}, Ll/cn40;->s0(Lcom/p1/mobile/android/app/Act;Ljava/util/ArrayList;Ljava/lang/String;ZLjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :goto_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method private synthetic m2(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private u2(Ljava/lang/String;Ll/x20;)V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Ll/th0$a;->g(Z)Ll/th0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->s3:I

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Ll/th0$a;->e(I)Ll/th0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    sget v0, Lcom/p1/mobile/putong/feed/R$string;->a:I

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Ll/th0$a;->q(I)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    new-instance v0, Ll/dim;

    .line 32
    .line 33
    invoke-direct {v0, p2}, Ll/dim;-><init>(Ll/x20;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/th0$a;->c(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p2, Ll/eim;

    .line 41
    .line 42
    invoke-direct {p2, p0}, Ll/eim;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p2}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    invoke-virtual {p1}, Ll/th0$a;->a()Ll/th0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->h:Ll/th0;

    .line 54
    .line 55
    invoke-virtual {p1}, Ll/th0;->g()V

    .line 56
    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    sget v0, Ll/tec0;->a:I

    .line 2
    .line 3
    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;

    .line 8
    .line 9
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_0

    .line 14
    .line 15
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;

    .line 16
    .line 17
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;->path:Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    iget-object p2, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;

    .line 26
    .line 27
    iget-object p2, p2, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;->path:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {p2}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    sget v0, Ll/hdc0;->n1:I

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroid/widget/ImageView;

    .line 40
    .line 41
    invoke-virtual {v0, p2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 42
    .line 43
    .line 44
    sget p2, Ll/hdc0;->m1:I

    .line 45
    .line 46
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object p2

    .line 50
    new-instance v0, Ll/aim;

    .line 51
    .line 52
    invoke-direct {v0}, Ll/aim;-><init>()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 56
    .line 57
    .line 58
    sget p2, Ll/hdc0;->l1:I

    .line 59
    .line 60
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    new-instance v0, Ll/bim;

    .line 65
    .line 66
    invoke-direct {v0, p0}, Ll/bim;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 70
    .line 71
    .line 72
    sget p2, Ll/hdc0;->m1:I

    .line 73
    .line 74
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    new-instance v0, Ll/cim;

    .line 79
    .line 80
    invoke-direct {v0, p0}, Ll/cim;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    .line 85
    .line 86
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->l2(Landroid/view/View;)V

    .line 87
    .line 88
    .line 89
    return-object p1
.end method

.method public initDataOnCreate()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->mIfInNewUi1ShouldUseThemNewUI2:Z

    .line 6
    .line 7
    new-instance v0, Ll/zhm;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/zhm;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final k2()Ljava/io/File;
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;->path:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/core/glcore/util/BitmapPrivateProtocolUtil;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    :try_start_0
    const-string v2, "jpg"

    .line 14
    .line 15
    invoke-static {v2}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    new-instance v3, Ljava/io/FileOutputStream;

    .line 20
    .line 21
    invoke-direct {v3, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 22
    .line 23
    .line 24
    :try_start_1
    sget-object v4, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 25
    .line 26
    const/16 v5, 0x64

    .line 27
    .line 28
    invoke-virtual {v0, v4, v5, v3}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    .line 29
    .line 30
    .line 31
    invoke-virtual {v3}, Ljava/io/OutputStream;->flush()V

    .line 32
    .line 33
    .line 34
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 35
    .line 36
    const/16 v5, 0x1d

    .line 37
    .line 38
    if-ge v4, v5, :cond_1

    .line 39
    .line 40
    const-string v4, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 41
    .line 42
    filled-new-array {v4}, [Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-static {v4}, Lcom/p1/mobile/putong/ui/permission/PermissionHelper;->b([Ljava/lang/String;)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catchall_0
    move-exception p0

    .line 54
    move-object v1, v3

    .line 55
    goto :goto_5

    .line 56
    :catch_0
    move-exception p0

    .line 57
    goto :goto_1

    .line 58
    :catch_1
    move-exception p0

    .line 59
    goto :goto_3

    .line 60
    :cond_1
    :goto_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v6

    .line 76
    invoke-static {p0, v4, v5, v6}, Landroid/provider/MediaStore$Images$Media;->insertImage(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 77
    .line 78
    .line 79
    :cond_2
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 80
    .line 81
    .line 82
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_3

    .line 87
    .line 88
    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 89
    .line 90
    .line 91
    return-object v2

    .line 92
    :catch_2
    move-exception p0

    .line 93
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 94
    .line 95
    .line 96
    :cond_3
    return-object v2

    .line 97
    :catchall_1
    move-exception p0

    .line 98
    goto :goto_5

    .line 99
    :catch_3
    move-exception p0

    .line 100
    move-object v3, v1

    .line 101
    goto :goto_1

    .line 102
    :catch_4
    move-exception p0

    .line 103
    move-object v3, v1

    .line 104
    goto :goto_3

    .line 105
    :goto_1
    :try_start_3
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 106
    .line 107
    .line 108
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 109
    .line 110
    .line 111
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    if-eqz p0, :cond_4

    .line 116
    .line 117
    :try_start_4
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_5

    .line 118
    .line 119
    .line 120
    goto :goto_2

    .line 121
    :catch_5
    move-exception p0

    .line 122
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 123
    .line 124
    .line 125
    :cond_4
    :goto_2
    return-object v1

    .line 126
    :goto_3
    :try_start_5
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 130
    .line 131
    .line 132
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz p0, :cond_5

    .line 137
    .line 138
    :try_start_6
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_6

    .line 139
    .line 140
    .line 141
    goto :goto_4

    .line 142
    :catch_6
    move-exception p0

    .line 143
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 144
    .line 145
    .line 146
    :cond_5
    :goto_4
    return-object v1

    .line 147
    :goto_5
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 148
    .line 149
    .line 150
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-eqz v0, :cond_6

    .line 155
    .line 156
    :try_start_7
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_7

    .line 157
    .line 158
    .line 159
    goto :goto_6

    .line 160
    :catch_7
    move-exception v0

    .line 161
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 162
    .line 163
    .line 164
    :cond_6
    :goto_6
    throw p0
.end method

.method public final l2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/l51;->x()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/l51;->w()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    :cond_0
    if-nez p1, :cond_2

    .line 14
    .line 15
    :cond_1
    return-void

    .line 16
    :cond_2
    filled-new-array {p1}, [Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/bnl0;->g0([Landroid/view/View;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic n2(Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->i2(Ljava/io/File;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o2()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->k2()Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->T0:I

    .line 8
    .line 9
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 14
    .line 15
    new-instance v2, Landroid/content/Intent;

    .line 16
    .line 17
    const-string v3, "android.intent.action.MEDIA_SCANNER_SCAN_FILE"

    .line 18
    .line 19
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 27
    .line 28
    .line 29
    new-instance v1, Ll/gim;

    .line 30
    .line 31
    invoke-direct {v1, p0, v0}, Ll/gim;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;Ljava/io/File;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->s2(Landroid/view/View;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final synthetic p2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_camera_preview"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "key_edit_media"

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->c:Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Photo;

    .line 14
    .line 15
    const-string v0, "EXTRA_KEY_CAMERA_META_DATA"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/p1/mobile/putong/data/MediaMeta;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->d:Lcom/p1/mobile/putong/data/MediaMeta;

    .line 24
    .line 25
    const-string v0, "extra_from"

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->e:Ljava/lang/String;

    .line 32
    .line 33
    const-string v0, "extra_show_only_photo"

    .line 34
    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->f:Z

    .line 41
    .line 42
    const-string v0, "extra_selected_folder_path"

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->g:Ljava/lang/String;

    .line 49
    .line 50
    return-void
.end method

.method public final synthetic q2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->h:Ll/th0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/th0;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final r2(Landroid/view/View;)V
    .locals 3

    .line 1
    sget-boolean p1, Ll/xgl0;->d:Z

    .line 2
    .line 3
    const-string v0, "yes"

    .line 4
    .line 5
    const-string v1, "no"

    .line 6
    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    sget-boolean p1, Ll/xgl0;->e:Z

    .line 10
    .line 11
    if-nez p1, :cond_1

    .line 12
    .line 13
    sget-boolean p1, Ll/xgl0;->f:Z

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    move-object p1, v1

    .line 19
    goto :goto_1

    .line 20
    :cond_1
    :goto_0
    move-object p1, v0

    .line 21
    :goto_1
    const-string v2, "beauty_used"

    .line 22
    .line 23
    invoke-static {v2, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget-boolean v2, Ll/xgl0;->c:Z

    .line 28
    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_2
    move-object v0, v1

    .line 33
    :goto_2
    const-string v1, "magic_used"

    .line 34
    .line 35
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    filled-new-array {p1, v0}, [Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v0, "e_camera_preview_done_button"

    .line 44
    .line 45
    const-string v1, "p_camera_preview"

    .line 46
    .line 47
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 48
    .line 49
    .line 50
    new-instance p1, Ll/fim;

    .line 51
    .line 52
    invoke-direct {p1, p0}, Ll/fim;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;)V

    .line 53
    .line 54
    .line 55
    invoke-static {p1}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public final s2(Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance p1, Ll/yhm;

    .line 2
    .line 3
    invoke-direct {p1, p0}, Ll/yhm;-><init>(Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    sget v1, Lcom/p1/mobile/putong/feed/R$string;->y0:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/camera/ImageEditAct;->u2(Ljava/lang/String;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
