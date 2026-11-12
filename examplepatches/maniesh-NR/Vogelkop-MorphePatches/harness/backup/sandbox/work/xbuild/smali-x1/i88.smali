.class public final Li88;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ldj9;

.field public final c:Ljg8;


# direct methods
.method public constructor <init>(Ljg8;Ldj9;Landroid/content/Context;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Li88;->a:Landroid/content/Context;

    iput-object p2, p0, Li88;->b:Ldj9;

    iput-object p1, p0, Li88;->c:Ljg8;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lf88;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lf88;

    iget v1, v0, Lf88;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lf88;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lf88;

    invoke-direct {v0, p0, p1}, Lf88;-><init>(Li88;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lf88;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lf88;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3c

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, v0, Lf88;->v:I

    iget-object p0, p0, Li88;->b:Ldj9;

    invoke-static {p0, v0}, La26;->k(Lno7;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_3c

    return-object v1

    :cond_3c
    :goto_3c
    check-cast p1, Lcj9;

    iget-object p0, p1, Lcj9;->a:Ljava/lang/String;

    if-nez p0, :cond_44

    const-string p0, ""

    :cond_44
    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, p1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final b(Lnt5;)Ljava/lang/Object;
    .registers 6

    instance-of v0, p1, Lh88;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lh88;

    iget v1, v0, Lh88;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lh88;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lh88;

    invoke-direct {v0, p0, p1}, Lh88;-><init>(Li88;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lh88;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lh88;->v:I

    const/4 v3, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v3, :cond_27

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_3c

    :cond_27
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_2e
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    iput v3, v0, Lh88;->v:I

    iget-object p0, p0, Li88;->b:Ldj9;

    invoke-static {p0, v0}, La26;->k(Lno7;Lnt5;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_3c

    return-object v1

    :cond_3c
    :goto_3c
    check-cast p1, Lcj9;

    iget-object p0, p1, Lcj9;->b:Ljava/lang/String;

    if-nez p0, :cond_44

    const-string p0, ""

    :cond_44
    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {p0, p1}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
