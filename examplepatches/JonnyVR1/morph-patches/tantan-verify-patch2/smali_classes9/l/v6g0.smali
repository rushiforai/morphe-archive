.class public Ll/v6g0;
.super Ll/jic0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/jic0<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;",
        ">;"
    }
.end annotation


# instance fields
.field public c:Ll/p6g0;

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/p6g0;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/p6g0;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/jic0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/v6g0;->c:Ll/p6g0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/v6g0;->d:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic E(Landroid/text/SpannableStringBuilder;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;->key:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "}"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-ltz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    add-int/2addr v0, v1

    .line 37
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;->value:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p0, v1, v0, v2}, Landroid/text/SpannableStringBuilder;->replace(IILjava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 40
    .line 41
    .line 42
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 43
    .line 44
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;->color:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-direct {v0, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTipContent;->value:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    add-int/2addr p1, v1

    .line 60
    const/16 v2, 0x22

    .line 61
    .line 62
    invoke-virtual {p0, v0, v1, p1, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 63
    .line 64
    .line 65
    :cond_0
    return-void
.end method

.method public static synthetic F(Ll/v6g0;ILandroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/v6g0;->I(ILandroid/view/View;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic A(Landroid/view/View;Ljava/lang/Object;II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/v6g0;->G(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public C()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/v6g0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Ll/v6g0;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public D(Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 1

    .line 1
    new-instance p0, Lv/VText;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Lv/VText;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/high16 p1, 0x41500000    # 13.0f

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 13
    .line 14
    .line 15
    sget p1, Ll/qa00;->k:I

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    invoke-virtual {p0, p1, p2, p1, p2}, Landroid/view/View;->setPadding(IIII)V

    .line 19
    .line 20
    .line 21
    const/16 p1, 0x11

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 24
    .line 25
    .line 26
    new-instance p1, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 27
    .line 28
    const/4 p2, -0x2

    .line 29
    sget v0, Ll/qa00;->y:I

    .line 30
    .line 31
    invoke-direct {p1, p2, v0}, Landroidx/recyclerview/widget/RecyclerView$p;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    const/4 p1, -0x1

    .line 38
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 39
    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 43
    .line 44
    .line 45
    return-object p0
.end method

.method public G(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;II)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->toJson()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    new-instance p3, Landroid/graphics/drawable/GradientDrawable;

    .line 5
    .line 6
    invoke-direct {p3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 7
    .line 8
    .line 9
    sget v0, Ll/qa00;->k:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    invoke-virtual {p3, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/v6g0;->c:Ll/p6g0;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/p6g0;->S3()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-ne p4, v0, :cond_0

    .line 22
    .line 23
    sget v0, Ll/qa00;->d:I

    .line 24
    .line 25
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->borderColor:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p3, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    const v0, 0x8ffffff

    .line 36
    .line 37
    .line 38
    invoke-virtual {p3, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 39
    .line 40
    .line 41
    :goto_0
    invoke-virtual {p1, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 42
    .line 43
    .line 44
    new-instance p3, Landroid/text/SpannableStringBuilder;

    .line 45
    .line 46
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->text:Ljava/lang/String;

    .line 47
    .line 48
    invoke-direct {p3, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->fields:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;->fields:Ljava/util/List;

    .line 60
    .line 61
    new-instance v0, Ll/t6g0;

    .line 62
    .line 63
    invoke-direct {v0, p3}, Ll/t6g0;-><init>(Landroid/text/SpannableStringBuilder;)V

    .line 64
    .line 65
    .line 66
    invoke-static {p2, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    move-object p2, p1

    .line 70
    check-cast p2, Landroid/widget/TextView;

    .line 71
    .line 72
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 73
    .line 74
    .line 75
    new-instance p2, Ll/u6g0;

    .line 76
    .line 77
    invoke-direct {p2, p0, p4}, Ll/u6g0;-><init>(Ll/v6g0;I)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public H(I)Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v6g0;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;

    .line 8
    .line 9
    return-object p0
.end method

.method public final synthetic I(ILandroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v6g0;->c:Ll/p6g0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/p6g0;->X3(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/v6g0;->H(I)Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuTip;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
