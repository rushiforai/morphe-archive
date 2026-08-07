.class public final Ll/srs0;
.super Ll/jwr0;
.source "SourceFile"


# instance fields
.field public final m:Ll/tct0;

.field public final n:Ll/cct0;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ll/tct0;)V
    .locals 1

    .line 1
    new-instance p2, Ll/vqs0;

    .line 2
    .line 3
    invoke-direct {p2, p3}, Ll/vqs0;-><init>(Ll/tct0;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-direct {p0, v0, p1, p2}, Ll/jwr0;-><init>(ILjava/lang/String;Ll/nwr0;)V

    .line 8
    .line 9
    .line 10
    iput-object p3, p0, Ll/srs0;->m:Ll/tct0;

    .line 11
    .line 12
    new-instance p2, Ll/cct0;

    .line 13
    .line 14
    const/4 p3, 0x0

    .line 15
    invoke-direct {p2, p3}, Ll/cct0;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iput-object p2, p0, Ll/srs0;->n:Ll/cct0;

    .line 19
    .line 20
    const-string p0, "GET"

    .line 21
    .line 22
    invoke-virtual {p2, p1, p0, p3, p3}, Ll/cct0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;[B)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final j(Ll/vvr0;)Ll/pwr0;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/dxr0;->b(Ll/vvr0;)Ll/kvr0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1, p0}, Ll/pwr0;->b(Ljava/lang/Object;Ll/kvr0;)Ll/pwr0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final bridge synthetic s(Ljava/lang/Object;)V
    .locals 3

    .line 1
    check-cast p1, Ll/vvr0;

    .line 2
    .line 3
    iget-object v0, p1, Ll/vvr0;->c:Ljava/util/Map;

    .line 4
    .line 5
    iget v1, p1, Ll/vvr0;->a:I

    .line 6
    .line 7
    iget-object v2, p0, Ll/srs0;->n:Ll/cct0;

    .line 8
    .line 9
    invoke-virtual {v2, v0, v1}, Ll/cct0;->f(Ljava/util/Map;I)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p1, Ll/vvr0;->b:[B

    .line 13
    .line 14
    invoke-static {}, Ll/cct0;->k()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Ll/srs0;->n:Ll/cct0;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ll/cct0;->h([B)V

    .line 26
    .line 27
    .line 28
    :cond_1
    :goto_0
    iget-object p0, p0, Ll/srs0;->m:Ll/tct0;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Ll/tct0;->b(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    return-void
.end method
