.class public final Ll/j7s0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vhu0;


# instance fields
.field public final a:Ll/bou0;

.field public final b:Ll/bou0;

.field public final c:Ll/bou0;

.field public final d:Ll/bou0;

.field public final e:Ll/bou0;

.field public final f:Ll/bou0;


# direct methods
.method public constructor <init>(Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;Ll/bou0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/j7s0;->a:Ll/bou0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/j7s0;->b:Ll/bou0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/j7s0;->c:Ll/bou0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/j7s0;->d:Ll/bou0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/j7s0;->e:Ll/bou0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/j7s0;->f:Ll/bou0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final bridge synthetic zza()Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/j7s0;->a:Ll/bou0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    move-object v2, v0

    .line 8
    check-cast v2, Landroid/app/Application;

    .line 9
    .line 10
    iget-object v0, p0, Ll/j7s0;->b:Ll/bou0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v3, v0

    .line 17
    check-cast v3, Ll/hcr0;

    .line 18
    .line 19
    iget-object v0, p0, Ll/j7s0;->c:Ll/bou0;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v4, v0

    .line 26
    check-cast v4, Ll/bxs0;

    .line 27
    .line 28
    iget-object v0, p0, Ll/j7s0;->d:Ll/bou0;

    .line 29
    .line 30
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v5, v0

    .line 35
    check-cast v5, Ll/tqr0;

    .line 36
    .line 37
    iget-object v0, p0, Ll/j7s0;->e:Ll/bou0;

    .line 38
    .line 39
    invoke-interface {v0}, Ll/bou0;->zza()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    move-object v6, v0

    .line 44
    check-cast v6, Ll/eos0;

    .line 45
    .line 46
    iget-object v7, p0, Ll/j7s0;->f:Ll/bou0;

    .line 47
    .line 48
    new-instance v1, Ll/e6s0;

    .line 49
    .line 50
    invoke-direct/range {v1 .. v7}, Ll/e6s0;-><init>(Landroid/app/Application;Ll/hcr0;Ll/bxs0;Ll/tqr0;Ll/eos0;Ll/bou0;)V

    .line 51
    .line 52
    .line 53
    return-object v1
.end method
