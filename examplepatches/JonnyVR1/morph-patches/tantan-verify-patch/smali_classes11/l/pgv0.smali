.class public final Ll/pgv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;

.field public final e:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/pgv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/pgv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/pgv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/pgv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/pgv0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/pgv0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Ll/dlt0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/pgv0;->b:Ll/kqx0;

    .line 11
    .line 12
    check-cast v0, Ll/a6u0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/a6u0;->a()Ll/q5u0;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    iget-object v0, p0, Ll/pgv0;->c:Ll/kqx0;

    .line 19
    .line 20
    check-cast v0, Ll/neu0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/neu0;->a()Ll/ndu0;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget-object v0, p0, Ll/pgv0;->d:Ll/kqx0;

    .line 27
    .line 28
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    move-object v5, v0

    .line 33
    check-cast v5, Ll/ehv0;

    .line 34
    .line 35
    iget-object p0, p0, Ll/pgv0;->e:Ll/kqx0;

    .line 36
    .line 37
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    move-object v6, p0

    .line 42
    check-cast v6, Ll/tcv0;

    .line 43
    .line 44
    new-instance v1, Ll/ogv0;

    .line 45
    .line 46
    invoke-direct/range {v1 .. v6}, Ll/ogv0;-><init>(Ll/dlt0;Ll/q5u0;Ll/ndu0;Ll/ehv0;Ll/tcv0;)V

    .line 47
    .line 48
    .line 49
    return-object v1
.end method
