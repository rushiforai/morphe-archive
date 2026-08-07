.class public final Ll/aqx0;
.super Ll/lpx0;
.source "SourceFile"


# direct methods
.method public synthetic constructor <init>(ILl/zpx0;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-direct {p0, p1}, Ll/lpx0;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;Ll/dqx0;)Ll/aqx0;
    .locals 0

    .line 1
    const-string p1, "Network"

    .line 2
    .line 3
    invoke-super {p0, p1, p2}, Ll/lpx0;->a(Ljava/lang/Object;Ll/dqx0;)Ll/lpx0;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final c()Ll/bqx0;
    .locals 2

    .line 1
    new-instance v0, Ll/bqx0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/lpx0;->a:Ljava/util/LinkedHashMap;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-direct {v0, p0, v1}, Ll/bqx0;-><init>(Ljava/util/Map;Ll/zpx0;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method
