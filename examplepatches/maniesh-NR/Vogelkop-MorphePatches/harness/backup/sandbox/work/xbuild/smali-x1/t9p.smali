.class public final Lt9p;
.super Lbap;
.source "SourceFile"


# direct methods
.method public constructor <init>(ZZZ)V
    .registers 10

    const/4 v2, 0x1

    const/16 v1, 0x8

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lbap;-><init>(IZZZZ)V

    return-void
.end method


# virtual methods
.method public final a()Ln9p;
    .registers 4

    new-instance v0, Ln9p;

    iget-boolean v1, p0, Lbap;->d:Z

    iget-boolean v2, p0, Lbap;->b:Z

    iget-boolean p0, p0, Lbap;->e:Z

    invoke-direct {v0, v1, v2, p0}, Ln9p;-><init>(ZZZ)V

    return-object v0
.end method

.method public final b(Lk48;Lu6p;)Lbap;
    .registers 9

    invoke-virtual {p1, p0}, Lk48;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lu9p;

    iget-boolean v3, p0, Lbap;->d:Z

    iget-boolean v4, p0, Lbap;->b:Z

    iget-boolean v5, p0, Lbap;->e:Z

    const/4 v2, 0x1

    const/16 v1, 0x8

    invoke-direct/range {v0 .. v5}, Lbap;-><init>(IZZZZ)V

    iput-object p2, v0, Lu9p;->f:Lu6p;

    return-object v0
.end method

.method public final c(Lkotlin/jvm/functions/Function1;)Lbap;
    .registers 2

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbap;

    if-nez p0, :cond_d

    new-instance p0, Lj9p;

    invoke-direct {p0}, Lj9p;-><init>()V

    :cond_d
    return-object p0
.end method
