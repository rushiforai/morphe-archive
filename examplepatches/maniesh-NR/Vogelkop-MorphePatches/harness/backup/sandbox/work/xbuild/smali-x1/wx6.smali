.class public final Lwx6;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final g:Lpfe;


# instance fields
.field public final a:Lau6;

.field public final b:Lqp6;

.field public final c:Lole;

.field public final d:Lga6;

.field public final e:Ld06;

.field public final f:Ld06;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lpfe;

    invoke-direct {v0}, Lpfe;-><init>()V

    sput-object v0, Lwx6;->g:Lpfe;

    return-void
.end method

.method public constructor <init>(Lau6;Lqp6;Lole;Lga6;Ld06;Ld06;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwx6;->a:Lau6;

    iput-object p2, p0, Lwx6;->b:Lqp6;

    iput-object p3, p0, Lwx6;->c:Lole;

    iput-object p4, p0, Lwx6;->d:Lga6;

    iput-object p5, p0, Lwx6;->e:Ld06;

    iput-object p6, p0, Lwx6;->f:Ld06;

    return-void
.end method


# virtual methods
.method public final a(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lux6;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lux6;

    iget v1, v0, Lux6;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lux6;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lux6;

    invoke-direct {v0, p0, p1}, Lux6;-><init>(Lwx6;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lux6;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lux6;->v:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_32

    if-ne v2, v4, :cond_2c

    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    check-cast p1, Lt0i;

    iget-object p0, p1, Lt0i;->a:Ljava/lang/Object;

    return-object p0

    :cond_2c
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_32
    invoke-static {p1}, Lybh;->y(Ljava/lang/Object;)V

    new-instance p1, Lvx6;

    invoke-direct {p1, p0, v3}, Lvx6;-><init>(Lwx6;Lmt5;)V

    iput v4, v0, Lux6;->v:I

    invoke-static {p1, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    return-object p0
.end method
