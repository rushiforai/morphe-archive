.class public final Ll/ipt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/oiu0;


# instance fields
.field public final a:Ll/ont0;

.field public b:Ll/c4w0;

.field public c:Ll/z2w0;

.field public d:Ll/ndu0;

.field public e:Ll/s5u0;

.field public f:Ll/ujv0;


# direct methods
.method public synthetic constructor <init>(Ll/ont0;Ll/hpt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ipt0;->a:Ll/ont0;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final synthetic i(Ll/ndu0;)Ll/oiu0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ipt0;->d:Ll/ndu0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic j(Ll/c4w0;)Ll/o5u0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ipt0;->b:Ll/c4w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic k(Ll/z2w0;)Ll/o5u0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ipt0;->c:Ll/z2w0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic m(Ll/ujv0;)Ll/oiu0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ipt0;->f:Ll/ujv0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic n(Ll/s5u0;)Ll/oiu0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ipt0;->e:Ll/s5u0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzf()Ll/piu0;
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/ipt0;->d:Ll/ndu0;

    .line 4
    .line 5
    const-class v2, Ll/ndu0;

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, v0, Ll/ipt0;->e:Ll/s5u0;

    .line 11
    .line 12
    const-class v2, Ll/s5u0;

    .line 13
    .line 14
    invoke-static {v1, v2}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 15
    .line 16
    .line 17
    iget-object v1, v0, Ll/ipt0;->f:Ll/ujv0;

    .line 18
    .line 19
    const-class v2, Ll/ujv0;

    .line 20
    .line 21
    invoke-static {v1, v2}, Ll/cqx0;->c(Ljava/lang/Object;Ljava/lang/Class;)V

    .line 22
    .line 23
    .line 24
    new-instance v3, Ll/kpt0;

    .line 25
    .line 26
    new-instance v5, Ll/b1u0;

    .line 27
    .line 28
    invoke-direct {v5}, Ll/b1u0;-><init>()V

    .line 29
    .line 30
    .line 31
    new-instance v6, Ll/z8w0;

    .line 32
    .line 33
    invoke-direct {v6}, Ll/z8w0;-><init>()V

    .line 34
    .line 35
    .line 36
    new-instance v7, Ll/n3u0;

    .line 37
    .line 38
    invoke-direct {v7}, Ll/n3u0;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v8, Ll/lxu0;

    .line 42
    .line 43
    invoke-direct {v8}, Ll/lxu0;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object v9, v0, Ll/ipt0;->d:Ll/ndu0;

    .line 47
    .line 48
    iget-object v10, v0, Ll/ipt0;->e:Ll/s5u0;

    .line 49
    .line 50
    invoke-static {}, Ll/ohv0;->a()Ll/mhv0;

    .line 51
    .line 52
    .line 53
    move-result-object v11

    .line 54
    iget-object v12, v0, Ll/ipt0;->f:Ll/ujv0;

    .line 55
    .line 56
    iget-object v14, v0, Ll/ipt0;->b:Ll/c4w0;

    .line 57
    .line 58
    iget-object v15, v0, Ll/ipt0;->c:Ll/z2w0;

    .line 59
    .line 60
    iget-object v4, v0, Ll/ipt0;->a:Ll/ont0;

    .line 61
    .line 62
    const/4 v13, 0x0

    .line 63
    const/16 v16, 0x0

    .line 64
    .line 65
    invoke-direct/range {v3 .. v16}, Ll/kpt0;-><init>(Ll/ont0;Ll/b1u0;Ll/z8w0;Ll/n3u0;Ll/lxu0;Ll/ndu0;Ll/s5u0;Ll/mhv0;Ll/ujv0;Ll/b7w0;Ll/c4w0;Ll/z2w0;Ll/jpt0;)V

    .line 66
    .line 67
    .line 68
    return-object v3
.end method

.method public final bridge synthetic zzh()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ipt0;->zzf()Ll/piu0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
