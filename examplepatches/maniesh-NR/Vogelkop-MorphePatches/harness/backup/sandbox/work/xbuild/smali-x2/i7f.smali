.class public final Li7f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Iterable;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:I

.field public c:I

.field public d:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Li7f;->a:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)Z
    .registers 4

    if-eqz p1, :cond_14

    iget-object v0, p0, Li7f;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, p0, Li7f;->c:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Li7f;->c:I

    return v0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final c(Ljava/lang/Object;)Z
    .registers 5

    if-eqz p1, :cond_b

    iget-object v0, p0, Li7f;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_d

    :cond_b
    const/4 p0, 0x0

    return p0

    :cond_d
    iget v1, p0, Li7f;->b:I

    const/4 v2, 0x1

    if-nez v1, :cond_16

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1c

    :cond_16
    iput-boolean v2, p0, Li7f;->d:Z

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    :goto_1c
    iget p1, p0, Li7f;->c:I

    sub-int/2addr p1, v2

    iput p1, p0, Li7f;->c:I

    return v2
.end method

.method public final clear()V
    .registers 6

    const/4 v0, 0x0

    iput v0, p0, Li7f;->c:I

    iget v1, p0, Li7f;->b:I

    iget-object v2, p0, Li7f;->a:Ljava/util/ArrayList;

    if-nez v1, :cond_d

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    return-void

    :cond_d
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-boolean v3, p0, Li7f;->d:Z

    if-eqz v1, :cond_17

    const/4 v4, 0x1

    goto :goto_18

    :cond_17
    move v4, v0

    :goto_18
    or-int/2addr v3, v4

    iput-boolean v3, p0, Li7f;->d:Z

    :goto_1b
    if-ge v0, v1, :cond_24

    const/4 p0, 0x0

    invoke-virtual {v2, v0, p0}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_1b

    :cond_24
    return-void
.end method

.method public final iterator()Ljava/util/Iterator;
    .registers 2

    new-instance v0, Lg7f;

    invoke-direct {v0, p0}, Lg7f;-><init>(Li7f;)V

    return-object v0
.end method
