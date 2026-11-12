.class public Lpue;
.super Lj82;
.source "SourceFile"


# direct methods
.method public static e(Loqe;Ljava/lang/String;Z)Lpue;
    .registers 4

    instance-of v0, p0, Lere;

    if-eqz v0, :cond_e

    new-instance p2, Lfve;

    check-cast p0, Lere;

    iget-object v0, p0, Lere;->f:Ljava/util/List;

    invoke-direct {p2, p0, v0, p1}, Lfve;-><init>(Loqe;Ljava/util/List;Ljava/lang/String;)V

    return-object p2

    :cond_e
    new-instance v0, Lpue;

    invoke-direct {v0, p0, p1, p2}, Lj82;-><init>(Loqe;Ljava/lang/String;Z)V

    return-object v0
.end method
