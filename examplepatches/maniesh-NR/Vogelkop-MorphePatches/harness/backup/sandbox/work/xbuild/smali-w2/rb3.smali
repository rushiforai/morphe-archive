.class public final Lrb3;
.super Lgql;
.source "SourceFile"


# static fields
.field public static final g:Lrb3;


# instance fields
.field public final e:Ljij;

.field public final f:[Lqb3;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lrb3;

    const/4 v1, 0x0

    new-array v2, v1, [Lqb3;

    new-instance v3, Liij;

    invoke-direct {v3, v1}, Liij;-><init>(I)V

    invoke-direct {v0, v2, v3}, Lrb3;-><init>([Lqb3;Ljij;)V

    sput-object v0, Lrb3;->g:Lrb3;

    return-void
.end method

.method public constructor <init>([Lqb3;Ljij;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lrb3;->e:Ljij;

    iput-object p1, p0, Lrb3;->f:[Lqb3;

    return-void
.end method


# virtual methods
.method public final a(Z)I
    .registers 3

    invoke-virtual {p0}, Lgql;->p()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, -0x1

    return p0

    :cond_8
    if-eqz p1, :cond_11

    iget-object p0, p0, Lrb3;->e:Ljij;

    invoke-interface {p0}, Ljij;->getFirstIndex()I

    move-result p0

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method

.method public final b(Ljava/lang/Object;)I
    .registers 5

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lrb3;->f:[Lqb3;

    array-length v2, v1

    if-ge v0, v2, :cond_e

    aget-object v1, v1, v0

    if-ne v1, p1, :cond_b

    return v0

    :cond_b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_e
    const/4 p0, -0x1

    return p0
.end method

.method public final c(Z)I
    .registers 3

    invoke-virtual {p0}, Lgql;->p()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, -0x1

    return p0

    :cond_8
    if-eqz p1, :cond_11

    iget-object p0, p0, Lrb3;->e:Ljij;

    invoke-interface {p0}, Ljij;->getLastIndex()I

    move-result p0

    return p0

    :cond_11
    iget-object p0, p0, Lrb3;->f:[Lqb3;

    array-length p0, p0

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method public final e(IIZ)I
    .registers 7

    iget-object v0, p0, Lrb3;->e:Ljij;

    const/4 v1, 0x1

    if-eqz p2, :cond_22

    if-eq p2, v1, :cond_21

    const/4 v2, 0x2

    if-ne p2, v2, :cond_1c

    invoke-virtual {p0, p3}, Lrb3;->c(Z)I

    move-result p2

    if-ne p1, p2, :cond_15

    invoke-virtual {p0, p3}, Lrb3;->a(Z)I

    move-result p0

    return p0

    :cond_15
    if-eqz p3, :cond_31

    invoke-interface {v0, p1}, Ljij;->getNextIndex(I)I

    move-result p0

    return p0

    :cond_1c
    invoke-static {}, Lh9o;->e()V

    const/4 p0, 0x0

    return p0

    :cond_21
    return p1

    :cond_22
    invoke-virtual {p0, p3}, Lrb3;->c(Z)I

    move-result p0

    if-ne p1, p0, :cond_2a

    const/4 p0, -0x1

    return p0

    :cond_2a
    if-eqz p3, :cond_31

    invoke-interface {v0, p1}, Ljij;->getNextIndex(I)I

    move-result p0

    return p0

    :cond_31
    add-int/2addr p1, v1

    return p1
.end method

.method public final f(ILdql;Z)Ldql;
    .registers 12

    iget-object p0, p0, Lrb3;->f:[Lqb3;

    aget-object v1, p0, p1

    iget-wide v4, v1, Lqb3;->b:J

    const-wide/16 v6, 0x0

    move-object v2, v1

    move v3, p1

    move-object v0, p2

    invoke-virtual/range {v0 .. v7}, Ldql;->i(Ljava/lang/Object;Ljava/lang/Object;IJJ)V

    return-object v0
.end method

.method public final h()I
    .registers 1

    iget-object p0, p0, Lrb3;->f:[Lqb3;

    array-length p0, p0

    return p0
.end method

.method public final k(IIZ)I
    .registers 7

    iget-object v0, p0, Lrb3;->e:Ljij;

    const/4 v1, 0x1

    if-eqz p2, :cond_22

    if-eq p2, v1, :cond_21

    const/4 v2, 0x2

    if-ne p2, v2, :cond_1c

    invoke-virtual {p0, p3}, Lrb3;->a(Z)I

    move-result p2

    if-ne p1, p2, :cond_15

    invoke-virtual {p0, p3}, Lrb3;->c(Z)I

    move-result p0

    return p0

    :cond_15
    if-eqz p3, :cond_31

    invoke-interface {v0, p1}, Ljij;->getPreviousIndex(I)I

    move-result p0

    return p0

    :cond_1c
    invoke-static {}, Lh9o;->e()V

    const/4 p0, 0x0

    return p0

    :cond_21
    return p1

    :cond_22
    invoke-virtual {p0, p3}, Lrb3;->a(Z)I

    move-result p0

    if-ne p1, p0, :cond_2a

    const/4 p0, -0x1

    return p0

    :cond_2a
    if-eqz p3, :cond_31

    invoke-interface {v0, p1}, Ljij;->getPreviousIndex(I)I

    move-result p0

    return p0

    :cond_31
    sub-int/2addr p1, v1

    return p1
.end method

.method public final l(I)Ljava/lang/Object;
    .registers 2

    iget-object p0, p0, Lrb3;->f:[Lqb3;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(ILfql;J)Lfql;
    .registers 27

    move-object/from16 v0, p0

    iget-object v0, v0, Lrb3;->f:[Lqb3;

    aget-object v2, v0, p1

    iget-wide v0, v2, Lqb3;->b:J

    const-wide v3, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v3, v0, v3

    if-nez v3, :cond_14

    const/4 v3, 0x1

    :goto_12
    move v12, v3

    goto :goto_16

    :cond_14
    const/4 v3, 0x0

    goto :goto_12

    :goto_16
    iget-object v3, v2, Lqb3;->a:Lqjd;

    xor-int/lit8 v11, v12, 0x1

    iget-boolean v4, v2, Lqb3;->c:Z

    if-eqz v4, :cond_22

    iget-object v4, v3, Lqjd;->d:Lljd;

    :goto_20
    move-object v13, v4

    goto :goto_24

    :cond_22
    const/4 v4, 0x0

    goto :goto_20

    :goto_24
    const-wide/16 v14, 0x0

    const-wide/16 v20, 0x0

    const/4 v4, 0x0

    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    const-wide v7, -0x7fffffffffffffffL    # -4.9E-324

    const-wide v9, -0x7fffffffffffffffL    # -4.9E-324

    move/from16 v19, p1

    move/from16 v18, p1

    move-wide/from16 v16, v0

    move-object/from16 v1, p2

    invoke-virtual/range {v1 .. v21}, Lfql;->b(Ljava/lang/Object;Lqjd;Ljava/lang/Object;JJJZZLljd;JJIIJ)V

    return-object p2
.end method

.method public final o()I
    .registers 1

    iget-object p0, p0, Lrb3;->f:[Lqb3;

    array-length p0, p0

    return p0
.end method
