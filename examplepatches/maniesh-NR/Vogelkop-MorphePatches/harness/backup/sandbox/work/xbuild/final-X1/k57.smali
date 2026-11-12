.class public final Lk57;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lyc1;


# direct methods
.method public constructor <init>(Lzin;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lyc1;

    const/16 v0, 0xa

    sget-object v1, Lg08;->a:Lg08;

    invoke-direct {p1, v1, v0}, Lyc1;-><init>(Lf99;B)V

    iput-object p1, p0, Lk57;->a:Lyc1;

    return-void
.end method


# virtual methods
.method public final a(Lj5j;Lnt5;)Ljava/lang/Object;
    .registers 8

    instance-of v0, p2, Lh57;

    if-eqz v0, :cond_13

    move-object v0, p2

    check-cast v0, Lh57;

    iget v1, v0, Lh57;->w:I

    const/high16 v2, -0x80000000

    and-int v3, v1, v2

    if-eqz v3, :cond_13

    sub-int/2addr v1, v2

    iput v1, v0, Lh57;->w:I

    goto :goto_18

    :cond_13
    new-instance v0, Lh57;

    invoke-direct {v0, p0, p2}, Lh57;-><init>(Lk57;Lnt5;)V

    :goto_18
    iget-object p2, v0, Lh57;->u:Ljava/lang/Object;

    sget-object v1, Lpx5;->a:Lpx5;

    iget v2, v0, Lh57;->w:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_30

    if-ne v2, v4, :cond_2a

    iget-object p1, v0, Lh57;->t:Lj5j;

    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    goto :goto_40

    :cond_2a
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-object v3

    :cond_30
    invoke-static {p2}, Lybh;->y(Ljava/lang/Object;)V

    iput-object p1, v0, Lh57;->t:Lj5j;

    iput v4, v0, Lh57;->w:I

    iget-object p0, p0, Lk57;->a:Lyc1;

    invoke-static {p0, v0}, Lcs5;->E(Lf99;Lmt5;)Ljava/lang/Object;

    move-result-object p2

    if-ne p2, v1, :cond_40

    return-object v1

    :cond_40
    :goto_40
    check-cast p2, La6j;

    iget-object p0, p2, La6j;->a:Lg1b;

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_48
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5e

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    move-object v0, p2

    check-cast v0, Lo5j;

    iget-object v0, v0, Lo5j;->a:Lj5j;

    invoke-virtual {v0, p1}, Lj5j;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_48

    goto :goto_5f

    :cond_5e
    move-object p2, v3

    :goto_5f
    instance-of p0, p2, Lo5j;

    if-eqz p0, :cond_66

    check-cast p2, Lo5j;

    goto :goto_67

    :cond_66
    move-object p2, v3

    :goto_67
    if-eqz p2, :cond_6b

    move-object v3, p2

    goto :goto_70

    :cond_6b
    const-string p0, "Required value was null."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    :goto_70
    return-object v3
.end method
