.class public Ll/fma$d;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/fma;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/core/data/Sticker;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;"
        }
    .end annotation
.end field

.field public d:Z

.field public final synthetic e:Ll/fma;


# direct methods
.method public constructor <init>(Ll/fma;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fma$d;->e:Ll/fma;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/fma$d;->d:Z

    .line 8
    .line 9
    new-instance p1, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic E(Ll/fma$d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fma$d;->Q(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic F(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/fma$d;->N(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic G(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/fma$d;->P(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fma$d;->O(Lcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method

.method public static synthetic I(Ll/fma$d;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fma$d;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic J(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fma$d;->M(Lcom/p1/mobile/putong/core/data/Sticker;)V

    return-void
.end method

.method private synthetic P(Lcom/p1/mobile/putong/core/data/Sticker;ILandroid/view/View;)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/fma$d;->e:Ll/fma;

    .line 2
    .line 3
    iget-object p3, p3, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "gift_url"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p2, ""

    .line 35
    .line 36
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const-string v1, "gifs_order"

    .line 44
    .line 45
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    filled-new-array {v0, p2}, [Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    const-string v0, "e_hot_gifs_click"

    .line 54
    .line 55
    invoke-static {v0, p3, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ll/fma$d;->e:Ll/fma;

    .line 59
    .line 60
    iget-object p2, p2, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 61
    .line 62
    iget-boolean p3, p2, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->e:Z

    .line 63
    .line 64
    if-eqz p3, :cond_0

    .line 65
    .line 66
    new-instance p2, Landroid/content/Intent;

    .line 67
    .line 68
    invoke-direct {p2}, Landroid/content/Intent;-><init>()V

    .line 69
    .line 70
    .line 71
    iget-object p3, p0, Ll/fma$d;->e:Ll/fma;

    .line 72
    .line 73
    iget-object p3, p3, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 74
    .line 75
    sget-object p3, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->o:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {p2, p3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Ll/fma$d;->e:Ll/fma;

    .line 81
    .line 82
    iget-object p1, p1, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 83
    .line 84
    const/4 p3, -0x1

    .line 85
    invoke-virtual {p1, p3, p2}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/fma$d;->e:Ll/fma;

    .line 89
    .line 90
    iget-object p0, p0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 91
    .line 92
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->finish()V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_0
    new-instance p3, Ll/mma;

    .line 97
    .line 98
    invoke-direct {p3, p0, p1}, Ll/mma;-><init>(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 99
    .line 100
    .line 101
    invoke-static {p2, p1, p3}, Ll/tcz;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Sticker;Ljava/lang/Runnable;)V

    .line 102
    .line 103
    .line 104
    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/fma$d;->K(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    add-int/lit8 p0, p0, 0x2

    .line 8
    .line 9
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 3

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget p2, Ll/qec0;->j4:I

    .line 13
    .line 14
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    const/4 v0, -0x1

    .line 20
    if-ne p2, v0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    sget p2, Ll/qec0;->k4:I

    .line 31
    .line 32
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    check-cast p0, Landroid/widget/LinearLayout;

    .line 37
    .line 38
    sget p1, Ll/edc0;->H4:I

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Landroid/widget/TextView;

    .line 45
    .line 46
    const-string p2, "\u95ea\u840c"

    .line 47
    .line 48
    filled-new-array {p2}, [Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-static {p2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    const-string v0, "#757575"

    .line 57
    .line 58
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    const/4 v1, 0x2

    .line 63
    invoke-static {v1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v2, "\u641c\u7d22\u7ed3\u679c\u7531 \u95ea\u840c \u63d0\u4f9b"

    .line 68
    .line 69
    invoke-static {v2, p2, v0, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object p2

    .line 73
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    sget p2, Ll/qec0;->r1:I

    .line 86
    .line 87
    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-static {}, Ll/bnl0;->y0()I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    const/high16 v0, 0x41c00000    # 24.0f

    .line 100
    .line 101
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    sub-int/2addr p2, v0

    .line 106
    div-int/lit8 p2, p2, 0x4

    .line 107
    .line 108
    if-nez p1, :cond_2

    .line 109
    .line 110
    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    .line 111
    .line 112
    invoke-direct {p1, p2, p2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 113
    .line 114
    .line 115
    :cond_2
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 116
    .line 117
    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 118
    .line 119
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    .line 121
    .line 122
    return-object p0
.end method

.method public K(Landroid/view/View;Lcom/p1/mobile/putong/core/data/Sticker;II)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x1

    .line 3
    if-ne p3, v1, :cond_3

    .line 4
    .line 5
    check-cast p1, Landroid/widget/FrameLayout;

    .line 6
    .line 7
    sget p3, Ll/edc0;->C1:I

    .line 8
    .line 9
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p3

    .line 13
    check-cast p3, Lv/VDraweeView;

    .line 14
    .line 15
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-nez v1, :cond_2

    .line 28
    .line 29
    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->source:Lcom/p1/mobile/putong/core/data/StickerSource;

    .line 33
    .line 34
    const-string v2, "shanmeng"

    .line 35
    .line 36
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 43
    .line 44
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 45
    .line 46
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {v1, p3, v2}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    iget-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v1}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    iput-object v1, p2, Lcom/p1/mobile/putong/core/data/Sticker;->hash:Ljava/lang/String;

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    sget-object v1, Ll/uqb0;->G:Ll/fsb0;

    .line 75
    .line 76
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lcom/p1/mobile/putong/data/Picture;

    .line 83
    .line 84
    invoke-virtual {p0, v2}, Ll/fma$d;->V(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v1, p3, v2}, Ll/fsb0;->B0(Lcom/facebook/drawee/view/DraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 89
    .line 90
    .line 91
    :goto_0
    iget-object v1, p0, Ll/fma$d;->e:Ll/fma;

    .line 92
    .line 93
    iget-object v1, v1, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 94
    .line 95
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->pageId()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    iget-object v2, p2, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 108
    .line 109
    const-string v2, "gift_url"

    .line 110
    .line 111
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string v3, ""

    .line 124
    .line 125
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    const-string v3, "gifs_order"

    .line 133
    .line 134
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    filled-new-array {v0, v2}, [Ll/pf60;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    const-string v2, "e_hot_gifs_click"

    .line 143
    .line 144
    invoke-static {v2, v1, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/fma$d;->e:Ll/fma;

    .line 148
    .line 149
    iget-object v0, v0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 150
    .line 151
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->e:Z

    .line 152
    .line 153
    if-eqz v0, :cond_1

    .line 154
    .line 155
    new-instance v0, Ll/hma;

    .line 156
    .line 157
    invoke-direct {v0, p0, p2}, Ll/hma;-><init>(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 158
    .line 159
    .line 160
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 161
    .line 162
    .line 163
    :cond_1
    new-instance v0, Ll/ima;

    .line 164
    .line 165
    invoke-direct {v0, p0, p2, p4}, Ll/ima;-><init>(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;I)V

    .line 166
    .line 167
    .line 168
    invoke-static {p1, v0}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 169
    .line 170
    .line 171
    goto :goto_1

    .line 172
    :cond_2
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 173
    .line 174
    invoke-virtual {p0, p3}, Ll/am2;->o(Lcom/facebook/drawee/view/DraweeView;)V

    .line 175
    .line 176
    .line 177
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    const/high16 p1, 0x41200000    # 10.0f

    .line 182
    .line 183
    invoke-interface {p0, p3, p1}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->R9(Landroid/view/View;F)V

    .line 184
    .line 185
    .line 186
    return-void

    .line 187
    :cond_3
    const/4 p2, -0x1

    .line 188
    if-ne p3, p2, :cond_8

    .line 189
    .line 190
    sget p2, Ll/edc0;->H4:I

    .line 191
    .line 192
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    check-cast p2, Lv/VText;

    .line 197
    .line 198
    sget p3, Ll/edc0;->J4:I

    .line 199
    .line 200
    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 201
    .line 202
    .line 203
    move-result-object p3

    .line 204
    check-cast p3, Lv/VLinear;

    .line 205
    .line 206
    sget p4, Ll/edc0;->K4:I

    .line 207
    .line 208
    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 209
    .line 210
    .line 211
    move-result-object p4

    .line 212
    check-cast p4, Lv/VText;

    .line 213
    .line 214
    sget v2, Ll/edc0;->B:I

    .line 215
    .line 216
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    check-cast p1, Lv/VText;

    .line 221
    .line 222
    iget-object v2, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 223
    .line 224
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 225
    .line 226
    .line 227
    move-result v2

    .line 228
    if-eqz v2, :cond_4

    .line 229
    .line 230
    move v2, v1

    .line 231
    goto :goto_2

    .line 232
    :cond_4
    move v2, v0

    .line 233
    :goto_2
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 234
    .line 235
    .line 236
    iget-boolean p2, p0, Ll/fma$d;->d:Z

    .line 237
    .line 238
    if-nez p2, :cond_6

    .line 239
    .line 240
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 241
    .line 242
    .line 243
    iget-object p2, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 244
    .line 245
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 246
    .line 247
    .line 248
    move-result p2

    .line 249
    if-nez p2, :cond_5

    .line 250
    .line 251
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 252
    .line 253
    .line 254
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    new-instance p2, Ll/jma;

    .line 258
    .line 259
    invoke-direct {p2, p0}, Ll/jma;-><init>(Ll/fma$d;)V

    .line 260
    .line 261
    .line 262
    invoke-static {p1, p2}, Ll/bnl0;->L(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 263
    .line 264
    .line 265
    return-void

    .line 266
    :cond_5
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 267
    .line 268
    .line 269
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_6
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 274
    .line 275
    .line 276
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 277
    .line 278
    .line 279
    iget-object p0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 280
    .line 281
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 282
    .line 283
    .line 284
    move-result p0

    .line 285
    if-nez p0, :cond_7

    .line 286
    .line 287
    invoke-static {p3, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 288
    .line 289
    .line 290
    return-void

    .line 291
    :cond_7
    invoke-static {p3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 292
    .line 293
    .line 294
    return-void

    .line 295
    :cond_8
    check-cast p1, Landroid/widget/LinearLayout;

    .line 296
    .line 297
    sget p2, Ll/edc0;->T0:I

    .line 298
    .line 299
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    check-cast p1, Lv/VText;

    .line 304
    .line 305
    iget-boolean p2, p0, Ll/fma$d;->d:Z

    .line 306
    .line 307
    if-eqz p2, :cond_b

    .line 308
    .line 309
    iget-object p2, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 310
    .line 311
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 312
    .line 313
    .line 314
    move-result p2

    .line 315
    if-nez p2, :cond_9

    .line 316
    .line 317
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 318
    .line 319
    .line 320
    return-void

    .line 321
    :cond_9
    iget-object p0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 322
    .line 323
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    const/16 p2, 0x32

    .line 328
    .line 329
    if-ge p0, p2, :cond_a

    .line 330
    .line 331
    move v0, v1

    .line 332
    :cond_a
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    :cond_b
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 337
    .line 338
    .line 339
    return-void
.end method

.method public L(I)Lcom/p1/mobile/putong/core/data/Sticker;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    if-eq p1, v0, :cond_1

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 15
    .line 16
    add-int/lit8 p1, p1, -0x1

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Lcom/p1/mobile/putong/core/data/Sticker;

    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final synthetic M(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/fma$d;->e:Ll/fma;

    .line 2
    .line 3
    iget-object v0, v0, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    const-string v2, "gift_url"

    .line 21
    .line 22
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    filled-new-array {v1}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "e_add_hot_gif"

    .line 31
    .line 32
    invoke-static {v2, v0, v1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Ll/fma$d;->e:Ll/fma;

    .line 36
    .line 37
    iget-object p0, p0, Ll/fma;->h:Ll/bma;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/bma;->p0(Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final synthetic N(Lcom/p1/mobile/putong/core/data/Sticker;Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object p2, p0, Ll/fma$d;->e:Ll/fma;

    .line 2
    .line 3
    iget-object p2, p2, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;->pageId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Sticker;->pictures:Ljava/util/List;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    const-string v1, "gift_url"

    .line 21
    .line 22
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    filled-new-array {v0}, [Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "e_add_hot_gif"

    .line 31
    .line 32
    invoke-static {v1, p2, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/fma$d;->e:Ll/fma;

    .line 36
    .line 37
    iget-object p2, p2, Ll/fma;->i:Lcom/p1/mobile/putong/core/ui/messages/meme/CorePopularMemeAct;

    .line 38
    .line 39
    new-instance v0, Ll/kma;

    .line 40
    .line 41
    invoke-direct {v0, p0, p1}, Ll/kma;-><init>(Ll/fma$d;Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 42
    .line 43
    .line 44
    invoke-static {p2, p1, v0}, Ll/tcz;->w(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/data/Sticker;Ljava/lang/Runnable;)V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method public final synthetic O(Lcom/p1/mobile/putong/core/data/Sticker;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fma$d;->e:Ll/fma;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fma;->h:Ll/bma;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/bma;->p0(Lcom/p1/mobile/putong/core/data/Sticker;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fma$d;->e:Ll/fma;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fma;->h:Ll/bma;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Ll/bma;->F0(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fma$d;->e:Ll/fma;

    .line 2
    .line 3
    iget-object p0, p0, Ll/fma;->h:Ll/bma;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bma;->E0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public S()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/fma$d;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Ll/fma$d;->e:Ll/fma;

    .line 7
    .line 8
    iget-object p0, p0, Ll/fma;->f:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v2, p0, Ll/fma$d;->e:Ll/fma;

    .line 21
    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    iget-object p0, v2, Ll/fma;->f:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_1
    iget-object v0, v2, Ll/fma;->f:Landroid/widget/FrameLayout;

    .line 31
    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Ll/fma$d;->e:Ll/fma;

    .line 37
    .line 38
    iget-object v0, v0, Ll/fma;->f:Landroid/widget/FrameLayout;

    .line 39
    .line 40
    new-instance v1, Ll/lma;

    .line 41
    .line 42
    invoke-direct {v1, p0}, Ll/lma;-><init>(Ll/fma$d;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public T(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Sticker;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/fma$d;->S()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public U(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/fma$d;->d:Z

    .line 2
    .line 3
    return-void
.end method

.method public V(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
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

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fma$d;->L(I)Lcom/p1/mobile/putong/core/data/Sticker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getItemViewType(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fma$d;->c:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    add-int/2addr p0, v0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_0
    if-nez p1, :cond_1

    .line 14
    .line 15
    const/4 p0, -0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v0
.end method
