.class public final Lqhl;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lsf1;

.field public final b:J

.field public final c:Lnjl;

.field public final d:Li9f;

.field public final e:Lwjl;

.field public f:J

.field public final g:Lsf1;

.field public final h:Lmil;

.field public final i:Lojl;


# direct methods
.method public constructor <init>(Lmil;Li9f;Lojl;Lwjl;)V
    .registers 9

    iget-object v0, p1, Lmil;->a:Lsf1;

    iget-wide v1, p1, Lmil;->b:J

    if-eqz p3, :cond_9

    iget-object v3, p3, Lojl;->a:Lnjl;

    goto :goto_a

    :cond_9
    const/4 v3, 0x0

    :goto_a
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lqhl;->a:Lsf1;

    iput-wide v1, p0, Lqhl;->b:J

    iput-object v3, p0, Lqhl;->c:Lnjl;

    iput-object p2, p0, Lqhl;->d:Li9f;

    iput-object p4, p0, Lqhl;->e:Lwjl;

    iput-wide v1, p0, Lqhl;->f:J

    iput-object v0, p0, Lqhl;->g:Lsf1;

    iput-object p1, p0, Lqhl;->h:Lmil;

    iput-object p3, p0, Lqhl;->i:Lojl;

    return-void
.end method


# virtual methods
.method public final a(Lkotlin/jvm/functions/Function1;)Ljava/util/List;
    .registers 7

    iget-wide v0, p0, Lqhl;->f:J

    invoke-static {v0, v1}, Lxjl;->c(J)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lus7;

    if-eqz p0, :cond_15

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_15
    const/4 p0, 0x0

    return-object p0

    :cond_17
    new-instance p1, Lyb5;

    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p1, v0, v1}, Lyb5;-><init>(Ljava/lang/String;I)V

    new-instance v0, Ls4j;

    iget-wide v2, p0, Lqhl;->f:J

    invoke-static {v2, v3}, Lxjl;->f(J)I

    move-result v2

    iget-wide v3, p0, Lqhl;->f:J

    invoke-static {v3, v4}, Lxjl;->f(J)I

    move-result p0

    invoke-direct {v0, v2, p0}, Ls4j;-><init>(II)V

    const/4 p0, 0x2

    new-array p0, p0, [Lus7;

    aput-object p1, p0, v1

    const/4 p1, 0x1

    aput-object v0, p0, p1

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public final b()Ljava/lang/Integer;
    .registers 4

    iget-object v0, p0, Lqhl;->c:Lnjl;

    if-eqz v0, :cond_24

    iget-object v0, v0, Lnjl;->b:Lxbe;

    iget-wide v1, p0, Lqhl;->f:J

    invoke-static {v1, v2}, Lxjl;->e(J)I

    move-result v1

    iget-object p0, p0, Lqhl;->d:Li9f;

    invoke-interface {p0, v1}, Li9f;->i(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lxbe;->d(I)I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lxbe;->c(IZ)I

    move-result v0

    invoke-interface {p0, v0}, Li9f;->g(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_24
    const/4 p0, 0x0

    return-object p0
.end method

.method public final c()Ljava/lang/Integer;
    .registers 4

    iget-object v0, p0, Lqhl;->c:Lnjl;

    if-eqz v0, :cond_23

    iget-wide v1, p0, Lqhl;->f:J

    invoke-static {v1, v2}, Lxjl;->f(J)I

    move-result v1

    iget-object p0, p0, Lqhl;->d:Li9f;

    invoke-interface {p0, v1}, Li9f;->i(I)I

    move-result v1

    iget-object v2, v0, Lnjl;->b:Lxbe;

    invoke-virtual {v2, v1}, Lxbe;->d(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lnjl;->g(I)I

    move-result v0

    invoke-interface {p0, v0}, Li9f;->g(I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_23
    const/4 p0, 0x0

    return-object p0
.end method

.method public final d()Ljava/lang/Integer;
    .registers 7

    iget-object v0, p0, Lqhl;->c:Lnjl;

    if-eqz v0, :cond_43

    invoke-virtual {p0}, Lqhl;->r()I

    move-result v1

    :goto_8
    iget-object v2, p0, Lqhl;->a:Lsf1;

    iget-object v3, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lt v1, v3, :cond_19

    iget-object p0, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    goto :goto_3e

    :cond_19
    iget-object v2, p0, Lqhl;->g:Lsf1;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-gt v1, v2, :cond_26

    move v2, v1

    :cond_26
    invoke-virtual {v0, v2}, Lnjl;->j(I)J

    move-result-wide v2

    sget v4, Lxjl;->c:I

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    long-to-int v2, v2

    if-gt v2, v1, :cond_38

    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_38
    iget-object p0, p0, Lqhl;->d:Li9f;

    invoke-interface {p0, v2}, Li9f;->g(I)I

    move-result p0

    :goto_3e
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_43
    const/4 p0, 0x0

    return-object p0
.end method

.method public final e()Ljava/lang/Integer;
    .registers 6

    iget-object v0, p0, Lqhl;->c:Lnjl;

    if-eqz v0, :cond_33

    invoke-virtual {p0}, Lqhl;->r()I

    move-result v1

    :goto_8
    if-gtz v1, :cond_c

    const/4 p0, 0x0

    goto :goto_2e

    :cond_c
    iget-object v2, p0, Lqhl;->g:Lsf1;

    iget-object v2, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-gt v1, v2, :cond_19

    move v2, v1

    :cond_19
    invoke-virtual {v0, v2}, Lnjl;->j(I)J

    move-result-wide v2

    sget v4, Lxjl;->c:I

    const/16 v4, 0x20

    shr-long/2addr v2, v4

    long-to-int v2, v2

    if-lt v2, v1, :cond_28

    add-int/lit8 v1, v1, -0x1

    goto :goto_8

    :cond_28
    iget-object p0, p0, Lqhl;->d:Li9f;

    invoke-interface {p0, v2}, Li9f;->g(I)I

    move-result p0

    :goto_2e
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0

    :cond_33
    const/4 p0, 0x0

    return-object p0
.end method

.method public final f()Z
    .registers 2

    iget-object v0, p0, Lqhl;->c:Lnjl;

    if-eqz v0, :cond_d

    invoke-virtual {p0}, Lqhl;->r()I

    move-result p0

    invoke-virtual {v0, p0}, Lnjl;->h(I)Lhyh;

    move-result-object p0

    goto :goto_e

    :cond_d
    const/4 p0, 0x0

    :goto_e
    sget-object v0, Lhyh;->b:Lhyh;

    if-eq p0, v0, :cond_14

    const/4 p0, 0x1

    return p0

    :cond_14
    const/4 p0, 0x0

    return p0
.end method

.method public final g(Lnjl;I)I
    .registers 8

    invoke-virtual {p0}, Lqhl;->r()I

    move-result v0

    iget-object v1, p0, Lqhl;->e:Lwjl;

    iget-object v2, v1, Lwjl;->a:Ljava/lang/Float;

    if-nez v2, :cond_16

    invoke-virtual {p1, v0}, Lnjl;->c(I)Lvoh;

    move-result-object v2

    iget v2, v2, Lvoh;->a:F

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    iput-object v2, v1, Lwjl;->a:Ljava/lang/Float;

    :cond_16
    iget-object v2, p1, Lnjl;->b:Lxbe;

    invoke-virtual {v2, v0}, Lxbe;->d(I)I

    move-result v0

    add-int/2addr v0, p2

    if-gez v0, :cond_21

    const/4 p0, 0x0

    return p0

    :cond_21
    iget p2, v2, Lxbe;->f:I

    if-lt v0, p2, :cond_2e

    iget-object p0, p0, Lqhl;->g:Lsf1;

    iget-object p0, p0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    return p0

    :cond_2e
    invoke-virtual {v2, v0}, Lxbe;->b(I)F

    move-result p2

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr p2, v3

    iget-object v1, v1, Lwjl;->a:Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result v3

    invoke-virtual {p0}, Lqhl;->f()Z

    move-result v4

    if-eqz v4, :cond_49

    invoke-virtual {p1, v0}, Lnjl;->f(I)F

    move-result v4

    cmpl-float v4, v3, v4

    if-gez v4, :cond_57

    :cond_49
    invoke-virtual {p0}, Lqhl;->f()Z

    move-result v4

    if-nez v4, :cond_5d

    invoke-virtual {p1, v0}, Lnjl;->e(I)F

    move-result p1

    cmpg-float p1, v3, p1

    if-gtz p1, :cond_5d

    :cond_57
    const/4 p0, 0x1

    invoke-virtual {v2, v0, p0}, Lxbe;->c(IZ)I

    move-result p0

    return p0

    :cond_5d
    invoke-virtual {v1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long v0, p1

    invoke-static {p2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    const/16 v3, 0x20

    shl-long/2addr v0, v3

    const-wide v3, 0xffffffffL

    and-long/2addr p1, v3

    or-long/2addr v0, p1

    invoke-virtual {v2, v0, v1}, Lxbe;->g(J)I

    move-result p1

    iget-object p0, p0, Lqhl;->d:Li9f;

    invoke-interface {p0, p1}, Li9f;->g(I)I

    move-result p0

    return p0
.end method

.method public final h(Lojl;I)I
    .registers 11

    iget-object v0, p1, Lojl;->b:Lb2c;

    iget-object v1, p1, Lojl;->a:Lnjl;

    if-eqz v0, :cond_13

    iget-object p1, p1, Lojl;->c:Lb2c;

    if-eqz p1, :cond_10

    const/4 v2, 0x1

    invoke-interface {p1, v0, v2}, Lb2c;->y(Lb2c;Z)Lvoh;

    move-result-object p1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    if-nez p1, :cond_15

    :cond_13
    sget-object p1, Lvoh;->e:Lvoh;

    :cond_15
    iget-object v0, p0, Lqhl;->h:Lmil;

    iget-wide v2, v0, Lmil;->b:J

    sget v0, Lxjl;->c:I

    const-wide v4, 0xffffffffL

    and-long/2addr v2, v4

    long-to-int v0, v2

    iget-object p0, p0, Lqhl;->d:Li9f;

    invoke-interface {p0, v0}, Li9f;->i(I)I

    move-result v0

    invoke-virtual {v1, v0}, Lnjl;->c(I)Lvoh;

    move-result-object v0

    iget v2, v0, Lvoh;->a:F

    iget v0, v0, Lvoh;->b:F

    invoke-virtual {p1}, Lvoh;->c()J

    move-result-wide v6

    and-long/2addr v6, v4

    long-to-int p1, v6

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    int-to-float p2, p2

    mul-float/2addr p1, p2

    add-float/2addr p1, v0

    invoke-static {v2}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p2

    int-to-long v2, p2

    invoke-static {p1}, Ljava/lang/Float;->floatToRawIntBits(F)I

    move-result p1

    int-to-long p1, p1

    const/16 v0, 0x20

    shl-long/2addr v2, v0

    and-long/2addr p1, v4

    or-long/2addr v2, p1

    iget-object p1, v1, Lnjl;->b:Lxbe;

    invoke-virtual {p1, v2, v3}, Lxbe;->g(J)I

    move-result p1

    invoke-interface {p0, p1}, Li9f;->g(I)I

    move-result p0

    return p0
.end method

.method public final i()V
    .registers 6

    iget-object v0, p0, Lqhl;->e:Lwjl;

    const/4 v1, 0x0

    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v2, p0, Lqhl;->g:Lsf1;

    iget-object v3, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3a

    invoke-virtual {p0}, Lqhl;->f()Z

    move-result v3

    if-eqz v3, :cond_19

    invoke-virtual {p0}, Lqhl;->k()V

    return-void

    :cond_19
    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v0, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3a

    iget-object v0, v2, Lsf1;->b:Ljava/lang/String;

    iget-wide v1, p0, Lqhl;->f:J

    sget v3, Lxjl;->c:I

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    long-to-int v1, v1

    invoke-static {v1, v0}, Lnxg;->m(ILjava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3a

    invoke-virtual {p0, v0, v0}, Lqhl;->q(II)V

    :cond_3a
    return-void
.end method

.method public final j()V
    .registers 5

    iget-object v0, p0, Lqhl;->e:Lwjl;

    const/4 v1, 0x0

    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v0, p0, Lqhl;->g:Lsf1;

    iget-object v1, v0, Lsf1;->b:Ljava/lang/String;

    iget-object v0, v0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_32

    iget-wide v1, p0, Lqhl;->f:J

    invoke-static {v1, v2}, Lxjl;->e(J)I

    move-result v1

    invoke-static {v1, v0}, Lexg;->q(ILjava/lang/CharSequence;)I

    move-result v1

    iget-wide v2, p0, Lqhl;->f:J

    invoke-static {v2, v3}, Lxjl;->e(J)I

    move-result v2

    if-ne v1, v2, :cond_2f

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-eq v1, v2, :cond_2f

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1, v0}, Lexg;->q(ILjava/lang/CharSequence;)I

    move-result v1

    :cond_2f
    invoke-virtual {p0, v1, v1}, Lqhl;->q(II)V

    :cond_32
    return-void
.end method

.method public final k()V
    .registers 6

    iget-object v0, p0, Lqhl;->e:Lwjl;

    const/4 v1, 0x0

    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v0, p0, Lqhl;->g:Lsf1;

    iget-object v1, v0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_26

    iget-object v0, v0, Lsf1;->b:Ljava/lang/String;

    iget-wide v1, p0, Lqhl;->f:J

    sget v3, Lxjl;->c:I

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    long-to-int v1, v1

    invoke-static {v1, v0}, Lnxg;->o(ILjava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_26

    invoke-virtual {p0, v0, v0}, Lqhl;->q(II)V

    :cond_26
    return-void
.end method

.method public final l()V
    .registers 5

    iget-object v0, p0, Lqhl;->e:Lwjl;

    const/4 v1, 0x0

    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v0, p0, Lqhl;->g:Lsf1;

    iget-object v1, v0, Lsf1;->b:Ljava/lang/String;

    iget-object v0, v0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2e

    iget-wide v1, p0, Lqhl;->f:J

    invoke-static {v1, v2}, Lxjl;->f(J)I

    move-result v1

    invoke-static {v1, v0}, Lexg;->r(ILjava/lang/CharSequence;)I

    move-result v1

    iget-wide v2, p0, Lqhl;->f:J

    invoke-static {v2, v3}, Lxjl;->f(J)I

    move-result v2

    if-ne v1, v2, :cond_2b

    if-eqz v1, :cond_2b

    add-int/lit8 v1, v1, -0x1

    invoke-static {v1, v0}, Lexg;->r(ILjava/lang/CharSequence;)I

    move-result v1

    :cond_2b
    invoke-virtual {p0, v1, v1}, Lqhl;->q(II)V

    :cond_2e
    return-void
.end method

.method public final m()V
    .registers 6

    iget-object v0, p0, Lqhl;->e:Lwjl;

    const/4 v1, 0x0

    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v2, p0, Lqhl;->g:Lsf1;

    iget-object v3, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_3a

    invoke-virtual {p0}, Lqhl;->f()Z

    move-result v3

    if-eqz v3, :cond_37

    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v0, v2, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_3a

    iget-object v0, v2, Lsf1;->b:Ljava/lang/String;

    iget-wide v1, p0, Lqhl;->f:J

    sget v3, Lxjl;->c:I

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    long-to-int v1, v1

    invoke-static {v1, v0}, Lnxg;->m(ILjava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_3a

    invoke-virtual {p0, v0, v0}, Lqhl;->q(II)V

    return-void

    :cond_37
    invoke-virtual {p0}, Lqhl;->k()V

    :cond_3a
    return-void
.end method

.method public final n()V
    .registers 3

    iget-object v0, p0, Lqhl;->e:Lwjl;

    const/4 v1, 0x0

    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v0, p0, Lqhl;->g:Lsf1;

    iget-object v0, v0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1c

    invoke-virtual {p0}, Lqhl;->b()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p0, v0, v0}, Lqhl;->q(II)V

    :cond_1c
    return-void
.end method

.method public final o()V
    .registers 3

    iget-object v0, p0, Lqhl;->e:Lwjl;

    const/4 v1, 0x0

    iput-object v1, v0, Lwjl;->a:Ljava/lang/Float;

    iget-object v0, p0, Lqhl;->g:Lsf1;

    iget-object v0, v0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1c

    invoke-virtual {p0}, Lqhl;->c()Ljava/lang/Integer;

    move-result-object v0

    if-eqz v0, :cond_1c

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p0, v0, v0}, Lqhl;->q(II)V

    :cond_1c
    return-void
.end method

.method public final p()V
    .registers 6

    iget-object v0, p0, Lqhl;->g:Lsf1;

    iget-object v0, v0, Lsf1;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_21

    sget v0, Lxjl;->c:I

    const/16 v0, 0x20

    iget-wide v1, p0, Lqhl;->b:J

    shr-long/2addr v1, v0

    long-to-int v0, v1

    iget-wide v1, p0, Lqhl;->f:J

    const-wide v3, 0xffffffffL

    and-long/2addr v1, v3

    long-to-int v1, v1

    invoke-static {v0, v1}, Lupj;->c(II)J

    move-result-wide v0

    iput-wide v0, p0, Lqhl;->f:J

    :cond_21
    return-void
.end method

.method public final q(II)V
    .registers 3

    invoke-static {p1, p2}, Lupj;->c(II)J

    move-result-wide p1

    iput-wide p1, p0, Lqhl;->f:J

    return-void
.end method

.method public final r()I
    .registers 5

    iget-wide v0, p0, Lqhl;->f:J

    sget v2, Lxjl;->c:I

    const-wide v2, 0xffffffffL

    and-long/2addr v0, v2

    long-to-int v0, v0

    iget-object p0, p0, Lqhl;->d:Li9f;

    invoke-interface {p0, v0}, Li9f;->i(I)I

    move-result p0

    return p0
.end method
