.class public final Ll/tbv0;
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
    iput-object p1, p0, Ll/tbv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tbv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/tbv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/tbv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/tbv0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/tbv0;->a:Ll/kqx0;

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
    iget-object v0, p0, Ll/tbv0;->b:Ll/kqx0;

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
    check-cast v3, Ll/fbv0;

    .line 17
    .line 18
    iget-object v0, p0, Ll/tbv0;->c:Ll/kqx0;

    .line 19
    .line 20
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    move-object v4, v0

    .line 25
    check-cast v4, Ll/hct0;

    .line 26
    .line 27
    iget-object v0, p0, Ll/tbv0;->d:Ll/kqx0;

    .line 28
    .line 29
    invoke-interface {v0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    move-object v5, v0

    .line 34
    check-cast v5, Ll/xwu0;

    .line 35
    .line 36
    iget-object p0, p0, Ll/tbv0;->e:Ll/kqx0;

    .line 37
    .line 38
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    move-object v6, p0

    .line 43
    check-cast v6, Ll/vcw0;

    .line 44
    .line 45
    new-instance v1, Ll/qbv0;

    .line 46
    .line 47
    invoke-direct/range {v1 .. v6}, Ll/qbv0;-><init>(Landroid/content/Context;Ll/fbv0;Ll/hct0;Ll/xwu0;Ll/vcw0;)V

    .line 48
    .line 49
    .line 50
    return-object v1
.end method
