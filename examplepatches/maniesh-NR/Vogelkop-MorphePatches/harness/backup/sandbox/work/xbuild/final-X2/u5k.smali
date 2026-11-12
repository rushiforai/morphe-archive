.class public abstract Lu5k;
.super Lba2;
.source "SourceFile"


# instance fields
.field public final b:Lijc;


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lijc;Le6k;)V
    .registers 4

    invoke-direct {p0, p1}, Lba2;-><init>(Ljava/lang/Class;)V

    iput-object p2, p0, Lu5k;->b:Lijc;

    new-instance p0, Lpde;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lekc;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final A()V
    .registers 1

    iget-object p0, p0, Lu5k;->b:Lijc;

    invoke-virtual {p0}, Lijc;->h()V

    return-void
.end method

.method public final a()V
    .registers 1

    invoke-virtual {p0}, Lu5k;->A()V

    return-void
.end method

.method public final d(ILjava/util/ArrayList;)V
    .registers 3

    invoke-virtual {p0}, Lu5k;->A()V

    return-void
.end method

.method public final o(Z)V
    .registers 2

    invoke-virtual {p0}, Lu5k;->A()V

    return-void
.end method

.method public t()Lja2;
    .registers 2

    new-instance p0, Lqs8;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lia2;-><init>(B)V

    return-object p0
.end method

.method public abstract u()Lk6k;
.end method

.method public w()Z
    .registers 1

    invoke-virtual {p0}, Lu5k;->z()Z

    move-result p0

    return p0
.end method

.method public y(Lja2;)Z
    .registers 2

    instance-of p0, p0, Lncd;

    return p0
.end method

.method public z()Z
    .registers 1

    const/4 p0, 0x0

    throw p0
.end method
