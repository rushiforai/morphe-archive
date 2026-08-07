.class public final Ll/h3u0;
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
    iput-object p1, p0, Ll/h3u0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/h3u0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/h3u0;->c:Ll/kqx0;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h3u0;->a:Ll/kqx0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/bwu0;

    .line 8
    .line 9
    sget-object v1, Ll/oct0;->a:Ll/xvw0;

    .line 10
    .line 11
    invoke-static {v1}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/h3u0;->c:Ll/kqx0;

    .line 15
    .line 16
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Ll/t8v0;

    .line 21
    .line 22
    sget-object v2, Ll/sgs0;->z8:Ll/dgs0;

    .line 23
    .line 24
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    const/4 v3, 0x1

    .line 39
    if-eq v3, v2, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move-object v0, p0

    .line 43
    :goto_0
    new-instance p0, Ll/yfu0;

    .line 44
    .line 45
    invoke-direct {p0, v0, v1}, Ll/yfu0;-><init>(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 46
    .line 47
    .line 48
    return-object p0
.end method
