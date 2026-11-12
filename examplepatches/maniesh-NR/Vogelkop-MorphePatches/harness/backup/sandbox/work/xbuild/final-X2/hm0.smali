.class public final Lhm0;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lef0;->b:Lef0;

    filled-new-array {v0, v0}, [Lef0;

    move-result-object v0

    sput-object v0, Lhm0;->f:[Lef0;

    sget-object v0, Ldf0;->d:Ldf0;

    filled-new-array {v0, v0}, [Ldf0;

    move-result-object v0

    sput-object v0, Lhm0;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lhm0;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lhm0;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 5

    check-cast p1, Lhm0;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbp0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbp0;

    invoke-static {v1, v2}, Ljf0;->f(Ljf0;Ljf0;)Ljf0;

    move-result-object v1

    check-cast v1, Lbp0;

    const/4 v2, 0x1

    if-eqz v1, :cond_1b

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1b
    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Le80;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le80;

    if-eqz p1, :cond_2b

    if-eqz v0, :cond_2c

    :cond_2b
    move-object p1, v0

    :cond_2c
    if-eqz p1, :cond_31

    invoke-virtual {p0, v2, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_31
    return-object p0
.end method

.method public final x(Lzpa;)Lbp0;
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbp0;

    if-eqz v1, :cond_a

    return-object v1

    :cond_a
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lbp0;

    const/16 v1, 0x98b

    const/4 v2, 0x3

    const/4 v3, 0x1

    invoke-direct {p1, v1, v3, v2}, Ljf0;-><init>(III)V

    invoke-virtual {p0, v0, v3, p1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbp0;

    return-object p0
.end method
