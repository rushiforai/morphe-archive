.class public final Lexj;
.super Lj0i;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# instance fields
.field public final synthetic A:I

.field public final synthetic B:Ls15;

.field public u:[Ljava/lang/Object;

.field public v:I

.field public w:I

.field public x:Z

.field public synthetic y:Ljava/lang/Object;

.field public final synthetic z:Landroid/text/Spanned;


# direct methods
.method public constructor <init>(Landroid/text/Spanned;ILs15;Lmt5;)V
    .registers 5

    iput-object p1, p0, Lexj;->z:Landroid/text/Spanned;

    iput p2, p0, Lexj;->A:I

    iput-object p3, p0, Lexj;->B:Ls15;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lj0i;-><init>(ILmt5;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lmt5;)Lmt5;
    .registers 6

    new-instance v0, Lexj;

    iget v1, p0, Lexj;->A:I

    iget-object v2, p0, Lexj;->B:Ls15;

    iget-object p0, p0, Lexj;->z:Landroid/text/Spanned;

    invoke-direct {v0, p0, v1, v2, p2}, Lexj;-><init>(Landroid/text/Spanned;ILs15;Lmt5;)V

    iput-object p1, v0, Lexj;->y:Ljava/lang/Object;

    return-object v0
.end method

.method public final invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Ll1j;

    check-cast p2, Lmt5;

    invoke-virtual {p0, p1, p2}, Lexj;->create(Ljava/lang/Object;Lmt5;)Lmt5;

    move-result-object p0

    check-cast p0, Lexj;

    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lexj;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-object v0, p0, Lexj;->y:Ljava/lang/Object;

    check-cast v0, Ll1j;

    sget-object v1, Lpx5;->a:Lpx5;

    iget-boolean v2, p0, Lexj;->x:Z

    const/4 v3, 0x1

    iget-object v4, p0, Lexj;->z:Landroid/text/Spanned;

    if-eqz v2, :cond_20

    if-ne v2, v3, :cond_19

    iget v2, p0, Lexj;->w:I

    iget v5, p0, Lexj;->v:I

    iget-object v6, p0, Lexj;->u:[Ljava/lang/Object;

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_63

    :cond_19
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_20
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iget-object p1, p0, Lexj;->B:Ls15;

    invoke-interface {p1}, Ln15;->a()Ljava/lang/Class;

    move-result-object p1

    const/4 v2, 0x0

    iget v5, p0, Lexj;->A:I

    invoke-interface {v4, v2, v5, p1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_35

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :cond_35
    array-length v5, p1

    move v6, v5

    move v5, v2

    move v2, v6

    move-object v6, p1

    :goto_3a
    if-ge v5, v2, :cond_65

    aget-object p1, v6, v5

    invoke-interface {v4, p1}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v7

    invoke-interface {v4, p1}, Landroid/text/Spanned;->getSpanEnd(Ljava/lang/Object;)I

    move-result v8

    invoke-interface {v4, p1}, Landroid/text/Spanned;->getSpanFlags(Ljava/lang/Object;)I

    move-result v9

    if-ltz v7, :cond_63

    if-ltz v8, :cond_63

    new-instance v4, Lpwj;

    invoke-direct {v4, v7, v8, v9, p1}, Lpwj;-><init>(IIILjava/lang/Object;)V

    iput-object v0, p0, Lexj;->y:Ljava/lang/Object;

    iput-object v6, p0, Lexj;->u:[Ljava/lang/Object;

    iput v5, p0, Lexj;->v:I

    iput v2, p0, Lexj;->w:I

    iput-boolean v3, p0, Lexj;->x:Z

    invoke-virtual {v0, p0, v4}, Ll1j;->a(Lmt5;Ljava/lang/Object;)V

    sget-object p0, Lpx5;->a:Lpx5;

    return-object v1

    :cond_63
    :goto_63
    add-int/2addr v5, v3

    goto :goto_3a

    :cond_65
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method
