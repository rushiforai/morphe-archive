.class public final Ll/hnv0;
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
    iput-object p1, p0, Ll/hnv0;->a:Ll/kqx0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hnv0;->b:Ll/kqx0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/hnv0;->c:Ll/kqx0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/hnv0;->d:Ll/kqx0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/hnv0;->e:Ll/kqx0;

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final bridge synthetic zzb()Ljava/lang/Object;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/hnv0;->a:Ll/kqx0;

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
    check-cast v2, Ll/xvw0;

    .line 9
    .line 10
    sget-object v3, Ll/oct0;->a:Ll/xvw0;

    .line 11
    .line 12
    invoke-static {v3}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/hnv0;->c:Ll/kqx0;

    .line 16
    .line 17
    check-cast v0, Ll/jlt0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/jlt0;->a()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    iget-object v0, p0, Ll/hnv0;->d:Ll/kqx0;

    .line 24
    .line 25
    check-cast v0, Ll/z5u0;

    .line 26
    .line 27
    invoke-virtual {v0}, Ll/z5u0;->a()Ll/o7w0;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    iget-object p0, p0, Ll/hnv0;->e:Ll/kqx0;

    .line 32
    .line 33
    check-cast p0, Ll/swt0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/swt0;->a()Landroid/view/ViewGroup;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    new-instance v1, Ll/fnv0;

    .line 40
    .line 41
    invoke-direct/range {v1 .. v6}, Ll/fnv0;-><init>(Ll/xvw0;Ll/xvw0;Landroid/content/Context;Ll/o7w0;Landroid/view/ViewGroup;)V

    .line 42
    .line 43
    .line 44
    return-object v1
.end method
