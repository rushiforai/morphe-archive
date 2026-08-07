.class public Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# static fields
.field public static final l:F


# instance fields
.field public a:Lv/VDraweeView;

.field public b:Lv/VDraweeView;

.field public c:Lv/VImage;

.field public d:Lv/VDraweeView;

.field public e:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

.field public f:Lv/VText;

.field public g:Lv/VDraweeView;

.field public h:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

.field public i:Landroid/graphics/Bitmap;

.field public j:Lcom/p1/mobile/putong/ui/download/DownloadTask;

.field public k:Landroid/animation/AnimatorSet;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->h:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    sput v0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->l:F

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->k(Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/io/File;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/io/File;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->l(Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->n()V

    return-void
.end method

.method public static h(ILjava/util/List;I)Landroid/graphics/drawable/GradientDrawable;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;I)",
            "Landroid/graphics/drawable/GradientDrawable;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 11
    .line 12
    .line 13
    sget v1, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->l:F

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 16
    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    new-array v1, v1, [I

    .line 23
    .line 24
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-ge p0, v2, :cond_0

    .line 29
    .line 30
    invoke-interface {p1, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ljava/lang/String;

    .line 35
    .line 36
    sget v3, Ll/n9c0;->o:I

    .line 37
    .line 38
    invoke-static {v3}, Ll/n3d0;->a(I)I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v2, v3}, Ll/n3d0;->h(Ljava/lang/String;I)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    aput v2, v1, p0

    .line 47
    .line 48
    add-int/lit8 p0, p0, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    const/4 p0, 0x1

    .line 52
    if-ne p2, p0, :cond_1

    .line 53
    .line 54
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    const/4 p0, 0x2

    .line 58
    if-ne p2, p0, :cond_2

    .line 59
    .line 60
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    const/4 p0, 0x3

    .line 64
    if-ne p2, p0, :cond_3

    .line 65
    .line 66
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_3
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 70
    .line 71
    :goto_1
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 75
    .line 76
    .line 77
    return-object v0
.end method

.method public static i(I)Landroid/graphics/drawable/GradientDrawable;
    .locals 2
    .param p0    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 8
    .line 9
    .line 10
    sget v1, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->l:F

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method


# virtual methods
.method public final e(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r90;->a(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public f()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->k:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/it0;->C(Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->i:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->j:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/ps40;->e(Landroid/graphics/Bitmap;Lcom/p1/mobile/putong/ui/download/DownloadTask;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final g(J)Landroid/graphics/drawable/Drawable;
    .locals 2

    .line 1
    const-wide/16 v0, 0xa

    .line 2
    .line 3
    cmp-long p0, p1, v0

    .line 4
    .line 5
    if-gez p0, :cond_0

    .line 6
    .line 7
    sget p0, Ll/n9c0;->J0:I

    .line 8
    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->i(I)Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const-wide/16 v0, 0x14

    .line 15
    .line 16
    cmp-long p0, p1, v0

    .line 17
    .line 18
    if-gez p0, :cond_1

    .line 19
    .line 20
    sget p0, Ll/n9c0;->F0:I

    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->i(I)Landroid/graphics/drawable/GradientDrawable;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const-wide/16 v0, 0x1e

    .line 28
    .line 29
    cmp-long p0, p1, v0

    .line 30
    .line 31
    if-gez p0, :cond_2

    .line 32
    .line 33
    sget p0, Ll/n9c0;->z0:I

    .line 34
    .line 35
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->i(I)Landroid/graphics/drawable/GradientDrawable;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0

    .line 40
    :cond_2
    sget p0, Ll/n9c0;->J0:I

    .line 41
    .line 42
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->i(I)Landroid/graphics/drawable/GradientDrawable;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public getUid()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->h:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public j()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final synthetic k(Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-static {v0, p1}, Ll/ps40;->h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->i:Landroid/graphics/Bitmap;

    .line 8
    .line 9
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->w(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l(Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/ps40;->h(Landroid/view/View;Ljava/io/File;)Landroid/graphics/Bitmap;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->i:Landroid/graphics/Bitmap;

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->w(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/io/File;)V
    .locals 1

    .line 1
    new-instance v0, Ll/q90;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/q90;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic n()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    sget v0, Ll/obc0;->F0:I

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public o()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->g:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageResource(I)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->g:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->e(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->g:Lv/VDraweeView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    const-string v1, "context_livingAct"

    .line 7
    .line 8
    invoke-static {v1, p0, p1, v0}, Ll/izs;->l(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;I)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 4

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->d:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    const-string v0, "context_livingAct"

    .line 13
    .line 14
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {v0, v1, v3}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 20
    .line 21
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x1

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-le v0, v1, :cond_0

    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->c:Lv/VImage;

    .line 37
    .line 38
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->c:Lv/VImage;

    .line 42
    .line 43
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 44
    .line 45
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 46
    .line 47
    invoke-static {v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->h(ILjava/util/List;I)Landroid/graphics/drawable/GradientDrawable;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {v0, p1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->c:Lv/VImage;

    .line 56
    .line 57
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 58
    .line 59
    .line 60
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->d:Lv/VDraweeView;

    .line 61
    .line 62
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_1
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->c:Lv/VImage;

    .line 70
    .line 71
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public final r(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->u(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 14
    .line 15
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x1

    .line 28
    if-le v0, v1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 31
    .line 32
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 33
    .line 34
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-static {v1, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->h(ILjava/util/List;I)Landroid/graphics/drawable/GradientDrawable;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 46
    .line 47
    sget p1, Ll/obc0;->F0:I

    .line 48
    .line 49
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setController(Ll/lde;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->f:Lv/VText;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1, v1, v1, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->b:Lv/VDraweeView;

    .line 29
    .line 30
    sget v2, Ll/i0k;->a:I

    .line 31
    .line 32
    invoke-static {v0, v1, v2}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->b:Lv/VDraweeView;

    .line 36
    .line 37
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    xor-int/lit8 v1, v1, 0x1

    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->e:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 49
    .line 50
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 51
    .line 52
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 59
    .line 60
    invoke-static {v0, v1, v2, v3}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->f:Lv/VText;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object v1

    .line 69
    invoke-virtual {p1, v1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->getContentText(Landroid/content/Context;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->f:Lv/VText;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 79
    .line 80
    invoke-static {p1}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public setAnim(Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->k:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method public t(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->h:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->checkDefaultColor()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->s(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->r(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->q(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->g:Lv/VDraweeView;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->p(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->g:Lv/VDraweeView;

    .line 34
    .line 35
    const/4 p1, 0x1

    .line 36
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final u(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1}, Ll/ps40;->d(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    new-instance v1, Ll/n90;

    .line 18
    .line 19
    invoke-direct {v1, p0, v0, p1}, Ll/n90;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Ljava/io/File;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 20
    .line 21
    .line 22
    invoke-static {v1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 27
    .line 28
    sget v2, Ll/obc0;->F0:I

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 34
    .line 35
    new-instance v2, Ll/o90;

    .line 36
    .line 37
    invoke-direct {v2, p0, p1}, Ll/o90;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V

    .line 38
    .line 39
    .line 40
    new-instance p1, Ll/p90;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Ll/p90;-><init>(Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v0, v2, p1}, Ll/ps40;->f(Ljava/lang/String;Ljava/io/File;Ll/y20;Ll/x20;)Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->j:Lcom/p1/mobile/putong/ui/download/DownloadTask;

    .line 50
    .line 51
    return-void
.end method

.method public v(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 4

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->h:Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 4
    .line 5
    const-wide/16 v2, 0x2a

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    sget v0, Ll/i0k;->b:I

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    sget v0, Ll/i0k;->a:I

    .line 15
    .line 16
    :goto_0
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->b:Lv/VDraweeView;

    .line 19
    .line 20
    invoke-static {v1, v2, v0}, Ll/i0k;->c(Ljava/lang/String;Lv/VDraweeView;I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->e:Lcom/p1/mobile/putong/live/livingroom/royal/LiveGradientTextView;

    .line 24
    .line 25
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 26
    .line 27
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v2}, Ll/n3d0;->g(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v0, v1, v2, v3}, Ll/und0;->b(Landroid/widget/TextView;Ljava/lang/CharSequence;ILjava/util/List;)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->f:Lv/VText;

    .line 39
    .line 40
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->i2:I

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->f:Lv/VText;

    .line 46
    .line 47
    const/4 v1, -0x1

    .line 48
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->d:Lv/VDraweeView;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->c:Lv/VImage;

    .line 58
    .line 59
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 63
    .line 64
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 65
    .line 66
    invoke-virtual {p0, v2, v3}, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->g(J)Landroid/graphics/drawable/Drawable;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->g:Lv/VDraweeView;

    .line 74
    .line 75
    invoke-static {p0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final w(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->a:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v0, v0, Landroid/graphics/drawable/NinePatchDrawable;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 12
    .line 13
    long-to-float p1, v0

    .line 14
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/AdmissionMessageView;->f:Lv/VText;

    .line 24
    .line 25
    invoke-virtual {p0, v0, v0, p1, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
