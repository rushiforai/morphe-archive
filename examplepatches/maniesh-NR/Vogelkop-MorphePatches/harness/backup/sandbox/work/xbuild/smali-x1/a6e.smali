.class public final La6e;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Llrh;


# instance fields
.field public final a:Ljg8;

.field public final b:Ldj9;

.field public final c:Lzyk;

.field public final d:Lzyk;


# direct methods
.method public constructor <init>(Ljg8;Ldj9;Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La6e;->a:Ljg8;

    iput-object p2, p0, La6e;->b:Ldj9;

    new-instance p1, Lvg4;

    const/16 p2, 0xc

    invoke-direct {p1, p3, p2}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, La6e;->c:Lzyk;

    new-instance p1, Lvg4;

    const/16 p2, 0xd

    invoke-direct {p1, p3, p2}, Lvg4;-><init>(Landroid/content/Context;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, La6e;->d:Lzyk;

    return-void
.end method


# virtual methods
.method public final a(Lmt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lz5e;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lz5e;

    iget v1, v0, Lz5e;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lz5e;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lz5e;

    invoke-direct {v0, p0, p1}, Lz5e;-><init>(La6e;Lmt5;)V

    :goto_18
    iget-object p1, v0, Lz5e;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lz5e;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_43

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v4, v0, Lz5e;->v:I

    new-instance p1, Lbz1;

    const/16 v2, 0x13

    invoke-direct {p1, v2, v3, p0}, Lbz1;-><init>(BLmt5;Ljava/lang/Object;)V

    iget-object p0, p0, La6e;->a:Ljg8;

    invoke-static {p0, p1, v0}, Lna2;->Z(Lkotlin/coroutines/CoroutineContext;Lkotlin/jvm/functions/Function2;Lmt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_43

    return-object v1

    :cond_43
    :goto_43
    check-cast p1, Ljava/lang/String;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Locale;->toLanguageTag()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lkrh;

    invoke-direct {v0, p1, p0}, Lkrh;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method
