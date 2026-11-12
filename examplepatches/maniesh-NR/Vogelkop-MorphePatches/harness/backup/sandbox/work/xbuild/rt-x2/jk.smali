.class public final Ljk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Comparator;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Ljk;->a:B

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {v0}, Landroid/icu/text/Collator;->getInstance(Ljava/util/Locale;)Landroid/icu/text/Collator;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/icu/text/Collator;->setStrength(I)V

    check-cast v0, Landroid/icu/text/RuleBasedCollator;

    iput-object v0, p0, Ljk;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 23
    iput-byte p2, p0, Ljk;->a:B

    iput-object p1, p0, Ljk;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 7

    iget-byte v0, p0, Ljk;->a:B

    const v1, 0x7fffffff

    const/4 v2, 0x0

    iget-object p0, p0, Ljk;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_200

    check-cast p0, Lxfk;

    iget-object p0, p0, Lxfk;->g:Ljava/util/ArrayList;

    check-cast p1, Lvfk;

    iget-object p1, p1, Lvfk;->l:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_84

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcg4;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    :cond_2b
    :goto_2b
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_47

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcg4;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result v3

    if-lez v3, :cond_2b

    move-object v0, v1

    goto :goto_2b

    :cond_47
    check-cast p2, Lvfk;

    iget-object p1, p2, Lvfk;->l:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_84

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcg4;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    :cond_63
    :goto_63
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcg4;

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result v2

    if-lez v2, :cond_63

    move-object p2, v1

    goto :goto_63

    :cond_7f
    invoke-virtual {v0, p2}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result v2

    goto :goto_87

    :cond_84
    invoke-static {}, Lt3p;->y()V

    :goto_87
    return v2

    :pswitch_88
    check-cast p0, Ljk;

    invoke-virtual {p0, p1, p2}, Ljk;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    if-nez p0, :cond_a4

    check-cast p1, Lk0j;

    iget p0, p1, Lk0j;->f:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    check-cast p2, Lk0j;

    iget p1, p2, Lk0j;->f:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result p0

    :cond_a4
    return p0

    :pswitch_a5
    check-cast p0, Ljava/util/Comparator;

    invoke-interface {p0, p1, p2}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    if-nez p0, :cond_da

    check-cast p1, Lk0j;

    iget-object p0, p1, Lk0j;->c:Lm3c;

    check-cast p2, Lk0j;

    iget-object p1, p2, Lk0j;->c:Lm3c;

    invoke-virtual {p0}, Lm3c;->x()F

    move-result p2

    invoke-virtual {p1}, Lm3c;->x()F

    move-result v0

    cmpg-float p2, p2, v0

    if-nez p2, :cond_ce

    invoke-virtual {p0}, Lm3c;->v()I

    move-result p0

    invoke-virtual {p1}, Lm3c;->v()I

    move-result p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->b(II)I

    move-result p0

    goto :goto_da

    :cond_ce
    invoke-virtual {p0}, Lm3c;->x()F

    move-result p0

    invoke-virtual {p1}, Lm3c;->x()F

    move-result p1

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    :cond_da
    :goto_da
    return p0

    :pswitch_db
    check-cast p1, Landroid/util/Rational;

    check-cast p2, Landroid/util/Rational;

    check-cast p0, Landroid/util/Rational;

    invoke-virtual {p1}, Landroid/util/Rational;->floatValue()F

    move-result p1

    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result v0

    cmpl-float v1, p1, v0

    if-lez v1, :cond_ef

    div-float/2addr v0, p1

    goto :goto_f1

    :cond_ef
    div-float v0, p1, v0

    :goto_f1
    invoke-virtual {p2}, Landroid/util/Rational;->floatValue()F

    move-result p1

    invoke-virtual {p0}, Landroid/util/Rational;->floatValue()F

    move-result p0

    cmpl-float p2, p1, p0

    if-lez p2, :cond_ff

    div-float/2addr p0, p1

    goto :goto_101

    :cond_ff
    div-float p0, p1, p0

    :goto_101
    invoke-static {p0, v0}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    return p0

    :pswitch_106
    check-cast p1, Lenh;

    check-cast p0, Landroid/util/SparseIntArray;

    iget p1, p1, Lenh;->c:I

    invoke-virtual {p0, p1, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    check-cast p2, Lenh;

    iget p2, p2, Lenh;->c:I

    invoke-virtual {p0, p2, v1}, Landroid/util/SparseIntArray;->get(II)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/Integer;->compareTo(Ljava/lang/Object;)I

    move-result p0

    return p0

    :pswitch_125
    check-cast p1, Lw3g;

    check-cast p2, Lw3g;

    if-eqz p1, :cond_137

    if-eqz p2, :cond_137

    check-cast p0, Landroid/icu/text/RuleBasedCollator;

    iget-object p1, p1, Lw3g;->c:Ljava/lang/String;

    iget-object p2, p2, Lw3g;->c:Ljava/lang/String;

    invoke-virtual {p0, p1, p2}, Landroid/icu/text/RuleBasedCollator;->compare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    :cond_137
    return v2

    :pswitch_138
    check-cast p1, Lyqe;

    check-cast p0, Ljava/util/LinkedHashMap;

    iget-object p1, p1, Lyqe;->a:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    check-cast p2, Lyqe;

    iget-object p2, p2, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {p0, p2, v0}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-static {p1, p0}, Lad5;->a(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p0

    return p0

    :pswitch_157
    check-cast p1, Late;

    check-cast p2, Late;

    invoke-static {p1}, Lqbe;->x(Late;)Landroid/util/Range;

    move-result-object v0

    invoke-static {p2}, Lqbe;->x(Late;)Landroid/util/Range;

    move-result-object v1

    invoke-static {v0, v1}, Lqbe;->o(Landroid/util/Range;Landroid/util/Range;)I

    move-result v0

    if-nez v0, :cond_187

    iget-object v0, p1, Late;->d:Landroid/util/Range;

    iget-object v1, p2, Late;->d:Landroid/util/Range;

    invoke-static {v0, v1}, Lqbe;->o(Landroid/util/Range;Landroid/util/Range;)I

    move-result v0

    if-nez v0, :cond_187

    iget-object v0, p1, Late;->e:Landroid/util/Range;

    iget-object v1, p2, Late;->e:Landroid/util/Range;

    invoke-static {v0, v1}, Lqbe;->o(Landroid/util/Range;Landroid/util/Range;)I

    move-result v0

    if-nez v0, :cond_187

    check-cast p0, Lz8b;

    iget-object p0, p0, Lz8b;->a:Ljava/lang/Object;

    check-cast p0, Lc9;

    invoke-virtual {p0, p1, p2}, Lc9;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    :cond_187
    return v0

    :pswitch_188
    check-cast p0, Lkotlin/jvm/functions/Function1;

    invoke-interface {p0, p1}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p2}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    sget-object p2, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-interface {p2, p1, p0}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result p0

    return p0

    :pswitch_199
    check-cast p1, Lis;

    iget-object p1, p1, Lis;->c:Lst;

    iget-object p1, p1, Lst;->a:Lpxh;

    check-cast p0, Lct;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p1, v0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    check-cast p2, Lis;

    iget-object p2, p2, Lis;->c:Lst;

    iget-object p2, p2, Lst;->a:Lpxh;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p2, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lad5;->a(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p0

    return p0

    :pswitch_1c4
    check-cast p1, Lel;

    check-cast p2, Lel;

    check-cast p0, Ljava/util/ArrayList;

    iget v0, p1, Lel;->g:I

    iget v1, p2, Lel;->g:I

    if-eq v0, v1, :cond_1d2

    sub-int/2addr v0, v1

    goto :goto_1dc

    :cond_1d2
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p0

    sub-int v0, p1, p0

    :goto_1dc
    return v0

    :pswitch_1dd
    check-cast p1, Lmk;

    iget-object p1, p1, Lmk;->b:Lnk;

    iget-object p1, p1, Lnk;->a:Lpxh;

    check-cast p0, Landroid/content/res/Resources;

    invoke-virtual {p1, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    check-cast p2, Lmk;

    iget-object p2, p2, Lmk;->b:Lnk;

    iget-object p2, p2, Lnk;->a:Lpxh;

    invoke-virtual {p2, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lad5;->a(Ljava/lang/Comparable;Ljava/lang/Comparable;)I

    move-result p0

    return p0

    :pswitch_data_200
    .packed-switch 0x0
        :pswitch_1dd
        :pswitch_1c4
        :pswitch_199
        :pswitch_188
        :pswitch_157
        :pswitch_138
        :pswitch_125
        :pswitch_106
        :pswitch_db
        :pswitch_a5
        :pswitch_88
    .end packed-switch
.end method
