.class public final Ll/a8w0;
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
    iput-object p1, p0, Ll/a8w0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/a8w0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/a8w0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/a8w0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/a8w0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/a8w0;->f:Ll/kqx0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/a8w0;->a:Ll/kqx0;

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
    check-cast v2, Ll/fbv0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/a8w0;->b:Ll/kqx0;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    move-object v3, v0

    .line 17
    check-cast v3, Ll/yew0;

    .line 18
    .line 19
    iget-object v0, p0, Ll/a8w0;->c:Ll/kqx0;

    .line 20
    .line 21
    check-cast v0, Ll/b0u0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/b0u0;->a()Ll/q6w0;

    .line 24
    .line 25
    .line 26
    move-result-object v4

    .line 27
    iget-object v0, p0, Ll/a8w0;->d:Ll/kqx0;

    .line 28
    .line 29
    check-cast v0, Ll/k0u0;

    .line 30
    .line 31
    invoke-virtual {v0}, Ll/k0u0;->a()Ll/t6w0;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    iget-object v0, p0, Ll/a8w0;->e:Ll/kqx0;

    .line 36
    .line 37
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    move-object v6, v0

    .line 42
    check-cast v6, Ll/dut0;

    .line 43
    .line 44
    iget-object p0, p0, Ll/a8w0;->f:Ll/kqx0;

    .line 45
    .line 46
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    move-object v7, p0

    .line 51
    check-cast v7, Ll/cew0;

    .line 52
    .line 53
    new-instance v1, Ll/z7w0;

    .line 54
    .line 55
    invoke-direct/range {v1 .. v7}, Ll/z7w0;-><init>(Ll/fbv0;Ll/yew0;Ll/q6w0;Ll/t6w0;Ll/dut0;Ll/cew0;)V

    .line 56
    .line 57
    .line 58
    return-object v1
.end method
