.class public final Lm3i;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lj4c;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lj4c;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm3i;->a:Landroid/content/Context;

    iput-object p2, p0, Lm3i;->b:Lj4c;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Ll3i;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Ll3i;

    iget v1, v0, Ll3i;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Ll3i;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Ll3i;

    invoke-direct {v0, p0, p2}, Ll3i;-><init>(Lm3i;Lnt5;)V

    :goto_18
    iget-object p2, v0, Ll3i;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Ll3i;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2e

    if-ne v2, v4, :cond_28

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_62

    :cond_28
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_2e
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    invoke-static {p1}, Lwqm;->s(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_51

    invoke-static {p1}, Lwqm;->u(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_51

    iget-object p0, p0, Lm3i;->b:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lydn;

    iget-object p0, p0, Lydn;->d:Lvdn;

    invoke-virtual {p0}, Lvdn;->a()Z

    move-result p0

    xor-int/2addr p0, v4

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :cond_51
    sget-object p2, Llk6;->a:Llk6;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    iput v4, v0, Ll3i;->v:I

    iget-object p0, p0, Lm3i;->a:Landroid/content/Context;

    invoke-virtual {p2, p1, p0, v0}, Llk6;->d(Landroid/net/Uri;Landroid/content/Context;Lnt5;)Ljava/lang/Enum;

    move-result-object p2

    if-ne p2, v1, :cond_62

    return-object v1

    :cond_62
    :goto_62
    check-cast p2, Ljk6;

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_77

    if-eq p0, v4, :cond_76

    const/4 p1, 0x2

    if-eq p0, p1, :cond_76

    const/4 p1, 0x3

    if-eq p0, p1, :cond_76

    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_76
    const/4 v4, 0x0

    :cond_77
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
