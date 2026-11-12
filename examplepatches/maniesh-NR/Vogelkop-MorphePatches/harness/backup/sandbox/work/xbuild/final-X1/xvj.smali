.class public final Lxvj;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:[Ljava/lang/Object;

.field public b:[Ljava/lang/Object;

.field public c:I

.field public d:I

.field public e:I

.field public f:Lqw4;

.field public g:Lwvj;

.field public h:I

.field public final i:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lyvj;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxvj;->i:Ljava/lang/Class;

    const/16 v0, 0xa

    invoke-static {p1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Ljava/lang/Object;

    iput-object p1, p0, Lxvj;->a:[Ljava/lang/Object;

    iput-object p2, p0, Lxvj;->f:Lqw4;

    const/4 p1, 0x0

    iput p1, p0, Lxvj;->h:I

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)I
    .registers 3

    invoke-virtual {p0}, Lxvj;->i()V

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lxvj;->b(Ljava/lang/Object;Z)I

    move-result p0

    return p0
.end method

.method public final b(Ljava/lang/Object;Z)I
    .registers 9

    iget-object v0, p0, Lxvj;->a:[Ljava/lang/Object;

    iget v1, p0, Lxvj;->h:I

    const/4 v2, 0x1

    invoke-virtual {p0, v1, v2, p1, v0}, Lxvj;->e(IILjava/lang/Object;[Ljava/lang/Object;)I

    move-result v0

    const/4 v1, -0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_f

    move v0, v3

    goto :goto_38

    :cond_f
    iget v1, p0, Lxvj;->h:I

    if-ge v0, v1, :cond_38

    iget-object v1, p0, Lxvj;->a:[Ljava/lang/Object;

    aget-object v1, v1, v0

    iget-object v4, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v4, v1, p1}, Lqw4;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_38

    iget-object p2, p0, Lxvj;->f:Lqw4;

    invoke-virtual {p2, v1, p1}, Lqw4;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    iget-object v3, p0, Lxvj;->a:[Ljava/lang/Object;

    if-eqz p2, :cond_2c

    aput-object p1, v3, v0

    return v0

    :cond_2c
    aput-object p1, v3, v0

    iget-object p0, p0, Lxvj;->f:Lqw4;

    invoke-virtual {p0, v1, p1}, Lqw4;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, v2, p1}, Lqw4;->I(IILjava/lang/Object;)V

    return v0

    :cond_38
    :goto_38
    iget v1, p0, Lxvj;->h:I

    if-gt v0, v1, :cond_77

    iget-object v4, p0, Lxvj;->a:[Ljava/lang/Object;

    array-length v5, v4

    if-ne v1, v5, :cond_60

    array-length v1, v4

    add-int/lit8 v1, v1, 0xa

    iget-object v4, p0, Lxvj;->i:Ljava/lang/Class;

    invoke-static {v4, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    iget-object v4, p0, Lxvj;->a:[Ljava/lang/Object;

    invoke-static {v4, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    aput-object p1, v1, v0

    iget-object p1, p0, Lxvj;->a:[Ljava/lang/Object;

    add-int/lit8 v3, v0, 0x1

    iget v4, p0, Lxvj;->h:I

    sub-int/2addr v4, v0

    invoke-static {p1, v0, v1, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object v1, p0, Lxvj;->a:[Ljava/lang/Object;

    goto :goto_6a

    :cond_60
    add-int/lit8 v3, v0, 0x1

    sub-int/2addr v1, v0

    invoke-static {v4, v0, v4, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v1, p0, Lxvj;->a:[Ljava/lang/Object;

    aput-object p1, v1, v0

    :goto_6a
    iget p1, p0, Lxvj;->h:I

    add-int/2addr p1, v2

    iput p1, p0, Lxvj;->h:I

    if-eqz p2, :cond_76

    iget-object p0, p0, Lxvj;->f:Lqw4;

    invoke-interface {p0, v0, v2}, Lsic;->t(II)V

    :cond_76
    return v0

    :cond_77
    const-string p1, "cannot add item to "

    const-string p2, " because size is "

    invoke-static {v0, p1, p2}, Lp3p;->o(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p0, p0, Lxvj;->h:I

    invoke-static {p0, p1}, Lh9o;->g(ILjava/lang/StringBuilder;)V

    return v3
.end method

.method public final c(Ljava/util/Collection;)V
    .registers 14

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    iget-object v1, p0, Lxvj;->i:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Object;

    invoke-interface {p1, v0}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0}, Lxvj;->i()V

    array-length v0, p1

    if-eqz v0, :cond_f5

    array-length v0, p1

    const/4 v2, 0x1

    if-lt v0, v2, :cond_f5

    array-length v0, p1

    const/4 v3, 0x0

    if-nez v0, :cond_20

    move v4, v3

    goto :goto_61

    :cond_20
    iget-object v0, p0, Lxvj;->f:Lqw4;

    invoke-static {p1, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    move v0, v2

    move v4, v0

    move v5, v3

    :goto_28
    array-length v6, p1

    if-ge v0, v6, :cond_61

    aget-object v6, p1, v0

    iget-object v7, p0, Lxvj;->f:Lqw4;

    aget-object v8, p1, v5

    invoke-virtual {v7, v8, v6}, Lqw4;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v7

    if-nez v7, :cond_55

    move v7, v5

    :goto_38
    const/4 v8, -0x1

    if-ge v7, v4, :cond_48

    iget-object v9, p0, Lxvj;->f:Lqw4;

    aget-object v10, p1, v7

    invoke-virtual {v9, v10, v6}, Lqw4;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_49

    add-int/lit8 v7, v7, 0x1

    goto :goto_38

    :cond_48
    move v7, v8

    :cond_49
    if-eq v7, v8, :cond_4e

    aput-object v6, p1, v7

    goto :goto_5e

    :cond_4e
    if-eq v4, v0, :cond_52

    aput-object v6, p1, v4

    :cond_52
    add-int/lit8 v4, v4, 0x1

    goto :goto_5e

    :cond_55
    if-eq v4, v0, :cond_59

    aput-object v6, p1, v4

    :cond_59
    add-int/lit8 v5, v4, 0x1

    move v11, v5

    move v5, v4

    move v4, v11

    :goto_5e
    add-int/lit8 v0, v0, 0x1

    goto :goto_28

    :cond_61
    :goto_61
    iget v0, p0, Lxvj;->h:I

    if-nez v0, :cond_6f

    iput-object p1, p0, Lxvj;->a:[Ljava/lang/Object;

    iput v4, p0, Lxvj;->h:I

    iget-object p0, p0, Lxvj;->f:Lqw4;

    invoke-interface {p0, v3, v4}, Lsic;->t(II)V

    return-void

    :cond_6f
    iget-object v0, p0, Lxvj;->f:Lqw4;

    instance-of v0, v0, Lwvj;

    if-nez v0, :cond_8b

    invoke-virtual {p0}, Lxvj;->i()V

    iget-object v5, p0, Lxvj;->f:Lqw4;

    instance-of v6, v5, Lwvj;

    if-nez v6, :cond_8b

    iget-object v6, p0, Lxvj;->g:Lwvj;

    if-nez v6, :cond_89

    new-instance v6, Lwvj;

    invoke-direct {v6, v5}, Lwvj;-><init>(Lqw4;)V

    iput-object v6, p0, Lxvj;->g:Lwvj;

    :cond_89
    iput-object v6, p0, Lxvj;->f:Lqw4;

    :cond_8b
    iget-object v5, p0, Lxvj;->a:[Ljava/lang/Object;

    iput-object v5, p0, Lxvj;->b:[Ljava/lang/Object;

    iput v3, p0, Lxvj;->c:I

    iget v5, p0, Lxvj;->h:I

    iput v5, p0, Lxvj;->d:I

    add-int/2addr v5, v4

    add-int/lit8 v5, v5, 0xa

    invoke-static {v1, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/Object;

    iput-object v1, p0, Lxvj;->a:[Ljava/lang/Object;

    iput v3, p0, Lxvj;->e:I

    :cond_a2
    :goto_a2
    iget v1, p0, Lxvj;->c:I

    iget v5, p0, Lxvj;->d:I

    if-lt v1, v5, :cond_aa

    if-ge v3, v4, :cond_d6

    :cond_aa
    if-ne v1, v5, :cond_c5

    sub-int/2addr v4, v3

    iget-object v1, p0, Lxvj;->a:[Ljava/lang/Object;

    iget v2, p0, Lxvj;->e:I

    invoke-static {p1, v3, v1, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget p1, p0, Lxvj;->e:I

    add-int/2addr p1, v4

    iput p1, p0, Lxvj;->e:I

    iget v1, p0, Lxvj;->h:I

    add-int/2addr v1, v4

    iput v1, p0, Lxvj;->h:I

    iget-object v1, p0, Lxvj;->f:Lqw4;

    sub-int/2addr p1, v4

    invoke-interface {v1, p1, v4}, Lsic;->t(II)V

    goto :goto_d6

    :cond_c5
    iget-object v6, p0, Lxvj;->b:[Ljava/lang/Object;

    if-ne v3, v4, :cond_f6

    sub-int/2addr v5, v1

    iget-object p1, p0, Lxvj;->a:[Ljava/lang/Object;

    iget v2, p0, Lxvj;->e:I

    invoke-static {v6, v1, p1, v2, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget p1, p0, Lxvj;->e:I

    add-int/2addr p1, v5

    iput p1, p0, Lxvj;->e:I

    :cond_d6
    :goto_d6
    const/4 p1, 0x0

    iput-object p1, p0, Lxvj;->b:[Ljava/lang/Object;

    if-nez v0, :cond_f5

    invoke-virtual {p0}, Lxvj;->i()V

    iget-object p1, p0, Lxvj;->f:Lqw4;

    instance-of v0, p1, Lwvj;

    if-eqz v0, :cond_eb

    check-cast p1, Lwvj;

    iget-object p1, p1, Lwvj;->b:Ldc3;

    invoke-virtual {p1}, Ldc3;->a()V

    :cond_eb
    iget-object p1, p0, Lxvj;->f:Lqw4;

    iget-object v0, p0, Lxvj;->g:Lwvj;

    if-ne p1, v0, :cond_f5

    iget-object p1, v0, Lwvj;->a:Lqw4;

    iput-object p1, p0, Lxvj;->f:Lqw4;

    :cond_f5
    return-void

    :cond_f6
    aget-object v1, v6, v1

    aget-object v5, p1, v3

    iget-object v6, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v6, v1, v5}, Lqw4;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v6

    if-lez v6, :cond_119

    iget-object v1, p0, Lxvj;->a:[Ljava/lang/Object;

    iget v6, p0, Lxvj;->e:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lxvj;->e:I

    aput-object v5, v1, v6

    iget v1, p0, Lxvj;->h:I

    add-int/2addr v1, v2

    iput v1, p0, Lxvj;->h:I

    add-int/lit8 v3, v3, 0x1

    iget-object v1, p0, Lxvj;->f:Lqw4;

    invoke-interface {v1, v6, v2}, Lsic;->t(II)V

    goto :goto_a2

    :cond_119
    if-nez v6, :cond_14a

    iget-object v6, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v6, v1, v5}, Lqw4;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_14a

    iget-object v6, p0, Lxvj;->a:[Ljava/lang/Object;

    iget v7, p0, Lxvj;->e:I

    add-int/lit8 v8, v7, 0x1

    iput v8, p0, Lxvj;->e:I

    aput-object v5, v6, v7

    add-int/lit8 v3, v3, 0x1

    iget v6, p0, Lxvj;->c:I

    add-int/2addr v6, v2

    iput v6, p0, Lxvj;->c:I

    iget-object v6, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v6, v1, v5}, Lqw4;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_a2

    iget-object v6, p0, Lxvj;->f:Lqw4;

    iget v7, p0, Lxvj;->e:I

    sub-int/2addr v7, v2

    invoke-virtual {v6, v1, v5}, Lqw4;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v6, v7, v2, v1}, Lqw4;->I(IILjava/lang/Object;)V

    goto/16 :goto_a2

    :cond_14a
    iget-object v5, p0, Lxvj;->a:[Ljava/lang/Object;

    iget v6, p0, Lxvj;->e:I

    add-int/lit8 v7, v6, 0x1

    iput v7, p0, Lxvj;->e:I

    aput-object v1, v5, v6

    iget v1, p0, Lxvj;->c:I

    add-int/2addr v1, v2

    iput v1, p0, Lxvj;->c:I

    goto/16 :goto_a2
.end method

.method public final d()V
    .registers 5

    invoke-virtual {p0}, Lxvj;->i()V

    iget v0, p0, Lxvj;->h:I

    if-nez v0, :cond_8

    return-void

    :cond_8
    iget-object v1, p0, Lxvj;->a:[Ljava/lang/Object;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v1, v3, v0, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    iput v3, p0, Lxvj;->h:I

    iget-object p0, p0, Lxvj;->f:Lqw4;

    invoke-interface {p0, v3, v0}, Lsic;->f(II)V

    return-void
.end method

.method public final e(IILjava/lang/Object;[Ljava/lang/Object;)I
    .registers 11

    const/4 v0, 0x0

    :goto_1
    const/4 v1, -0x1

    const/4 v2, 0x1

    if-ge v0, p1, :cond_60

    add-int v3, v0, p1

    div-int/lit8 v3, v3, 0x2

    aget-object v4, p4, v3

    iget-object v5, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v5, v4, p3}, Lqw4;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    if-gez v5, :cond_17

    add-int/lit8 v3, v3, 0x1

    move v0, v3

    goto :goto_1

    :cond_17
    if-nez v5, :cond_5e

    iget-object p4, p0, Lxvj;->f:Lqw4;

    invoke-virtual {p4, v4, p3}, Lqw4;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p4

    if-nez p4, :cond_5c

    add-int/lit8 p4, v3, -0x1

    :goto_23
    if-lt p4, v0, :cond_3c

    iget-object v4, p0, Lxvj;->a:[Ljava/lang/Object;

    aget-object v4, v4, p4

    iget-object v5, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v5, v4, p3}, Lqw4;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    if-nez v5, :cond_3c

    iget-object v5, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v5, v4, p3}, Lqw4;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_58

    add-int/lit8 p4, p4, -0x1

    goto :goto_23

    :cond_3c
    add-int/lit8 p4, v3, 0x1

    :goto_3e
    if-ge p4, p1, :cond_57

    iget-object v0, p0, Lxvj;->a:[Ljava/lang/Object;

    aget-object v0, v0, p4

    iget-object v4, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v4, v0, p3}, Lqw4;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-nez v4, :cond_57

    iget-object v4, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v4, v0, p3}, Lqw4;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_58

    add-int/lit8 p4, p4, 0x1

    goto :goto_3e

    :cond_57
    move p4, v1

    :cond_58
    if-ne p2, v2, :cond_5d

    if-ne p4, v1, :cond_5d

    :cond_5c
    return v3

    :cond_5d
    return p4

    :cond_5e
    move p1, v3

    goto :goto_1

    :cond_60
    if-ne p2, v2, :cond_63

    return v0

    :cond_63
    return v1
.end method

.method public final f(I)Ljava/lang/Object;
    .registers 4

    iget v0, p0, Lxvj;->h:I

    if-ge p1, v0, :cond_1a

    if-ltz p1, :cond_1a

    iget-object v0, p0, Lxvj;->b:[Ljava/lang/Object;

    if-eqz v0, :cond_15

    iget v1, p0, Lxvj;->e:I

    if-lt p1, v1, :cond_15

    sub-int/2addr p1, v1

    iget p0, p0, Lxvj;->c:I

    add-int/2addr p1, p0

    aget-object p0, v0, p1

    return-object p0

    :cond_15
    iget-object p0, p0, Lxvj;->a:[Ljava/lang/Object;

    aget-object p0, p0, p1

    return-object p0

    :cond_1a
    const-string v0, "Asked to get item at "

    const-string v1, " but size is "

    invoke-static {p1, v0, v1}, Lp3p;->o(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget p0, p0, Lxvj;->h:I

    invoke-static {p0, p1}, Lh9o;->g(ILjava/lang/StringBuilder;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final g(Ljava/lang/Object;)V
    .registers 5

    invoke-virtual {p0}, Lxvj;->i()V

    iget-object v0, p0, Lxvj;->a:[Ljava/lang/Object;

    iget v1, p0, Lxvj;->h:I

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2, p1, v0}, Lxvj;->e(IILjava/lang/Object;[Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_10

    return-void

    :cond_10
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lxvj;->h(IZ)V

    return-void
.end method

.method public final h(IZ)V
    .registers 7

    iget-object v0, p0, Lxvj;->a:[Ljava/lang/Object;

    add-int/lit8 v1, p1, 0x1

    iget v2, p0, Lxvj;->h:I

    sub-int/2addr v2, p1

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-static {v0, v1, v0, p1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Lxvj;->h:I

    sub-int/2addr v0, v3

    iput v0, p0, Lxvj;->h:I

    iget-object v1, p0, Lxvj;->a:[Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v2, v1, v0

    if-eqz p2, :cond_1d

    iget-object p0, p0, Lxvj;->f:Lqw4;

    invoke-interface {p0, p1, v3}, Lsic;->f(II)V

    :cond_1d
    return-void
.end method

.method public final i()V
    .registers 1

    iget-object p0, p0, Lxvj;->b:[Ljava/lang/Object;

    if-nez p0, :cond_5

    return-void

    :cond_5
    const-string p0, "Data cannot be mutated in the middle of a batch update operation such as addAll or replaceAll."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method
