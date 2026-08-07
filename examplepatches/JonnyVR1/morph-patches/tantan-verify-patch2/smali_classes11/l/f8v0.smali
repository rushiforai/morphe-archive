.class public final Ll/f8v0;
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
    iput-object p1, p0, Ll/f8v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/f8v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/f8v0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/f8v0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/f8v0;->e:Ll/kqx0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/f8v0;->f:Ll/kqx0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/f8v0;->g:Ll/kqx0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final synthetic zzb()Ljava/lang/Object;
    .locals 9

    .line 1
    iget-object v0, p0, Ll/f8v0;->a:Ll/kqx0;

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
    iget-object v0, p0, Ll/f8v0;->c:Ll/kqx0;

    .line 10
    .line 11
    iget-object v1, p0, Ll/f8v0;->b:Ll/kqx0;

    .line 12
    .line 13
    invoke-interface {v1}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    new-instance v5, Ll/o8v0;

    .line 22
    .line 23
    invoke-direct {v5}, Ll/o8v0;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/f8v0;->e:Ll/kqx0;

    .line 27
    .line 28
    check-cast p0, Ll/s8v0;

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/s8v0;->a()Ll/r8v0;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    sget-object v7, Ll/oct0;->a:Ll/xvw0;

    .line 35
    .line 36
    invoke-static {v7}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    new-instance v8, Ll/b5t0;

    .line 40
    .line 41
    invoke-direct {v8}, Ll/b5t0;-><init>()V

    .line 42
    .line 43
    .line 44
    new-instance v1, Ll/e8v0;

    .line 45
    .line 46
    invoke-direct/range {v1 .. v8}, Ll/e8v0;-><init>(Landroid/content/Context;Ll/vwv0;Ll/twv0;Ll/o8v0;Ll/r8v0;Ll/xvw0;Ll/b5t0;)V

    .line 47
    .line 48
    .line 49
    return-object v1
.end method
