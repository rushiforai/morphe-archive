.class public final Lbg0;
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

    sput-object v0, Lbg0;->f:[Lef0;

    sget-object v0, Ldf0;->d:Ldf0;

    filled-new-array {v0}, [Ldf0;

    move-result-object v0

    sput-object v0, Lbg0;->g:[Ldf0;

    return-void
.end method


# virtual methods
.method public final a(I)Ldf0;
    .registers 2

    sget-object p0, Lbg0;->g:[Ldf0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final b(I)Lef0;
    .registers 2

    sget-object p0, Lbg0;->f:[Lef0;

    aget-object p0, p0, p1

    return-object p0
.end method

.method public final m(Ljf0;)Ljf0;
    .registers 4

    check-cast p1, Lbg0;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    invoke-static {p1, v1}, Ljf0;->l(Ljava/util/Map;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_19

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1, p1}, Ljf0;->q(IILjava/lang/Object;)V

    :cond_19
    return-object p0
.end method

.method public final x()Ljava/util/Map;
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    if-eqz p0, :cond_e

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_e
    const/4 p0, 0x0

    return-object p0
.end method
