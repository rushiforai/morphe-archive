.class public Ll/u6k;
.super Ll/fmj;
.source "SourceFile"


# instance fields
.field public final a:Landroid/location/Geocoder;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/fmj;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/location/Geocoder;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Landroid/location/Geocoder;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/u6k;->a:Landroid/location/Geocoder;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f(Ll/u6k;DD)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/u6k;->h(DD)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic g(DDLjava/util/List;)Ll/j6k;
    .locals 7

    .line 1
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/j6k;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p4

    .line 14
    move-object v6, p4

    .line 15
    check-cast v6, Landroid/location/Address;

    .line 16
    .line 17
    move-wide v2, p0

    .line 18
    move-wide v4, p2

    .line 19
    invoke-direct/range {v1 .. v6}, Ll/j6k;-><init>(DDLandroid/location/Address;)V

    .line 20
    .line 21
    .line 22
    return-object v1

    .line 23
    :cond_0
    move-wide v2, p0

    .line 24
    move-wide v4, p2

    .line 25
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const-string p1, "Failed to found any address from(%s,%s)"

    .line 38
    .line 39
    invoke-static {p1, p0}, Ll/gzi0;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    const/4 p0, 0x0

    .line 43
    return-object p0
.end method


# virtual methods
.method public d(DD)Lrx/c;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(DD)",
            "Lrx/c<",
            "Ll/z80;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/s6k;

    .line 6
    .line 7
    move-object v2, p0

    .line 8
    move-wide v3, p1

    .line 9
    move-wide v5, p3

    .line 10
    invoke-direct/range {v1 .. v6}, Ll/s6k;-><init>(Ll/u6k;DD)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance p1, Ll/t6k;

    .line 18
    .line 19
    invoke-direct {p1, v3, v4, v5, v6}, Ll/t6k;-><init>(DD)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public final synthetic h(DD)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/u6k;->a:Landroid/location/Geocoder;

    .line 2
    .line 3
    const/4 v5, 0x1

    .line 4
    move-wide v1, p1

    .line 5
    move-wide v3, p3

    .line 6
    invoke-virtual/range {v0 .. v5}, Landroid/location/Geocoder;->getFromLocation(DDI)Ljava/util/List;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
