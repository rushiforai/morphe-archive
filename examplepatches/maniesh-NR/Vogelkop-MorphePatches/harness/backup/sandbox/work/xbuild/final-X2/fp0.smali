.class public final Lfp0;
.super Ljf0;
.source "SourceFile"


# static fields
.field public static final f:[Lef0;

.field public static final g:[Ldf0;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    sget-object v0, Lef0;->b:Lef0;

    filled-new-array {v0, v0, v0, v0}, [Lef0;

    move-result-object v0

    sput-object v0, Lfp0;->f:[Lef0;

    new-instance v0, Ldf0;

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {v1}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v0, v3, v1, v2}, Ldf0;-><init>(ILjava/lang/Object;B)V

    new-instance v1, Ldf0;

    const/4 v2, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v2}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v4

    invoke-direct {v1, v3, v2, v4}, Ldf0;-><init>(ILjava/lang/Object;B)V

    new-instance v4, Ldf0;

    invoke-static {v2}, Ljf0;->c(Ljava/lang/Object;)B

    move-result v5

    invoke-direct {v4, v3, v2, v5}, Ldf0;-><init>(ILjava/lang/Object;B)V

    sget-object v2, Ldf0;->d:Ldf0;

    filled-new-array {v0, v1, v4, v2}, [Ldf0;

    move-result-object v0

    sput-object v0, Lfp0;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lfp0;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lfp0;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 7

    check-cast p1, Lfp0;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Float;

    if-eqz v1, :cond_13

    if-eqz v2, :cond_14

    :cond_13
    move-object v1, v2

    :cond_14
    const/4 v2, -0x1

    if-eqz v1, :cond_1a

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_1a
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    if-eqz v1, :cond_2b

    if-eqz v3, :cond_2c

    :cond_2b
    move-object v1, v3

    :cond_2c
    if-eqz v1, :cond_31

    invoke-virtual {p0, v0, v2, v1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_31
    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    if-eqz v3, :cond_42

    if-eqz v4, :cond_43

    :cond_42
    move-object v3, v4

    :cond_43
    if-eqz v3, :cond_48

    invoke-virtual {p0, v1, v2, v3}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_48
    const/4 v1, 0x3

    invoke-virtual {p1, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lne0;

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lne0;

    if-eqz p1, :cond_59

    if-eqz v2, :cond_5a

    :cond_59
    move-object p1, v2

    :cond_5a
    if-eqz p1, :cond_5f

    invoke-virtual {p0, v1, v0, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_5f
    return-object p0
.end method
