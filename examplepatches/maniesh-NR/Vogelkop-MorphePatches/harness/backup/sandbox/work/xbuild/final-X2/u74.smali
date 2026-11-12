.class public final Lu74;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lwv9;


# static fields
.field public static final e:J


# instance fields
.field public final a:Lwv9;

.field public final b:J

.field public volatile c:Luv9;

.field public final d:Lpfe;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Lpn7;->b:Lon7;

    const/4 v0, 0x5

    sget-object v1, Lun7;->f:Lun7;

    invoke-static {v0, v1}, Lcs5;->x0(ILun7;)J

    move-result-wide v0

    sput-wide v0, Lu74;->e:J

    return-void
.end method

.method public constructor <init>(Lwv9;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu74;->a:Lwv9;

    sget-wide v0, Lu74;->e:J

    iput-wide v0, p0, Lu74;->b:J

    new-instance p1, Lpfe;

    invoke-direct {p1}, Lpfe;-><init>()V

    iput-object p1, p0, Lu74;->d:Lpfe;

    return-void
.end method


# virtual methods
.method public final f(Lnt5;)Ljava/lang/Object;
    .registers 7

    instance-of v0, p1, Lt74;

    if-eqz v0, :cond_13

    move-object v0, p1

    check-cast v0, Lt74;

    iget v1, v0, Lt74;->v:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lt74;->v:I

    goto :goto_18

    :cond_13
    new-instance v0, Lt74;

    invoke-direct {v0, p0, p1}, Lt74;-><init>(Lu74;Lnt5;)V

    :goto_18
    iget-object p1, v0, Lt74;->t:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lt74;->v:I

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

    new-instance p1, Ldj2;

    invoke-direct {p1, v4, v3, p0}, Ldj2;-><init>(BLmt5;Ljava/lang/Object;)V

    iput v4, v0, Lt74;->v:I

    invoke-static {p1, v0}, Lzch;->A(Lkotlin/jvm/functions/Function1;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_43

    return-object v1

    :cond_43
    return-object p0
.end method

.method public final g(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;)Ljava/lang/Object;
    .registers 3

    iget-object p0, p0, Lu74;->a:Lwv9;

    invoke-interface {p0, p1, p2}, Lwv9;->g(Lcom/opera/android/weather/ui/WeatherWidgetActivity;Lmt5;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
