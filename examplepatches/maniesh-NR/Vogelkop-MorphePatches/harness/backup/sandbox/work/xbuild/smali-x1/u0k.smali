.class public abstract Lu0k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;


# instance fields
.field public a:I

.field public b:Ljava/lang/String;

.field public final c:Ljava/lang/CharSequence;

.field public final d:Lot4;

.field public final e:Z

.field public f:I

.field public g:I


# direct methods
.method public constructor <init>(Lvr3;Ljava/lang/CharSequence;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x2

    iput v0, p0, Lu0k;->a:I

    const/4 v0, 0x0

    iput v0, p0, Lu0k;->f:I

    iget-object v0, p1, Lvr3;->c:Ljava/lang/Object;

    check-cast v0, Lot4;

    iput-object v0, p0, Lu0k;->d:Lot4;

    iget-boolean v0, p1, Lvr3;->b:Z

    iput-boolean v0, p0, Lu0k;->e:Z

    iget p1, p1, Lvr3;->a:I

    iput p1, p0, Lu0k;->g:I

    iput-object p2, p0, Lu0k;->c:Ljava/lang/CharSequence;

    return-void
.end method


# virtual methods
.method public a(I)I
    .registers 2

    return p1
.end method

.method public b(I)I
    .registers 2

    add-int/lit16 p1, p1, 0xfa0

    iget-object p0, p0, Lu0k;->c:Ljava/lang/CharSequence;

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result p0

    if-ge p1, p0, :cond_b

    return p1

    :cond_b
    const/4 p0, -0x1

    return p0
.end method

.method public final hasNext()Z
    .registers 10

    iget v0, p0, Lu0k;->a:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x4

    if-eq v0, v3, :cond_9

    move v0, v2

    goto :goto_a

    :cond_9
    move v0, v1

    :goto_a
    invoke-static {v0}, Lz4o;->H(Z)V

    iget v0, p0, Lu0k;->a:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_90

    const/4 v4, 0x2

    if-eq v0, v4, :cond_8f

    iput v3, p0, Lu0k;->a:I

    iget v0, p0, Lu0k;->f:I

    :cond_1c
    :goto_1c
    iget v3, p0, Lu0k;->f:I

    const/4 v4, 0x3

    const/4 v5, -0x1

    if-eq v3, v5, :cond_83

    invoke-virtual {p0, v3}, Lu0k;->b(I)I

    move-result v3

    iget-object v6, p0, Lu0k;->c:Ljava/lang/CharSequence;

    if-ne v3, v5, :cond_32

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v3

    iput v5, p0, Lu0k;->f:I

    move v7, v5

    goto :goto_38

    :cond_32
    invoke-virtual {p0, v3}, Lu0k;->a(I)I

    move-result v7

    iput v7, p0, Lu0k;->f:I

    :goto_38
    if-ne v7, v0, :cond_47

    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Lu0k;->f:I

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-le v7, v3, :cond_1c

    iput v5, p0, Lu0k;->f:I

    goto :goto_1c

    :cond_47
    iget-object v7, p0, Lu0k;->d:Lot4;

    if-ge v0, v3, :cond_59

    invoke-interface {v6, v0}, Ljava/lang/CharSequence;->charAt(I)C

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    add-int/lit8 v8, v3, -0x1

    invoke-interface {v6, v8}, Ljava/lang/CharSequence;->charAt(I)C

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_59
    iget-boolean v8, p0, Lu0k;->e:Z

    if-eqz v8, :cond_62

    if-ne v0, v3, :cond_62

    iget v0, p0, Lu0k;->f:I

    goto :goto_1c

    :cond_62
    iget v8, p0, Lu0k;->g:I

    if-ne v8, v2, :cond_77

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v3

    iput v5, p0, Lu0k;->f:I

    if-le v3, v0, :cond_7a

    add-int/lit8 v5, v3, -0x1

    invoke-interface {v6, v5}, Ljava/lang/CharSequence;->charAt(I)C

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_7a

    :cond_77
    sub-int/2addr v8, v2

    iput v8, p0, Lu0k;->g:I

    :cond_7a
    :goto_7a
    invoke-interface {v6, v0, v3}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_86

    :cond_83
    iput v4, p0, Lu0k;->a:I

    const/4 v0, 0x0

    :goto_86
    iput-object v0, p0, Lu0k;->b:Ljava/lang/String;

    iget v0, p0, Lu0k;->a:I

    if-eq v0, v4, :cond_8f

    iput v2, p0, Lu0k;->a:I

    return v2

    :cond_8f
    return v1

    :cond_90
    return v2
.end method

.method public final next()Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0}, Lu0k;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_f

    const/4 v0, 0x2

    iput v0, p0, Lu0k;->a:I

    iget-object v0, p0, Lu0k;->b:Ljava/lang/String;

    const/4 v1, 0x0

    iput-object v1, p0, Lu0k;->b:Ljava/lang/String;

    return-object v0

    :cond_f
    invoke-static {}, Lt3p;->y()V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final remove()V
    .registers 1

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method
