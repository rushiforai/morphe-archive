.class public final Ll/bhv0;
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

.field public final f:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bhv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bhv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/bhv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/bhv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/bhv0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/bhv0;->f:Ll/kqx0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/bhv0;->a:Ll/kqx0;

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
    iget-object v0, p0, Ll/bhv0;->b:Ll/kqx0;

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
    iget-object v0, p0, Ll/bhv0;->c:Ll/kqx0;

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
    iget-object v0, p0, Ll/bhv0;->d:Ll/kqx0;

    .line 27
    .line 28
    check-cast v0, Ll/y5u0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/y5u0;->a()Ll/c7w0;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    iget-object v0, p0, Ll/bhv0;->e:Ll/kqx0;

    .line 35
    .line 36
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    move-object v6, v0

    .line 41
    check-cast v6, Ll/ehv0;

    .line 42
    .line 43
    iget-object p0, p0, Ll/bhv0;->f:Ll/kqx0;

    .line 44
    .line 45
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    move-object v7, p0

    .line 50
    check-cast v7, Ll/tcv0;

    .line 51
    .line 52
    new-instance v1, Ll/ahv0;

    .line 53
    .line 54
    invoke-direct/range {v1 .. v7}, Ll/ahv0;-><init>(Ll/dlt0;Ll/q5u0;Ll/ndu0;Ll/c7w0;Ll/ehv0;Ll/tcv0;)V

    .line 55
    .line 56
    .line 57
    return-object v1
.end method
