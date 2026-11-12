.class public final Lcxj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Appendable;
.implements Ljava/lang/CharSequence;


# instance fields
.field public final a:Ljava/lang/StringBuilder;

.field public final b:Ljava/util/ArrayDeque;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayDeque;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/ArrayDeque;-><init>(I)V

    iput-object v0, p0, Lcxj;->b:Ljava/util/ArrayDeque;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/CharSequence;)V

    iput-object v0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcxj;->b(ILjava/lang/CharSequence;)V

    return-void
.end method

.method public static d(Lcxj;Ljava/lang/Object;II)V
    .registers 7

    if-eqz p1, :cond_1f

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->isArray()Z

    move-result v0

    if-eqz v0, :cond_1a

    check-cast p1, [Ljava/lang/Object;

    array-length v0, p1

    const/4 v1, 0x0

    :goto_10
    if-ge v1, v0, :cond_1f

    aget-object v2, p1, v1

    invoke-static {p0, v2, p2, p3}, Lcxj;->d(Lcxj;Ljava/lang/Object;II)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_10

    :cond_1a
    const/16 v0, 0x21

    invoke-virtual {p0, p1, p2, p3, v0}, Lcxj;->setSpan(Ljava/lang/Object;III)V

    :cond_1f
    return-void
.end method


# virtual methods
.method public final a(C)V
    .registers 2

    iget-object p0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-void
.end method

.method public final append(C)Ljava/lang/Appendable;
    .registers 3

    .line 17
    iget-object v0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public final append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    .registers 4

    .line 18
    iget-object v0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    .line 19
    invoke-virtual {p0, v1, p1}, Lcxj;->b(ILjava/lang/CharSequence;)V

    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public final append(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;
    .registers 4

    invoke-interface {p1, p2, p3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    iget-object p2, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->length()I

    move-result p3

    invoke-virtual {p0, p3, p1}, Lcxj;->b(ILjava/lang/CharSequence;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    return-object p0
.end method

.method public final b(ILjava/lang/CharSequence;)V
    .registers 10

    instance-of v0, p2, Landroid/text/Spanned;

    if-eqz v0, :cond_51

    check-cast p2, Landroid/text/Spanned;

    instance-of v0, p2, Laxj;

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const-class v2, Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-interface {p2, v3, v1, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_17

    array-length v2, v1

    goto :goto_18

    :cond_17
    move v2, v3

    :goto_18
    if-lez v2, :cond_51

    if-eqz v0, :cond_39

    add-int/lit8 v2, v2, -0x1

    :goto_1e
    if-ltz v2, :cond_51

    aget-object v0, v1, v2

    move-object v3, p2

    check-cast v3, Landroid/text/SpannableStringBuilder;

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    add-int/2addr v4, p1

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    add-int/2addr v5, p1

    invoke-virtual {v3, v0}, Landroid/text/SpannableStringBuilder;->getSpanFlags(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {p0, v0, v4, v5, v3}, Lcxj;->setSpan(Ljava/lang/Object;III)V

    add-int/lit8 v2, v2, -0x1

    goto :goto_1e

    :cond_39
    :goto_39
    if-ge v3, v2, :cond_51

    aget-object v0, v1, v3

    invoke-interface {p2, v0}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    add-int/2addr v4, p1

    invoke-interface {p2, v0}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v5

    add-int/2addr v5, p1

    invoke-interface {p2, v0}, Landroid/text/Spanned;->getSpanFlags(Ljava/lang/Object;)I

    move-result v6

    invoke-virtual {p0, v0, v4, v5, v6}, Lcxj;->setSpan(Ljava/lang/Object;III)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_39

    :cond_51
    return-void
.end method

.method public final c(II)Ljava/util/List;
    .registers 7

    iget-object v0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    if-le p2, p1, :cond_4e

    if-ltz p1, :cond_4e

    if-gt p2, v0, :cond_4e

    iget-object p0, p0, Lcxj;->b:Ljava/util/ArrayDeque;

    if-nez p1, :cond_1f

    if-ne v0, p2, :cond_1f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Ljava/util/Collections;->reverse(Ljava/util/List;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1f
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0}, Ljava/util/ArrayDeque;->descendingIterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_29
    :goto_29
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_49

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzwj;

    iget v2, v1, Lzwj;->b:I

    if-lt v2, p1, :cond_3b

    if-lt v2, p2, :cond_45

    :cond_3b
    iget v3, v1, Lzwj;->c:I

    if-gt v3, p2, :cond_41

    if-gt v3, p1, :cond_45

    :cond_41
    if-ge v2, p1, :cond_29

    if-le v3, p2, :cond_29

    :cond_45
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_29

    :cond_49
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_4e
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0
.end method

.method public final charAt(I)C
    .registers 2

    iget-object p0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p0

    return p0
.end method

.method public final length()I
    .registers 1

    iget-object p0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    return p0
.end method

.method public final setSpan(Ljava/lang/Object;III)V
    .registers 6

    new-instance v0, Lzwj;

    invoke-direct {v0, p2, p3, p4, p1}, Lzwj;-><init>(IIILjava/lang/Object;)V

    iget-object p0, p0, Lcxj;->b:Ljava/util/ArrayDeque;

    invoke-virtual {p0, v0}, Ljava/util/ArrayDeque;->push(Ljava/lang/Object;)V

    return-void
.end method

.method public final subSequence(II)Ljava/lang/CharSequence;
    .registers 8

    invoke-virtual {p0, p1, p2}, Lcxj;->c(II)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    iget-object p0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    if-eqz v1, :cond_11

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0

    :cond_11
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, p1, p2}, Ljava/lang/StringBuilder;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_22
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_48

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lzwj;

    iget v2, v0, Lzwj;->b:I

    sub-int/2addr v2, p1

    const/4 v3, 0x0

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v3, v0, Lzwj;->c:I

    iget v4, v0, Lzwj;->b:I

    sub-int/2addr v3, v4

    add-int/2addr v3, v2

    invoke-static {p0, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    iget-object v4, v0, Lzwj;->a:Ljava/lang/Object;

    iget v0, v0, Lzwj;->d:I

    invoke-virtual {v1, v4, v2, v3, v0}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_22

    :cond_48
    return-object v1
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcxj;->a:Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
