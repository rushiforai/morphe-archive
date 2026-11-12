.class public final Lzkp;
.super Lnt5;
.source "SourceFile"


# instance fields
.field public t:Ljava/io/File;

.field public synthetic u:Ljava/lang/Object;

.field public v:I


# virtual methods
.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    iput-object p1, p0, Lzkp;->u:Ljava/lang/Object;

    iget p1, p0, Lzkp;->v:I

    const/high16 v0, -0x80000000

    or-int/2addr p1, v0

    iput p1, p0, Lzkp;->v:I

    const/4 p1, 0x0

    invoke-static {p1, p0}, Lelp;->b(Ljava/io/File;Lnt5;)Ljava/lang/Object;

    move-result-object p0

    sget-object p1, Lpx5;->a:Lpx5;

    if-ne p0, p1, :cond_13

    return-object p0

    :cond_13
    new-instance p1, Lt0i;

    invoke-direct {p1, p0}, Lt0i;-><init>(Ljava/lang/Object;)V

    return-object p1
.end method
