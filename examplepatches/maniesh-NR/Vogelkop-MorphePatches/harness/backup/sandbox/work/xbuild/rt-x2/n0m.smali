.class public final Ln0m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll0m;


# instance fields
.field public final a:Lsjj;


# direct methods
.method public constructor <init>(Lsjj;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ln0m;->a:Lsjj;

    return-void
.end method

.method public static a(Llkh;Lljj;)[B
    .registers 10

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget v1, p0, Llkh;->a:I

    int-to-long v1, v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Llkh;->b:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Llkh;->g:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Llkh;->h:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Llkh;->c:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Llkh;->d:Lwv;

    const-string v2, ""

    if-eqz v1, :cond_33

    iget-object v1, v1, Lle3;->b:Ljava/lang/String;

    invoke-static {v1}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_36

    :cond_33
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_36
    iget-object v1, p0, Llkh;->e:Ljava/math/BigInteger;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Llkh;->f:Ljava/lang/String;

    const-string v3, "0x"

    invoke-static {v1, v3}, Lkotlin/text/StringsKt;->T(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v1, Ll08;->a:Ll08;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v1, p0, Llkh;->i:Lwv;

    if-eqz v1, :cond_5d

    iget-object v1, v1, Lle3;->b:Ljava/lang/String;

    invoke-static {v1}, Lnaa;->c(Ljava/lang/String;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_60

    :cond_5d
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_60
    if-eqz p1, :cond_e1

    iget p0, p0, Llkh;->a:I

    int-to-long v1, p0

    new-instance p0, Ljava/math/BigInteger;

    iget-object v3, p1, Lljj;->a:Ln54;

    iget-object v3, v3, Ln54;->a:[B

    const/4 v4, 0x1

    invoke-direct {p0, v4, v3}, Ljava/math/BigInteger;-><init>(I[B)V

    const/16 v3, 0x1b

    invoke-static {v3}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v3

    const/16 v4, 0x1c

    invoke-static {v4}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v4

    const/16 v5, 0x25

    invoke-static {v5}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v5

    const/16 v6, 0x23

    invoke-static {v6}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v6

    invoke-virtual {p0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_bc

    invoke-virtual {p0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_bc

    invoke-virtual {p0, v5}, Ljava/math/BigInteger;->compareTo(Ljava/math/BigInteger;)I

    move-result v3

    if-ltz v3, :cond_b5

    new-instance v3, Ljava/math/BigInteger;

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;)V

    sget-object v1, Lpe3;->c:Ljava/math/BigInteger;

    invoke-virtual {v3, v1}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {p0, v1}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p0, v6}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    move-result p0

    goto :goto_c4

    :cond_b5
    const-string p1, "Unsupported v parameter: "

    invoke-static {p0, p1}, Ls49;->l(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_bc
    invoke-virtual {p0, v3}, Ljava/math/BigInteger;->subtract(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    move-result p0

    :goto_c4
    invoke-static {p0}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p1, Lljj;->b:Ln54;

    iget-object p0, p0, Ln54;->a:[B

    invoke-static {p0}, Lrm5;->W([B)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, p1, Lljj;->c:Ln54;

    iget-object p0, p0, Ln54;->a:[B

    invoke-static {p0}, Lrm5;->W([B)[B

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_e1
    invoke-static {v0}, Lrih;->j(Ljava/lang/Object;)[B

    move-result-object p0

    new-instance p1, Lro9;

    const/16 v0, 0x8

    invoke-direct {p1, v0}, Lro9;-><init>(B)V

    sget-object v0, Lkkh;->a:[Lkkh;

    iget-object v0, p1, Lro9;->d:Ljava/lang/Object;

    check-cast v0, [B

    iget v1, p1, Lro9;->b:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p1, Lro9;->b:I

    const/16 v2, 0x7b

    aput-byte v2, v0, v1

    invoke-virtual {p1, p0}, Lro9;->d(Ljava/lang/Object;)V

    invoke-virtual {p1}, Lro9;->b0()[B

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final b(Llkh;Lavb;Lnt5;)Ljava/io/Serializable;
    .registers 9

    instance-of v0, p3, Lm0m;

    if-eqz v0, :cond_13

    move-object v0, p3

    check-cast v0, Lm0m;

    iget v1, v0, Lm0m;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lm0m;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lm0m;

    invoke-direct {v0, p0, p3}, Lm0m;-><init>(Ln0m;Lnt5;)V

    :goto_18
    iget-object p3, v0, Lm0m;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lm0m;->w:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_2a

    iget-object p1, v0, Lm0m;->t:Llkh;

    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_46

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v4

    :cond_30
    invoke-static {p3}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {p1, v4}, Ln0m;->a(Llkh;Lljj;)[B

    move-result-object p3

    iput-object p1, v0, Lm0m;->t:Llkh;

    iput v3, v0, Lm0m;->w:I

    iget-object p0, p0, Ln0m;->a:Lsjj;

    check-cast p0, Lqa1;

    invoke-virtual {p0, p3, p2, v0}, Lqa1;->a([BLavb;Lnt5;)Ljava/lang/Object;

    move-result-object p3

    if-ne p3, v1, :cond_46

    return-object v1

    :cond_46
    :goto_46
    check-cast p3, Lljj;

    invoke-static {p1, p3}, Ln0m;->a(Llkh;Lljj;)[B

    move-result-object p0

    return-object p0
.end method
