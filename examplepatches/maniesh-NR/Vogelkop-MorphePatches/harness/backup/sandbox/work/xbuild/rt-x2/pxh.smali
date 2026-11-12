.class public abstract Lpxh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;


# virtual methods
.method public final a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;
    .registers 8

    instance-of v0, p0, Lqxh;

    if-eqz v0, :cond_9

    check-cast p0, Lqxh;

    iget-object p0, p0, Lqxh;->a:Ljava/lang/CharSequence;

    return-object p0

    :cond_9
    instance-of v0, p0, Lrxh;

    if-eqz v0, :cond_16

    check-cast p0, Lrxh;

    iget p0, p0, Lrxh;->a:I

    invoke-virtual {p1, p0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_16
    instance-of v0, p0, Lsxh;

    const/4 v1, 0x0

    if-eqz v0, :cond_50

    check-cast p0, Lsxh;

    iget-object v0, p0, Lsxh;->b:[Ljava/lang/Object;

    invoke-static {v0}, Le82;->C([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :goto_28
    if-ge v3, v2, :cond_3e

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Lpxh;

    if-eqz v5, :cond_3b

    check-cast v4, Lpxh;

    invoke-virtual {v4, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_3b
    add-int/lit8 v3, v3, 0x1

    goto :goto_28

    :cond_3e
    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    iget p0, p0, Lsxh;->a:I

    invoke-virtual {p1, p0, v0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_50
    instance-of v0, p0, Ltxh;

    if-eqz v0, :cond_8b

    check-cast p0, Ltxh;

    iget-object v0, p0, Ltxh;->c:[Ljava/lang/Object;

    invoke-static {v0}, Le82;->C([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v3, v1

    :goto_61
    if-ge v3, v2, :cond_77

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Lpxh;

    if-eqz v5, :cond_74

    check-cast v4, Lpxh;

    invoke-virtual {v4, p1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :cond_74
    add-int/lit8 v3, v3, 0x1

    goto :goto_61

    :cond_77
    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Ltxh;->a:I

    iget p0, p0, Ltxh;->b:I

    invoke-virtual {p1, v1, p0, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_8b
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method
