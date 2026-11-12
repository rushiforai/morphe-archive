.class public final Le10;
.super Ld10;
.source "SourceFile"


# virtual methods
.method public final u0(Lcie;)Ljava/util/List;
    .registers 4

    iget-object p0, p1, Lcie;->C:Ljava/util/ArrayList;

    if-nez p0, :cond_7

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_7
    new-instance p1, Lo00;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Lo00;-><init>(B)V

    new-instance v0, Lzlb;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v0}, Lnb6;->J(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method
