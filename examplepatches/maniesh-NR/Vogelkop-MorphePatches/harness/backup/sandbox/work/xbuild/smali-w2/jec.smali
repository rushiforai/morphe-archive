.class public final Ljec;
.super Ljava/util/AbstractList;
.source "SourceFile"

# interfaces
.implements Lj$/util/Collection;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:I

.field public c:I


# direct methods
.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Ljava/util/AbstractList;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ljec;->a:Ljava/util/ArrayList;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Ljec;->b:I

    return-void
.end method


# virtual methods
.method public final add(ILjava/lang/Object;)V
    .registers 7

    iget-object v0, p0, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_c

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p1

    :cond_c
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Ljec;->b:I

    if-ge v1, v2, :cond_1c

    iget p0, p0, Ljec;->c:I

    add-int/2addr p0, p1

    rem-int/2addr p0, v2

    invoke-virtual {v0, p0, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-void

    :cond_1c
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v3, 0x0

    if-ne p1, v1, :cond_33

    iget p1, p0, Ljec;->c:I

    add-int/lit8 v1, p1, 0x1

    iput v1, p0, Ljec;->c:I

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    iget p1, p0, Ljec;->c:I

    if-ne p1, v2, :cond_4d

    iput v3, p0, Ljec;->c:I

    return-void

    :cond_33
    if-lez p1, :cond_4d

    iget v1, p0, Ljec;->c:I

    add-int/2addr v1, p1

    rem-int/2addr v1, v2

    invoke-virtual {v0, v1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    iget p1, p0, Ljec;->c:I

    if-gt v1, p1, :cond_44

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Ljec;->c:I

    :cond_44
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    iget p1, p0, Ljec;->c:I

    if-ne p1, v2, :cond_4d

    iput v3, p0, Ljec;->c:I

    :cond_4d
    return-void
.end method

.method public final clear()V
    .registers 2

    iget-object v0, p0, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    iput v0, p0, Ljec;->c:I

    return-void
.end method

.method public final get(I)Ljava/lang/Object;
    .registers 3

    iget v0, p0, Ljec;->c:I

    add-int/2addr v0, p1

    iget p1, p0, Ljec;->b:I

    rem-int/2addr v0, p1

    iget-object p0, p0, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final remove(I)Ljava/lang/Object;
    .registers 5

    iget-object v0, p0, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Ljec;->b:I

    if-ne v1, v2, :cond_15

    iget v1, p0, Ljec;->c:I

    if-lez v1, :cond_15

    neg-int v1, v1

    invoke-static {v0, v1}, Ljava/util/Collections;->rotate(Ljava/util/List;I)V

    const/4 v1, 0x0

    iput v1, p0, Ljec;->c:I

    :cond_15
    iget p0, p0, Ljec;->c:I

    add-int/2addr p0, p1

    rem-int/2addr p0, v2

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 4

    iget v0, p0, Ljec;->c:I

    add-int/2addr v0, p1

    iget p1, p0, Ljec;->b:I

    rem-int/2addr v0, p1

    iget-object p0, p0, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v0, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final size()I
    .registers 1

    iget-object p0, p0, Ljec;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method
