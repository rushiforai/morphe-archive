.class public final Lbu4;
.super Lj0i;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public u:I

.field public v:Z

.field public synthetic w:Ljava/lang/Object;

.field public final synthetic x:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;Lmt5;)V
    .registers 3

    iput-object p1, p0, Lbu4;->x:Ljava/lang/CharSequence;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p2}, Lj0i;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 4

    new-instance v0, Lbu4;

    iget-object p0, p0, Lbu4;->x:Ljava/lang/CharSequence;

    invoke-direct {v0, p0, p2}, Lbu4;-><init>(Ljava/lang/CharSequence;Lmt5;)V

    iput-object p1, v0, Lbu4;->w:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Ll1j;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lbu4;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lbu4;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lbu4;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 10

    iget-object v0, p0, Lbu4;->w:Ljava/lang/Object;

    check-cast v0, Ll1j;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v2, p0, Lbu4;->v:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_1b

    if-ne v2, v3, :cond_14

    iget v2, p0, Lbu4;->u:I

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    add-int/2addr v2, v3

    goto :goto_1f

    :cond_14
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_1b
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    const/4 v2, 0x0

    :goto_1f
    iget-object p1, p0, Lbu4;->x:Ljava/lang/CharSequence;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-ge v2, v4, :cond_86

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    int-to-char v5, v4

    invoke-static {v5}, Ljava/lang/Character;->isHighSurrogate(C)Z

    move-result v6

    if-eqz v6, :cond_6c

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v6

    sub-int/2addr v6, v3

    if-ge v2, v6, :cond_6c

    add-int/lit8 v6, v2, 0x1

    invoke-interface {p1, v6}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p1

    int-to-char p1, p1

    invoke-static {p1}, Ljava/lang/Character;->isLowSurrogate(C)Z

    move-result v7

    if-eqz v7, :cond_5b

    invoke-static {v5, p1}, Ljava/lang/Character;->toCodePoint(CC)I

    move-result p1

    new-instance v4, Lkotlin/Pair;

    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v2}, Ljava/lang/Integer;-><init>(I)V

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, p1}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {v4, v5, v2}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move v2, v6

    goto :goto_7c

    :cond_5b
    new-instance p1, Lkotlin/Pair;

    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v2}, Ljava/lang/Integer;-><init>(I)V

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {p1, v5, v6}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_6a
    move-object v4, p1

    goto :goto_7c

    :cond_6c
    new-instance p1, Lkotlin/Pair;

    new-instance v5, Ljava/lang/Integer;

    invoke-direct {v5, v2}, Ljava/lang/Integer;-><init>(I)V

    new-instance v6, Ljava/lang/Integer;

    invoke-direct {v6, v4}, Ljava/lang/Integer;-><init>(I)V

    invoke-direct {p1, v5, v6}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_6a

    :goto_7c
    iput-object v0, p0, Lbu4;->w:Ljava/lang/Object;

    iput v2, p0, Lbu4;->u:I

    iput-boolean v3, p0, Lbu4;->v:Z

    invoke-virtual {v0, p0, v4}, Ll1j;->a(Lmt5;Ljava/lang/Object;)V

    return-object v1

    :cond_86
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
