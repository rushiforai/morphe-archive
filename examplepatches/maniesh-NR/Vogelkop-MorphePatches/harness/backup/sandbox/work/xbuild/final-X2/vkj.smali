.class public final Lvkj;
.super Lhq8;
.source "SourceFile"


# instance fields
.field public final e:Lukj;


# direct methods
.method public constructor <init>(Lhq8;)V
    .registers 3

    invoke-direct {p0}, Lhq8;-><init>()V

    new-instance v0, Lukj;

    invoke-direct {v0, p1}, Lukj;-><init>(Lhq8;)V

    iput-object v0, p0, Lvkj;->e:Lukj;

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lvkj;->e:Lukj;

    iget-object p0, p0, Lukj;->b:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final e()J
    .registers 3

    iget-object p0, p0, Lvkj;->e:Lukj;

    iget-wide v0, p0, Lukj;->a:J

    return-wide v0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lvkj;->e:Lukj;

    iget-object p0, p0, Lukj;->f:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lvkj;->e:Lukj;

    iget-object p0, p0, Lukj;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0
.end method

.method public final i(Lp6l;)Ljava/lang/String;
    .registers 3

    sget-object v0, Lp6l;->b:Lp6l;

    iget-object p0, p0, Lvkj;->e:Lukj;

    if-ne p1, v0, :cond_b

    iget-object p0, p0, Lukj;->e:Ljava/lang/Object;

    :goto_8
    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_b
    iget-object p0, p0, Lukj;->d:Ljava/lang/Object;

    goto :goto_8
.end method

.method public final q(Ljava/lang/String;)V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method
