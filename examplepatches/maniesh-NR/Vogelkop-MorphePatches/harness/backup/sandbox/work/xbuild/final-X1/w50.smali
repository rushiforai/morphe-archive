.class public final Lw50;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Lef0;->b:Lef0;

    filled-new-array {v0}, [Lef0;

    move-result-object v0

    sput-object v0, Lw50;->f:[Lef0;

    sget-object v0, Ldf0;->d:Ldf0;

    filled-new-array {v0}, [Ldf0;

    move-result-object v0

    sput-object v0, Lw50;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lw50;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lw50;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 4

    check-cast p1, Lw50;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    if-eqz p1, :cond_13

    if-eqz v1, :cond_14

    :cond_13
    move-object p1, v1

    :cond_14
    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_1c

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1c
    return-object p0
.end method
