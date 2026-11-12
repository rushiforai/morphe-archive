.class public final Lbe0;
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

    sput-object v0, Lbe0;->f:[Lef0;

    sget-object v0, Ldf0;->d:Ldf0;

    filled-new-array {v0, v0}, [Ldf0;

    move-result-object v0

    sput-object v0, Lbe0;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lbe0;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lbe0;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 5

    check-cast p1, Lbe0;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lce0;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lce0;

    if-eqz v1, :cond_13

    if-eqz v2, :cond_14

    :cond_13
    move-object v1, v2

    :cond_14
    const/4 v2, 0x1

    if-eqz v1, :cond_1a

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1a
    invoke-virtual {p1, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, v2}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    if-eqz p1, :cond_2a

    if-eqz v0, :cond_2b

    :cond_2a
    move-object p1, v0

    :cond_2b
    if-eqz p1, :cond_30

    invoke-virtual {p0, v2, v2, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_30
    return-object p0
.end method
