.class public final Ll/zqu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/upx0;


# instance fields
.field public final a:Ll/kqx0;

.field public final b:Ll/kqx0;

.field public final c:Ll/kqx0;

.field public final d:Ll/kqx0;


# direct methods
.method public constructor <init>(Ll/kqx0;Ll/kqx0;Ll/kqx0;Ll/kqx0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zqu0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zqu0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/zqu0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/zqu0;->d:Ll/kqx0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/zqu0;->a:Ll/kqx0;

    .line 2
    .line 3
    check-cast v0, Ll/jlt0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/zqu0;->b:Ll/kqx0;

    .line 10
    .line 11
    check-cast v1, Ll/nmu0;

    .line 12
    .line 13
    invoke-virtual {v1}, Ll/nmu0;->a()Ll/ulu0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget-object v2, p0, Ll/zqu0;->c:Ll/kqx0;

    .line 18
    .line 19
    check-cast v2, Ll/bnu0;

    .line 20
    .line 21
    invoke-virtual {v2}, Ll/bnu0;->a()Ll/anu0;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object p0, p0, Ll/zqu0;->d:Ll/kqx0;

    .line 26
    .line 27
    invoke-interface {p0}, Ll/kqx0;->zzb()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p0, Ll/ilu0;

    .line 32
    .line 33
    new-instance v3, Ll/yqu0;

    .line 34
    .line 35
    invoke-direct {v3, v0, v1, v2, p0}, Ll/yqu0;-><init>(Landroid/content/Context;Ll/ulu0;Ll/anu0;Ll/ilu0;)V

    .line 36
    .line 37
    .line 38
    return-object v3
.end method
