.class public final Liij;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljij;


# instance fields
.field public final a:I


# direct methods
.method public constructor <init>(I)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Liij;->a:I

    return-void
.end method


# virtual methods
.method public final a(II)Ljij;
    .registers 4

    new-instance v0, Liij;

    iget p0, p0, Liij;->a:I

    sub-int/2addr p0, p2

    add-int/2addr p0, p1

    invoke-direct {v0, p0}, Liij;-><init>(I)V

    return-object v0
.end method

.method public final cloneAndClear()Ljij;
    .registers 2

    new-instance p0, Liij;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Liij;-><init>(I)V

    return-object p0
.end method

.method public final cloneAndInsert(II)Ljij;
    .registers 3

    new-instance p1, Liij;

    iget p0, p0, Liij;->a:I

    add-int/2addr p0, p2

    invoke-direct {p1, p0}, Liij;-><init>(I)V

    return-object p1
.end method

.method public final getFirstIndex()I
    .registers 1

    iget p0, p0, Liij;->a:I

    if-lez p0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    const/4 p0, -0x1

    return p0
.end method

.method public final getLastIndex()I
    .registers 1

    iget p0, p0, Liij;->a:I

    if-lez p0, :cond_7

    add-int/lit8 p0, p0, -0x1

    return p0

    :cond_7
    const/4 p0, -0x1

    return p0
.end method

.method public final getLength()I
    .registers 1

    iget p0, p0, Liij;->a:I

    return p0
.end method

.method public final getNextIndex(I)I
    .registers 2

    add-int/lit8 p1, p1, 0x1

    iget p0, p0, Liij;->a:I

    if-ge p1, p0, :cond_7

    return p1

    :cond_7
    const/4 p0, -0x1

    return p0
.end method

.method public final getPreviousIndex(I)I
    .registers 2

    const/4 p0, -0x1

    add-int/2addr p1, p0

    if-ltz p1, :cond_5

    return p1

    :cond_5
    return p0
.end method
