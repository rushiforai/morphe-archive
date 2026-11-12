.class public final Lrwc;
.super Lba2;
.source "SourceFile"


# virtual methods
.method public final d(ILjava/util/ArrayList;)V
    .registers 3

    return-void
.end method

.method public final k(Landroid/view/ViewGroup;I)Lab2;
    .registers 4

    const p0, 0x7f0d024b

    if-ne p2, p0, :cond_10

    new-instance p0, Lqwc;

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, Lqwc;-><init>(Landroid/view/View;)V

    return-object p0

    :cond_10
    const/4 p0, 0x0

    return-object p0
.end method

.method public final q(Lja2;ILca2;)I
    .registers 4

    instance-of p0, p1, Lpwc;

    if-eqz p0, :cond_8

    const p0, 0x7f0d024b

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method
