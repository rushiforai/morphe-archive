.class public Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;
.super Lv/VFrame;
.source "SourceFile"

# interfaces
.implements Lv/a$b;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$c;,
        Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$d;
    }
.end annotation


# static fields
.field public static d:I

.field public static e:I


# instance fields
.field public a:Lv/fresco/photodraweeview/PhotoDraweeView;

.field public b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

.field public c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$d;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->init()V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->getImageContainerWidth()I

    move-result p0

    return p0
.end method

.method private synthetic E(Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic F(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->M()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private synthetic G(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic K(Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->M()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static L(Lv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;Ll/qim;Landroid/graphics/drawable/Animatable;Lcom/p1/mobile/putong/data/Picture$ImageUri;II)V
    .locals 0

    .line 1
    invoke-interface {p3}, Ll/qim;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-interface {p3}, Ll/qim;->getHeight()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    invoke-virtual {p0, p2, p3}, Lv/fresco/photodraweeview/PhotoDraweeView;->w(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    cmpl-float p2, p2, p3

    .line 21
    .line 22
    if-lez p2, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 29
    .line 30
    .line 31
    move-result p3

    .line 32
    div-float/2addr p2, p3

    .line 33
    int-to-float p3, p7

    .line 34
    int-to-float p4, p6

    .line 35
    div-float p7, p3, p4

    .line 36
    .line 37
    cmpl-float p2, p2, p7

    .line 38
    .line 39
    if-lez p2, :cond_3

    .line 40
    .line 41
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalWidth()F

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    mul-float/2addr p2, p3

    .line 46
    invoke-virtual {p0}, Lv/VDraweeView;->getOriginalHeight()F

    .line 47
    .line 48
    .line 49
    move-result p3

    .line 50
    div-float/2addr p2, p3

    .line 51
    div-float/2addr p4, p2

    .line 52
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    cmpl-float p2, p4, p2

    .line 57
    .line 58
    if-lez p2, :cond_0

    .line 59
    .line 60
    invoke-virtual {p0, p4}, Lv/fresco/photodraweeview/PhotoDraweeView;->setMaximumScale(F)V

    .line 61
    .line 62
    .line 63
    :cond_0
    const p2, 0x3f8ccccd    # 1.1f

    .line 64
    .line 65
    .line 66
    cmpl-float p2, p4, p2

    .line 67
    .line 68
    if-lez p2, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0, p4}, Lv/fresco/photodraweeview/PhotoDraweeView;->setDoubleTapScale(F)V

    .line 71
    .line 72
    .line 73
    :cond_1
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    cmpl-float p2, p4, p2

    .line 78
    .line 79
    if-lez p2, :cond_2

    .line 80
    .line 81
    invoke-virtual {p0}, Lv/fresco/photodraweeview/PhotoDraweeView;->getMaximumScale()F

    .line 82
    .line 83
    .line 84
    move-result p4

    .line 85
    :cond_2
    const/4 p2, 0x1

    .line 86
    const/4 p3, 0x0

    .line 87
    invoke-virtual {p0, p4, p3, p3, p2}, Lv/fresco/photodraweeview/PhotoDraweeView;->v(FFFZ)V

    .line 88
    .line 89
    .line 90
    :cond_3
    sget-object p2, Ll/uqb0;->s:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {p0}, Ll/fsb0;->d0(Lv/fresco/photodraweeview/PhotoDraweeView;)Z

    .line 93
    .line 94
    .line 95
    move-result p2

    .line 96
    if-eqz p2, :cond_4

    .line 97
    .line 98
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 99
    .line 100
    invoke-virtual {p2, p5}, Ll/fsb0;->Z(Lcom/p1/mobile/putong/data/Picture$ImageUri;)Ljava/io/File;

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result p3

    .line 108
    if-eqz p3, :cond_4

    .line 109
    .line 110
    new-instance p3, Ll/qj70;

    .line 111
    .line 112
    invoke-direct {p3, p1, p6, p0, p2}, Ll/qj70;-><init>(Lv/fresco/subscaleview/SubsamplingScaleImageView;ILv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p3}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 116
    .line 117
    .line 118
    :cond_4
    return-void
.end method

.method private M()Z
    .locals 1

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_0
    throw p0
.end method

.method private N()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$d;

    .line 10
    .line 11
    invoke-interface {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$d;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private getImageContainerHeight()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->e:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    invoke-static {}, Ll/bnl0;->w0()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private getImageContainerWidth()I
    .locals 0

    .line 1
    sget p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->d:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    return p0

    .line 6
    :cond_0
    invoke-static {}, Ll/bnl0;->y0()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private init()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->C(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 13
    .line 14
    new-instance v1, Ll/ij70;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/ij70;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnViewTapListener(Ll/fp50;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 23
    .line 24
    new-instance v1, Ll/kj70;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/kj70;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Lv/fresco/photodraweeview/PhotoDraweeView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    new-instance v1, Ll/mj70;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/mj70;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 43
    .line 44
    new-instance v1, Ll/oj70;

    .line 45
    .line 46
    invoke-direct {v1, p0}, Ll/oj70;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;Landroid/view/View;FF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->E(Landroid/view/View;FF)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->F(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic u(Lv/fresco/subscaleview/SubsamplingScaleImageView;ILv/fresco/photodraweeview/PhotoDraweeView;Ljava/io/File;)V
    .locals 9

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$b;

    .line 2
    .line 3
    invoke-direct {v0, p1, p2, p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$b;-><init>(ILv/fresco/photodraweeview/PhotoDraweeView;Lv/fresco/subscaleview/SubsamplingScaleImageView;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setOnImageEventListener(Lv/fresco/subscaleview/SubsamplingScaleImageView$h;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    const/16 v0, 0x2d0

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    if-ge p1, v0, :cond_0

    .line 17
    .line 18
    :try_start_0
    invoke-virtual {p3}, Ljava/io/File;->length()J

    .line 19
    .line 20
    .line 21
    move-result-wide v3

    .line 22
    const-wide/32 v5, 0x32000

    .line 23
    .line 24
    .line 25
    cmp-long p1, v3, v5

    .line 26
    .line 27
    if-lez p1, :cond_0

    .line 28
    .line 29
    new-instance v3, Ll/sim;

    .line 30
    .line 31
    invoke-virtual {p3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-static {p1}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    sget v5, Ll/sim;->n:I

    .line 40
    .line 41
    sget-object v7, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    .line 42
    .line 43
    const/4 v8, 0x1

    .line 44
    const/4 v6, 0x0

    .line 45
    invoke-direct/range {v3 .. v8}, Ll/sim;-><init>(Ljava/lang/String;IILandroid/graphics/Bitmap$CompressFormat;Z)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ll/sim;->d()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    iget-object p1, v3, Ll/sim;->d:[I

    .line 57
    .line 58
    aget p1, p1, v2

    .line 59
    .line 60
    int-to-float p1, p1

    .line 61
    invoke-virtual {p2, p1}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 62
    .line 63
    .line 64
    iget-object p1, v3, Ll/sim;->d:[I

    .line 65
    .line 66
    const/4 p3, 0x1

    .line 67
    aget p1, p1, p3

    .line 68
    .line 69
    int-to-float p1, p1

    .line 70
    invoke-virtual {p2, p1}, Lv/VDraweeView;->setOriginalHeight(F)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    move-exception v0

    .line 75
    move-object p1, v0

    .line 76
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    :goto_0
    invoke-static {v1}, Ll/qkm;->m(Ljava/lang/String;)Ll/qkm;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p0, p1}, Lv/fresco/subscaleview/SubsamplingScaleImageView;->setImage(Ll/qkm;)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 87
    .line 88
    .line 89
    const/4 p1, 0x0

    .line 90
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->G(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->K(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->getImageContainerHeight()I

    move-result p0

    return p0
.end method


# virtual methods
.method public C(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/rj70;->b(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public O(Lcom/p1/mobile/putong/data/Picture;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 4
    .line 5
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->width:I

    .line 6
    .line 7
    int-to-float v1, v1

    .line 8
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 14
    .line 15
    iget v1, v1, Lcom/p1/mobile/putong/data/Dimension;->height:I

    .line 16
    .line 17
    int-to-float v1, v1

    .line 18
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setOriginalHeight(F)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 22
    .line 23
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/p1/mobile/putong/data/Media;->URL_TO_CACHEKEY(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 33
    .line 34
    const/16 v1, 0x8

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 37
    .line 38
    .line 39
    if-eqz p2, :cond_0

    .line 40
    .line 41
    invoke-static {}, Ll/qa00;->e()Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-eqz p2, :cond_0

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->webpMaxWidth1080()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    :goto_0
    move-object v2, p1

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/Picture;->aspectRatioBiggest()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    goto :goto_0

    .line 58
    :goto_1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 59
    .line 60
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 61
    .line 62
    new-instance v3, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$a;

    .line 63
    .line 64
    invoke-direct {v3, p0, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$a;-><init>(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 65
    .line 66
    .line 67
    iget-object v4, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->b:Lv/fresco/subscaleview/SubsamplingScaleImageView;

    .line 68
    .line 69
    const-string v5, ""

    .line 70
    .line 71
    invoke-virtual/range {v0 .. v5}, Ll/fsb0;->D0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;Ll/fn2;Lv/fresco/subscaleview/SubsamplingScaleImageView;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VDraweeView;->k()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/VDraweeView;->getZoomAnimationAttacher()Lv/a;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lv/a;->H(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    sput p1, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->d:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    sput p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->e:I

    .line 15
    .line 16
    return-void
.end method

.method public setOnLongPressListener(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$c;)V
    .locals 0

    return-void
.end method

.method public setOnTapListener(Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->c:Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView$d;

    .line 2
    .line 3
    return-void
.end method

.method public setOriginalHeight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setOriginalHeight(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOriginalWidth(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setOriginalWidth(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setPicture(Lcom/p1/mobile/putong/data/Picture;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->O(Lcom/p1/mobile/putong/data/Picture;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setZoomAnimationKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/mediaoperation/preview/item/PhotoPreviewView;->a:Lv/fresco/photodraweeview/PhotoDraweeView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VDraweeView;->setZoomAnimationKey(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
