.class public final Lpkl;
.super Lj0i;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public u:Llkl;

.field public v:I

.field public w:B

.field public synthetic x:Ljava/lang/Object;

.field public final synthetic y:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lpkl;->y:Ljava/lang/String;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lj0i;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    new-instance v0, Lpkl;

    iget-object p0, p0, Lpkl;->y:Ljava/lang/String;

    invoke-direct {v0, p0, p2}, Lpkl;-><init>(Ljava/lang/String;Lmt5;)V

    iput-object p1, v0, Lpkl;->x:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Ll1j;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lpkl;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lpkl;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lpkl;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 15

    iget-object v0, p0, Lpkl;->x:Ljava/lang/Object;

    check-cast v0, Ll1j;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-byte v2, p0, Lpkl;->w:B

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v2, :cond_31

    if-eq v2, v5, :cond_2c

    if-eq v2, v4, :cond_23

    if-ne v2, v3, :cond_1d

    iget-object v2, p0, Lpkl;->u:Llkl;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget p1, v2, Llkl;->c:I

    add-int/2addr p1, v5

    goto :goto_35

    :cond_1d
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v6

    :cond_23
    iget v2, p0, Lpkl;->v:I

    iget-object v4, p0, Lpkl;->u:Llkl;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_b3

    :cond_2c
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto/16 :goto_ca

    :cond_31
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    const/4 p1, 0x0

    :goto_35
    iget-object v2, p0, Lpkl;->y:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-ge p1, v7, :cond_ca

    move v7, p1

    :goto_3e
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v8

    if-ge v7, v8, :cond_78

    const/16 v8, 0x3c

    const/4 v9, 0x4

    invoke-static {v2, v8, v7, v9}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v8

    const/4 v10, -0x1

    if-eq v8, v10, :cond_78

    add-int/lit8 v11, v8, 0x1

    const/16 v12, 0x3e

    invoke-static {v2, v12, v11, v9}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v9

    if-eq v9, v10, :cond_78

    invoke-virtual {v2, v11, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    const/16 v11, 0x2f

    invoke-static {v10, v11}, Lkotlin/text/StringsKt;->c0(Ljava/lang/String;C)Z

    move-result v11

    if-eqz v11, :cond_68

    invoke-virtual {v10, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    :cond_68
    invoke-static {v10}, Lddh;->v(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_74

    new-instance v7, Llkl;

    invoke-direct {v7, v8, v9, v10, v11}, Llkl;-><init>(IILjava/lang/String;Z)V

    goto :goto_79

    :cond_74
    add-int/lit8 v9, v9, 0x2

    add-int/2addr v7, v9

    goto :goto_3e

    :cond_78
    move-object v7, v6

    :goto_79
    if-nez v7, :cond_92

    new-instance v3, Lnkl;

    invoke-virtual {v2, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lnkl;-><init>(Ljava/lang/String;)V

    iput-object v6, p0, Lpkl;->x:Ljava/lang/Object;

    iput-object v6, p0, Lpkl;->u:Llkl;

    iput p1, p0, Lpkl;->v:I

    iput-byte v5, p0, Lpkl;->w:B

    invoke-virtual {v0, p0, v3}, Ll1j;->a(Lmt5;Ljava/lang/Object;)V

    sget-object p0, Lpx5;->a:Lpx5;

    return-object v1

    :cond_92
    iget v5, v7, Llkl;->b:I

    invoke-virtual {v2, p1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_b1

    new-instance v3, Lnkl;

    invoke-direct {v3, v2}, Lnkl;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lpkl;->x:Ljava/lang/Object;

    iput-object v7, p0, Lpkl;->u:Llkl;

    iput p1, p0, Lpkl;->v:I

    iput-byte v4, p0, Lpkl;->w:B

    invoke-virtual {v0, p0, v3}, Ll1j;->a(Lmt5;Ljava/lang/Object;)V

    sget-object p0, Lpx5;->a:Lpx5;

    return-object v1

    :cond_b1
    move v2, p1

    move-object v4, v7

    :goto_b3
    new-instance p1, Lmkl;

    iget-object v5, v4, Llkl;->a:Ljava/lang/String;

    iget-boolean v6, v4, Llkl;->d:Z

    invoke-direct {p1, v5, v6}, Lmkl;-><init>(Ljava/lang/String;Z)V

    iput-object v0, p0, Lpkl;->x:Ljava/lang/Object;

    iput-object v4, p0, Lpkl;->u:Llkl;

    iput v2, p0, Lpkl;->v:I

    iput-byte v3, p0, Lpkl;->w:B

    invoke-virtual {v0, p0, p1}, Ll1j;->a(Lmt5;Ljava/lang/Object;)V

    sget-object p0, Lpx5;->a:Lpx5;

    return-object v1

    :cond_ca
    :goto_ca
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
