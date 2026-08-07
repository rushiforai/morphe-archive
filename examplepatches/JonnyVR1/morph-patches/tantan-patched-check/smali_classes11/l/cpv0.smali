.class public final Ll/cpv0;
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

.field public final h:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cpv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cpv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/cpv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/cpv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/cpv0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/cpv0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/cpv0;->g:Ll/kqx0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/cpv0;->h:Ll/kqx0;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/cpv0;->a:Ll/kqx0;

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
    iget-object v0, p0, Ll/cpv0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v0, Ll/x5u0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/x5u0;->a()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    iget-object v0, p0, Ll/cpv0;->c:Ll/kqx0;

    .line 18
    .line 19
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    move-object v4, v0

    .line 24
    check-cast v4, Ljava/lang/String;

    .line 25
    .line 26
    iget-object v0, p0, Ll/cpv0;->d:Ll/kqx0;

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
    check-cast v5, Ll/t1u0;

    .line 34
    .line 35
    iget-object v0, p0, Ll/cpv0;->e:Ll/kqx0;

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
    check-cast v6, Ll/b9w0;

    .line 43
    .line 44
    iget-object v0, p0, Ll/cpv0;->f:Ll/kqx0;

    .line 45
    .line 46
    check-cast v0, Ll/z5u0;

    .line 47
    .line 48
    invoke-virtual {v0}, Ll/z5u0;->a()Ll/o7w0;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    iget-object v0, p0, Ll/cpv0;->g:Ll/kqx0;

    .line 53
    .line 54
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    move-object v8, v0

    .line 59
    check-cast v8, Ll/swu0;

    .line 60
    .line 61
    iget-object p0, p0, Ll/cpv0;->h:Ll/kqx0;

    .line 62
    .line 63
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    move-object v9, p0

    .line 68
    check-cast v9, Ll/g2u0;

    .line 69
    .line 70
    new-instance v1, Ll/bpv0;

    .line 71
    .line 72
    invoke-direct/range {v1 .. v9}, Ll/bpv0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ll/t1u0;Ll/b9w0;Ll/o7w0;Ll/swu0;Ll/g2u0;)V

    .line 73
    .line 74
    .line 75
    return-object v1
.end method
