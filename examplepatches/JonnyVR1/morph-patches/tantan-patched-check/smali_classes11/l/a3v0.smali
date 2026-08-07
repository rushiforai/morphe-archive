.class public final Ll/a3v0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/a3v0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/a3v0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/a3v0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/a3v0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/v2s0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/a3v0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast p0, Ll/jlt0;

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 18
    .line 19
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    new-instance v2, Ll/x2v0;

    .line 23
    .line 24
    invoke-direct {v2, v0, p0}, Ll/x2v0;-><init>(Ll/v2s0;Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    invoke-interface {v1, v2}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    return-object p0
.end method
