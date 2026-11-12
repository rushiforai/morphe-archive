.class public final Lcm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lqyl;
.implements Ld2i;
.implements Lmjo;


# instance fields
.field public final synthetic a:B

.field public b:I

.field public final c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(ILjava/lang/String;B)V
    .registers 4

    iput-byte p3, p0, Lcm;->a:B

    iput p1, p0, Lcm;->b:I

    iput-object p2, p0, Lcm;->c:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3

    const/4 v0, 0x6

    iput-byte v0, p0, Lcm;->a:B

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcm;->c:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;IB)V
    .registers 4

    .line 10
    iput-byte p3, p0, Lcm;->a:B

    iput-object p1, p0, Lcm;->c:Ljava/lang/String;

    iput p2, p0, Lcm;->b:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lkro;
    .registers 1

    sget-object p0, Lphj;->r:Lqmo;

    return-object p0
.end method

.method public final b()Ljava/lang/Boolean;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final c()Lyn0;
    .registers 2

    iget p0, p0, Lcm;->b:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    const/4 v0, 0x1

    if-eq p0, v0, :cond_c

    sget-object p0, Lyn0;->i:Lyn0;

    return-object p0

    :cond_c
    sget-object p0, Lyn0;->k:Lyn0;

    return-object p0
.end method

.method public final d(Lqio;)V
    .registers 5

    iget v0, p0, Lcm;->b:I

    instance-of v1, p1, Llio;

    if-nez v1, :cond_c

    move-object v2, p1

    check-cast v2, Lmio;

    invoke-static {v0}, Lsko;->x(I)Ljava/lang/String;

    :cond_c
    if-eqz v1, :cond_2f

    check-cast p1, Llio;

    iget-object p1, p1, Llio;->a:Ljava/lang/Exception;

    invoke-static {v0}, Lsko;->x(I)Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    sget-object p1, Lsjo;->a:Ljava/util/List;

    iget-object p0, p0, Lcm;->c:Ljava/lang/String;

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2f

    sget-object p1, Lgxo;->c:Lgxo;

    new-instance v0, Let2;

    const/4 v1, 0x5

    invoke-direct {v0, p0, v1}, Let2;-><init>(Ljava/lang/String;B)V

    iget-object p0, p1, Lgxo;->b:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :cond_2f
    return-void
.end method

.method public final e()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final f()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcm;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final g()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getAmount()I
    .registers 1

    iget p0, p0, Lcm;->b:I

    return p0
.end method

.method public final getType()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcm;->c:Ljava/lang/String;

    return-object p0
.end method

.method public final h()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final i()Lzn0;
    .registers 2

    iget p0, p0, Lcm;->b:I

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    const/4 v0, 0x2

    if-eq p0, v0, :cond_12

    const/4 v0, 0x3

    if-eq p0, v0, :cond_f

    sget-object p0, Lzn0;->c:Lzn0;

    return-object p0

    :cond_f
    sget-object p0, Lzn0;->n:Lzn0;

    return-object p0

    :cond_12
    sget-object p0, Lzn0;->m:Lzn0;

    return-object p0
.end method

.method public final j()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final k(Z)V
    .registers 2

    if-eqz p1, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Lcm;->s()V

    const/4 p0, 0x0

    throw p0
.end method

.method public final l()C
    .registers 3

    invoke-virtual {p0}, Lcm;->r()C

    move-result v0

    iget v1, p0, Lcm;->b:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcm;->b:I

    return v0
.end method

.method public final m()I
    .registers 5

    invoke-virtual {p0}, Lcm;->r()C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->isDigit(C)Z

    move-result v0

    invoke-virtual {p0, v0}, Lcm;->k(Z)V

    iget v0, p0, Lcm;->b:I

    const/4 v1, 0x0

    :goto_e
    iget-object v2, p0, Lcm;->c:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_2c

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_2c

    mul-int/lit8 v1, v1, 0xa

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    add-int/lit8 v2, v2, -0x30

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    :cond_2c
    iput v0, p0, Lcm;->b:I

    return v1
.end method

.method public final n()V
    .registers 4

    :goto_0
    iget v0, p0, Lcm;->b:I

    iget-object v1, p0, Lcm;->c:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v0, v2, :cond_b

    return-void

    :cond_b
    iget v0, p0, Lcm;->b:I

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget v0, p0, Lcm;->b:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcm;->b:I

    goto :goto_0

    :cond_1e
    return-void
.end method

.method public final o()Lsfe;
    .registers 6

    invoke-virtual {p0}, Lcm;->q()Ljlg;

    move-result-object v0

    :goto_4
    invoke-virtual {p0}, Lcm;->n()V

    iget-object v1, p0, Lcm;->c:Ljava/lang/String;

    iget v2, p0, Lcm;->b:I

    invoke-static {v2, v1}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v1

    const/16 v2, 0x61

    if-eq v1, v2, :cond_1a

    :cond_19
    return-object v0

    :cond_1a
    invoke-virtual {p0}, Lcm;->l()C

    invoke-virtual {p0}, Lcm;->l()C

    move-result v1

    const/16 v2, 0x6e

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v2, :cond_29

    move v1, v4

    goto :goto_2a

    :cond_29
    move v1, v3

    :goto_2a
    invoke-virtual {p0, v1}, Lcm;->k(Z)V

    invoke-virtual {p0}, Lcm;->l()C

    move-result v1

    const/16 v2, 0x64

    if-ne v1, v2, :cond_36

    move v3, v4

    :cond_36
    invoke-virtual {p0, v3}, Lcm;->k(Z)V

    new-instance v1, Lflg;

    invoke-virtual {p0}, Lcm;->q()Ljlg;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Lflg;-><init>(Lsfe;Lsfe;)V

    move-object v0, v1

    goto :goto_4
.end method

.method public final p()Lkotlin/ranges/IntRange;
    .registers 5

    invoke-virtual {p0}, Lcm;->n()V

    invoke-virtual {p0}, Lcm;->m()I

    move-result v0

    iget-object v1, p0, Lcm;->c:Ljava/lang/String;

    iget v2, p0, Lcm;->b:I

    invoke-static {v2, v1}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1a

    invoke-virtual {v1}, Ljava/lang/Character;->charValue()C

    move-result v1

    const/16 v3, 0x2e

    if-eq v1, v3, :cond_20

    :cond_1a
    new-instance p0, Lkotlin/ranges/IntRange;

    invoke-direct {p0, v0, v0, v2}, Lkotlin/ranges/a;-><init>(III)V

    return-object p0

    :cond_20
    invoke-virtual {p0}, Lcm;->l()C

    invoke-virtual {p0}, Lcm;->l()C

    move-result v1

    if-ne v1, v3, :cond_2b

    move v1, v2

    goto :goto_2c

    :cond_2b
    const/4 v1, 0x0

    :goto_2c
    invoke-virtual {p0, v1}, Lcm;->k(Z)V

    invoke-virtual {p0}, Lcm;->m()I

    move-result p0

    new-instance v1, Lkotlin/ranges/IntRange;

    invoke-direct {v1, v0, p0, v2}, Lkotlin/ranges/a;-><init>(III)V

    return-object v1
.end method

.method public final q()Ljlg;
    .registers 8

    invoke-virtual {p0}, Lcm;->n()V

    invoke-virtual {p0}, Lcm;->l()C

    move-result v0

    const/16 v1, 0x63

    const/4 v2, 0x0

    if-eq v0, v1, :cond_3e

    const/16 v1, 0x69

    if-eq v0, v1, :cond_3b

    const/16 v1, 0x6e

    if-eq v0, v1, :cond_38

    const/16 v1, 0x74

    if-eq v0, v1, :cond_35

    const/16 v1, 0x65

    if-eq v0, v1, :cond_3e

    const/16 v1, 0x66

    if-eq v0, v1, :cond_32

    const/16 v1, 0x76

    if-eq v0, v1, :cond_2f

    const/16 v1, 0x77

    if-ne v0, v1, :cond_2b

    sget-object v0, Lhlg;->d:Lhlg;

    goto :goto_40

    :cond_2b
    invoke-virtual {p0}, Lcm;->s()V

    throw v2

    :cond_2f
    sget-object v0, Lhlg;->c:Lhlg;

    goto :goto_40

    :cond_32
    sget-object v0, Lhlg;->e:Lhlg;

    goto :goto_40

    :cond_35
    sget-object v0, Lhlg;->f:Lhlg;

    goto :goto_40

    :cond_38
    sget-object v0, Lhlg;->a:Lhlg;

    goto :goto_40

    :cond_3b
    sget-object v0, Lhlg;->b:Lhlg;

    goto :goto_40

    :cond_3e
    sget-object v0, Lhlg;->g:Lhlg;

    :goto_40
    invoke-virtual {p0}, Lcm;->n()V

    invoke-virtual {p0}, Lcm;->r()C

    move-result v1

    const/16 v3, 0x25

    if-ne v1, v3, :cond_5a

    invoke-virtual {p0}, Lcm;->l()C

    invoke-virtual {p0}, Lcm;->n()V

    invoke-virtual {p0}, Lcm;->m()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto :goto_5b

    :cond_5a
    move-object v1, v2

    :goto_5b
    invoke-virtual {p0}, Lcm;->n()V

    invoke-virtual {p0}, Lcm;->r()C

    move-result v3

    const/16 v4, 0x21

    const/4 v5, 0x0

    const/16 v6, 0x3d

    if-eq v3, v4, :cond_74

    if-ne v3, v6, :cond_70

    invoke-virtual {p0}, Lcm;->l()C

    move v3, v5

    goto :goto_84

    :cond_70
    invoke-virtual {p0}, Lcm;->s()V

    throw v2

    :cond_74
    invoke-virtual {p0}, Lcm;->l()C

    invoke-virtual {p0}, Lcm;->l()C

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v6, :cond_80

    move v2, v3

    goto :goto_81

    :cond_80
    move v2, v5

    :goto_81
    invoke-virtual {p0, v2}, Lcm;->k(Z)V

    :goto_84
    invoke-virtual {p0}, Lcm;->p()Lkotlin/ranges/IntRange;

    move-result-object v2

    filled-new-array {v2}, [Lkotlin/ranges/IntRange;

    move-result-object v2

    invoke-static {v2}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v2

    :goto_90
    iget-object v4, p0, Lcm;->c:Ljava/lang/String;

    iget v6, p0, Lcm;->b:I

    invoke-static {v6, v4}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v4

    if-eqz v4, :cond_ad

    invoke-virtual {v4}, Ljava/lang/Character;->charValue()C

    move-result v4

    const/16 v6, 0x2c

    if-ne v4, v6, :cond_ad

    invoke-virtual {p0}, Lcm;->l()C

    invoke-virtual {p0}, Lcm;->p()Lkotlin/ranges/IntRange;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_90

    :cond_ad
    new-instance p0, Ljlg;

    new-array v4, v5, [Lkotlin/ranges/IntRange;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Lkotlin/ranges/IntRange;

    invoke-direct {p0, v0, v1, v3, v2}, Ljlg;-><init>(Lhlg;Ljava/lang/Integer;Z[Lkotlin/ranges/IntRange;)V

    return-object p0
.end method

.method public final r()C
    .registers 3

    iget-object v0, p0, Lcm;->c:Ljava/lang/String;

    iget v1, p0, Lcm;->b:I

    invoke-static {v1, v0}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v0

    if-eqz v0, :cond_f

    invoke-virtual {v0}, Ljava/lang/Character;->charValue()C

    move-result p0

    return p0

    :cond_f
    invoke-virtual {p0}, Lcm;->s()V

    const/4 p0, 0x0

    throw p0
.end method

.method public final s()V
    .registers 5

    new-instance v0, Llv0;

    iget v1, p0, Lcm;->b:I

    add-int/lit8 v1, v1, 0x1

    const-string v2, "Invalid syntax at position "

    const-string v3, ": "

    iget-object p0, p0, Lcm;->c:Ljava/lang/String;

    invoke-static {v1, v2, v3, p0}, Lp3p;->j(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    iget-byte v0, p0, Lcm;->a:B

    packed-switch v0, :pswitch_data_24

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_a
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AdError(code="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcm;->b:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", message=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcm;->c:Ljava/lang/String;

    const-string v1, "\')"

    invoke-static {v0, p0, v1}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method
