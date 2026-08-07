.class public Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# static fields
.field public static s:I = 0x438

.field public static t:I = 0x438

.field public static u:I


# instance fields
.field public c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

.field public d:Lv/VProgressBar;

.field public e:Landroid/widget/ImageView;

.field public f:Lv/VLinear;

.field public g:Landroid/widget/ImageView;

.field public h:Lv/VText;

.field public i:Landroid/widget/ImageView;

.field public j:Ljava/lang/String;

.field public k:I

.field public l:I

.field public m:F

.field public n:I

.field public o:Z

.field public p:Z

.field public q:Ll/kcg0;

.field public r:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x42600000    # 56.0f

    .line 6
    .line 7
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    sub-int/2addr v0, v1

    .line 12
    sput v0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->u:I

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->k:I

    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->l:I

    .line 8
    .line 9
    return-void
.end method

.method private synthetic B2()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    sget p0, Lcom/p1/mobile/putong/common/R$string;->E:I

    .line 5
    .line 6
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->s2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->B2()V

    return-void
.end method

.method public static synthetic Z1(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->A2(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic a2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->v2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->C2()V

    return-void
.end method

.method public static synthetic c2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;ZLandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->w2(ZLandroid/view/View;)V

    return-void
.end method

.method public static synthetic d2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->z2(Landroid/net/Uri;)V

    return-void
.end method

.method public static synthetic e2(Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-object v0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Ljava/lang/Integer;

    .line 15
    .line 16
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    const/4 v0, 0x4

    .line 21
    if-ne p0, v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public static synthetic g2(Landroid/graphics/Bitmap;)Ljava/lang/Integer;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/sim;->a(Landroid/graphics/Bitmap;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic h2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->u2(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic i2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->r2(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic k2(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/net/Uri;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->y2(Landroid/net/Uri;Landroid/util/Pair;)V

    return-void
.end method

.method public static m2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;FI)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "IMAGE_URI"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "CROP_PROPORTION"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "OVERLAY_WIDTH"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static n2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;FIZ)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "IMAGE_URI"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "CROP_PROPORTION"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;F)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "OVERLAY_WIDTH"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "CROPP_INGNEWS_TYLE"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    return-object v0
.end method

.method private o2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->q2()Ll/ewb;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->n(Ll/ewb;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private p2()V
    .locals 1

    .line 1
    invoke-static {}, Ll/l51;->x()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/l51;->w()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->r:Landroid/view/View;

    .line 15
    .line 16
    filled-new-array {p0}, [Landroid/view/View;

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

.method private q2()Ll/ewb;
    .locals 1

    .line 1
    new-instance p0, Ll/ewb$a;

    .line 2
    .line 3
    invoke-static {}, Ll/kl40;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const-string v0, "webp"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "jpg"

    .line 13
    .line 14
    :goto_0
    invoke-static {v0}, Ll/ecj;->O(Ljava/lang/String;)Ljava/io/File;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-direct {p0, v0}, Ll/ewb$a;-><init>(Landroid/net/Uri;)V

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/kl40;->c()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->WEBP:Landroid/graphics/Bitmap$CompressFormat;

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_1
    sget-object v0, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 35
    .line 36
    :goto_1
    invoke-virtual {p0, v0}, Ll/ewb$a;->b(Landroid/graphics/Bitmap$CompressFormat;)Ll/ewb$a;

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/kl40;->c()Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    new-instance v0, Ll/un20;

    .line 46
    .line 47
    invoke-direct {v0}, Ll/un20;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ll/ewb$a;->e(Ll/qcj;)Ll/ewb$a;

    .line 51
    .line 52
    .line 53
    :cond_2
    const/16 v0, 0x438

    .line 54
    .line 55
    invoke-virtual {p0, v0, v0}, Ll/ewb$a;->d(II)Ll/ewb$a;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/16 v0, 0x64

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Ll/ewb$a;->c(I)Ll/ewb$a;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p0}, Ll/ewb$a;->a()Ll/ewb;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0
.end method

.method private synthetic r2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->q:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {p1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->r()Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    sget p1, Lcom/p1/mobile/putong/common/R$string;->W:I

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->progress(I)Landroid/app/Dialog;

    .line 17
    .line 18
    .line 19
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->o2()V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method private synthetic v2(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->y()V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final synthetic A2(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    instance-of p0, p1, Lcom/p1/mobile/android/ui/cropiwa/TooLargeException;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget p0, Lcom/p1/mobile/putong/common/R$string;->Q:I

    .line 9
    .line 10
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final synthetic C2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->h:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isEnabled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->h:Lv/VText;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget v2, Ll/b9c0;->p:I

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->h:Lv/VText;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final D2(Landroid/net/Uri;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/content/Intent;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v1, "path"

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const/4 p1, -0x1

    .line 19
    invoke-virtual {p0, p1, v0}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->l2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->r:Landroid/view/View;

    .line 6
    .line 7
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
    new-instance v0, Ll/sn20;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/sn20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public l2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/eo20;->b(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "p_camera_album_cut_picture"

    .line 2
    .line 3
    return-object p0
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 4

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
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "IMAGE_URI"

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->j:Ljava/lang/String;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "CROP_PROPORTION"

    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->m:F

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "OVERLAY_WIDTH"

    .line 38
    .line 39
    sget v3, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->u:I

    .line 40
    .line 41
    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n:I

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    const-string v1, "CROPP_INGNEWS_TYLE"

    .line 52
    .line 53
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->p:Z

    .line 58
    .line 59
    iget p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n:I

    .line 60
    .line 61
    if-gtz p1, :cond_0

    .line 62
    .line 63
    sget p1, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->u:I

    .line 64
    .line 65
    iput p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n:I

    .line 66
    .line 67
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->m:F

    .line 68
    .line 69
    cmpl-float v0, p1, v2

    .line 70
    .line 71
    if-lez v0, :cond_1

    .line 72
    .line 73
    const/high16 v0, 0x41200000    # 10.0f

    .line 74
    .line 75
    mul-float/2addr p1, v0

    .line 76
    float-to-int p1, p1

    .line 77
    iput p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->k:I

    .line 78
    .line 79
    const/16 p1, 0xa

    .line 80
    .line 81
    iput p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->l:I

    .line 82
    .line 83
    const/4 p1, 0x1

    .line 84
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->o:Z

    .line 85
    .line 86
    :cond_1
    return-void
.end method

.method public final synthetic s2(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->x()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic u2(Landroid/os/Bundle;)V
    .locals 4

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->e:Landroid/widget/ImageView;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->f:Lv/VLinear;

    .line 8
    .line 9
    const/16 v1, 0x8

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->p2()V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->i:Landroid/widget/ImageView;

    .line 18
    .line 19
    new-instance v1, Ll/vn20;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/vn20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->g:Landroid/widget/ImageView;

    .line 28
    .line 29
    new-instance v1, Ll/wn20;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/wn20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->h:Lv/VText;

    .line 38
    .line 39
    new-instance v1, Ll/xn20;

    .line 40
    .line 41
    invoke-direct {v1, p0, v0}, Ll/xn20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->h:Lv/VText;

    .line 48
    .line 49
    invoke-static {p1, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 50
    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->m()Ll/bwb;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const/4 v1, 0x1

    .line 59
    invoke-virtual {p1, v1}, Ll/bwb;->O(Z)Ll/bwb;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    new-instance v1, Ll/q11;

    .line 64
    .line 65
    iget v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->k:I

    .line 66
    .line 67
    iget v3, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->l:I

    .line 68
    .line 69
    invoke-direct {v1, v2, v3}, Ll/q11;-><init>(II)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v1}, Ll/bwb;->x(Ll/q11;)Ll/bwb;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1, v0}, Ll/bwb;->E(Z)Ll/bwb;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iget v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n:I

    .line 81
    .line 82
    invoke-virtual {p1, v1}, Ll/bwb;->P(I)Ll/bwb;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    const/high16 v1, 0x40000000    # 2.0f

    .line 87
    .line 88
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    invoke-virtual {p1, v1}, Ll/bwb;->G(I)Ll/bwb;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p1, v0}, Ll/bwb;->D(Z)Ll/bwb;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-boolean v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->o:Z

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/bwb;->K(Z)Ll/bwb;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p1}, Ll/bwb;->b()V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->l()Ll/wvb;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    sget v0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->s:I

    .line 116
    .line 117
    sget v1, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->t:I

    .line 118
    .line 119
    invoke-virtual {p1, v0, v1}, Ll/wvb;->p(II)Ll/wvb;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const v0, 0x3ca3d70a    # 0.02f

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v0}, Ll/wvb;->v(F)Ll/wvb;

    .line 127
    .line 128
    .line 129
    move-result-object p1

    .line 130
    const v0, 0x3e4ccccd    # 0.2f

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ll/wvb;->u(F)Ll/wvb;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    sget-object v0, Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;->CENTER_INSIDE:Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ll/wvb;->q(Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;)Ll/wvb;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    const/high16 v0, 0x40c00000    # 6.0f

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Ll/wvb;->t(F)Ll/wvb;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-virtual {p1}, Ll/wvb;->b()V

    .line 150
    .line 151
    .line 152
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 153
    .line 154
    new-instance v0, Ljava/io/File;

    .line 155
    .line 156
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->j:Ljava/lang/String;

    .line 157
    .line 158
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setImageUri(Landroid/net/Uri;)V

    .line 166
    .line 167
    .line 168
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 169
    .line 170
    new-instance v0, Ll/yn20;

    .line 171
    .line 172
    invoke-direct {v0, p0}, Ll/yn20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setCropSaveCompleteListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$c;)V

    .line 176
    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 179
    .line 180
    new-instance v0, Ll/zn20;

    .line 181
    .line 182
    invoke-direct {v0, p0}, Ll/zn20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setErrorListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$d;)V

    .line 186
    .line 187
    .line 188
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 189
    .line 190
    new-instance v0, Ll/ao20;

    .line 191
    .line 192
    invoke-direct {v0, p0}, Ll/ao20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setInvalidCroppingListener(Lcom/p1/mobile/android/ui/cropiwa/CropIwaView$e;)V

    .line 196
    .line 197
    .line 198
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 199
    .line 200
    new-instance v0, Ll/bo20;

    .line 201
    .line 202
    invoke-direct {v0, p0}, Ll/bo20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setTouchAction(Ll/x20;)V

    .line 206
    .line 207
    .line 208
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->e:Landroid/widget/ImageView;

    .line 209
    .line 210
    new-instance v0, Ll/co20;

    .line 211
    .line 212
    invoke-direct {v0, p0}, Ll/co20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 216
    .line 217
    .line 218
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 219
    .line 220
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct$a;

    .line 221
    .line 222
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct$a;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->setImageLoadListener(Ll/tvb$a;)V

    .line 226
    .line 227
    .line 228
    return-void
.end method

.method public final synthetic w2(ZLandroid/view/View;)V
    .locals 3

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->w()V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 7
    .line 8
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->v()V

    .line 9
    .line 10
    .line 11
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 12
    .line 13
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->m()Ll/bwb;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-virtual {p2, v0}, Ll/bwb;->O(Z)Ll/bwb;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    new-instance v0, Ll/q11;

    .line 23
    .line 24
    iget v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->k:I

    .line 25
    .line 26
    iget v2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->l:I

    .line 27
    .line 28
    invoke-direct {v0, v1, v2}, Ll/q11;-><init>(II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ll/bwb;->x(Ll/q11;)Ll/bwb;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    const/4 v0, 0x0

    .line 36
    invoke-virtual {p2, v0}, Ll/bwb;->E(Z)Ll/bwb;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iget v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->n:I

    .line 41
    .line 42
    invoke-virtual {p2, v1}, Ll/bwb;->P(I)Ll/bwb;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    const/high16 v1, 0x40000000    # 2.0f

    .line 47
    .line 48
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-virtual {p2, v1}, Ll/bwb;->G(I)Ll/bwb;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-virtual {p2, p1}, Ll/bwb;->D(Z)Ll/bwb;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    iget-boolean v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->o:Z

    .line 61
    .line 62
    invoke-virtual {p2, v1}, Ll/bwb;->K(Z)Ll/bwb;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    invoke-virtual {p2}, Ll/bwb;->b()V

    .line 67
    .line 68
    .line 69
    iget-object p2, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->c:Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;

    .line 70
    .line 71
    invoke-virtual {p2}, Lcom/p1/mobile/android/ui/cropiwa/CropIwaView;->l()Ll/wvb;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    sget v1, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->s:I

    .line 76
    .line 77
    sget v2, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->t:I

    .line 78
    .line 79
    invoke-virtual {p2, v1, v2}, Ll/wvb;->p(II)Ll/wvb;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    const v1, 0x3ca3d70a    # 0.02f

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2, v1}, Ll/wvb;->v(F)Ll/wvb;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    const v1, 0x3e4ccccd    # 0.2f

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2, v1}, Ll/wvb;->u(F)Ll/wvb;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    sget-object v1, Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;->CENTER_INSIDE:Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;

    .line 98
    .line 99
    invoke-virtual {p2, v1}, Ll/wvb;->q(Lcom/p1/mobile/android/ui/cropiwa/config/InitialPosition;)Ll/wvb;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    if-eqz p1, :cond_0

    .line 104
    .line 105
    const p1, 0x3fcccccd    # 1.6f

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_0
    const/high16 p1, 0x40c00000    # 6.0f

    .line 110
    .line 111
    :goto_0
    invoke-virtual {p2, p1}, Ll/wvb;->t(F)Ll/wvb;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Ll/wvb;->b()V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->h:Lv/VText;

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->getResources()Landroid/content/res/Resources;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    sget v1, Ll/b9c0;->l:I

    .line 125
    .line 126
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 127
    .line 128
    .line 129
    move-result p2

    .line 130
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 131
    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->h:Lv/VText;

    .line 134
    .line 135
    invoke-static {p0, v0}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public final synthetic y2(Landroid/net/Uri;Landroid/util/Pair;)V
    .locals 2

    .line 1
    iget-object v0, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/lang/Integer;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x3

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->D2(Landroid/net/Uri;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p1, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Ljava/lang/Integer;

    .line 19
    .line 20
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    const/4 p2, 0x4

    .line 25
    if-ne p1, p2, :cond_1

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 28
    .line 29
    .line 30
    const-string p0, ""

    .line 31
    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-static {p0, p1}, Ll/pwb;->c(Ljava/lang/String;I)V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final synthetic z2(Landroid/net/Uri;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->q:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/pwb;->b()Landroid/util/Pair;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/pwb;->b()Landroid/util/Pair;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast v0, Ljava/lang/Integer;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x1

    .line 29
    if-ne v0, v1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-static {v0, v2}, Ll/pwb;->c(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/android/app/Act;->act:Lcom/p1/mobile/android/app/Act;

    .line 40
    .line 41
    invoke-static {}, Ll/pwb;->a()Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    new-instance v3, Ll/do20;

    .line 46
    .line 47
    invoke-direct {v3}, Ll/do20;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v3}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v2, v1}, Lrx/c;->take(I)Lrx/c;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    new-instance v1, Ll/tn20;

    .line 63
    .line 64
    invoke-direct {v1, p0, p1}, Ll/tn20;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;Landroid/net/Uri;)V

    .line 65
    .line 66
    .line 67
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {v0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->q:Ll/kcg0;

    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/cropper/NewAlbumCropperAct;->D2(Landroid/net/Uri;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method
