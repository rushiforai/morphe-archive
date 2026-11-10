.class public final LV/a;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Ljava/util/List;


# static fields
.field public static final d:[Ljava/lang/Object;


# instance fields
.field public a:I

.field public b:[Ljava/lang/Object;

.field public c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/Object;

    sput-object v0, LV/a;->d:[Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    sget-object v0, LV/a;->d:[Ljava/lang/Object;

    iput-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final a(ILjava/util/Collection;)V
    .locals 4

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v1, v1

    :goto_0
    if-ge p1, v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, p1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    iget p1, p0, LV/a;->a:I

    const/4 v1, 0x0

    :goto_1
    if-ge v1, p1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    iget p1, p0, LV/a;->c:I

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result p2

    add-int/2addr p2, p1

    iput p2, p0, LV/a;->c:I

    return-void
.end method

.method public final add(ILjava/lang/Object;)V
    .locals 7

    iget v0, p0, LV/a;->c:I

    if-ltz p1, :cond_7

    if-gt p1, v0, :cond_7

    if-ne p1, v0, :cond_0

    invoke-virtual {p0, p2}, LV/a;->addLast(Ljava/lang/Object;)V

    return-void

    :cond_0
    if-nez p1, :cond_1

    invoke-virtual {p0, p2}, LV/a;->addFirst(Ljava/lang/Object;)V

    return-void

    :cond_1
    const/4 v1, 0x1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, LV/a;->b(I)V

    iget v0, p0, LV/a;->a:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget v2, p0, LV/a;->c:I

    add-int/lit8 v3, v2, 0x1

    shr-int/2addr v3, v1

    const/4 v4, 0x0

    if-ge p1, v3, :cond_5

    const-string p1, "<this>"

    if-nez v0, :cond_2

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v0, p1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, v0

    :cond_2
    sub-int/2addr v0, v1

    iget v2, p0, LV/a;->a:I

    if-nez v2, :cond_3

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v2, p1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    array-length p1, v2

    sub-int/2addr p1, v1

    goto :goto_0

    :cond_3
    add-int/lit8 p1, v2, -0x1

    :goto_0
    iget v2, p0, LV/a;->a:I

    if-lt v0, v2, :cond_4

    iget-object v3, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v4, v3, v2

    aput-object v4, v3, p1

    add-int/lit8 v4, v2, 0x1

    add-int/lit8 v5, v0, 0x1

    invoke-static {v3, v3, v2, v4, v5}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_4
    iget-object v3, p0, LV/a;->b:[Ljava/lang/Object;

    add-int/lit8 v5, v2, -0x1

    array-length v6, v3

    invoke-static {v3, v3, v5, v2, v6}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v3, v2

    sub-int/2addr v3, v1

    aget-object v5, v2, v4

    aput-object v5, v2, v3

    add-int/lit8 v3, v0, 0x1

    invoke-static {v2, v2, v4, v1, v3}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_1
    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    aput-object p2, v2, v0

    iput p1, p0, LV/a;->a:I

    goto :goto_3

    :cond_5
    iget p1, p0, LV/a;->a:I

    add-int/2addr p1, v2

    invoke-virtual {p0, p1}, LV/a;->d(I)I

    move-result p1

    if-ge v0, p1, :cond_6

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    add-int/lit8 v3, v0, 0x1

    invoke-static {v2, v2, v3, v0, p1}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_2

    :cond_6
    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v2, v2, v1, v4, p1}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v2, p1

    sub-int/2addr v2, v1

    aget-object v2, p1, v2

    aput-object v2, p1, v4

    add-int/lit8 v2, v0, 0x1

    array-length v3, p1

    sub-int/2addr v3, v1

    invoke-static {p1, p1, v2, v0, v3}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_2
    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    aput-object p2, p1, v0

    :goto_3
    iget p1, p0, LV/a;->c:I

    add-int/2addr p1, v1

    iput p1, p0, LV/a;->c:I

    return-void

    :cond_7
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", size: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final add(Ljava/lang/Object;)Z
    .locals 0

    invoke-virtual {p0, p1}, LV/a;->addLast(Ljava/lang/Object;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final addAll(ILjava/util/Collection;)Z
    .locals 8

    const-string v0, "elements"

    invoke-static {p2, v0}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    iget v0, p0, LV/a;->c:I

    if-ltz p1, :cond_c

    if-gt p1, v0, :cond_c

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, LV/a;->c:I

    if-ne p1, v0, :cond_1

    invoke-virtual {p0, p2}, LV/a;->addAll(Ljava/util/Collection;)Z

    move-result p1

    return p1

    :cond_1
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {p0, v2}, LV/a;->b(I)V

    iget v0, p0, LV/a;->a:I

    iget v2, p0, LV/a;->c:I

    add-int/2addr v0, v2

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget v2, p0, LV/a;->a:I

    add-int/2addr v2, p1

    invoke-virtual {p0, v2}, LV/a;->d(I)I

    move-result v2

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v3

    iget v4, p0, LV/a;->c:I

    const/4 v5, 0x1

    add-int/2addr v4, v5

    shr-int/2addr v4, v5

    if-ge p1, v4, :cond_7

    iget p1, p0, LV/a;->a:I

    sub-int v0, p1, v3

    if-lt v2, p1, :cond_4

    if-ltz v0, :cond_2

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v1, v1, v0, p1, v2}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_2
    iget-object v4, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v6, v4

    add-int/2addr v0, v6

    sub-int v6, v2, p1

    array-length v7, v4

    sub-int/2addr v7, v0

    if-lt v7, v6, :cond_3

    invoke-static {v4, v4, v0, p1, v2}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_3
    add-int v6, p1, v7

    invoke-static {v4, v4, v0, p1, v6}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    iget v4, p0, LV/a;->a:I

    add-int/2addr v4, v7

    invoke-static {p1, p1, v1, v4, v2}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_4
    iget-object v4, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v6, v4

    invoke-static {v4, v4, v0, p1, v6}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    if-lt v3, v2, :cond_5

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v4, p1

    sub-int/2addr v4, v3

    invoke-static {p1, p1, v4, v1, v2}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_5
    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v4, p1

    sub-int/2addr v4, v3

    invoke-static {p1, p1, v4, v1, v3}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {p1, p1, v1, v3, v2}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_0
    iput v0, p0, LV/a;->a:I

    sub-int/2addr v2, v3

    if-gez v2, :cond_6

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v2, p1

    :cond_6
    invoke-virtual {p0, v2, p2}, LV/a;->a(ILjava/util/Collection;)V

    return v5

    :cond_7
    add-int p1, v2, v3

    if-ge v2, v0, :cond_a

    add-int/2addr v3, v0

    iget-object v4, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v6, v4

    if-gt v3, v6, :cond_8

    invoke-static {v4, v4, p1, v2, v0}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_8
    array-length v6, v4

    if-lt p1, v6, :cond_9

    array-length v1, v4

    sub-int/2addr p1, v1

    invoke-static {v4, v4, p1, v2, v0}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_9
    array-length v6, v4

    sub-int/2addr v3, v6

    sub-int v3, v0, v3

    invoke-static {v4, v4, v1, v3, v0}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v0, v0, p1, v2, v3}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_a
    iget-object v4, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v4, v4, v3, v1, v0}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v4, v0

    if-lt p1, v4, :cond_b

    array-length v1, v0

    sub-int/2addr p1, v1

    array-length v1, v0

    invoke-static {v0, v0, p1, v2, v1}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_b
    array-length v4, v0

    sub-int/2addr v4, v3

    array-length v6, v0

    invoke-static {v0, v0, v1, v4, v6}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v1, v0

    sub-int/2addr v1, v3

    invoke-static {v0, v0, p1, v2, v1}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_1
    invoke-virtual {p0, v2, p2}, LV/a;->a(ILjava/util/Collection;)V

    return v5

    :cond_c
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", size: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final addAll(Ljava/util/Collection;)Z
    .locals 2

    const-string v0, "elements"

    invoke-static {p1, v0}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget v0, p0, LV/a;->c:I

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, LV/a;->b(I)V

    iget v0, p0, LV/a;->a:I

    iget v1, p0, LV/a;->c:I

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    invoke-virtual {p0, v0, p1}, LV/a;->a(ILjava/util/Collection;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final addFirst(Ljava/lang/Object;)V
    .locals 2

    iget v0, p0, LV/a;->c:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, LV/a;->b(I)V

    iget v0, p0, LV/a;->a:I

    if-nez v0, :cond_0

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    iput v0, p0, LV/a;->a:I

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    aput-object p1, v1, v0

    iget p1, p0, LV/a;->c:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, LV/a;->c:I

    return-void
.end method

.method public final addLast(Ljava/lang/Object;)V
    .locals 3

    iget v0, p0, LV/a;->c:I

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, LV/a;->b(I)V

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    iget v1, p0, LV/a;->a:I

    iget v2, p0, LV/a;->c:I

    add-int/2addr v1, v2

    invoke-virtual {p0, v1}, LV/a;->d(I)I

    move-result v1

    aput-object p1, v0, v1

    iget p1, p0, LV/a;->c:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, LV/a;->c:I

    return-void
.end method

.method public final b(I)V
    .locals 4

    if-ltz p1, :cond_6

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v1, v0

    if-gt p1, v1, :cond_0

    return-void

    :cond_0
    sget-object v1, LV/a;->d:[Ljava/lang/Object;

    if-ne v0, v1, :cond_2

    const/16 v0, 0xa

    if-ge p1, v0, :cond_1

    move p1, v0

    :cond_1
    new-array p1, p1, [Ljava/lang/Object;

    iput-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    return-void

    :cond_2
    array-length v1, v0

    shr-int/lit8 v2, v1, 0x1

    add-int/2addr v1, v2

    sub-int v2, v1, p1

    if-gez v2, :cond_3

    move v1, p1

    :cond_3
    const v2, 0x7ffffff7

    sub-int v3, v1, v2

    if-lez v3, :cond_5

    if-le p1, v2, :cond_4

    const v1, 0x7fffffff

    goto :goto_0

    :cond_4
    move v1, v2

    :cond_5
    :goto_0
    new-array p1, v1, [Ljava/lang/Object;

    iget v1, p0, LV/a;->a:I

    array-length v2, v0

    const/4 v3, 0x0

    invoke-static {v0, p1, v3, v1, v2}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v1, v0

    iget v2, p0, LV/a;->a:I

    sub-int/2addr v1, v2

    invoke-static {v0, p1, v1, v3, v2}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iput v3, p0, LV/a;->a:I

    iput-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    return-void

    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Deque is too big."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final c(I)I
    .locals 2

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public final clear()V
    .locals 7

    iget v0, p0, LV/a;->a:I

    iget v1, p0, LV/a;->c:I

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget v1, p0, LV/a;->a:I

    const-string v2, "<this>"

    const/4 v3, 0x0

    const/4 v4, 0x0

    if-ge v1, v0, :cond_0

    iget-object v5, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v5, v2}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v5, v1, v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, LV/a;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    iget v5, p0, LV/a;->a:I

    array-length v6, v1

    invoke-static {v1, v5, v6, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v1, v2}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {v1, v4, v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    :cond_1
    :goto_0
    iput v4, p0, LV/a;->a:I

    iput v4, p0, LV/a;->c:I

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .locals 1

    invoke-virtual {p0, p1}, LV/a;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final d(I)I
    .locals 2

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v1, v0

    if-lt p1, v1, :cond_0

    array-length v0, v0

    sub-int/2addr p1, v0

    :cond_0
    return p1
.end method

.method public final get(I)Ljava/lang/Object;
    .locals 4

    iget v0, p0, LV/a;->c:I

    if-ltz p1, :cond_0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    iget v1, p0, LV/a;->a:I

    add-int/2addr v1, p1

    invoke-virtual {p0, v1}, LV/a;->d(I)I

    move-result p1

    aget-object p1, v0, p1

    return-object p1

    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "index: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", size: "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final indexOf(Ljava/lang/Object;)I
    .locals 4

    iget v0, p0, LV/a;->a:I

    iget v1, p0, LV/a;->c:I

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget v1, p0, LV/a;->a:I

    if-ge v1, v0, :cond_1

    :goto_0
    if-ge v1, v0, :cond_5

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-static {p1, v2}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget p1, p0, LV/a;->a:I

    :goto_1
    sub-int/2addr v1, p1

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    if-lt v1, v0, :cond_5

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v2, v2

    :goto_2
    if-ge v1, v2, :cond_3

    iget-object v3, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v3, v3, v1

    invoke-static {p1, v3}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget p1, p0, LV/a;->a:I

    goto :goto_1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_3
    const/4 v1, 0x0

    :goto_3
    if-ge v1, v0, :cond_5

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v2, v2, v1

    invoke-static {p1, v2}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v1, p1

    iget p1, p0, LV/a;->a:I

    goto :goto_1

    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_5
    const/4 p1, -0x1

    return p1
.end method

.method public final isEmpty()Z
    .locals 1

    iget v0, p0, LV/a;->c:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public final lastIndexOf(Ljava/lang/Object;)I
    .locals 4

    iget v0, p0, LV/a;->a:I

    iget v1, p0, LV/a;->c:I

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget v1, p0, LV/a;->a:I

    const/4 v2, -0x1

    if-ge v1, v0, :cond_1

    add-int/lit8 v0, v0, -0x1

    if-gt v1, v0, :cond_5

    :goto_0
    iget-object v3, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v3, v3, v0

    invoke-static {p1, v3}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    iget p1, p0, LV/a;->a:I

    :goto_1
    sub-int/2addr v0, p1

    return v0

    :cond_0
    if-eq v0, v1, :cond_5

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    if-le v1, v0, :cond_5

    add-int/lit8 v0, v0, -0x1

    :goto_2
    if-ge v2, v0, :cond_3

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v1, v1, v0

    invoke-static {p1, v1}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v0, p1

    iget p1, p0, LV/a;->a:I

    goto :goto_1

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_2

    :cond_3
    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    const-string v1, "<this>"

    invoke-static {v0, v1}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    iget v1, p0, LV/a;->a:I

    if-gt v1, v0, :cond_5

    :goto_3
    iget-object v3, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v3, v3, v0

    invoke-static {p1, v3}, Lb0/c;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    iget p1, p0, LV/a;->a:I

    goto :goto_1

    :cond_4
    if-eq v0, v1, :cond_5

    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    :cond_5
    return v2
.end method

.method public final remove(I)Ljava/lang/Object;
    .locals 8

    iget v0, p0, LV/a;->c:I

    if-ltz p1, :cond_5

    if-ge p1, v0, :cond_5

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    if-ne p1, v0, :cond_0

    invoke-virtual {p0}, LV/a;->removeLast()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_0
    if-nez p1, :cond_1

    invoke-virtual {p0}, LV/a;->removeFirst()Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_1
    iget v0, p0, LV/a;->a:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v3, v2, v0

    iget v4, p0, LV/a;->c:I

    shr-int/lit8 v5, v4, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    if-ge p1, v5, :cond_3

    iget p1, p0, LV/a;->a:I

    if-lt v0, p1, :cond_2

    add-int/lit8 v4, p1, 0x1

    invoke-static {v2, v2, v4, p1, v0}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_0

    :cond_2
    invoke-static {v2, v2, v1, v7, v0}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v0, p1

    sub-int/2addr v0, v1

    aget-object v0, p1, v0

    aput-object v0, p1, v7

    iget v0, p0, LV/a;->a:I

    add-int/lit8 v2, v0, 0x1

    array-length v4, p1

    sub-int/2addr v4, v1

    invoke-static {p1, p1, v2, v0, v4}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_0
    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    iget v0, p0, LV/a;->a:I

    aput-object v6, p1, v0

    invoke-virtual {p0, v0}, LV/a;->c(I)I

    move-result p1

    iput p1, p0, LV/a;->a:I

    goto :goto_2

    :cond_3
    iget p1, p0, LV/a;->a:I

    sub-int/2addr v4, v1

    add-int/2addr v4, p1

    invoke-virtual {p0, v4}, LV/a;->d(I)I

    move-result p1

    if-gt v0, p1, :cond_4

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    add-int/lit8 v4, v0, 0x1

    add-int/lit8 v5, p1, 0x1

    invoke-static {v2, v2, v0, v4, v5}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_4
    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    add-int/lit8 v4, v0, 0x1

    array-length v5, v2

    invoke-static {v2, v2, v0, v4, v5}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v2, v0

    sub-int/2addr v2, v1

    aget-object v4, v0, v7

    aput-object v4, v0, v2

    add-int/lit8 v2, p1, 0x1

    invoke-static {v0, v0, v7, v1, v2}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :goto_1
    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    aput-object v6, v0, p1

    :goto_2
    iget p1, p0, LV/a;->c:I

    sub-int/2addr p1, v1

    iput p1, p0, LV/a;->c:I

    return-object v3

    :cond_5
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "index: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", size: "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final remove(Ljava/lang/Object;)Z
    .locals 1

    invoke-virtual {p0, p1}, LV/a;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0, p1}, LV/a;->remove(I)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1
.end method

.method public final removeAll(Ljava/util/Collection;)Z
    .locals 11

    const-string v0, "elements"

    invoke-static {p1, v0}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, LV/a;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v0, v0

    if-nez v0, :cond_0

    goto/16 :goto_7

    :cond_0
    iget v0, p0, LV/a;->a:I

    iget v2, p0, LV/a;->c:I

    add-int/2addr v0, v2

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget v2, p0, LV/a;->a:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ge v2, v0, :cond_3

    move v5, v2

    :goto_0
    if-ge v2, v0, :cond_2

    iget-object v6, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v6, v6, v2

    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    iget-object v7, p0, LV/a;->b:[Ljava/lang/Object;

    add-int/lit8 v8, v5, 0x1

    aput-object v6, v7, v5

    move v5, v8

    goto :goto_1

    :cond_1
    move v1, v4

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    const-string v2, "<this>"

    invoke-static {p1, v2}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, v5, v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_6

    :cond_3
    iget-object v5, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v5, v5

    move v7, v1

    move v6, v2

    :goto_2
    if-ge v2, v5, :cond_5

    iget-object v8, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v9, v8, v2

    aput-object v3, v8, v2

    invoke-interface {p1, v9}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    iget-object v8, p0, LV/a;->b:[Ljava/lang/Object;

    add-int/lit8 v10, v6, 0x1

    aput-object v9, v8, v6

    move v6, v10

    goto :goto_3

    :cond_4
    move v7, v4

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_5
    invoke-virtual {p0, v6}, LV/a;->d(I)I

    move-result v2

    move v5, v2

    :goto_4
    if-ge v1, v0, :cond_7

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v6, v2, v1

    aput-object v3, v2, v1

    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_6

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    aput-object v6, v2, v5

    invoke-virtual {p0, v5}, LV/a;->c(I)I

    move-result v5

    goto :goto_5

    :cond_6
    move v7, v4

    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_7
    move v1, v7

    :goto_6
    if-eqz v1, :cond_9

    iget p1, p0, LV/a;->a:I

    sub-int/2addr v5, p1

    if-gez v5, :cond_8

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v5, p1

    :cond_8
    iput v5, p0, LV/a;->c:I

    :cond_9
    :goto_7
    return v1
.end method

.method public final removeFirst()Ljava/lang/Object;
    .locals 4

    invoke-virtual {p0}, LV/a;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    iget v1, p0, LV/a;->a:I

    aget-object v2, v0, v1

    const/4 v3, 0x0

    aput-object v3, v0, v1

    invoke-virtual {p0, v1}, LV/a;->c(I)I

    move-result v0

    iput v0, p0, LV/a;->a:I

    iget v0, p0, LV/a;->c:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, LV/a;->c:I

    return-object v2

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "ArrayDeque is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final removeLast()Ljava/lang/Object;
    .locals 4

    invoke-virtual {p0}, LV/a;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, LV/a;->a:I

    iget v1, p0, LV/a;->c:I

    add-int/lit8 v1, v1, -0x1

    add-int/2addr v1, v0

    invoke-virtual {p0, v1}, LV/a;->d(I)I

    move-result v0

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v2, v1, v0

    const/4 v3, 0x0

    aput-object v3, v1, v0

    iget v0, p0, LV/a;->c:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, LV/a;->c:I

    return-object v2

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    const-string v1, "ArrayDeque is empty."

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final retainAll(Ljava/util/Collection;)Z
    .locals 11

    const-string v0, "elements"

    invoke-static {p1, v0}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0}, LV/a;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_9

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v0, v0

    if-nez v0, :cond_0

    goto/16 :goto_7

    :cond_0
    iget v0, p0, LV/a;->a:I

    iget v2, p0, LV/a;->c:I

    add-int/2addr v0, v2

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget v2, p0, LV/a;->a:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ge v2, v0, :cond_3

    move v5, v2

    :goto_0
    if-ge v2, v0, :cond_2

    iget-object v6, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v6, v6, v2

    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, LV/a;->b:[Ljava/lang/Object;

    add-int/lit8 v8, v5, 0x1

    aput-object v6, v7, v5

    move v5, v8

    goto :goto_1

    :cond_1
    move v1, v4

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    const-string v2, "<this>"

    invoke-static {p1, v2}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p1, v5, v0, v3}, Ljava/util/Arrays;->fill([Ljava/lang/Object;IILjava/lang/Object;)V

    goto :goto_6

    :cond_3
    iget-object v5, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v5, v5

    move v7, v1

    move v6, v2

    :goto_2
    if-ge v2, v5, :cond_5

    iget-object v8, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v9, v8, v2

    aput-object v3, v8, v2

    invoke-interface {p1, v9}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_4

    iget-object v8, p0, LV/a;->b:[Ljava/lang/Object;

    add-int/lit8 v10, v6, 0x1

    aput-object v9, v8, v6

    move v6, v10

    goto :goto_3

    :cond_4
    move v7, v4

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_5
    invoke-virtual {p0, v6}, LV/a;->d(I)I

    move-result v2

    move v5, v2

    :goto_4
    if-ge v1, v0, :cond_7

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v6, v2, v1

    aput-object v3, v2, v1

    invoke-interface {p1, v6}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p0, LV/a;->b:[Ljava/lang/Object;

    aput-object v6, v2, v5

    invoke-virtual {p0, v5}, LV/a;->c(I)I

    move-result v5

    goto :goto_5

    :cond_6
    move v7, v4

    :goto_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_7
    move v1, v7

    :goto_6
    if-eqz v1, :cond_9

    iget p1, p0, LV/a;->a:I

    sub-int/2addr v5, p1

    if-gez v5, :cond_8

    iget-object p1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length p1, p1

    add-int/2addr v5, p1

    :cond_8
    iput v5, p0, LV/a;->c:I

    :cond_9
    :goto_7
    return v1
.end method

.method public final set(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 3

    iget v0, p0, LV/a;->c:I

    if-ltz p1, :cond_0

    if-ge p1, v0, :cond_0

    iget v0, p0, LV/a;->a:I

    add-int/2addr v0, p1

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result p1

    iget-object v0, p0, LV/a;->b:[Ljava/lang/Object;

    aget-object v1, v0, p1

    aput-object p2, v0, p1

    return-object v1

    :cond_0
    new-instance p2, Ljava/lang/IndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "index: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", size: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final size()I
    .locals 1

    iget v0, p0, LV/a;->c:I

    return v0
.end method

.method public final toArray()[Ljava/lang/Object;
    .locals 1

    iget v0, p0, LV/a;->c:I

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p0, v0}, LV/a;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5

    const-string v0, "array"

    invoke-static {p1, v0}, Lb0/c;->e(Ljava/lang/Object;Ljava/lang/String;)V

    array-length v0, p1

    iget v1, p0, LV/a;->c:I

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object p1

    const-string v0, "null cannot be cast to non-null type kotlin.Array<T of kotlin.collections.ArraysKt__ArraysJVMKt.arrayOfNulls>"

    invoke-static {p1, v0}, Lb0/c;->c(Ljava/lang/Object;Ljava/lang/String;)V

    check-cast p1, [Ljava/lang/Object;

    :goto_0
    iget v0, p0, LV/a;->a:I

    iget v1, p0, LV/a;->c:I

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, LV/a;->d(I)I

    move-result v0

    iget v1, p0, LV/a;->a:I

    const/4 v2, 0x0

    if-ge v1, v0, :cond_1

    iget-object v3, p0, LV/a;->b:[Ljava/lang/Object;

    invoke-static {v3, p1, v2, v1, v0}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, LV/a;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    iget v3, p0, LV/a;->a:I

    array-length v4, v1

    invoke-static {v1, p1, v2, v3, v4}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    iget-object v1, p0, LV/a;->b:[Ljava/lang/Object;

    array-length v3, v1

    iget v4, p0, LV/a;->a:I

    sub-int/2addr v3, v4

    invoke-static {v1, p1, v3, v2, v0}, LV/b;->V([Ljava/lang/Object;[Ljava/lang/Object;III)V

    :cond_2
    :goto_1
    array-length v0, p1

    iget v1, p0, LV/a;->c:I

    if-le v0, v1, :cond_3

    const/4 v0, 0x0

    aput-object v0, p1, v1

    :cond_3
    return-object p1
.end method
