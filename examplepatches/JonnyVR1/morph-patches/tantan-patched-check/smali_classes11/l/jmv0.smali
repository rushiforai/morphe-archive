.class public final Ll/jmv0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/fmu0;

.field public final b:Ll/wlv0;

.field public final c:Ll/s6u0;


# direct methods
.method public constructor <init>(Ll/fmu0;Ll/vcw0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jmv0;->a:Ll/fmu0;

    .line 5
    .line 6
    new-instance v0, Ll/wlv0;

    .line 7
    .line 8
    invoke-direct {v0, p2}, Ll/wlv0;-><init>(Ll/vcw0;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/jmv0;->b:Ll/wlv0;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/fmu0;->g()Ll/xss0;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    new-instance p2, Ll/imv0;

    .line 18
    .line 19
    invoke-direct {p2, v0, p1}, Ll/imv0;-><init>(Ll/wlv0;Ll/xss0;)V

    .line 20
    .line 21
    .line 22
    iput-object p2, p0, Ll/jmv0;->c:Ll/s6u0;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a()Ll/s6u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jmv0;->c:Ll/s6u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final b()Ll/k8u0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jmv0;->b:Ll/wlv0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/lju0;
    .locals 2

    .line 1
    new-instance v0, Ll/lju0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/jmv0;->b:Ll/wlv0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/jmv0;->a:Ll/fmu0;

    .line 6
    .line 7
    invoke-virtual {v1}, Ll/wlv0;->z()Ll/xhs0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-direct {v0, p0, v1}, Ll/lju0;-><init>(Ll/fmu0;Ll/xhs0;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final d()Ll/wlv0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jmv0;->b:Ll/wlv0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e(Ll/xhs0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/jmv0;->b:Ll/wlv0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wlv0;->D(Ll/xhs0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
