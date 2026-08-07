.class public Ll/w0r$i;
.super Ll/dq1;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/w0r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "i"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/dq1<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Lcom/p1/mobile/putong/core/data/StickerPackage;

.field public final d:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Ll/w0r;


# direct methods
.method public constructor <init>(Ll/w0r;Ll/y20;Lcom/p1/mobile/putong/core/data/StickerPackage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;",
            "Lcom/p1/mobile/putong/core/data/StickerPackage;",
            ")V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/w0r$i;->e:Ll/w0r;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dq1;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/w0r$i;->d:Ll/y20;

    .line 7
    .line 8
    iput-object p3, p0, Ll/w0r$i;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 9
    .line 10
    return-void
.end method

.method private B(Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 6

    .line 1
    new-instance p0, Landroid/graphics/drawable/ColorDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/drawable/ColorDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    new-array v0, p0, [I

    .line 11
    .line 12
    invoke-virtual {p2, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, 0x0

    .line 20
    invoke-virtual {v1, v2, v2}, Landroid/view/View;->measure(II)V

    .line 21
    .line 22
    .line 23
    aget v2, v0, v2

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    div-int/2addr v3, p0

    .line 30
    add-int/2addr v2, v3

    .line 31
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    div-int/2addr v3, p0

    .line 36
    sub-int/2addr v2, v3

    .line 37
    const/4 p0, 0x1

    .line 38
    aget v0, v0, p0

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    sub-int/2addr v0, v3

    .line 45
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    add-int/2addr v3, v2

    .line 50
    invoke-static {}, Ll/bnl0;->y0()I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    sget v5, Ll/qa00;->g:I

    .line 55
    .line 56
    sub-int/2addr v4, v5

    .line 57
    if-le v3, v4, :cond_0

    .line 58
    .line 59
    invoke-static {}, Ll/bnl0;->y0()I

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    sub-int/2addr v2, v5

    .line 64
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    sub-int/2addr v2, v1

    .line 69
    goto :goto_0

    .line 70
    :cond_0
    if-ge v2, v5, :cond_1

    .line 71
    .line 72
    move v2, v5

    .line 73
    :cond_1
    :goto_0
    const/16 v1, 0x33

    .line 74
    .line 75
    invoke-virtual {p1, p2, v1, v2, v0}, Landroid/widget/PopupWindow;->showAtLocation(Landroid/view/View;III)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1, p0}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p1, p0}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/widget/PopupWindow;->update()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public static synthetic p(Ll/w0r$i;Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/w0r$i;->z(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic s(Ll/w0r$i;Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/w0r$i;->y(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic t(Ll/w0r$i;Landroid/widget/PopupWindow;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/w0r$i;->B(Landroid/widget/PopupWindow;Landroid/view/View;)V

    return-void
.end method

.method private y(Landroid/content/Context;Lcom/p1/mobile/putong/core/data/Sticker;)Landroid/widget/PopupWindow;
    .locals 2

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/qec0;->p2:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Ll/w0r$i;->e:Ll/w0r;

    .line 13
    .line 14
    invoke-static {p0, p1, v1, v1}, Ll/w0r;->I(Ll/w0r;Landroid/view/View;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 15
    .line 16
    .line 17
    sget p0, Ll/edc0;->y1:I

    .line 18
    .line 19
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lv/VDraweeView;

    .line 24
    .line 25
    new-instance v0, Landroid/widget/PopupWindow;

    .line 26
    .line 27
    const/4 v1, -0x2

    .line 28
    invoke-direct {v0, p1, v1, v1}, Landroid/widget/PopupWindow;-><init>(Landroid/view/View;II)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 39
    .line 40
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 49
    .line 50
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 51
    .line 52
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 57
    .line 58
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Picture;->attachments:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 65
    .line 66
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 67
    .line 68
    invoke-virtual {p1, p0, p2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-object v0
.end method


# virtual methods
.method public final A(Landroid/view/View;Z)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    div-int/lit8 v0, v0, 0x4

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    new-instance p0, Landroid/view/ViewGroup$LayoutParams;

    .line 14
    .line 15
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 19
    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    const/high16 p2, 0x41900000    # 18.0f

    .line 23
    .line 24
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const/4 p2, 0x0

    .line 30
    :goto_0
    add-int/2addr v0, p2

    .line 31
    iput v0, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 32
    .line 33
    invoke-virtual {p1, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public C(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 1

    .line 1
    invoke-static {}, Ll/bnl0;->y0()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 v0, 0x41400000    # 12.0f

    .line 6
    .line 7
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x5

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    div-int/lit8 p0, p0, 0x4

    .line 15
    .line 16
    const-string v0, ".png"

    .line 17
    .line 18
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/data/Picture;->aboutWidth(ILjava/lang/String;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r$i;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/w0r$i;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/StickerPackage;->stickers:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public bridge synthetic j(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/w0r$i;->w(Landroid/view/View;Ljava/lang/String;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public m(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget p2, Ll/qec0;->q2:I

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const/4 p2, 0x0

    .line 17
    invoke-virtual {p0, p1, p2}, Ll/w0r$i;->A(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    return-object p1
.end method

.method public w(Landroid/view/View;Ljava/lang/String;II)V
    .locals 5

    .line 1
    move-object p3, p1

    .line 2
    check-cast p3, Landroid/widget/LinearLayout;

    .line 3
    .line 4
    sget v0, Ll/edc0;->C1:I

    .line 5
    .line 6
    invoke-virtual {p3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lv/VDraweeView;

    .line 11
    .line 12
    sget v1, Ll/edc0;->Q4:I

    .line 13
    .line 14
    invoke-virtual {p3, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Lv/VText;

    .line 19
    .line 20
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->Z:Lcom/p1/mobile/putong/core/api/z;

    .line 23
    .line 24
    invoke-virtual {v2, p2}, Lcom/p1/mobile/putong/core/api/z;->s3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/data/Sticker;->isChatheatSticker()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    const/4 v3, 0x0

    .line 33
    if-eqz v2, :cond_0

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 37
    .line 38
    .line 39
    iget-object v4, p2, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 40
    .line 41
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1, v2}, Ll/w0r$i;->A(Landroid/view/View;Z)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    invoke-static {v1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1, v3}, Ll/w0r$i;->A(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    :goto_0
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-nez v1, :cond_2

    .line 67
    .line 68
    invoke-virtual {p3, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    new-instance v1, Ll/h1r;

    .line 72
    .line 73
    invoke-direct {v1, p0, p2, p4}, Ll/h1r;-><init>(Ll/w0r$i;Lcom/p1/mobile/putong/core/data/Sticker;I)V

    .line 74
    .line 75
    .line 76
    invoke-static {p3, v1}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 77
    .line 78
    .line 79
    new-instance p4, Ll/w0r$i$a;

    .line 80
    .line 81
    invoke-direct {p4, p0, p1, p2}, Ll/w0r$i$a;-><init>(Ll/w0r$i;Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p3, p4}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 85
    .line 86
    .line 87
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 88
    .line 89
    const-string p3, "shanmeng"

    .line 90
    .line 91
    invoke-static {p1, p3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    if-eqz p1, :cond_1

    .line 96
    .line 97
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 98
    .line 99
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 106
    .line 107
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 108
    .line 109
    invoke-virtual {p0, v0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :cond_1
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 114
    .line 115
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 116
    .line 117
    invoke-interface {p2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p2

    .line 121
    check-cast p2, Lcom/p1/mobile/putong/data/Picture;

    .line 122
    .line 123
    invoke-virtual {p0, p2}, Ll/w0r$i;->C(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-virtual {p1, v0, p0}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_2
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 132
    .line 133
    invoke-virtual {p0, v0}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 134
    .line 135
    .line 136
    return-void
.end method

.method public final synthetic z(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 2
    .line 3
    const-string v1, "intimate"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "p_chat_view"

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const-string v0, "friends_emoji_name"

    .line 14
    .line 15
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const-string v0, "e_send_friends_emoji"

    .line 26
    .line 27
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 32
    .line 33
    const-string v2, "poke"

    .line 34
    .line 35
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    const-string v0, "chuochuo_emoji_name"

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->name:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    filled-new-array {p1}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    const-string v0, "e_send_chuochuo_emoji"

    .line 54
    .line 55
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/w0r$i;->c:Lcom/p1/mobile/putong/core/data/StickerPackage;

    .line 59
    .line 60
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/StickerPackage;->id:Ljava/lang/String;

    .line 61
    .line 62
    const-string v0, "stickers_id"

    .line 63
    .line 64
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    const-string v0, "sticker_rank"

    .line 69
    .line 70
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    filled-new-array {p1, p2}, [Ll/pf60;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    const-string p2, "e_stickers"

    .line 83
    .line 84
    invoke-static {p2, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p0, Ll/w0r$i;->d:Ll/y20;

    .line 88
    .line 89
    invoke-virtual {p3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 94
    .line 95
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method
