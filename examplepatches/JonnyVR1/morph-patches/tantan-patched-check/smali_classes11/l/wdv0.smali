.class public final Ll/wdv0;
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
    iput-object p1, p0, Ll/wdv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wdv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/wdv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/wdv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/wdv0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/wdv0;->f:Ll/kqx0;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a()Ll/vdv0;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/wdv0;->a:Ll/kqx0;

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
    check-cast v2, Ll/zxt0;

    .line 9
    .line 10
    iget-object v0, p0, Ll/wdv0;->b:Ll/kqx0;

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
    check-cast v3, Landroid/content/Context;

    .line 18
    .line 19
    iget-object v0, p0, Ll/wdv0;->c:Ll/kqx0;

    .line 20
    .line 21
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v4, v0

    .line 26
    check-cast v4, Ljava/util/concurrent/Executor;

    .line 27
    .line 28
    iget-object v0, p0, Ll/wdv0;->d:Ll/kqx0;

    .line 29
    .line 30
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    move-object v5, v0

    .line 35
    check-cast v5, Ll/ltu0;

    .line 36
    .line 37
    iget-object v0, p0, Ll/wdv0;->e:Ll/kqx0;

    .line 38
    .line 39
    check-cast v0, Ll/z5u0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/z5u0;->a()Ll/o7w0;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    iget-object p0, p0, Ll/wdv0;->f:Ll/kqx0;

    .line 46
    .line 47
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    move-object v7, p0

    .line 52
    check-cast v7, Ll/eow0;

    .line 53
    .line 54
    new-instance v1, Ll/vdv0;

    .line 55
    .line 56
    invoke-direct/range {v1 .. v7}, Ll/vdv0;-><init>(Ll/zxt0;Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/ltu0;Ll/o7w0;Ll/eow0;)V

    .line 57
    .line 58
    .line 59
    return-object v1
.end method

.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wdv0;->a()Ll/vdv0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
