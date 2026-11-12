.class public final Lta2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;)V
    .registers 3

    const/4 v0, 0x1

    iput-byte v0, p0, Lta2;->a:B

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lta2;->c:Ljava/lang/Object;

    .line 32
    invoke-static {}, Ljava/text/Collator;->getInstance()Ljava/text/Collator;

    move-result-object p1

    iput-object p1, p0, Lta2;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/util/Rational;Landroid/util/Rational;)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lta2;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p2, :cond_f

    new-instance p2, Landroid/util/Rational;

    const/4 v0, 0x4

    const/4 v1, 0x3

    invoke-direct {p2, v0, v1}, Landroid/util/Rational;-><init>(II)V

    :cond_f
    iput-object p2, p0, Lta2;->c:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Lta2;->b(Landroid/util/Rational;)Landroid/graphics/RectF;

    move-result-object p1

    iput-object p1, p0, Lta2;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/bookmarks/c;)V
    .registers 3

    const/4 v0, 0x2

    iput-byte v0, p0, Lta2;->a:B

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Lta2;->b:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;)V
    .registers 3

    const/4 v0, 0x3

    iput-byte v0, p0, Lta2;->a:B

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lta2;->c:Ljava/lang/Object;

    .line 28
    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {p1}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object p1

    iput-object p1, p0, Lta2;->b:Ljava/lang/Object;

    const/4 p0, 0x0

    .line 29
    invoke-virtual {p1, p0}, Ljava/text/Collator;->setStrength(I)V

    return-void
.end method

.method public static a(Landroid/graphics/RectF;Landroid/graphics/RectF;)F
    .registers 5

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_11

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v0

    goto :goto_15

    :cond_11
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    :goto_15
    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    cmpg-float v1, v1, v2

    if-gez v1, :cond_26

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result p0

    goto :goto_2a

    :cond_26
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p0

    :goto_2a
    mul-float/2addr v0, p0

    return v0
.end method


# virtual methods
.method public final b(Landroid/util/Rational;)Landroid/graphics/RectF;
    .registers 6

    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result v0

    iget-object p0, p0, Lta2;->c:Ljava/lang/Object;

    check-cast p0, Landroid/util/Rational;

    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v1

    cmpl-float v0, v0, v1

    const/4 v1, 0x0

    if-nez v0, :cond_21

    new-instance p1, Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/util/Rational;->getNumerator()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/util/Rational;->getDenominator()I

    move-result p0

    int-to-float p0, p0

    invoke-direct {p1, v1, v1, v0, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object p1

    :cond_21
    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result v0

    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v2

    cmpl-float v0, v0, v2

    if-lez v0, :cond_49

    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {p0}, Landroid/util/Rational;->getNumerator()I

    move-result p0

    int-to-float p0, p0

    mul-float/2addr v3, p0

    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result p0

    int-to-float p0, p0

    div-float/2addr v3, p0

    invoke-direct {v0, v1, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0

    :cond_49
    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/util/Rational;->getNumerator()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Landroid/util/Rational;->getDenominator()I

    move-result v3

    int-to-float v3, v3

    mul-float/2addr v2, v3

    invoke-virtual {p1}, Landroid/util/Rational;->getDenominator()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v2, p1

    invoke-virtual {p0}, Landroid/util/Rational;->getDenominator()I

    move-result p0

    int-to-float p0, p0

    invoke-direct {v0, v1, v1, v2, p0}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 13

    iget-byte v0, p0, Lta2;->a:B

    const/4 v1, -0x1

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, p0, Lta2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_150

    check-cast p1, Lsbn;

    check-cast p2, Lsbn;

    iget-object p0, p0, Lta2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p1, Lsbn;->a:Ljava/lang/String;

    invoke-static {v2}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v2

    iget-object v5, p2, Lsbn;->a:Ljava/lang/String;

    invoke-static {v5}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v5

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v6

    :cond_2a
    :goto_2a
    if-ge v3, v6, :cond_61

    invoke-virtual {p0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v3, v3, 0x1

    check-cast v7, Ljava/lang/String;

    invoke-static {v7}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v8

    invoke-static {v8}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v2}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lwwc;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_4a

    invoke-virtual {p0, v7}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    :cond_4a
    invoke-static {v7}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v8

    invoke-static {v8}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v5}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lwwc;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_2a

    invoke-virtual {p0, v7}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    goto :goto_2a

    :cond_61
    if-eq v0, v1, :cond_65

    sub-int/2addr v0, v1

    goto :goto_6f

    :cond_65
    check-cast v4, Ljava/text/Collator;

    iget-object p0, p1, Lsbn;->b:Ljava/lang/String;

    iget-object p1, p2, Lsbn;->b:Ljava/lang/String;

    invoke-virtual {v4, p0, p1}, Ljava/text/Collator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    :goto_6f
    return v0

    :pswitch_70
    check-cast p1, Lal3;

    check-cast p2, Lal3;

    check-cast v4, Lcom/opera/android/bookmarks/c;

    invoke-interface {p1, v4}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v0

    invoke-interface {p2, v4}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v5

    invoke-static {v0, v5}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b2

    invoke-interface {p1, v4}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v0

    iget-object v5, p0, Lta2;->c:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    if-nez v5, :cond_94

    invoke-interface {v0}, Lml3;->i()Ljava/util/List;

    move-result-object v5

    iput-object v5, p0, Lta2;->c:Ljava/lang/Object;

    :cond_94
    invoke-interface {v5, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-interface {p2, v4}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v0

    iget-object v4, p0, Lta2;->c:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    if-nez v4, :cond_a8

    invoke-interface {v0}, Lml3;->i()Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lta2;->c:Ljava/lang/Object;

    :cond_a8
    invoke-interface {v4, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p0

    if-lt p1, p0, :cond_b3

    if-le p1, p0, :cond_b2

    move v1, v2

    goto :goto_b3

    :cond_b2
    move v1, v3

    :cond_b3
    :goto_b3
    return v1

    :pswitch_b4
    check-cast p1, Lpc;

    check-cast p2, Lpc;

    check-cast v4, Ljava/text/Collator;

    iget-object p1, p1, Lpc;->a:Lxc;

    iget-object p1, p1, Lxc;->b:Lrxh;

    iget-object p0, p0, Lta2;->c:Ljava/lang/Object;

    check-cast p0, Landroid/content/res/Resources;

    invoke-virtual {p1, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    iget-object p2, p2, Lpc;->a:Lxc;

    iget-object p2, p2, Lxc;->b:Lrxh;

    invoke-virtual {p2, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {v4, p1, p0}, Ljava/text/Collator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    return p0

    :pswitch_d3
    check-cast p1, Landroid/util/Rational;

    check-cast p2, Landroid/util/Rational;

    check-cast v4, Landroid/graphics/RectF;

    invoke-virtual {p1, p2}, Landroid/util/Rational;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_e2

    move v1, v3

    goto/16 :goto_14e

    :cond_e2
    invoke-virtual {p0, p1}, Lta2;->b(Landroid/util/Rational;)Landroid/graphics/RectF;

    move-result-object p1

    invoke-virtual {p0, p2}, Lta2;->b(Landroid/util/Rational;)Landroid/graphics/RectF;

    move-result-object p0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p2

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v0

    cmpl-float p2, p2, v0

    if-ltz p2, :cond_104

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p2

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float p2, p2, v0

    if-ltz p2, :cond_104

    move p2, v2

    goto :goto_105

    :cond_104
    move p2, v3

    :goto_105
    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v5

    cmpl-float v0, v0, v5

    if-ltz v0, :cond_11e

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v5

    cmpl-float v0, v0, v5

    if-ltz v0, :cond_11e

    move v3, v2

    :cond_11e
    if-eqz p2, :cond_13b

    if-eqz v3, :cond_14e

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    mul-float/2addr p1, p2

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result p2

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result p0

    mul-float/2addr p0, p2

    sub-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p0

    float-to-int v1, p0

    goto :goto_14e

    :cond_13b
    if-eqz v3, :cond_13f

    move v1, v2

    goto :goto_14e

    :cond_13f
    invoke-static {p1, v4}, Lta2;->a(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result p1

    invoke-static {p0, v4}, Lta2;->a(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result p0

    sub-float/2addr p1, p0

    invoke-static {p1}, Ljava/lang/Math;->signum(F)F

    move-result p0

    float-to-int p0, p0

    neg-int v1, p0

    :cond_14e
    :goto_14e
    return v1

    nop

    :pswitch_data_150
    .packed-switch 0x0
        :pswitch_d3
        :pswitch_b4
        :pswitch_70
    .end packed-switch
.end method
