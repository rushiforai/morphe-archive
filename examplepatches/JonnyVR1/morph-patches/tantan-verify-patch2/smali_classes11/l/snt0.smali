.class public final Ll/snt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yvt0;


# instance fields
.field public final a:Ll/ont0;

.field public b:Ll/c4w0;

.field public c:Ll/z2w0;

.field public d:Ll/ndu0;

.field public e:Ll/s5u0;


# direct methods
.method public synthetic constructor <init>(Ll/ont0;Ll/rnt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/snt0;->a:Ll/ont0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic a(Ll/ndu0;)Ll/yvt0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snt0;->d:Ll/ndu0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic d(Ll/s5u0;)Ll/yvt0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snt0;->e:Ll/s5u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic j(Ll/c4w0;)Ll/o5u0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snt0;->b:Ll/c4w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic k(Ll/z2w0;)Ll/o5u0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/snt0;->c:Ll/z2w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zze()Ll/zvt0;
    .locals 15

    .line 1
    iget-object v0, p0, Ll/snt0;->d:Ll/ndu0;

    .line 2
    .line 3
    const-class v1, Ll/ndu0;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/snt0;->e:Ll/s5u0;

    .line 9
    .line 10
    const-class v1, Ll/s5u0;

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 13
    .line 14
    .line 15
    new-instance v2, Ll/unt0;

    .line 16
    .line 17
    new-instance v4, Ll/b1u0;

    .line 18
    .line 19
    invoke-direct {v4}, Ll/b1u0;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v5, Ll/z8w0;

    .line 23
    .line 24
    invoke-direct {v5}, Ll/z8w0;-><init>()V

    .line 25
    .line 26
    .line 27
    new-instance v6, Ll/n3u0;

    .line 28
    .line 29
    invoke-direct {v6}, Ll/n3u0;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v7, Ll/lxu0;

    .line 33
    .line 34
    invoke-direct {v7}, Ll/lxu0;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v8, p0, Ll/snt0;->d:Ll/ndu0;

    .line 38
    .line 39
    iget-object v9, p0, Ll/snt0;->e:Ll/s5u0;

    .line 40
    .line 41
    invoke-static {}, Ll/ohv0;->a()Ll/mhv0;

    .line 42
    .line 43
    .line 44
    move-result-object v10

    .line 45
    iget-object v12, p0, Ll/snt0;->b:Ll/c4w0;

    .line 46
    .line 47
    iget-object v13, p0, Ll/snt0;->c:Ll/z2w0;

    .line 48
    .line 49
    iget-object v3, p0, Ll/snt0;->a:Ll/ont0;

    .line 50
    .line 51
    const/4 v11, 0x0

    .line 52
    const/4 v14, 0x0

    .line 53
    invoke-direct/range {v2 .. v14}, Ll/unt0;-><init>(Ll/ont0;Ll/b1u0;Ll/z8w0;Ll/n3u0;Ll/lxu0;Ll/ndu0;Ll/s5u0;Ll/mhv0;Ll/b7w0;Ll/c4w0;Ll/z2w0;Ll/tnt0;)V

    .line 54
    .line 55
    .line 56
    return-object v2
.end method

.method public final bridge synthetic zzh()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/snt0;->zze()Ll/zvt0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
