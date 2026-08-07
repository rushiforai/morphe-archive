.class public final Ll/u8v0;
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

.field public final g:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/u8v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/u8v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/u8v0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/u8v0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/u8v0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/u8v0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/u8v0;->g:Ll/kqx0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/u8v0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    iget-object v0, p0, Ll/u8v0;->b:Ll/kqx0;

    .line 10
    .line 11
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    move-object v3, v0

    .line 16
    check-cast v3, Ll/f8w0;

    .line 17
    .line 18
    iget-object v0, p0, Ll/u8v0;->c:Ll/kqx0;

    .line 19
    .line 20
    check-cast v0, Ll/l0u0;

    .line 21
    .line 22
    invoke-virtual {v0}, Ll/l0u0;->a()Ll/b7w0;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    iget-object v0, p0, Ll/u8v0;->d:Ll/kqx0;

    .line 27
    .line 28
    check-cast v0, Ll/b0u0;

    .line 29
    .line 30
    invoke-virtual {v0}, Ll/b0u0;->a()Ll/q6w0;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    iget-object v0, p0, Ll/u8v0;->e:Ll/kqx0;

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
    check-cast v6, Ll/fbv0;

    .line 42
    .line 43
    iget-object v0, p0, Ll/u8v0;->f:Ll/kqx0;

    .line 44
    .line 45
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    move-object v7, v0

    .line 50
    check-cast v7, Ll/vcw0;

    .line 51
    .line 52
    iget-object p0, p0, Ll/u8v0;->g:Ll/kqx0;

    .line 53
    .line 54
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    move-object v8, p0

    .line 59
    check-cast v8, Ljava/lang/String;

    .line 60
    .line 61
    new-instance v1, Ll/t8v0;

    .line 62
    .line 63
    invoke-direct/range {v1 .. v8}, Ll/t8v0;-><init>(Landroid/content/Context;Ll/f8w0;Ll/b7w0;Ll/q6w0;Ll/fbv0;Ll/vcw0;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-object v1
.end method
