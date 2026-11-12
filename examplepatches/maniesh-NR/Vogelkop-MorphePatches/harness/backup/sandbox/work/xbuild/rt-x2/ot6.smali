.class public final Lot6;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lgfd;


# static fields
.field public static final i:Lpfe;


# instance fields
.field public final a:Li88;

.field public final b:Lgq6;

.field public final c:Lnr6;

.field public final d:Lqq6;

.field public final e:Lne5;

.field public final f:Lf1p;

.field public final g:Lip6;

.field public final h:Liq6;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lpfe;

    invoke-direct {v0}, Lpfe;-><init>()V

    sput-object v0, Lot6;->i:Lpfe;

    return-void
.end method

.method public constructor <init>(Li88;Lgq6;Lnr6;Lqq6;Lne5;Lf1p;Lip6;Liq6;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lot6;->a:Li88;

    iput-object p2, p0, Lot6;->b:Lgq6;

    iput-object p3, p0, Lot6;->c:Lnr6;

    iput-object p4, p0, Lot6;->d:Lqq6;

    iput-object p5, p0, Lot6;->e:Lne5;

    iput-object p6, p0, Lot6;->f:Lf1p;

    iput-object p7, p0, Lot6;->g:Lip6;

    iput-object p8, p0, Lot6;->h:Liq6;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lmt6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lmt6;

    iget v1, v0, Lmt6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lmt6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lmt6;

    invoke-direct {v0, p0, p2}, Lmt6;-><init>(Lot6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lmt6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lmt6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p2, Lt0i;

    iget-object p0, p2, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p2, Lgj2;

    invoke-direct {p2, p0, p1, v3}, Lgj2;-><init>(Lot6;Landroid/content/Context;Lmt5;)V

    iput v4, v0, Lmt6;->v:I

    invoke-static {p2, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    return-object p0
.end method

.method public final b(Ljava/lang/String;Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p2, Lnt6;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lnt6;

    iget v1, v0, Lnt6;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lnt6;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lnt6;

    invoke-direct {v0, p0, p2}, Lnt6;-><init>(Lot6;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lnt6;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lnt6;->w:I

    const/4 v3, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v3, :cond_29

    iget-object p1, v0, Lnt6;->t:Ljava/lang/String;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_40

    :cond_29
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lnt6;->t:Ljava/lang/String;

    iput v3, v0, Lnt6;->w:I

    iget-object p0, p0, Lot6;->a:Li88;

    invoke-virtual {p0, v0}, Li88;->a(Lnt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_40

    return-object v1

    :cond_40
    :goto_40
    invoke-static {p2, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v3

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
