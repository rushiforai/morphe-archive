.class public final Lg7f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public final synthetic a:B

.field public b:I

.field public c:I

.field public d:Z

.field public final synthetic e:Ljava/lang/Iterable;


# direct methods
.method public constructor <init>(Lh7f;)V
    .registers 4

    const/4 v0, 0x0

    iput-byte v0, p0, Lg7f;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lg7f;->e:Ljava/lang/Iterable;

    iget v1, p1, Lh7f;->b:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p1, Lh7f;->b:I

    iget-object p1, p1, Lh7f;->a:Ljava/util/ArrayList;

    if-eqz p1, :cond_19

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    :cond_19
    iput v0, p0, Lg7f;->b:I

    return-void
.end method

.method public constructor <init>(Li7f;)V
    .registers 4

    const/4 v0, 0x1

    iput-byte v0, p0, Lg7f;->a:B

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lg7f;->e:Ljava/lang/Iterable;

    .line 29
    iget v1, p1, Li7f;->b:I

    add-int/2addr v1, v0

    iput v1, p1, Li7f;->b:I

    .line 30
    iget-object p1, p1, Li7f;->a:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    .line 31
    iput p1, p0, Lg7f;->b:I

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 5

    iget-byte v0, p0, Lg7f;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lg7f;->e:Ljava/lang/Iterable;

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_5e

    iget-boolean v0, p0, Lg7f;->d:Z

    if-nez v0, :cond_33

    iput-boolean v3, p0, Lg7f;->d:Z

    check-cast v2, Li7f;

    iget p0, v2, Li7f;->b:I

    sub-int/2addr p0, v3

    iput p0, v2, Li7f;->b:I

    if-gtz p0, :cond_33

    iget-boolean p0, v2, Li7f;->d:Z

    if-eqz p0, :cond_33

    iput-boolean v1, v2, Li7f;->d:Z

    iget-object p0, v2, Li7f;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    sub-int/2addr v0, v3

    :goto_25
    if-ltz v0, :cond_33

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_30

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_30
    add-int/lit8 v0, v0, -0x1

    goto :goto_25

    :cond_33
    return-void

    :pswitch_34
    iget-boolean v0, p0, Lg7f;->d:Z

    if-nez v0, :cond_5c

    iput-boolean v3, p0, Lg7f;->d:Z

    check-cast v2, Lh7f;

    iget p0, v2, Lh7f;->b:I

    sub-int/2addr p0, v3

    iput p0, v2, Lh7f;->b:I

    if-gtz p0, :cond_5c

    iget-boolean p0, v2, Lh7f;->d:Z

    if-eqz p0, :cond_5c

    iput-boolean v1, v2, Lh7f;->d:Z

    iget-object p0, v2, Lh7f;->a:Ljava/util/ArrayList;

    if-eqz p0, :cond_5c

    iget v0, v2, Lh7f;->c:I

    const/4 v1, 0x0

    if-nez v0, :cond_55

    iput-object v1, v2, Lh7f;->a:Ljava/util/ArrayList;

    goto :goto_5c

    :cond_55
    invoke-static {v1}, Ljava/util/Collections;->singleton(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    :cond_5c
    :goto_5c
    return-void

    nop

    :pswitch_data_5e
    .packed-switch 0x0
        :pswitch_34
    .end packed-switch
.end method

.method public final b()V
    .registers 3

    iget-object v0, p0, Lg7f;->e:Ljava/lang/Iterable;

    check-cast v0, Lh7f;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lg7f;->a()V

    iget v1, v0, Lh7f;->b:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lh7f;->b:I

    iget-object v0, v0, Lh7f;->a:Ljava/util/ArrayList;

    const/4 v1, 0x0

    if-nez v0, :cond_17

    move v0, v1

    goto :goto_1b

    :cond_17
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_1b
    iput v0, p0, Lg7f;->b:I

    iput-boolean v1, p0, Lg7f;->d:Z

    iput v1, p0, Lg7f;->c:I

    return-void
.end method

.method public final hasNext()Z
    .registers 7

    iget-byte v0, p0, Lg7f;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lg7f;->e:Ljava/lang/Iterable;

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_48

    iget v0, p0, Lg7f;->b:I

    check-cast v2, Li7f;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v4, p0, Lg7f;->c:I

    :goto_12
    if-ge v4, v0, :cond_21

    iget-object v5, v2, Li7f;->a:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    if-nez v5, :cond_1f

    add-int/lit8 v4, v4, 0x1

    goto :goto_12

    :cond_1f
    move v1, v3

    goto :goto_24

    :cond_21
    invoke-virtual {p0}, Lg7f;->a()V

    :goto_24
    return v1

    :pswitch_25
    check-cast v2, Lh7f;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Lg7f;->c:I

    :goto_2c
    iget v4, p0, Lg7f;->b:I

    if-ge v0, v4, :cond_3b

    iget-object v4, v2, Lh7f;->a:Ljava/util/ArrayList;

    invoke-virtual {v4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    if-nez v4, :cond_3b

    add-int/lit8 v0, v0, 0x1

    goto :goto_2c

    :cond_3b
    iput v0, p0, Lg7f;->c:I

    iget v2, p0, Lg7f;->b:I

    if-ge v0, v2, :cond_43

    move v1, v3

    goto :goto_46

    :cond_43
    invoke-virtual {p0}, Lg7f;->a()V

    :goto_46
    return v1

    nop

    :pswitch_data_48
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method

.method public final next()Ljava/lang/Object;
    .registers 5

    iget-byte v0, p0, Lg7f;->a:B

    const/4 v1, 0x0

    iget-object v2, p0, Lg7f;->e:Ljava/lang/Iterable;

    packed-switch v0, :pswitch_data_52

    iget v0, p0, Lg7f;->b:I

    check-cast v2, Li7f;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v2, Li7f;->a:Ljava/util/ArrayList;

    :goto_11
    iget v3, p0, Lg7f;->c:I

    if-ge v3, v0, :cond_22

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_22

    iget v3, p0, Lg7f;->c:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lg7f;->c:I

    goto :goto_11

    :cond_22
    iget v3, p0, Lg7f;->c:I

    if-ge v3, v0, :cond_2f

    add-int/lit8 v0, v3, 0x1

    iput v0, p0, Lg7f;->c:I

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_35

    :cond_2f
    invoke-virtual {p0}, Lg7f;->a()V

    invoke-static {}, Lt3p;->y()V

    :goto_35
    return-object v1

    :pswitch_36
    check-cast v2, Lh7f;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4e

    iget v0, p0, Lg7f;->c:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lg7f;->c:I

    iget-object p0, v2, Lh7f;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    goto :goto_51

    :cond_4e
    invoke-static {}, Lt3p;->y()V

    :goto_51
    return-object v1

    :pswitch_data_52
    .packed-switch 0x0
        :pswitch_36
    .end packed-switch
.end method

.method public final remove()V
    .registers 1

    iget-byte p0, p0, Lg7f;->a:B

    packed-switch p0, :pswitch_data_12

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0

    :pswitch_b
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
