.class public final Ll/gxu0;
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
    iput-object p1, p0, Ll/gxu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/gxu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/gxu0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/gxu0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/gxu0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 6

    .line 1
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/gxu0;->b:Ll/kqx0;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    move-object v2, v0

    .line 13
    check-cast v2, Ll/hct0;

    .line 14
    .line 15
    iget-object v0, p0, Ll/gxu0;->c:Ll/kqx0;

    .line 16
    .line 17
    check-cast v0, Ll/idw0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/idw0;->a()Ll/hdw0;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    new-instance v4, Ll/jdw0;

    .line 24
    .line 25
    invoke-direct {v4}, Ll/jdw0;-><init>()V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/gxu0;->e:Ll/kqx0;

    .line 29
    .line 30
    check-cast p0, Ll/jlt0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    new-instance v0, Ll/cxu0;

    .line 37
    .line 38
    invoke-direct/range {v0 .. v5}, Ll/cxu0;-><init>(Ljava/util/concurrent/Executor;Ll/hct0;Ll/hdw0;Ll/jdw0;Landroid/content/Context;)V

    .line 39
    .line 40
    .line 41
    return-object v0
.end method
